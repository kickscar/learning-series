# Chapter 01 — Terraform 시작하기

## 목표

Terraform 설치부터 첫 리소스 배포까지 직접 경험한다.
init → plan → apply → destroy 워크플로우의 전체 흐름과 내부 동작을 이해한다.

---

## Section 구성

### Section 01 — IaC와 Terraform 포지셔닝
- **유형**: 이론
- **내용**:
  - IaC(Infrastructure as Code) 개념과 필요성
  - 선언형 vs 절차형 IaC 비교
  - Terraform의 위치: 멀티클라우드 프로비저닝 도구
  - CloudFormation과의 차이 (선언형 공통, 플랫폼 독립성 차이)
  - 이 시리즈의 학습 범위: Terraform 도구 자체에 집중
- **Lab**: 없음

---

### Section 02 — 설치 및 환경 구성
- **유형**: 이론 + 실습
- **내용**:
  - Terraform 설치 방법 (tfenv 또는 직접 설치)
  - AWS provider 연결 구조 (credentials, region)
  - AWS credential 설정 방법 (환경변수, ~/.aws/credentials)
  - `terraform version` / `terraform -help` 확인
- **Lab**:
  - `[실습] lab01: 설치 확인 및 provider 연결`
    - terraform CLI 설치 및 버전 확인 (1.10.x)
    - AWS credentials 설정 확인
    - provider 블록 작성 후 `terraform init` 실행
    - `.terraform/` 디렉토리 구조 확인

---

### Section 03 — 첫 번째 리소스 배포
- **유형**: 이론 + 실습
- **내용**:
  - resource 블록 기본 구조
  - provider 설정과 리소스의 관계
  - `terraform plan` 출력 읽는 법 (+/~/- 표기)
  - `terraform apply` 실행 흐름
  - `terraform destroy`와 리소스 정리
- **Lab**:
  - `[실습] lab01: Security Group 생성`
    - aws_security_group 리소스 작성
    - plan 출력 확인
    - apply 후 AWS 콘솔 확인
    - destroy로 정리
  - `[실습] lab02: EC2 인스턴스 생성`
    - aws_instance 리소스 작성 (Security Group 참조 포함)
    - plan → apply → destroy 전체 사이클 실행
    - terraform.tfstate 파일 생성 확인

---

### Section 04 — Terraform 동작 원리
- **유형**: 이론
- **내용**:
  - `terraform init`: provider 다운로드, `.terraform/` 구조
  - `terraform plan`: refresh → diff → execution plan 생성
  - `terraform apply`: plan 실행, state 기록
  - `terraform destroy`: state 기반 역순 삭제
  - `.terraform.lock.hcl` 역할
  - terraform.tfstate와 실제 인프라의 관계 (Ch03 State 챕터 예고)
- **Lab**: 없음

---

### Gallery — [실습] Gallery: EC2에 Gallery 앱 배포
- **유형**: 시리즈 실습
- **전제 조건**: Ch01 Sec02~03 완료 (terraform 설치 + EC2/SG 생성 경험)
- **내용**:
  - EC2 + Security Group 리소스 작성 (포트 8080 인바운드 허용)
  - user_data로 JDK 21 설치 및 Gallery JAR 실행 자동화
  - `terraform apply` 후 브라우저에서 Gallery 앱 접근 확인
  - 리소스 네이밍: `tf-core-gallery-*`
- **구성**:
  - `main.tf`: provider, EC2, Security Group
  - `variables.tf`: region, instance_type, ami_id
  - `outputs.tf`: 인스턴스 public IP
  - `user_data.sh`: JDK 설치 + JAR 다운로드 + 실행 스크립트
- **예제 파일**: `01 Terraform 시작하기/Gallery - EC2에 Gallery 앱 배포/`

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/01.01.claude.notion.md` |
| 02 | `.claude/draft/01.02.claude.notion.md` |
| 03 | `.claude/draft/01.03.claude.notion.md` |
| 04 | `.claude/draft/01.04.claude.notion.md` |
| Gallery | `.claude/draft/01.gallery.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | draft완료 |
| 02 | 계획확정 |
| 03 | 계획확정 |
| 04 | 계획확정 |
| Gallery | 계획확정 |
