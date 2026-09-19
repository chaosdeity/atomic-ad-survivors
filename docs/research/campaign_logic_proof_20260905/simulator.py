"""Experimental deterministic rules. No AI, networking, or game-project dependency."""
from dataclasses import dataclass, field, asdict
import json


@dataclass
class Person:
    name: str
    priority: str
    body: str = 'normal'
    registration: dict = field(default_factory=dict)
    clinic_dependent: bool = False
    food: bool = False
    bypass: bool = False
    family_hold: bool = False
    independent_living: bool = False
    rescue_link: bool = True
    companion_available: bool = False
    facility: str = ''
    preservation_progress: int = 0
    beacon_exposure: int = 0
    alternative_care: bool = False
    care_route: str = ''


@dataclass
class Campaign:
    name: str
    supplies: int
    clinic: bool = True
    mobile: bool = False
    rescue_network: bool = True
    mobile_provider: str = ''
    knowledge: set = field(default_factory=set)


class World:
    def __init__(self):
        self.people = {
            'yunseo': Person('윤서', 'autonomy'),
            'patient': Person('주민 A · 치료 우선', 'care', clinic_dependent=True),
            'parent': Person('주민 B · 식량 우선', 'food'),
            'robot': Person('로봇 C · 자율성 우선', 'autonomy'),
        }
        self.campaigns = {
            'home': Campaign('스마일홈', 6),
            'care': Campaign('케어 캠페인 · 실험용', 6),
        }
        self.outpost_stock = 2
        self.outpost_exposure = 0
        self.cooperation = True
        self.pending = {}
        self.processed = set()
        self.log = []
        self.turn = 0

    def note(self, text):
        self.log.append({'turn': self.turn, 'text': text})

    def available_actions(self, actor='yunseo'):
        p = self.people[actor]
        if p.body == 'normal':
            return ['destroy_clinic', 'destroy_mobile', 'incapacitate',
                    'secure_food', 'hold_registration', 'break_bypass', 'establish_care']
        actions = ['wait']
        if p.body in {'life_support', 'recovering'}:
            actions.append('request_preservation')
        if p.body == 'recovering':
            actions += ['accept_treatment', 'decline_treatment']
        if p.body == 'preserving' and p.preservation_progress >= 3:
            actions.append('wake')
        if p.facility and p.rescue_link and self.outpost_stock > 0:
            actions.append('escape')
        return actions

    def recovery_offer(self):
        return '비상 보존 요청: 위치 신호 노출 +1, 독립 보존 설비로 3턴 저속 복구, 기상 시 조건부 등록. 요청은 선택이며 확정 편입은 아님.'

    def send(self, event_id, action, actor='yunseo', campaign='home', observed=True):
        """Explicit event identity prevents duplicate delivery from applying twice."""
        if event_id in self.processed:
            return
        if action not in {'destroy_clinic', 'destroy_mobile', 'incapacitate',
                          'accept_treatment', 'decline_treatment', 'escape',
                          'secure_food', 'hold_registration', 'break_bypass',
                          'wait', 'request_preservation', 'wake', 'establish_care'}:
            raise ValueError(action)
        p, c = self.people[actor], self.campaigns[campaign]
        self.processed.add(event_id)
        if action not in self.available_actions(actor):
            self.note(f'{p.name}: 현재 상태에서 {action} 불가; 상태·자원 유지')
            return
        if observed:
            c.knowledge.add(event_id)
        self.note(f'{p.name}: {action} (관측={observed})')
        if action == 'wait':
            self.tick()
            return
        elif action == 'request_preservation':
            self.note(self.recovery_offer())
            p.body, p.facility = 'preserving', campaign
            p.preservation_progress = 0
            p.beacon_exposure += 1
            c.knowledge.add(event_id)
            self.note('비상 보존 조건 수락: 신호 송출. 일반 구조망과 별도인 최저 보존 설비 사용')
        elif action == 'wake':
            p.registration[p.facility] = 'conditional'
            p.body, p.facility = 'normal', ''
            p.preservation_progress = 0
            self.note('직접 기상: 정상 행동 복귀, 조건부 등록 적용. 신호 노출 기록 유지')
        elif action in {'destroy_clinic', 'destroy_mobile'}:
            target = 'clinic' if action == 'destroy_clinic' else 'mobile'
            if not getattr(c, target):
                self.note('이미 없는 시설: 추가 파괴·추가 대응 없음')
                return
            setattr(c, target, False)
            if observed and not c.clinic and not c.mobile:
                self.plan_repair(campaign)
        elif action == 'incapacitate':
            if p.body != 'normal':
                self.note('이미 구조 절차 중: 중복 비용 없음')
                return
            p.body = 'life_support'
            self.rescue(actor, campaign, observed)
        elif action == 'accept_treatment':
            if p.body == 'recovering' and p.facility == campaign:
                p.body = 'normal'
                p.registration[campaign] = 'conditional'
                self.note('사전 안내된 조건 수락: 신체 복구, 조건부 등록. 확정 편입 아님')
        elif action == 'decline_treatment':
            if p.body == 'recovering':
                self.note('치료 조건 거부: 생명 유지 지속. 회수선·동료 구조로 우회 가능')
        elif action == 'escape':
            if p.facility and p.rescue_link and self.outpost_stock > 0:
                self.outpost_stock -= 1
                self.outpost_exposure += 1
                p.body, p.facility = 'normal', ''
                p.preservation_progress = 0
                self.note('보급소 우회 인양 성공: 자원 1 소모, 회수선 노출 +1')
            else:
                self.note('현재 우회 인양 조건 부족: 자동 탈출이나 자동 등록 없음')
        elif action == 'establish_care':
            if p.clinic_dependent and not p.alternative_care and self.outpost_stock >= 2:
                self.outpost_stock -= 2
                p.alternative_care = True
                self.note('대체 치료 경로 확보: 보급소 자원 2 소모. 조건부 등록 없는 치료 선택 가능')
            else:
                self.note('대체 치료 개설 불가 또는 이미 개설됨: 추가 비용 없음')
        elif action == 'secure_food':
            if self.outpost_stock > 0:
                self.outpost_stock -= 1
                p.food, p.bypass = True, True
                self.note('우회 식량 경로 확보: 실험에서는 유지 비용을 추상화함')
        elif action == 'hold_registration':
            p.family_hold = True
        elif action == 'break_bypass':
            p.bypass, p.food = False, False
        self.settle()

    def plan_repair(self, campaign):
        if campaign in self.pending:
            return
        c = self.campaigns[campaign]
        partner = 'care' if campaign == 'home' else 'home'
        other = self.campaigns[partner]
        if c.supplies >= 2:
            kind = 'deploy_mobile'
        elif self.cooperation and other.supplies >= 2 and other.rescue_network:
            kind = 'request_partner'
        else:
            kind = 'service_suspended'
        self.pending[campaign] = (self.turn + 1, kind, partner)
        self.note(f'{c.name} 대응 예고: {kind}; 다음 턴에 자원 재확인')

    def tick(self):
        self.turn += 1
        for key, (due, kind, partner) in list(self.pending.items()):
            if due > self.turn:
                continue
            c, other = self.campaigns[key], self.campaigns[partner]
            if kind == 'deploy_mobile' and c.supplies >= 2:
                c.supplies -= 2
                c.mobile = True
                c.mobile_provider = key
                self.note(f'{c.name}: 자원 2로 이동식 치료 배치')
            elif kind == 'request_partner' and self.cooperation and other.supplies >= 2 and other.rescue_network:
                other.supplies -= 2
                c.mobile = True
                c.mobile_provider = partner
                self.note(f'{other.name}: 자원 2로 지원. 경쟁 관할의 접점 발생')
            else:
                self.note(f'{c.name}: 수단 부족, 서비스 중단. 무한 증원 없음')
            del self.pending[key]
        for p in self.people.values():
            if p.body == 'preserving' and p.preservation_progress < 3:
                p.preservation_progress += 1
                self.note(f'{p.name}: 보존 설비의 독립 에너지 보충 {p.preservation_progress}/3')
                if p.preservation_progress == 3:
                    self.note(f'{p.name}: 복구 준비 완료, wake 선택 가능. 자동 등록 없음')
        self.settle()

    def rescue(self, actor, campaign, observed):
        p, c = self.people[actor], self.campaigns[campaign]
        if p.rescue_link and self.outpost_stock > 0:
            self.outpost_stock -= 1
            self.outpost_exposure += 1
            p.body = 'normal'
            self.note('보급소 인양: 생환, 자원 1 소모, 회수선 노출 +1')
        elif p.companion_available:
            p.companion_available = False
            p.body = 'normal'
            self.note('동료 구조: 이번 구조 수단 소진')
        elif observed and c.rescue_network and c.supplies > 0 and (c.clinic or c.mobile):
            c.supplies -= 1
            p.body, p.facility = 'recovering', campaign
            self.note('캠페인 구조: 파괴 이력과 무관하게 보존. 치료 완료 조건은 조건부 등록이라고 예고')
        else:
            self.note('일반 구조 수단 없음: 생명 유지. request_preservation 또는 wait 선택 가능')
            self.note(self.recovery_offer())

    def npc_choice(self, actor, alternative_care=None):
        p = self.people[actor]
        if alternative_care is None:
            alternative_care = p.alternative_care
        if p.priority == 'care' and p.clinic_dependent and not alternative_care:
            return 'stay_for_treatment'
        if p.priority == 'food' and not p.food:
            return 'stay_for_food'
        return 'take_independent_route'

    def settle(self):
        for p in self.people.values():
            if p.clinic_dependent:
                home = self.campaigns['home']
                route = ('independent' if p.alternative_care else 'home' if home.clinic
                         else (home.mobile_provider or 'home') if home.mobile else 'pending')
                if route != p.care_route:
                    p.care_route = route
                    if route in self.campaigns:
                        p.registration[route] = 'conditional'
                        self.note(f'{p.name}: 치료 우선 판단으로 {route}의 조건부 치료 선택. 생명 유지와 별개인 지속 치료 경로')
                    elif route == 'independent':
                        self.note(f'{p.name}: 대체 치료 확보로 독립 경로 선택. 과거 등록 기록은 자동 삭제하지 않음')
                    else:
                        self.note(f'{p.name}: 치료 시설 부재로 치료 보류. 해방 완료나 사망으로 판정하지 않음')
            valid = p.food and p.bypass and p.family_hold
            if valid != p.independent_living:
                p.independent_living = valid
                self.note(f'{p.name}: ' + ('자기 이름으로 거주 가능 — 작은 결말 성립' if valid else '생활 경로 손실 — 작은 결말 조건 해제'))

    def snapshot(self):
        return {
            'people': {k: asdict(v) for k, v in self.people.items()},
            'campaigns': {k: {**asdict(v), 'knowledge': sorted(v.knowledge)} for k, v in self.campaigns.items()},
            'outpost_stock': self.outpost_stock, 'outpost_exposure': self.outpost_exposure,
            'pending': self.pending, 'turn': self.turn, 'log': self.log,
        }


if __name__ == '__main__':
    w = World()
    w.send('break-1', 'destroy_clinic')
    w.tick()
    w.outpost_stock = 0
    w.send('defeat-1', 'incapacitate')
    w.send('decision-1', 'accept_treatment')
    print(json.dumps(w.snapshot(), ensure_ascii=False, indent=2))
