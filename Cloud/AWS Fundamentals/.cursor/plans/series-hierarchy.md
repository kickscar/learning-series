# Series Hierarchy: AWS Fundamentals

## 시리즈 개요

AWS Console을 기반으로 Cloud Infrastructure의 핵심 서비스를 학습하는 시리즈.
Backend/Frontend 개발 경험이 있는 개발자를 대상으로 하며, 직접 리소스를 생성하고 연결하는 과정을 통해 배포 가능한 Cloud 환경을 구성하는 구조와 흐름을 이해한다.

---

## 전체 구성

```text
AWS Fundamentals

01 Cloud와 AWS 시작하기
 ├─ 01 Cloud Computing 개요
 ├─ 02 AWS Global Infrastructure
 └─ 03 AWS 계정과 Console

02 IAM
 ├─ 01 IAM 개요
 ├─ 02 User와 Group
 ├─ 03 Policy
 └─ 04 Role

03 EC2 - Virtual Server
 ├─ 01 EC2 개요
 ├─ 02 Instance 생성과 접속
 ├─ 03 EBS
 └─ 04 Elastic IP

04 VPC와 Networking
 ├─ 01 VPC와 Subnet - CIDR & Route Table
 ├─ 02 Public Subnet & Internet Gateway
 ├─ 03 Traffic Control I - Security Group
 ├─ 04 Traffic Control II - Network ACL
 ├─ 05 Isolation - Private Subnet & VPC Endpoint
 ├─ 06 NAT Gateway
 └─ 07 Traffic Flow

05 Traffic Management & High Availability
 ├─ 01 ELB와 Target Group
 ├─ 02 Auto Scaling
 └─ 03 Route 53

06 S3와 CloudFront - Storage & Content Delivery
 ├─ 01 S3 개요와 Bucket 관리
 ├─ 02 Bucket Policy와 접근 제어
 └─ 03 정적 웹 호스팅과 CloudFront

07 RDS - Managed Database
 ├─ 01 RDS 개요
 ├─ 02 DB Instance와 Subnet Group
 └─ 03 EC2-RDS 연결

08 ECS - Container Orchestration
 ├─ 01 ECR과 Container Image
 ├─ 02 ECS Cluster와 Task Definition
 └─ 03 Service와 Fargate
```

---

## 챕터별 요약

### 01 Cloud와 AWS 시작하기

Cloud Computing의 기본 개념과 서비스 모델(IaaS/PaaS/SaaS)을 이해하고, AWS의 글로벌 인프라 구조(Region, Availability Zone)를 학습한다. AWS 계정을 생성하고 Console을 통해 AWS 서비스에 접근하는 방법을 익힌다.

- 성격: 개념/이론 중심
- 실습: Console 탐색, Region 전환 (가벼운 수준)

### 02 IAM

AWS 리소스에 대한 접근 제어와 보안의 기초를 학습한다. User, Group, Policy, Role의 개념과 관계를 이해하고, 실무에서 필요한 권한 관리 체계를 구성한다.

- 성격: 이론 + 실습
- 실습: User/Group 생성, Policy 연결, Role 생성

### 03 EC2 - Virtual Server

AWS에서 가상 서버를 생성하고 운영하는 방법을 학습한다. Instance Type과 AMI 선택부터 SSH 접속, EBS 스토리지 연결, Elastic IP 할당까지 다룬다.

- 성격: 실습 중심
- 실습: Instance 생성/접속, EBS 연결, Snapshot 생성/복원, AMI(빌드 환경) 생성/재배포, Elastic IP 할당

### 04 VPC와 Networking

AWS 클라우드 내 네트워크를 설계하고 구성하는 방법을 학습한다. 인터넷 관문(IGW) 개방부터 시작해, Security Group/Network ACL로 트래픽을 제어하고, Private Subnet 격리와 VPC Endpoint로 "격리된 환경에서 필요한 AWS 서비스에 연결하는 방법"을 만든다. 이후 NAT Gateway로 범용 Outbound를 완성한 뒤, 전체 트래픽 흐름을 종합적으로 이해한다.

- 성격: 이론 + 실습 (실무 네트워크 마스터)
- 실습: IGW/Route Table 구성, SG 트래픽 제어, NACL 실험, Private Subnet 격리와 VPC Endpoint(SSM 시나리오), NAT Gateway 구성, Traffic Flow 종합

### 05 Traffic Management & High Availability

