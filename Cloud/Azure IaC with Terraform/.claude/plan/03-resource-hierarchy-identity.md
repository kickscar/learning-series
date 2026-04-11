# Chapter 03 — 리소스 계층과 Identity

## 목표

Azure 고유의 리소스 계층 구조(Resource Group → Subscription → Management Group)와
Identity 체계(Managed Identity, RBAC)를 Terraform으로 구현한다.
Gallery 앱의 Identity 기반 인프라 뼈대를 구성한다.

---

## Azure Fundamentals 대응

| 이 시리즈 (Terraform) | Azure Fundamentals (콘솔) |
|-----------------------|--------------------------|
| Sec 01~02: Resource Group | Ch02 Sec02: 구독과 리소스 그룹 |
| Sec 03: Managed Identity | (Fundamentals에서 미다룸 — IaC 추가) |
| Sec 04: RBAC 할당 | Ch02 Sec04: RBAC |

---

## Section 구성

### Section 01 — Resource Group과 구독 계층
- **유형**: 이론
- **내용**:
  - Azure 리소스 계층: Resource Group → Subscription → Management Group
  - Resource Group의 역할: 배포 경계, 라이프사이클 단위, 권한 경계
  - Terraform에서 RG가 거의 모든 리소스의 필수 인자인 이유
  - Subscription 수준 리소스 vs RG 수준 리소스
  - Management Group은 언급만 (Architecture & Design 영역)
- **Lab**: 없음

### Section 02 — Resource Group 관리
- **유형**: 이론 + 실습
- **내용**:
  - `azurerm_resource_group` 리소스
  - location 선택 전략 (koreacentral, eastus 등)
  - 태그(tags) 설정 — 네이밍 규칙과 연계
  - lifecycle 블록: `prevent_destroy`
  - az CLI로 생성 결과 확인
- **Lab**:
  - `[실습] lab06: Resource Group 생성`
    - RG 생성 (네이밍 규칙 적용)
    - 태그 설정 (project, env, managed-by)
    - `az group show`로 확인
    - `terraform destroy` 후 재생성

### Section 03 — Managed Identity
- **유형**: 이론 + 실습
- **내용**:
  - Managed Identity란: Azure 리소스가 다른 Azure 서비스에 인증하는 방법
  - System Assigned vs User Assigned MI
  - Service Principal과의 차이 (SP는 외부 도구용, MI는 Azure 리소스 간)
  - `azurerm_user_assigned_identity` 리소스
  - MI를 사용하면 시크릿 관리가 불필요 → 보안 강화
- **Lab**:
  - `[실습] lab07: Managed Identity 생성`
    - User Assigned MI 생성
    - `az identity show`로 확인
    - principal_id, client_id 출력값 이해

### Section 04 — RBAC 할당
- **유형**: 이론 + 실습
- **내용**:
  - Azure RBAC 구조: Role Definition → Role Assignment → Scope
  - 기본 역할: Owner, Contributor, Reader
  - `azurerm_role_assignment` 리소스
  - scope 계층: Management Group > Subscription > RG > Resource
  - 최소 권한 원칙(Least Privilege) — IaC에서의 실천
  - MI에 역할 할당: "이 VM이 Storage에 접근할 수 있다"
- **Lab**:
  - `[실습] lab08: RBAC 역할 할당`
    - MI에 Contributor 역할 할당 (RG scope)
    - `az role assignment list`로 확인
    - scope 변경 실험 (RG → 개별 리소스)

### Section 05 — [실습] Gallery: Identity 기반 인프라
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab06~08 완료
- **내용**:
  - Gallery 전용 Resource Group 생성 (`azure-iac-gallery-{env}-platform-rg-main`)
  - Gallery용 User Assigned Managed Identity 생성
  - MI에 필요한 RBAC 역할 할당 (Contributor → 이후 챕터에서 세분화)
  - 태그 전략 적용 (project: azure-iac, app: gallery, env: dev)
  - 이 RG와 MI가 이후 모든 Gallery 챕터의 기반
- **예제 파일**: `03 리소스 계층과 Identity/05 [실습] Gallery - Identity 기반 인프라/` 하위

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/03.01.claude.notion.md` |
| 02 | `.claude/draft/03.02.claude.notion.md` |
| 03 | `.claude/draft/03.03.claude.notion.md` |
| 04 | `.claude/draft/03.04.claude.notion.md` |
| 05 Gallery | `.claude/draft/03.05.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획수립 |
| 02 | 계획수립 |
| 03 | 계획수립 |
| 04 | 계획수립 |
| 05 Gallery | 계획수립 |
