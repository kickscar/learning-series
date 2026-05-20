# 04 VPC와 Networking / 01 VPC와 Subnet - CIDR & Route Table

VPC(Virtual Private Cloud)와 Subnet을 "배포 가능한 네트워크 경계" 관점에서 정리한다. `lab11`에서 Custom VPC(`10.0.0.0/16`)와 2AZ에 Public/Private Subnet 4개를 생성해, 이후 라우팅/보안 경계를 쌓아갈 기반을 만든다.

## What you will learn

- VPC가 의미하는 네트워크 경계(Region 단위)와 기본 리소스(Main Route Table 등)
- CIDR로 VPC/Subnet 주소 공간을 설계하는 방식
- Subnet의 AZ 제약과 Multi-AZ 배치 전략
- Route Table(local route, Main Route Table, Subnet association)의 의미
- Public/Private Subnet이 라우팅으로 결정된다는 전제(인터넷 경로는 04.02에서 구성)
- Default VPC와 Custom VPC의 차이와 실무 관점의 이유

## Examples

- `lab11` → Custom VPC 생성, Public Subnet 2개 + Private Subnet 2개(2AZ) 생성

## Reference

- Draft: `.cursor/draft/04.01.notion.cursor.md`
- Notion: [Notion 문서]()
