# AWS Fundamentals

AWS Console을 기반으로 Cloud Infrastructure의 핵심 서비스를 학습하는 시리즈.

직접 리소스를 생성하고 연결하는 과정을 통해 **배포 가능한 Cloud 환경을 구성하는 구조와 흐름**을 이해한다.

## Who is this for?

- Backend 또는 Frontend 개발 경험이 있는 개발자
- Cloud Infrastructure 경험이 없거나 제한적인 개발자
- 자신이 개발한 애플리케이션을 AWS 위에서 동작시키고자 하는 엔지니어

## What you will learn

- AWS Console을 통한 Cloud Infrastructure 구성
- EC2, VPC, IAM, S3, RDS, ECS 등 핵심 서비스의 이해와 실습
- 리소스 간 연결 관계 (Networking + Security + Compute + Storage)
- 실제 애플리케이션을 배포 가능한 형태의 Cloud 환경 구성

## Table of Contents

| # | Chapter | 주요 내용 |
|---|---------|-----------|
| 01 | [Cloud와 AWS 시작하기](01%20Cloud와%20AWS%20시작하기) | Cloud Computing, Global Infrastructure, 계정과 Console |
| 02 | [IAM](02%20IAM) | User, Group, Policy, Role |
| 03 | [EC2 - Virtual Server](03%20EC2%20-%20Virtual%20Server) | Instance, AMI, EBS, Elastic IP |
| 04 | [VPC와 Networking](04%20VPC와%20Networking) | VPC, Subnet, Route Table, IGW, SG, NACL, Private Subnet, NAT GW, Traffic Flow |
| 05 | [Traffic Management & High Availability](05%20Traffic%20Management%20%26%20High%20Availability) | ALB, Auto Scaling, Route 53 |
| 06 | [S3와 CloudFront](06%20S3와%20CloudFront%20-%20Storage%20%26%20Content%20Delivery) | Bucket, Policy, 정적 웹 호스팅, CDN |
| 07 | [RDS - Managed Database](07%20RDS%20-%20Managed%20Database) | DB Instance, Subnet Group, EC2-RDS 연결 |
| 08 | [ECS - Container Orchestration](08%20ECS%20-%20Container%20Orchestration) | ECR, Cluster, Task Definition, Fargate |

## Learning Path

```
Cloud 이해 → 보안 기초 → 서버 생성 → 네트워크 설계 → 고가용성 → 스토리지/CDN → 데이터베이스 → 컨테이너 전환
  (Ch01)       (Ch02)      (Ch03)       (Ch04)        (Ch05)       (Ch06)          (Ch07)         (Ch08)
```

## Series Project: Gallery

각 Chapter의 개별 Lab과 별도로, **Gallery** 프로젝트를 점진적으로 완성하는 프로젝트 Lab이 함께 진행된다.

Gallery는 시리즈에서 배포 대상으로 사용하는 애플리케이션이다.

| 구분 | Lab | 구성 | 목표 |
|------|-----|------|------|
| 실습 | Gallery - EC2 기본 배포 | EC2 | 기본 구성(local storage + H2)으로 최초 배포 |
| 인프라 전환 | Gallery - Custom VPC 이전 | EC2 + Custom VPC | Default VPC에서 Custom VPC로 이전 |
| 인프라 전환 | Gallery: ALB/ASG/Route 53 | ALB + ASG + Route 53 | Private Subnet 배치, 트래픽 분산, 고정 엔드포인트 구성 |
| 실습 | Gallery: S3 연동 | EC2 + S3 | 업로드 파일을 S3로 저장하도록 전환 |
| 실습 | Gallery: RDS(MariaDB 11.8.5) 연동 | EC2 + S3 + RDS | DB를 RDS(MariaDB 11.8.5)로 전환하여 end-to-end 동작 확인 |
| 실습 | Gallery: ECS(Fargate) 배포 | ECS + S3 + RDS | 동일 앱을 컨테이너로 전환해 배포 |

### Target Architecture

```
[CloudFront] → [S3 (Static)]
[Route 53] → [ALB] → [EC2 (Private Subnet)] → [RDS (Private Subnet)]
                        ↕
                     [S3 (Assets)]
```

## Labs

총 24개의 개별 Lab과 6개의 프로젝트 Lab으로 구성된다.

프로젝트 Lab은 동일 앱을 대상으로 "기본 배포 → 인프라 전환 → 연동 확장 → 컨테이너 전환" 순서로 진행된다.

| Lab | Chapter | 내용 |
|-----|---------|------|
| lab01 | Ch01 | AWS 계정 생성과 Console 탐색 |
| lab02 | Ch01 | AWS Budget Alert 설정 |
| lab03 | Ch02 | IAM User와 Group 생성 |
| lab04 | Ch02 | Custom Policy 생성과 연결 |
| lab05 | Ch02 | EC2용 IAM Role 생성 |
| lab06 | Ch03 | EC2 Instance 생성과 SSH 접속 |
| lab07 | Ch03 | EBS Volume 생성과 연결 |
| lab08 | Ch03 | 스냅샷 생성 및 복원 |
| lab09 | Ch03 | AMI(Java 빌드/실행 환경) 생성 및 재배포 |
| lab10 | Ch03 | Elastic IP 할당과 연결 |
| lab11 | Ch04 | Custom VPC와 Subnet 생성 |
| lab12 | Ch04 | Public Subnet 인터넷 연결(IGW + Route Table) |
| lab13 | Ch04 | Security Group 트래픽 제어(ICMP, SSH) |
| lab14 | Ch04 | NACL 트래픽 제어 실험 |
| lab15 | Ch04 | Private Subnet 격리 확인과 VPC Endpoint(SSM 운영 접속) |
| lab16 | Ch04 | NAT Gateway 구성과 Private EC2 Outbound 검증 |
| lab17 | Ch06 | S3 Bucket 생성과 Object 관리 |
| lab18 | Ch06 | Bucket Policy와 EC2-S3 연동 |
| lab19 | Ch06 | S3 정적 웹 호스팅과 CloudFront Distribution |
| lab20 | Ch07 | RDS DB Instance 생성 |
| lab21 | Ch07 | EC2에서 RDS 연결 |
| lab22 | Ch08 | ECR Repository 생성과 Image Push |
| lab23 | Ch08 | ECS Cluster와 Task Definition 생성 |
| lab24 | Ch08 | Fargate Service 배포와 ALB 연동 |

## Prerequisites

- Backend 또는 Frontend 개발 경험 (4년 이상 권장)
- AWS 계정 (Free Tier 사용 가능)
- Docker 기본 지식 (Ch08 ECS)

## Series Context

```
Cloud Series
├─ AWS Fundamentals          ← 현재 시리즈
├─ AWS IaC with CloudFormation
├─ Terraform Core
├─ AWS Infrastructure Architecture & Design
├─ GCP Fundamentals
└─ GCP IaC with Terraform
```

**Next**: [AWS IaC with CloudFormation](../AWS%20IaC%20with%20CloudFormation) — Console에서 익힌 인프라를 선언형 코드로 자동화
