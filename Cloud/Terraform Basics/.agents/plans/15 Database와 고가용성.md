# Chapter 15: Database와 고가용성

---

# Chapter Definition

## 왜 필요한가

Terraform을 활용한 AWS 실습의 마지막 단계로 database와 high availability 구성을 다룬다. 이 Chapter는 RDS, Multi-AZ, ALB/ELB, 3-tier 구조를 종합한다.

---

## 세부 Sections

1. 15.01 RDS 구성
2. 15.02 Multi-AZ와 파라미터 그룹
3. 15.03 ALB/ELB와 타겟 그룹
4. 15.04 고가용성 3-tier 구성

---

## 간단 소개

- RDS 배포
- Multi-AZ와 parameter group
- ALB/ELB 기반 트래픽 분산
- 고가용성 3-tier 아키텍처 종합

---

# Section Definition

## 15.01 RDS 구성
### 개요
RDS 인스턴스 구성을 설명한다.
### 목표
- DB engine 선택
- subnet group 이해
- 기본 배포 구조 파악
### 내용 요약
- RDS
- subnet group
- parameter
### Lab 요약
- RDS 기본 배포

## 15.02 Multi-AZ와 파라미터 그룹
### 개요
고가용성과 설정 제어를 설명한다.
### 목표
- Multi-AZ 역할 이해
- parameter group 사용
- 운영 설정 이해
### 내용 요약
- Multi-AZ
- parameter group
- availability
### Lab 요약
- Multi-AZ 옵션 구성

## 15.03 ALB/ELB와 타겟 그룹
### 개요
로드 밸런싱 계층을 설명한다.
### 목표
- ALB/ELB 차이 이해
- target group 구조 이해
- 트래픽 분산 설계
### 내용 요약
- ALB
- ELB
- target group
### Lab 요약
- ALB와 target group 연결

## 15.04 고가용성 3-tier 구성
### 개요
network, app, db를 포함한 종합 아키텍처를 정리한다.
### 목표
- 3-tier 구조 이해
- HA 설계 포인트 파악
- 앞선 Chapter 종합
### 내용 요약
- 3-tier
- high availability
- integrated architecture
### Lab 요약
- 종합 아키텍처 구성 초안 작성

---

# Lab Overview

- Lab1 - RDS 배포
- Lab2 - Multi-AZ와 parameter group 설정
- Lab3 - ALB와 target group 구성
- Lab4 - 고가용성 3-tier 아키텍처 종합

---

# Expected Learning Outcomes

- RDS를 Terraform으로 구성할 수 있다
- Multi-AZ와 parameter group의 의미를 설명할 수 있다
- ALB/ELB와 target group 구조를 이해할 수 있다
- 고가용성 3-tier 구성을 설명할 수 있다

---

# Modern Key Concepts

- **RDS**
  AWS managed database
- **Multi-AZ**
  가용성 확보 구조
- **ALB/ELB**
  트래픽 분산 계층
- **High Availability**
  장애 대응을 고려한 설계
