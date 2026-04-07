# Chapter 03 — State 메커니즘

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
  - DynamoDB state locking: LockID, 동시 apply 방지
  - `terraform init` 시 backend 마이그레이션 흐름
  - backend 설정 분리 (`backend.hcl` 파일 활용)
- **Lab**:
  - `[실습] lab01: S3 + DynamoDB 백엔드 인프라 생성`
    - S3 버킷 생성 (versioning 활성화)
    - DynamoDB 테이블 생성 (LockID partition key)
  - `[실습] lab02: Remote Backend 설정 및 state 이전`
    - terraform 블록에 backend "s3" 설정 추가
    - `terraform init` 실행 후 로컬 state → S3 이전 확인
    - AWS 콘솔에서 S3 state 파일 확인

---

### Section 04 — State 명령어
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

### Gallery — [실습] Gallery: Remote Backend 이전
- **유형**: 시리즈 실습
- **전제 조건**: Ch01 Gallery 완료 (Gallery EC2 배포 상태), Ch03 Sec03 완료
- **내용**:
  - Ch01 Gallery에서 생성한 EC2 인프라의 local state를
    S3 + DynamoDB remote backend로 이전
  - `terraform init -migrate-state` 실행 및 확인
  - S3에서 state 파일 확인
  - DynamoDB 잠금 동작 확인 (동시 apply 시도)
- **예제 파일**: `03 State 메커니즘/Gallery - Remote Backend 이전/`

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/03.01.claude.notion.md` |
| 02 | `.claude/draft/03.02.claude.notion.md` |
| 03 | `.claude/draft/03.03.claude.notion.md` |
| 04 | `.claude/draft/03.04.claude.notion.md` |
| Gallery | `.claude/draft/03.gallery.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획확정 |
| 02 | 계획확정 |
| 03 | 계획확정 |
| 04 | 계획확정 |
| Gallery | 계획확정 |
