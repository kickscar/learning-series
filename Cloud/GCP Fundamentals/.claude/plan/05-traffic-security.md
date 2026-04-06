# Chapter 05 — Traffic Management & 보안

## 목표

GCP의 부하 분산, DNS, WAF, CDN, 고가용성 구성을 단계별로 이해하고 실습한다.
Gallery 앱이 LB → DNS+Armor → CDN → MIG 순으로 인프라를 진화시키며
각 단계에서 무엇이 달라지는지 직접 확인한다.

---

## AWS / Azure 대응 관계

| GCP | AWS | Azure |
|-----|-----|-------|
| HTTP(S) Load Balancer (Global) | ALB (Application Load Balancer) | Application Gateway |
| Network Load Balancer | NLB (Network Load Balancer) | Azure Load Balancer |
| Backend Service + URL Map | Target Group + Listener Rule | Backend Pool + Routing Rule |
| Health Check | Target Group Health Check | Health Probe |
| Cloud DNS | Route 53 | Azure DNS |
| 관리형 SSL 인증서 | ACM (AWS Certificate Manager) | App Service Certificate |
| Cloud Armor | AWS WAF + AWS Shield | Azure WAF (Front Door) |
| Cloud CDN | CloudFront | Azure CDN |
| Managed Instance Group (MIG) | Auto Scaling Group | VM Scale Set |
| Instance Template | Launch Template | VM Image |

---

## Section 구성

### Section 01 — Cloud Load Balancing 개요
- **유형**: 이론
- **내용**:
  - GCP Load Balancer 유형 분류
    - 범위: Global vs Regional
    - 방향: External vs Internal
    - 계층: L7 (HTTP/HTTPS) vs L4 (TCP/UDP)
  - HTTP(S) LB: Global Anycast 기반, Google 백본 네트워크 활용
  - 구성 요소: Frontend(Forwarding Rule) → URL Map → Backend Service → Instance Group
  - Health Check 동작 원리
  - AWS ALB/NLB, Azure AGW/LB와의 비교
- **Lab**: 없음

### Section 02 — HTTP(S) Load Balancer 구성
- **유형**: 이론 + 실습
- **내용**:
  - HTTP(S) LB 생성 흐름 (Console 기준)
  - Backend Service에 Instance Group 등록
  - HTTP Health Check 설정
  - URL Map 및 Forwarding Rule 설정
- **Lab**:
  - `[실습] lab12: HTTP(S) Load Balancer 구성`
    - Unmanaged Instance Group 생성 (VM 2대 등록)
    - Backend Service 생성 (HTTP Health Check 포함)
    - HTTP(S) LB 생성 (URL Map, Forwarding Rule)
    - LB External IP로 접근 확인 및 트래픽 분산 동작 확인

### Section 03 — Cloud DNS & HTTPS
- **유형**: 이론 + 실습
- **내용**:
  - Cloud DNS 개념 (Public Zone / Private Zone)
  - DNS 레코드 유형 (A, CNAME, MX 등)
  - 관리형 SSL 인증서(Managed SSL Certificate) — 자동 프로비저닝
  - HTTPS 리디렉션 설정
- **Lab**:
  - `[실습] lab13: Cloud DNS 설정 및 HTTPS 적용`
    - Cloud DNS Public Zone 생성
    - A 레코드 → LB IP 연결
    - 관리형 SSL 인증서 생성 및 LB에 연결
    - HTTPS 리디렉션 규칙 추가
    - 도메인으로 HTTPS 접근 확인

### Section 04 — Cloud Armor
- **유형**: 이론 + 실습
- **내용**:
  - Cloud Armor 개념: HTTP(S) LB와 통합된 WAF + DDoS 보호
  - 보안 정책(Security Policy): 규칙 기반 트래픽 허용/차단
  - 사전 구성 규칙(Preconfigured Rules): OWASP Top 10 대응
  - IP 허용/차단 목록 설정
  - Adaptive Protection (DDoS 자동 감지) 개요
  - AWS WAF + Shield, Azure WAF와의 비교
