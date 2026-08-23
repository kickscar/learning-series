# 04 VNet & Networking / 04 Azure Bastion

앞 NSG에서 22를 열 수 있지만 — 관리 포트를 인터넷에 여는 것 자체가 노출이다. Public IP·포트 노출 없이 사설 IP로 접속하는 Azure Bastion을 다룬다. **전용 배포로 원리를 잡고**, 우리가 쓰는 **Developer(serverless 추상화)**로 실습한다.

## What you will learn

- 왜 Bastion인가 — NSG로 22를 열 수 있어도 인터넷 노출은 공격 표면. 격리는 22를 닫아서가 아니라 **Public IP가 없어서** 성립
- Azure Bastion — 노출 0으로 RBAC 통제 접속. AWS 대응 = **EC2 Instance Connect Endpoint**(SSM 아님)
- **전용(원형)** — 호스트가 `AzureBastionSubnet`(내 VNet 안 실제 서브넷)에 **상주** → 소스가 VNet IP → NSG가 VirtualNetwork로 자연 평가 → `AllowVnetInBound` 통과. *미공개 0, 전부 docs로 설명됨*
- **Developer(우리가 쓰는 것)** — 호스트를 MS 공유 풀로 들어내고 RG엔 **설정 핸들**만(컴퓨팅·서브넷·IP·과금 0, 무료). **SDN이 공유풀 트래픽을 VirtualNetwork로 취급** → 전용과 **같은 보안 모델**(세부 배관만 MS 미공개)
- Bastion은 *진짜 인바운드 SSH*라 subnet NSG를 **실제로 거친다**(우회 아님) — AWS SSM(agent 아웃바운드)과 결정적 차이
- 시리즈 POV — immutable·VMSS(cattle) 지향이라 개별 SSH 줄어듦 → Developer 기본. NSG는 **subnet에**, **22는 손으로 안 연다**(`AllowVnetInBound`로 충분, 명시 개방은 PIP 붙으면 노출 위험)

## Lab

- **lab09: Private VM + Bastion 접속·격리 확인** (`rg-lab09`)
  - Private Subnet(`nsg-lab09-snet`·기본규칙·NIC None)에 Public IP 없는 VM → 직접 SSH 불가 → Developer Bastion 브라우저 접속(전용 호스트·PIP·비용 0, RG엔 설정 핸들 리소스 생성)
  - **NSG가 Bastion을 평가함을 증명**: `Deny-22` 추가 → Bastion 끊김 → 삭제 → 다시 붙음(우회 아님, subnet 정책 안)
  - `ping 8.8.8.8` 실패로 완전 격리 확인 (→ 05 NAT가 아웃바운드만 연다)

## Reference

- Draft: `.claude/draft/04.04.claude.notion.md`
- Notion: [Notion 문서]()
