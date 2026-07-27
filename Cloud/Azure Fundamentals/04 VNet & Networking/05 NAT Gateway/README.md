# 04 VNet & Networking / 05 NAT Gateway

lab11에서 격리된 VM의 아웃바운드만 여는 섹션. NAT Gateway는 outbound 전용(응답만 통과)이라 격리를 유지하며 나가는 길만 연다. 나가기(NAT GW)와 들어오기(Public IP/LB)가 별개 조각임을 확인한다.

## What you will learn

- NAT Gateway — 아웃바운드 전용 SNAT(밖에서 먼저 오는 연결 차단, 응답만 통과)
- 구성 — `ng` + Public IP(SNAT 64,512포트/IP, Prefix로 확장) + 서브넷 연결(VM 전부 자동)
- 우선순위 — 기본/LB 아웃바운드보다 우선. AWS NAT Gateway와 동일
- 인바운드는 NAT GW가 아니라 Public IP/LB의 몫

## Examples

- `lab12` → `rg-lab12`에 `ng`+`pip-ng` 생성, `snet-private` 연결, `ping 8.8.8.8` 성공(lab11 대비)·VM은 Public IP 없음 확인

## Reference

- Draft: `.claude/draft/04.05.claude.notion.md`
- Notion: [Notion 문서]()
