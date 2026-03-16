# Chapter 02: HCL 기초

---

# Chapter Definition

## 왜 필요한가

Terraform을 사용하려면 먼저 Terraform configuration을 읽고 작성할 수 있어야 한다. 이 Chapter는 HCL 문법과 Terraform 구성 요소의 기본 구조를 설명한다.

---

## 세부 Sections

1. 02.01 HCL 문법 개요
2. 02.02 Resource와 Provider
3. 02.03 Data Source 활용
4. 02.04 변수와 출력

---

## 간단 소개

- HCL block, argument, expression 이해
- provider와 resource 선언 방식 이해
- data source로 기존 값 조회
- variable과 output의 기본 사용법 학습

---

# Section Definition

## 02.01 HCL 문법 개요
### 개요
HCL의 기본 문법 단위를 설명한다.
### 목표
- block 구조 이해
- argument와 expression 구분
- 기본 HCL 읽기
### 내용 요약
- HCL
- block
- argument
- expression
### Lab 요약
- sample configuration 분석

## 02.02 Resource와 Provider
### 개요
provider와 resource의 역할을 설명한다.
### 목표
- AWS provider 선언
- resource 블록 이해
- resource 주소 체계 이해
### 내용 요약
- provider
- resource
- resource address
### Lab 요약
- `aws_vpc`, `aws_subnet` 선언

## 02.03 Data Source 활용
### 개요
이미 존재하는 인프라 정보를 조회하는 data source를 설명한다.
### 목표
- data source 역할 이해
- 조회 값 참조 방법 이해
- resource와 data source 구분
### 내용 요약
- data source
- 조회 값 참조
- AWS existing info
### Lab 요약
- availability zone 조회

## 02.04 변수와 출력
### 개요
Terraform configuration의 입력과 결과 노출 방식을 설명한다.
### 목표
- input variable 선언
- output 사용
- 값 전달 흐름 이해
### 내용 요약
- variable
- output
- 기본 값 전달
### Lab 요약
- variable 기반 VPC CIDR 변경
- output으로 결과 노출

---

# Lab Overview

- Lab1 - HCL 기본 구조 읽기
- Lab2 - provider와 resource 선언
- Lab3 - data source 사용
- Lab4 - variable과 output 활용

---

# Expected Learning Outcomes

- Terraform configuration을 읽고 작성할 수 있다
- provider와 resource를 구분할 수 있다
- data source를 사용할 수 있다
- variable과 output의 기본 흐름을 설명할 수 있다

---

# Modern Key Concepts

- **HCL**
  Terraform configuration language
- **provider**
  외부 플랫폼 연동 플러그인
- **resource**
  Terraform이 관리하는 인프라 객체
- **data source**
  기존 인프라 조회 방식
