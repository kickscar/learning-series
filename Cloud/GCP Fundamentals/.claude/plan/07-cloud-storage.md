# Chapter 07 — Cloud Storage

## 목표

GCP 오브젝트 스토리지인 Cloud Storage의 구조와 접근 제어를 이해하고,
버킷 생성, 객체 관리, 접근 제어를 직접 구성한다.
Gallery 앱의 파일 업로드 기능을 Cloud Storage로 전환한다.

---

## AWS / Azure 대응 관계

| GCP | AWS | Azure |
|-----|-----|-------|
| Cloud Storage | Amazon S3 | Azure Blob Storage |
| Bucket | S3 Bucket | Storage Account > Container |
| Object | S3 Object | Blob |
| Storage Class | S3 Storage Class | Blob Access Tier |
| IAM (Bucket/Object 레벨) | Bucket Policy / S3 ACL | RBAC / Container ACL |
| Signed URL | Pre-signed URL | SAS Token |
| Object Lifecycle Rule | S3 Lifecycle Rule | Blob Lifecycle Management |

---

## Section 구성

### Section 01 — Cloud Storage 개요
- **유형**: 이론
- **내용**:
  - Cloud Storage 개념: 완전 관리형 오브젝트 스토리지
  - Bucket과 Object 구조
  - Storage Class 유형 (Standard, Nearline, Coldline, Archive)
  - 지역 유형 (Regional, Dual-region, Multi-region)
  - 버전 관리(Versioning)와 Object Lifecycle 개요
  - Amazon S3, Azure Blob Storage와의 비교
- **Lab**: 없음

### Section 02 — 버킷 생성 및 객체 관리
- **유형**: 이론 + 실습
- **내용**:
  - 버킷 생성 옵션 (이름, 지역, Storage Class, 접근 제어 방식)
  - 객체 업로드 / 다운로드 / 삭제
  - 폴더(Prefix) 구조 이해
  - 공개 URL 구조 (storage.googleapis.com/...)
- **Lab**:
  - `[실습] lab20: 버킷 생성 및 객체 관리`
    - Standard 버킷 생성 (Regional, us-central1)
    - 파일 업로드 (이미지, 텍스트)
    - 객체 상세 정보 확인 (크기, Content-Type, URL)
    - 객체 삭제 및 버킷 내 검색
    - Object Versioning 활성화 후 동작 확인

### Section 03 — 접근 제어
- **유형**: 이론 + 실습
- **내용**:
  - IAM 기반 접근 제어 (Uniform Bucket-level Access) — 권장 방식
  - ACL(Access Control List) 기반 접근 제어 — Fine-grained
  - 공개 접근 설정 (allUsers, allAuthenticatedUsers)
  - 서명된 URL(Signed URL) — 임시 접근 권한 부여
  - CORS 설정 개요
- **Lab**:
  - `[실습] lab21: 접근 제어 및 서명된 URL`
    - Uniform Bucket-level Access 활성화
    - IAM 역할 바인딩 (roles/storage.objectViewer)
    - 공개 접근 설정 후 브라우저 직접 접근 확인
    - Service Account로 Signed URL 생성 및 만료 확인

### Section 04 — [실습] Gallery: Cloud Storage 연동
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab20, lab21 완료
- **내용**:
  - Gallery 앱의 이미지 업로드 → 로컬 디스크에서 Cloud Storage로 전환
  - Gallery 전용 버킷 생성 (gcp-fund-gallery-bucket)
  - Gallery MIG의 Service Account에 Storage 권한 부여
  - Private Google Access 활용 (External IP 없이 Cloud Storage 접근)
  - 업로드된 이미지 Cloud Storage URL로 서빙 확인
  - **리소스**: gcp-fund-gallery-* (누적)
- **예제 파일**: `07 Cloud Storage/04 [실습] Gallery - Cloud Storage 연동/` 하위

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/07.01.claude.notion.md` |
| 02 | `.claude/draft/07.02.claude.notion.md` |
| 03 | `.claude/draft/07.03.claude.notion.md` |
| 04 Gallery | `.claude/draft/07.04.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획확정 |
| 02 | 계획확정 |
| 03 | 계획확정 |
| 04 Gallery | 계획확정 |
