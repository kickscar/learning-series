# 04 VNet & Networking / 03 NSG - 트래픽 제어

Azure의 방화벽 NSG(Network Security Group)를 이해하고, 직접 만들어 서브넷에 붙여 트래픽을 통제하는 섹션. 규칙으로 트래픽이 열리고 막히는 것을 눈으로 확인한다.

## What you will learn

- NSG — stateful 트래픽 필터(리턴 자동 허용), 우선순위·소스/대상·포트·액션
- 서브넷 vs NIC 이중 레이어 — 둘 다 평가(교집합), 하나라도 막으면 차단
- AWS 비교 — NSG = Security Group(stateful/NIC) + Network ACL(stateless/subnet)을 하나로
- `DenyAllInbound`(65500) 기본 규칙 → 낮은 번호로 Allow 명시

## Examples

- `lab10` → `rg-lab10`에 `nsg-lab10-web` 생성, SSH·HTTP 허용, `snet-lab10-public` 연결, Deny 규칙 토글로 차단 확인

## Reference

- Draft: `.claude/draft/04.03.claude.notion.md`
- Notion: [Notion 문서]()
