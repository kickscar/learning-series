# GCP Fundamentals — Series Hierarchy

> Single Source of Truth. 모든 구조 변경은 이 파일에서 시작한다.

---

## 시리즈 개요

- **대상**: Backend/Frontend 개발 경험 4년 이상, Cloud 경험 없는 개발자
- **방식**: Google Cloud Console 기반 콘솔 실습 중심 (CLI/IaC 제외)
- **목적**: GCP 핵심 자원 구조 이해 + 직접 구성 및 연결
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
| Section Lab | 개별 실습 | 시리즈 전체 순번 (lab01~) | `[실습] lab07: Persistent Disk 연결` | Section draft 내 포함 |
| 시리즈 실습 | Gallery | 없음 (섹션 번호 부여) | `[실습] Gallery: Custom VPC 이전` | Section과 대등, 전용 draft 파일 |

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

### Chapter 01 — Cloud와 GCP 시작하기

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Cloud Computing 개요 | — | 이론 |
| 02 | GCP Global Infrastructure | — | Region, Zone, POP 개념 |
| 03 | GCP 계정과 Console | lab01 | 계정 생성, 프로젝트 생성, Console 탐색, Billing Account 소개 |

---

### Chapter 02 — IAM & 프로젝트 관리

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | GCP IAM 개요 | — | 이론 (Org > Folder > Project 계층) |
| 02 | 프로젝트와 Billing Account | lab02 | 프로젝트 생성, Billing Account 연결 |
| 03 | IAM 역할과 정책 | lab03 | 구성원 추가, 역할 할당, 접근 검증 |
| 04 | Service Account | lab04 | SA 생성, 키 발급, 권한 바인딩 |

---

### Chapter 03 — Compute: Compute Engine

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Compute Engine 개요 | — | 이론 (머신 타입, 이미지, 구성 요소) |
| 02 | VM 생성 및 기본 구성 | lab05 | Linux VM, External IP, Firewall Tag |
| 03 | VM 접속 — SSH & IAP | lab06 | IAP Tunnel, BeyondCorp 방식 (Bastion 없음) |
| 04 | Persistent Disk | lab07 | 디스크 추가, 마운트 (Startup Script는 lab 내에서) |
| 05 | [실습] Gallery: Compute Engine 기본 배포 | — | External IP VM에 Gallery 최초 배포 |

---

### Chapter 04 — VPC & 네트워크 보안

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | GCP VPC 특성 | — | 이론 (Global VPC, AWS/Azure와의 차이) |
| 02 | Subnet 설계 | lab08 | VPC/Subnet 생성, CIDR 설계 |
| 03 | Firewall Rules | lab09 | Tag/SA 기반 규칙, Ingress/Egress |
| 04 | Private VM & IAP Tunnel | lab10 | External IP 없는 VM, IAP로 접속 |
| 05 | Cloud NAT | lab11 | Private → Outbound 전용 |
| 06 | Private Google Access | — | 이론 (Ch07~08 실습 포석) |
| 07 | 네트워크 흐름 정리 | — | 이론, 전체 트래픽 흐름 시각화 |
| 08 | [실습] Gallery: Custom VPC 이전 | — | Private Subnet + Cloud NAT, 외부 접속 불가 → Ch05 브릿지 |

---

### Chapter 05 — Traffic Management & 보안

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Cloud Load Balancing 개요 | — | 이론 (Global/Regional, External/Internal, L4/L7) |
| 02 | HTTP(S) Load Balancer 구성 | lab12 | Backend Service, Health Check, URL Map |
| 03 | Cloud DNS & HTTPS | lab13 | 커스텀 도메인, 관리형 SSL 인증서 |
| 04 | Cloud Armor | lab14 | WAF, DDoS 보호, 보안 정책 |
| 05 | [실습] Gallery: LB + DNS + Armor 적용 | — | Ch04 Gallery VM → LB 뒤로 이전, DNS + Armor 추가 |
| 06 | Cloud CDN | lab15 | CDN 활성화, 캐시 정책 |
| 07 | Managed Instance Group & Autoscaling | lab16 | MIG 생성, 자동 스케일링 규칙 |
| 08 | [실습] Gallery: MIG 전환 | — | 단일 VM → MIG 전환, 자동 스케일링 확인 |

---

### Chapter 06 — Observability

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Cloud Monitoring 개요 | — | 이론 (메트릭, 대시보드, 알림) |
| 02 | 메트릭과 대시보드 | lab17 | 커스텀 대시보드, VM 메트릭 |
| 03 | Cloud Logging | lab18 | Log Explorer, 로그 기반 메트릭 |
| 04 | Uptime Check & 알림 | lab19 | Uptime Check 설정, 알림 정책 |
| 05 | [실습] Gallery: 모니터링 + 로깅 연동 | — | Gallery 에러 엔드포인트 활용, 대시보드 + 알림 구성 |

---

### Chapter 07 — Cloud Storage

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Cloud Storage 개요 | — | 이론 (버킷, 객체, Storage Class) |
| 02 | 버킷 생성 및 객체 관리 | lab20 | 버킷 생성, 파일 업로드/다운로드 |
| 03 | 접근 제어 | lab21 | IAM, ACL, 서명된 URL |
| 04 | [실습] Gallery: Cloud Storage 연동 | — | Gallery 파일 업로드 → Cloud Storage 전환 |

---

