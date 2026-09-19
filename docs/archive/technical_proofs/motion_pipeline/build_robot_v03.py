"""Blender background generator. -- <new output directory>. Never overwrite a run."""
import bpy, math, sys, json
from pathlib import Path
from mathutils import Vector

out = Path(sys.argv[sys.argv.index('--') + 1]).resolve()
out.mkdir(parents=True, exist_ok=False)
(out / 'frames').mkdir()
bpy.ops.object.select_all(action='SELECT')
bpy.ops.object.delete(use_global=False)
scene = bpy.context.scene
scene.render.engine = 'CYCLES'
scene.cycles.samples = 16
scene.cycles.use_denoising = True
scene.render.resolution_x = scene.render.resolution_y = 128
scene.render.resolution_percentage = 100
scene.render.film_transparent = True
scene.render.image_settings.file_format = 'PNG'
scene.render.image_settings.color_mode = 'RGBA'
scene.render.fps = 24
scene.view_settings.view_transform = 'Standard'
scene.world.color = (0.2, 0.2, 0.2)

def material(name, color, metallic=0):
    m = bpy.data.materials.new(name)
    m.diffuse_color = (*color, 1)
    m.use_nodes = True
    bs = m.node_tree.nodes.get('Principled BSDF')
    bs.inputs['Base Color'].default_value = (*color, 1)
    bs.inputs['Metallic'].default_value = metallic
    bs.inputs['Roughness'].default_value = 0.42
    return m

bodymat = material('Teal enamel', (0.055, .46, .49), .3)
jointmat = material('Dark joints', (.065, .08, .10), .4)
trim = material('Brass', (.85, .43, .12), .5)
eye = material('Eye light', (.65, .95, 1))

rigdata = bpy.data.armatures.new('RobotSkeleton')
rig = bpy.data.objects.new('Robot', rigdata)
scene.collection.objects.link(rig)
bpy.context.view_layer.objects.active = rig
rig.select_set(True)
bpy.ops.object.mode_set(mode='EDIT')
spec = {
    'root': ((0, 0, 0), (0, 0, .2), None),
    'body': ((0, 0, 1.10), (0, 0, 1.73), 'root'),
    'head': ((0, 0, 1.75), (0, 0, 2.03), 'body'),
}
for side, x in [('L', -.25), ('R', .25)]:
    spec['thigh'+side] = ((x, 0, 1.10), (x, 0, .60), 'root')
    spec['shin'+side] = ((x, 0, .60), (x, 0, .10), 'thigh'+side)
    spec['foot'+side] = ((x, 0, .10), (x, -.22, .10), 'shin'+side)
    x = -.49 if side == 'L' else .49
    spec['arm'+side] = ((x, 0, 1.62), (x, 0, 1.24), 'body')
    spec['forearm'+side] = ((x, 0, 1.24), (x, 0, .91), 'arm'+side)
for name, (head, tail, parent) in spec.items():
    bone = rigdata.edit_bones.new(name)
    bone.head, bone.tail = head, tail
    if parent: bone.parent = rigdata.edit_bones[parent]
bpy.ops.object.mode_set(mode='OBJECT')

meshes = []
def part(name, center, size, mat, bone, sphere=False):
    if sphere:
        bpy.ops.mesh.primitive_uv_sphere_add(segments=12, ring_count=8, radius=1, location=center)
    else:
        bpy.ops.mesh.primitive_cube_add(size=1, location=center)
    obj = bpy.context.object
    obj.name = name
    obj.scale = size
    bpy.ops.object.transform_apply(location=False, rotation=False, scale=True)
    obj.data.materials.append(mat)
    if not sphere:
        bevel = obj.modifiers.new('Machined edges', 'BEVEL')
        bevel.width = .035
        bevel.segments = 2
        bpy.ops.object.modifier_apply(modifier=bevel.name)
    group = obj.vertex_groups.new(name=bone)
    group.add(list(range(len(obj.data.vertices))), 1.0, 'REPLACE')
    mod = obj.modifiers.new('Rigid bone skin', 'ARMATURE')
    mod.object = rig
    obj.parent = rig
    meshes.append(obj)
    return obj

