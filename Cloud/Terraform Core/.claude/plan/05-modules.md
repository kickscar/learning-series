# Chapter 05 — 모듈

## 목표

모듈의 구조와 입출력 설계를 이해하고, 직접 로컬 모듈을 작성하여 조합할 수 있다.
Public Registry 모듈을 활용하는 방법도 익힌다.

---

## Section 구성

### Section 01 — 모듈 개념과 구조
- **유형**: 이론
- **내용**:
  - 모듈이란: 재사용 가능한 Terraform 코드 단위
  - root module vs child module
  - 모듈 디렉토리 구조: `main.tf`, `variables.tf`, `outputs.tf`
  - 모듈 호출: `module "name" { source = "..." }`
  - 모듈 입력(variable)과 출력(output)의 역할
  - 모듈화의 경계: 언제 모듈로 분리하는가
- **Lab**: 없음

---

### Section 02 — 로컬 모듈 작성
- **유형**: 이론 + 실습
- **내용**:
  - 로컬 모듈 source 경로: `./modules/<name>`
  - 모듈 변수 설계: 필수 입력 / 선택 입력(기본값) 구분
  - 모듈 output 설계: 외부에서 필요한 속성만 노출
  - 모듈 내부에서의 리소스 참조
  - `terraform init` 후 `.terraform/modules/` 확인
- **Lab**:
  - `[실습] lab01: vpc 모듈 작성`
    - `modules/vpc/` 디렉토리 구성
    - VPC + Subnet 리소스 작성
    - 입력: cidr_block, availability_zone, tags
    - 출력: vpc_id, subnet_id
  - `[실습] lab02: ec2 모듈 작성`
    - `modules/ec2/` 디렉토리 구성
    - EC2 + Security Group 리소스 작성
    - 입력: vpc_id, subnet_id, instance_type, ami_id, tags
    - 출력: instance_id, public_ip

---

### Section 03 — 모듈 조합
- **유형**: 이론 + 실습
- **내용**:
  - root module에서 여러 child module 호출
  - 모듈 간 출력-입력 연결: `module.<name>.<output>`
  - 모듈 간 암묵적 의존성
  - `terraform graph`로 의존성 시각화
  - 모듈 버전 관리 (로컬 모듈은 버전 없음, Registry 모듈은 버전 있음)
- **Lab**:
  - `[실습] lab01: vpc + ec2 모듈 조합`
    - root module에서 vpc 모듈, ec2 모듈 호출
    - vpc 모듈의 출력을 ec2 모듈의 입력으로 연결
    - `terraform graph` 출력 확인

---

### Section 04 — Public Registry 모듈
- **유형**: 이론 + 실습
- **내용**:
  - Terraform Registry 구조: `<namespace>/<module>/<provider>`
  - 버전 제약 지정: `version = "~> 5.0"`
  - Registry 모듈의 입출력 문서 읽는 법
  - 로컬 모듈 vs Registry 모듈 선택 기준
- **Lab**:
  - `[실습] lab01: Registry VPC 모듈 활용`
    - `terraform-aws-modules/vpc/aws` Registry 모듈 호출
    - 버전 고정 후 init
    - 주요 입력 파라미터 확인 및 적용

---

### Gallery — [실습] Gallery: 인프라 모듈화
- **유형**: 시리즈 실습
- **전제 조건**: Ch03 Gallery 완료 (Remote Backend 이전 상태), Ch05 Sec02~03 완료
- **내용**:
  - Ch03 Gallery의 Gallery 인프라 코드를 모듈로 분리
  - `modules/vpc/`: VPC + Subnet
  - `modules/sg/`: Security Group (포트 8080 + SSH)
  - `modules/ec2/`: EC2 (user_data 포함)
  - root module에서 세 모듈 조합하여 동일한 인프라 재구성
  - `terraform apply`로 변경 없음(no changes) 확인
- **예제 파일**: `05 모듈/Gallery - 인프라 모듈화/`

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/05.01.claude.notion.md` |
| 02 | `.claude/draft/05.02.claude.notion.md` |
| 03 | `.claude/draft/05.03.claude.notion.md` |
| 04 | `.claude/draft/05.04.claude.notion.md` |
| Gallery | `.claude/draft/05.gallery.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획확정 |
| 02 | 계획확정 |
| 03 | 계획확정 |
| 04 | 계획확정 |
| Gallery | 계획확정 |
