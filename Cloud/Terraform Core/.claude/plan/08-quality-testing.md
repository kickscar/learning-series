# Chapter 08 — 코드 품질 & 테스트

## 목표

Terraform 코드 품질 도구를 익히고,
Custom Validation / Runtime Guards / Terraform Test로 인프라 코드의 정확성을 검증할 수 있다.

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

### Section 02 — Custom Validation & Runtime Guards
- **유형**: 이론 + 실습
- **요구 버전**: Terraform 1.5+ (`check` 블록)
- **내용**:
  - `validation` 블록: variable 값의 사전 검증 (배포 전)
    - `condition`, `error_message`
  - `precondition`: resource / data apply 전 조건 검사
  - `postcondition`: resource apply 후 결과 검증
  - `check` 블록: plan/apply마다 실행되는 상시 헬스 체크 (TF 1.5+)
    - `assert` 블록으로 조건 정의
    - 실패해도 apply는 계속됨 (경고 수준)
  - 세 가지 메커니즘의 실행 시점 비교
- **Lab**:
  - `[실습] lab01: validation 블록`
    - instance_type 변수에 허용 목록 validation 추가
    - 허용되지 않은 값 입력 시 오류 메시지 확인
    - environment 변수에 dev/staging/prod만 허용
  - `[실습] lab02: precondition / postcondition`
    - EC2 생성 전 AMI ID 형식 precondition 검사
    - EC2 생성 후 public IP 존재 여부 postcondition 검증
  - `[실습] lab03: check 블록`
    - EC2의 HTTP 응답을 `http` data source로 조회
    - `check` 블록에서 HTTP 200 응답 assert
    - 앱이 정상 응답하지 않을 때 plan 출력 변화 확인

---

### Section 03 — Terraform Test
- **유형**: 이론 + 실습
- **요구 버전**: Terraform 1.6+ (`terraform test`), 1.7+ (mock provider)
- **내용**:
  - `terraform test` 개요: HCL 기반 테스트 프레임워크
  - `.tftest.hcl` 파일 구조: `run` 블록, `assert` 블록
  - `command = plan` vs `command = apply` 테스트
  - mock provider (TF 1.7+): 실제 AWS 호출 없이 테스트
    - `mock_provider` 블록 구성
    - `override_resource` / `override_data`
  - 테스트 파일 위치: 모듈 디렉토리 내 `tests/`
- **Lab**:
  - `[실습] lab01: .tftest.hcl 작성`
    - 모듈에 대한 plan 수준 테스트 작성
    - `assert`로 output 값 검증
    - `terraform test` 실행 및 결과 확인
  - `[실습] lab02: mock provider로 단위 테스트`
    - `mock_provider "aws"` 설정
    - 실제 AWS 인증 없이 테스트 실행
    - override_resource로 EC2 응답값 지정

---

### Section 04 — CI/CD 연동 브릿지
- **유형**: 이론
- **내용**:
  - GitHub Actions에서 Terraform 워크플로우 연결 구조
  - PR 시 `terraform plan` 자동 실행 패턴
  - main 브랜치 merge 시 `terraform apply` 패턴
  - AWS 자격 증명 주입 방법: OIDC (GitHub → AWS IAM Role)
  - `GITHUB_TOKEN`, `TF_VAR_*` secrets 활용
  - 이 섹션의 범위: 파이프라인 설계 전략은 Architecture & Design 담당
- **Lab**: 없음

---

### Gallery — [실습] Gallery: 검증 추가
- **유형**: 시리즈 실습
- **전제 조건**: Ch06 Gallery 완료 (dev/prod 환경 분리 상태), Ch08 Sec02 완료
- **내용**:
  - Ch06 Gallery의 Gallery EC2 인프라에 검증 추가
  - `check` 블록으로 Gallery 앱 HTTP 응답 상시 검증
    - `http` data source로 `http://<ec2_public_ip>:8080` 조회
    - `assert`: 응답 코드 200 확인
  - `validation` 블록으로 environment 변수 값 제약
  - `postcondition`으로 EC2 배포 후 public IP 존재 확인
  - `terraform apply` 후 Gallery 앱 정상 응답 시 check 통과 확인
- **예제 파일**: `08 코드 품질 & 테스트/Gallery - 검증 추가/`

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/08.01.claude.notion.md` |
| 02 | `.claude/draft/08.02.claude.notion.md` |
| 03 | `.claude/draft/08.03.claude.notion.md` |
| 04 | `.claude/draft/08.04.claude.notion.md` |
| Gallery | `.claude/draft/08.gallery.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획확정 |
| 02 | 계획확정 |
| 03 | 계획확정 |
| 04 | 계획확정 |
| Gallery | 계획확정 |
