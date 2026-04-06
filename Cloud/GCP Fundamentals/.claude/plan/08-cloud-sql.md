# Chapter 08 — Cloud SQL

## 목표

GCP 관리형 관계형 데이터베이스 서비스인 Cloud SQL을 이해하고 직접 구성한다.
Private IP 기반 연결과 Cloud SQL Auth Proxy 방식을 실습하며,
Gallery 앱의 데이터베이스를 Cloud SQL로 전환한다.

---

## AWS / Azure 대응 관계

| GCP | AWS | Azure |
|-----|-----|-------|
| Cloud SQL | Amazon RDS | Azure Database for MySQL |
| Cloud SQL (MySQL) | RDS for MySQL | Azure Database for MySQL Flexible Server |
| Cloud SQL Auth Proxy | RDS Proxy / IAM 인증 | — (직접 연결) |
| Private IP (VPC 내 연결) | RDS in VPC (Private Subnet) | Private Endpoint |
| 자동 백업 | RDS Automated Backup | 자동 백업 |
| Point-in-Time 복원 | RDS PITR | Point-in-Time 복원 |
| Read Replica | RDS Read Replica | 읽기 복제본 |

---

## Section 구성

### Section 01 — GCP 데이터베이스 서비스 개요
- **유형**: 이론
- **내용**:
  - GCP 데이터베이스 서비스 포지셔닝
    - Cloud SQL: 관계형 DB (MySQL, PostgreSQL, SQL Server) — 이 챕터의 주제
    - Cloud Spanner: 글로벌 분산 관계형 DB
    - Firestore: NoSQL 문서 DB
    - BigQuery: 분석용 데이터 웨어하우스
  - Cloud SQL 특성: 완전 관리형, HA, 자동 백업, 패치 자동화
  - AWS RDS, Azure Database for MySQL과의 비교
- **Lab**: 없음

### Section 02 — Cloud SQL (MySQL) 생성
- **유형**: 이론 + 실습
- **내용**:
  - Cloud SQL 인스턴스 생성 옵션 (DB 엔진, 버전, 머신 타입, 스토리지)
  - 연결 방식: Public IP vs Private IP
  - 데이터베이스 및 사용자 생성
  - High Availability(HA) 구성 개요 (Failover Replica)
- **Lab**:
  - `[실습] lab22: Cloud SQL MySQL 인스턴스 생성`
    - Cloud SQL MySQL 8.0 인스턴스 생성 (db-f1-micro)
    - Private IP 전용 설정 (VPC 연결)
    - 데이터베이스 생성 (gallery_db)
    - 사용자 생성 및 권한 부여
    - Cloud SQL 인스턴스 상태 확인 (Console)

### Section 03 — VM에서 Database 연결
- **유형**: 이론 + 실습
- **내용**:
  - Private IP 직접 연결 — 같은 VPC 내 VM에서 접속
  - Cloud SQL Auth Proxy 개념 — IAM 기반 인증, TLS 자동 처리
  - Auth Proxy vs 직접 연결 비교 (보안, 편의성)
  - Private Google Access 활용 (External IP 없는 VM에서 Auth Proxy 사용)
- **Lab**:
  - `[실습] lab23: VM에서 Cloud SQL 연결`
    - Private IP로 MySQL 클라이언트 직접 접속 확인
    - Cloud SQL Auth Proxy 설치 및 실행
    - Auth Proxy 경유 접속 확인 (127.0.0.1:3306)
    - Service Account 기반 인증 확인

### Section 04 — [실습] Gallery: Cloud SQL 연동
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab22, lab23 완료
- **내용**:
  - Gallery 앱 데이터베이스 → Cloud SQL (MySQL)로 전환
  - Gallery 전용 Cloud SQL 인스턴스 생성 (gcp-fund-gallery-sql)
  - Cloud SQL Auth Proxy를 Gallery MIG에 사이드카 방식으로 구성
  - Gallery MIG의 Service Account에 Cloud SQL 접속 권한 부여
  - Gallery 앱 DB 연결 설정 변경 후 동작 확인
  - **리소스**: gcp-fund-gallery-* (누적)
- **예제 파일**: `08 Cloud SQL/04 [실습] Gallery - Cloud SQL 연동/` 하위

### Section 05 — 백업과 복원
- **유형**: 이론 + 실습
- **내용**:
  - 자동 백업 설정 (보존 기간, 실행 시간)
  - On-demand 백업
  - Point-in-Time Recovery(PITR) 개념 및 절차
  - Read Replica 생성 개요
- **Lab**:
  - `[실습] lab24: 백업 설정 및 Point-in-Time 복원`
    - 자동 백업 활성화 및 보존 기간 설정
    - On-demand 백업 수동 실행
    - 테스트 데이터 삽입 후 PITR 복원 수행
    - 복원된 인스턴스에서 데이터 확인

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/08.01.claude.notion.md` |
| 02 | `.claude/draft/08.02.claude.notion.md` |
| 03 | `.claude/draft/08.03.claude.notion.md` |
| 04 Gallery | `.claude/draft/08.04.claude.notion.md` |
| 05 | `.claude/draft/08.05.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획확정 |
| 02 | 계획확정 |
| 03 | 계획확정 |
| 04 Gallery | 계획확정 |
| 05 | 계획확정 |
