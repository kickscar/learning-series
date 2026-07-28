# 04 VNet & Networking / 08 [실습] Gallery: Custom VNet 이전

골든 이미지(03.06)와 Ch04 네트워크를 합류시키는 Ch04 피날레. Gallery를 Custom VNet의 Private Subnet에 골든 이미지로 재생성(수동 재배포 0)하고, NAT Gateway로 아웃바운드만 연다. 앱은 도는데 외부에서는 못 닿는 상태로 Ch05에 넘긴다.

## What you will learn

- 골든 이미지로 Gallery 재생성 — `img-gallery-web`에서 `vm-gallery-web` 스핀업, 앱 이미 구워짐(재배포 0)
- Ch04 격리 적용 — Private Subnet(Public IP 없음) + NAT GW(아웃바운드) + Bastion(접속)
- generalized 이미지 → 새 관리자 계정·키 지정
- 외부 접속 불가 → Ch05 Load Balancer 브릿지

## Examples

- `rg-gallery`에 `vnet-gallery`(Public/Private), `ng-gallery`, `img-gallery-web`에서 `vm-gallery-web`(`snet-gallery-private`, Public IP 없음). `systemctl status gallery` = active, 외부 접속 불가

## Reference

- Draft: `.claude/draft/04.08.claude.notion.md`
- Notion: [Notion 문서]()
