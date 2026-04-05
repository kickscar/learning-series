# Azure Fundamentals — Series Hierarchy

> Single Source of Truth. 모든 구조 변경은 이 파일에서 시작한다.

---

## 시리즈 개요

- **대상**: Backend/Frontend 개발 경험 4년 이상, Cloud 경험 없는 개발자
- **방식**: Azure Portal 기반 콘솔 실습 중심 (CLI/IaC 제외)
- **목적**: Azure 핵심 자원 구조 이해 + 직접 구성 및 연결
- **언어**: 한국어 설명, 기술 용어는 영문 유지

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
| Section Lab | 개별 실습 | 시리즈 전체 순번 (lab01~) | `[실습] lab07: NSG 트래픽 제어` | Section draft 내 포함 |
| 시리즈 실습 | Gallery | 없음 (섹션 번호 부여) | `[실습] Gallery: Custom VNet 이전` | Section과 대등, 전용 draft 파일 |

### Gallery 위치 원칙

- 챕터 끝이 아닌, **해당 기술이 충분히 커버된 직후** 섹션으로 삽입
- 섹션 번호를 부여받아 디렉토리와 draft 파일명에 반영

### 파일 규칙

| 파일 | 위치 | 형식 |
|------|------|------|
| 노션 초안 (섹션) | `.claude/draft/` | `{ch_no}.{sec_no}.claude.notion.md` |
| 노션 초안 (Gallery) | `.claude/draft/` | `{ch_no}.{sec_no}.claude.notion.md` (섹션 번호 그대로) |
| 섹션 README | `{ch_no} .../` `{sec_no} .../` | `README.md` (draft 완료 후 별도 작성) |

---

## Chapter / Section 구성

### Chapter 01 — Cloud와 Azure 시작하기

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Cloud Computing 개요 | — | 이론 |
| 02 | Azure Global Infrastructure | — | 이론 |
| 03 | Azure 계정과 Portal | lab01 | 계정 생성, Portal 탐색, Cloud Shell |

---

### Chapter 02 — Azure IAM & Microsoft Entra ID

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Microsoft Entra ID 개요 | — | 이론 |
| 02 | 구독과 리소스 그룹 | lab02 | 리소스 그룹 생성, 태그 설정 |
| 03 | 사용자, 그룹, 역할 관리 | lab03 | 사용자 생성, 그룹 할당 |
| 04 | RBAC | lab04 | 역할 할당, 접근 검증 |

---

### Chapter 03 — Compute: Azure Virtual Machine

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Azure VM 개요 | — | 이론 (크기, 이미지, 구성 요소) |
| 02 | VM 생성 및 기본 구성 | lab05 | Linux VM, Public IP, NSG |
| 03 | VM 접속 방법 | lab06 | SSH, Azure Bastion |
| 04 | VM 디스크와 스토리지 연결 | lab07 | 데이터 디스크 추가, 마운트 |
| 05 | [실습] Gallery: Azure VM 기본 배포 | — | Public IP VM에 Gallery 최초 배포 |

---

### Chapter 04 — VNet & Networking

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | VNet과 Subnet - 주소 공간 설계 | lab08 | VNet/Subnet 생성, CIDR 설계 |
| 02 | 인터넷 연결 구조 - Public IP와 라우팅 | — | 이론 (IGW 없음, 암묵적 연결) |
| 03 | NSG - 트래픽 제어 | lab09 | Subnet/NIC 레벨 NSG, 규칙 설정 |
| 04 | Private Subnet 격리 | lab10 | Public IP 없는 VM, 외부 차단 확인 |
| 05 | NAT Gateway | lab11 | Private → Outbound 전용 |
| 06 | Service Endpoint & Private Endpoint | — | 이론 (실습은 Ch06/Ch07에서) |
| 07 | 네트워크 흐름 정리 | — | 이론, 전체 트래픽 흐름 시각화 |
| 08 | [실습] Gallery: Custom VNet 이전 | — | Private Subnet + NAT GW, 외부 접속 불가 → Ch05 브릿지 |

---

### Chapter 05 — Traffic Management & High Availability

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Azure Load Balancer 개요 | — | 이론 (L4/L7, SKU 비교) |
| 02 | Azure Load Balancer 구성 | lab12 | Public LB, 백엔드 풀, Health Probe |
| 03 | [실습] Gallery: Load Balancer 이전 | — | Ch04 Gallery VM → LB 뒤로 이전, 외부 접속 해소 |
| 04 | Azure Application Gateway | lab13 | Application Gateway, HTTP 라우팅 |
| 05 | [실습] Gallery: Application Gateway 전환 | — | LB(L4) → AGW(L7)로 전환, HTTP 라우팅 기반 |
| 06 | 고가용성 구성 | lab14 | Availability Zone VM 분산 배포 |
| 07 | VM Scale Set | lab15 | VMSS 생성, 자동 스케일링 규칙 |
| 08 | [실습] Gallery: VM Scale Set 적용 | — | 단일 VM → VMSS로 전환, 자동 스케일링 확인 |

---