ELB(ALB/NLB/GLB) 개관과 함께, Application Load Balancer를 통한 트래픽 분산, Auto Scaling을 통한 고가용성 확보, Route 53을 통한 도메인 관리를 학습한다. EC2를 Private Subnet에 배치하고 ALB를 통해 접근하는 실무 패턴을 다룬다.

- 성격: 이론 + 실습
- 실습: ALB/Target Group 구성, Auto Scaling 설정, Route 53 도메인 연결

### 06 S3와 CloudFront - Storage & Content Delivery

AWS 객체 스토리지 서비스 S3의 핵심 개념과 접근 제어를 학습하고, 정적 웹 호스팅과 CloudFront CDN을 통한 콘텐츠 배포를 구성한다. EC2에서 S3에 접근하는 방법을 IAM Role과 함께 다룬다.

- 성격: 이론 + 실습
- 실습: Bucket 생성/관리, 정적 웹 호스팅 구성, CloudFront Distribution 생성, EC2-S3 연동

### 07 RDS - Managed Database

AWS 관리형 데이터베이스 서비스 RDS를 학습한다. Private Subnet에 DB Instance를 생성하고, Subnet Group을 구성하여 EC2에서 RDS로 연결하는 데이터 계층을 완성한다.

- 성격: 이론 + 실습
- 실습: DB Instance 생성, Subnet Group 구성, EC2-RDS 연결

### 08 ECS - Container Orchestration

Docker 컨테이너 기반 배포 환경을 AWS에서 구성하는 방법을 학습한다. ECR에 Container Image를 저장하고, ECS Cluster, Task Definition, Service를 구성하여 EC2 기반 배포를 컨테이너 기반으로 전환한다.

- 성격: 실습 중심
- 실습: ECR Push, ECS Cluster/Task/Service 구성, Fargate 배포, ALB 연동

---

## 학습 흐름

```text
Cloud 이해 → 보안 기초 → 서버 생성 → 네트워크 설계 → 고가용성 → 스토리지/CDN → 데이터베이스 → 컨테이너 전환
  (Ch01)       (Ch02)      (Ch03)       (Ch04)        (Ch05)       (Ch06)          (Ch07)         (Ch08)
```

## 시리즈 프로젝트

각 Chapter의 개별 개념 Lab과 별도로, 시리즈 전역 프로젝트를 점진적으로 완성하는 프로젝트 Lab이 함께 진행된다.

### Gallery 프로젝트 Lab (요약)

시리즈 `README.md`의 **Series Project: Gallery** 표와 동일한 Lab 제목을 쓴다. 앱 "버전"이 아니라 **AWS에서 구성·검증하는 시나리오**별 묶음이다.

| Project Lab | AWS에서 하는 일 | 핵심 설정(예) | Chapter |
|-------------|-----------------|---------------|---------|
| Gallery - EC2 기본 배포 | EC2에 Gallery 최초 배포(기본 구성) | `dev`, local storage + H2 | Ch03 |
| Gallery - Custom VPC 이전 | 동일 앱, Default VPC → Custom VPC로 네트워크 경계 전환 | VPC/Subnet/Route/SG | Ch04 |
| Gallery: ALB/ASG/Route 53 | Private Subnet + ALB + ASG + Route 53로 접근 경로 전환 | 8080, `/actuator/health`, Alias | Ch05 |
| Gallery: S3 연동 | 업로드 저장소를 S3로 전환 | `app.storage.type=s3`, IAM Role | Ch06 |
| Gallery: RDS(MariaDB 11.8.5) 연동 | DB를 RDS(MariaDB 11.8.5)로 전환 | `spring.datasource.*` → RDS | Ch07 |
| Gallery: ECS(Fargate) 배포 | 컨테이너로 전환해 ECS(Fargate)에 배포 | Image/ECR, Task/Service | Ch08 |

### 최종 아키텍처

```text
[CloudFront] → [S3 (Static)]
[Route 53] → [ALB] → [EC2 (Private Subnet)] → [RDS (Private Subnet)]
                        ↕
                     [S3 (Assets)]
```

### 프로젝트 Phase

- **Phase 1** (Ch03~07): Spring Boot 웹 애플리케이션(gallery-spring-boot)을 EC2 + S3 + RDS 기반으로 배포
- **Phase 2** (Ch08): 동일 애플리케이션을 Docker/ECS 기반으로 전환

### Draft 배치와 레포·Notion 배치 (이중 구조)

