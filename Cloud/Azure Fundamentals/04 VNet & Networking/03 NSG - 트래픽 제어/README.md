# 04 VNet & Networking / 03 NSG - 트래픽 제어

Azure의 방화벽 NSG(Network Security Group)를 이해하고, 직접 만들어 서브넷에 붙여 트래픽을 통제하는 섹션. 규칙으로 트래픽이 열리고 막히는 것을 눈으로 확인한다.

## What you will learn

- NSG — stateful 트래픽 필터(리턴 자동 허용), 우선순위·소스/대상·포트·액션
- 서브넷 vs NIC 이중 레이어 — 둘 다 평가(교집합), 하나라도 막으면 차단
- AWS 비교 — NSG = Security Group(stateful/NIC) + Network ACL(stateless/subnet)을 하나로
- `DenyAllInbound`(65500) 기본 규칙 → 낮은 번호로 Allow 명시
- 네트워크 먼저 — VNet·Subnet·PIP를 직접 만들고 VM을 그 안에 배치(Ch03 자동이름 → Ch04 직접명명 반전)

## Examples

- `lab08` → **네트워크 먼저**(`vnet-lab08`·`snet-lab08-pub`·`pip-lab08` 직접 생성) → `vm-lab08-web`을 그 서브넷에 배치(기존 선택·NIC NSG None) → `nsg-lab08-snet`으로 SSH 22·HTTP 80 허용 → nginx+Azure 페이지 → **Deny-HTTP-80 토글로 페이지가 사라졌다 돌아오는 것**(SSH는 그대로) 확인
- `lab08/index.html` — nginx로 배포하는 Azure 테마 정적 페이지(외부 의존 없음)

## Reference

- Draft: `.claude/draft/04.03.claude.notion.md`
- Notion: [Notion 문서]()
