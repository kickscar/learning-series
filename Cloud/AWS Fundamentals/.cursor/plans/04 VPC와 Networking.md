# Chapter 04: VPC와 Networking

## 챕터 목표

AWS 클라우드 내 네트워크를 설계하고 구성하는 방법을 학습한다. VPC, Subnet, Route Table, Internet Gateway, NAT Gateway를 구성하고, Security Group과 Network ACL을 통한 보안 경계를 설정한다. 전체 패킷 흐름을 종합적으로 이해하여 실무 수준의 네트워크 설계 역량을 갖춘다.

## 챕터 성격

이론 + 실습. 네트워크 개념을 하나씩 쌓아가며 실습으로 검증한다. 패킷 전체 흐름을 마스터하는 것이 핵심 목표이다.

---

## Section 구성

### 01 VPC와 Subnet - CIDR & Route Table

**주요 내용:**

- VPC(Virtual Private Cloud)란
  - AWS 클라우드 내 논리적으로 격리된 네트워크
  - 하나의 Region에 속함
- CIDR(Classless Inter-Domain Routing) 블록
  - IP 주소 체계와 서브넷 마스크
  - VPC CIDR 설계 (예: 10.0.0.0/16)
  - Subnet CIDR 분할 (예: 10.0.1.0/24, 10.0.2.0/24)
- Subnet
  - Public Subnet vs Private Subnet
  - Subnet은 하나의 AZ에 속함
  - Multi-AZ 구성을 위한 Subnet 배치 전략
- Route Table(기본)
  - local route의 의미
  - Main Route Table과 Subnet association(명시 연결 vs Main 사용)
- Default VPC vs Custom VPC
  - Default VPC의 구성 (기본 Subnet, IGW, Route Table)
  - Custom VPC를 사용해야 하는 이유

**실습:**

- lab11: Custom VPC와 Subnet 생성
  - VPC 생성(10.0.0.0/16), Public Subnet 2개 + Private Subnet 2개 (Multi-AZ 배치)

---

### 02 Public Subnet & Internet Gateway

**주요 내용:**

- Internet Gateway(IGW)
  - VPC에서 인터넷으로 나가는 관문
  - VPC당 하나의 IGW 연결
- Route Table
  - Route Table의 구조: Destination + Target
  - Local Route: VPC 내부 통신 (자동 생성)
  - Internet Route: 0.0.0.0/0 → IGW
- Public Subnet의 조건
  - Route Table에 IGW로의 경로 존재
  - Instance에 Public IP 할당
  - Public Route Table로 Subnet별 라우팅 제어
  - Subnet Association: Public Subnet과 Public Route Table 연결

**실습:**

- lab12: Public Subnet 인터넷 연결(IGW + Route Table)
  - IGW 생성/VPC 연결, Public Route Table 생성(0.0.0.0/0 → IGW), Subnet Association, EC2 배치 후 인터넷 통신 확인

---

### 03 Traffic Control I - Security Group

**주요 내용:**

- Security Group(SG)
  - ENI 수준의 방화벽
  - Stateful, Allow only
  - Inbound/Outbound 규칙
- 트래픽 제어 기본
  - ICMP(ping), SSH(22) 제어
  - SSH는 내 IP로 제한(운영 기본)
  - 외부 노출은 최소화하고 엔드포인트(ALB)로 표준화(다음 Chapter 연결)

**실습:**

- lab13: Security Group 트래픽 제어(ICMP, SSH)
  - SG 규칙 변경으로 ping/ssh 허용/차단을 확인

---

### 04 Traffic Control II - Network ACL

**주요 내용:**

- Network ACL(NACL)
  - Subnet 수준의 방화벽
  - Stateless: 요청과 응답을 별도로 허용해야 함
  - Allow와 Deny 규칙 모두 존재
  - 규칙 번호에 따른 평가 순서 (낮은 번호 우선)
  - Ephemeral Port 범위 허용 필요
- SG vs NACL 범위 차이
  - SG: 인스턴스(ENI) 트래픽 제어의 기본
  - NACL: Subnet 경계의 추가 보안 계층(정책/방어선)
  - 실습 수준에서는 SG로 트래픽 제어하고, NACL은 차이를 체감하는 범위로 제한

**실습:**

- lab14: NACL 트래픽 제어 실험
  - SG는 허용 상태에서 NACL Deny로 SSH/ICMP를 차단해 차이를 체감

---

### 05 Isolation - Private Subnet & VPC Endpoint

**주요 내용:**

- Public/Private의 본질은 라우팅(Target) 차이
- Private 전용 Route Table(local route only)로 격리 시작
- Private Subnet이 필요한 이유(공격 표면 축소, 계층 분리)
- VPC Endpoint로 Private에서 AWS 서비스에 연결하는 방법
  - Gateway Endpoint vs Interface Endpoint
  - Private DNS, Subnet/AZ 배치, Endpoint SG(443)
  - 서비스별 제한(Endpoint가 없는 서비스, 리전 범위 등)
  - 비용/운영 포인트
  - NAT Gateway가 왜 여전히 필요한가(다음 Section에서 완성)

**실습:**

- lab15: Private Subnet 격리 확인과 VPC Endpoint(SSM 운영 접속)
  - Private Subnet EC2 격리 확인, IAM Role 적용, Interface VPC Endpoint로 SSM 접속 경로 구성

---

### 06 NAT Gateway

**주요 내용:**

- NAT Gateway란
  - Private Subnet의 Outbound를 가능하게 하는 서비스
  - Inbound는 열지 않음
  - VPC Endpoint의 제한을 범용 Outbound(NAT)로 보완하는 관점
- NAT Gateway 구성
  - Public Subnet 배치
  - Elastic IP 할당
  - Private Route Table: 0.0.0.0/0 -> NAT
- 비용 고려사항
  - 시간당 비용 + 데이터 처리 비용
  - 실습 후 유지/삭제 기준 필요

**실습:**

- lab16: NAT Gateway 구성과 Private EC2 Outbound 검증
  - NAT 구성 후 Private EC2에서 Outbound 확인, NAT는 Inbound를 열지 않음을 확인, VPC Endpoint 없이도 SSM이 가능하다는 관점 정리, 외부 엔드포인트 필요성을 다음 Chapter(ALB)로 연결

---

### 07 Traffic Flow

**주요 내용:**

- Traffic Flow 7단계 모델
  - User Browser & Public Internet
  - IGW
  - Route Table
  - NACL
  - Subnet
  - SG
  - Compute(EC2, Docker, ECS)
- Public Inbound 조건과 체크포인트
- Private 격리와 NAT Outbound의 의미
- 트러블슈팅 순서(어디에서 막히는가)

**실습:** 없음 (종합 정리)

---

## 프로젝트 Lab

- [실습] Lab: Gallery - Custom VPC 이전
  - Ch03에서 Default VPC에 배포한 Gallery를 Custom VPC 환경으로 이전
  - Gallery 프로젝트 전용 VPC를 새로 구성한다(예: `aws-fund-gallery-vpc`, `10.10.0.0/16`)
  - AZ-a에 Public/Private Subnet 1쌍을 먼저 구성하고, ALB에서 Multi-AZ로 확장한다
  - Private Subnet에 Gallery를 배치하고 NAT 기반 Session Manager(SSM)로 내부에서 동작을 확인
  - 외부 접근 엔드포인트(ALB)는 다음 Chapter에서 완성

---

## 선행 조건

- Ch03 학습 완료 (EC2 Instance 생성과 접속 경험)

---

## 상태

- 작성일: 2026-03-19
- 상태: 확정
