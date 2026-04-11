# Azure IaC with Terraform — Series Hierarchy

> Single Source of Truth. 모든 구조 변경은 이 파일에서 시작한다.

---

## 시리즈 개요

- **대상**: Azure Fundamentals + Terraform Core 학습 완료(또는 병행 중)인 백엔드/인프라 엔지니어
- **방식**: Terraform + az CLI 중심, 콘솔 화면 최소화 (확인은 CLI로)
- **목적**: Azure 플랫폼 고유의 설계 철학을 Terraform으로 표현 + IaC 자동화·구조화 실무
- **언어**: 한국어 설명, 기술 용어는 영문 유지
- **핵심 관점**: IaC ≠ Terraform — CLI(ad-hoc 스크립트) → SDK → 프로비저닝 도구(Terraform)로 이어지는 코드화 스펙트럼

---

## 선수 조건

| 시리즈 | 필수 여부 | 비고 |
|--------|----------|------|
| Azure Fundamentals | **필수** | VM, VNet, LB, AGW, VMSS, Storage, MySQL, Container Apps 콘솔 실습 완료 |
| Terraform Core | **필수/병행** | HCL 문법, provider/resource/variable/output, state, 모듈 기초 |

---

## 문서 구조 규칙

### Chapter > Section > Lab

```
Chapter
├── Section 01           ← 이론 + Section Lab 포함
│   ├── [실습] lab01: ...
│   └── [실습] lab02: ...
├── Section 02           ← 이론만 (Lab 없음)
└── Section 03 [실습] Gallery: ...  ← 시리즈 실습, Section과 대등한 위치
```

### 두 가지 Lab 유형

| 유형 | 이름 | 번호 | 표기 예 | 위치 |
|------|------|------|---------|------|
| Section Lab | 개별 실습 | 시리즈 전체 순번 (lab01~) | `[실습] lab03: azurerm Provider 구성` | Section draft 내 포함 |
| 시리즈 실습 | Gallery | 없음 (섹션 번호 부여) | `[실습] Gallery: Gallery VM 배포` | Section과 대등, 전용 draft 파일 |

### Gallery 위치 원칙

- 챕터 끝이 아닌, **해당 기술이 충분히 커버된 직후** 섹션으로 삽입
- 섹션 번호를 부여받아 디렉토리와 draft 파일명에 반영

### Gallery 앱

- **Gallery Spring Boot** (`../Workloads/gallery-spring-boot`) — Azure Fundamentals에서 사용한 동일 앱
- Azure Fundamentals에서 콘솔 기반으로 배포한 과정을 이 시리즈에서 Terraform으로 코드화
- 진화 방향: Identity 기반 → 네트워크 → VM → 트래픽·스케일링 → 구조화 → 데이터 → 컨테이너 → CI/CD

### 파일 규칙

| 파일 | 위치 | 형식 |
|------|------|------|
| 노션 초안 (섹션) | `.claude/draft/` | `{ch_no}.{sec_no}.claude.notion.md` |
| 노션 초안 (Gallery) | `.claude/draft/` | `{ch_no}.{sec_no}.claude.notion.md` (섹션 번호 그대로) |
| 섹션 README | `{ch_no} .../` `{sec_no} .../` | `README.md` (draft 완료 후 별도 작성) |
| 예제 코드 | 섹션 디렉토리 내 | `.tf` 파일, `lab{nn}/` 디렉토리 |

---

## Chapter / Section 구성

### Chapter 01 — IaC와 Azure 코드화

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | IaC 개요 — 코드화의 세 가지 수준 | — | 이론. CLI(ad-hoc 스크립트) → SDK → 프로비저닝 도구 |
| 02 | az CLI 설치와 핵심 명령어 | lab01 | 설치, 인증, 리소스 조회·생성·삭제 |
| 03 | Azure SDK for Java — VM 유틸리티 | lab02 | SDK 소개 + 간단한 VM 조회/관리 실습 |
| 04 | Terraform 포지셔닝 | — | 이론. CLI 스크립트 한계 → 선언적 프로비저닝의 필요성 |

---

### Chapter 02 — Azure Terraform 환경 구성

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | azurerm Provider 구성 | lab03 | provider 블록, features 블록, 버전 제약 |
| 02 | 인증 — Service Principal | lab04 | SP 생성, client_id/secret, 환경변수 방식 |
| 03 | Remote State — Azure Storage Backend | lab05 | Storage Account 생성, backend 설정 |
| 04 | Azure CAF 네이밍 컨벤션 | — | 이론. RG 스코프 활용, CAF 약어, AWS 사례 비교 |

---

### Chapter 03 — 리소스 계층과 Identity

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Resource Group과 구독 계층 | — | 이론. RG·Subscription·Management Group 계층 |
| 02 | Resource Group 관리 | lab06 | RG 생성, 태그, lifecycle |
| 03 | Managed Identity | lab07 | System/User Assigned MI 생성, 할당 |
| 04 | RBAC 할당 | lab08 | azurerm_role_assignment, 최소 권한 원칙 |
| 05 | [실습] Gallery: Identity 기반 인프라 | — | RG + MI + RBAC 기본 뼈대 구성 |

