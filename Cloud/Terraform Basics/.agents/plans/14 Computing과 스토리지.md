# Chapter 14: Computing과 스토리지

---

# Chapter Definition

## 왜 필요한가

Terraform을 실제 AWS 운영에 적용하려면 EC2, EBS, S3 같은 핵심 리소스를 다뤄야 한다. 이 Chapter는 compute와 storage 리소스의 기본 운영 구조를 실습한다.

---

## 세부 Sections

1. 14.01 EC2 인스턴스 및 AMI
2. 14.02 EBS 볼륨과 스냅샷
3. 14.03 S3 버킷 정책과 버전 관리
4. 14.04 EC2 + S3 연동

---

## 간단 소개

- EC2 생성과 AMI 선택
- EBS 볼륨과 스냅샷
- S3 보안과 버전 관리
- compute와 storage 연결 예제

---

# Section Definition

## 14.01 EC2 인스턴스 및 AMI
### 개요
EC2 resource와 AMI 선택 기준을 설명한다.
### 목표
- EC2 생성
- AMI 선택 이해
- 기본 속성 파악
### 내용 요약
- EC2
- AMI
- instance type
### Lab 요약
- EC2 instance 생성

## 14.02 EBS 볼륨과 스냅샷
### 개요
EBS 볼륨과 스냅샷 운영을 설명한다.
### 목표
- 볼륨 생성
- attach 구조 이해
- snapshot 역할 이해
### 내용 요약
- EBS
- snapshot
- attachment
### Lab 요약
- EBS 볼륨 추가와 snapshot

## 14.03 S3 버킷 정책과 버전 관리
### 개요
S3 bucket의 정책과 버전 관리 기능을 설명한다.
### 목표
- bucket policy 이해
- versioning 설정
- 공개 접근 제어 이해
### 내용 요약
- S3
- bucket policy
- versioning
### Lab 요약
- 버킷 정책과 versioning 설정

## 14.04 EC2 + S3 연동
### 개요
compute와 storage를 연결하는 예제를 설명한다.
### 목표
- IAM role 연결
- 애플리케이션에서 S3 접근 이해
- 리소스 간 의존성 파악
### 내용 요약
- IAM role
- instance profile
- S3 access
### Lab 요약
- EC2에서 S3 접근 가능한 구성

---

# Lab Overview

- Lab1 - EC2 instance 생성
- Lab2 - EBS 볼륨과 snapshot 관리
- Lab3 - S3 bucket 보안 설정
- Lab4 - EC2와 S3 연동 구성

---

# Expected Learning Outcomes

- EC2와 AMI 구성을 Terraform으로 작성할 수 있다
- EBS와 snapshot 흐름을 이해할 수 있다
- S3 bucket 정책과 versioning을 설명할 수 있다
- EC2와 S3 연동 구조를 설계할 수 있다

---

# Modern Key Concepts

- **EC2**
  AWS compute resource
- **AMI**
  instance 이미지
- **EBS**
  block storage
- **S3**
  object storage
