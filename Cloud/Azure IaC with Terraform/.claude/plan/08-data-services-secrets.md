# Chapter 08 — 데이터 서비스와 시크릿

## 목표

Azure 데이터 서비스(Storage Account, MySQL Flexible Server)와
시크릿 관리(Key Vault)를 Terraform으로 구현한다.
Managed Identity를 통한 서비스 간 인증으로 시크릿 없는(secretless) 아키텍처를 구성한다.
Ch07에서 구조화한 Gallery 인프라에 데이터 계층을 추가한다.

---

## Azure Fundamentals 대응

| 이 시리즈 (Terraform) | Azure Fundamentals (콘솔) |
|-----------------------|--------------------------|
| Sec 01: Storage Account | Ch06 Sec02: Storage Account와 Blob Storage |
| Sec 02: MySQL | Ch07 Sec02~03: MySQL + VM 연결 |
| Sec 03: Key Vault | (Fundamentals 미다룸 — IaC 추가) |
| Sec 04: MI 연결 | (Fundamentals 미다룸 — IaC 추가) |
| Gallery | Ch06 Sec05 + Ch07 Sec04: Blob 연동 + MySQL 연동 |

---

## Section 구성

### Section 01 — Storage Account와 Blob Storage
- **유형**: 이론 + 실습
- **내용**:
  - `azurerm_storage_account` — account_tier, account_replication_type, account_kind
  - `azurerm_storage_container` — Blob Container (private access)
  - 네트워크 규칙: `network_rules` 블록 (default_action = Deny, VNet 허용)
  - Storage Account 이름 제약: 영소문자+숫자, 3~24자, 전역 고유
  - 네이밍 규칙 예외: Storage Account은 하이픈 불가 → capability 약어(`st`)로 축약
- **Lab**:
  - `[실습] lab23: Storage Account와 Blob Container`
    - Storage Account 생성 (LRS, StorageV2)
    - Blob Container 생성 (private)
    - 네트워크 규칙 설정 (VNet 허용)
    - `az storage account show`로 확인

### Section 02 — Azure Database for MySQL
- **유형**: 이론 + 실습
- **내용**:
  - `azurerm_mysql_flexible_server` — SKU, 스토리지, 버전
  - `azurerm_mysql_flexible_database` — 데이터베이스 생성
  - VNet 통합: `delegated_subnet_id` — 전용 Subnet 위임
  - Private DNS Zone 연동: `private_dns_zone_id`
  - 방화벽 규칙: `azurerm_mysql_flexible_server_firewall_rule`
  - 관리자 패스워드 처리: `sensitive = true`, Key Vault 연계 (Sec 03)
- **Lab**:
  - `[실습] lab24: MySQL Flexible Server`
    - 전용 Subnet 생성 (Microsoft.DBforMySQL/flexibleServers delegation)
    - Private DNS Zone 생성 (`privatelink.mysql.database.azure.com`)
    - MySQL Flexible Server 생성 (Burstable, B1ms)
    - 데이터베이스 생성
    - `az mysql flexible-server show`로 확인

### Section 03 — Key Vault — 시크릿 관리
- **유형**: 이론 + 실습
- **내용**:
  - `azurerm_key_vault` — SKU, 접근 정책, 네트워크 규칙
  - `azurerm_key_vault_secret` — 시크릿 저장
  - 접근 정책 모델: `access_policy` vs Azure RBAC (`enable_rbac_authorization`)
  - Terraform에서 Key Vault 시크릿 참조: `data "azurerm_key_vault_secret"`
  - DB 패스워드, 연결 문자열 등 민감 정보를 Key Vault로 관리
  - Key Vault 이름 제약: 전역 고유, 3~24자, 영숫자+하이픈
- **Lab**:
  - `[실습] lab25: Key Vault 시크릿 관리`
    - Key Vault 생성 (RBAC 모드)
    - MySQL 관리자 패스워드를 Secret으로 저장
    - `data` 블록으로 Secret 참조하여 MySQL에 전달
    - `az keyvault secret show`로 확인

### Section 04 — 서비스 간 연결 — Managed Identity
- **유형**: 이론 + 실습
- **내용**:
  - MI 기반 서비스 간 인증 패턴:
    - VM/VMSS → Storage Account (Blob 읽기/쓰기)
    - VM/VMSS → Key Vault (Secret 읽기)
    - Container Apps → Storage Account / MySQL (Ch09 연계)
  - RBAC 역할 할당:
    - `Storage Blob Data Contributor` — Blob 접근
    - `Key Vault Secrets User` — Secret 읽기
  - `azurerm_role_assignment` — MI principal_id에 역할 부여
  - secretless 아키텍처: 키/패스워드 대신 MI로 인증 → 보안 강화
- **Lab**:
  - `[실습] lab26: MI 기반 서비스 간 인증`
    - Ch03 Gallery MI에 Storage Blob Data Contributor 역할 할당
    - Ch03 Gallery MI에 Key Vault Secrets User 역할 할당
    - 역할 할당 확인: `az role assignment list --assignee <mi-principal-id>`

### Section 05 — [실습] Gallery: Gallery 데이터 계층
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab23~26 완료, Ch07 Gallery 구조화 완료
- **내용**:
  - Ch07 구조화된 Gallery 인프라에 data 모듈 추가:
    1. Storage Account + Blob Container (Gallery 이미지 저장)
    2. MySQL Flexible Server + Database (Gallery 데이터)
    3. Key Vault + Secrets (DB 패스워드, 연결 문자열)
    4. MI → Storage, Key Vault RBAC 역할 할당
  - Gallery 앱 환경 변수 업데이트:
    - `app.storage.type=azure-blob`
    - `spring.datasource.url` → MySQL Private 연결
  - VMSS Custom Data에 환경 변수 반영
  - Gallery 앱에서 Blob 업로드 + MySQL 데이터 저장 확인
  - **H2 → MySQL, Local → Blob 전환 완료**
- **예제 파일**: `08 데이터 서비스와 시크릿/05 [실습] Gallery - Gallery 데이터 계층/` 하위

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/08.01.claude.notion.md` |
| 02 | `.claude/draft/08.02.claude.notion.md` |
| 03 | `.claude/draft/08.03.claude.notion.md` |
| 04 | `.claude/draft/08.04.claude.notion.md` |
| 05 Gallery | `.claude/draft/08.05.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획수립 |
| 02 | 계획수립 |
| 03 | 계획수립 |
| 04 | 계획수립 |
| 05 Gallery | 계획수립 |
