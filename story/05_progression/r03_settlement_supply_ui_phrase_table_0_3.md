# R03 정산/보급소 UI 실제 문구 테이블 v0.3

## 문서 상태

```text
상태:
초안 v0.3

판정:
R03 0.3 결과 화면과 보급소 화면에 넣을 실제 문구 후보를 키 단위로 정리한다.

용도:
UI/로컬라이즈/QA가 같은 문구 키를 보고 구현할 수 있게 한다.
```

---

## 0. 문구 잠금

사용 기준:

```text
보급태그
통행태그
진료태그
```

분리 기준:

```text
라벨은 태그가 아니다.
송장, 라벨, 보관함, 보류 도장은 런 중 판정/흔적이다.
태그는 정산 후 생활 접근 자원이다.
```

범위:

```text
R03-L01 반품 접수 야드
R03-L02 자동 분류장
R03-L04, R03-L05는 0.3에서 열지 않는다.
RETURN-05 정식 U5는 노출하지 않는다.
```

---

## 1. 결과 제목

| key | 문구 | 사용 조건 |
|---|---|---|
| `r03_result_hold_return` | 목적지 판정 보류 귀환 | 보류 스탬프/드론 오유도 후 귀환 |
| `r03_result_route_bypass` | 분류 경로 우회 귀환 | 레일 우회 중심 |
| `r03_result_locker_trace` | 미수령 기록 보관 귀환 | 보관함 남기기 중심 |
| `r03_result_supply_recovered` | 보급 물자 임시 회수 | 보관함 열기 중심 |
| `r03_result_recheck_failed` | 반송 재검사 회수 | 드론 재검사 실패 |
| `r03_result_compression_warning` | 압축 경고선 이탈 | 압축 경고선 목격 후 귀환 |

---

## 2. 결과 설명

| key | 문구 |
|---|---|
| `r03_desc_hold_return` | 반송 드론이 윤서의 표식을 끝까지 읽기 전에 보류 스탬프가 판정을 늦췄습니다. |
| `r03_desc_route_bypass` | 자동 분류장이 계산한 경로를 벗어나자, 통행 기록이 이상한 방향으로 남았습니다. |
| `r03_desc_locker_trace` | 미수령 보관함을 열지 않은 덕분에 목적지 누락 로그가 지워지지 않았습니다. |
| `r03_desc_supply_recovered` | 보관 기한이 닫히기 전에 물자를 빼냈습니다. 광고 시스템은 아직 수취인을 찾는 중입니다. |
| `r03_desc_recheck_failed` | 재검사 드론이 윤서를 반송 대상으로 확정하기 전에 보급소 회수선이 끼어들었습니다. |
| `r03_desc_compression_warning` | 압축 경고선 너머에서 다음 구역의 처리음이 들렸지만, 오늘은 거기까지 가지 않았습니다. |

---

## 3. 확정 태그 라인

| key | 문구 |
|---|---|
| `r03_confirm_supply_1` | 확정 태그: 보급태그 1장 |
| `r03_confirm_supply_2` | 확정 태그: 보급태그 2장 |
| `r03_confirm_passage_1` | 확정 태그: 통행태그 1장 |
| `r03_confirm_mixed_1` | 확정 태그: 보급태그 1장, 통행태그 1장 |
| `r03_confirm_none` | 확정 태그: 없음 |

---

## 4. 후보 태그 라인

| key | 문구 |
|---|---|
| `r03_candidate_supply` | 태그 후보: 보급태그 후보 {supply_count}장 |
| `r03_candidate_passage` | 태그 후보: 통행태그 후보 {passage_count}장 |
| `r03_candidate_medical_hold` | 태그 후보: 진료태그 접근 보류 기록 {medical_count}개 |
| `r03_candidate_mixed` | 태그 후보: 보급태그 후보 {supply_count}장, 통행태그 후보 {passage_count}장 |
| `r03_candidate_all` | 태그 후보: 보급태그 후보 {supply_count}장, 통행태그 후보 {passage_count}장, 진료태그 접근 보류 기록 {medical_count}개 |

주의:

```text
진료태그 접근 보류 기록은 확정 진료태그가 아니다.
R02 씨앗을 R03 보상처럼 보이게 하지 않는다.
```

---

## 5. 후보 정산 라인

| key | 문구 |
|---|---|
| `r03_resolution_supply_partial` | 후보 정산: 보급태그 후보 {total}장 중 {approved}장 승인 |
| `r03_resolution_passage_hold` | 후보 정산: 통행태그 후보 {total}장 보류 |
| `r03_resolution_medical_hold` | 후보 정산: 진료태그 접근 기록은 보류함에 남김 |
| `r03_resolution_mixed` | 후보 정산: 보급태그 {supply_approved}/{supply_total}, 통행태그 {passage_approved}/{passage_total} 승인 |
| `r03_resolution_none` | 후보 정산: 승인 가능한 후보 없음 |

---

## 6. 정산 사유

| key | 문구 | 연결 이벤트 |
|---|---|---|
| `r03_reason_label_transfer` | 정산 사유: 라벨을 적 웨이브에 잘못 붙였습니다. | `label_transferred` |
| `r03_reason_route_bypass` | 정산 사유: 분류 경로를 우회했습니다. | `route_bypassed` |
| `r03_reason_locker_opened` | 정산 사유: 미수령 보관함을 회수했습니다. | `locker_opened` |
| `r03_reason_locker_left` | 정산 사유: 미수령 보관함 기록을 남겼습니다. | `locker_left` |
| `r03_reason_drone_misdirected` | 정산 사유: 반송 드론이 다른 대상을 검사했습니다. | `drone_misdirected` |
| `r03_reason_hold_used` | 정산 사유: 보류 스탬프로 판정을 늦췄습니다. | `hold_used` |
| `r03_reason_medical_seed` | 정산 사유: 처방 기록이 배송 상태로 섞였습니다. | `r02_seed_found` |
| `r03_reason_return05_seed` | 정산 사유: 수취인 확인 실패 기록을 보관했습니다. | `return05_seed_found` |

