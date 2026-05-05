# Chapter 02 — HCL 기초

## 목표

HCL의 문법 체계와 Terraform의 핵심 블록(provider, resource, variable, output, locals, data)을 이해하고
실제 코드로 작성할 수 있다.

---

## Section 구성

### Section 01 — HCL 기본 문법
- **유형**: 이론 + 실습
- **내용**:
  - HCL(HashiCorp Configuration Language) 개요
  - 블록(block), 인수(argument), 속성(attribute) 구조
  - 기본 타입: string, number, bool
  - 컬렉션 타입: list, map, set, object, tuple
  - 표현식(expression): 참조, 연산자, 조건식 개요
  - 주석 처리 방법 (`#`, `//`, `/* */`)
- **Lab**:
  - `[실습] lab01: 블록·인수·속성`
    - `locals`(0 label), `output`(1 label), `resource`(2 label) 블록 구조 직접 작성
    - `aws_security_group` plan only — SG name(locals, known) vs SG id(attribute, known after apply)
    - plan 출력에서 인수와 속성의 확정 시점 차이 확인
  - `[실습] lab02: 타입 시스템`
    - string / number / bool / list(string) / map(string) / object 변수 선언
    - `terraform plan`으로 타입 값 확인 (required_providers 없이 동작)
    - 타입 불일치 오류 재현: `-var="replica_count=hello"`
  - `[실습] lab03: 표현식과 내장 함수`
    - 문자열 템플릿, 조건식, `format()` / `join()` / `merge()` / `toset()` 함수를 locals로 작성
    - `terraform console`로 표현식·함수 즉석 평가 (AWS 불필요)

---

### Section 02 — provider 블록
- **유형**: 이론 + 실습
- **내용**:
  - `terraform` 블록과 `required_providers` 구조
  - `provider` 블록 설정 인수 (region 등)
  - version constraints 문법: `~>`, `>=`, `<`, `=`
  - `terraform init` 시 Registry 다운로드 흐름
  - `.terraform.lock.hcl` 역할 개요 (심화는 Ch08)
  - Provider alias 개요 (심화는 Ch08)
- **Lab**:
  - `[실습] lab01: version constraints 실험`
    - `~> 6.0` / `>= 6.0, < 7.0` / `= 6.1.0` 등 제약 표현 변경하며 `terraform init`
    - `.terraform.lock.hcl`에 버전이 어떻게 기록되는지 확인
    - `terraform init -upgrade` 동작 확인 (운용 전략 심화는 Ch08)
    - 설치된 버전과 맞지 않는 제약 설정해 오류 재현
  - `[실습] lab02: default_tags와 tags_all 확인`
    - `default_tags`로 Project, ManagedBy 선언
    - 리소스 tags에 Name만 선언 → plan에서 tags vs tags_all 차이 확인
    - 이후 실습의 네이밍·태깅 패턴 근거 확보

---

### Section 03 — resource 블록
- **유형**: 이론 + 실습
- **내용**:
  - resource 블록 구조: `resource "type" "name"`
  - 리소스 참조 표현식: `<type>.<name>.<attribute>`
  - plan/apply/destroy 첫 경험 (구 Ch01 Sec03 내용 흡수)
  - 리소스 간 암묵적 의존성(implicit dependency)
  - `depends_on`으로 명시적 의존성 선언
  - meta-argument 개요 (depends_on, lifecycle, count, for_each)
- **Lab**:
  - `[실습] lab01: Security Group 생성`
    - aws_security_group 리소스 작성
    - plan/apply/destroy 첫 사이클 경험
    - terraform.tfstate 파일 생성 확인
  - `[실습] lab02: EC2 인스턴스 생성 (SG 참조)`
    - aws_instance 리소스 작성 + Security Group 참조 표현식 연결
    - plan 출력에서 의존성 확인
    - apply → destroy 전체 사이클
  - `[실습] lab03: depends_on 명시적 의존성`
    - 암묵적 의존성만으로 해결되지 않는 상황 재현
    - depends_on으로 순서 명시

---

