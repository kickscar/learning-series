# 04 VPC와 Networking / 05 Isolation - Private Subnet & VPC Endpoint

Private Subnet의 의미를 라우팅 관점에서 정리하고, 외부에서 직접 접속이 안 되는 격리를 실습으로 확인한다. 이어서 VPC Endpoint로 "Private Subnet 안에서 필요한 AWS 서비스에 연결"하는 방식을 만든다. 실습은 SSM(Session Manager)을 시나리오로 사용한다.

## What you will learn

- Public/Private의 본질이 라우팅(Target) 차이라는 점
- Private 전용 Route Table(local route only)로 격리를 만드는 관점
- Private Subnet이 필요한 이유(공격 표면 축소, 계층 분리)
- VPC Endpoint(Gateway/Interface)의 개념과 사용 시점
- Interface Endpoint의 핵심 포인트(Private DNS, Endpoint SG, Subnet/AZ 배치, EC2 inbound 없이도 동작하는 이유)

## Examples

- `lab15` -> Private Subnet 격리 확인, Interface VPC Endpoint로 SSM(Session Manager) 운영 접속 경로 구성

## Reference

- Draft: `.cursor/draft/04.05.notion.cursor.md`
- Notion: [Notion 문서]()
