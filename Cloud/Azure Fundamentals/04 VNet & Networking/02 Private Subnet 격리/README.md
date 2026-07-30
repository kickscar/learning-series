# 04 VNet & Networking / 02 Private Subnet 격리

Public IP 없는 VM이 인터넷과 양방향으로 단절되는 "격리"를 정면으로 보는 **이론** 섹션. 새 서브넷은 기본 private(`defaultOutboundAccess=false`)이라 인바운드·아웃바운드 모두 막힌다. 격리에 통제된 구멍(NSG·Bastion·NAT)을 어떻게 뚫을지 로드맵을 제시한다.

## What you will learn

- 완전한 격리 — Public IP 없음(인바운드 차단) + 기본 private(아웃바운드 차단) = 양방향 단절
- **격리는 subnet이 아니라 자원이 만든다** — PIP 제거가 격리를 만들고, `priv` 이름은 그 약속을 서술 (subnet-policy thread)
- 격리에 뚫는 세 길 — 인바운드 허용은 NSG(다음), 노출 없는 접속은 Bastion, 아웃바운드는 NAT

## Reference

- Draft: `.claude/draft/04.02.claude.notion.md`
- Notion: [Notion 문서]()
