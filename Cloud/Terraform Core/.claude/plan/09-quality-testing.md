# Chapter 09 — 코드 품질 & 배포 자동화

## 목표

Terraform 코드 품질 도구를 익히고,
Custom Validation / Runtime Guards / Terraform Test로 인프라 코드의 정확성을 검증할 수 있다.
GitHub Actions로 PR 기반 plan/apply 파이프라인을 구축하고,
보안 스캐닝과 멀티 환경 배포를 자동화할 수 있다.

---

## Section 구성

### Section 01 — fmt / validate / lint
- **유형**: 이론 + 실습
- **내용**:
  - `terraform fmt`: HCL 코드 포맷 자동 정렬 (`-recursive`, `-check`)
  - `terraform validate`: 문법·참조 오류 검사 (실제 인프라 접근 없음)
  - tflint: provider 규칙 기반 정적 분석 도구
  - tflint AWS ruleset: 잘못된 instance_type, 지원 종료 리소스 탐지
  - fmt / validate / tflint의 역할 차이
- **Lab**:
  - `[실습] lab01: fmt & validate`
    - 의도적으로 포맷을 깨뜨린 코드에 `terraform fmt` 적용
    - 존재하지 않는 변수 참조로 validate 오류 재현
    - `-check` 플래그로 CI 스타일 체크 확인
  - `[실습] lab02: tflint 설치 및 실행`
    - tflint 설치 및 AWS ruleset 초기화
    - 잘못된 instance_type 탐지 실험
    - `.tflint.hcl` 설정 파일 작성

---

### Section 02 — Lifecycle Guards: precondition · postcondition · check
- **유형**: 이론 + 실습
- **요구 버전**: Terraform 1.5+ (`check` 블록)
- **내용**:
  - `validation` 블록 복습 (Ch02 Sec04에서 기본 다룸) — 여기서는 regex 등 고급 패턴
  - `precondition`: resource / data apply 전 조건 검사
  - `postcondition`: resource apply 후 결과 검증
  - `check` 블록: plan/apply마다 실행되는 상시 헬스 체크 (TF 1.5+)
  - 네 가지 메커니즘의 실행 시점 비교 (validation → precondition → postcondition → check)
- **Lab**:
  - `[실습] lab01: precondition / postcondition`
    - EC2 생성 전 AMI ID 형식 precondition 검사
    - EC2 생성 후 public IP 존재 여부 postcondition 검증
  - `[실습] lab02: check 블록`
    - EC2의 HTTP 응답을 `http` data source로 조회
    - `check` 블록에서 HTTP 200 응답 assert

---

### Section 03 — [실습] Gallery: 검증 추가
- **유형**: 시리즈 실습
- **전제 조건**: Ch07 Gallery 완료, Ch09 Sec02 완료
- **내용**:
  - `check` 블록으로 Gallery 앱 HTTP 응답 상시 검증
  - `postcondition`으로 EC2 배포 후 public IP 존재 확인
- **예제 파일**: `09 코드 품질 & 배포 자동화/03 [실습] Gallery: 검증 추가/`

---

### Section 04 — Terraform Test
- **유형**: 이론 + 실습
- **요구 버전**: Terraform 1.6+ (`terraform test`), 1.7+ (mock provider)
- **내용**:
  - `.tftest.hcl` 파일 구조: `run` 블록, `assert` 블록
  - `command = plan` vs `command = apply` 테스트
  - mock provider (TF 1.7+): 실제 AWS 호출 없이 테스트
  - 테스트 파일 위치: 모듈 디렉토리 내 `tests/`
- **Lab**:
  - `[실습] lab01: .tftest.hcl 작성`
    - 모듈에 대한 plan 수준 테스트 작성
    - `terraform test` 실행 및 결과 확인
  - `[실습] lab02: mock provider로 단위 테스트`
    - `mock_provider "aws"` 설정
    - 실제 AWS 인증 없이 테스트 실행

---

