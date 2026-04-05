# Chapter 05 — Traffic Management & High Availability

## 목표

Azure의 부하 분산, L7 라우팅, 고가용성 구성을 단계별로 이해하고 실습한다.
Gallery 앱이 LB → AGW → VMSS 순으로 인프라를 진화시키며
각 단계에서 무엇이 달라지는지 직접 확인한다.

---

## Section 구성

### Section 01 — Azure Load Balancer 개요
- **유형**: 이론
- **내용**:
  - Load Balancer 개념 및 동작 원리
  - L4 (Azure Load Balancer) vs L7 (Application Gateway) 비교
  - SKU 비교 (Basic vs Standard)
  - 구성 요소: Frontend IP, Backend Pool, Health Probe, Load Balancing Rule
  - AWS ELB와의 비교
- **Lab**: 없음

### Section 02 — Azure Load Balancer 구성
- **유형**: 이론 + 실습
- **내용**:
  - Public Load Balancer 생성 흐름
  - Backend Pool에 VM 등록
  - Health Probe 설정 (TCP, HTTP)
  - Load Balancing Rule 설정 (포트 매핑)
- **Lab**:
  - `[실습] lab12: Public Load Balancer 구성`
    - 전용 리소스 그룹 생성 (azure-fund-lab12-rg)
    - Standard Public Load Balancer 생성
    - VM 2대 생성 및 Backend Pool 등록
    - HTTP Health Probe 설정
    - Port 80 Load Balancing Rule 추가
    - LB Public IP로 접근 확인 및 분산 동작 확인

### Section 03 — [실습] Gallery: Load Balancer 이전
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab12 완료
- **내용**:
  - Ch04 Gallery (Custom VNet, 외부 접속 불가) → LB 뒤로 이전
  - Gallery 전용 Load Balancer 생성 (azure-fund-gallery-lb)
  - Gallery VM Backend Pool 등록, Health Probe 설정
  - LB Public IP로 Gallery 외부 접근 확인
  - **리소스 그룹**: azure-fund-gallery-rg (Gallery 전용, 누적 관리)
- **예제 파일**: `05 Traffic Management & High Availability/03 [실습] Gallery - Load Balancer 이전/` 하위

### Section 04 — Azure Application Gateway
- **유형**: 이론 + 실습
- **내용**:
  - Application Gateway 개념 (L7, HTTP/HTTPS 기반 라우팅)
  - 구성 요소: Listener, Routing Rule, Backend Pool, HTTP Settings
  - Path 기반 라우팅 / 호스트 기반 라우팅 개요
  - WAF(Web Application Firewall) 개요
- **Lab**:
  - `[실습] lab13: Application Gateway 기본 구성`
    - 전용 리소스 그룹 생성 (azure-fund-lab13-rg)
    - Application Gateway 생성 (Standard_v2)
    - Listener 설정 (HTTP 80)
    - Backend Pool에 VM 등록, Routing Rule 설정
    - Gateway IP로 접근 확인

### Section 05 — [실습] Gallery: Application Gateway 전환
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab13 완료
- **내용**:
  - Gallery 앞단을 LB(L4) → AGW(L7)로 교체
  - Gallery 전용 Application Gateway 생성
  - 기존 LB 제거, AGW Backend Pool에 Gallery VM 등록
  - HTTP 라우팅 규칙 설정
  - AGW IP로 Gallery 접근 확인
  - **리소스 그룹**: azure-fund-gallery-rg (누적)
- **예제 파일**: `05 Traffic Management & High Availability/05 [실습] Gallery - Application Gateway 전환/` 하위

### Section 06 — 고가용성 구성
- **유형**: 이론 + 실습
- **내용**:
  - Availability Zone vs Availability Set 비교
  - Zone 분산 배포 시 고려사항
  - Zone-redundant Load Balancer 개요
- **Lab**:
  - `[실습] lab14: Availability Zone VM 분산 배포`
    - 전용 리소스 그룹 생성 (azure-fund-lab14-rg)
    - Zone 1, Zone 2에 VM 각 1대 배포
    - Zone-redundant Standard Load Balancer에 등록
    - Zone 장애 시뮬레이션 (VM 중지) 후 트래픽 전환 확인

### Section 07 — VM Scale Set
- **유형**: 이론 + 실습
- **내용**:
  - VM Scale Set (VMSS) 개념 및 구조
  - 스케일링 정책 (수동, 자동 - CPU 기반)
  - VMSS와 Load Balancer 연동
  - AWS Auto Scaling Group과의 비교
- **Lab**:
  - `[실습] lab15: VM Scale Set 생성 및 자동 스케일링`
    - 전용 리소스 그룹 생성 (azure-fund-lab15-rg)
    - VMSS 생성 (최소 2, 최대 5 인스턴스)
    - CPU 기반 자동 스케일링 규칙 설정
    - Load Balancer 연동 확인
    - 부하 발생 후 스케일 아웃 확인

### Section 08 — [실습] Gallery: VM Scale Set 적용
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab14, lab15 완료
- **내용**:
  - Gallery 단일 VM → VMSS로 전환
  - Gallery 이미지 기반 VMSS 생성
  - AGW Backend Pool을 VM → VMSS로 교체
  - 자동 스케일링 동작 확인
  - **리소스 그룹**: azure-fund-gallery-rg (누적)
- **예제 파일**: `05 Traffic Management & High Availability/08 [실습] Gallery - VM Scale Set 적용/` 하위

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/05.01.claude.notion.md` |
| 02 | `.claude/draft/05.02.claude.notion.md` |
| 03 Gallery | `.claude/draft/05.03.claude.notion.md` |
| 04 | `.claude/draft/05.04.claude.notion.md` |
| 05 Gallery | `.claude/draft/05.05.claude.notion.md` |
| 06 | `.claude/draft/05.06.claude.notion.md` |
| 07 | `.claude/draft/05.07.claude.notion.md` |
| 08 Gallery | `.claude/draft/05.08.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획확정 |
| 02 | 계획확정 |
| 03 Gallery | 계획확정 |
| 04 | 계획확정 |
| 05 Gallery | 계획확정 |
| 06 | 계획확정 |
| 07 | 계획확정 |
| 08 Gallery | 계획확정 |
