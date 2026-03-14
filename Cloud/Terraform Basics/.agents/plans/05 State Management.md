# Chapter 05: State Management

---

# Chapter Definition

## 왜 필요한가

Terraform state는 Terraform 운영 모델의 핵심이다. 이 Chapter는 state가 왜 필요한지, local backend와 remote backend가 어떻게 다른지, 협업 환경에서 어떤 운영 문제가 발생하는지를 설명한다.

state를 이해하지 못하면 Terraform 변경 결과를 신뢰하기 어렵고, 팀 단위 운영에서 충돌과 drift 문제가 반복된다.

---

## 세부 Sections

1. 05.01 Terraform state 이해
2. 05.02 Local State vs Remote Backend
3. 05.03 Drift와 State 운영

---

## 간단 소개

이 Chapter에서는 Terraform state의 구조와 운영 관점을 다룬다.

- state file의 역할
- backend 선택 기준
- drift 관리

---

# Section Definition

## 05.01 Terraform state 이해

### 개요

Terraform이 관리 대상 인프라와 현재 상태를 추적하기 위해 state를 사용하는 이유를 설명한다.

### 목표

- Terraform state의 역할 설명
- state file에 어떤 정보가 저장되는지 이해
- plan과 state의 관계 설명

### 내용 요약

- state file
- resource address
- 현재 상태 추적

### Lab 요약

- apply 이후 state 내용 확인
- resource 주소와 attribute 확인

---

## 05.02 Local State vs Remote Backend

### 개요

local backend와 remote backend의 차이와 협업 환경에서 remote backend가 필요한 이유를 설명한다.

### 목표

- backend 개념 설명
- S3 기반 remote backend의 장점 이해
- state locking 필요성 이해

### 내용 요약

- local backend
- remote backend
- state locking

### Lab 요약

- local state 구조 확인
- S3 backend 예제 configuration 설계

---

## 05.03 Drift와 State 운영

### 개요

실제 인프라와 Terraform state가 불일치하는 drift 상황과 운영상 주의점을 설명한다.

### 목표

- drift 개념 설명
- 수동 변경의 위험 이해
- state 운영 시 주의사항 정리

### 내용 요약

- drift
- import
- 협업 충돌 방지

### Lab 요약

- 수동 변경 후 plan 차이 확인
- drift 발견 시 대응 흐름 정리

---

# Lab Overview

- Lab1 - state file 구조 확인
- Lab2 - backend 전환 설계
- Lab3 - drift 상황 관찰과 대응 절차 정리

---

# Expected Learning Outcomes

- Terraform state의 역할을 설명할 수 있다
- local backend와 remote backend의 차이를 설명할 수 있다
- drift와 state 운영 리스크를 식별할 수 있다

---

# Modern Key Concepts

- **Terraform state**
  Terraform이 관리 상태를 기록하는 핵심 데이터

- **remote backend**
  협업을 위한 원격 state 저장소

- **state locking**
  동시 수정 방지 메커니즘

- **drift**
  실제 인프라와 state의 불일치
