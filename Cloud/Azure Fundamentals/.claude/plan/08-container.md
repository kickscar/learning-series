# Chapter 08 — Container: ACR & Azure Container Apps

## 목표

Azure 컨테이너 서비스의 핵심 구조를 이해하고 직접 배포한다.
ACR에 Docker 이미지를 빌드/푸시하고, Azure Container Apps로 Gallery 앱을 컨테이너로 전환한다.

---

## AWS 대응 관계

| Azure | AWS |
|-------|-----|
| Azure Container Registry (ACR) | Amazon ECR |
| Azure Container Apps | AWS ECS (Fargate) |

---

## Section 구성

### Section 01 — 컨테이너와 Azure 컨테이너 서비스 개요
- **유형**: 이론
- **내용**:
  - 컨테이너 개념 및 Docker 기초 (이미지, 컨테이너, 레지스트리)
  - Azure 컨테이너 서비스 비교
    - ACI (Azure Container Instances): 단순 단일 컨테이너 실행
    - Azure Container Apps: 서버리스, 스케일링, HTTP 기반 (이 챕터에서 사용)
    - AKS (Azure Kubernetes Service): 완전한 K8s (Fundamentals 범위 초과)
  - AWS ECR + ECS Fargate와의 비교
- **Lab**: 없음

### Section 02 — ACR - 이미지 빌드와 푸시
- **유형**: 이론 + 실습
- **내용**:
  - ACR(Azure Container Registry) 개념과 SKU (Basic, Standard, Premium)
  - Admin 계정 vs 서비스 주체(Service Principal) 인증
  - Docker 이미지 빌드 및 태깅
  - ACR Tasks (Cloud 빌드) 개요
- **Lab**:
  - `[실습] lab23: ACR 생성 및 이미지 빌드/푸시`
    - ACR 생성 (Basic SKU)
    - Docker 이미지 빌드 (로컬 또는 Cloud Shell)
    - ACR에 이미지 푸시
    - Portal에서 이미지 확인

### Section 03 — Azure Container Apps 배포
- **유형**: 이론 + 실습
- **내용**:
  - Container Apps 구조 (Environment → Container App)
  - Ingress 설정 (외부/내부, 포트)
  - 환경 변수 및 Secrets 설정
  - 스케일링 규칙 (HTTP 요청 기반) 개요
  - Revision 관리 개요
- **Lab**:
  - `[실습] lab23: Azure Container Apps 배포`
    - Container Apps Environment 생성
    - ACR 이미지로 Container App 생성
    - Ingress 설정 (외부 공개, 포트 지정)
    - 환경 변수 설정
    - 배포 URL로 접근 확인

### Section 04 — [실습] Gallery: Container Apps 배포
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab23~22 완료 (ACR + Container Apps)
- **내용**:
  - Gallery Docker 이미지 빌드 및 ACR 푸시
  - Container Apps Environment 생성 (Gallery 전용)
  - Gallery Container App 배포 (Blob Storage, MySQL 환경 변수 연결)
  - 외부 URL로 Gallery 접근 확인
  - 기존 VM 기반 배포와 Container 기반 배포 비교
- **예제 파일**: `08 Container - ACR & Azure Container Apps/04 [실습] Gallery - Container Apps 배포/` 하위

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/08.01.claude.notion.md` |
| 02 | `.claude/draft/08.02.claude.notion.md` |
| 03 | `.claude/draft/08.03.claude.notion.md` |
| 04 Gallery | `.claude/draft/08.04.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획확정 |
| 02 | 계획확정 |
| 03 | 계획확정 |
| 04 Gallery | 계획확정 |
