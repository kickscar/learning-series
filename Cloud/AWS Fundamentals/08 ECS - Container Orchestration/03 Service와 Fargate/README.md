# 08 ECS - Container Orchestration / 03 Service와 Fargate

ECS Service로 Task를 원하는 수로 유지하고, Fargate Task를 ALB(Target type IP) 뒤에 배치해 외부 접근 경로를 완성한다. Chapter 마지막 Section으로, Gallery 실행 환경을 EC2에서 ECS(Fargate)로 전환하는 프로젝트 Lab을 포함한다.

## What you will learn

- ECS Service(desired count, deployment, events)의 역할
- Fargate + ALB 연동 핵심(Target type IP, health check, SG)
- CloudWatch Logs로 배포/실행 상태를 확인하는 방법

## Examples

- `lab24` -> ECS Service 배포(Fargate, Private Subnet), Target Group(IP) 연결, ALB 접근 검증

## Gallery Project

- `Gallery: ECS(Fargate) 배포` -> Gallery 실행 환경을 EC2에서 Fargate로 전환(S3/RDS 연동 유지)

## Reference

- Draft: `.cursor/draft/08.03.notion.cursor.md`
- Notion: [Notion 문서]()