---

### Chapter 04 — 네트워킹

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | VNet과 Subnet 구성 | lab09 | VNet, Subnet, 주소 공간 설계 |
| 02 | NSG — 트래픽 제어 | lab10 | Subnet/NIC 레벨 NSG, 규칙 설정 |
| 03 | NAT Gateway | lab11 | Private Subnet outbound 전용 |
| 04 | Private Endpoint | lab12 | Private Link 연결, NIC 확인 |
| 05 | Private DNS Zone | lab13 | Private DNS Zone 생성, VNet 연결 |
| 06 | [실습] Gallery: Gallery VNet 구성 | — | Private Subnet + NAT GW + NSG, 외부 접속 불가 → Ch05 브릿지 |

---

### Chapter 05 — 컴퓨트

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Azure VM 프로비저닝 | lab14 | azurerm_linux_virtual_machine, OS 디스크, NIC |
| 02 | Custom Data와 부트스트랩 | lab15 | cloud-init, custom_data, JDK 설치 자동화 |
| 03 | Availability Zone 배치 | lab16 | zone 파라미터, 다중 Zone 배포 |
| 04 | [실습] Gallery: Gallery VM 배포 | — | Private Subnet VM + Custom Data로 Gallery 앱 부트스트랩 |

---

### Chapter 06 — 트래픽 관리와 스케일링

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Azure Load Balancer | lab17 | Public LB, Backend Pool, Health Probe |
| 02 | Application Gateway | lab18 | L7 라우팅, HTTP 설정, Backend Pool |
| 03 | VM Scale Set | lab19 | VMSS 생성, 자동 스케일링 규칙 |
| 04 | [실습] Gallery: Gallery 트래픽 구성 | — | LB + AGW + VMSS 통합 구성, 외부 접속 해소 |

---

### Chapter 07 — IaC 코드 구조화

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | 프로젝트 구조 설계 | — | 이론. 디렉토리 레이아웃, 파일 분리 전략 |
| 02 | 태깅 전략과 locals 활용 | lab20 | 공통 태그 locals 적용, Layer 태그 추가 |
| 03 | 모듈 활용 — 실무 패턴 | lab21 | network/compute/data 모듈 분리, 로컬 모듈 |
| 04 | 환경 분리 — dev/prod | lab22 | tfvars 기반 환경 분리, 디렉토리 구조 |
| 05 | [실습] Gallery: Gallery 인프라 구조화 | — | Ch03~06 Gallery 코드를 모듈화 + 환경 분리 + 네이밍 적용 |

---

### Chapter 08 — 데이터 서비스와 시크릿

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Storage Account와 Blob Storage | lab23 | Storage Account, Blob Container, 접근 제어 |
| 02 | Azure Database for MySQL | lab24 | MySQL Flexible Server, VNet 통합 |
| 03 | Key Vault — 시크릿 관리 | lab25 | Key Vault 생성, Secret/Key 저장, TF 연동 |
| 04 | 서비스 간 연결 — Managed Identity | lab26 | VM/Container → Storage/DB MI 기반 인증 |
| 05 | [실습] Gallery: Gallery 데이터 계층 | — | Blob Storage + MySQL + Key Vault 연결, MI 기반 인증 |

---

### Chapter 09 — 컨테이너

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | ACR — 이미지 레지스트리 | lab27 | ACR 생성, 이미지 빌드 & 푸시, MI 인증 |
| 02 | Container Apps 배포 | lab28 | Container Apps Environment, 앱 배포 |
| 03 | Container Apps 네트워킹과 시크릿 | lab29 | VNet 통합, Key Vault 참조, 환경 변수 |
| 04 | [실습] Gallery: Gallery Container 전환 | — | VM 기반 → Container Apps 전환, ACR + MI |

---

### Chapter 10 — CI/CD 파이프라인

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | IaC 자동화 개요 | — | 이론. plan/apply 분리, 승인 게이트, 브랜치 전략 |
| 02 | GitHub Actions + OIDC 인증 | lab30 | Workload Identity Federation, secretless 인증 |
| 03 | Plan on PR, Apply on Merge | lab31 | PR 워크플로우, plan 결과 코멘트, apply 자동화 |
| 04 | 환경별 배포 파이프라인 | lab32 | dev/prod 분기, 승인 게이트, 환경별 backend |
| 05 | [실습] Gallery: Gallery 자동 배포 | — | Gallery 인프라 전체 CI/CD 파이프라인 구현 |

---

## Lab 번호 맵

