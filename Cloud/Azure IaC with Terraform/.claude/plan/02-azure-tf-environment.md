# Chapter 02 — Azure Terraform 환경 구성

## 목표

azurerm Provider 구성, Service Principal 인증, Remote State 설정으로
이후 모든 챕터의 기반이 되는 Terraform 환경을 구축한다.
네이밍 규칙을 정의하여 Ch03부터 일관된 리소스 이름을 적용할 수 있게 한다.

---

## Terraform Core 대응

| 이 시리즈 | Terraform Core |
|----------|---------------|
| Sec 01: azurerm Provider | Ch02 Sec02: provider 블록 |
| Sec 03: Remote State | Ch04 Sec03: Remote Backend |

> Terraform Core에서 provider, backend의 **메커니즘**을 배웠다면, 여기서는 **Azure 환경 특화 설정**에 집중한다.

---

## Section 구성

### Section 01 — azurerm Provider 구성
- **유형**: 이론 + 실습
- **내용**:
  - `required_providers` 블록과 버전 제약 (`~>`)
  - `features {}` 블록 — Azure 특화 설정 (필수 블록)
  - `provider "azurerm"` 블록 구조
  - Terraform Core에서 배운 provider 개념의 Azure 적용
- **Lab**:
  - `[실습] lab03: azurerm Provider 구성`
    - `terraform {}` + `provider "azurerm"` 작성
    - `terraform init`으로 provider 다운로드
    - `.terraform.lock.hcl` 확인
    - 간단한 `azurerm_resource_group` 생성으로 연결 확인

### Section 02 — 인증 — Service Principal
- **유형**: 이론 + 실습
- **내용**:
  - Azure에서 SP가 필요한 이유 (콘솔 ≠ 코드 인증)
  - `az ad sp create-for-rbac` — SP 생성 (CLI)
  - 환경변수 방식: `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_SUBSCRIPTION_ID`, `ARM_TENANT_ID`
  - provider 블록 직접 지정 vs 환경변수 방식 비교
  - 보안 주의: `.tfvars`에 secret 넣지 않기
  - Ch10에서 OIDC(Workload Identity Federation)로 진화 예고
- **Lab**:
  - `[실습] lab04: Service Principal 생성 및 인증`
    - `az ad sp create-for-rbac --role Contributor --scopes /subscriptions/{id}`
    - 환경변수 설정 (export ARM_*)
    - `terraform plan`으로 인증 성공 확인
    - `.env` 파일 관리 + `.gitignore` 설정

### Section 03 — Remote State — Azure Storage Backend
- **유형**: 이론 + 실습
- **내용**:
  - Azure Storage Account를 Terraform backend로 사용
  - Storage Account + Container 생성 (az CLI — Terraform 아닌 CLI로)
  - `backend "azurerm"` 블록 설정
  - State Lock — Blob Lease 기반 동시 접근 제어
  - `terraform init -migrate-state`
  - 왜 backend 자체는 Terraform이 아닌 CLI로 생성하는가
- **Lab**:
  - `[실습] lab05: Azure Storage Backend 설정`
    - `az storage account create` + `az storage container create`
    - `backend "azurerm"` 블록 작성
    - `terraform init -migrate-state`로 로컬 → 리모트 이전
    - `az storage blob list`로 state 파일 확인

### Section 04 — Azure CAF 네이밍 컨벤션
- **유형**: 이론
- **내용**:
  - AWS 사례와의 비교: AWS는 RG 개념이 없어 커스텀 네이밍(`{project}-{env}-{layer}-{capability}-{role}`)이 필수 → Azure는 Resource Group이 네임스페이스 경계 역할
  - Azure CAF 네이밍 컨벤션 소개: `{type}-{role}` 패턴, RG 스코프 활용
  - RG 레벨 네이밍: `rg-{project}-{context}`
  - 리소스 레벨 네이밍: `{type}-{role}` (RG가 맥락을 담으므로 짧고 명확하게)
  - CAF 리소스 약어 테이블 참조
  - 핵심 메시지: Azure는 아키텍처까지 설계된 플랫폼이다 — CAF만 잘 따르면 구조화가 자연스럽게 된다
- **Lab**: 없음

---

## 네이밍 — Azure CAF 기반

### RG 레벨

```
rg-{project}-{context}
```

| 용도 | 예시 |
|------|------|
| Section Lab | `rg-azure-iac-lab04` |
| Gallery | `rg-azure-iac-gallery` |
| Gallery (환경 분리) | `rg-azure-iac-gallery-dev` |

### 리소스 레벨 (RG 내부)

```
{type}-{role}
```

| 예시 | 설명 |
|------|------|
| `vnet-base` | 기본 VNet |
| `subnet-web` | 웹 서브넷 |
| `nsg-vm-web` | vm-web에 연결된 NSG |
| `vm-web` | 웹 서버 VM |
| `agw-web` | 웹 트래픽용 Application Gateway |

### AWS 네이밍과의 비교

AWS는 Resource Group 개념이 없어 리소스 이름에 모든 맥락을 넣어야 한다:

```
{project}-{env}-{layer}-{capability}-{role}
aws-iac-dev-network-vpc-base
```

Azure는 RG가 네임스페이스 경계 역할을 하므로 내부 리소스는 짧고 명확하다:

```
rg-azure-iac-lab04     ← RG가 맥락을 담음
  vnet-base             ← 짧고 명확
  vm-web
```

**Azure는 아키텍처까지 설계된 플랫폼이다. CAF만 잘 따르면 구조화가 자연스럽게 된다.**

---

## 참고

- [Azure CAF — Resource abbreviations](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)

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
| 01 | 계획수립 |
| 02 | 계획수립 |
| 03 | 계획수립 |
| 04 | 계획수립 |
