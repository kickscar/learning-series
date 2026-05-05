# Day 07 — 환경 분리 & 대규모 아키텍처

> 시리즈 매핑: Ch07 (07.01~07.05 Gallery) + 브릿지

---

## 시간 1: Workspace 개념
- **시리즈**: 07.01
- **강의 포인트**: workspace = 동일 코드, 독립 State. default workspace. `${terraform.workspace}` 표현식. workspace별 State 저장 위치(local: `.tfstate.d/`, S3: `env:/`). workspace vs 디렉토리 방식 비교. workspace 한계.
- **전환**: "직접 workspace를 만들어보자"

## 시간 2: Lab — Workspace 실습
- **시리즈**: 07.02
- **실습**: dev/prod workspace 생성·전환, S3 State 경로 확인
- **강의 포인트**: `terraform workspace new/list/select/show`. workspace별 apply → 각각 독립 리소스. `${terraform.workspace}`로 Name 태그·instance_type 분기. S3 콘솔에서 `env:/dev/`, `env:/prod/` 경로 확인.
- **라이브 데모**: workspace 전환 → plan에서 리소스 전체가 새로 생성되는 것 확인

## 시간 3: 디렉토리 기반 환경 분리 — 구조
- **시리즈**: 07.03 (이론)
- **강의 포인트**: `envs/dev/`, `envs/prod/` 디렉토리. 공통 모듈 `../../modules/` 재사용. 환경별 `terraform.tfvars`, backend 분리(`backend-dev.hcl`). 실무에서 디렉토리 방식이 선호되는 이유(명확한 격리, 코드 리뷰 범위 제한).
- **전환**: "직접 구성해보자"

## 시간 4: Lab — 디렉토리 기반 dev/prod 환경 구성
- **시리즈**: 07.03 lab01
- **실습**: envs/dev, envs/prod 구성, 모듈 호출, 환경별 tfvars
- **강의 포인트**: 각 환경 독립 `init` → `apply`. 두 환경의 State가 완전 독립. 코드 수정 없이 tfvars만 바꿔서 환경 차이 표현.
- **라이브 데모**: dev apply → prod apply → AWS 콘솔에서 두 환경 리소스 동시 확인

## 시간 5: 변수 입력 전략 — tfvars, TF_VAR_*, sensitive
- **시리즈**: 07.04
- **실습**: 우선순위 실험, sensitive 마스킹
- **강의 포인트**: 변수 우선순위 체계. `terraform.tfvars`(공통), `-var-file`(환경별), `TF_VAR_*`(CI/CD, 보안), `default`(가이드라인). `sensitive = true` — CLI 마스킹, State 평문. `-raw`로 값 추출. sane defaults vs critical(no default).
- **라이브 데모**: 같은 변수를 tfvars + -var-file + -var로 동시 설정 → 마지막이 이기는 것 확인

## 시간 6: Gallery — dev/prod 환경 분리
- **시리즈**: 07.05 Gallery
- **실습**: Gallery 인프라 dev/prod 독립 분리
- **강의 포인트**: Day 6 Gallery(모듈화된 3-tier)를 디렉토리 방식으로 분리. dev(t3.micro) / prod(t3.small). 환경별 독립 State. "같은 모듈, 다른 설정, 독립 인프라."
- **전환**: "인프라 완성. 남은 건 운영과 자동화"

## 시간 7: 대규모 아키텍처
- **시리즈**: 기존 강의 Day 7~8
- **강의 포인트**: 구현할 Architecture 구성도 소개. VPC/Subnet/IGW/NAT → EC2/ALB/ASG → RDS/S3. 주요 부분별 고려 사항. Day 4~6에서 다룬 것과 매핑.
- **전환**: "이 아키텍처를 코드로 배포하는 워크플로우"

## 시간 8: Infra/App 배포 Workflow — CI/CD 연동 브릿지
- **과제**: 프로젝트 구현 계획 수립
- **강의 포인트**: plan → review → apply 워크플로우. GitHub Actions 개요. PR 기반 인프라 변경. "CI/CD 과정에서 본격적으로 다룬다" — 여기서는 개념과 방향만. App 배포(blue/green, rolling) 간단 소개.
- **마무리**: "내일 코드 품질 검증 + 프로젝트. 8일간 배운 모든 것을 조합한다"
