# Terraform Basics - Series Hierarchy Plan

이 문서는 **Terraform Basics Series의 전체 문서 구조(Chapter / Section / Lab)**를 정의하는 계획 문서이다.

이 Series는 Terraform 입문부터 AWS 기반 실전 인프라 구성까지 단계적으로 확장되는 실습 중심 커리큘럼이다. 사용자가 제공한 correction 기준 hierarchy를 반영하여 Chapter와 Section 흐름을 재구성한다.

---

# Series Overview

이 Series의 목적은 다음과 같다.

- Terraform의 핵심 개념과 Terraform configuration 작성 방식 학습
- Terraform CLI 기반 workflow와 Terraform state 운영 이해
- variable, output, count, for_each, module 같은 재사용 구조 이해
- 코드 품질, 테스트, CI/CD, workspace를 포함한 운영 관점 확장
- AWS Networking, Computing, Database 구성 예제로 실전 감각 확보

---

# Target Audience

이 Series는 다음 학습자를 대상으로 한다.

### Beginner

- AWS 기본 개념
- CloudFormation 입문
- cloud infrastructure 기본 이해

### Intermediate

- Infrastructure layering
- Terraform module 설계
- Terraform 코드 품질
- production 수준 IaC 운영 방식

---

# Series Structure

이 Series는 다음 계층 구조를 따른다.

```text
Chapter
    |-- Section
        |- Lab
```

설명:

- **Chapter**
  - 큰 학습 주제 단위
- **Section**
  - 구체적인 학습 단위
  - 개념 설명 + Lab 설계 포함
- **Lab**
  - 실제 실습 코드

---

# Chapter Plan

---

## Chapter 01: Terraform 소개

Terraform의 역할과 IaC의 필요성을 설명하고, CloudFormation 경험자 관점에서 Terraform 접근 방식을 연결한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 01.01 | IaC와 Terraform | Terraform configuration의 기본 구조 읽기 |
| 01.02 | CloudFormation vs Terraform 비교 | 두 도구의 상태 관리와 실행 모델 비교 |
| 01.03 | Terraform 설치 및 환경 구성 | Terraform CLI와 AWS 인증 준비 |
```

---

## Chapter 02: HCL 기초

HCL 문법과 Terraform configuration의 기본 구성 요소를 학습한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 02.01 | HCL 문법 개요 | block, argument, expression 분석 |
| 02.02 | Resource와 Provider | AWS provider와 resource 선언 실습 |
| 02.03 | Data Source 활용 | 기존 AWS 정보 조회 실습 |
| 02.04 | 변수와 출력 | input variable과 output 기본 사용 |
```

---

## Chapter 03: Terraform 핵심 개념

Terraform state, workflow, dependency, destroy까지 포함한 핵심 실행 모델을 학습한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 03.01 | State의 이해와 로컬 State | state file 확인과 역할 이해 |
| 03.02 | init, plan, apply 워크플로우 | 기본 CLI 실행 흐름 실습 |
| 03.03 | 리소스 의존성과 실행 순서 | dependency graph 관찰 |
| 03.04 | destroy와 리소스 정리 | 생성 자원 안전하게 정리 |
```

---

## Chapter 04: 변수와 출력 심화

variable, tfvars, output, local value를 통해 Terraform configuration의 재사용성과 명확성을 높인다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 04.01 | 변수 타입과 검증 | type constraint와 validation 실습 |
| 04.02 | tfvars와 환경별 설정 | 환경별 변수 파일 분리 |
| 04.03 | Output 활용 및 의존성 전달 | resource 간 값 전달 실습 |
| 04.04 | Local Values와 Data 활용 | 내부 계산 값과 조회 값 조합 |
```

---

## Chapter 05: State 관리

remote backend, state locking, import, migrate, 보안 제어를 통해 협업 환경의 state 운영을 학습한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 05.01 | Remote State | S3 backend 구성 이해 |
| 05.02 | State Locking과 동시 실행 | DynamoDB locking 흐름 이해 |
| 05.03 | State import와 migrate | 기존 자원 편입과 backend 이전 |
| 05.04 | State 보안과 접근 제어 | state 보호와 권한 분리 |
```

---

## Chapter 06: 조건문과 반복

count, for_each, 조건부 생성, 동적 블록을 통해 반복 가능한 인프라 구성을 설계한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 06.01 | count와 for_each | 반복 생성 방식 비교 |
| 06.02 | 조건부 리소스 생성 | boolean 기반 생성 제어 |
| 06.03 | for 표현식과 동적 블록 | 반복 표현식 실습 |
| 06.04 | 다중 AZ 서브넷/인스턴스 구성 | 반복 구조를 AWS에 적용 |
```

---

## Chapter 07: 모듈 기초

Terraform module의 개념과 기본 구조를 학습하고, VPC 예제로 child module을 작성한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 07.01 | 모듈의 개념과 구조 | root module과 child module 이해 |
| 07.02 | 모듈 작성 | VPC module 기초 작성 |
| 07.03 | 모듈 입력/출력 설계 | variable과 output interface 설계 |
| 07.04 | Registry와 모듈 버전 관리 | 공개 모듈 사용과 버전 고정 |
```

---

## Chapter 08: 모듈 고급

module 조합과 계층화를 통해 재사용 가능한 AWS 인프라 구조를 설계한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 08.01 | 모듈 조합과 계층화 패턴 | composition 구조 설계 |
| 08.02 | 재사용 가능한 EC2/ALB 모듈 | 실전형 module 분리 |
| 08.03 | 환경별 root 모듈 구성 | dev, staging, prod 분리 |
| 08.04 | 3-tier 아키텍처 모듈화 | multi-module 구조 실습 |
```