part('Torso', (0,0,1.43), (.67,.36,.57), bodymat, 'body')
part('Chest badge', (0,-.196,1.46), (.23,.035,.20), trim, 'body')
part('Pelvis', (0,0,1.08), (.58,.30,.18), jointmat, 'root')
part('Head shell', (0,0,1.90), (.50,.37,.33), bodymat, 'head')
part('Visor', (0,-.195,1.93), (.36,.035,.10), jointmat, 'head')
for x in [-.11,.11]: part('Eye', (x,-.218,1.94), (.065,.018,.045), eye, 'head')
for side in ['L','R']:
    for prefix, width, mat in [('thigh',.20,bodymat),('shin',.18,trim),('arm',.20,bodymat),('forearm',.22,trim)]:
        bone = prefix+side
        h,t,_=spec[bone]
        center=(Vector(h)+Vector(t))/2
        length=(Vector(t)-Vector(h)).length
        part(bone+' casing', center, (width,.23,length-.08), mat, bone)
        part(bone+' joint', h, (.125,.125,.125), jointmat, bone, True)
    x=spec['foot'+side][0][0]
    part('Boot'+side, (x,-.085,.085), (.28,.39,.17), jointmat, 'foot'+side)
    x=spec['forearm'+side][1][0]
    part('Fist'+side, (x,0,.88), (.245,.255,.20), jointmat, 'forearm'+side)

for pb in rig.pose.bones: pb.rotation_mode = 'XYZ'
actions = {}
motion_meta = {}
for name, count in [('idle',48), ('walk',24), ('attack',24)]:
    rig.animation_data_create()
    rig.animation_data.action = None
    action = bpy.data.actions.new(name)
    rig.animation_data.action = action
    for f in range(count+1):
        u=f/count
        for pb in rig.pose.bones:
            pb.location=(0,0,0)
            pb.rotation_euler=(0,0,0)
        if name == 'idle':
            rig.pose.bones['body'].location.y=.012*(1-math.cos(2*math.pi*u))
            for side, sign in [('L',1),('R',-1)]:
                rig.pose.bones['arm'+side].rotation_euler.x=sign*.035*math.sin(2*math.pi*u)
        elif name == 'walk':
            for side, phase in [('L',0),('R',math.pi)]:
                a=2*math.pi*u+phase
                y=.23*math.cos(a)
                lift=.12*max(0,math.sin(a))**2
                dz=1.0-lift
                dist=math.hypot(y,dz)
                # Slightly flex the resting pose to keep the feet inside the reach envelope.
                dz=.94-lift
                dist=math.hypot(y,dz)
                bend=math.acos(min(1,dist/1.0))
                hip=math.atan2(y,dz)-bend
                knee=2*bend
                rig.pose.bones['thigh'+side].rotation_euler.x=hip
                rig.pose.bones['shin'+side].rotation_euler.x=knee
                rig.pose.bones['foot'+side].rotation_euler.x=(hip+knee) # Foot rest-local X points opposite leg X
                rig.pose.bones['arm'+side].rotation_euler.x=-.60*math.cos(a)
                rig.pose.bones['forearm'+side].rotation_euler.x=-.12
            # Lower pelvis by 6 cm, keeping planted soles on the fixed ground plane.
            rig.pose.bones['root'].location.y=-.06
        else:
            def ramp(t, knots):
                for (t0,v0),(t1,v1) in zip(knots,knots[1:]):
                    if t <= t1:
                        a=max(0,(t-t0)/(t1-t0)); a=a*a*(3-2*a)
                        return v0+(v1-v0)*a
                return knots[-1][1]
            swing=ramp(u,[(0,0),(.33,.65),(.50,-1.65),(.62,-1.65),(1,0)])
            rig.pose.bones['armR'].rotation_euler.x=swing
            rig.pose.bones['forearmR'].rotation_euler.x=ramp(u,[(0,0),(.33,-1.0),(.5,-.10),(.62,-.10),(1,0)])
            rig.pose.bones['armL'].rotation_euler.x=-.18*math.sin(math.pi*u)**2
        for pb in rig.pose.bones:
            pb.keyframe_insert(data_path='location', frame=f+1, group=pb.name)
            pb.keyframe_insert(data_path='rotation_euler', frame=f+1, group=pb.name)
    # Dense keys are already baked; linear interpolation avoids overshoot.
    slot=rig.animation_data.action_slot
    for layer in action.layers:
        for strip in layer.strips:
            for curve in strip.channelbag(slot).fcurves:
                for key in curve.keyframe_points: key.interpolation='LINEAR'
    action.use_fake_user=True
    actions[name]=action
    motion_meta[name]={'duration': count/24, 'frames':8, 'baked_keys':count+1, 'loop':name!='attack'}
    rig.animation_data.action=None
    track=rig.animation_data.nla_tracks.new()
    track.name=name
    strip=track.strips.new(name,1,action)
    track.mute=True

