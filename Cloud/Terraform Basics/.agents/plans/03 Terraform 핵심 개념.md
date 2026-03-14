# Chapter 03: Terraform 핵심 개념

---

# Chapter Definition

## 왜 필요한가

Terraform은 단순히 코드를 읽어 순서대로 실행하는 도구가 아니다. 이 Chapter는 Terraform architecture, dependency graph, lifecycle 같은 내부 동작 원리를 설명한다.

이 내용을 이해해야 `terraform plan` 결과를 해석할 수 있고, 예기치 않은 변경이나 리소스 재생성 문제를 구조적으로 판단할 수 있다.

---

## 세부 Sections

1. 03.01 Terraform Architecture와 실행 모델
2. 03.02 Dependency Graph와 리소스 의존성
3. 03.03 Lifecycle과 변경 제어

---

## 간단 소개

이 Chapter에서는 Terraform의 실행 모델을 개념적으로 설명한다.

- Terraform architecture
- dependency graph
- lifecycle meta-argument

---

# Section Definition

## 03.01 Terraform Architecture와 실행 모델

### 개요

Terraform이 configuration을 읽고 provider와 상호작용하여 실행 계획을 만드는 과정을 설명한다.

### 목표

- Terraform architecture 설명
- plan 생성 흐름 이해
- provider interaction 과정 이해

### 내용 요약

- configuration loading
- provider initialization
- state 참조
- execution planning

### Lab 요약

- 간단한 resource 구성을 대상으로 plan 생성 흐름 추적

---

## 03.02 Dependency Graph와 리소스 의존성

### 개요

Terraform이 resource 간 참조 관계를 바탕으로 dependency graph를 만드는 방식을 설명한다.

### 목표

- 암시적 의존성과 명시적 의존성 차이 이해
- resource 생성 순서 설명
- `depends_on`의 사용 시점 판단

### 내용 요약

- reference 기반 dependency
- `depends_on`
- graph 기반 실행 순서

### Lab 요약

- VPC, Subnet, Security Group 간 참조 실습
- dependency graph가 plan에 미치는 영향 확인

---

## 03.03 Lifecycle과 변경 제어

### 개요

lifecycle 설정을 통해 Terraform 변경 동작을 제어하는 방법을 설명한다.

### 목표

- `create_before_destroy` 이해
- `prevent_destroy`의 보호 목적 설명
- `ignore_changes` 사용 시 주의점 이해

### 내용 요약

- lifecycle meta-argument
- 리소스 재생성 제어
- 운영 리스크와 trade-off

### Lab 요약

- 리소스 속성 변경 시 lifecycle 차이 비교

---

# Lab Overview

- Lab1 - Terraform plan 생성 흐름 분석
- Lab2 - dependency graph 기반 실행 순서 확인
- Lab3 - lifecycle 설정에 따른 변경 차이 확인

---

# Expected Learning Outcomes

- Terraform 내부 실행 모델을 설명할 수 있다
- dependency graph를 기준으로 리소스 의존성을 해석할 수 있다
- lifecycle을 이용해 변경 동작을 제어할 수 있다

---

# Modern Key Concepts

- **Terraform Architecture**
  configuration, provider, state, plan의 연결 구조

- **Dependency Graph**
  resource 실행 순서를 결정하는 그래프

- **Lifecycle**
  변경 및 교체 동작 제어 메커니즘

- **Idempotency**
  동일 configuration 반복 실행 시 기대 상태 유지
