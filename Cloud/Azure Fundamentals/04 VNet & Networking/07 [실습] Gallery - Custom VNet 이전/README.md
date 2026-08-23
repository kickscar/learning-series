# 04 VNet & Networking / 07 [실습] Gallery - Custom VNet 이전

Ch03에서 Public IP에 앱·관리 포트를 모두 개방한 Gallery를, Ch04 네트워크 위에 다시 구성하여 외부 노출을 제거하는 Ch04 마지막 실습. `rg-gallery`를 리소스 그룹 단위로 삭제하고 같은 앱을 Private Subnet + Bastion + NAT + NSG 위에 배포한다(개별 자원 삭제 없이 RG 단위로 재구성). 수동 배포의 `apt`·`maven` 아웃바운드가 NAT 없이는 타임아웃되는 것으로 네트워크 동작을 확인한다. 앱은 실행되지만 외부에서 접근할 수 없는 상태로 Ch05로 넘긴다.

## What you will learn

- 외부 전면 노출 → 사설 구성 — Private Subnet(Public IP 없음) + NSG + NAT + Bastion을 Gallery에 적용
- **NAT 확인** — 수동 배포의 `apt`·`git`·`maven` 아웃바운드가 `ng-gallery`(NAT) 없이는 타임아웃
- Ch04 구성 요소 넷(Public IP 없음·NSG·NAT·Bastion)을 한 워크로드에 적용하여 `priv`가 나타내는 '외부 노출 없는 사설 워크로드'를 구현 (thread 서사는 "흐름 정리"에서 종결, 여기서는 복습)
- 8080을 개방해도 외부 진입 경로가 없어 접근 불가 → Ch05 Load Balancer 브릿지

## Examples

- `rg-gallery` 삭제 후 재생성 → `vnet-gallery`(pub 예약/priv), `ng-gallery`(NAT), `nsg-gallery-web`, Public IP 없는 `vm-gallery-web`(`snet-gallery-priv`)에 앱 배포 → `curl localhost:8080` UP, 외부 접근 불가

## Reference

- Draft: `.claude/draft/04.07.claude.notion.md`
- Notion: [Notion 문서]()
