# Chapter 07: RDS - Managed Database

## 챕터 목표

AWS 관리형 데이터베이스 서비스 RDS를 학습한다. Private Subnet에 DB Instance를 생성하고, Subnet Group을 구성하여 EC2에서 RDS로 연결하는 데이터 계층을 완성한다.

## 챕터 성격

이론 + 실습. RDS 개념을 이해한 후 실제 DB를 생성하고 EC2와 연결한다.

---

## Section 구성

### 01 RDS 개요

**주요 내용:**

- RDS(Relational Database Service)란
  - AWS의 관리형 관계형 데이터베이스 서비스
  - 자동 패치, 백업, 장애 복구를 AWS가 관리
- RDS vs EC2에 직접 DB 설치
  - 관리 부담 감소: 패치, 백업, 복원
  - 고가용성 옵션 내장
  - 제약사항: OS 접근 불가, 커스터마이징 제한
- 지원 엔진
  - MariaDB, MySQL, PostgreSQL
  - 본 시리즈 실습 기준 엔진 버전: **MariaDB 11.8.5**(Console 가용 목록에 맞춰 11.8.x 선택 가능)
  - Oracle, SQL Server
  - Aurora (AWS 전용, 개념 소개)
- 핵심 개념
  - DB Instance: 데이터베이스 서버
  - DB Instance Class: 컴퓨팅 사양 (db.t3.micro 등)
  - Storage: gp3, io2, Magnetic
  - Endpoint: 애플리케이션이 연결할 주소
- 고가용성 옵션 개요
  - Multi-AZ Deployment: 자동 장애 복구
  - Read Replica: 읽기 부하 분산
  - Free Tier에서의 제한사항

**실습:** 없음

---

### 02 DB Instance와 Subnet Group

**주요 내용:**

- DB Subnet Group
  - RDS가 배치될 Subnet의 그룹
  - 최소 2개 이상의 AZ에 걸친 Subnet 필요
  - Private Subnet으로 구성하여 외부 접근 차단
- DB Instance 생성
  - Console에서 DB Instance 생성 단계
  - 엔진 선택, Instance Class 선택
  - DB Subnet Group 연결
  - Master Username/Password 설정
  - Storage 설정
- Security Group 설정
  - DB Security Group: EC2 Security Group에서만 접근 허용
  - 포트 설정: MariaDB/MySQL(3306), PostgreSQL(5432) 등
- Parameter Group
  - DB 엔진 설정 (문자셋, 타임존 등)
  - 기본 Parameter Group vs Custom Parameter Group

**실습:**

- lab20: RDS DB Instance 생성
  - DB Subnet Group 생성(Private Subnet), DB Instance 생성(MariaDB **11.8.5**), Security Group 설정

---

### 03 EC2-RDS 연결

**주요 내용:**

- 연결 구조
  - EC2(Public/Private Subnet) → RDS(Private Subnet)
  - Security Group 규칙: EC2 SG → RDS SG 허용
  - 같은 VPC 내에서의 Private 통신
- Endpoint와 Connection String
  - RDS Endpoint 확인
  - 연결 문자열 구성: jdbc:mariadb://endpoint:3306/dbname(엔진 MariaDB 11.8.5 기준 인스턴스)
  - 환경별 설정 관리
- 연결 테스트
  - EC2에서 mysql 클라이언트로 접속
  - 간단한 쿼리 실행으로 연결 확인
- 보안 모범 사례
  - RDS는 반드시 Private Subnet에 배치
  - Security Group으로 접근 제어
  - 비밀번호 관리: AWS Secrets Manager (개념 소개)

**실습:**

- lab21: EC2에서 RDS 연결
  - EC2에 DB 클라이언트 설치, RDS Endpoint로 접속, 데이터베이스/테이블 생성, 기본 쿼리로 연결 확인

---

## 프로젝트 Lab

- [실습] Gallery: RDS(MariaDB 11.8.5) 연동
  - Gallery의 DB를 RDS(MariaDB 11.8.5)로 전환한다 (`spring.datasource.*`)
  - EC2에서 Gallery를 빌드/배포한다
  - DB 연결 설정 후, 애플리케이션 요청을 수행했을 때 RDS에 레코드가 생성/삭제되는지 확인한다
  - Phase 1 완성: EC2 + S3 + RDS 기반 전체 기능 동작

---

## 선행 조건

- Ch04 학습 완료 (VPC, Private Subnet, Security Group)
- Ch06 학습 완료 (S3 연동, IAM Role)

---

## 상태

- 작성일: 2026-03-19
- 상태: 확정
