# Chapter 04: Core Workflow

---

# Chapter Definition

## 왜 필요한가

Terraform 학습에서 가장 중요한 것은 CLI 실행 흐름을 정확히 이해하는 것이다. 이 Chapter는 `terraform init`, `terraform plan`, `terraform apply`, `terraform destroy`의 역할과 차이를 실습 중심으로 설명한다.

이 Chapter는 Terraform을 단순히 코드 작성 도구가 아니라, 변경 계획과 검증을 포함한 운영 workflow로 이해하도록 만든다.

---

## 세부 Sections

1. 04.01 terraform init과 작업 디렉토리 초기화
2. 04.02 terraform plan과 변경 검토
3. 04.03 terraform apply / destroy

---

## 간단 소개

이 Chapter에서는 Terraform CLI 기본 workflow를 다룬다.

- provider plugin과 backend 초기화
- 변경 계획 생성과 검토
- 리소스 생성, 검증, 정리

---

# Section Definition

## 04.01 terraform init과 작업 디렉토리 초기화

### 개요

Terraform 작업 디렉토리를 처음 사용할 때 수행하는 초기화 과정을 설명한다.

### 목표

- `terraform init`의 역할 설명
- provider plugin 다운로드와 backend 초기화 이해
- 작업 디렉토리 준비 상태 판단

### 내용 요약

- `.terraform` 디렉토리
- provider plugin
- backend initialization

### Lab 요약

- 새 디렉토리에서 `terraform init` 실행
- 초기화 결과 파일 확인

---

## 04.02 terraform plan과 변경 검토

### 개요

Terraform이 실제 적용 전에 어떤 변경을 수행할지 검토하는 과정을 설명한다.

### 목표

- `terraform plan` 결과 해석
- add, change, destroy 차이 이해
- 적용 전 검토 습관 형성

### 내용 요약

- execution plan
- diff 해석
- 검토 포인트

### Lab 요약

- 신규 생성 계획 확인
- 속성 수정 시 plan diff 비교

---

## 04.03 terraform apply / destroy

### 개요

Terraform이 실제로 인프라를 생성하거나 삭제하는 실행 단계를 설명한다.

### 목표

- `terraform apply`와 `terraform destroy` 실행
- 결과 검증과 정리 절차 이해
- apply 이후 state 변화 이해

### 내용 요약

- apply 실행
- destroy 실행
- 사후 검증

### Lab 요약

- AWS 리소스 생성
- 생성 결과와 state 확인
- 리소스 정리

---

# Lab Overview

- Lab1 - init 결과와 초기화 파일 확인
- Lab2 - plan diff 해석
- Lab3 - apply 이후 생성 검증과 destroy 정리

---

# Expected Learning Outcomes

- Terraform CLI workflow를 설명할 수 있다
- 변경 적용 전 검토 과정을 수행할 수 있다
- apply와 destroy를 안전하게 실행할 수 있다

---

# Modern Key Concepts

- **Terraform Workflow**
  init → plan → apply → destroy

- **Execution Plan**
  변경 적용 전 예측 결과

- **State Update**
  apply 이후 관리 상태 반영