### Chapter 06 — Object Storage

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Azure Storage 개요 | — | 이론 (Blob, File, Queue, Table) |
| 02 | Storage Account와 Blob Storage | lab15 | Storage Account, Blob 업로드/다운로드 |
| 03 | Azure Files | lab16 | File Share, VM 마운트 |
| 04 | Storage 접근 제어 | lab17 | Access Key, SAS Token |
| 05 | [실습] Gallery: Blob Storage 연동 | — | Gallery 파일 업로드 → Blob Storage 전환 |

---

### Chapter 07 — Database

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Azure Database 서비스 개요 | — | 이론 (SQL, MySQL, PostgreSQL, Cosmos DB) |
| 02 | Azure Database for MySQL | lab18 | MySQL Flexible Server 생성 |
| 03 | VM에서 Database 연결 | lab19 | Private Endpoint / VNet 통합 |
| 04 | [실습] Gallery: MySQL 연동 | — | Gallery DB → Azure MySQL 전환 |
| 05 | 백업과 복원 | lab20 | 자동 백업, Point-in-Time 복원 |

---

### Chapter 08 — Container: ACR & Azure Container Apps

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | 컨테이너와 Azure 컨테이너 서비스 개요 | — | 이론 (Docker, ACR, ACI, Container Apps 비교) |
| 02 | ACR - 이미지 빌드와 푸시 | lab21 | ACR 생성, Docker 이미지 빌드 & 푸시 |
| 03 | Azure Container Apps 배포 | lab22 | Container Apps 환경 생성, 앱 배포 |
| 04 | [실습] Gallery: Container Apps 배포 | — | Gallery Docker 이미지 → Container Apps 배포 |

---

## Lab 번호 맵

| Lab | Chapter | Section | 실습 요약 |
|-----|---------|---------|-----------|
| lab01 | 01 | 03 | Azure 계정 생성, Portal 탐색 |
| lab02 | 02 | 02 | 리소스 그룹 생성, 태그 설정 |
| lab03 | 02 | 03 | 사용자 생성, 그룹 할당 |
| lab04 | 02 | 04 | RBAC 역할 할당, 접근 검증 |
| lab05 | 03 | 02 | Linux VM 생성, Public IP, NSG |
| lab06 | 03 | 03 | SSH 접속, Azure Bastion |
| lab07 | 03 | 04 | 데이터 디스크 추가, 마운트 |
| lab08 | 04 | 01 | VNet & Subnet 생성 |
| lab09 | 04 | 03 | NSG 생성, 규칙 설정 |
| lab10 | 04 | 04 | Private Subnet VM, 외부 차단 확인 |
| lab11 | 04 | 05 | NAT Gateway 설정 |
| lab12 | 05 | 02 | Load Balancer 구성 |
| lab13 | 05 | 04 | Application Gateway |
| lab14 | 05 | 06 | 고가용성 VM 분산 배포 |
| lab15 | 05 | 07 | VM Scale Set 생성, 자동 스케일링 |
| lab16 | 06 | 02 | Storage Account, Blob 업로드 |
| lab17 | 06 | 03 | Azure File Share, VM 마운트 |
| lab18 | 06 | 04 | Access Key, SAS Token |
| lab19 | 07 | 02 | MySQL Flexible Server 생성 |
| lab20 | 07 | 03 | VM → DB 연결 |
| lab21 | 07 | 05 | 백업 설정, Point-in-Time 복원 |
| lab22 | 08 | 02 | ACR 생성, 이미지 빌드 & 푸시 |
| lab23 | 08 | 03 | Container Apps 환경, 앱 배포 |

## Gallery 맵

| Gallery | Chapter | Section No | 전제 조건 | 핵심 포인트 |
|---------|---------|------------|-----------|-------------|
| Gallery: Azure VM 기본 배포 | 03 | 05 | lab05~07 | Public IP 직접 노출, 최초 배포 |
| Gallery: Custom VNet 이전 | 04 | 08 | lab08~11 | Private Subnet + NAT GW, 외부 접속 불가 |
| Gallery: Load Balancer 이전 | 05 | 03 | lab12 | LB 뒤로 이전, 외부 접속 해소 |
| Gallery: Application Gateway 전환 | 05 | 05 | lab13 | LB(L4) → AGW(L7) 전환 |
| Gallery: VM Scale Set 적용 | 05 | 08 | lab14~15 | 단일 VM → VMSS 전환 |
| Gallery: Blob Storage 연동 | 06 | 05 | lab16~18 | 파일 업로드 → Blob 전환 |
| Gallery: MySQL 연동 | 07 | 04 | lab19~20 | DB → Azure MySQL 전환 |
| Gallery: Container Apps 배포 | 08 | 04 | lab22~23 | Docker 이미지 → Container Apps |

---

## 작업 상태

| Chapter | 상태 |
|---------|------|
| 01 Cloud와 Azure 시작하기 | 계획확정 |
| 02 Azure IAM & Microsoft Entra ID | 계획확정 |
| 03 Compute: Azure Virtual Machine | 계획확정 |
| 04 VNet & Networking | 계획확정 |
| 05 Traffic Management & High Availability | 계획확정 |
| 06 Object Storage | 계획확정 |
| 07 Database | 계획확정 |
| 08 Container: ACR & Azure Container Apps | 계획확정 |
