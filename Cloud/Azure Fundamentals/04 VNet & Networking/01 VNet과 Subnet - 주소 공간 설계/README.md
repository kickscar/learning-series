# 04 VNet & Networking / 01 VNet과 Subnet - 주소 공간 설계

Azure 네트워크를 직접 설계하기 시작하는 섹션. VNet의 주소 공간(CIDR)과 서브넷을 이해하고, VNet 하나에 공개·사설 두 서브넷을 만든다. Ch03의 VM중심(자동이름)에서 네트워크중심(직접 명명)으로 워크플로가 반전되는 출발점.

## What you will learn

- VNet — Azure 사설 네트워크 경계(AWS VPC 대응), CIDR 주소 공간
- Subnet — VNet 쪼개기, 서브넷당 IP 5개 예약(`/24` = 251 사용), 특수 서브넷(GatewaySubnet·AzureBastionSubnet)
- 라우팅 — System Routes(암묵적, 오브젝트 없음)와 UDR
- 여기부터 네이밍은 우리 규칙(`vnet-lab09`, `snet-lab09-public/private`, type-first)

## Examples

- `lab09` → `rg-lab09`에 `vnet-lab09`(10.10.0.0/16), `snet-lab09-public`(10.10.1.0/24)·`snet-lab09-private`(10.10.2.0/24) 생성

## Reference

- Draft: `.claude/draft/04.01.claude.notion.md`
- Notion: [Notion 문서]()
