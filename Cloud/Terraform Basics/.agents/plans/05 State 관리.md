# Chapter 05: State 관리

---

# Chapter Definition

## 왜 필요한가

Terraform state를 협업 환경에서 안전하게 운영하려면 remote backend, state locking, import, migrate, 보안 제어를 이해해야 한다. 이 Chapter는 Terraform 운영의 핵심 안정성 주제를 다룬다.

---

## 세부 Sections

1. 05.01 Remote State
2. 05.02 State Locking과 동시 실행
3. 05.03 State import와 migrate
4. 05.04 State 보안과 접근 제어

---

## 간단 소개

- S3 기반 remote backend
- DynamoDB locking
- import와 backend migration
- state 접근 제어와 보호 전략

---

# Section Definition

## 05.01 Remote State
### 개요
remote backend의 필요성과 S3 기반 구성을 설명한다.
### 목표
- remote backend 필요성 이해
- local backend와 차이 설명
- S3 backend 구조 이해
### 내용 요약
- remote backend
- S3
- 협업 환경
### Lab 요약
- S3 backend configuration 작성

## 05.02 State Locking과 동시 실행
### 개요
state locking이 필요한 이유를 설명한다.
### 목표
- 동시 실행 위험 이해
- DynamoDB locking 구조 이해
- 충돌 방지 전략 파악
### 내용 요약
- state locking
- 동시 apply
- DynamoDB
### Lab 요약
- locking 동작 흐름 분석

## 05.03 State import와 migrate
### 개요
기존 자원을 Terraform 관리로 편입하고 backend를 이전하는 방식을 설명한다.
### 목표
- import 역할 이해
- migrate 목적 이해
- 점진적 전환 방법 파악
### 내용 요약
- import
- migrate
- 기존 자원 편입
### Lab 요약
- import 예제와 backend migration 흐름

## 05.04 State 보안과 접근 제어
### 개요
state file 보호와 권한 제어 방식을 설명한다.
### 목표
- state 민감 정보 위험 이해
- 접근 제어 구조 설계
- 암호화와 버전 관리 필요성 이해
### 내용 요약
- state 보안
- IAM
- encryption
### Lab 요약
- S3 encryption과 접근 정책 검토

---

# Lab Overview

- Lab1 - S3 remote backend 구성
- Lab2 - state locking 구조 이해
- Lab3 - import와 migration 시나리오 정리
- Lab4 - state 보안 설정 검토

---

# Expected Learning Outcomes

- remote backend를 설명하고 설계할 수 있다
- state locking의 필요성을 설명할 수 있다
- import와 migration 흐름을 이해할 수 있다
- state 보안 기준을 제안할 수 있다

---

# Modern Key Concepts

- **Remote Backend**
  협업용 원격 state 저장소
- **State Locking**
  동시 수정 방지
- **Import**
  기존 자원 편입 기능
- **State Security**
  state 보호와 권한 통제
