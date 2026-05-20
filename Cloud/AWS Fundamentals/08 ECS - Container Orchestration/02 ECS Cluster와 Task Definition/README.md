# 08 ECS - Container Orchestration / 02 ECS Cluster와 Task Definition

ECS(Fargate) 배포를 위해 Cluster와 Task Definition을 구성한다. ECR Image를 기준으로 실행 설정을 정의하고, execution role과 task role의 책임을 분리해 이해한다.

## What you will learn

- ECS Cluster, Task, Service가 나뉘는 이유와 역할
- Task Definition의 핵심 구성(Image, Port, CPU/Memory, Logs, Env)
- Task execution role과 task role의 차이와 적용 위치
- Fargate의 `awsvpc` 네트워크 모델(ENI, Subnet, Security Group)

## Examples

- `lab23` -> Fargate Cluster 생성, Task Definition 작성, Role/Logs 설정, (선택) 1회 실행 검증

## Reference

- Draft: `.cursor/draft/08.02.notion.cursor.md`
- Notion: [Notion 문서]()
