# Chapter 12: CI/CD 연동

---

# Chapter Definition

## 왜 필요한가

Terraform 운영에서는 PR 검토, 자동 plan, 승인 후 apply 같은 workflow가 중요하다. 이 Chapter는 CI/CD와 협업 자동화를 다룬다.

---

## 세부 Sections

1. 12.01 Terraform CI/CD 패턴
2. 12.02 GitHub Actions로 plan/apply 자동화
3. 12.03 Atlantis 또는 Terraform Cloud
4. 12.04 PR 기반 plan, merge 시 apply

---

## 간단 소개

- CI/CD 기본 패턴
- GitHub Actions workflow
- Atlantis와 Terraform Cloud 비교
- PR 기반 승인 흐름

---

# Section Definition

## 12.01 Terraform CI/CD 패턴
### 개요
Terraform CI/CD의 기본 구조를 설명한다.
### 목표
- plan/apply 분리
- 승인 흐름 이해
- 자동화 기준 정리
### 내용 요약
- CI/CD
- review gate
- apply control
### Lab 요약
- 기본 파이프라인 설계

## 12.02 GitHub Actions로 plan/apply 자동화
### 개요
GitHub Actions 기반 자동화를 설명한다.
### 목표
- workflow 구조 이해
- plan 자동화
- 비밀 정보 관리 이해
### 내용 요약
- GitHub Actions
- workflow file
- secret
### Lab 요약
- plan workflow 설계

## 12.03 Atlantis 또는 Terraform Cloud
### 개요
협업 도구를 비교한다.
### 목표
- 도구별 역할 이해
- 운영 trade-off 비교
- 선택 기준 정리
### 내용 요약
- Atlantis
- Terraform Cloud
- collaboration
### Lab 요약
- 도구 비교표 작성

## 12.04 PR 기반 plan, merge 시 apply
### 개요
실무형 승인 기반 배포 흐름을 설명한다.
### 목표
- PR 검토 중심 운영 이해
- merge 후 apply 구조 이해
- 위험 제어 기준 정리
### 내용 요약
- PR plan
- merge apply
- approval flow
### Lab 요약
- PR 기반 운영 시나리오 정리

---

# Lab Overview

- Lab1 - CI/CD 파이프라인 설계
- Lab2 - GitHub Actions workflow 작성
- Lab3 - Atlantis와 Terraform Cloud 비교
- Lab4 - PR 기반 적용 흐름 정리

---

# Expected Learning Outcomes

- Terraform CI/CD 패턴을 설명할 수 있다
- GitHub Actions로 plan 자동화를 설계할 수 있다
- 협업 도구를 비교할 수 있다
- 승인 기반 apply 흐름을 이해할 수 있다

---

# Modern Key Concepts

- **Plan Automation**
  변경 계획 자동 생성
- **Approval Flow**
  승인 기반 적용 제어
- **GitHub Actions**
  workflow 자동화 수단
- **Collaboration Platform**
  Atlantis, Terraform Cloud 같은 협업 도구