| Lab | Chapter | Section | 실습 요약 |
|-----|---------|---------|-----------|
| lab01 | 01 | 02 | az CLI 설치, 인증, 리소스 조회·생성·삭제 |
| lab02 | 01 | 03 | Azure SDK for Java — VM 조회/관리 |
| lab03 | 02 | 01 | azurerm Provider 구성 |
| lab04 | 02 | 02 | Service Principal 생성, 인증 설정 |
| lab05 | 02 | 03 | Azure Storage Backend 설정 |
| lab06 | 03 | 02 | Resource Group 생성, 태그 |
| lab07 | 03 | 03 | Managed Identity 생성, 할당 |
| lab08 | 03 | 04 | RBAC 역할 할당 |
| lab09 | 04 | 01 | VNet & Subnet 생성 |
| lab10 | 04 | 02 | NSG 생성, 규칙 설정 |
| lab11 | 04 | 03 | NAT Gateway 설정 |
| lab12 | 04 | 04 | Private Endpoint 연결 |
| lab13 | 04 | 05 | Private DNS Zone 생성 |
| lab14 | 05 | 01 | Linux VM 생성, NIC, OS 디스크 |
| lab15 | 05 | 02 | cloud-init Custom Data |
| lab16 | 05 | 03 | Availability Zone 배포 |
| lab17 | 06 | 01 | Load Balancer 구성 |
| lab18 | 06 | 02 | Application Gateway |
| lab19 | 06 | 03 | VM Scale Set, 자동 스케일링 |
| lab20 | 07 | 02 | 공통 태그 locals 적용, Layer 태그 추가 |
| lab21 | 07 | 03 | 로컬 모듈 분리 (network/compute/data) |
| lab22 | 07 | 04 | tfvars 환경 분리 (dev/prod) |
| lab23 | 08 | 01 | Storage Account, Blob Container |
| lab24 | 08 | 02 | MySQL Flexible Server |
| lab25 | 08 | 03 | Key Vault 생성, Secret 관리 |
| lab26 | 08 | 04 | MI 기반 서비스 간 인증 |
| lab27 | 09 | 01 | ACR 생성, 이미지 빌드 |
| lab28 | 09 | 02 | Container Apps 배포 |
| lab29 | 09 | 03 | Container Apps VNet·시크릿 통합 |
| lab30 | 10 | 02 | GitHub Actions + OIDC |
| lab31 | 10 | 03 | PR plan, merge apply |
| lab32 | 10 | 04 | 환경별 파이프라인, 승인 게이트 |

---

## Gallery 맵

| Gallery | Chapter | Section No | 전제 조건 | 핵심 포인트 |
|---------|---------|------------|-----------|-------------|
| Gallery: Identity 기반 인프라 | 03 | 05 | lab06~08 | RG + MI + RBAC 기본 뼈대 |
| Gallery: Gallery VNet 구성 | 04 | 06 | lab09~13 | Private Subnet + NAT GW + NSG, 외부 접속 불가 |
| Gallery: Gallery VM 배포 | 05 | 04 | lab14~16 | Private Subnet VM + Custom Data 부트스트랩 |
| Gallery: Gallery 트래픽 구성 | 06 | 04 | lab17~19 | LB + AGW + VMSS 통합, 외부 접속 해소 |
| Gallery: Gallery 인프라 구조화 | 07 | 05 | lab20~22 | 기존 코드 모듈화 + 환경 분리 + 네이밍 |
| Gallery: Gallery 데이터 계층 | 08 | 05 | lab23~26 | Blob + MySQL + Key Vault + MI 인증 |
| Gallery: Gallery Container 전환 | 09 | 04 | lab27~29 | VM → Container Apps + ACR + MI |
| Gallery: Gallery 자동 배포 | 10 | 05 | lab30~32 | GitHub Actions CI/CD 파이프라인 |

---

## Gallery 진화 테이블

| Ch | Gallery | 이전 상태 | 이후 상태 | 접근 방식 |
|----|---------|----------|----------|----------|
| 03 | Identity 기반 인프라 | — | RG + MI + RBAC | — |
| 04 | Gallery VNet 구성 | 기본 RG | Private Subnet + NAT GW | Localhost only |
| 05 | Gallery VM 배포 | 네트워크만 | VM + Gallery 앱 실행 | Private (외부 불가) |
| 06 | Gallery 트래픽 구성 | 단일 VM | LB + AGW + VMSS | AGW Public IP |
| 07 | Gallery 인프라 구조화 | Flat 코드 | 모듈화 + 환경 분리 | 동일 (코드 리팩토링) |
| 08 | Gallery 데이터 계층 | 로컬 파일 + H2 | Blob + MySQL + Key Vault | 동일 (데이터 계층 추가) |
| 09 | Gallery Container 전환 | VM 기반 VMSS | Container Apps + ACR | Container Apps URL |
| 10 | Gallery 자동 배포 | 수동 apply | GitHub Actions CI/CD | 동일 (자동화) |

---

## 작업 상태

| Chapter | 상태 |
|---------|------|
| 01 IaC와 Azure 코드화 | 계획수립 |
| 02 Azure Terraform 환경 구성 | 계획수립 |
| 03 리소스 계층과 Identity | 계획수립 |
| 04 네트워킹 | 계획수립 |
| 05 컴퓨트 | 계획수립 |
| 06 트래픽 관리와 스케일링 | 계획수립 |
| 07 IaC 코드 구조화 | 계획수립 |
| 08 데이터 서비스와 시크릿 | 계획수립 |
| 09 컨테이너 | 계획수립 |
| 10 CI/CD 파이프라인 | 계획수립 |
