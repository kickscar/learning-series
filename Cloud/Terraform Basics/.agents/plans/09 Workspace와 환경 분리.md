# Chapter 09: Workspace와 환경 분리

---

# Chapter Definition

## 왜 필요한가

여러 환경을 운영할 때 workspace를 사용할지, 디렉토리를 분리할지 결정해야 한다. 이 Chapter는 두 전략의 차이와 운영 기준을 다룬다.

---

## 세부 Sections

1. 09.01 Workspace 개념과 사용법
2. 09.02 Workspace vs 디렉터리 분리
3. 09.03 dev/prod Workspace 운영

---

## 간단 소개

- workspace 개념과 명령
- workspace와 디렉토리 분리 비교
- dev/prod 상태 분리 운영

---

# Section Definition

## 09.01 Workspace 개념과 사용법
### 개요
Terraform workspace의 정의와 기본 사용법을 설명한다.
### 목표
- workspace 개념 이해
- workspace 생성과 전환
- state 분리 방식 이해
### 내용 요약
- workspace
- state separation
- CLI command
### Lab 요약
- workspace 생성과 선택

## 09.02 Workspace vs 디렉터리 분리
### 개요
두 환경 분리 전략을 비교한다.
### 목표
- 장단점 비교
- 적용 기준 정리
- 팀 운영 관점 판단
### 내용 요약
- workspace
- directory split
- trade-off
### Lab 요약
- 동일 구조를 두 방식으로 비교

## 09.03 dev/prod Workspace 운영
### 개요
workspace 기반 환경 운영 예시를 정리한다.
### 목표
- dev/prod 분리
- 위험 요소 식별
- 안전한 명명 규칙 이해
### 내용 요약
- dev/prod
- naming
- safe operation
### Lab 요약
- dev/prod workspace 전환과 plan 비교

---

# Lab Overview

- Lab1 - workspace 생성과 전환
- Lab2 - workspace와 디렉토리 분리 비교
- Lab3 - dev/prod workspace 운영 흐름

---

# Expected Learning Outcomes

- workspace를 사용할 수 있다
- 환경 분리 전략을 비교할 수 있다
- dev/prod 운영에서 주의점을 설명할 수 있다

---

# Modern Key Concepts

- **Workspace**
  state 분리 단위
- **Environment Separation**
  환경별 운영 구조 분리
- **Trade-off**
  단순성, 안전성, 가시성의 균형