### Chapter 08 — Cloud SQL

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | GCP 데이터베이스 서비스 개요 | — | 이론 (Cloud SQL, Spanner, Firestore, BigQuery 포지셔닝) |
| 02 | Cloud SQL (MySQL) 생성 | lab22 | 인스턴스 생성, 사용자/DB 설정 |
| 03 | VM에서 Database 연결 | lab23 | Private IP 연결, Cloud SQL Auth Proxy |
| 04 | [실습] Gallery: Cloud SQL 연동 | — | Gallery DB → Cloud SQL 전환 |
| 05 | 백업과 복원 | lab24 | 자동 백업, Point-in-Time 복원 |

---

### Chapter 09 — Container: Artifact Registry & Cloud Run

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | 컨테이너와 GCP 서비스 개요 | — | 이론 (GCE/GKE/Cloud Run 비교, 포지셔닝) |
| 02 | Artifact Registry | lab25 | 저장소 생성, Docker 이미지 빌드 & 푸시 |
| 03 | Cloud Run 배포 | lab26 | Cloud Run 서비스 배포, 트래픽 설정 |
| 04 | [실습] Gallery: Cloud Run 배포 | — | Gallery Docker 이미지 → Cloud Run 배포 |

---

## Lab 번호 맵

| Lab | Chapter | Section | 실습 요약 |
|-----|---------|---------|-----------|
| lab01 | 01 | 03 | GCP 계정 생성, Console 탐색 |
| lab02 | 02 | 02 | 프로젝트 생성, Billing Account 연결 |
| lab03 | 02 | 03 | IAM 구성원 추가, 역할 할당 |
| lab04 | 02 | 04 | Service Account 생성, 키 발급 |
| lab05 | 03 | 02 | Linux VM 생성, External IP, Firewall Tag |
| lab06 | 03 | 03 | SSH 접속, IAP Tunnel 설정 |
| lab07 | 03 | 04 | Persistent Disk 추가, 마운트 |
| lab08 | 04 | 02 | VPC & Subnet 생성 |
| lab09 | 04 | 03 | Firewall Rules 생성, 트래픽 제어 |
| lab10 | 04 | 04 | Private VM 생성, IAP 접속 확인 |
| lab11 | 04 | 05 | Cloud NAT 설정, 아웃바운드 확인 |
| lab12 | 05 | 02 | HTTP(S) Load Balancer 구성 |
| lab13 | 05 | 03 | Cloud DNS 설정, 관리형 SSL 인증서 |
| lab14 | 05 | 04 | Cloud Armor 보안 정책 설정 |
| lab15 | 05 | 06 | Cloud CDN 활성화, 캐시 정책 |
| lab16 | 05 | 07 | MIG 생성, 자동 스케일링 |
| lab17 | 06 | 02 | 커스텀 대시보드, VM 메트릭 |
| lab18 | 06 | 03 | Log Explorer, 로그 기반 메트릭 |
| lab19 | 06 | 04 | Uptime Check, 알림 정책 |
| lab20 | 07 | 02 | 버킷 생성, 파일 업로드/다운로드 |
| lab21 | 07 | 03 | IAM, ACL, 서명된 URL |
| lab22 | 08 | 02 | Cloud SQL (MySQL) 인스턴스 생성 |
| lab23 | 08 | 03 | Private IP 연결, Auth Proxy |
| lab24 | 08 | 05 | 자동 백업, Point-in-Time 복원 |
| lab25 | 09 | 02 | Artifact Registry, 이미지 빌드 & 푸시 |
| lab26 | 09 | 03 | Cloud Run 서비스 배포 |

## Gallery 맵

| Gallery | Chapter | Section No | 전제 조건 | 핵심 포인트 |
|---------|---------|------------|-----------|-------------|
| [실습] Gallery: Compute Engine 기본 배포 | 03 | 05 | lab05~07 | External IP 직접 노출, 최초 배포 |
| [실습] Gallery: Custom VPC 이전 | 04 | 08 | lab08~11 | Private Subnet + Cloud NAT, 외부 접속 불가 |
| [실습] Gallery: LB + DNS + Armor 적용 | 05 | 05 | lab12~14 | LB 뒤로 이전, DNS + Cloud Armor 추가 |
| [실습] Gallery: MIG 전환 | 05 | 08 | lab15~16 | 단일 VM → MIG 전환, 자동 스케일링 확인 |
| [실습] Gallery: 모니터링 + 로깅 연동 | 06 | 05 | lab17~19 | 에러 엔드포인트 활용, 대시보드 + 알림 구성 |
| [실습] Gallery: Cloud Storage 연동 | 07 | 04 | lab20~21 | 파일 업로드 → Cloud Storage 전환 |
| [실습] Gallery: Cloud SQL 연동 | 08 | 04 | lab22~23 | Gallery DB → Cloud SQL 전환 |
| [실습] Gallery: Cloud Run 배포 | 09 | 04 | lab25~26 | Docker 이미지 → Cloud Run 배포 |

---

## 작업 상태

| Chapter | 상태 |
|---------|------|
| 01 Cloud와 GCP 시작하기 | 계획확정 |
| 02 IAM & 프로젝트 관리 | 계획확정 |
| 03 Compute: Compute Engine | 계획확정 |
| 04 VPC & 네트워크 보안 | 계획확정 |
| 05 Traffic Management & 보안 | 계획확정 |
| 06 Observability | 계획확정 |
| 07 Cloud Storage | 계획확정 |
| 08 Cloud SQL | 계획확정 |
| 09 Container: Artifact Registry & Cloud Run | 계획확정 |
