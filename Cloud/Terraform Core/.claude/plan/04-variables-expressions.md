# Chapter 04 — 변수 심화 & 표현식

## 목표

변수 입력 방법의 전체 체계를 파악하고,
count / for_each / dynamic 블록과 내장 함수로 유연한 코드를 작성할 수 있다.

---

## Section 구성

### Section 01 — 변수 입력 방법
- **유형**: 이론 + 실습
- **내용**:
  - 변수 우선순위: CLI 플래그 > 환경변수 > tfvars > default
  - `.tfvars` 파일: `terraform.tfvars` 자동 로드, 커스텀 파일명
  - `.tfvars.json` 형식
  - 환경변수 방식: `TF_VAR_<name>`
  - `-var`, `-var-file` CLI 플래그
  - sensitive 변수 처리 (plan 출력에서 마스킹)
- **Lab**:
  - `[실습] lab01: tfvars 파일 분리`
    - `terraform.tfvars`와 `prod.tfvars` 작성
    - `-var-file=prod.tfvars` 로 파일 지정하여 apply
    - 우선순위 충돌 실험
  - `[실습] lab02: 환경변수 & CLI 플래그`
    - `TF_VAR_instance_type` 환경변수로 전달
    - `-var` 플래그로 런타임 override
    - sensitive variable plan 출력 확인

---

### Section 02 — 조건식 & 반복
- **유형**: 이론 + 실습
- **내용**:
  - 조건식: `condition ? true_val : false_val`
  - `count`: 정수 기반 반복, `count.index` 활용
  - `count` 리소스 주소: `aws_instance.web[0]`
  - `for_each`: map / set 기반 반복, `each.key` / `each.value`
  - `for_each` 리소스 주소: `aws_instance.web["name"]`
  - count vs for_each 비교 및 선택 기준
  - `dynamic` 블록: 블록 내부 반복 (인라인 블록 동적 생성)
- **Lab**:
  - `[실습] lab01: count로 EC2 다중 생성`
    - count = var.instance_count로 EC2 복수 생성
    - count.index로 Name 태그 차별화
    - 특정 인덱스만 destroy하는 경우 확인
  - `[실습] lab02: for_each로 Security Group 생성`
    - map(object) 변수로 SG 규칙 정의
    - for_each로 SG 복수 생성
    - count와 비교: 리소스 삭제 시 차이 확인
  - `[실습] lab03: dynamic 블록`
    - Security Group의 ingress 규칙을 dynamic 블록으로 작성
    - list(object) 변수로 규칙 목록 주입

---

### Section 03 — 내장 함수
- **유형**: 이론 + 실습
- **내용**:
  - `terraform console`로 함수 탐색하기
  - String 함수: `format`, `join`, `split`, `trimspace`, `lower`, `upper`
  - Collection 함수: `length`, `tolist`, `toset`, `tomap`, `merge`, `flatten`, `concat`
  - Numeric 함수: `max`, `min`, `ceil`, `floor`
  - Encoding 함수: `base64encode`, `jsonencode`, `yamlencode`
  - Type conversion 함수: `tostring`, `tonumber`, `tobool`
- **Lab**:
  - `[실습] lab01: string / encoding 함수`
    - `format`으로 리소스 Name 태그 생성
    - `jsonencode`로 user_data 내 JSON 생성
    - `terraform console`에서 함수 실험
  - `[실습] lab02: collection 함수`
    - `merge`로 공통 태그 + 리소스별 태그 합산
    - `flatten`으로 중첩 리스트 처리
    - `toset`으로 for_each에 사용할 집합 변환

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/04.01.claude.notion.md` |
| 02 | `.claude/draft/04.02.claude.notion.md` |
| 03 | `.claude/draft/04.03.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획확정 |
| 02 | 계획확정 |
| 03 | 계획확정 |