---

## Chapter 09: Workspace와 환경 분리

workspace와 디렉토리 기반 분리 전략을 비교하고 운영 기준을 정리한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 09.01 | Workspace 개념과 사용법 | workspace 전환 실습 |
| 09.02 | Workspace vs 디렉터리 분리 | 두 방식의 trade-off 비교 |
| 09.03 | dev/prod Workspace 운영 | 환경별 상태 분리 실습 |
```

---

## Chapter 10: 코드 품질과 검증

fmt, validate, lint, security scan, pre-commit을 통해 Terraform 코드 품질 관리 흐름을 정리한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 10.01 | terraform fmt, validate | 기본 정합성 검증 |
| 10.02 | tflint와 정적 분석 | AWS provider lint 적용 |
| 10.03 | tfsec/checkov 보안 스캔 | 보안 취약 패턴 점검 |
| 10.04 | pre-commit 훅 설정 | 로컬 자동 검증 흐름 구성 |
```

---

## Chapter 11: Terraform 테스트

Terraform 테스트 전략과 Terratest 기반 모듈 테스트 방식을 학습한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 11.01 | 테스트 전략 개요 | 어떤 수준에서 무엇을 검증할지 정리 |
| 11.02 | terratest 기초 | Go 기반 테스트 기본 흐름 |
| 11.03 | 테스트 가능한 모듈 설계 | 인터페이스와 분리 기준 정리 |
| 11.04 | VPC 모듈 테스트 작성 | module 검증 예제 |
```

---

## Chapter 12: CI/CD 연동

PR 기반 plan 검토와 자동 apply까지 포함하는 Terraform CI/CD 패턴을 학습한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 12.01 | Terraform CI/CD 패턴 | 실행 분리와 승인 흐름 정리 |
| 12.02 | GitHub Actions로 plan/apply 자동화 | workflow 구성 |
| 12.03 | Atlantis 또는 Terraform Cloud | 협업 도구 비교 |
| 12.04 | PR 기반 plan, merge 시 apply | 실무형 배포 흐름 정리 |
```

---

## Chapter 13: Networking

AWS Networking 리소스를 Terraform으로 구성하며 네트워크 계층 설계를 실습한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 13.01 | VPC 모듈로 CIDR/서브넷 설계 | 네트워크 구조 기획 |
| 13.02 | NAT Gateway, Internet Gateway | public/private 통신 구성 |
| 13.03 | Security Group과 NACL | 보안 계층 차이 실습 |
| 13.04 | 퍼블릭/프라이빗 서브넷 구성 | 다중 subnet 설계 |
```

---

## Chapter 14: Computing과 스토리지

EC2, EBS, S3를 통해 Computing과 스토리지 자원을 Terraform으로 관리한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 14.01 | EC2 인스턴스 및 AMI | instance 생성과 이미지 선택 |
| 14.02 | EBS 볼륨과 스냅샷 | 스토리지 확장과 백업 |
| 14.03 | S3 버킷 정책과 버전 관리 | 버킷 보안과 버전 관리 |
| 14.04 | EC2 + S3 연동 | compute와 storage 연결 |
```

---

## Chapter 15: Database와 고가용성

RDS, Multi-AZ, ALB/ELB를 활용하여 고가용성 구성을 Terraform으로 설계한다.

```text
| Section | 내용 | Lab |
|-------|------|-----|
| 15.01 | RDS 구성 | MySQL 또는 PostgreSQL 배포 |
| 15.02 | Multi-AZ와 파라미터 그룹 | 가용성과 튜닝 설정 |
| 15.03 | ALB/ELB와 타겟 그룹 | 트래픽 분산 계층 구성 |
| 15.04 | 고가용성 3-tier 구성 | 종합 아키텍처 실습 |
```

---

# Series Progression

이 Series의 학습 흐름은 다음과 같다.

```text
Terraform의 역할 이해
↓
HCL과 Terraform configuration 작성
↓
State와 workflow 이해
↓
variable, output, local value 심화
↓
remote backend와 state 운영
↓
조건문과 반복 구조
↓
module 기초와 고급 설계
↓
workspace와 환경 분리
↓
코드 품질, 테스트, CI/CD
↓
AWS Networking, Computing, Database 실전 구성
```

---

# Series Integration

이 Series는 다음 학습 주제와 연계된다.

```text
| Chapter | 연계 Series |
|-------|-------------|
| Chapter 08 모듈 고급 | Terraform Advanced의 module composition |
| Chapter 12 CI/CD 연동 | DevOps Series의 배포 자동화 |
| Chapter 13~15 AWS 실전 구성 | Cloud Architecture Series의 네트워크와 HA 설계 |
```

---

# Notes

이 문서는 **Series 전체 구조를 설계하는 계획 문서**이다.

Section 문서 작성 시에는 다음 문서를 기반으로 진행한다.

.agents/plans/{chapter number} {chapter name}.md
