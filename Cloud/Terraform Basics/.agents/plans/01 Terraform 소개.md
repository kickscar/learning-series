# Chapter 01: Terraform 소개

---

# Chapter Definition

## 왜 필요한가

이 Chapter는 Terraform이 어떤 문제를 해결하는 도구인지 먼저 설명하는 입문 단계이다. IaC의 필요성, CloudFormation과의 차이, 실습 환경 준비를 통해 이후 학습의 기준선을 만든다.

---

## 세부 Sections

1. 01.01 IaC와 Terraform
2. 01.02 CloudFormation vs Terraform 비교
3. 01.03 Terraform 설치 및 환경 구성

---

## 간단 소개

- IaC와 Terraform의 역할 설명
- CloudFormation 경험자 관점의 비교
- Terraform CLI와 AWS 실습 환경 준비

---

# Section Definition

## 01.01 IaC와 Terraform
### 개요
IaC의 정의와 Terraform의 역할을 설명한다.
### 목표
- IaC 필요성 설명
- Terraform 기본 개념 이해
- provider와 resource 구분
### 내용 요약
- IaC
- Terraform
- provider
- resource
### Lab 요약
- Terraform configuration 읽기
- provider와 resource 블록 식별

## 01.02 CloudFormation vs Terraform 비교
### 개요
CloudFormation과 Terraform의 차이를 비교한다.
### 목표
- 두 도구의 실행 모델 비교
- 상태 관리 방식 비교
- Terraform 선택 기준 이해
### 내용 요약
- CloudFormation stack
- Terraform state
- multi-cloud 관점
### Lab 요약
- 동일 요구사항을 두 도구 관점으로 비교

## 01.03 Terraform 설치 및 환경 구성
### 개요
Terraform CLI와 AWS 실습 환경을 준비한다.
### 목표
- Terraform 설치
- 버전 확인
- AWS credentials 준비
### 내용 요약
- Terraform CLI
- AWS 인증
- 작업 디렉토리
### Lab 요약
- `terraform version`
- 기본 디렉토리 초기화

---

# Lab Overview

- Lab1 - Terraform configuration 기본 구조 읽기
- Lab2 - CloudFormation과 Terraform 비교 정리
- Lab3 - Terraform CLI 설치와 환경 검증

---

# Expected Learning Outcomes

- Terraform의 역할과 필요성을 설명할 수 있다
- CloudFormation과 Terraform의 차이를 설명할 수 있다
- Terraform 실습 환경을 구성할 수 있다

---

# Modern Key Concepts

- **Infrastructure as Code(IaC)**
  인프라를 코드로 정의하는 방식
- **Terraform**
  provider 기반 IaC 도구
- **Terraform CLI**
  init, plan, apply, destroy 중심 실행 인터페이스
- **Terraform vs CloudFormation**
  상태 관리와 적용 방식 차이
