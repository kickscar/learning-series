# 04 VNet & Networking / 07 [실습] Gallery - Custom VNet 이전

Ch03의 순진하게 노출된 Gallery를 Ch04 네트워크로 **잠그는** 피날레. 새 VM을 Custom VNet의 Private Subnet에 만들고 Bastion으로 들어가 손으로 재배포한다. 초점은 **네트워크가 눈에 보이는 것** — 수동 배포의 apt·maven이 NAT 없으면 멈춘다(NAT 증명). 앱은 도는데 외부에선 못 닿는 상태로 Ch05에 넘긴다.

## What you will learn

- 순진 노출 → 사설 잠금 — Private Subnet(Public IP 없음) + NSG + NAT + Bastion을 Gallery에 총동원
- **NAT 증명** — 수동 배포의 `apt`·`git`·`maven` 아웃바운드가 `ng-gallery`(NAT) 없으면 타임아웃 = 네트워크가 눈에 보임
- subnet-policy 워크로드 완성체(절반) — `priv` 이름을 자원들(PIP없음·NSG·NAT·Bastion)이 다 함께 실현
- 8080 열어도 진입점 없어 외부 접속 불가 → Ch05 Load Balancer 브릿지

## Examples

- `rg-gallery`에 `vnet-gallery`(pub 예약/priv), `ng-gallery`(NAT), `nsg-gallery-web`. `vm-gallery-web`(`snet-gallery-priv`, Public IP 없음) 수동 배포 → `curl localhost:8080` UP, 외부 접속 불가

## Reference

- Draft: `.claude/draft/04.07.claude.notion.md`
- Notion: [Notion 문서]()
