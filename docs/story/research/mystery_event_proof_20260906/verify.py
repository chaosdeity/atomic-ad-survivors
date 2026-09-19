from collections import deque, Counter
from copy import deepcopy
from datetime import datetime
from itertools import permutations
from pathlib import Path
import json
from story import Case


def main():
    checks = []
    def check(name, ok): checks.append({'name': name, 'passed': bool(ok)})
    c = Case(); original = c.state()
    check('단서 없이 추론·보증·종결을 실행할 수 없다', not c.act('connect') and not c.act('guarantee') and not c.act('close_case') and c.state() == original)
    order_ok = True
    for order in permutations(['read_bedside','read_clinic','read_outside']):
        c = Case()
        for action in order: c.act(action)
        order_ok &= c.act('connect') and c.understood
    check('단서 순서 6가지 모두 같은 사실로 수렴한다', order_ok)
    c = Case(); c.act('read_clinic'); before = c.state()
    check('단서 반복 입력은 상태·로그를 중복 변경하지 않는다', not c.act('read_clinic') and c.state() == before)
    c.act('read_outside'); c.act('connect'); c.act('alternative'); before = c.state()
    check('대체 치료를 반복 결제하거나 자원을 음수로 만들지 않는다', not c.act('alternative') and c.state() == before and c.supplies == 1)

    start = Case(); todo = deque([start]); states = {start.key(): start}
    edges = {}; invalid = []; representatives = {}
    while todo:
        c = todo.popleft(); key = c.key(); edges[key] = []
        if c.supplies < 0 or (c.ended and (not c.understood or not c.consent or not c.family_care)):
            invalid.append(key)
        if c.ending: representatives.setdefault(c.ending, c.state())
        for action in c.actions():
            child = deepcopy(c); assert child.act(action)
            nxt = child.key(); edges[key].append(nxt)
            if nxt not in states:
                states[nxt] = child; todo.append(child)
    closable = {k for k,c in states.items() if c.ended}
    changed = True
    while changed:
        before = len(closable)
        closable |= {k for k,v in edges.items() if any(n in closable for n in v)}
        changed = len(closable) != before
    check('전수 상태 검사: 음수 자원·치료 미복구 종결·동의 없는 종결 없음', not invalid)
    check('전수 상태 검사: 모든 미종결 상태에서 적어도 하나의 마무리 경로가 있다', len(closable) == len(states))
    check('구별되는 세 합의 조건이 모두 도달 가능하다', set(representatives) == {'stay_by_choice','independent_discharge','conditional_discharge'})
    c = Case()
    for a in ['extract','read_outside','read_clinic','connect','alternative']:
        c.act(a)
    check('성급한 인양도 단서를 잃지 않고 치료 복구 가능, 신뢰는 자동 회복 안 됨', c.family_care and c.trust == 'broken' and not c.act('close_case'))
    c.act('repair_trust'); c.act('close_case')
    check('성급한 인양 후 책임 인정과 합의로 마무리해도 과거 손상이 남는다', c.ending == 'independent_discharge' and c.extracted and c.trust == 'cautious')
    check('반전은 외부·병원 기록을 대조할 때만 열린다', all(not s.understood or {'clinic','outside'} <= s.clues for s in states.values()))

    dest = Path(__file__).parent / ('results-' + datetime.now().strftime('%Y%m%d-%H%M%S-%f')); dest.mkdir()
    result = {'checks': checks, 'states': len(states), 'transitions': sum(map(len,edges.values())),
              'unclosable': len(states)-len(closable), 'ending_examples': representatives,
              'early_extraction_example': c.state(),
              'terminal_state_counts': dict(Counter(s.ending for s in states.values() if s.ended))}
    (dest/'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    lines = ['# 한 사건의 행동·미스터리 검증', '', f"검사 {sum(x['passed'] for x in checks)}/{len(checks)}", '',
             f"도달 상태 {result['states']}개, 전이 {result['transitions']}개 전수 검사. 종결 경로 없는 상태 {result['unclosable']}개.",
             '상태 수는 이야기 수나 엔딩 확률이 아니다. 사람이 작성한 세 가지 합의 조건의 실행 검증이다.', '']
    for item in checks: lines.append(f"- {'PASS' if item['passed'] else 'FAIL'}: {item['name']}")
    for name, example in representatives.items():
        lines += ['', f'## 실제 실행 예: {name}', ''] + ['- '+x for x in example['log']]
    lines += ['', '## 성급한 인양 후 복구 사례', ''] + ['- '+x for x in c.log]
    lines += ['', '## 한계', '', 'CLI 규칙과 기록만 검증했다. Godot·전투·연출·재미·반전의 감정적 효과는 미검증.',
              '정식 세계관·기존 시뮬레이터 수정 없음. 세 합의는 작가가 정의한 결과이며 무한 자동 서사 생성이 아니다.',
              '종결은 이번 사건의 체크포인트다. 장기 세계에서 합의가 유지/파기되는 규칙은 별도 구현 대상.', '']
    (dest/'REPORT.md').write_text('\n'.join(lines), encoding='utf-8')
    print(json.dumps({'passed': sum(x['passed'] for x in checks), 'total': len(checks), 'states': len(states), 'transitions': result['transitions'], 'unclosable': result['unclosable'], 'report': str(dest/'REPORT.md')}, ensure_ascii=False))
    return any(not x['passed'] for x in checks)


if __name__ == '__main__': raise SystemExit(main())
