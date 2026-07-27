# 04 VNet & Networking / 06 Service Endpoint & Private Endpoint

VNet 밖 PaaS(Storage·Database 등)를 VNet에서 안전하게 쓰는 두 방식을 잡는 이론 섹션. Service Endpoint(public endpoint를 VNet으로 잠그기)와 Private Endpoint(PaaS를 VNet 안 private IP로)의 구조 차이를 비교한다. 실습은 Ch06/07에서.

## What you will learn

- PaaS는 VNet 밖 public endpoint — VNet에서 안전하게 쓰는 두 방식
- Service Endpoint — public endpoint 유지 + VNet/서브넷 제한(무료, 서브넷 범위, 온프렘 불가)
- Private Endpoint — VNet 내 private IP로 완전 격리(과금, VNet+온프렘, public 끄기). MS 권장
- 실습은 Ch06(Storage)·Ch07(Database)에서 수행

## Reference

- Draft: `.claude/draft/04.06.claude.notion.md`
- Notion: [Notion 문서]()
