# Terraform Basics - Series Hierarchy Plan

이 문서는 **Terraform Basics Series의 전체 문서 구조(Chapter / Section / Lab)**를 정의하는 계획 문서이다.

Terraform을 처음 학습하는 독자가 AWS 기반 예제를 통해 Terraform의 핵심 개념, Terraform workflow, Terraform state, module 구조를 단계적으로 이해하도록 설계한다.

---

# Series Overview

이 Series의 목적은 다음과 같다.

- Terraform을 이용한 infrastructure as Code(IaC) 기본 개념 학습
- HCL 작성 방식과 Terraform configuration 구조 이해
- AWS provider 기반의 Terraform workflow 실습 경험 확보
- Terraform state, backend, module, lifecycle 같은 핵심 개념 이해
- production 수준 Terraform 운영을 위한 기본 설계 관점 확보

---

# Target Audience

이 Series는 다음 학습자를 대상으로 한다.

### Beginner

- AWS 기본 개념
- CloudFormation 입문
- cloud infrastructure 기본 이해

### Intermediate

- Infrastructure layering
- Terraform module 설계
- Terraform 코드 품질
- production 수준 IaC 운영 방식

---

# Series Structure

이 Series는 다음 계층 구조를 따른다.

```
Chapter
    |-- Section
        |- Lab
```

설명:

- **Chapter**
  - 큰 학습 주제 단위
- **Section**
  - 구체적인 학습 단위
  - 개념 설명 + Lab 설계 포함
- **Lab**
  - 실제 실습 코드

---

# Chapter Plan

---

## Chapter 01: Terraform 소개

Terraform이 어떤 문제를 해결하는 도구인지 이해하고, CloudFormation 경험자 관점에서 Terraform의 접근 방식을 비교한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 01.01 | IaC와 Terraform | IaC 전환 관점 정리 및 첫 Terraform configuration 읽기 |
| 01.02 | Terraform vs 다른 IaC 도구 비교 | CloudFormation과 Terraform 차이 분석 |
| 01.03 | Terraform 설치 및 환경 구성 | Terraform CLI, AWS credentials, 작업 디렉토리 준비 |
```

---

## Chapter 02: HCL 기초

Terraform configuration을 읽고 작성하기 위해 필요한 HCL 문법과 provider / resource 구조를 학습한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 02.01 | HCL 문법 개요 | block, argument, expression 실습 |
| 02.02 | Resource와 Provider | AWS provider 선언과 기본 resource 작성 |
| 02.03 | Data Source와 Local Value | 조회 값과 내부 계산 값 분리 실습 |
```

---

## Chapter 03: Terraform 핵심 개념

Terraform의 내부 동작 원리인 dependency graph, state, lifecycle을 중심으로 Terraform architecture를 이해한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 03.01 | Terraform Architecture와 실행 모델 | plan 생성 흐름과 provider interaction 확인 |
| 03.02 | Dependency Graph와 리소스 의존성 | 암시적, 명시적 의존성 비교 실습 |
| 03.03 | Lifecycle과 변경 제어 | create_before_destroy, prevent_destroy 설계 이해 |
```

---

## Chapter 04: Core Workflow

Terraform CLI의 기본 실행 순서인 init, plan, apply, destroy를 실습 중심으로 학습한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 04.01 | terraform init과 작업 디렉토리 초기화 | provider plugin, backend 초기화 확인 |
| 04.02 | terraform plan과 변경 검토 | 실행 계획 확인과 diff 해석 실습 |
| 04.03 | terraform apply / destroy | 리소스 생성, 검증, 정리 workflow 실습 |
```

---

## Chapter 05: State Management

Terraform state의 역할, local backend와 remote backend의 차이, 협업 관점의 state 관리 방식을 학습한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 05.01 | Terraform state 이해 | state file 구조와 관리 대상 확인 |
| 05.02 | Local State vs Remote Backend | S3 기반 remote backend 설계 이해 |
| 05.03 | Drift와 State 운영 | refresh, import, 충돌 방지 관점 정리 |
```

---

## Chapter 06: Module 구조와 재사용

Terraform module을 통해 코드 재사용성과 인프라 계층화를 설계하는 방법을 학습한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 06.01 | Module 기초 | root module과 child module 분리 |
| 06.02 | Input Variable과 Output 설계 | module interface 설계 실습 |
| 06.03 | 재사용 가능한 AWS 인프라 모듈 설계 | VPC 또는 EC2 module 구조 설계 |
```

---

## Chapter 07: Production Practices

실무 운영 관점에서 Terraform 코드를 더 안전하고 일관되게 관리하기 위한 패턴을 정리한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 07.01 | 디렉토리 구조와 환경 분리 | dev / prod 분리 전략 설계 |
| 07.02 | 코드 품질과 협업 workflow | fmt, validate, review 기준 정리 |
| 07.03 | 운영 시 주의사항과 안티패턴 | state 공유, 수동 변경, 과도한 결합 방지 |
```

---

# Series Progression

이 Series의 학습 흐름은 다음과 같다.

```text
Terraform의 역할 이해
↓
HCL과 resource 작성 방식 이해
↓
Terraform architecture와 dependency graph 이해
↓
init → plan → apply → destroy workflow 실습
↓
Terraform state와 backend 운영 이해
↓
module 기반 재사용 구조 설계
↓
production 수준 운영 관점 확보
```

---

# Series Integration

이 Series는 다음 학습 주제와 연계된다.

```text
| Chapter | 연계 Series |
|-------|-------------|
| Chapter 05 State Management | Terraform Advanced의 remote backend 심화 |
| Chapter 06 Module 구조와 재사용 | Terraform Advanced의 module composition |
| Chapter 07 Production Practices | Cloud Architecture Series의 환경 분리와 운영 표준 |
```

---

# Notes

이 문서는 **Series 전체 구조를 설계하는 계획 문서**이다.

Section 문서 작성 시에는 다음 문서를 기반으로 진행한다.

.agents/plans/{chapter number} {chapter name}.md
