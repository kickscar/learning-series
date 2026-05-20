# Chapter 03: EC2 - Virtual Server

## 챕터 목표

AWS에서 가상 서버를 생성하고 운영하는 방법을 학습한다. EC2의 핵심 구성 요소를 이해하고, Console에서 Instance를 생성하여 SSH로 접속한다. EBS와 Elastic IP를 통한 스토리지 관리와 고정 IP 할당을 다룬다.

## 챕터 성격

실습 중심. 각 Section에서 EC2 관련 리소스를 직접 생성하고 운영한다.

---

## Section 구성

### 01 EC2 개요

**주요 내용:**

- EC2(Elastic Compute Cloud)란
  - AWS의 가상 서버 서비스
  - 필요할 때 생성하고, 불필요할 때 삭제하는 탄력적 컴퓨팅
- Instance Type
  - Family: 범용(t), 컴퓨팅 최적화(c), 메모리 최적화(r) 등
  - Size: micro, small, medium, large, xlarge
  - 네이밍 규칙: t3.micro, m5.large 등
  - Free Tier 대상 Instance Type
- AMI(Amazon Machine Image)
  - AMI란: OS + 소프트웨어가 포함된 서버 이미지
  - Amazon Linux, Ubuntu 등 주요 AMI
  - AMI 선택 기준
- Key Pair
  - SSH 접속을 위한 공개키/개인키 쌍
  - Key Pair 생성과 관리
  - .pem 파일 보안 주의사항

**실습:** 없음

---

### 02 Instance 생성과 접속

**주요 내용:**

- Console에서 EC2 Instance 생성
  - Launch Instance 마법사 단계별 설명
  - AMI 선택, Instance Type 선택, Key Pair 선택
  - Network 설정 (기본 VPC, Public IP 자동 할당)
  - Security Group 설정 (SSH 포트 22 허용)
  - 생성 확인과 Instance 상태 확인
- SSH 접속
  - Linux/Mac: ssh -i 명령
  - Windows: PuTTY 또는 OpenSSH
  - EC2 Instance Connect (브라우저 기반 접속)
- Instance Lifecycle
  - Running, Stopped, Terminated 상태 전이
  - Stop vs Terminate의 차이
  - Start, Stop, Reboot, Terminate 작업
- Security Group 기초
  - Inbound/Outbound 규칙
  - SSH(22), HTTP(80), HTTPS(443) 포트
  - Security Group의 상세는 Ch04에서 다룸

**실습:**

- lab06: EC2 Instance 생성과 SSH 접속
  - Amazon Linux AMI로 Instance 생성, Security Group 설정(SSH), SSH 접속 확인, Instance Stop/Start/Terminate

---

### 03 EBS

**주요 내용:**

- EBS(Elastic Block Store)란
  - EC2 Instance에 연결하는 블록 스토리지
  - Instance Store vs EBS: 영속성의 차이
- Volume Type
  - 범용 SSD(gp3): 일반적인 워크로드
  - 프로비저닝된 IOPS SSD(io2): 고성능 워크로드
  - 처리량 최적화 HDD(st1), Cold HDD(sc1)
- Volume 관리
  - Volume 생성
  - Instance에 Volume 연결(Attach)
  - Volume 포맷과 마운트
  - Volume 분리(Detach)와 삭제
- Snapshot
  - EBS Snapshot이란: Volume의 특정 시점 백업
  - Snapshot 생성과 복원
  - Snapshot에서 새 Volume 생성

**실습:**

- lab07: EBS Volume 생성과 연결
  - 추가 Volume 생성, Instance에 Attach, 포맷/마운트, 쓰기/읽기 검증

- lab08: 스냅샷 생성 및 복원
  - Snapshot 생성, Snapshot에서 Volume 생성, Attach 후 복원 데이터 검증

- lab09: AMI(Java 빌드/실행 환경) 생성 및 재배포
  - Java/Git/Maven 설치 후 Custom AMI 생성, AMI로 새 Instance 생성해 환경 재현 검증 (Gallery 배포/빌드 기본 환경)

---

### 04 Elastic IP

**주요 내용:**

- Elastic IP란
  - 고정 Public IP 주소
  - Instance를 Stop/Start해도 IP가 변하지 않음
- Elastic IP 관리
  - Elastic IP 할당(Allocate)
  - Instance에 연결(Associate)
  - 연결 해제(Disassociate)와 릴리스(Release)
- 비용 주의사항
  - 연결되지 않은 Elastic IP는 비용 발생
  - 실습 후 반드시 릴리스
- Elastic IP vs Public IP 자동 할당
  - 언제 Elastic IP가 필요한가

**실습:**

- lab10: Elastic IP 할당과 연결
  - Elastic IP 할당, Instance 연결, Stop/Start 후 IP 유지 확인, 릴리스

---

## 프로젝트 Lab

- [실습] Lab: Gallery - EC2 기본 배포
  - Spring Boot 기반 Gallery 애플리케이션을 EC2 Instance에 "기본 구성(local storage + H2)"으로 최초 배포
  - Git clone + Maven Wrapper 빌드 + 애플리케이션 실행 (Java/Git/Maven은 `lab09` AMI 기반이면 대부분 준비된 상태)
  - 웹 브라우저에서 Gallery 접근 확인

---

## 선행 조건

- Ch02 학습 완료 (IAM User, Key Pair 이해)

---

## 상태

- 작성일: 2026-03-19
- 상태: 확정
