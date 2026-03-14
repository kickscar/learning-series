# Chapter 06: Module 구조와 재사용

---

# Chapter Definition

## 왜 필요한가

Terraform을 실무에서 사용하려면 반복되는 인프라 구성을 재사용 가능한 구조로 만들어야 한다. 이 Chapter는 module 기반 설계와 input / output interface를 설명한다.

이 Chapter를 통해 학습자는 단일 파일 수준을 넘어, root module과 child module을 분리하고 재사용 가능한 AWS 인프라 구조를 설계하는 방법을 학습한다.

---

## 세부 Sections

1. 06.01 Module 기초
2. 06.02 Input Variable과 Output 설계
3. 06.03 재사용 가능한 AWS 인프라 모듈 설계

---

## 간단 소개

이 Chapter에서는 Terraform module의 구조와 재사용 전략을 다룬다.

- root module과 child module
- module interface
- AWS 예제 기반 재사용 설계

---

# Section Definition

## 06.01 Module 기초

### 개요

Terraform module의 기본 구조와 module 분리 필요성을 설명한다.

### 목표

- module 정의 설명
- root module과 child module 구분
- 단일 디렉토리 코드의 한계 이해

### 내용 요약

- module block
- directory 구조
- 재사용 단위

### Lab 요약

- 공통 리소스를 child module로 분리

---

## 06.02 Input Variable과 Output 설계

### 개요

module의 입력과 출력 인터페이스를 어떻게 설계해야 하는지 설명한다.

### 목표

- input variable 설계
- output 값 노출
- module interface의 명확성 이해

### 내용 요약

- variable
- output
- interface consistency

### Lab 요약

- VPC module에 CIDR, name 입력값 추가
- output으로 subnet id 또는 vpc id 노출

---

## 06.03 재사용 가능한 AWS 인프라 모듈 설계

### 개요

AWS 환경에서 재사용 가능한 module을 설계하는 기준을 정리한다.

### 목표

- 범용성과 단순성의 균형 이해
- 환경별 재사용 포인트 식별
- 과도한 추상화의 위험 이해

### 내용 요약

- AWS module 구조
- naming convention
- 재사용 설계 기준

### Lab 요약

- EC2 또는 VPC module 구조 초안 설계

---

# Lab Overview

- Lab1 - 공통 resource를 module로 분리
- Lab2 - variable / output interface 설계
- Lab3 - AWS 인프라용 재사용 module 구조 설계

---

# Expected Learning Outcomes

- Terraform module 구조를 설명할 수 있다
- input variable과 output을 통해 module interface를 설계할 수 있다
- 재사용 가능한 AWS 인프라 모듈 구조를 제안할 수 있다

---

# Modern Key Concepts

- **Module Architecture**
  재사용 가능한 infrastructure 구성 단위

- **Input Variable**
  module 입력 인터페이스

- **Output**
  module 결과값 노출 방식
