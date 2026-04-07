# Chapter 02 — HCL & 핵심 블록

## 목표

HCL의 문법 체계와 Terraform의 핵심 블록(resource, variable, output, locals, data)을 이해하고
실제 코드로 작성할 수 있다.

---

## Section 구성

### Section 01 — HCL 문법 기초
- **유형**: 이론
- **내용**:
  - HCL(HashiCorp Configuration Language) 개요
  - 블록(block), 인수(argument), 속성(attribute) 구조
  - 기본 타입: string, number, bool
  - 컬렉션 타입: list, map, set, object, tuple
  - 표현식(expression): 참조, 연산자, 조건식 개요
  - 주석 처리 방법 (`#`, `//`, `/* */`)
- **Lab**: 없음

---

### Section 02 — resource 블록
- **유형**: 이론 + 실습
- **내용**:
  - resource 블록 구조: `resource "type" "name"`
  - 리소스 참조 표현식: `<type>.<name>.<attribute>`
  - 리소스 간 암묵적 의존성(implicit dependency)
  - `depends_on`으로 명시적 의존성 선언
  - meta-argument 개요 (depends_on, lifecycle, count, for_each)
- **Lab**:
  - `[실습] lab01: Security Group 참조 표현식`
    - aws_vpc, aws_security_group 작성
    - SG에서 VPC ID를 참조 표현식으로 연결
    - plan 출력에서 의존성 확인
  - `[실습] lab02: depends_on 명시적 의존성`
    - 암묵적 의존성만으로 해결되지 않는 상황 재현
    - depends_on으로 순서 명시

---

### Section 03 — variable & output
- **유형**: 이론 + 실습
- **내용**:
  - variable 블록: type, default, description, sensitive
  - variable 타입 제약 (string, number, bool, list, map, object)
  - output 블록: value, description, sensitive
  - output 활용 시나리오 (모듈 출력, 배포 결과 확인)
- **Lab**:
  - `[실습] lab01: variable 타입 정의`
    - string / number / list(string) / map(string) 변수 작성
    - 각 타입으로 EC2 관련 리소스 파라미터화
    - `terraform apply -var` 플래그로 값 전달
  - `[실습] lab02: output으로 배포 결과 출력`
    - EC2 public IP, instance ID를 output으로 정의
    - `terraform output` 명령으로 값 확인
    - sensitive output 처리 확인

---

### Section 04 — locals & data source
- **유형**: 이론 + 실습
- **내용**:
  - locals 블록: 반복 표현식 정리, 중간 계산값 보관
  - locals vs variable 차이 (외부 입력 여부)
  - data source 개념: 기존 인프라 또는 외부 정보 조회
  - data 블록 구조: `data "type" "name"`
  - 자주 쓰는 data source: aws_ami, aws_vpc, aws_availability_zones
- **Lab**:
  - `[실습] lab01: locals로 태그 중앙화`
    - 공통 태그를 locals로 정의
    - 여러 리소스에서 locals.tags 참조
    - locals에서 merge() 함수 활용
  - `[실습] lab02: AMI data source 조회`
    - aws_ami data source로 최신 Amazon Linux 2023 AMI 조회
    - data source 결과를 EC2 ami 인수에 참조
    - 하드코딩된 AMI ID 제거

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/02.01.claude.notion.md` |
| 02 | `.claude/draft/02.02.claude.notion.md` |
| 03 | `.claude/draft/02.03.claude.notion.md` |
| 04 | `.claude/draft/02.04.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획확정 |
| 02 | 계획확정 |
| 03 | 계획확정 |
| 04 | 계획확정 |
