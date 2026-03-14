# Chapter 01: Terraform 소개

---

# Chapter Definition

## 왜 필요한가

이 Chapter는 Terraform이 어떤 문제를 해결하는 도구인지 학습자가 먼저 이해하도록 하기 위한 시작점이다.

CloudFormation 경험이 있는 학습자에게는 Terraform이 단순히 다른 선언형 도구가 아니라, provider 기반 확장성과 Terraform state 중심 운영 모델을 가진 도구라는 점을 연결해서 설명해야 한다.

이 Chapter는 이후 Chapter에서 다룰 HCL, Terraform workflow, state, module 학습의 전제 지식을 제공한다.

---

## 세부 Sections

1. 01.01 IaC와 Terraform
2. 01.02 Terraform vs 다른 IaC 도구 비교
3. 01.03 Terraform 설치 및 환경 구성

---

## 간단 소개

이 Chapter에서는 Terraform의 정의, 필요성, 다른 IaC 도구와의 차이, AWS 실습을 위한 로컬 환경 구성을 다룬다.

- Terraform이 해결하는 운영 문제
- CloudFormation과 비교했을 때의 구조적 차이
- Terraform CLI 기반 학습 환경 준비

---

# Section Definition

## 01.01 IaC와 Terraform

### 개요

Infrastructure as Code(IaC)의 필요성과 Terraform의 역할을 설명한다.

### 목표

- Terraform의 기본 개념 설명
- Terraform이 수동 인프라 운영 문제를 어떻게 줄이는지 설명
- 선언형 설정(declarative configuration)의 의미 이해

### 내용 요약

- IaC의 정의
- Terraform의 역할
- Terraform configuration, provider, resource의 개요

### Lab 요약

- 간단한 Terraform configuration 읽기
- AWS provider와 resource 블록 형태 확인

---

## 01.02 Terraform vs 다른 IaC 도구 비교

### 개요

Terraform을 CloudFormation 중심 시각과 비교하여 차이를 설명한다.

### 목표

- Terraform과 CloudFormation의 차이 설명
- Terraform state와 CloudFormation stack 차이 이해
- multi-cloud 관점의 Terraform 장점 설명

### 내용 요약

- tool scope 차이
- 실행 모델 차이
- 상태 관리 차이

### Lab 요약

- 동일한 인프라 요구사항을 Terraform 관점으로 해석
- Terraform plan 출력과 CloudFormation change set 비교 포인트 정리

---

## 01.03 Terraform 설치 및 환경 구성

### 개요

Terraform CLI와 AWS 실습을 위한 기본 실행 환경을 준비한다.

### 목표

- Terraform CLI 설치 및 버전 확인
- AWS credentials 준비
- 실습 디렉토리 구조 이해

### 내용 요약

- Terraform 설치
- `terraform version`
- AWS provider 사용을 위한 인증 준비

### Lab 요약

- 로컬 작업 디렉토리 생성
- `terraform init` 실행 준비
- provider plugin 초기화 확인

---

# Lab Overview

이 Chapter의 실습은 Terraform 실습 환경을 준비하고 이후 Chapter의 기반을 마련하는 데 목적이 있다.

- Lab1 - Terraform configuration 기본 구조 읽기
- Lab2 - Terraform과 CloudFormation 비교 포인트 정리
- Lab3 - Terraform CLI와 AWS 인증 환경 준비

---

# Expected Learning Outcomes

이 Chapter 학습 후 학습자는 다음을 이해해야 한다.

- Terraform의 역할과 필요성
- Terraform과 다른 IaC 도구의 차이
- Terraform 실습을 위한 로컬 실행 환경 구성 방식

---

# Modern Key Concepts

- **Terraform**
  provider 기반 IaC 도구

- **Declarative Configuration**
  원하는 상태를 정의하는 방식

- **Terraform CLI**
  init, plan, apply, destroy 기반 실행 인터페이스

- **Terraform state**
  Terraform 운영 모델의 핵심 상태 정보
