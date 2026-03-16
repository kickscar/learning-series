# Chapter 13: Networking

---

# Chapter Definition

## 왜 필요한가

Terraform 기초 개념을 실제 AWS Networking에 적용해보아야 구조적 이해가 깊어진다. 이 Chapter는 VPC와 서브넷부터 보안 계층까지 네트워크 설계를 실습한다.

---

## 세부 Sections

1. 13.01 VPC 모듈로 CIDR/서브넷 설계
2. 13.02 NAT Gateway, Internet Gateway
3. 13.03 Security Group과 NACL
4. 13.04 퍼블릭/프라이빗 서브넷 구성

---

## 간단 소개

- CIDR과 subnet 설계
- public/private 연결 구조
- 보안 그룹과 NACL 차이
- 네트워크 계층 실전 구성

---

# Section Definition

## 13.01 VPC 모듈로 CIDR/서브넷 설계
### 개요
VPC와 subnet 설계를 module 관점으로 설명한다.
### 목표
- CIDR 계획
- subnet 분할
- 네트워크 기본 구조 설계
### 내용 요약
- VPC
- CIDR
- subnet
### Lab 요약
- VPC module 기반 subnet 설계

## 13.02 NAT Gateway, Internet Gateway
### 개요
외부 통신을 위한 게이트웨이 구조를 설명한다.
### 목표
- IGW와 NAT 역할 이해
- public/private 차이 이해
- 라우팅 흐름 파악
### 내용 요약
- IGW
- NAT Gateway
- route table
### Lab 요약
- public/private route 구성

## 13.03 Security Group과 NACL
### 개요
네트워크 보안 계층 두 가지를 비교한다.
### 목표
- SG와 NACL 차이 이해
- 상태 저장 차이 이해
- 보안 정책 설계
### 내용 요약
- Security Group
- NACL
- ingress/egress
### Lab 요약
- 웹 계층 보안 규칙 설계

## 13.04 퍼블릭/프라이빗 서브넷 구성
### 개요
퍼블릭과 프라이빗 서브넷을 조합한 구조를 설명한다.
### 목표
- subnet 역할 분리
- 다중 AZ 구조 이해
- 네트워크 계층 배치
### 내용 요약
- public subnet
- private subnet
- multi-AZ
### Lab 요약
- ALB와 app subnet 분리

---

# Lab Overview

- Lab1 - VPC와 subnet 설계
- Lab2 - IGW, NAT, route table 구성
- Lab3 - SG와 NACL 보안 규칙 비교
- Lab4 - public/private subnet 아키텍처 구성

---

# Expected Learning Outcomes

- AWS 네트워크 기본 구조를 Terraform으로 설계할 수 있다
- IGW와 NAT 역할을 설명할 수 있다
- SG와 NACL 차이를 설명할 수 있다
- public/private subnet 구조를 구성할 수 있다

---

# Modern Key Concepts

- **VPC**
  AWS 네트워크 격리 단위
- **Subnet**
  네트워크 세분화 단위
- **NAT Gateway**
  private subnet의 outbound 통신 수단
- **Security Boundary**
  SG와 NACL 기반 보안 계층