### Section 04 — locals & output
- **유형**: 이론 + 실습
- **내용**:
  - locals 블록: 리소스에 박혀있는 값을 구조화, 설정의 단일 출처
  - locals vs variable 차이 (내부 설정 vs 외부 입력)
  - locals object 패턴: `local.instance = { instance_type, allow_access, ... }`
  - output 블록: value, description, sensitive
  - output object 구조화: flat output → 리소스 개념별 object
  - output 활용 시나리오 (디버깅, 사용자 접근 정보, State 간 연동)
- **Lab**:
  - `[실습] lab01: locals로 리소스 설정 구조화`
    - 리소스에 하드코딩된 값을 `local.instance` object로 구조화
    - `local.namespace` 패턴 도입 (project + environment)
    - resource에서 `local.*`로만 참조
  - `[실습] lab02: output object 구조화`
    - flat output → object 구조로 전환
    - `terraform output -json | jq` 패턴
    - 리소스 개념별 output 그룹핑

---

### Section 05 — variable & data source
- **유형**: 이론 + 실습
- **내용**:
  - variable 블록: type, default, description, sensitive
  - variable 타입 제약 (string, number, bool, list, map, object)
  - validation 블록: condition, error_message — 변수의 허용 값 제한
  - `terraform apply -var` 플래그로 값 전달
  - data source 개념: 기존 인프라 또는 외부 정보 조회
  - data 블록 구조: `data "type" "name"`
  - 자주 쓰는 data source: aws_ami, aws_vpc, aws_availability_zones
  - data source 결과를 locals에 통합하는 패턴
- **Lab**:
  - `[실습] lab01: variable 기본`
    - string / number / list(string) 변수 작성
    - locals의 하드코딩 값을 variable로 추출
    - `terraform apply -var` 플래그로 값 전달
  - `[실습] lab02: variable validation`
    - env, instance_type, service_port 변수에 validation 추가
    - contains()로 허용 목록 검사, 비교 연산자로 범위 검사
    - 잘못된 값 입력 시 plan 전 오류 차단 재현
  - `[실습] lab03: data source + locals 통합`
    - aws_ami data source로 최신 Amazon Linux 2023 AMI 조회
    - aws_vpc, aws_subnets로 기존 인프라 조회
    - data source 결과를 `local.instance` object에 통합
    - 하드코딩된 AMI ID, VPC ID 제거

---

### Section 06 — [실습] Gallery: EC2에 Gallery 앱 배포
- **유형**: 시리즈 실습
- **전제 조건**: Ch02 Sec02~05 완료 (provider, resource, variable, output, locals, data source)
- **내용**:
  - EC2 + Security Group을 Terraform으로 프로비저닝
  - `user_data` + `templatefile` 함수로 JDK 설치 및 Gallery JAR 실행 자동화
  - `terraform apply` 완료 후 브라우저에서 Gallery 앱 접근 확인
  - `terraform destroy`로 전체 인프라 정리 (샌드박스)
  - 리소스 네이밍: `tf-core-gallery-*`
- **구성**:
  - `main.tf`: provider, EC2, Security Group
  - `variables.tf`: region, instance_type, ami_id, jar_url
  - `outputs.tf`: 인스턴스 public IP, app_url
  - `user_data.sh`: JDK 설치 + JAR 다운로드 + systemd 서비스 실행
- **예제 파일**: `02 HCL 기초/06 [실습] Gallery: EC2에 Gallery 앱 배포/`

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/02.01.claude.notion.md` |
| 02 | `.claude/draft/02.02.claude.notion.md` |
| 03 | `.claude/draft/02.03.claude.notion.md` |
| 04 | `.claude/draft/02.04.claude.notion.md` |
| 05 | `.claude/draft/02.05.claude.notion.md` |
| 06 (Gallery) | `.claude/draft/02.06.claude.notion.md` |

> Gallery draft 기반 자료: `02.06.claude.notion.md` (구 `01.05` → `02.05` → `02.06` 이동)

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획확정 |
| 02 | 계획확정 |
| 03 | 계획확정 |
| 04 | 계획확정 |
| 05 | 계획확정 |
| 06 (Gallery) | 계획확정 |
