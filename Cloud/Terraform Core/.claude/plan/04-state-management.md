# Chapter 04 — State Management

## 목표

Terraform state의 역할과 구조를 이해하고,
Remote Backend로 팀 협업이 가능한 state 관리 환경을 구성한다.

---

## Section 구성

### Section 01 — State란 무엇인가
- **유형**: 이론
- **내용**:
  - State의 역할: desired state(코드)와 actual state(실제 인프라)의 매핑
  - State 없이 Terraform이 동작할 수 없는 이유
  - `terraform refresh`: 실제 인프라 상태를 state에 반영
  - State drift: 코드 외부에서 인프라가 변경된 경우
  - Local state의 한계 (협업, 백업, 잠금)
- **Lab**: 없음

---

### Section 02 — State 파일 구조
- **유형**: 이론
- **내용**:
  - `terraform.tfstate` JSON 구조 분석
  - `serial`, `lineage` 필드의 의미
  - resource 항목 구조 (type, name, provider, instances)
  - `terraform.tfstate.backup` 역할
  - state 파일을 직접 수정하면 안 되는 이유
- **Lab**: 없음

---

### Section 03 — Remote Backend
- **유형**: 이론 + 실습
- **내용**:
  - Remote Backend 개념과 필요성
  - S3 backend 구성: bucket, key, region, encrypt
  - S3 native locking: `use_lockfile = true` (TF 1.10+, 1.11 GA), DynamoDB 불필요
  - `terraform init` 시 backend 마이그레이션 흐름
  - backend 설정 분리 (`backend.hcl` 파일 활용)
- **Lab**:
  - `[실습] lab01: S3 백엔드 인프라 생성`
    - S3 버킷 생성 (versioning 활성화)
  - `[실습] lab02: Remote Backend 설정 및 state 이전`
    - terraform 블록에 backend "s3" 설정 추가 (use_lockfile = true)
    - `terraform init` 실행 후 로컬 state → S3 이전 확인
    - AWS 콘솔에서 S3 state 파일 확인

---

### Section 04 — [실습] Gallery: user_data 자동화 + Remote Backend 이전
- **유형**: 시리즈 실습
- **전제 조건**: Ch02 Gallery 완료 (Gallery EC2 배포 상태), Ch04 Sec03 완료
- **내용**:
  - user_data + templatefile + systemd로 Gallery 앱 자동 배포 전환
  - Ch02 Gallery의 수동 설치를 자동화 (H2 + 로컬 스토리지 유지)
  - local state를 S3 remote backend(native locking)로 이전
  - `terraform init -migrate-state` 실행 및 확인
  - S3에서 state 파일 확인
- **예제 파일**: `04 State Management/04 [실습] Gallery: user_data 자동화 + Remote Backend 이전/`

---

### Section 05 — State 명령어
- **유형**: 이론 + 실습
- **내용**:
  - `terraform state list`: 관리 중인 리소스 목록
  - `terraform state show`: 특정 리소스 상세 state
  - `terraform state mv`: 리소스 주소 변경 (리소스 이동, 이름 변경 시)
  - `terraform state rm`: state에서 리소스 제거 (실제 인프라는 유지)
  - `terraform import`: 기존 인프라를 state로 가져오기
- **Lab**:
  - `[실습] lab01: state 조회`
    - state list / state show 실행
    - 출력 구조 분석
  - `[실습] lab02: state mv / rm`
    - 리소스 이름 변경 후 state mv로 추적
    - state rm 후 plan 출력 변화 확인
  - `[실습] lab03: import`
    - 콘솔에서 수동 생성한 리소스를 import
    - import 후 코드와 state 동기화

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/04.01.claude.notion.md` |
| 02 | `.claude/draft/04.02.claude.notion.md` |
| 03 | `.claude/draft/04.03.claude.notion.md` |
| 04 (Gallery) | `.claude/draft/04.04.claude.notion.md` |
| 05 | `.claude/draft/04.05.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | draft완료 |
| 02 | draft완료 |
| 03 | draft완료 |
| 04 (Gallery) | draft완료 |
| 05 | draft완료 |
