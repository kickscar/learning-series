# Chapter 05: Traffic Management & High Availability

## 챕터 목표

Application Load Balancer를 통한 트래픽 분산, Auto Scaling을 통한 고가용성 확보, Route 53을 통한 도메인 관리를 학습한다. EC2를 Private Subnet에 배치하고 ALB를 통해 접근하는 실무 패턴을 구성한다.

## 챕터 성격

이론 + 실습. 고가용성 인프라의 핵심 구성 요소를 순차적으로 학습하고 연결한다.

---

## Section 구성

### 01 ELB와 Target Group

**주요 내용:**

- ELB 개요
  - Load Balancing의 필요성: 트래픽 분산, 고가용성, 장애 격리
  - ELB(Elastic Load Balancing) 유형(개관)
    - ALB(Application Load Balancer): HTTP/HTTPS, Layer 7
    - NLB(Network Load Balancer): TCP/UDP, Layer 4
    - GLB(Gateway Load Balancer): 보안 어플라이언스 연결(인라인)
  - 일반적인 웹 애플리케이션 환경에서는 L7 요구(경로 기반 헬스체크, 라우팅)가 많아 ALB가 선호된다
- ALB 구성 요소
  - Listener: 프로토콜과 포트 (HTTP:80, HTTPS:443)
  - Rule: 요청 라우팅 조건
  - Target Group: 요청을 전달할 대상 그룹
- Target Group
  - Target Type: Instance, IP, Lambda
  - Health Check: 프로토콜, 경로, 간격, 임계값
  - 정상/비정상 Target 판별과 트래픽 제어
- ALB 배치 패턴
  - ALB: Public Subnet에 배치 (인터넷 접근 가능)
  - EC2: Private Subnet에 배치 (ALB를 통해서만 접근)
  - 이 패턴이 실무 표준인 이유

**실습:**

- [실습] Gallery: ALB와 Target Group 구성
  - Gallery 기반: Target Group(8080, `/actuator/health`), ALB(public-a + public-c), Private EC2 2대(user-data 빌드/실행) 등록, 분산 확인

---

### 02 Auto Scaling

**주요 내용:**

- Auto Scaling 개요
  - 수요에 따라 EC2 Instance 수를 자동 조절
  - 고가용성과 비용 효율성을 동시에 달성
- Launch Template
  - Auto Scaling에서 생성할 Instance의 사양 정의
  - AMI, Instance Type, Key Pair, Security Group, User Data
- Auto Scaling Group(ASG)
  - 최소(Min), 최대(Max), 희망(Desired) Instance 수
  - Subnet 배치 (Multi-AZ)
  - ALB Target Group과 연동
- Scaling Policy
  - Target Tracking: 목표 지표 유지 (예: CPU 50%)
  - Step Scaling: 단계별 조절
  - Scheduled Scaling: 예약 기반 조절
- Auto Scaling + ALB 연동
  - ASG가 생성한 Instance를 자동으로 Target Group에 등록
  - Instance 종료 시 자동으로 Target Group에서 제거

**실습:**

- [실습] Gallery: Auto Scaling Group
  - Gallery 기반: Golden AMI(`aws-fund-golden-image-v1`) + user-data로 Launch Template 생성, ASG(AZ-a + AZ-c) 생성, Target Group 자동 등록/해제 확인

---

### 03 Route 53

**주요 내용:**

- Route 53 개요
  - AWS의 관리형 DNS(Domain Name System) 서비스
  - Domain 등록, DNS Routing, Health Check
- DNS 기초
  - Domain Name → IP Address 변환
  - DNS Record Type: A, AAAA, CNAME, MX, TXT
- Hosted Zone
  - Public Hosted Zone: 인터넷에서 접근 가능한 도메인
  - Private Hosted Zone: VPC 내부에서만 사용하는 도메인
- Record 생성
  - A Record: Domain → IP Address
  - CNAME Record: Domain → 다른 Domain
  - Alias Record: AWS 리소스(ALB, CloudFront, S3) 직접 연결
  - Alias vs CNAME: Alias는 Zone Apex 사용 가능, 비용 무료
- Routing Policy 개요
  - Simple Routing
  - Weighted Routing
  - Failover Routing
  - Latency-based Routing

**실습:**

- [실습] Gallery: Route 53 도메인 연결
  - Hosted Zone 생성, ALB에 Alias Record 연결, 도메인으로 접근 확인

---

## 선행 조건

- Ch04 학습 완료 (VPC, Subnet, Route Table, Security Group 이해)

---

## 상태

- 작성일: 2026-03-19
- 상태: 확정
