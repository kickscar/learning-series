# Chapter 07 — Provider 심화

## 목표

Provider 버전 관리와 lock 파일의 역할을 이해하고,
alias를 활용한 멀티 리전·멀티 계정 구성을 실습한다.

---

## Section 구성

### Section 01 — Provider 버전과 lock 파일
- **유형**: 이론
- **내용**:
  - `required_providers` 블록: source, version 제약
  - 버전 제약 문법: `=`, `>=`, `~>`, `!=`
  - `.terraform.lock.hcl`: 정확한 버전과 해시 고정
  - lock 파일의 목적: 팀 전체 동일 버전 보장
  - `terraform init -upgrade`: lock 파일 버전 갱신
  - lock 파일을 VCS에 커밋해야 하는 이유
- **Lab**: 없음

---

### Section 02 — Multiple Provider 설정
- **유형**: 이론 + 실습
- **내용**:
  - `alias`로 동일 provider 복수 인스턴스 구성
  - provider 지정 방법: `provider = aws.<alias>`
  - 멀티 리전 사용 사례: DR 환경, 리전별 리소스
  - 모듈에서 alias provider 전달: `providers` 인수
- **Lab**:
  - `[실습] lab01: alias로 멀티 리전 provider 설정`
    - `aws` (ap-northeast-2) + `aws.us` (us-east-1) provider 설정
    - 각 리전에 S3 버킷 생성
    - 리소스에 provider 명시적 지정
  - `[실습] lab02: 모듈에 alias provider 전달`
    - 모듈 정의에 `configuration_aliases` 선언
    - root module에서 alias provider를 모듈에 주입
    - 멀티 리전 리소스가 모듈 내부에서 생성됨을 확인

---

### Section 03 — Provider 의존성 관리
- **유형**: 이론 + 실습
- **내용**:
  - `terraform providers`: 현재 설정의 provider 목록 확인
  - `terraform providers lock`: 플랫폼별 해시 사전 계산
  - `terraform init -upgrade`: 버전 범위 내 최신으로 갱신
  - CI/CD 환경에서 provider 캐싱 전략 (plugin cache dir)
  - `TF_PLUGIN_CACHE_DIR` 환경변수
- **Lab**:
  - `[실습] lab01: lock 파일 관리`
    - `terraform providers lock -platform=linux_amd64` 실행
    - lock 파일 변경 내용 확인
    - 버전 범위 변경 후 `init -upgrade` 결과 비교

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/07.01.claude.notion.md` |
| 02 | `.claude/draft/07.02.claude.notion.md` |
| 03 | `.claude/draft/07.03.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획확정 |
| 02 | 계획확정 |
| 03 | 계획확정 |
