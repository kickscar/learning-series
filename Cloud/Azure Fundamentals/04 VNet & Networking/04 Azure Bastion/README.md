# 04 VNet & Networking / 04 Azure Bastion

앞 NSG에서 22를 열 수 있지만 — 관리 포트를 인터넷에 여는 것 자체가 노출이다. Public IP·포트 노출 없이 사설 IP로 접속하는 Azure Bastion을 두 배포 방식(Developer SKU vs 전용)으로 다루고, 이 시리즈가 왜 무료 Developer SKU를 기본으로 삼는지 정리한다.

## What you will learn

- 왜 Bastion인가 — NSG로 22를 열 수 있어도 인터넷 노출은 공격 표면. 격리는 22를 닫아서가 아니라 **Public IP가 없어서** 성립
- Azure Bastion — 노출 0으로 RBAC 통제 접속. AWS 대응 = **EC2 Instance Connect Endpoint**(SSM 아님)
- 두 배포 방식 — Developer SKU(공유 풀·무료·서브넷 불필요·1 VM) vs 전용(`AzureBastionSubnet`·과금·다중·피어링)
- 시리즈 POV — immutable·VMSS(cattle) 지향이라 개별 SSH가 줄어듦 → Developer SKU 기본

## Lab

- **lab06: Private VM + Bastion 접속·격리 확인** (`rg-lab06`)
  - Private Subnet에 Public IP 없는 VM → 직접 SSH 불가 → Developer Bastion 브라우저 접속(서브넷·전용 리소스·비용 0) → `ping 8.8.8.8` 실패로 완전 격리 확인 (→ 05 NAT가 아웃바운드만 연다)

## Reference

- Draft: `.claude/draft/04.04.claude.notion.md`
- Notion: [Notion 문서]()
