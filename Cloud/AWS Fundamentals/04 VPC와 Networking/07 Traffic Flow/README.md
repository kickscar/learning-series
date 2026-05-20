# 04 VPC와 Networking / 07 Traffic Flow

VPC 네트워크에서 패킷이 통과하는 7단계 흐름(Internet -> IGW -> Route Table -> NACL -> Subnet -> SG -> Compute)을 종합해, 연결 장애를 구조적으로 트러블슈팅하는 기준선을 만든다. Chapter 마지막 Section으로 `Lab: Gallery - Custom VPC 이전`을 포함한다.

## What you will learn

- 7단계 Traffic Flow 모델과 각 단계의 차단 포인트
- Public Subnet과 Private Subnet의 경로 차이(IGW vs NAT)
- SG/NACL/Route Table/IGW/NAT 관점의 트러블슈팅 순서

## Gallery Project

- `Lab: Gallery - Custom VPC 이전` -> Gallery 실행 환경을 Custom VPC로 이전(Private 배치 + Session Manager 내부 검증)하고 다음 Chapter(ALB)로 연결

## Reference

- Draft: `.cursor/draft/04.07.notion.cursor.md`
- Notion: [Notion 문서]()
