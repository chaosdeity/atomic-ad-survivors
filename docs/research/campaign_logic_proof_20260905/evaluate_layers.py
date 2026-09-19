"""Revision-2 causal gates plus paired comparison using unchanged benchmark episodes."""
from itertools import product
from collections import Counter
from pathlib import Path
from datetime import datetime
from hashlib import sha256
import json
from simulator import World
from evaluate_outcomes import episode, classify, POLICIES, FACTORS, VALUES


def main():
    base = Path(__file__).parent
    checks = []

    def gate(name, condition, w):
        checks.append({'name': name, 'passed': bool(condition), 'trace': w.log,
                       'patient': w.snapshot()['people']['patient']})

    def setup(local=0, partner=0, cooperation=True):
        w = World(); w.campaigns['home'].supplies = local
        w.campaigns['care'].supplies = partner; w.cooperation = cooperation
        w.settle()
        return w

    w = setup(); original = w.people['patient'].care_route
    w.send('break', 'destroy_clinic', observed=False)
    gate('미관측 파괴도 물리적인 치료 상실을 주민에게 일으킨다', original == 'home' and w.people['patient'].care_route == 'pending' and not w.pending, w)

    w = setup(local=2); w.send('break', 'destroy_clinic')
    pending = w.people['patient'].care_route == 'pending'; w.tick()
    gate('자체 자원이 있으면 예고 뒤 기존 관할 치료가 회복된다', pending and w.people['patient'].care_route == 'home' and w.campaigns['home'].supplies == 0, w)

    w = setup(partner=2); w.send('break', 'destroy_clinic'); w.tick()
    gate('타 캠페인 지원이 주민 치료 관할과 등록에 연결된다', w.people['patient'].care_route == 'care' and w.people['patient'].registration.get('care') == 'conditional' and w.campaigns['care'].supplies == 0, w)
    w.send('break-mobile', 'destroy_mobile'); w.tick()
    gate('지원 치료 장치도 파괴되면 치료를 제공하지 못한다', w.people['patient'].care_route == 'pending', w)

    w = setup(partner=2, cooperation=False); w.send('break', 'destroy_clinic'); w.tick()
    gate('같은 자원이어도 협력 거부 시 타 관할 치료가 열리지 않는다', w.people['patient'].care_route == 'pending' and w.campaigns['care'].supplies == 2, w)

    w = setup(); w.send('break', 'destroy_clinic'); w.tick()
    before = w.npc_choice('patient')
    w.send('alternative', 'establish_care', actor='patient')
    w.send('repeat', 'establish_care', actor='patient')
    for _ in range(20): w.tick()
    gate('대체 치료에 실제 비용을 쓰면 NPC 독립 선택이 지속된다', before == 'stay_for_treatment' and w.npc_choice('patient') == 'take_independent_route' and w.people['patient'].care_route == 'independent' and w.outpost_stock == 0, w)

    w = setup(); w.outpost_stock = 1; w.send('alternative', 'establish_care', actor='patient')
    gate('대체 치료 비용 부족 시 무료 독립 결과가 생성되지 않는다', not w.people['patient'].alternative_care and w.outpost_stock == 1, w)

    w = setup(); w.send('food', 'secure_food', actor='parent'); w.send('hold', 'hold_registration', actor='parent')
    w.send('break', 'destroy_clinic'); w.tick()
    gate('치료 의존성이 없는 주민의 거주 결말은 시설 파괴만으로 취소되지 않는다', w.people['parent'].independent_living, w)

    configs = [dict(zip(FACTORS, v)) for v in product(*VALUES)]
    rows, pairs = [], []
    outcomes = {}
    replay_ok = True
    for i, config in enumerate(configs):
        for policy in POLICIES:
            w = episode(config, policy)
            replay_ok &= w.snapshot() == episode(config, policy).snapshot()
            value = (*classify(w), w.people['patient'].care_route)
            outcomes[(i, policy)] = value
            rows.append({'config': config, 'policy': policy, 'outcome': value})
        a = outcomes[(i, 'rescue_first')]; b = outcomes[(i, 'disrupt_first')]
        if a != b:
            pairs.append({'config': config, 'without_destruction': a, 'with_destruction': b})
    counts = {p: dict(Counter(r['outcome'][2] for r in rows if r['policy'] == p)) for p in POLICIES}
    gate('동일 초기 조건의 파괴 여부가 실제 치료 결과를 바꾼다', len(pairs) > 0, w)
    gate('1024개 사례의 상태와 사건 로그를 동일하게 재현한다', replay_ok, w)

    dest = base / ('layer-evaluation-' + datetime.now().strftime('%Y%m%d-%H%M%S-%f'))
    dest.mkdir()
    result = {'checks': checks, 'passed': sum(c['passed'] for c in checks), 'total': len(checks),
              'n': 256, 'strategy_counts': counts, 'paired_changed': len(pairs),
              'paired_examples': pairs, 'rows': rows,
              'simulator_sha256': sha256((base/'simulator.py').read_bytes()).hexdigest()}
    (dest/'results.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    lines = ['# 다층 연결 수정 2회차 평가', '', f"인과 검사 {result['passed']}/{result['total']}", '',
             f'동일 조건에서 파괴 여부에 따라 주민 치료 결과가 달라짐: {len(pairs)}/256 ({len(pairs)/256:.1%}).',
             '실험 조건의 비율이며 실제 유저 확률이 아니다. 기존 256조건×4전략을 그대로 재사용.', '',
             '| 전략 | 기존 치료 | 타 캠페인 치료 | 독립 치료 | 치료 보류 |', '|---|---:|---:|---:|---:|']
    for p, c in counts.items():
        lines.append(f"| {POLICIES[p]} | {c.get('home',0)} | {c.get('care',0)} | {c.get('independent',0)} | {c.get('pending',0)} |")
    lines += ['', '기존 전략에는 대체 치료 개설 행동이 없으므로 독립 치료 비율은 0이다. 별도 인과 검사에서 비용·NPC 선택·20턴 유지까지 검증했다.', '',
              '치료 보류는 엔딩이 아니다. 기존/타 관할 치료와 독립 치료는 생활 상태이며 서사 연출이 완성된 엔딩으로 세지 않는다.',
              '새로 연결한 것: 시설 가용성→서비스 제공자→치료 우선 NPC의 조건부 수용 또는 보류. 대체 치료→독립 선택.',
              '독립 치료는 기존 식량 우회처럼 유지 비용을 추상화한 경로다. 물리적으로 파괴되는 대체 치료 시설·약품 소비는 미구현.',
              '등록 이력은 자동 삭제되지 않는다. 신규 치료를 받아들이는 것은 해당 NPC의 사전 정의된 선호이며 플레이어의 수락을 대신하지 않는다.',
              '치료 보류는 만성 치료 접근의 상실이다. 기존 불사/긴급 보존을 취소하거나 즉사로 바꾸지 않는다.',
              'Godot 실행·화면·재미·전체 서사 완성은 미검증. 기존 게임 변경 없음. 수정·재검증 한도 2/2회 도달.', '', '## 인과 검사', '']
    for c in checks:
        lines += [f"- {'PASS' if c['passed'] else 'FAIL'}: {c['name']}"]
    lines += ['', '읽은 파일: failure-ledger.md, simulator.py, evaluate_outcomes.py, README.md 관련 부분. 실행 검증은 verify.py와 이 평가 스크립트.',
              '재실행: python verify.py 및 python evaluate_layers.py. 결과는 고유 폴더로 저장.', '']
    (dest/'REPORT.md').write_text('\n'.join(lines), encoding='utf-8')
    print(json.dumps({'passed': result['passed'], 'total': result['total'], 'changed': len(pairs), 'counts': counts, 'report': str(dest/'REPORT.md')}, ensure_ascii=False))
    return result['passed'] != result['total']


if __name__ == '__main__':
    raise SystemExit(main())
