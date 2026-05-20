# Ch07 환경 분리 / [실습] Gallery: 디렉토리 환경 분리

Ch05 Gallery(ALB + ASG, 3-Layer 모듈)를 `envs/dev/`, `envs/prod/` 디렉토리로 분리한다. 07.03의 디렉토리 기반 패턴을 실제 인프라에 적용한다.

## What you will learn

- 디렉토리 기반 환경 분리를 실제 Gallery 인프라에 적용
- 환경별 `terraform.tfvars`로 instance_type, ASG 용량 차별화
- 환경별 providers.tf에 backend key 직접 작성
- 환경 디렉토리를 "얇게" 구성하는 패턴 (모듈 호출 + 변수 주입만)
- 코드 이중화 단점을 체감한다

## Reference

- Notion: [Notion 문서](https://www.notion.so/04-Gallery-34edc703ccda8085b5c7c32a9f3b8cd2?source=copy_link)
