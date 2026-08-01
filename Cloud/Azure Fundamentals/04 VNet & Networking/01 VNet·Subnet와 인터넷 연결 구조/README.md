# 04 VNet & Networking / 01 VNet·Subnet와 인터넷 연결 구조

Azure 네트워크를 직접 설계하기 시작하는 섹션. VNet·Subnet의 주소 공간(CIDR)부터 그 안이 인터넷과 어떻게 오가는지까지 한 흐름으로 본다(서브넷 생성 화면이 아웃바운드 결정을 함께 묻기에 둘을 합쳐 다룬다). Ch03의 VM중심(자동이름)에서 네트워크중심(직접 명명)으로 워크플로가 반전되는 출발점.

## What you will learn

- VNet — Azure 사설 네트워크 경계(AWS VPC 대응), CIDR 주소 공간
- Subnet — VNet 쪼개기, 서브넷당 IP 5개 예약(`/24` = 251 사용), 특수 서브넷(GatewaySubnet·AzureBastionSubnet)
- 라우팅 — System Routes(암묵적, 오브젝트 없음)와 UDR
- 인터넷 연결 — Azure엔 IGW가 없다(암묵 라우팅), Public IP=인바운드·아웃바운드 양방향, 기본 아웃바운드 폐지 → `프라이빗 서브넷`
- **subnet에는 public/private 타입이 없다** — 서브넷은 정책 스코프일 뿐, `pub`/`priv`는 배치(PIP)·NSG·NAT로 실현하는 정책 라벨 (Ch04~05·고가용성 관통 개념의 밑밥)
- 여기부터 네이밍은 우리 규칙(`vnet-lab07`, `snet-lab07-pub`/`snet-lab07-priv`, type-first)

## Examples

- `lab07` → `rg-lab07`에 `vnet-lab07`(10.10.0.0/16), `snet-lab07-pub`(10.10.1.0/24)·`snet-lab07-priv`(10.10.2.0/24) 생성 — **둘 다 `프라이빗 서브넷`(기본 아웃바운드 없음)** 이라 설정은 동일, 차이는 이름(정책 라벨)뿐

## Reference

- Draft: `.claude/draft/04.01.claude.notion.md`
- Notion: [Notion 문서]()
