# 04 VNet & Networking / 04 Private Subnet 격리

Public IP 없는 VM의 격리를 실습으로 확인하는 섹션. 새 서브넷은 기본 private(`defaultOutboundAccess=false`)이라 인바운드·아웃바운드 모두 차단되고, 접속은 Bastion으로만 한다. 04.02의 "기본 아웃바운드 폐지"가 실물로 드러나는 곳.

## What you will learn

- Private Subnet — Public IP 없음(인바운드 차단) + 기본 private(아웃바운드 차단) = 양방향 단절
- Bastion 접속 — 인터넷 노출 0으로 관리 접속
- 아웃바운드가 필요하면 명시적으로 (NAT Gateway → §05)

## Examples

- `lab11` → `rg-lab11`의 `snet-lab11-private`에 Public IP 없는 `vm-lab11`, Bastion 접속, `ping 8.8.8.8` 실패로 격리 확인

## Reference

- Draft: `.claude/draft/04.04.claude.notion.md`
- Notion: [Notion 문서]()
