# Chapter 02: HCL 기초

---

# Chapter Definition

## 왜 필요한가

Terraform을 사용하려면 먼저 Terraform configuration을 읽고 작성할 수 있어야 한다. 이 Chapter는 HCL 구조와 Terraform이 코드를 해석하는 기본 단위를 설명한다.

이 Chapter를 통해 학습자는 provider, resource, data source, local value 같은 기본 구성 요소를 이해하고 이후 workflow와 state 학습에 필요한 코드 문해력을 확보한다.

---

## 세부 Sections

1. 02.01 HCL 문법 개요
2. 02.02 Resource와 Provider
3. 02.03 Data Source와 Local Value

---

## 간단 소개

이 Chapter에서는 Terraform configuration의 문법과 주요 블록 구조를 설명한다.

- HCL block, argument, expression
- provider와 resource 선언 방식
- data source와 local value의 역할

---

# Section Definition

## 02.01 HCL 문법 개요

### 개요

Terraform configuration의 기본 문법 단위를 설명한다.

### 목표

- HCL block 구조 설명
- argument와 expression 차이 이해
- Terraform configuration 파일을 읽을 수 있음

### 내용 요약

- block
- argument
- value type
- expression

### Lab 요약

- 단순 변수와 로컬 값 예제 읽기
- block 구조를 가진 sample configuration 분석

---

## 02.02 Resource와 Provider

### 개요

Terraform이 외부 플랫폼과 상호작용하는 provider와 실제 관리 대상인 resource를 설명한다.

### 목표

- provider 선언 작성
- resource 블록 구조 이해
- AWS resource 기본 예제 해석

### 내용 요약

- provider 역할
- resource 주소 체계
- argument 기반 리소스 정의

### Lab 요약

- AWS provider 선언
- `aws_vpc`, `aws_subnet` 예제 작성

---

## 02.03 Data Source와 Local Value

### 개요

이미 존재하는 값을 조회하는 data source와 내부 계산에 사용하는 local value를 분리해서 설명한다.

### 목표

- data source 사용 목적 설명
- local value로 중복 계산 제거
- 조회 값과 생성 값의 차이 이해

### 내용 요약

- data source
- local value
- 참조 표현식

### Lab 요약

- AWS 가용 영역 조회 예제
- local value를 활용한 naming 규칙 구성

---

# Lab Overview

이 Chapter의 실습은 Terraform configuration 작성의 기초를 익히는 데 목적이 있다.

- Lab1 - HCL 기본 문법 읽기
- Lab2 - AWS provider와 resource 선언
- Lab3 - data source와 local value 활용

---

# Expected Learning Outcomes

- Terraform configuration을 읽고 기본 구조를 이해할 수 있다
- provider와 resource의 역할을 설명할 수 있다
- data source와 local value를 구분해서 사용할 수 있다

---

# Modern Key Concepts

- **HCL**
  Terraform configuration language

- **provider**
  외부 플랫폼 연동 플러그인

- **resource**
  Terraform이 관리하는 인프라 객체

- **data source**
  기존 인프라 정보 조회 수단
