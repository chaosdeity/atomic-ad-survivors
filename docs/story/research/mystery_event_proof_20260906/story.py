"""One authored mystery with state-derived resolutions; standalone CLI, no AI."""
from dataclasses import dataclass, field, asdict
import json

CLUES = {
    'bedside': ('병상 표찰', 'H-17 / 퇴원 가능. 잠금 장치: 해제.\n아래에는 같은 시각의 재원 확인 도장이 줄지어 있다. 어제, 그제, 그 전날. G-04 연결 유지.'),
    'clinic': ('병원 약관 기록', 'G-04 / 수혜 단위: 연결 가구. 유지 조건: H-17의 정시 재원 확인.\n퇴원 처리 시 다음 정기 치료품 발급 종료. 비상 생명 보존은 별도 유지.\n여백에 인쇄된 문구: 오래 머무를수록, 더 많은 안심.'),
    'outside': ('외부 배급소 수령 기록', 'G-04 / 치료품 두 묶음. 수령 서명 두 개. H-17 본인 지급: 없음.\n가족란의 두 서명 옆에 수령 예정 시각이 적혀 있다. 병원 재원 확인보다 십 분 늦다.'),
}


@dataclass
class Case:
    clues: set = field(default_factory=set)
    understood: bool = False
    outside: bool = False
    route: str = 'clinic'
    supplies: int = 3
    trust: str = 'guarded'
    extracted: bool = False
    consent: bool = False
    ended: bool = False
    listened: bool = False
    reserved: bool = False
    hypothesis_checked: bool = False
    spoke: bool = False
    log: list = field(default_factory=list)

    @property
    def family_care(self):
        return self.route in {'alternative', 'guarantee'} or not self.outside

    @property
    def ending(self):
        if not self.ended:
            return None
        if not self.outside and self.consent:
            return 'stay_by_choice'
        if self.outside and self.route == 'alternative':
            return 'independent_discharge'
        if self.outside and self.route == 'guarantee':
            return 'conditional_discharge'
        raise AssertionError('Invalid closed case')

    def state(self):
        data = asdict(self)
        data['clues'] = sorted(self.clues)
        data.update(family_care=self.family_care, ending=self.ending)
        return data

    def key(self):
        return (tuple(sorted(self.clues)), self.understood, self.outside, self.route,
                self.supplies, self.trust, self.extracted, self.consent, self.ended,
                self.listened, self.reserved, self.hypothesis_checked, self.spoke)

    def actions(self):
        if self.ended:
            return {}
        actions = {f'read_{k}': f'{title} 조사' for k, (title, _) in CLUES.items() if k not in self.clues}
        if not self.listened:
            actions['listen'] = '주민이 붙잡고 있는 종이봉투를 살펴보고 기다린다'
        if self.listened and not self.spoke:
            actions['speak'] = '구출을 약속하기 전에, 지금 무엇을 기다리는지 묻는다'
        if not self.reserved and self.supplies >= 2:
            actions['reserve'] = '보급소 치료품 확보: 자원 2를 따로 보낸다. 이 사건에서는 되돌릴 수 없음'
        if {'clinic', 'outside'} <= self.clues and not self.understood:
            actions['connect'] = '재원 확인 시각과 외부 수령 시각을 연결한다'
        if 'bedside' in self.clues and not self.hypothesis_checked and not self.understood:
            actions['test_hypothesis'] = '퇴원 가능 표기가 오류인지 확인한다 — 조사 비용 없음'
        if not self.outside:
            actions['extract'] = '강제 인양: 주민의 거부를 무시한다. 연결 치료 중단 가능·신뢰 손상 경고'
        if self.understood:
            if self.route != 'alternative' and self.supplies >= 2:
                actions['alternative'] = '대체 치료 확보: 자원 2. 가족 치료를 캠페인 밖으로 옮긴다'
            if self.route == 'clinic' and self.supplies >= 1:
                actions['guarantee'] = '보증 이전: 자원 1. 가족 치료 유지 대신 윤서의 정기 확인 의무'
            if not self.outside:
                actions['respect_stay'] = '당사자의 잔류 선택을 존중하고 이번 사건을 마무리한다'
            if self.route in {'alternative', 'guarantee'}:
                if not self.outside:
                    actions['discharge'] = '주민 동의로 퇴원한다: 선택한 치료 경로와 대가를 유지'
                elif self.trust == 'broken':
                    actions['repair_trust'] = '복구한 치료 기록을 전달하고 강제 인양의 책임을 인정한다'
                else:
                    actions['close_case'] = '현재 합의를 확인하고 이번 사건을 마무리한다'
        return actions

    def act(self, action):
        if action not in self.actions():
            return False
        if action == 'listen':
            self.listened = True
            self.log.append('봉투는 비어 있다. 접힌 바닥만 반질거린다. 주민은 문보다 벽의 시계를 더 자주 본다.\n“닫지는 말아 줘요. 아직 나가지는 않을게요.”')
        elif action == 'speak':
            self.spoke = True
            self.log.append('“가져다줄 게 있어요.”\n주민은 봉투를 펴다가 다시 접는다. 윤서는 손을 내밀지 않는다.\n“그럼, 뭘 가져가야 하는지부터 볼게요.”' if not self.extracted else '“기다리라고 했잖아요.”\n주민은 구겨진 봉투를 무릎 위에서 편다. 윤서는 기록을 찾겠다고 말한다. 이번에는 먼저 데려가겠다고 하지 않는다.')
        elif action == 'test_hypothesis':
            self.hypothesis_checked = True
            self.log.append('표찰과 문 센서의 기록은 일치한다. 퇴원 가능은 오류가 아니다. 문은 실제로 열려 있다.\n나갈 수 없다는 말은 잠금 장치를 가리키지 않는다. 무엇이 이 사람을 여기 남게 하는가?')
        elif action == 'reserve':
            self.reserved = True
            self.supplies -= 2
            self.log.append('보급소 수신: 치료품 두 묶음 인수. 오늘 몫은 확보했어. / 손에 남은 것은 한 묶음이다.')
        elif action.startswith('read_'):
            clue = action[5:]
            self.clues.add(clue)
            self.log.append(CLUES[clue][1])
        elif action == 'connect':
            self.understood = True
            self.log.append('병원 확인이 끝난 뒤 십 분. 그때마다 외부 기록에 두 사람의 서명이 생긴다. H-17 몫은 한 번도 없다.\n이 사람은 자기 치료가 끝나기를 기다린 것이 아니다. 여기 있다는 확인으로 가족의 다음 치료를 받고 있었다.')
            self.log.append('열린 문 옆에서 “퇴원 가능” 표시가 켜진다. 거짓말은 아니다. 잃는 것은 나가는 사람의 치료가 아니다.')
            if self.listened:
                self.log.append('비어 있던 봉투는 버리지 못한 물건이 아니라, 다음 두 묶음을 담으려던 것이었다.')
        elif action == 'extract':
            self.outside, self.extracted, self.trust = True, True, 'broken'
            self.log.append('주민의 몸이 문턱을 넘는다. 손에서 떨어진 봉투는 안쪽에 남는다.\n“내 말은 듣지도 않았군요.”')
            self.log.append('연결 치료 유지.' if self.family_care else 'G-04 정기 치료 보류. 생명 보존은 유지되지만 생활 치료를 복구해야 한다.')
        elif action == 'alternative':
            self.supplies -= 2
            self.route = 'alternative'
            self.log.append('별도 치료품·연결 경로 확보. 정기 확인 의무 없이 가족 치료를 유지한다. 이미 잃은 신뢰는 자동 복구되지 않는다.')
        elif action == 'guarantee':
            self.supplies -= 1
            self.route = 'guarantee'
            self.log.append('치료 보증 이전. 가족 치료는 유지되지만 윤서에게 정기 확인 의무가 붙었다.\n단말은 축하음을 낸다. “보호자 변경을 환영합니다.”')
        elif action == 'discharge':
            self.outside, self.consent, self.trust = True, True, 'cooperative'
            self.log.append('주민이 치료 유지 조건을 확인하고 스스로 병실을 나온다.')
        elif action == 'repair_trust':
            self.trust, self.consent = 'cautious', True
            self.log.append('치료 복구 기록 전달. 주민: 이번에는 확인하겠어요. 신뢰는 완전히 돌아오지 않았다.')
        elif action == 'respect_stay':
            self.consent, self.ended = True, True
            self.log.append('윤서는 문을 더 밀지도, 닫지도 않는다. 주민은 이번 확인을 마치기로 한다.')
            self.log.append('“다음에는, 밖에서 받을 방법도 알아봐 줄래요?”\n복도로 나온 뒤에도 문틈은 그대로다. 안에서는 종이봉투를 펴는 소리가 난다.')
        elif action == 'close_case':
            self.ended = True
            self.log.append('두 사람의 다음 치료가 확인된다. 병실 표찰에서 H-17이 지워진다.')
            if self.extracted:
                self.log.append('주민은 건네준 기록을 한 장씩 확인한다. “다음에는 먼저 물어봐요.”\n구겨진 봉투를 받아 들지만 윤서 옆으로 오지는 않는다. 같은 방향으로, 조금 떨어져 걷는다.')
            elif self.route == 'guarantee':
                self.log.append('주민이 먼저 걸어간다. 윤서의 단말에는 내일 같은 시각의 확인 알림이 켜진다.\n화면의 이름을 손가락으로 가려 봐도 알림은 사라지지 않는다.\n“내일은 내가 시계를 보겠네.”')
            else:
                self.log.append('주민이 두 묶음을 직접 담는다. 낡은 봉투의 접힌 바닥이 펴진다.\n문밖에서 잠깐 멈추지만, 이번에는 시계를 보지 않는다.\n“오늘은 같이 받아도 되겠네요.”')
        return True


def play():
    c = Case()
    print('검증용 사건: 퇴원 가능한 사람 / 정식 시나리오 아님')
    print('자동문은 반쯤 열려 있다. 안내판: 고객님의 건강한 퇴원을 응원합니다.\n주민: 닫지는 말아 줘요. 아직 나가지는 않을게요.')
    while not c.ended:
        choices = list(c.actions().items())
        print(f'\n자원 {c.supplies} | 위치 {"밖" if c.outside else "병실"} | 신뢰 {c.trust}')
        for i, (_, label) in enumerate(choices, 1): print(f'{i}. {label}')
        answer = input('번호 / q 종료: ').strip()
        if answer.lower() == 'q': return
        if not answer.isdigit() or not 1 <= int(answer) <= len(choices): continue
        n = len(c.log)
        c.act(choices[int(answer)-1][0])
        print('\n'.join(c.log[n:]))
    print('사건 마무리:', c.ending)


if __name__ == '__main__':
    play()
