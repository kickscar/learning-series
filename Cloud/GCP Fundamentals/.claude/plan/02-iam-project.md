# Chapter 02 — IAM & 프로젝트 관리

## 목표

GCP 리소스 계층 구조와 IAM의 동작 원리를 이해하고,
프로젝트·Billing Account·IAM 역할·Service Account를 직접 구성한다.

---

## AWS 대응 관계

| GCP | AWS |
|-----|-----|
| Organization > Folder > Project | Organization > OU > Account |
| Billing Account | AWS Billing (계정 단위) |
| IAM Member (Google Account / Group) | IAM User / Group |
| IAM Role (Predefined / Custom) | IAM Role / Policy |
| Service Account | IAM Role (EC2 Instance Profile 등) |

---

## Section 구성

### Section 01 — GCP IAM 개요
- **유형**: 이론
- **내용**:
  - GCP 리소스 계층: Organization > Folder > Project > Resource
  - IAM 기본 개념: Who(Principal) + Can do what(Role) + On which resource(Resource)
  - Principal 유형: Google Account, Google Group, Service Account, Domain
  - 역할 유형: Basic / Predefined / Custom
  - 정책 상속(Policy Inheritance) 동작 원리
  - AWS IAM과의 비교
- **Lab**: 없음

### Section 02 — 프로젝트와 Billing Account
- **유형**: 이론 + 실습
- **내용**:
  - 프로젝트 개념 — GCP 리소스 격리의 기본 단위
  - Billing Account 구조 및 프로젝트 연결 방식
  - 프로젝트 ID / 프로젝트 번호 / 프로젝트 이름 구분
  - 라벨(Label)을 통한 리소스 분류
- **Lab**:
  - `[실습] lab02: 프로젝트 생성 및 Billing Account 연결`
    - 새 프로젝트 생성 (gcp-fund-lab-project)
    - Billing Account 연결 확인
    - 라벨 설정 (env: lab, series: gcp-fundamentals)
    - Console에서 프로젝트 전환 확인

### Section 03 — IAM 역할과 정책
- **유형**: 이론 + 실습
- **내용**:
  - Predefined Role 구조 (roles/compute.viewer 등 명명 규칙)
  - IAM 정책 바인딩: 구성원에게 역할 할당
  - 조건부 IAM 바인딩(Conditions) 개요
  - 최소 권한 원칙(Principle of Least Privilege)
  - AWS IAM Policy와의 비교
- **Lab**:
  - `[실습] lab03: IAM 역할 할당 및 접근 검증`
    - 새 Google 계정(테스트용) IAM에 구성원으로 추가
    - Viewer 역할 할당 후 접근 범위 확인
    - Editor 역할로 변경 후 리소스 생성 가능 여부 확인
    - IAM 정책 감사 로그 확인

### Section 04 — Service Account
- **유형**: 이론 + 실습
- **내용**:
  - Service Account 개념 — 사람이 아닌 애플리케이션/VM을 위한 ID
  - AWS IAM Role(Instance Profile)과의 비교
  - Service Account 키(JSON) vs 키 없는 방식(Workload Identity) 개요
  - VM에 Service Account 연결 방식
  - SA를 통한 GCP API 호출 흐름
- **Lab**:
  - `[실습] lab04: Service Account 생성 및 권한 바인딩`
    - Service Account 생성 (gcp-fund-lab-sa)
    - Predefined Role 바인딩 (roles/storage.objectViewer)
    - JSON 키 발급 및 다운로드
    - VM에 SA 연결 후 권한 동작 확인

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/02.01.claude.notion.md` |
| 02 | `.claude/draft/02.02.claude.notion.md` |
| 03 | `.claude/draft/02.03.claude.notion.md` |
| 04 | `.claude/draft/02.04.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획확정 |
| 02 | 계획확정 |
| 03 | 계획확정 |
| 04 | 계획확정 |