### Section 05 — IaC 워크플로우
- **유형**: 이론 + 실습
- **내용**:
  - 수동 apply의 위험 — 팀 환경에서의 IaC 운용 과제
  - IaC 파이프라인 전체 그림: 4 역할(Quality, Review, Deploy, Monitor), 3 파일(`review.yml`, `deploy.yml`, `monitor.yml`)
  - 09.05~08에서 점진적으로 확장되는 로드맵 제시
  - GitHub Actions 기초: workflow, job, step, trigger, runner
- **Lab**:
  - `[실습] lab01: Review 워크플로우`
    - GitHub Actions 입문. `review.yml` 작성. locals+output만으로 pull_request trigger 체험 (AWS 없이)
  - `[실습] lab02: Deploy 워크플로우`
    - `deploy.yml` 작성. push trigger로 merge → apply 체험 (AWS 없이)

---

### Section 06 — 인프라 배포 워크플로우
- **유형**: 이론 + 실습
- **내용**:
  - AWS OIDC 인증 (GitHub → AWS IAM Role): 동작 원리, Trust Policy, sub claim 조건 제한
  - `hashicorp/setup-terraform` wrapper: plan 출력 캡처 → PR comment
  - concurrency group: 동시 apply 방지, `cancel-in-progress: false`
  - review.yml + deploy.yml을 실제 인프라 배포로 확장
- **Lab**:
  - `[실습] lab01: OIDC + Review (인프라 plan)`
    - OIDC Provider+IAM Role 생성(TF, 시리즈 패턴 적용), VPC plan, PR comment
  - `[실습] lab02: Deploy (인프라 apply)`
    - merge → apply, concurrency group, 전체 Review+Deploy 파이프라인 완성

---

### Section 07 — 품질 자동화
- **유형**: 이론 + 실습
- **내용**:
  - Quality의 역할 — Review 앞에 코드 품질을 먼저 검사
  - 품질 게이트: fmt -check → validate → tflint → tfsec (fail-fast)
  - `review.yml`에 quality-gate job 추가 (needs 의존)
  - `init -backend=false`: AWS 인증 없이 품질 검사 실행
  - tfsec 보안 스캐닝
  - pre-commit hooks: 로컬 방어 계층
  - branch protection + required status checks: merge 조건 강제
- **Lab**:
  - `[실습] lab01: Quality 워크플로우`
    - `review.yml`에 quality-gate job 추가 + `.tflint.hcl` + pre-commit 설정
  - `[실습] lab02: branch protection`
    - Required status checks 설정. 품질 게이트 실패 시 merge 차단

---

### Section 08 — 멀티 환경 배포 & 운영
- **유형**: 이론 + 실습
- **내용**:
  - Deploy 멀티환경 확장: Ch07 디렉토리 분리 연결, `working-directory`로 환경 지정
  - dev → prod 순차 배포, `needs:` 의존성
  - GitHub Environments + Required reviewers (approval gate)
  - Monitor 워크플로우: drift 감지, `plan -detailed-exitcode` (exit code 2)
  - Concurrency + S3 lockfile 이중 보호
  - Terraform Cloud 대안 (간략 비교)
- **Lab**:
  - `[실습] lab01: 멀티 환경 배포`
    - `deploy.yml` 멀티환경 확장. GitHub Environments + approval. dev 자동 → prod 승인 → apply
  - `[실습] lab02: drift 감지`
    - `monitor.yml` 신규 생성. cron schedule + GitHub Issue 자동 생성

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/09.01.claude.notion.md` |
| 02 | `.claude/draft/09.02.claude.notion.md` |
| 03 (Gallery) | `.claude/draft/09.03.claude.notion.md` |
| 04 | `.claude/draft/09.04.claude.notion.md` |
| 05 | `.claude/draft/09.05.claude.notion.md` |
| 06 | `.claude/draft/09.06.claude.notion.md` |
| 07 | `.claude/draft/09.07.claude.notion.md` |
| 08 | `.claude/draft/09.08.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | draft완료 |
| 02 | draft완료 |
| 03 (Gallery) | draft완료 |
| 04 | draft완료 |
| 05 | 재작성 (4→2 labs, 개념+입문) |
| 06 | 재작성 (인프라 배포 워크플로우) |
| 07 | 재작성 (품질 자동화) |
| 08 | 신규 (멀티 환경 배포 & 운영) |
