# 05 Traffic Management & High Availability / 02 Azure Load Balancer 구성

Standard Public Load Balancer를 직접 만들어 VM 2대에 트래픽을 분산하고, Health Probe가 죽은 VM을 빼는 것까지 확인하는 실습(lab13).

## What you will learn

- LB 네 요소의 실물 연결 — Frontend IP·Backend Pool·Health Probe·LB Rule
- Health Probe TCP vs HTTP(200 응답까지 확인), Probe 출처 `168.63.129.16`
- Standard LB secure by default — 백엔드 NSG에 `Internet` 소스 포트 80 규칙을 직접 추가
- LB Public IP 분산 확인 + VM 중지로 Health Probe 제외 동작

## Lab

- **lab13: Public Load Balancer 구성** (`rg-lab13`)
  - VNet·NSG → VM 2대(nginx, 호스트명 응답) → Standard Public LB → 분산·프로브 검증

## Reference

- Draft: `.claude/draft/05.02.claude.notion.md`
- Notion: [Notion 문서]()
