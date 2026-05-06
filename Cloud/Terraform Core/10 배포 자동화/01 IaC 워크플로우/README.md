# Ch10 배포 자동화 / 01 IaC 워크플로우

IaC 파이프라인의 전체 그림(4 역할: Quality, Review, Deploy, Monitor)을 이해하고, 핵심 워크플로우 2개(`review.yml`, `deploy.yml`)를 직접 만들어본다. AWS 없이 GitHub Actions 메커니즘 자체를 체험한다.

## What you will learn

- 수동 apply의 위험 — State 충돌, 무단 변경, 감사 추적 부재
- IaC 파이프라인 4가지 역할: Quality, Review, Deploy, Monitor
- GitHub Actions 기초: Workflow, Trigger, Job, Step, Runner
- `review.yml` — PR 생성 시 `terraform plan` 자동 실행
- `deploy.yml` — main merge 시 `terraform apply` 자동 ��행

## Examples

- `lab01` → Review 워크플로우: `review.yml` 작성, pull_request trigger, plan 실행 확인
- `lab02` → Deploy 워크플로우: `deploy.yml` 작성, push trigger, apply 실행 확인

## Reference

- Notion: [Notion 문서](https://www.notion.so/05-IaC-34edc703ccda802dbb8cf6cc91e2b257?source=copy_link)