- **Lab**:
  - `[실습] lab14: Cloud Armor 보안 정책 적용`
    - Cloud Armor Security Policy 생성
    - IP 차단 규칙 추가 (특정 IP 또는 IP 대역)
    - OWASP 사전 구성 규칙 활성화
    - Backend Service에 Security Policy 연결
    - 차단 동작 확인 (403 응답)

### Section 05 — [실습] Gallery: LB + DNS + Armor 적용
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab12, lab13, lab14 완료
- **내용**:
  - Ch04 Gallery (Custom VPC, 외부 접속 불가) → HTTP(S) LB 뒤로 이전
  - Gallery 전용 LB 생성, Backend Service에 Gallery VM 등록
  - Cloud DNS로 Gallery 도메인 연결 + HTTPS 적용
  - Cloud Armor Security Policy 연결
  - LB External IP → 도메인 + HTTPS로 Gallery 접근 확인
  - **리소스 그룹**: gcp-fund-gallery-* (Gallery 전용, 누적 관리)
- **예제 파일**: `05 Traffic Management & 보안/05 [실습] Gallery - LB + DNS + Armor 적용/` 하위

### Section 06 — Cloud CDN
- **유형**: 이론 + 실습
- **내용**:
  - Cloud CDN 개념: HTTP(S) LB와 통합, Google 글로벌 엣지 캐시
  - 캐시 키(Cache Key) 설정 방식
  - 캐시 정책 (TTL, Cache-Control 헤더 연동)
  - 캐시 무효화(Cache Invalidation)
  - AWS CloudFront, Azure CDN과의 비교
- **Lab**:
  - `[실습] lab15: Cloud CDN 활성화 및 캐시 정책 설정`
    - Backend Service에 CDN 활성화
    - 정적 리소스 캐시 TTL 설정
    - 캐시 히트 확인 (응답 헤더 Age 확인)
    - 캐시 무효화 실행

### Section 07 — Managed Instance Group & Autoscaling
- **유형**: 이론 + 실습
- **내용**:
  - Managed Instance Group (MIG) 개념 및 구조
  - Instance Template — VM 스펙 정의 단위
  - Autoscaling 정책 (CPU 사용률, HTTP 부하 기반, 커스텀 메트릭)
  - MIG와 HTTP(S) LB 연동 구조
  - 롤링 업데이트 / 카나리 배포 개요
  - AWS Auto Scaling Group, Azure VMSS와의 비교
- **Lab**:
  - `[실습] lab16: Managed Instance Group 생성 및 자동 스케일링`
    - Instance Template 생성 (Startup Script 포함)
    - MIG 생성 (최소 2, 최대 5 인스턴스, us-central1)
    - CPU 기반 Autoscaling 정책 설정 (70% 임계값)
    - HTTP(S) LB Backend Service에 MIG 등록
    - 부하 발생 후 스케일 아웃 확인

### Section 08 — [실습] Gallery: MIG 전환
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab15, lab16 완료
- **내용**:
  - Gallery 단일 VM → MIG로 전환
  - Gallery 전용 Instance Template 생성 (Startup Script로 Gallery 자동 실행)
  - Gallery MIG 생성, LB Backend Service 교체
  - 자동 스케일링 동작 확인
  - **리소스**: gcp-fund-gallery-* (누적)
- **예제 파일**: `05 Traffic Management & 보안/08 [실습] Gallery - MIG 전환/` 하위

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/05.01.claude.notion.md` |
| 02 | `.claude/draft/05.02.claude.notion.md` |
| 03 | `.claude/draft/05.03.claude.notion.md` |
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
| 03 | 계획확정 |
| 04 | 계획확정 |
| 05 Gallery | 계획확정 |
| 06 | 계획확정 |
| 07 | 계획확정 |
| 08 Gallery | 계획확정 |