# Export only skinned character. Each NLA track is an independent glTF clip.
for track in rig.animation_data.nla_tracks: track.mute=False
bpy.ops.object.select_all(action='DESELECT')
rig.select_set(True)
for obj in meshes: obj.select_set(True)
bpy.context.view_layer.objects.active=rig
scene.frame_start=1; scene.frame_end=49
bpy.ops.export_scene.gltf(filepath=str(out/'robot.glb'), export_format='GLB', use_selection=True,
    export_animations=True, export_animation_mode='NLA_TRACKS', export_force_sampling=True,
    export_anim_slide_to_zero=True, export_frame_range=False, export_skins=True, export_apply=False)
for track in rig.animation_data.nla_tracks: track.mute=True

bpy.ops.object.camera_add(location=(-5,-8,3.4))
camera=bpy.context.object
camera.name='Fixed sprite camera'
camera.rotation_euler=(Vector((0,0,1.05))-camera.location).to_track_quat('-Z','Y').to_euler()
camera.data.type='ORTHO'; camera.data.ortho_scale=3.0
scene.camera=camera
for name,loc,power,size in [('Key',(-3,-4,6),450,4),('Fill',(4,-1,4),220,4),('Rim',(0,4,5),300,3)]:
    bpy.ops.object.light_add(type='AREA', location=loc)
    light=bpy.context.object; light.name=name; light.data.energy=power; light.data.shape='DISK'; light.data.size=size
    light.rotation_euler=(Vector((0,0,1))-light.location).to_track_quat('-Z','Y').to_euler()
rig.animation_data.action=actions['idle']
scene.frame_set(1)
bpy.ops.wm.save_as_mainfile(filepath=str(out/'robot.blend'))
for name,action in actions.items():
    rig.animation_data.action=action
    count=motion_meta[name]['baked_keys']-1
    for i in range(8):
        # Loop clips exclude duplicate endpoint; attack includes return pose.
        frame=1+count*i/(7 if name=='attack' else 8)
        scene.frame_set(int(frame), subframe=frame-int(frame))
        scene.render.filepath=str(out/'frames'/f'{name}_{i:02}.png')
        bpy.ops.render.render(write_still=True)
(out/'motion_manifest.json').write_text(json.dumps({'motions':motion_meta,'sprite':{'size':[128,128], 'camera':list(camera.location), 'ortho_scale':3.0,'ground_origin':[0,0,0]},'method':'Procedural skinned robot; baked pose keys; orthographic 3D renders, not hand-drawn pixel art'},indent=2))
print('MOTION_BUILD_COMPLETE',out)


