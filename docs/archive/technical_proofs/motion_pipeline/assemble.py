"""Assemble and check rendered PNGs + exported GLB. Usage: python assemble.py RUN."""
import json, struct, sys, math
from pathlib import Path
from PIL import Image, ImageDraw, ImageChops
run=Path(sys.argv[1]).resolve()
proof=run/'evidence'; proof.mkdir(exist_ok=False)
report={'sprite':{},'glb':{}}
board=Image.new('RGB',(1024,438),'#172631')
draw=ImageDraw.Draw(board)
for row,name in enumerate(['idle','walk','attack']):
    sheet=Image.new('RGBA',(1024,128))
    boxes=[]; frames=[]
    for i in range(8):
        im=Image.open(run/'frames'/f'{name}_{i:02}.png').convert('RGBA')
        assert im.size==(128,128)
        box=im.getchannel('A').getbbox()
        assert box and min(box[:2])>2 and max(box[2:])<126, (name,i,box)
        boxes.append(box); frames.append(im)
        sheet.paste(im,(i*128,0))
        board.paste(im,(i*128,row*146+18),im)
    assert not (run/f'{name}.png').exists()
    sheet.save(run/f'{name}.png')
    draw.text((8,row*146+2),name,fill='white')
    diffs=[sum(ImageChops.difference(frames[i],frames[(i+1)%8]).convert('RGB').resize((1,1)).getpixel((0,0))) for i in range(8)]
    report['sprite'][name]={'size':[1024,128],'frames':8,'mode':'RGBA','alpha_bbox':boxes,'consecutive_rgb_mean_sum':diffs,'edge_clear':True}
board.save(proof/'sprite_contact.png')
raw=(run/'robot.glb').read_bytes()
magic,version,total=struct.unpack_from('<III',raw)
assert magic==0x46546c67 and version==2 and total==len(raw)
length,kind=struct.unpack_from('<II',raw,12)
g=json.loads(raw[20:20+length])
clips=[]
for a in g.get('animations',[]):
    durations=[g['accessors'][s['input']]['max'][0]-g['accessors'][s['input']]['min'][0] for s in a['samplers']]
    clips.append({'name':a['name'],'duration':max(durations),'channels':len(a['channels'])})
assert {a['name'] for a in clips}=={'idle','walk','attack'}, clips
assert g.get('skins') and len(g['skins'][0]['joints'])>=10
report['glb']={'clips':clips,'skins':len(g['skins']),'joint_count':len(g['skins'][0]['joints'])}
(proof/'asset_checks.json').write_text(json.dumps(report,indent=2))
print(json.dumps({'clips':clips,'sprite_frames':24,'all_frames_have_clear_margin':True},indent=2))
