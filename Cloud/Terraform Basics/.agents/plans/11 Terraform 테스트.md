# Chapter 11: Terraform 테스트

---

# Chapter Definition

## 왜 필요한가

중요한 module과 인프라 코드는 테스트 가능한 구조여야 한다. 이 Chapter는 테스트 전략과 Terratest 기반 실전 테스트 방식을 설명한다.

---

## 세부 Sections

1. 11.01 테스트 전략 개요
2. 11.02 terratest 기초
3. 11.03 테스트 가능한 모듈 설계
4. 11.04 VPC 모듈 테스트 작성

---

## 간단 소개

- 테스트 수준 구분
- Terratest 기초
- 테스트 가능한 module interface
- VPC module 검증 예제

---

# Section Definition

## 11.01 테스트 전략 개요
### 개요
Terraform 코드 테스트 전략을 설명한다.
### 목표
- 무엇을 테스트할지 구분
- 테스트 범위 정의
- 비용과 효과 이해
### 내용 요약
- test scope
- module test
- integration test
### Lab 요약
- 테스트 포인트 식별

## 11.02 terratest 기초
### 개요
Terratest의 기본 실행 흐름을 설명한다.
### 목표
- Terratest 구조 이해
- Go 기반 실행 개념 이해
- 기본 테스트 흐름 파악
### 내용 요약
- Terratest
- Go test
- setup/apply/assert/destroy
### Lab 요약
- 간단한 Terratest 예제 읽기

## 11.03 테스트 가능한 모듈 설계
### 개요
테스트하기 쉬운 module 구조를 설명한다.
### 목표
- 명확한 input/output 설계
- 외부 의존성 최소화
- 테스트 단위 분리
### 내용 요약
- module interface
- deterministic config
- testability
### Lab 요약
- 테스트 가능한 VPC module 구조 점검

## 11.04 VPC 모듈 테스트 작성
### 개요
VPC module 테스트 예제를 설계한다.
### 목표
- 자원 생성 검증
- output 검증
- 정리 흐름 포함
### 내용 요약
- VPC assertion
- output check
- cleanup
### Lab 요약
- VPC module Terratest 작성

---

# Lab Overview

- Lab1 - 테스트 포인트 정의
- Lab2 - Terratest 기본 흐름 이해
- Lab3 - 테스트 가능한 module 구조 검토
- Lab4 - VPC module 테스트 작성

---

# Expected Learning Outcomes

- Terraform 테스트 전략을 설명할 수 있다
- Terratest의 기본 개념을 이해할 수 있다
- 테스트 가능한 module을 설계할 수 있다
- VPC module 테스트 예제를 해석할 수 있다

---

# Modern Key Concepts

- **Test Strategy**
  무엇을 어떤 수준에서 검증할지 정하는 방식
- **Terratest**
  Terraform 통합 테스트 도구
- **Testability**
  테스트 가능한 구조적 특성
- **Cleanup**
  테스트 후 자원 정리
