# Chapter 06 — Workspace & 환경 분리

## 목표

Terraform workspace의 동작 원리를 이해하고,
workspace와 디렉토리 기반 방식 각각으로 dev/prod 환경을 분리할 수 있다.

---

## Section 구성

### Section 01 — Workspace 개념
- **유형**: 이론
- **내용**:
  - Workspace란: 동일 코드베이스로 독립된 state를 관리하는 메커니즘
  - `default` workspace와 사용자 정의 workspace
  - workspace별 state 저장 위치 (local: `terraform.tfstate.d/`, remote: S3 key prefix)
  - `${terraform.workspace}` 표현식 활용
  - workspace 방식의 한계와 주의사항
  - workspace vs 디렉토리 분리 방식 비교
    - workspace: 코드 공유, state 분리
    - 디렉토리: 코드·state 모두 분리 (더 명확한 격리)
- **Lab**: 없음

---

### Section 02 — Workspace 실습
- **유형**: 이론 + 실습
- **내용**:
  - `terraform workspace new/list/select/show` 명령
  - workspace 전환 후 state 분리 확인
  - `${terraform.workspace}`로 리소스 이름·태그 차별화
  - Remote Backend(S3) 환경에서 workspace별 state 경로 확인
- **Lab**:
  - `[실습] lab01: workspace 생성 및 전환`
    - `dev`, `prod` workspace 생성
    - workspace 전환 후 각각 `terraform apply`
    - S3에서 workspace별 state 경로 확인 (`env:/dev/`, `env:/prod/`)
  - `[실습] lab02: workspace로 리소스 차별화`
    - `${terraform.workspace}`를 Name 태그에 반영
    - workspace별 instance_type을 locals 조건식으로 분기
    - dev → t3.micro, prod → t3.small

---

### Section 03 — 디렉토리 기반 환경 분리
- **유형**: 이론 + 실습
- **내용**:
  - 디렉토리 기반 구조: `envs/dev/`, `envs/prod/`
  - 공통 모듈 재사용: `../../modules/`
  - 환경별 `terraform.tfvars` 관리
  - 환경별 backend 설정 분리 (`backend-dev.hcl`, `backend-prod.hcl`)
  - 실무에서 디렉토리 분리 방식이 선호되는 이유
- **Lab**:
  - `[실습] lab01: 디렉토리 기반 환경 구조 구성`
    - `envs/dev/`, `envs/prod/` 디렉토리 구성
    - 각 환경에서 모듈 호출 + 환경별 tfvars
    - dev / prod 각각 `terraform init` → `apply`
    - 두 환경의 state가 완전히 독립됨을 확인

---

### Gallery — [실습] Gallery: dev/prod 환경 분리
- **유형**: 시리즈 실습
- **전제 조건**: Ch05 Gallery 완료 (모듈화 상태), Ch06 Sec02~03 완료
- **내용**:
  - Ch05 Gallery의 모듈화된 Gallery 인프라를 dev/prod로 분리
  - 디렉토리 기반 방식 채택: `envs/dev/`, `envs/prod/`
  - dev: t3.micro, prod: t3.small (또는 t3.medium)
  - 각 환경별 독립 state (S3 key prefix 분리)
  - dev 환경 apply → 앱 동작 확인
- **예제 파일**: `06 Workspace & 환경 분리/Gallery - dev·prod 환경 분리/`

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/06.01.claude.notion.md` |
| 02 | `.claude/draft/06.02.claude.notion.md` |
| 03 | `.claude/draft/06.03.claude.notion.md` |
| Gallery | `.claude/draft/06.gallery.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획확정 |
| 02 | 계획확정 |
| 03 | 계획확정 |
| Gallery | 계획확정 |
