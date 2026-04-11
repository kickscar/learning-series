# Chapter 10 — CI/CD 파이프라인

## 목표

IaC 자동화의 핵심인 CI/CD 파이프라인을 GitHub Actions로 구현한다.
OIDC(Workload Identity Federation)를 통한 secretless 인증,
Plan on PR / Apply on Merge 워크플로우, 환경별 배포 파이프라인을 구축한다.
Gallery 인프라 전체를 CI/CD로 자동화한다.

---

## 핵심 메시지

- CI/CD는 IaC의 자동화 축이다 — 코드화(Terraform)만으로는 절반이다
- Plan과 Apply의 분리: PR에서 리뷰 가능한 plan, merge 시 안전한 apply
- OIDC(Workload Identity Federation): 시크릿을 GitHub에 저장하지 않는 현재 best practice
- 파이프라인 **설계 전략**(멀티 환경 브랜치 전략, 보안 게이트 설계)은 Architecture & Design 담당
- 이 시리즈에서는 **구현**에 집중한다

---

## Section 구성

### Section 01 — IaC 자동화 개요
- **유형**: 이론
- **내용**:
  - IaC 자동화의 필요성: 수동 apply의 위험 (drift, 실수, 감사 불가)
  - CI/CD 기본 흐름: commit → plan → review → approve → apply
  - Plan과 Apply 분리의 중요성
  - 인증 방식 진화: SP(client_secret) → SP(certificate) → OIDC(secretless)
  - GitHub Actions vs Azure DevOps: 이 시리즈에서는 GitHub Actions 중심
  - Azure DevOps는 개요 수준으로 언급 (Azure 네이티브 CI/CD)
- **Lab**: 없음

### Section 02 — GitHub Actions + OIDC 인증
- **유형**: 이론 + 실습
- **내용**:
  - Workload Identity Federation 개념:
    - GitHub OIDC Provider → Azure Entra ID → Federated Credential
    - 시크릿 없이 GitHub Actions에서 Azure 인증
  - Terraform 설정:
    - `azurerm_user_assigned_identity` — CI/CD용 MI
    - Federated Credential 설정 (GitHub org/repo/branch 기반)
    - RBAC 역할 할당 (Contributor on Subscription)
  - GitHub Actions 워크플로우 기초:
    - `azure/login@v2` — OIDC 로그인
    - `hashicorp/setup-terraform@v3`
    - `permissions: id-token: write`
- **Lab**:
  - `[실습] lab30: GitHub Actions + OIDC 인증`
    - Terraform으로 OIDC용 MI + Federated Credential 생성
    - GitHub Repository에 환경 변수 설정 (ARM_CLIENT_ID, ARM_SUBSCRIPTION_ID, ARM_TENANT_ID)
    - 기본 워크플로우 작성: login → terraform init → terraform plan
    - Push 후 Actions 탭에서 성공 확인

### Section 03 — Plan on PR, Apply on Merge
- **유형**: 이론 + 실습
- **내용**:
  - PR 워크플로우:
    - `on: pull_request` → `terraform plan` 실행
    - Plan 결과를 PR 코멘트로 게시 (`actions/github-script`)
    - 리뷰어가 plan 결과 확인 후 approve
  - Merge 워크플로우:
    - `on: push (branches: main)` → `terraform apply -auto-approve`
    - Plan 결과를 artifact로 저장 → apply 시 동일 plan 사용
  - 안전장치:
    - `terraform plan -out=tfplan` → `terraform apply tfplan` (plan 고정)
    - concurrency group으로 동시 실행 방지
    - environment protection rules (승인 게이트)
- **Lab**:
  - `[실습] lab31: Plan on PR, Apply on Merge`
    - PR 워크플로우 작성 (plan + 코멘트)
    - Merge 워크플로우 작성 (apply)
    - 실제 PR 생성 → plan 코멘트 확인 → merge → apply 확인
    - 간단한 리소스 변경으로 전체 흐름 검증

### Section 04 — 환경별 배포 파이프라인
- **유형**: 이론 + 실습
- **내용**:
  - 환경별 분기:
    - GitHub Environments (dev, prod) 활용
    - Environment secrets & variables
    - 환경별 backend key 분리 (Ch07에서 설정한 구조 활용)
  - 승인 게이트:
    - `environment: prod` → required reviewers
    - dev는 자동, prod는 승인 후 apply
  - 파이프라인 구조:
    ```
    PR → plan (dev) + plan (prod)
    merge → apply (dev, auto) → apply (prod, approval required)
    ```
  - Matrix 전략으로 환경 병렬 실행
- **Lab**:
  - `[실습] lab32: 환경별 배포 파이프라인`
    - GitHub Environments 설정 (dev, prod)
    - 환경별 워크플로우 작성 (matrix strategy)
    - prod environment에 required reviewer 설정
    - dev apply 자동 → prod apply 승인 확인

### Section 05 — [실습] Gallery: Gallery 자동 배포
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab30~32 완료, Ch09 Gallery Container 전환 완료
- **내용**:
  - Gallery 인프라 전체를 CI/CD 파이프라인으로 관리:
    1. OIDC용 MI + Federated Credential (이미 lab30에서 생성)
    2. PR 워크플로우: Gallery 인프라 plan + 코멘트
    3. Merge 워크플로우: dev 자동 apply → prod 승인 apply
    4. 환경별 backend 분리 (dev/prod state)
  - 인프라 변경 시나리오 시연:
    - Container App 스케일링 변경 → PR → plan 확인 → merge → apply
  - 전체 시리즈 최종 아키텍처 정리:
    - Identity (Ch03) + Network (Ch04) + Compute→Container (Ch05~06→Ch09)
    - Data (Ch08) + Structure (Ch07) + CI/CD (Ch10)
  - **시리즈 완결**: Gallery 인프라가 코드화 + 구조화 + 자동화된 상태
- **예제 파일**: `10 CI-CD 파이프라인/05 [실습] Gallery - Gallery 자동 배포/` 하위

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/10.01.claude.notion.md` |
| 02 | `.claude/draft/10.02.claude.notion.md` |
| 03 | `.claude/draft/10.03.claude.notion.md` |
| 04 | `.claude/draft/10.04.claude.notion.md` |
| 05 Gallery | `.claude/draft/10.05.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획수립 |
| 02 | 계획수립 |
| 03 | 계획수립 |
| 04 | 계획수립 |
| 05 Gallery | 계획수립 |
