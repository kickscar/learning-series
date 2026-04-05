# Chapter 07 — Database

## 목표

Azure의 관리형 데이터베이스 서비스를 이해하고 MySQL Flexible Server를 직접 생성한다.
VM에서 Private 연결로 DB에 접근하고, Gallery 앱의 DB를 Azure MySQL로 전환한다.

---

## Section 구성

### Section 01 — Azure Database 서비스 개요
- **유형**: 이론
- **내용**:
  - Azure Database 서비스 유형
    - Azure SQL Database (완전 관리형 SQL Server)
    - Azure Database for MySQL / PostgreSQL (오픈소스 관리형)
    - Azure Cosmos DB (NoSQL 글로벌 분산)
  - Flexible Server vs Single Server 비교 (MySQL 기준)
  - AWS RDS와의 비교
- **Lab**: 없음

### Section 02 — Azure Database for MySQL
- **유형**: 이론 + 실습
- **내용**:
  - MySQL Flexible Server 구성 옵션 (버전, Compute 등급, 스토리지)
  - 네트워크 접근 방식 (Public + 방화벽 vs Private Access)
  - 방화벽 규칙 설정
  - 관리자 계정 설정
- **Lab**:
  - `[실습] lab21: MySQL Flexible Server 생성`
    - MySQL Flexible Server 생성 (Burstable B1ms)
    - Public Access + 방화벽 규칙 설정 (개발 IP 허용)
    - MySQL Workbench 또는 Cloud Shell에서 접속 확인

### Section 03 — VM에서 Database 연결
- **유형**: 이론 + 실습
- **내용**:
  - Private Access (VNet 통합) 방식 이해
  - VNet 통합 시 DNS 해석 구조 (Private DNS Zone)
  - Public Access vs Private Access 보안 비교
- **Lab**:
  - `[실습] lab21: VM → MySQL Private 연결`
    - MySQL Flexible Server Private Access로 재생성 (VNet 통합)
    - Private DNS Zone 자동 생성 확인
    - VM에서 mysql 클라이언트로 Private 연결 확인

### Section 04 — [실습] Gallery: MySQL 연동
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab21, lab21 완료 (MySQL 생성 + VM Private 연결)
- **내용**:
  - Gallery 앱 DB를 H2(인메모리) → Azure MySQL로 전환
  - MySQL Flexible Server 생성 (Gallery 전용, Private Access)
  - 앱 설정 파라미터 변경 (datasource url, username, password)
  - VM 재시작 후 DB 연결 동작 확인
- **예제 파일**: `07 Database/04 [실습] Gallery - MySQL 연동/` 하위

### Section 05 — 백업과 복원
- **유형**: 이론 + 실습
- **내용**:
  - 자동 백업 정책 (보존 기간, 백업 빈도)
  - Point-in-Time Restore (PITR) 개념
  - Geo-redundant 백업 개요
- **Lab**:
  - `[실습] lab21: 백업 설정 및 Point-in-Time 복원`
    - 백업 보존 기간 설정 확인
    - PITR로 새 서버 복원 실행
    - 복원된 서버 접속 확인

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/07.01.claude.notion.md` |
| 02 | `.claude/draft/07.02.claude.notion.md` |
| 03 | `.claude/draft/07.03.claude.notion.md` |
| 04 Gallery | `.claude/draft/07.04.claude.notion.md` |
| 05 | `.claude/draft/07.05.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획확정 |
| 02 | 계획확정 |
| 03 | 계획확정 |
| 04 Gallery | 계획확정 |
| 05 | 계획확정 |
