# Chapter 02: IAM

## 챕터 목표

AWS 리소스에 대한 접근 제어와 보안의 기초를 학습한다. User, Group, Policy, Role의 개념과 관계를 이해하고, Console에서 직접 권한 관리 체계를 구성한다.

## 챕터 성격

이론 + 실습. 각 IAM 구성 요소를 개별적으로 학습하고 Console에서 직접 생성/관리한다.

---

## Section 구성

### 01 IAM 개요

**주요 내용:**

- IAM(Identity and Access Management)이란
  - AWS 리소스에 대한 접근을 안전하게 제어하는 서비스
  - 인증(Authentication)과 인가(Authorization)의 차이
- IAM의 핵심 구성 요소
  - User: AWS에 접근하는 개별 사용자
  - Group: User를 묶어 권한을 일괄 관리
  - Policy: 권한을 정의하는 JSON 문서
  - Role: 임시 자격 증명을 통한 권한 위임
- Root User vs IAM User
  - Root User의 위험성
  - IAM User를 통한 일상 작업 권장
  - Root User MFA 설정의 중요성

**실습:** 없음

---

### 02 User와 Group

**주요 내용:**

- IAM User
  - Console 접근(Password)과 Programmatic 접근(Access Key)
  - User 생성 절차
  - 자격 증명 유형과 보안 관리
- IAM Group
  - Group의 역할: User를 묶어 Policy를 일괄 적용
  - Group 생성과 User 추가
  - Group 기반 권한 관리의 장점
- MFA(Multi-Factor Authentication)
  - MFA의 필요성
  - 가상 MFA 디바이스 설정

**실습:**

- lab03: IAM User와 Group 생성
  - Admin Group 생성, IAM User 생성 및 Group 추가, MFA 설정, IAM User로 Console 로그인

---

### 03 Policy

**주요 내용:**

- IAM Policy 구조
  - JSON 문서: Effect, Action, Resource, Condition
  - Statement 구조와 작성 방법
- Policy 유형
  - AWS Managed Policy: AWS가 제공하는 사전 정의 Policy
  - Customer Managed Policy: 사용자가 직접 작성하는 Policy
  - Inline Policy: 특정 User/Group/Role에 직접 연결하는 Policy
- Policy 평가 로직
  - 명시적 Deny > 명시적 Allow > 암시적 Deny
  - 다중 Policy 적용 시 평가 순서
- 실전 Policy 패턴
  - 최소 권한 원칙(Least Privilege)
  - 특정 서비스 접근만 허용하는 Policy 작성

**실습:**

- lab04: Custom Policy 생성과 연결
  - S3 ReadOnly Policy 작성, Group에 연결, 권한 동작 확인

---

### 04 Role

**주요 내용:**

- IAM Role이란
  - 임시 자격 증명(Temporary Credentials)을 통한 권한 위임
  - User와 Role의 차이: 영구 자격 증명 vs 임시 자격 증명
- Role의 구성 요소
  - Trust Policy: 누가 이 Role을 맡을 수 있는가 (Assume)
  - Permission Policy: 이 Role이 무엇을 할 수 있는가
- Role의 활용 시나리오
  - EC2 Instance에 Role 연결: Instance Profile
  - AWS 서비스 간 권한 위임
  - Cross-Account 접근 (개념 소개)
- Instance Profile
  - EC2가 다른 AWS 서비스(S3, RDS 등)에 접근하기 위한 메커니즘
  - Instance Profile 생성과 EC2 연결

**실습:**

- lab05: EC2용 IAM Role 생성
  - S3 접근 권한을 가진 Role 생성, Instance Profile 구성

---

## 선행 조건

- Ch01 학습 완료 (AWS 계정, Console 접근)

---

## 상태

- 작성일: 2026-03-19
- 상태: 확정
