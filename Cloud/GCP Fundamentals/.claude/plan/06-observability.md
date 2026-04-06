# Chapter 06 — Observability

## 목표

Cloud Monitoring과 Cloud Logging으로 GCP 리소스의 상태를 관찰하고 이상을 감지하는 구조를 구성한다.
Gallery 앱의 에러 엔드포인트를 활용해 실제 오류 시나리오에서 로그 수집, 대시보드, 알림까지 연결한다.

---

## AWS / Azure 대응 관계

| GCP | AWS | Azure |
|-----|-----|-------|
| Cloud Monitoring | CloudWatch Metrics | Azure Monitor |
| Cloud Logging | CloudWatch Logs | Log Analytics / Azure Monitor Logs |
| Log Explorer | CloudWatch Log Insights | Log Analytics Query |
| 로그 기반 메트릭 | CloudWatch Metric Filter | Log Analytics 커스텀 메트릭 |
| Uptime Check | Route 53 Health Check | Azure Monitor Availability Test |
| 알림 정책(Alerting Policy) | CloudWatch Alarm | Azure Monitor Alert |
| Notification Channel | SNS Topic | Action Group |

---

## Section 구성

### Section 01 — Cloud Monitoring 개요
- **유형**: 이론
- **내용**:
  - Cloud Monitoring 개념: 메트릭 수집, 대시보드, 알림
  - Workspace 구조 (Scoping Project / Monitored Project)
  - 수집되는 기본 메트릭 유형 (VM CPU, Disk, Network 등)
  - Ops Agent 개요 — 상세 메트릭 및 로그 수집 에이전트
  - AWS CloudWatch, Azure Monitor와의 비교
- **Lab**: 없음

### Section 02 — 메트릭과 대시보드
- **유형**: 이론 + 실습
- **내용**:
  - Metrics Explorer 사용법
  - 커스텀 대시보드 구성 (Chart 추가, 레이아웃)
  - VM 메트릭 확인 (CPU 사용률, 네트워크 트래픽, 디스크 I/O)
  - Ops Agent 설치 후 상세 메트릭 수집 비교
- **Lab**:
  - `[실습] lab17: 커스텀 대시보드 및 VM 메트릭 구성`
    - Metrics Explorer에서 VM CPU 메트릭 확인
    - 커스텀 대시보드 생성 (CPU, 네트워크, 디스크 차트)
    - Ops Agent 설치 후 메모리 메트릭 추가 확인
    - 대시보드에 메모리 차트 추가

### Section 03 — Cloud Logging
- **유형**: 이론 + 실습
- **내용**:
  - Cloud Logging 개념: 자동 수집 로그 유형 (VM 시스템 로그, HTTP 접근 로그 등)
  - Log Explorer UI 구성 및 필터 쿼리 (Logging Query Language)
  - 로그 기반 메트릭(Log-based Metrics) — 로그에서 메트릭 생성
  - 로그 라우터(Log Router) / 로그 싱크(Log Sink) 개요
  - AWS CloudWatch Logs, Azure Log Analytics와의 비교
- **Lab**:
  - `[실습] lab18: Cloud Logging 및 로그 기반 메트릭`
    - Log Explorer에서 VM 시스템 로그 필터링
    - HTTP 접근 로그 쿼리 (LB 접근 로그)
    - 로그 기반 메트릭 생성 (HTTP 5xx 에러 카운트)
    - Metrics Explorer에서 생성된 메트릭 확인

### Section 04 — Uptime Check & 알림
- **유형**: 이론 + 실습
- **내용**:
  - Uptime Check 개념: 외부에서 주기적으로 엔드포인트 가용성 검사
  - 알림 정책(Alerting Policy) 구조: 조건(Condition) + 채널(Channel)
  - Notification Channel 유형 (Email, PagerDuty, Slack, Pub/Sub 등)
  - Incident 생성 및 해소 흐름
- **Lab**:
  - `[실습] lab19: Uptime Check 및 알림 정책 설정`
    - Uptime Check 생성 (HTTP, 60초 간격)
    - 알림 정책 생성 (Uptime Check 실패 시 트리거)
    - Email Notification Channel 설정
    - 서비스 중단 시뮬레이션 후 알림 수신 확인

### Section 05 — [실습] Gallery: 모니터링 + 로깅 연동
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab17, lab18, lab19 완료
- **내용**:
  - Gallery MIG에 Ops Agent 설치 (Instance Template 업데이트)
  - Gallery 전용 대시보드 구성 (CPU, 메모리, HTTP 요청 수)
  - Gallery 에러 엔드포인트 호출로 5xx 로그 발생
  - 로그 기반 메트릭으로 5xx 에러 카운트 시각화
  - 5xx 에러 임계값 초과 시 알림 발송 정책 설정
  - Gallery Uptime Check 추가
  - **리소스**: gcp-fund-gallery-* (누적)
- **예제 파일**: `06 Observability/05 [실습] Gallery - 모니터링 + 로깅 연동/` 하위

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/06.01.claude.notion.md` |
| 02 | `.claude/draft/06.02.claude.notion.md` |
| 03 | `.claude/draft/06.03.claude.notion.md` |
| 04 | `.claude/draft/06.04.claude.notion.md` |
| 05 Gallery | `.claude/draft/06.05.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획확정 |
| 02 | 계획확정 |
| 03 | 계획확정 |
| 04 | 계획확정 |
| 05 Gallery | 계획확정 |
