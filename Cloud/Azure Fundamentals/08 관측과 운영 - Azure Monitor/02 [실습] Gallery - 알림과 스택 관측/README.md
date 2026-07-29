# 08 관측과 운영 - Azure Monitor / 02 [실습] Gallery: 알림과 스택 관측

Gallery 스택(AGW·VMSS·MySQL·Storage)을 티어별 핵심 신호로 관측하고, VMSS CPU에 Metric Alert + Action Group을 걸어 부하 시 이메일 알림을 확인하는 Ch08 대미.

## What you will learn

- 스택 티어별 핵심 신호 — 진입(Healthy Host) / 컴퓨트(CPU) / DB(Connections) / 스토리지(Transactions)
- 알림 = 조건(Metric Alert rule) + 액션(Action Group) 분리
- 부하 유발 → 알림 발동(Fired) → 이메일

## Lab (Gallery)

- `rg-gallery` 누적. 티어별 메트릭 → `ag-gallery`(이메일) → `alert-vmss-cpu`(CPU > 70%) → `stress-ng` → 알림 확인

## Reference

- Draft: `.claude/draft/08.02.claude.notion.md`
- Notion: [Notion 문서]()
