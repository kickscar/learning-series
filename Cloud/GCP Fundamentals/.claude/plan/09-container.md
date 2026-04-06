# Chapter 09 — Container: Artifact Registry & Cloud Run

## 목표

GCP의 컨테이너 이미지 저장소와 서버리스 컨테이너 실행 환경을 이해하고 직접 구성한다.
Gallery 앱을 Docker 이미지로 빌드해 Artifact Registry에 등록하고 Cloud Run으로 배포한다.

---

## AWS / Azure 대응 관계

| GCP | AWS | Azure |
|-----|-----|-------|
| Artifact Registry | Amazon ECR | Azure Container Registry (ACR) |
| Cloud Run | AWS App Runner / Fargate | Azure Container Apps |
| Cloud Run Service | ECS Service | Container Apps |
| Cloud Run Job | ECS Task (Run Task) | Container Apps Job |
| Revision (트래픽 분산) | ECS Task Definition 버전 | Container Apps Revision |

---

## Section 구성

### Section 01 — 컨테이너와 GCP 서비스 개요
- **유형**: 이론
- **내용**:
  - 컨테이너와 Docker 개요 (이미지, 컨테이너, 레지스트리)
  - GCP 컨테이너 서비스 포지셔닝
    - Compute Engine: VM, 직접 관리
    - GKE (Google Kubernetes Engine): 컨테이너 오케스트레이션 (이 시리즈 스코프 외)
    - Cloud Run: 서버리스 컨테이너 — 이 챕터의 주제
  - Cloud Run 특성: 완전 관리형, HTTP 요청 기반 자동 스케일링, 콜드 스타트
  - Artifact Registry vs Container Registry (구버전) 차이
  - AWS ECR + App Runner, Azure ACR + Container Apps와의 비교
- **Lab**: 없음

### Section 02 — Artifact Registry
- **유형**: 이론 + 실습
- **내용**:
  - Artifact Registry 개념: 멀티 포맷 저장소 (Docker, Maven, npm, Python 등)
  - 저장소 생성 옵션 (포맷, 지역, 공개/비공개)
  - Docker 인증 설정 (gcloud 인증 헬퍼)
  - 이미지 빌드 및 푸시 흐름
  - 이미지 취약점 스캔(Vulnerability Scanning) 개요
- **Lab**:
  - `[실습] lab25: Artifact Registry 저장소 생성 및 이미지 빌드 & 푸시`
    - Docker 형식 저장소 생성 (us-central1)
    - Docker 인증 설정 (gcloud auth configure-docker)
    - 샘플 앱 Docker 이미지 빌드
    - Artifact Registry로 이미지 푸시
    - Console에서 이미지 및 태그 확인

### Section 03 — Cloud Run 배포
- **유형**: 이론 + 실습
- **내용**:
  - Cloud Run Service 개념 및 구성 요소 (Service, Revision, Traffic)
  - 배포 옵션 (이미지, 포트, 환경변수, 메모리/CPU, 동시성)
  - 트래픽 분산(Traffic Splitting): 이전 Revision ↔ 신규 Revision
  - Cloud Run의 VPC 연결 (VPC Connector / Direct VPC Egress)
  - 자동 스케일링 동작 (최소 인스턴스 0 → 콜드 스타트)
  - IAM 기반 접근 제어 (공개 vs 인증 필요)
- **Lab**:
  - `[실습] lab26: Cloud Run 서비스 배포`
    - Artifact Registry 이미지로 Cloud Run Service 배포
    - 환경변수 설정
    - Cloud Run URL로 접근 확인
    - 새 이미지 배포 후 트래픽 분산(50/50) 확인
    - 최소 인스턴스 0 설정 후 콜드 스타트 확인

### Section 04 — [실습] Gallery: Cloud Run 배포
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab25, lab26 완료
- **내용**:
  - Gallery Spring Boot 앱 Docker 이미지 빌드
  - Gallery 전용 Artifact Registry 저장소에 이미지 푸시
  - Cloud Run Service 배포
    - Cloud SQL 연결 (Cloud SQL Auth Proxy 통합)
    - Cloud Storage 연결 (Service Account 권한)
    - 환경변수로 DB/Storage 설정 주입
  - Cloud Run URL로 Gallery 전체 기능 동작 확인
  - **리소스**: gcp-fund-gallery-* (최종 상태)
- **예제 파일**: `09 Container - Artifact Registry & Cloud Run/04 [실습] Gallery - Cloud Run 배포/` 하위

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/09.01.claude.notion.md` |
| 02 | `.claude/draft/09.02.claude.notion.md` |
| 03 | `.claude/draft/09.03.claude.notion.md` |
| 04 Gallery | `.claude/draft/09.04.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획확정 |
| 02 | 계획확정 |
| 03 | 계획확정 |
| 04 Gallery | 계획확정 |
