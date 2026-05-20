# 04 VPC와 Networking / 04 Traffic Control II - Network ACL

Network ACL(NACL)을 Subnet 경계의 stateless 트래픽 제어로 이해한다. SG는 허용한 상태에서 NACL로 차단해, 범위와 특성 차이를 "실험용"으로 체감한다.

## What you will learn

- NACL이 Subnet 수준의 stateless 방화벽이라는 의미
- Allow/Deny와 규칙 번호 평가(첫 매칭)
- SG(ENI/stateful)와 NACL(Subnet/stateless)의 범위 차이
- 실무 관점에서 NACL을 언제 쓰는지(추가 방어선)

## Examples

- `lab14` -> SG 허용 상태에서 NACL Deny로 SSH/ICMP를 차단하고 복구

## Reference

- Draft: `.cursor/draft/04.04.notion.cursor.md`
- Notion: [Notion 문서]()
