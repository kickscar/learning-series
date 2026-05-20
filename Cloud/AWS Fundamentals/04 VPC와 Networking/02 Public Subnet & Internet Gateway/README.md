# 04 VPC와 Networking / 02 Public Subnet & Internet Gateway

IGW(Internet Gateway)와 Route Table을 사용해 Public Subnet의 인터넷 경로를 완성한다. "인터넷 관문 개방"의 의미를 라우팅과 Public IPv4 조건으로 체감한다.

## What you will learn

- IGW가 VPC의 인터넷 관문이라는 의미
- Public Route Table의 인터넷 라우트(0.0.0.0/0 -> IGW) 구성
- Subnet association으로 Public Subnet 경로를 확정하는 방식
- Public Subnet의 조건(0.0.0.0/0 -> IGW, Public IPv4)

## Examples

- `lab12` -> IGW 생성/attach, Public Route Table 구성, Subnet association, Public Subnet EC2로 인터넷 통신 검증

## Reference

- Draft: `.cursor/draft/04.02.notion.cursor.md`
- Notion: [Notion 문서]()
