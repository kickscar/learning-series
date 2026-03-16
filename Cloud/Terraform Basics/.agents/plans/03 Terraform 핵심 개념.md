# Chapter 03: Terraform 핵심 개념

---

# Chapter Definition

## 왜 필요한가

이 Chapter는 Terraform state, CLI workflow, dependency graph, destroy를 포함한 Terraform의 실행 모델을 설명한다. 이후 state 관리와 module 학습의 기초가 된다.

---

## 세부 Sections

1. 03.01 State의 이해와 로컬 State
2. 03.02 init, plan, apply 워크플로우
3. 03.03 리소스 의존성과 실행 순서
4. 03.04 destroy와 리소스 정리

---

## 간단 소개

- local state의 역할 이해
- `terraform init`, `terraform plan`, `terraform apply` 흐름 이해
- dependency graph와 실행 순서 해석
- `terraform destroy`의 안전한 사용법 학습

---

# Section Definition

## 03.01 State의 이해와 로컬 State
### 개요
local state의 역할과 state file 구조를 설명한다.
### 목표
- state 필요성 설명
- state file 확인
- state와 plan 관계 이해
### 내용 요약
- Terraform state
- state file
- local backend
### Lab 요약
- apply 후 state file 확인

## 03.02 init, plan, apply 워크플로우
### 개요
기본 Terraform CLI workflow를 설명한다.
### 목표
- init 역할 이해
- plan 출력 해석
- apply 결과 확인
### 내용 요약
- `terraform init`
- `terraform plan`
- `terraform apply`
### Lab 요약
- 단일 resource 생성 흐름 실습

## 03.03 리소스 의존성과 실행 순서
### 개요
resource 간 의존성과 dependency graph를 설명한다.
### 목표
- 참조 기반 의존성 이해
- 실행 순서 해석
- `depends_on` 사용 시점 이해
### 내용 요약
- dependency graph
- implicit dependency
- explicit dependency
### Lab 요약
- VPC와 subnet 참조 관계 확인

## 03.04 destroy와 리소스 정리
### 개요
Terraform이 생성한 리소스를 정리하는 흐름을 설명한다.
### 목표
- destroy 역할 이해
- 삭제 전 검토 포인트 파악
- 실습 자원 정리 습관 형성
### 내용 요약
- `terraform destroy`
- 삭제 계획
- 정리 workflow
### Lab 요약
- 생성 자원 destroy 실행

---

# Lab Overview

- Lab1 - state file 구조 확인
- Lab2 - init, plan, apply workflow 실습
- Lab3 - dependency graph 기반 실행 순서 확인
- Lab4 - destroy로 자원 정리

---

# Expected Learning Outcomes

- Terraform state의 기본 역할을 설명할 수 있다
- Terraform CLI workflow를 수행할 수 있다
- dependency graph를 해석할 수 있다
- destroy를 안전하게 사용할 수 있다

---

# Modern Key Concepts

- **Terraform state**
  관리 상태 추적 메커니즘
- **Terraform Workflow**
  init → plan → apply → destroy
- **Dependency Graph**
  실행 순서를 결정하는 구조
- **Idempotency**
  반복 실행 시 일관된 상태 유지
