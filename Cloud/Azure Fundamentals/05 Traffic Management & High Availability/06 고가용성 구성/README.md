# 05 Traffic Management & High Availability / 06 고가용성 구성

Availability Set과 Availability Zone의 차이를 이해하고, Zone에 VM을 분산 배포해 데이터센터 장애에도 서비스가 유지되는 것을 확인하는 실습(lab15).

## What you will learn

- Fault Domain·Update Domain — "함께 죽는 단위"를 쪼개기
- Availability Set(데이터센터 내 랙 분산, SLA 99.95%) vs Availability Zone(데이터센터 분산, SLA 99.99%)
- Zone-redundant Standard LB — 한 Zone 장애에도 트래픽 유지
- Zone 장애 시뮬레이션(VM 중지)으로 전환 확인

## Lab

- **lab15: Availability Zone VM 분산 배포** (`rg-lab15`)
  - Zone 1 / Zone 2 VM → zone-redundant LB → Zone 장애 시뮬레이션

## Reference

- Draft: `.claude/draft/05.06.claude.notion.md`
- Notion: [Notion 문서]()
