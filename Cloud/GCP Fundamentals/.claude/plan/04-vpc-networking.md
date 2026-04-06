# Chapter 04 — VPC & 네트워크 보안

## 목표

GCP 네트워킹의 핵심 구조를 이해하고 직접 구성한다.
Global VPC 개념부터 Firewall Rules(Tag 기반), Private VM 격리, Cloud NAT, Private Google Access까지 쌓은 후
Gallery 앱을 Custom VPC로 이전해 외부 접속이 막히는 구조를 만든다.
이 상태가 Ch05 Traffic Management의 출발점이 된다.

---

## AWS / Azure 대응 관계

| GCP | AWS | Azure |
|-----|-----|-------|
| VPC (Global) | VPC (Regional) | VNet (Regional) |
| Subnet (Regional) | Subnet (AZ) | Subnet |
| Firewall Rule (Tag/SA 기반) | Security Group + Network ACL | NSG (Subnet/NIC 레벨) |
| External IP | Elastic IP | Public IP |
| Cloud NAT | NAT Gateway | NAT Gateway |
| Private Google Access | VPC Endpoint (Gateway) | Service Endpoint |
| (암묵적 IGW 없음, 라우팅 자동) | Internet Gateway | (암묵적 처리) |
| VPC Flow Logs | VPC Flow Logs | NSG Flow Logs |

---

## Section 구성

### Section 01 — GCP VPC 특성
- **유형**: 이론
- **내용**:
  - GCP VPC는 Global 리소스 — AWS/Azure와의 결정적 차이
  - Subnet은 Regional: 하나의 VPC에 여러 Region Subnet 공존
  - Auto Mode vs Custom Mode VPC
  - 기본 VPC(Default VPC) 구조 및 주의사항
  - 시스템 라우팅 자동 생성 원리
- **Lab**: 없음

### Section 02 — Subnet 설계
- **유형**: 이론 + 실습
- **내용**:
  - Subnet CIDR 설계 (Primary / Secondary Range)
  - Private Google Access 옵션 (Subnet 레벨 설정)
  - Flow Logs 활성화 옵션
- **Lab**:
  - `[실습] lab08: VPC & Subnet 생성`
    - Custom Mode VPC 생성 (gcp-fund-lab-vpc, 10.10.0.0/16)
    - Public Subnet (10.10.1.0/24, us-central1)
    - Private Subnet (10.10.2.0/24, us-central1) — Private Google Access 활성화
    - 라우팅 테이블 자동 생성 확인

### Section 03 — Firewall Rules
- **유형**: 이론 + 실습
- **내용**:
  - Firewall Rule 개념: VPC 레벨, Stateful 필터링
  - Network Tag 기반 규칙 — 태그가 붙은 VM에만 적용
  - Service Account 기반 규칙 — SA 단위 세밀한 제어
  - Ingress / Egress 규칙 구조 (우선순위, 프로토콜, 포트, 소스/대상)
  - AWS Security Group / Azure NSG와의 비교
- **Lab**:
  - `[실습] lab09: Firewall Rules 생성 및 트래픽 제어`
    - Ingress 규칙 생성 (allow-ssh: TCP 22, target tag: allow-ssh)
    - Ingress 규칙 생성 (allow-http: TCP 8080, target tag: allow-http)
    - VM에 Network Tag 부여 후 트래픽 허용/차단 확인
    - Egress 기본 허용 정책 확인

### Section 04 — Private VM & IAP Tunnel
- **유형**: 이론 + 실습
- **내용**:
  - Private VM 개념 (External IP 없음)
  - External IP 없는 VM의 인터넷 인바운드 차단 원리
  - IAP Tunnel로 Private VM 접속 — 방화벽/NAT 불필요
  - IAP 동작 원리: Google 인증 → TCP Tunnel → VM SSH
- **Lab**:
  - `[실습] lab10: Private VM 생성 및 IAP 접속 확인`
    - Private Subnet에 VM 생성 (External IP 없음)
    - IAP Firewall Rule 생성 (35.235.240.0/20 허용)
    - IAP Tunnel로 SSH 접속 확인
    - 외부 인터넷 아웃바운드 불가 확인 (curl google.com 실패)

### Section 05 — Cloud NAT
- **유형**: 이론 + 실습
- **내용**:
  - Cloud NAT 개념: Private VM의 아웃바운드 전용 인터넷 연결
  - Cloud Router와의 연동 구조
  - NAT IP 할당 방식 (자동 / 수동)
  - 인바운드 연결 불가 원칙
- **Lab**:
  - `[실습] lab11: Cloud NAT 설정`
    - Cloud Router 생성 (us-central1)
    - Cloud NAT 생성, Private Subnet 연결
    - Private VM에서 아웃바운드 확인 (패키지 설치, curl 성공)
    - 인바운드 접속 여전히 불가 확인

### Section 06 — Private Google Access
- **유형**: 이론
- **내용**:
  - Private Google Access 개념: External IP 없이 Google API 접근
  - 활성화 방법 (Subnet 레벨 설정)
  - Cloud Storage, Cloud SQL Auth Proxy 등 활용 시나리오
  - AWS VPC Gateway Endpoint / Azure Service Endpoint와의 비교
  - 실습은 Ch07(Cloud Storage), Ch08(Cloud SQL)에서 수행
- **Lab**: 없음

### Section 07 — 네트워크 흐름 정리
- **유형**: 이론
- **내용**:
  - Ch04에서 구성한 전체 네트워크 구조 시각화
  - 트래픽 경로별 흐름 정리 (인바운드 Public, Private IAP, 아웃바운드 NAT)
  - Ch05로 이어지는 맥락: "외부 인바운드 해결 = Load Balancer"
- **Lab**: 없음

### Section 08 — [실습] Gallery: Custom VPC 이전
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab08~11 완료 (VPC + Firewall + Private VM + Cloud NAT)
- **내용**:
  - Ch03 Gallery (External IP 직접 노출 VM) → Custom VPC로 이전
  - Gallery 전용 VPC / Public + Private Subnet 구성
  - Gallery VM → Private Subnet 배치
  - Cloud NAT로 아웃바운드 열어 Gallery 설치 및 실행
  - IAP Tunnel로 접속 확인 / 외부 접속 불가 상태로 마무리
  - **브릿지 포인트**: "외부에서 어떻게 접근하지?" → Ch05 Load Balancer
- **예제 파일**: `04 VPC & 네트워크 보안/08 [실습] Gallery - Custom VPC 이전/` 하위

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/04.01.claude.notion.md` |
| 02 | `.claude/draft/04.02.claude.notion.md` |
| 03 | `.claude/draft/04.03.claude.notion.md` |
| 04 | `.claude/draft/04.04.claude.notion.md` |
| 05 | `.claude/draft/04.05.claude.notion.md` |
| 06 | `.claude/draft/04.06.claude.notion.md` |
| 07 | `.claude/draft/04.07.claude.notion.md` |
| 08 Gallery | `.claude/draft/04.08.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획확정 |
| 02 | 계획확정 |
| 03 | 계획확정 |
| 04 | 계획확정 |
| 05 | 계획확정 |
| 06 | 계획확정 |
| 07 | 계획확정 |
| 08 Gallery | 계획확정 |
