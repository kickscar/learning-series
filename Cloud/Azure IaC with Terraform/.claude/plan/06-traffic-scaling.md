# Chapter 06 — 트래픽 관리와 스케일링

## 목표

Azure의 트래픽 관리 리소스(Load Balancer, Application Gateway)와
스케일링(VM Scale Set)을 Terraform으로 구현한다.
Gallery 앱에 LB + AGW + VMSS를 통합 구성하여 외부 접속을 해소하고 스케일링을 확보한다.

---

## Azure Fundamentals 대응

| 이 시리즈 (Terraform) | Azure Fundamentals (콘솔) |
|-----------------------|--------------------------|
| Sec 01: Load Balancer | Ch05 Sec01~02: LB 개요 + 구성 |
| Sec 02: Application Gateway | Ch05 Sec04: Application Gateway |
| Sec 03: VM Scale Set | Ch05 Sec07: VM Scale Set |
| Gallery (통합) | Ch05 Sec03 + Sec05 + Sec08: Gallery LB/AGW/VMSS (3개 Gallery) |

> Azure Fundamentals에서 3개 Gallery로 단계별 진화했던 것을 이 시리즈에서는 **하나의 Gallery**로 통합한다.
> 독자는 이미 LB → AGW → VMSS 진화를 콘솔로 경험했으므로, Terraform으로는 최종 형태를 한 번에 구성한다.

---

## Section 구성

### Section 01 — Azure Load Balancer
- **유형**: 이론 + 실습
- **내용**:
  - `azurerm_lb` — Standard SKU Public LB
  - `azurerm_lb_backend_address_pool` — Backend Pool
  - `azurerm_lb_probe` — Health Probe (TCP/HTTP)
  - `azurerm_lb_rule` — 부하 분산 규칙
  - `azurerm_public_ip` — LB용 Public IP (Standard SKU)
  - L4 로드밸런싱 특성과 한계
- **Lab**:
  - `[실습] lab17: Load Balancer 구성`
    - Public IP + Standard LB 생성
    - Backend Pool + Health Probe + LB Rule 설정
    - `az network lb show`로 전체 구조 확인

### Section 02 — Application Gateway
- **유형**: 이론 + 실습
- **내용**:
  - `azurerm_application_gateway` — L7 로드밸런서, 복잡한 구조
  - 필수 구성 요소: gateway_ip_configuration, frontend_ip_configuration, frontend_port, backend_address_pool, backend_http_settings, http_listener, request_routing_rule
  - 전용 Subnet 요구사항 (GatewaySubnet과 별도)
  - LB(L4)와의 비교: HTTP 라우팅, 경로 기반 라우팅
  - Terraform에서 AGW 관리의 복잡도 인정 — 구조 이해가 핵심
- **Lab**:
  - `[실습] lab18: Application Gateway`
    - AGW 전용 Subnet 생성
    - Application Gateway 생성 (기본 라우팅)
    - `az network application-gateway show`로 확인

### Section 03 — VM Scale Set
- **유형**: 이론 + 실습
- **내용**:
  - `azurerm_linux_virtual_machine_scale_set` — VMSS 리소스
  - 단일 VM과의 차이: instances, upgrade_policy, automatic_os_upgrade
  - custom_data 적용 (VM과 동일한 cloud-init)
  - Auto Scaling: `azurerm_monitor_autoscale_setting`
  - LB/AGW Backend Pool과 VMSS 연결
  - Zone 분산: `zones = ["1", "2", "3"]`
- **Lab**:
  - `[실습] lab19: VM Scale Set`
    - VMSS 생성 (2 instances, Zone 분산)
    - Auto Scaling 규칙 (CPU 기반)
    - LB Backend Pool 연결
    - `az vmss list-instances`로 확인

### Section 04 — [실습] Gallery: Gallery 트래픽 구성
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab17~19 완료, Ch05 Gallery VM 배포 완료
- **내용**:
  - Ch05 Gallery의 단일 VM을 VMSS로 전환
  - VMSS + Custom Data로 Gallery 앱 부트스트랩 (다중 인스턴스)
  - Application Gateway 구성 → VMSS Backend Pool 연결
  - AGW Public IP로 Gallery 앱 외부 접속 확인
  - Health Probe로 `/actuator/health` 체크
  - Auto Scaling 설정 (CPU 70% 기준)
  - 단일 VM 리소스 제거 (VMSS로 대체)
  - **결과**: Gallery 앱이 AGW + VMSS로 HA + 스케일링 구성 완료
- **예제 파일**: `06 트래픽 관리와 스케일링/04 [실습] Gallery - Gallery 트래픽 구성/` 하위

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/06.01.claude.notion.md` |
| 02 | `.claude/draft/06.02.claude.notion.md` |
| 03 | `.claude/draft/06.03.claude.notion.md` |
| 04 Gallery | `.claude/draft/06.04.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획수립 |
| 02 | 계획수립 |
| 03 | 계획수립 |
| 04 Gallery | 계획수립 |
