# Chapter 08: ECS - Container Orchestration

## 챕터 목표

Docker 컨테이너 기반 배포 환경을 AWS에서 구성하는 방법을 학습한다. ECR에 Container Image를 저장하고, ECS Cluster, Task Definition, Service를 구성하여 Fargate 기반으로 배포한다. EC2 기반 배포를 컨테이너 기반으로 전환하는 과정을 경험한다.

## 챕터 성격

실습 중심. ECR부터 ECS Service 배포까지 단계적으로 구성한다.

---

## Section 구성

### 01 ECR과 Container Image

**주요 내용:**

- ECR(Elastic Container Registry)이란
  - AWS의 관리형 Docker Container Registry
  - Docker Hub와의 비교
  - Private Repository
- Repository 관리
  - Repository 생성
  - Repository URI 구조
  - Lifecycle Policy: 오래된 Image 자동 정리
- Container Image Push
  - ECR 로그인 인증
  - Docker Image Tag 규칙
  - Docker Push
  - Console에서 Image 확인
- Image 관리
  - Tag 전략: latest, 버전 태그, Git SHA
  - Image 스캔 (취약점 검사 개념 소개)

**실습:**

- lab22: ECR Repository 생성과 Image Push
  - ECR Repository 생성, Gallery Image 빌드, Tag, Push, Console에서 확인

---

### 02 ECS Cluster와 Task Definition

**주요 내용:**

- ECS(Elastic Container Service) 개요
  - AWS의 컨테이너 오케스트레이션 서비스
  - ECS vs EKS(Kubernetes): 간략 비교
- Launch Type
  - EC2 Launch Type: 직접 관리하는 EC2 Instance에서 컨테이너 실행
  - Fargate Launch Type: 서버리스, AWS가 인프라 관리
  - Fargate를 선택하는 이유
- ECS Cluster
  - Cluster란: Task와 Service의 논리적 그룹
  - Cluster 생성
  - Fargate Cluster 설정
- Task Definition
  - Task Definition이란: 컨테이너 실행 설정서
  - Container 설정: Image URI, Port Mapping
  - 리소스 할당: CPU, Memory
  - 환경변수: DB 연결 정보, S3 Bucket 이름 등
  - Task Execution Role: ECR Image Pull, CloudWatch Logs 권한
  - Task Role: 컨테이너 내부에서 AWS 서비스 접근 권한

**실습:**

- lab23: ECS Cluster와 Task Definition 생성
  - Fargate Cluster 생성, Task Definition 작성(ECR Image, Port, 환경변수, IAM Role)

---

### 03 Service와 Fargate

**주요 내용:**

- ECS Service
  - Service란: Task의 원하는 수를 유지하는 스케줄러
  - Desired Count: 유지할 Task 수
  - 실패한 Task 자동 재시작
- Service 네트워크 구성
  - VPC, Subnet 설정 (Private Subnet)
  - Security Group 설정
  - ALB 연동: Target Group에 자동 등록
- Fargate 배포
  - Service 생성과 Task 실행
  - Task 상태 확인
  - 로그 확인 (CloudWatch Logs)
- ALB + ECS 연동
  - ALB Target Group: Target Type을 IP로 설정
  - Listener Rule과 Target Group 연결
  - Health Check 설정
- Service Auto Scaling 개요
  - Application Auto Scaling
  - Target Tracking: CPU/Memory 기반
  - ECS Service Scaling vs EC2 Auto Scaling

**실습:**

- lab24: Fargate Service 배포와 ALB 연동
  - ECS Service 생성(Fargate, Private Subnet), ALB Target Group 연동, ALB 도메인으로 접근 확인

---

## 프로젝트 Lab

- [실습] Gallery: ECS(Fargate) 배포
  - 동일 Gallery 앱을 컨테이너 이미지로 만들어 ECS Fargate로 배포
  - ECR에서 Image Pull, RDS 연결, S3 연동
  - ALB를 통한 접근 확인
  - Phase 2 완성: EC2 기반에서 Container 기반으로 전환 완료

---

## 선행 조건

- Ch03~Ch07 학습 완료 (EC2, VPC, ALB, S3, RDS)
- Docker 기본 지식 (Image 빌드, Container 실행)
  - Docker 시리즈에서 사전 학습

---

## 상태

- 작성일: 2026-03-19
- 상태: 확정
