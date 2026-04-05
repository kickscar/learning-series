# Chapter 03 — Compute: Azure Virtual Machine

## 목표

Azure VM을 생성하고 접속하며, 디스크를 구성하는 과정을 직접 수행한다.
챕터 마무리로 Gallery 앱을 VM에 배포해 실제 동작하는 환경을 구성한다.

---

## Section 구성

### Section 01 — Azure VM 개요
- **유형**: 이론
- **내용**:
  - Azure VM 구성 요소 (VM, NIC, Disk, Public IP, NSG)
  - VM Size 체계 (B, D, E, F 시리즈 등)
  - VM 이미지 (Marketplace, Custom)
  - Managed Disk 개요 (OS Disk, Data Disk)
  - AWS EC2와의 비교
- **Lab**: 없음

### Section 02 — VM 생성 및 기본 구성
- **유형**: 이론 + 실습
- **내용**:
  - VM 생성 옵션 (Region, Size, 이미지, 인증 방식)
  - Public IP 할당 (Static vs Dynamic)
  - NSG와 VM 연결 구조
  - 부팅 진단(Boot Diagnostics) 개요
- **Lab**:
  - `[실습] lab05: Linux VM 생성 및 기본 구성`
    - Ubuntu VM 생성 (B1s 또는 B2s)
    - Public IP 할당 (Static)
    - NSG 인바운드 규칙 설정 (SSH 22)
    - VM 상태 확인 (Portal)

### Section 03 — VM 접속 방법
- **유형**: 이론 + 실습
- **내용**:
  - SSH Key 기반 인증 구조
  - Azure Bastion 개념 (Public IP 없이 안전한 접속)
  - Bastion vs 직접 SSH 비교
- **Lab**:
  - `[실습] lab06: SSH 접속 및 Azure Bastion 설정`
    - SSH Key 생성 및 VM 접속 확인
    - AzureBastionSubnet 생성
    - Bastion Host 배포
    - Bastion을 통한 VM 접속

### Section 04 — VM 디스크와 스토리지 연결
- **유형**: 이론 + 실습
- **내용**:
  - Managed Disk 유형 (Standard HDD, Standard SSD, Premium SSD)
  - OS Disk vs Data Disk
  - 디스크 추가 후 파티션/마운트 절차
- **Lab**:
  - `[실습] lab07: 데이터 디스크 추가 및 마운트`
    - Portal에서 Data Disk 추가 (16GB Standard SSD)
    - VM 내에서 파티션 생성 및 포맷 (fdisk, mkfs)
    - /data 마운트 및 fstab 등록

### Section 05 — [실습] Gallery: Azure VM 기본 배포
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab05, lab06, lab07 완료 (VM 생성 + 접속 + 디스크)
- **내용**:
  - Gallery Spring Boot 앱을 Azure VM에 최초 배포
  - User Data(Custom Script)로 JDK 설치 및 앱 실행 자동화
  - Public IP로 앱 접근 확인
  - Gallery 전용 리소스 네이밍 (azure-fund-gallery-*)
- **예제 파일**: `03 Compute - Azure Virtual Machine/05 [실습] Gallery - Azure VM 기본 배포/` 하위

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
| 01 | 계획확정 |
| 02 | 작성완료 |
| 03 | 계획확정 |
| 04 | 계획확정 |
| 05 Gallery | 작성완료 |
