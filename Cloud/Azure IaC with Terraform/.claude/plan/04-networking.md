# Chapter 04 — 네트워킹

## 목표

Azure 네트워킹 핵심 구조를 Terraform으로 구현한다.
Azure Fundamentals에서 콘솔로 구성했던 VNet, Subnet, NSG, NAT Gateway를 코드화하고,
Fundamentals에서 이론으로만 다뤘던 Private Endpoint와 Private DNS Zone을 실습으로 구현한다.
Gallery 앱을 Private Subnet + NAT Gateway 구조로 배치한다.

---

## Azure Fundamentals 대응

| 이 시리즈 (Terraform) | Azure Fundamentals (콘솔) |
|-----------------------|--------------------------|
| Sec 01: VNet/Subnet | Ch04 Sec01: VNet과 Subnet 주소 공간 설계 |
| Sec 02: NSG | Ch04 Sec03: NSG 트래픽 제어 |
| Sec 03: NAT Gateway | Ch04 Sec05: NAT Gateway |
| Sec 04: Private Endpoint | Ch04 Sec06: Service/Private Endpoint (이론만) → **여기서 실습** |
| Sec 05: Private DNS Zone | (Fundamentals 미다룸 — IaC 추가) |
| Gallery | Ch04 Sec08: Gallery Custom VNet 이전 |

---

## Section 구성

### Section 01 — VNet과 Subnet 구성
- **유형**: 이론 + 실습
- **내용**:
  - `azurerm_virtual_network` — address_space 설계
  - `azurerm_subnet` — 서브넷 분리 전략
  - Terraform에서 Subnet을 VNet 내부 블록 vs 별도 리소스로 관리하는 차이
  - 네이밍 규칙 적용: `{project}-{env}-network-vnet-{role}`
- **Lab**:
  - `[실습] lab09: VNet & Subnet 생성`
    - VNet 생성 (10.0.0.0/16)
    - Public Subnet (10.0.1.0/24), Private Subnet (10.0.2.0/24) 생성
    - `az network vnet show`, `az network vnet subnet list`로 확인

### Section 02 — NSG — 트래픽 제어
- **유형**: 이론 + 실습
- **내용**:
  - `azurerm_network_security_group` — 규칙 구조
  - `azurerm_network_security_rule` — 별도 리소스 vs 인라인 security_rule
  - `azurerm_subnet_network_security_group_association` — Subnet 연결
  - 우선순위(priority) 설계 패턴
- **Lab**:
  - `[실습] lab10: NSG 생성 및 트래픽 제어`
    - NSG 생성, SSH(22) + HTTP(8080) 인바운드 규칙
    - Subnet 연결
    - `az network nsg show`로 확인

### Section 03 — NAT Gateway
- **유형**: 이론 + 실습
- **내용**:
  - `azurerm_nat_gateway` — Private Subnet 아웃바운드 전용
  - `azurerm_public_ip` — NAT Gateway용 Public IP
  - `azurerm_nat_gateway_public_ip_association`
  - `azurerm_subnet_nat_gateway_association`
- **Lab**:
  - `[실습] lab11: NAT Gateway 설정`
    - NAT Gateway 생성 + Public IP 연결
    - Private Subnet에 NAT Gateway 연결
    - `az network nat gateway show`로 확인

### Section 04 — Private Endpoint
- **유형**: 이론 + 실습
- **내용**:
  - Private Endpoint 개념: PaaS 서비스를 VNet 내 Private IP로 노출
  - `azurerm_private_endpoint` — 구조와 설정
  - `private_service_connection` 블록
  - Service Endpoint와의 비교 (언급 수준)
  - Ch08(Storage, MySQL)에서 실제 서비스 연결 시 재활용
- **Lab**:
  - `[실습] lab12: Private Endpoint 연결`
    - 테스트용 Storage Account 생성
    - Private Endpoint 생성 → Storage에 연결
    - Private IP 할당 확인
    - `az network private-endpoint show`로 확인

### Section 05 — Private DNS Zone
- **유형**: 이론 + 실습
- **내용**:
  - Private DNS Zone 필요성: Private Endpoint IP를 FQDN으로 해석
  - `azurerm_private_dns_zone` — 생성
  - `azurerm_private_dns_zone_virtual_network_link` — VNet 연결
  - `azurerm_private_dns_a_record` — A 레코드 등록
  - Private Endpoint + Private DNS Zone 통합 패턴
- **Lab**:
  - `[실습] lab13: Private DNS Zone 생성`
    - Private DNS Zone 생성 (`privatelink.blob.core.windows.net`)
    - VNet 연결
    - lab12의 Private Endpoint와 DNS 연동
    - `az network private-dns zone show`로 확인

### Section 06 — [실습] Gallery: Gallery VNet 구성
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab09~13 완료
- **내용**:
  - Gallery 전용 VNet 구성 (Ch03 Gallery RG 활용)
  - Public Subnet + Private Subnet + NSG 설정
  - NAT Gateway로 Private Subnet 아웃바운드 확보
  - 이 시점에서 Gallery VM은 아직 없음 — 네트워크 뼈대만 구성
  - **브릿지 포인트**: Ch05에서 이 VNet 위에 VM을 배포
- **예제 파일**: `04 네트워킹/06 [실습] Gallery - Gallery VNet 구성/` 하위

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/04.01.claude.notion.md` |
| 02 | `.claude/draft/04.02.claude.notion.md` |
| 03 | `.claude/draft/04.03.claude.notion.md` |
| 04 | `.claude/draft/04.04.claude.notion.md` |
| 05 | `.claude/draft/04.05.claude.notion.md` |
| 06 Gallery | `.claude/draft/04.06.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획수립 |
| 02 | 계획수립 |
| 03 | 계획수립 |
| 04 | 계획수립 |
| 05 | 계획수립 |
| 06 Gallery | 계획수립 |
