# 04 VNet & Networking / 04 Azure Bastion

앞 NSG에서 22를 열 수 있지만 — 관리 포트를 인터넷에 여는 것 자체가 노출이다. Public IP·포트 노출 없이 사설 IP로 접속하는 Azure Bastion을 두 배포 방식(Developer SKU vs 전용)으로 다루고, 이 시리즈가 왜 무료 Developer SKU를 기본으로 삼는지 정리한다.

## What you will learn

- 왜 Bastion인가 — NSG로 22를 열 수 있어도 인터넷 노출은 공격 표면. 격리는 22를 닫아서가 아니라 **Public IP가 없어서** 성립
- Azure Bastion — 노출 0으로 RBAC 통제 접속. AWS 대응 = **EC2 Instance Connect Endpoint**(SSM 아님)
- 두 배포 방식 — Developer SKU(공유 풀·무료·서브넷 불필요·1 VM) vs 전용(`AzureBastionSubnet`·과금·다중·피어링)
- 시리즈 POV — immutable·VMSS(cattle) 지향이라 개별 SSH가 줄어듦 → Developer SKU 기본
- NSG는 **subnet에**(not both·MS 권장) — 기본 규칙(`DenyAllInbound`+`AllowVNetInBound`)이 곧 사설 정책. **22는 손으로 안 연다**(Bastion은 VNet 기본으로 통과, 명시 개방은 PIP 붙으면 노출 위험)
- **Bastion Developer 실체**(실험+문서로 확정) — VNet **내부**에 놓이는 **비전용 리소스**(RG에 생성·상주), 백엔드는 MS 공유 풀. *진짜 인바운드 SSH*라 subnet NSG를 **실제로 거친다**(우회 아님). AWS SSM(agent 아웃바운드·포트 0)과 결정적 차이

## Lab

- **lab09: Private VM + Bastion 접속·격리 확인** (`rg-lab09`)
  - Private Subnet(`nsg-lab09-priv`·기본규칙·NIC None)에 Public IP 없는 VM → 직접 SSH 불가 → Developer Bastion 브라우저 접속(전용 호스트·PIP·비용 0, 비전용 Bastion 리소스는 RG에 자동 생성) → `ping 8.8.8.8` 실패로 완전 격리 확인 (→ 05 NAT가 아웃바운드만 연다)

## Reference

- Draft: `.claude/draft/04.04.claude.notion.md`
- Notion: [Notion 문서]()