---

## 7. 다음 출격 변화

| key | 문구 |
|---|---|
| `r03_next_drone_recheck` | 다음 출격 변화: 반송 드론이 같은 유도 방식을 재검사합니다. |
| `r03_next_locker_residue` | 다음 출격 변화: 남긴 보관함 번호가 야드 안내판에 남습니다. |
| `r03_next_rail_shift` | 다음 출격 변화: 자동 분류 레일의 방향 전환이 빨라집니다. |
| `r03_next_hold_review` | 다음 출격 변화: 보류 스탬프 사용 기록이 다시 조회됩니다. |
| `r03_next_compression_pressure` | 다음 출격 변화: 압축 경고선이 더 이른 구간에 표시됩니다. |
| `r03_next_r02_seed` | 다음 출격 변화: 처방 기록과 목적지 기록이 분리 보관됩니다. |

---

## 8. 보급소 요약

| key | 문구 |
|---|---|
| `r03_supply_title` | 침묵 보급소 |
| `r03_supply_tag_summary` | 태그 보급{보급태그_count} 통행{통행태그_count} 진료기록{진료기록_count} |
| `r03_supply_allocation` | 보급태그는 물자 칸, 통행태그는 레일 우회 기록, 진료태그 기록은 보류함 |
| `r03_supply_reaction_mina` | 반응: 미나가 물자와 목적지 기록을 따로 묶었습니다. |
| `r03_supply_board_l02` | 게시판: R03-L02 자동 분류장 재검사 경로가 열렸습니다. |
| `r03_supply_board_l03_seed` | 게시판: 보증 심사 창고 입구 신호만 감지됩니다. |
| `r03_supply_goal_l01` | 목표: R03-L01에서 라벨 판정 회피 |
| `r03_supply_goal_l02` | 목표: R03-L02에서 드론 재검사 회피 |
| `r03_supply_clause` | 약관: 수취/반송 판정 보류와 보관 기한 재검사 |

---

## 9. 보급소 로그

| key | 문구 |
|---|---|
| `r03_log_yunseo_address` | 윤서: 이름이랑 주소는 따로 둬. |
| `r03_log_yunseo_stamp` | 윤서: 찍힌다고 전부 내 물건은 아니야. |
| `r03_log_seven_drone` | 세븐: 반송 드론이 실수를 학습했습니다. 기분 나쁘게 성실하군요. |
| `r03_log_mina_supply` | 미나: 물자는 들어왔고 기록은 따로 줄 섰어. |
| `r03_log_return05_seed` | 미확인 수취인 기록이 보류함에 남아 있습니다. |
| `r03_log_r02_seed` | 처방 기록은 보급품이 아니라 접근 조건으로 분리했습니다. |

---

## 10. 보급소 액션 버튼

| key | 버튼 문구 | 사용 |
|---|---|---|
| `r03_action_supply_allocate` | 보급태그 임시 배분 | 물자 안정 |
| `r03_action_passage_hold` | 통행태그 후보 보류 | 레일 우회 기록 보관 |
| `r03_action_record_split` | 목적지 기록 분리 | RETURN-05 과노출 방지 |
| `r03_action_medical_record_hold` | 진료 기록 보류 | R02 씨앗 보관 |
| `r03_action_locker_label` | 보관함 잔향 라벨링 | 다음 런 번호 추적 |
| `r03_action_drone_review` | 드론 재검사 기록 보기 | 반복 반응 확인 |

---

## 11. 짧은 현장 문구

| key | 문구 |
|---|---|
| `r03_field_label_applied` | 라벨이 붙었습니다. |
| `r03_field_route_adjusted` | 경로가 다시 계산됩니다. |
| `r03_field_hold` | 판정 보류. 아주 잠깐입니다. |
| `r03_field_drone_scan` | 반송 드론이 대상을 확인합니다. |
| `r03_field_locker_left` | 보관함 기록을 남겼습니다. |
| `r03_field_compression_warn` | 압축 경고선 접근. 오늘 고객님의 모양은 접지 않습니다. |

---

## 12. UI 압축 기준

| 화면 | 기준 |
|---|---|
| 결과 화면 | 12줄 이하, 핵심 정산 우선 |
| 보급소 요약 | 9줄 이하 |
| 보급소 로그 | 1줄 우선 |
| 버튼 | 1줄 표시 |
| 씨앗 | RETURN-05/R02는 정식 해금처럼 보이지 않게 짧게 |

---

## 13. 금지 문구 방향

```text
사람을 물건이라고 조롱하는 표현.
윤서가 자기 과거를 설명하는 긴 독백.
RETURN-05가 이미 동료처럼 말하는 문구.
R02가 병원 악당처럼 보이는 문구.
라벨/송장/보관함을 태그 자원처럼 부르는 문구.
```

---

## 14. 최종 결론

R03 UI 문구는 친절하게 설명하기보다 "정산표가 이상하게 성실하다"는 감각이 맞다.

좋은 문구:

```text
보류했습니다.
분리했습니다.
재검사합니다.
아직 수취인을 찾는 중입니다.
```

나쁜 문구:

```text
세계관을 설명합니다.
윤서의 비밀을 공개합니다.
다음 동료가 곧 합류합니다.
```
