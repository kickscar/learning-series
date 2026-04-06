# Chapter 06 — Azure Storage

## 목표

Azure Storage의 핵심 유형을 이해하고 Blob Storage, Azure Files를 직접 구성한다.
챕터 마무리로 Gallery 앱의 파일 업로드 저장소를 Blob Storage로 전환한다.

---

## Section 구성

### Section 01 — Azure Storage 개요
- **유형**: 이론
- **내용**:
  - Azure Storage Account 개념 (단일 네임스페이스, 4개 서비스 포함)
  - Blob / File / Queue / Table Storage 비교
  - Storage Account 성능 계층 (Standard, Premium)
  - 중복성 옵션 (LRS, ZRS, GRS)
  - AWS S3와의 비교
- **Lab**: 없음

### Section 02 — Storage Account와 Blob Storage
- **유형**: 이론 + 실습
- **내용**:
  - Storage Account 생성 옵션
  - Blob 컨테이너 개념 (S3 Bucket과 비교)
  - Blob 유형 (Block, Append, Page)
  - 접근 수준 (Private, Blob, Container)
  - 정적 웹사이트 호스팅 개요
- **Lab**:
  - `[실습] lab18: Storage Account 생성 및 Blob 업로드`
    - Storage Account 생성 (LRS, Standard)
    - Blob 컨테이너 생성 (접근 수준: Private)
    - 파일 업로드 및 URL 접근 확인
    - 정적 웹사이트 호스팅 활성화 및 index.html 업로드

### Section 03 — Azure Files
- **유형**: 이론 + 실습
- **내용**:
  - Azure Files 개념 (SMB/NFS 파일 공유)
  - File Share 생성 옵션 (할당량, 성능 계층)
  - VM에서 마운트 방법 (cifs-utils)
  - 사용 시나리오 (공유 설정 파일, 로그 수집 등)
- **Lab**:
  - `[실습] lab18: Azure File Share 생성 및 VM 마운트`
    - File Share 생성 (5GB)
    - VM에서 SMB 마운트 스크립트 실행
    - 파일 쓰기/읽기 확인

### Section 04 — Storage 접근 제어
- **유형**: 이론 + 실습
- **내용**:
  - Access Key vs SAS Token vs Azure AD 인증 비교
  - SAS Token 유형 (Account SAS, Service SAS)
  - 만료 시간, 권한 범위 설정
  - Stored Access Policy 개요
- **Lab**:
  - `[실습] lab18: SAS Token 생성 및 접근 제어 확인`
    - Storage Account Access Key 확인
    - Blob 컨테이너 SAS Token 생성 (읽기 전용, 1시간)
    - SAS URL로 파일 접근 확인
    - 만료 후 접근 차단 확인

### Section 05 — [실습] Gallery: Blob Storage 연동
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab18, lab18 완료 (Blob Storage + 접근 제어)
- **내용**:
  - Gallery 앱 파일 업로드 저장소를 로컬 → Azure Blob Storage로 전환
  - Storage Account 및 컨테이너 생성 (Gallery 전용)
  - 앱 설정 파라미터 변경 (storage type, connection string 또는 SAS)
  - 업로드/다운로드 동작 확인
- **예제 파일**: `06 Object Storage/05 [실습] Gallery - Blob Storage 연동/` 하위

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/06.01.claude.notion.md` |
| 02 | `.claude/draft/06.02.claude.notion.md` |
| 03 | `.claude/draft/06.03.claude.notion.md` |
| 04 | `.claude/draft/06.04.claude.notion.md` |
| 05 Gallery | `.claude/draft/06.05.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획확정 |
| 02 | 계획확정 |
| 03 | 계획확정 |
| 04 | 계획확정 |
| 05 Gallery | 계획확정 |
