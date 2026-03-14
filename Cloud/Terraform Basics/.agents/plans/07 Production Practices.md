# Chapter 07: Production Practices

---

# Chapter Definition

## 왜 필요한가

Terraform을 학습용 예제 수준에서 끝내지 않으려면 운영 환경에서 어떤 구조와 규칙이 필요한지 이해해야 한다. 이 Chapter는 환경 분리, 코드 품질, 협업 workflow, 운영 안티패턴을 정리한다.

이 Chapter는 Terraform Basics 시리즈의 마지막 단계로서, 이후 Advanced 학습으로 넘어가기 위한 최소한의 운영 감각을 제공한다.

---

## 세부 Sections

1. 07.01 디렉토리 구조와 환경 분리
2. 07.02 코드 품질과 협업 workflow
3. 07.03 운영 시 주의사항과 안티패턴

---

## 간단 소개

이 Chapter에서는 실무 운영을 위한 기본 패턴을 설명한다.

- dev / stage / prod 분리
- 코드 검증과 review 기준
- 위험한 운영 패턴 식별

---

# Section Definition

## 07.01 디렉토리 구조와 환경 분리

### 개요

환경별 디렉토리 분리와 공통 module 재사용 전략을 설명한다.

### 목표

- 환경 분리 필요성 설명
- 공통 코드와 환경별 값 분리
- 운영 디렉토리 구조 제안

### 내용 요약

- environment separation
- shared module
- tfvars 또는 변수 분리

### Lab 요약

- dev / prod 구조 예시 설계

---

## 07.02 코드 품질과 협업 workflow

### 개요

Terraform 코드를 팀 단위로 관리할 때 필요한 품질 기준과 협업 workflow를 설명한다.

### 목표

- `terraform fmt`, `terraform validate` 역할 이해
- PR review 기준 설명
- plan 검토 중심 협업 방식 이해

### 내용 요약

- formatting
- validation
- review workflow

### Lab 요약

- 코드 검증 명령 실행 흐름 정리
- 리뷰 체크리스트 작성

---

## 07.03 운영 시 주의사항과 안티패턴

### 개요

Terraform 운영에서 자주 발생하는 위험한 패턴과 이를 피하는 기준을 설명한다.

### 목표

- 수동 변경의 위험 설명
- state 공유 문제 이해
- 과도한 모듈화와 결합도 증가 문제 식별

### 내용 요약

- manual change
- state collision
- over-abstraction

### Lab 요약

- 안티패턴 사례를 Terraform 운영 관점에서 분석

---

# Lab Overview

- Lab1 - 환경 분리 디렉토리 구조 설계
- Lab2 - Terraform 코드 검증과 review 절차 정리
- Lab3 - 운영 안티패턴 사례 분석

---

# Expected Learning Outcomes

- Terraform 운영 디렉토리 구조를 제안할 수 있다
- 코드 품질과 협업 workflow를 설명할 수 있다
- 운영 리스크와 안티패턴을 식별할 수 있다

---

# Modern Key Concepts

- **Environment Separation**
  환경별 설정과 상태 분리

- **Validation Workflow**
  fmt, validate, plan 기반 검증

- **Operational Risk**
  state, drift, manual change에서 발생하는 운영 문제
