# DR Challenges — Backlog (응용 아키텍처)

> **소속**: Layer 3 — Cloud Infrastructure Architecture & Design (또는 부트캠프 challenge 트랙)
> **성격**: 씨앗 backlog. 상세 기획(시나리오·hands-on 단계·평가 루브릭)은 L3 시리즈 구조 확정 후 on-demand로 완성한다.
> **원칙**: 주제는 **클라우드 중립**으로 기술하고, 구현은 AWS/Azure/GCP 서비스로 매핑한다.

---

## 배경 — 왜 이 주제들이 여기 모이나

Fundamentals(각 클라우드)는 **단일 리전 hands-on baseline**이다. 리전 내 고가용성(Availability Zone 분산)까지가 baseline의 끝이다.

그 너머의 주제들 — 글로벌 트래픽 라우팅, 하이브리드 연결, 데이터 복제 — 은 **"단일 리전을 넘는 순간" 필요**하다는 공통점으로 하나의 클러스터를 이룬다: **멀티리전·하이브리드 복원력 (DR / HA at scale).**

```
Fundamentals :  단일 리전 baseline   ← AZ 고가용성까지 (DR 사다리 첫 칸)
────────────────────────────────────────────────
L3 / Challenge :  멀티리전·하이브리드 DR   ← 아래 challenge들
```

정준 참조 아키텍처로 보면: **baseline(단일리전) 아키텍처를 복원력으로 확장**한 것이 이 challenge들이다. 같은 아키텍처, 리전을 넘긴 버전.

**측정 프레임 (DR 검증):** 모든 challenge는 **RTO**(복구 목표 시간)와 **RPO**(허용 데이터 손실)로 성패를 측정한다.

> 서비스 명칭·기능은 변하므로, 풀 기획 시 researcher로 현행 확인한다.

---

## Challenge 1 — 글로벌 트래픽 라우팅 & Failover

**목표**: 두 개 이상 리전에 같은 앱을 배포하고, 글로벌 라우팅으로 한 리전 장애 시 무중단 전환(또는 최근접 라우팅)을 구성한다.

| 역할 | AWS | Azure | GCP |
|------|-----|-------|-----|
| DNS 기반 글로벌 라우팅 | Route 53 (failover/latency/geo) | Traffic Manager | Cloud DNS |
| 글로벌 L7 / 엣지 | CloudFront | Front Door | Cloud CDN + Global External LB |
| Anycast 가속 | Global Accelerator | Front Door | Global External LB |

**시나리오**: 리전 A(primary)·리전 B(secondary)에 앱 배포 → 글로벌 라우터에 health check 등록 → 리전 A 강제 중단 → 트래픽이 B로 전환되는 시간(**RTO**) 측정.

---

## Challenge 2 — 하이브리드 / 크로스 네트워크 연결

**목표**: 온프레미스(또는 다른 VNet/VPC)를 클라우드 네트워크에 사설로 연결하고, 연결 장애 시 동작을 확인한다.

| 역할 | AWS | Azure | GCP |
|------|-----|-------|-----|
| Site-to-Site VPN (IPsec) | Site-to-Site VPN | VPN Gateway | Cloud VPN |
| 전용 회선 (Dedicated) | Direct Connect | ExpressRoute | Cloud Interconnect |

**시나리오**: 온프렘(또는 별도 VPC/VNet)을 VPN으로 연결 → 사설 IP로 워크로드 접근 확인 → 터널 이중화(redundant tunnel)로 한쪽 끊었을 때 무중단 확인.

---

## Challenge 3 — 데이터 복제 & DB Failover

**목표**: 리전 간 DB 복제를 구성하고, primary 장애 시 failover하여 데이터 손실(**RPO**)과 복구 시간(**RTO**)을 측정한다.

| 역할 | AWS | Azure | GCP |
|------|-----|-------|-----|
| 리전 내 HA | RDS Multi-AZ | Zone-redundant HA | Cloud SQL HA (regional) |
| 크로스 리전 읽기 복제 | RDS Read Replica (cross-region) | Read replica | Cross-region read replica |
| 글로벌 DB | Aurora Global Database | geo-replication | (제품별) |

**시나리오**: primary 리전 DB + secondary 리전 replica 구성 → primary 장애 유발 → replica 승격(promote) → 승격까지 시간(**RTO**)·복제 지연으로 인한 손실(**RPO**) 측정.

---

## 지원 개념 (challenge에 얹히는 토대)

- **Region Pair / 리전 간 배치** — 어느 두 리전을 짝지을지 (지연·규정·페어링).
- **백업 geo-redundancy** — 백업을 다른 지리로 복제.
- **(L3 상위 연계)** Chaos Engineering(blast radius 설계) · DevSecOps · Load Testing · **DR 검증(RTO/RPO 시나리오)** — Cloud README의 L3 스코프.

---

## 상태

씨앗 backlog. 각 challenge를 **시나리오 + hands-on 단계 + RTO/RPO 목표 + 평가 루브릭**으로 완성하는 것은 L3 시리즈(또는 부트캠프 트랙) 구조가 잡힌 뒤 요청 시 진행한다.
