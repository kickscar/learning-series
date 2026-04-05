# Chapter 02 — Azure IAM & Microsoft Entra ID

## 목표

Azure의 ID 관리 체계(Microsoft Entra ID)와 리소스 접근 제어(RBAC)를 이해하고,
구독, 리소스 그룹, 사용자/그룹/역할을 직접 구성해본다.

---

## Section 구성

### Section 01 — Microsoft Entra ID 개요
- **유형**: 이론
- **내용**:
  - Microsoft Entra ID (구 Azure Active Directory) 개념
  - Tenant / Directory 구조
  - AWS IAM과의 비교 (개념 대응)
  - 인증(Authentication) vs 인가(Authorization) 구분
- **Lab**: 없음

### Section 02 — 구독과 리소스 그룹
- **유형**: 이론 + 실습
- **내용**:
  - Subscription 개념과 역할 (청구 단위, 접근 범위)
  - Resource Group: 리소스의 논리적 컨테이너
  - 리소스 그룹 설계 원칙 (환경별, 서비스별)
  - 태그(Tag) 활용 전략
- **Lab**:
  - `[실습] lab02: 리소스 그룹 생성 및 태그 설정`
    - Portal에서 리소스 그룹 생성
    - 태그(Tag) 추가 (환경, 프로젝트 등)
    - 리소스 그룹 잠금(Lock) 설정 확인

### Section 03 — 사용자, 그룹, 역할 관리
- **유형**: 이론 + 실습
- **내용**:
  - Entra ID 사용자 유형 (Member vs Guest)
  - 그룹 유형과 동적 멤버십
  - Built-in Role 개요 (Owner, Contributor, Reader)
- **Lab**:
  - `[실습] lab03: 사용자 생성 및 그룹 할당`
    - 새 사용자 생성
    - 그룹 생성 및 사용자 할당
    - 사용자 로그인 확인

### Section 04 — RBAC (Role-Based Access Control)
- **유형**: 이론 + 실습
- **내용**:
  - RBAC 구조: Security Principal + Role Definition + Scope
  - 상속 구조 (Subscription → Resource Group → Resource)
  - Custom Role 개요
  - Least Privilege 원칙
- **Lab**:
  - `[실습] lab04: RBAC 역할 할당 및 접근 검증`
    - 리소스 그룹 범위에 Reader 역할 할당
    - 해당 사용자로 로그인 후 접근 범위 검증
    - 역할 제거 후 접근 차단 확인

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
