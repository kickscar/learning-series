# Ch07 환경 분리 / [실습] Gallery: dev/prod 환경 분리

Ch05 Gallery(ALB + ASG, 3-Layer 모듈)를 디렉토리 기반으로 dev/prod 환경 분리한다. 모듈 코드는 공유하고, 환경별 차이는 terraform.tfvars로만 표현한다.

## What you will learn

- 디렉토리 기반 환경 분리를 실제 Gallery 인프라에 적용
- 환경별 `terraform.tfvars`로 instance_type, ASG 용량 차별화
- S3 Backend key prefix로 환경별 State 분리
- 환경 디렉토리를 "얇게" 구성하는 패턴 (모듈 호출 + 변수 주입만)
- 독립 배포·독립 destroy 확인

## Reference

- Notion: [Notion 문서]()
