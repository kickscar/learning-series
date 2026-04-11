# Chapter 09 — 컨테이너

## 목표

Azure Container Registry(ACR)와 Container Apps를 Terraform으로 구현한다.
VM 기반 Gallery를 Container Apps로 전환하여 컨테이너 기반 배포 패턴을 완성한다.

---

## Azure Fundamentals 대응

| 이 시리즈 (Terraform) | Azure Fundamentals (콘솔) |
|-----------------------|--------------------------|
| Sec 01: ACR | Ch08 Sec02: ACR 이미지 빌드와 푸시 |
| Sec 02: Container Apps 배포 | Ch08 Sec03: Container Apps 배포 |
| Sec 03: Container Apps 네트워킹·시크릿 | (Fundamentals 미다룸 — IaC 추가) |
| Gallery | Ch08 Sec04: Gallery Container Apps 배포 |

---

## Section 구성

### Section 01 — ACR — 이미지 레지스트리
- **유형**: 이론 + 실습
- **내용**:
  - `azurerm_container_registry` — SKU (Basic, Standard, Premium)
  - ACR 이름 제약: 전역 고유, 영숫자만, 5~50자
  - 인증 방식: Admin 계정 vs Managed Identity (MI 권장)
  - MI 기반 ACR Pull: `AcrPull` 역할 할당
  - ACR Tasks 개요 (Cloud 빌드 — 로컬 Docker 불필요)
  - Terraform에서 ACR 생성 후 이미지 빌드/푸시는 CLI로 수행 (하이브리드 워크플로우)
- **Lab**:
  - `[실습] lab27: ACR 생성 및 이미지 빌드`
    - ACR 생성 (Basic SKU)
    - `az acr build`로 이미지 빌드/푸시 (또는 로컬 Docker)
    - `az acr repository list`로 이미지 확인
    - MI에 AcrPull 역할 할당

### Section 02 — Container Apps 배포
- **유형**: 이론 + 실습
- **내용**:
  - `azurerm_container_app_environment` — Container Apps 실행 환경
  - `azurerm_container_app` — 컨테이너 앱 정의
  - `template` 블록: container, revision_suffix
  - `ingress` 블록: external, target_port, transport
  - `registry` 블록: ACR 연결, MI 기반 인증
  - Revision 관리: `revision_mode` (Single, Multiple)
- **Lab**:
  - `[실습] lab28: Container Apps 배포`
    - Container Apps Environment 생성
    - ACR 이미지 기반 Container App 배포
    - Ingress 설정 (외부 공개, 포트 8080)
    - 배포 URL 접근 확인
    - `az containerapp show`로 확인

### Section 03 — Container Apps 네트워킹과 시크릿
- **유형**: 이론 + 실습
- **내용**:
  - VNet 통합: `azurerm_container_app_environment` + `infrastructure_subnet_id`
  - Container Apps에서 VNet 내부 리소스 접근 (MySQL, Storage)
  - 시크릿 관리:
    - `secret` 블록: 직접 값 주입
    - Key Vault 참조: `key_vault_secret_id` + MI 인증
  - 환경 변수: `env` 블록 — `value` vs `secret_name` 참조
  - 스케일링 규칙: `min_replicas`, `max_replicas`, HTTP 기반
- **Lab**:
  - `[실습] lab29: Container Apps VNet·시크릿 통합`
    - Container Apps Environment VNet 통합
    - Key Vault Secret을 Container App에 주입
    - 환경 변수로 DB 연결 문자열 전달
    - `az containerapp show --query properties.configuration`로 확인

### Section 04 — [실습] Gallery: Gallery Container 전환
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab27~29 완료, Ch08 Gallery 데이터 계층 완료
- **내용**:
  - Gallery Docker 이미지 빌드 → ACR 푸시
  - Container Apps Environment 생성 (Gallery VNet 통합)
  - Gallery Container App 배포:
    - ACR 이미지 참조 (MI 기반 Pull)
    - 환경 변수: Blob Storage 연결, MySQL 연결 (Key Vault 참조)
    - Ingress: 외부 공개, 포트 8080
  - Gallery 앱 외부 URL 접근 확인
  - VM 기반 VMSS 리소스 정리 (Container Apps로 대체)
  - container 모듈 추가: Ch07 구조에 `modules/container/` 추가
  - **VM → Container 전환 완료**
- **예제 파일**: `09 컨테이너/04 [실습] Gallery - Gallery Container 전환/` 하위

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
| 01 | 계획수립 |
| 02 | 계획수립 |
| 03 | 계획수립 |
| 04 Gallery | 계획수립 |
