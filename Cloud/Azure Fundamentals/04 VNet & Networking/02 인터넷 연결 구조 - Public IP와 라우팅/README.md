# 04 VNet & Networking / 02 인터넷 연결 구조 - Public IP와 라우팅

Azure가 인터넷 연결을 어떻게 처리하는지 잡는 이론 섹션. AWS와 달리 Internet Gateway 리소스가 없고 시스템 라우트로 암묵 연결되며, Public IP를 붙이면 양방향이 열린다. "그냥 되던" 기본 아웃바운드가 폐지되는 흐름까지 짚는다.

## What you will learn

- Azure엔 IGW 없음 — 시스템 라우트에 인터넷 경로 암묵 존재 (AWS는 IGW+라우트 조립)
- Public IP(Standard·Static) = 인바운드+아웃바운드, 인바운드는 secure by default(NSG로 열기)
- Basic SKU Public IP 은퇴(2025-09-30) → Standard만
- 기본 아웃바운드 접근 폐지(신규 VM, 2026-03-31 이후 API) → 명시적 아웃바운드(Public IP·NAT GW·LB)

## Reference

- Draft: `.claude/draft/04.02.claude.notion.md`
- Notion: [Notion 문서]()
