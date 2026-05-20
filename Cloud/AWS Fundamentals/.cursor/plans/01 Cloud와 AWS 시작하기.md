# Chapter 01: Cloud와 AWS 시작하기

## 챕터 목표

Cloud Computing의 기본 개념과 서비스 모델을 이해하고, AWS의 글로벌 인프라 구조를 학습한다. AWS 계정을 생성하고 Console을 통해 AWS 서비스에 접근하는 방법을 익힌다.

## 챕터 성격

개념/이론 중심. Console 탐색을 위한 가벼운 실습을 포함한다.

---

## Section 구성

### 01 Cloud Computing 개요

**주요 내용:**

- Cloud Computing의 정의
  - On-Premise vs Cloud: 물리 서버 직접 운영과 Cloud 서비스 이용의 차이
  - Cloud의 핵심 가치: 탄력성(Elasticity), 종량제(Pay-as-you-go), 글로벌 배포
- 서비스 모델
  - IaaS(Infrastructure as a Service): 가상 서버, 네트워크, 스토리지 제공
  - PaaS(Platform as a Service): 런타임 환경 제공, 애플리케이션 코드만 배포
  - SaaS(Software as a Service): 완성된 소프트웨어 제공
  - 개발자 관점에서의 모델 비교: 관리 범위와 자유도의 트레이드오프
- 배포 모델
  - Public Cloud, Private Cloud, Hybrid Cloud
- Cloud가 개발자에게 주는 의미
  - 인프라를 직접 다룰 수 있는 개발자의 가치

**실습:** 없음

---

### 02 AWS Global Infrastructure

**주요 내용:**

- AWS란
  - Amazon Web Services 소개
  - 주요 서비스 카테고리 개요 (Compute, Storage, Database, Networking)
- Global Infrastructure 구조
  - Region: 지리적으로 분리된 데이터센터 클러스터
  - Availability Zone(AZ): Region 내 물리적으로 분리된 데이터센터
  - Edge Location: CloudFront CDN 배포 거점
- Region 선택 기준
  - 지연 시간(Latency)
  - 규정 준수(Compliance)
  - 서비스 가용성
  - 비용
- 본 시리즈에서 사용할 Region 안내

**실습:** 없음

---

### 03 AWS 계정과 Console

**주요 내용:**

- AWS 계정 생성 절차
  - 이메일, 결제 정보, Support Plan 선택
  - Root User 개념과 보안 주의사항
- AWS Management Console
  - Console 구조: 서비스 검색, Region 선택, 계정 메뉴
  - 주요 서비스 대시보드 탐색
- 비용 관리 기초
  - Free Tier 범위와 한계
  - Billing Dashboard 확인
  - Budget Alert 설정

**실습:**

- lab01: AWS 계정 생성과 Console 탐색
  - 계정 생성, Console 로그인, Region 전환, 서비스 탐색, Free Tier 확인
- lab02: AWS Budget Alert 설정
  - Billing Dashboard 진입, Budget 생성, 알림(Email) 수신 설정

---

## 선행 조건

- 없음 (시리즈 첫 챕터)

---

## 상태

- 작성일: 2026-03-19
- 상태: 확정
