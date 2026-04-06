# Chapter 03 — Compute: Compute Engine

## 목표

Compute Engine VM을 생성하고 접속하며, 디스크를 구성하는 과정을 직접 수행한다.
챕터 마무리로 Gallery 앱을 VM에 배포해 실제 동작하는 환경을 구성한다.

---

## AWS 대응 관계

| GCP | AWS |
|-----|-----|
| Compute Engine VM | EC2 Instance |
| Machine Type (e2-medium 등) | Instance Type (t3.medium 등) |
| VM Image (Public / Custom) | AMI |
| Persistent Disk (PD) | EBS Volume |
| External IP | Elastic IP |
| Firewall Rule (Tag 기반) | Security Group |
| IAP Tunnel | AWS Systems Manager Session Manager |
| Startup Script (Metadata) | EC2 User Data |

---

## Section 구성

### Section 01 — Compute Engine 개요
- **유형**: 이론
- **내용**:
  - Compute Engine VM 구성 요소 (VM, NIC, Disk, External IP, Firewall Rule)
  - Machine Type 체계 (General Purpose: E2/N2/N4, Compute Optimized: C2 등)
  - VM Image 유형 (Public Image, Custom Image, Marketplace)
  - Persistent Disk 개요 (Standard, Balanced, SSD)
  - Preemptible / Spot VM 개요
  - AWS EC2와의 비교
- **Lab**: 없음

### Section 02 — VM 생성 및 기본 구성
- **유형**: 이론 + 실습
- **내용**:
  - VM 생성 옵션 (Region/Zone, Machine Type, 이미지, 부팅 디스크)
  - External IP 할당 (Ephemeral vs Static)
  - Network Tag 기반 Firewall Rule 연결 구조
  - 부팅 직후 상태 확인 (Console Serial Port Output)
- **Lab**:
  - `[실습] lab05: Linux VM 생성 및 기본 구성`
    - Ubuntu VM 생성 (e2-medium, us-central1-a)
    - External IP 할당 (Ephemeral)
    - Network Tag 부여 (allow-ssh, allow-http)
    - Firewall Rule 생성 (TCP 22, TCP 8080)
    - VM 상태 확인 (Console)

### Section 03 — VM 접속 — SSH & IAP
- **유형**: 이론 + 실습
- **내용**:
  - SSH Key 기반 인증 구조 (OS Login vs 메타데이터 키)
  - IAP(Identity-Aware Proxy) Tunnel 개념 — BeyondCorp Zero Trust 방식
  - IAP vs 직접 SSH 비교 (External IP 불필요, Google 인증 기반)
  - Azure Bastion과의 비교 (별도 리소스 불필요)
- **Lab**:
  - `[실습] lab06: SSH 접속 및 IAP Tunnel 설정`
    - Console에서 브라우저 기반 SSH 접속 확인
    - IAP API 활성화
    - External IP 없는 VM에서 IAP Tunnel로 접속 확인
    - OS Login 활성화 및 동작 원리 확인

### Section 04 — Persistent Disk
- **유형**: 이론 + 실습
- **내용**:
  - Persistent Disk 유형 (Standard HDD, Balanced PD, SSD PD)
  - Boot Disk vs Data Disk
  - 디스크 추가 후 파티션/마운트 절차
  - 스냅샷(Snapshot) 개요
  - Startup Script: 메타데이터 서버 기반 VM 부팅 자동화 (lab 내에서)
- **Lab**:
  - `[실습] lab07: Persistent Disk 추가 및 마운트`
    - Console에서 Data Disk 추가 (20GB Balanced PD)
    - VM 내에서 파티션 생성 및 포맷 (fdisk, mkfs.ext4)
    - /data 마운트 및 /etc/fstab 등록
    - 스냅샷 생성 확인

### Section 05 — [실습] Gallery: Compute Engine 기본 배포
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab05, lab06, lab07 완료 (VM 생성 + 접속 + 디스크)
- **내용**:
  - Gallery Spring Boot 앱을 Compute Engine VM에 최초 배포
  - Startup Script로 JDK 설치 및 앱 실행 자동화
  - External IP로 Gallery 앱 접근 확인
  - Gallery 전용 리소스 네이밍 (gcp-fund-gallery-*)
- **예제 파일**: `03 Compute - Compute Engine/05 [실습] Gallery - Compute Engine 기본 배포/` 하위

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/03.01.claude.notion.md` |
| 02 | `.claude/draft/03.02.claude.notion.md` |
| 03 | `.claude/draft/03.03.claude.notion.md` |
| 04 | `.claude/draft/03.04.claude.notion.md` |
| 05 Gallery | `.claude/draft/03.05.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 작성완료 |
| 02 | 작성완료 |
| 03 | 계획확정 |
| 04 | 계획확정 |
| 05 Gallery | 작성완료 |
