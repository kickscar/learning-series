# 05 Traffic Management & High Availability / 05 Azure Application Gateway

L7 Application Gateway를 만들어 HTTP 요청을 웹 VM에 분산하는 실습(lab13). LB(L4)와 리소스 모델·동작 방식의 차이를 확인한다.

## What you will learn

- AGW = L7 리버스 프록시 — 요청 내용(URL·호스트)을 읽어 라우팅
- 구성 요소 — Listener·Routing Rule·Backend Pool·Backend Settings
- LB와 차이 — 전용 서브넷 필수, 리버스 프록시라 백엔드는 VNet 소스(NSG에 `Internet` 불필요)
- L7 라우팅(path/host), SSL 종료, WAF(`WAF_v2` + WAF Policy), v1 은퇴(2026-04-28)

## Lab

- **lab13: Application Gateway 기본 구성** (`rg-lab13`)
  - VNet(`snet-lab13-web` + AGW 전용 `snet-lab13-agw`) → VM 2대(nginx) → `Standard_v2` AGW → 분산 확인

## Reference

- Draft: `.claude/draft/05.05.claude.notion.md`
- Notion: [Notion 문서]()
