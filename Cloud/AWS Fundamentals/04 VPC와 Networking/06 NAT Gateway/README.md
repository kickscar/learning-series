# 04 VPC와 Networking / 06 NAT Gateway

NAT Gateway로 Private Subnet 인스턴스의 Outbound를 열고, NAT가 Inbound를 열지 않는다는 점을 실습으로 확인한다. NAT가 생기면 VPC Endpoint 없이도 Session Manager(SSM)가 동작할 수 있다는 관점까지 정리하고, 외부 엔드포인트는 다음 Chapter(ALB)로 연결한다.

## What you will learn

- NAT Gateway가 Private Subnet에 필요한 이유(Outbound만 허용)
- NAT Gateway 구성 요소(Public Subnet 배치, Elastic IP)
- Private Route Table의 0.0.0.0/0 Target이 NAT Gateway가 되는 구조
- NAT Gateway 비용 특성과 자원 정리 기준

## Examples

- `lab16` -> NAT Gateway(EIP) 생성, Private Route Table 구성, Private EC2에서 Outbound 확인 및 NAT의 Inbound 제한 확인

## Reference

- Draft: `.cursor/draft/04.06.notion.cursor.md`
- Notion: [Notion 문서]()
