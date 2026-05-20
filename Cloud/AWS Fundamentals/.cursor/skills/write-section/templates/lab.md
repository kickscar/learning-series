# Lab Template: AWS Fundamentals (Console 기반 실습)

이 템플릿은 AWS Fundamentals 시리즈의 실습 구조를 정의한다.

본 시리즈의 실습은 AWS Console을 기반으로 하며,  
리소스를 생성하고 연결하여 실제로 동작하는 Cloud Infrastructure를 구성하는 것을 목표로 한다.

---

## 사용 방법 (중요)

- 이 파일은 작성자가 참고하는 **템플릿 설명서**이다.
- 실제 Lab 문서는 아래 템플릿 예시를 따르되, 문서가 `# 개요` 없이 시작하도록 **첫 번째 `# [실습] ...` 헤딩부터 작성**한다.
- `## Lab 진입 헤딩`, `# Gallery 프로젝트 Lab Template` 같은 메타 섹션은 **draft에 그대로 복사하지 않는다.**

## Lab 진입 헤딩

# [실습] lab{no}: {실습 제목}

{1~2줄 실습 설명}

---

### 실습 목표

- {무엇을 구성하는지}
- {어떤 리소스를 사용하는지}
- {최종적으로 어떤 상태가 되는지}

⚠️ 비용 주의: {본 실습에서는 AWS 리소스를 생성하므로 과금이 발생할 수 있다.}

---

# 1. 전체 아키텍처

```mermaid

  {VPC → Subnet → EC2 → Internet Gateway → Internet}

```

또는

[이미지: 전체 아키텍처 구조]

{아키텍처 해설(2~4줄): 구성 요소와 요청 흐름을 요약한다.}

---

# 2. 사전 준비

AWS 계정 로그인

리전 설정 (예: ap-northeast-2)

기존 리소스 확인 (필요 시)

---

# 3. 리소스 생성 및 설정 (생성 + 연결)

각 단계에서 AWS Console 화면 스냅샷을 반드시 명시한다.
예: `[이미지: AWS Console - {서비스명} - {설정 화면} - {핵심 포인트}]`

## 1. {리소스 1 생성}

설명: {이 리소스를 왜 생성하는지}

[이미지: AWS Console - {서비스명} - {화면} - {설명}]

설정:

- Name: {값}
- Option: {값}

## 2. {리소스 2 생성}

설명: {연결되는 리소스 설명 포함}

[이미지: AWS Console - {서비스명} - {화면} - {설명}]

---

## 3. {연결 작업}

설명: {왜 연결하는지}

예:

- Subnet ↔ Route Table 연결
- EC2 ↔ Security Group 연결

[이미지: AWS Console - {서비스명} - {연결 화면} - {핵심 포인트}]

## 4. {연결 작업}

설명: {왜 연결하는지}

[이미지: AWS Console - {서비스명} - {연결 화면} - {핵심 포인트}]

---

# 4. 실행 및 결과 검증

동작 확인 단계에서도 AWS Console 화면 스냅샷(상태/로그/접근 결과)을 반드시 명시한다.
예: `[이미지: AWS Console - {서비스명} - {상태 화면} - {정상 상태 예}]`

설명: 실행(동작 확인)과 결과 검증을 한 섹션에서 함께 다룬다.

예:

- EC2 Public IP로 접속
- 웹 페이지 확인

## 1. 동작 확인

[이미지: AWS Console - {서비스명} - {상태 화면} - {설명}]

## 2. 결과 검증

검증 단계에서도 "어떤 상태 화면을 확인하는지" 스냅샷을 반드시 명시한다.
예: `[이미지: AWS Console - {서비스명} - {상태 화면} - {정상 상태 예}]`

다음 조건을 확인한다:

- 리소스 상태 (Running / Available)
- 네트워크 연결 정상 여부
- 외부 접근 가능 여부

---

# 5. 자원 정리

- 생성한 리소스를 삭제한다
- 불필요한 비용 발생 방지

예:

- EC2 종료
- Security Group 삭제
- VPC 삭제

---
---

# Gallery 프로젝트 Lab Template

Gallery 프로젝트 Lab은 개별 Lab과 동일한 구조를 따르되, 다음이 다르다.

---

## Gallery Lab 진입 헤딩

### 앱 버전 변경 (Gallery 기능 추가)

# [실습] Lab: Gallery-{version} 배포

{1~2줄 실습 설명: 어떤 기능이 추가되고, 어떤 서비스와 연동하는지}

⚠️ 비용 주의: 본 실습에서는 AWS 리소스를 생성하므로 과금이 발생할 수 있다.

### 인프라 변경 (동일 앱, 환경 이전)

# [실습] Lab: Gallery - {작업명}

{1~2줄 실습 설명: 어떤 인프라 변경이 이루어지는지}

⚠️ 비용 주의: 본 실습에서는 AWS 리소스를 생성하므로 과금이 발생할 수 있다.

---

## Gallery Lab 구조

개별 Lab과 동일한 구조 (실습 목표 → 아키텍처 → 사전 준비 → 리소스 생성 및 설정(생성+연결) → 실행 및 결과 검증 → 자원 정리)를 따른다.

추가 원칙:

- 이전 Chapter에서 구성한 Gallery 인프라를 전제로 시작한다.
- 이번 Chapter에서 학습한 개념이 Gallery 프로젝트에 어떻게 적용되는지 연결한다.
- 정리(Cleanup) 시 Gallery 인프라는 삭제하지 않는다. 다음 Chapter에서 계속 사용한다.

---

## Gallery 프로젝트 Lab 참조

시리즈 `README.md` 및 `Workloads/.cursor/plan/series/aws-fundamentals.md`와 맞춘다. 앱 "버전" 번호가 아니라 **시나리오·Lab 제목**으로 구분한다.

| Project Lab | 초점 | Chapter |
|-------------|------|---------|
| Gallery - EC2 기본 배포 | EC2 기본 배포, local storage + H2 | Ch03 |
| Gallery - Custom VPC 이전 | 동일 앱, Custom VPC로 이전 | Ch04 |
| Gallery: ALB/ASG/Route 53 | 트래픽 전환과 고정 엔드포인트 | Ch05 |
| Gallery - S3 연동 | 업로드를 S3로 | Ch06 |
| Gallery - RDS(MariaDB 11.8.5) 연동 | RDS 연결 | Ch07 |
| Gallery - ECS(Fargate) 배포 | 컨테이너·ECS | Ch08 |