- **Section draft**(`.cursor/draft/{chapter}.{section}.notion.cursor.md`)에는 이론·**개별 Lab**(`[실습] lab{no}`)·**Gallery**(`[실습] Gallery: …`)가 **한 파일에** 들어갈 수 있다(작성·검수 단위).
- **Notion 정리·GitHub 예제**는 사용자 규칙에 따라 **`chapter`–`section`–`lab{no}`** 경로와, Gallery는 **`{section no} [실습] Gallery - …` / `[실습] Gallery: …` 형태의 Section 디렉터리**로 분리할 수 있다. Gallery는 **시리즈 전역 프로젝트 Lab**(번호 없음)으로 취급한다.
- 상세 문구·Workspace 트리: **`AGENTS.md`** — `# Draft와 Notion·GitHub 레이아웃 (이중 구조)` · `# Workspace Structure`**.

| 관점 | 개별 Lab (`lab{no}`) | Gallery 프로젝트 Lab |
|------|----------------------|----------------------|
| **Section draft** | `[실습] lab{no}` 포함 | `[실습] Gallery: …` 블록 포함 |
| **Chapter 폴더 (예: GitHub)** | `…/lab{no}/` 등 | `…/{no} [실습] Gallery - …/` 등 **전용 Section 폴더** |

---

## 작업 현황

| Section | Draft | README | Lab 범위 | 상태 |
|---------|-------|--------|----------|------|
| 01.01 Cloud Computing 개요 | O | O | - | 초안완료 |
| 01.02 AWS Global Infrastructure | O | O | - | 초안완료 |
| 01.03 AWS 계정과 Console | O | O | lab01, lab02 | 초안완료 |
| 02.01 IAM 개요 | O | O | - | 초안완료 |
| 02.02 User와 Group | O | O | lab03 | 초안완료 |
| 02.03 Policy | O | O | lab04 | 초안완료 |
| 02.04 Role | O | O | lab05 | 초안완료 |
| 03.01 EC2 개요 | O | O | - | 초안완료 |
| 03.02 Instance 생성과 접속 | O | O | lab06 | 초안완료 |
| 03.03 EBS | O | O | lab07, lab08, lab09 | 초안완료 |
| 03.04 Elastic IP | O | O | lab10 | 초안완료 |
| 03 프로젝트 Lab | O | - | Gallery - EC2 기본 배포 | 초안완료(03.04에 포함) |
| 04.01 VPC와 Subnet - CIDR & Route Table | O | O | lab11 | 초안완료 |
| 04.02 Public Subnet & Internet Gateway | O | O | lab12 | 초안완료 |
| 04.03 Traffic Control I - Security Group | O | O | lab13 | 초안완료 |
| 04.04 Traffic Control II - Network ACL | O | O | lab14 | 초안완료 |
| 04.05 Isolation - Private Subnet & VPC Endpoint | O | O | lab15 | 초안완료 |
| 04.06 NAT Gateway | O | O | lab16 | 초안완료 |
| 04.07 Traffic Flow | O | O | - | 초안완료 |
| 04 프로젝트 Lab | O | - | Gallery - Custom VPC 이전 | 초안완료(04.07에 포함) |
| 05.01 ELB와 Target Group | O | O | Gallery | 초안완료 |
| 05.02 Auto Scaling | O | O | Gallery | 초안완료 |
| 05.03 Route 53 | O | O | Gallery | 초안완료 |
| 06.01 S3 개요와 Bucket 관리 | O | O | lab17 | 초안완료 |
| 06.02 Bucket Policy와 접근 제어 | O | O | lab18 | 초안완료 |
| 06.03 정적 웹 호스팅과 CloudFront | O | O | lab19 | 초안완료 |
| 06 프로젝트 Lab | O | - | Gallery: S3 연동 | 초안완료(06.03에 포함) |
| 07.01 RDS 개요 | O | O | - | 초안완료 |
| 07.02 DB Instance와 Subnet Group | O | O | lab20 | 초안완료 |
| 07.03 EC2-RDS 연결 | O | O | lab21 | 초안완료 |
| 07 프로젝트 Lab | O | - | Gallery: RDS(MariaDB 11.8.5) 연동 | 초안완료(07.03에 포함) |
| 08.01 ECR과 Container Image | O | O | lab22 | 초안완료 |
| 08.02 ECS Cluster와 Task Definition | O | O | lab23 | 초안완료 |
| 08.03 Service와 Fargate | O | O | lab24 | 초안완료 |
| 08 프로젝트 Lab | O | - | Gallery: ECS(Fargate) 배포 | 초안완료(08.03에 포함) |

---

## 상태

- 작성일: 2026-03-19
- 상태: 확정
- 비고: 확정 상태이나, 사용자 요청 시 언제든 구조 변경 가능 (AGENTS.md Reorganization Rules 참조)
