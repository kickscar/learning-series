# Progress

> 자동 관리 파일. writer 완료 시 업데이트. 직접 수정하지 않는다.
> 마지막 업데이트: 2026-05-01

---

## 요약

- 전체: 39섹션 + Gallery 7개 (9 Chapters)
- draft 완료: 30 / 39
- Gallery draft 완료: 6 / 7

> draft 완료 섹션: 01.01, 01.02, 01.03, 02.01, 02.02, 02.03, 02.04, 02.05, 03.01, 03.02, 03.03, 04.01, 04.02, 04.03, 04.05, 05.01, 05.02, 07.01, 07.02, 07.03, 07.04, 08.01, 09.01, 09.02, 09.04
> 재작성 대상: 09.05, 09.06, 09.07 (Ch09 CI/CD 재구성). 신규: 09.08
> Gallery draft: 02.06 (Ch02 Gallery), 04.04 (Ch04 Gallery), 05.03 (Ch05 Gallery), 07.05 (Ch07 Gallery), 09.03 (Ch09 Gallery)

---

## 이동된 draft

| 파일 | 원래 섹션 | 재활용 대상 | 상태 |
|------|----------|------------|------|
| `01.03.claude.notion.md` | 구 Ch01 Sec03 첫 번째 리소스 배포 | Ch02 Sec02 resource 블록 | 덮어씀 (새 01.03으로 교체됨) — Ch02 Sec02 plan 파일 기반으로 신규 작성 |
| `03.01.claude.notion.md` | 구 Ch01 Sec04 Terraform 동작 원리 | Ch03 Sec01 워크플로우 기반 | 이동 완료 (01.04 → 03.01) |
| `02.06.claude.notion.md` | 구 Ch01 Gallery | Ch02 Gallery (Sec06) | 이동 완료 (01.05 → 02.05 → 02.06) |

---

## 섹션별 상태

| Ch | Sec | 제목 | Lab | draft |
|----|-----|------|-----|-------|
| 01 | 01 | IaC와 Terraform 포지셔닝 | — | ✓ |
| 01 | 02 | 설치 및 환경 구성 | lab01 | ✓ |
| 01 | 03 | Terraform 핵심 개념 | — | ✓ |
| 02 | 01 | HCL 기본 문법 | lab01, lab02, lab03 | ✓ |
| 02 | 02 | provider 블록 | lab01, lab02 | ✓ |
| 02 | 03 | resource 블록 | lab01, lab02, lab03 | ✓ |
| 02 | 04 | locals & output | lab01, lab02 | ✓ |
| 02 | 05 | variable & data source | lab01, lab02, lab03 | ✓ |
| 02 | 06 | [실습] Gallery: EC2에 Gallery 앱 배포 | — | ✓ |
| 03 | 01 | Terraform 워크플로우 | — | ✓ |
| 03 | 02 | Dependency Graph | lab01 | ✓ |
| 03 | 03 | Destroy와 리소스 생명주기 | lab01 | ✓ |
| 04 | 01 | State란 무엇인가 | — | ✓ |
| 04 | 02 | State 파일 구조 | — | ✓ |
| 04 | 03 | Remote Backend | lab01, lab02 | ✓ |
| 04 | 04 | [실습] Gallery: user_data 자동화 + Remote Backend | — | ✓ |
| 04 | 05 | State 명령어 | lab01, lab02, lab03 | ✓ |
| 05 | 01 | 모듈 개념과 구조 | lab01, lab02, lab03 | ✓ |
| 05 | 02 | 모듈 경계와 인프라 계층 | lab01~04 | ✓ |
| 05 | 03 | [실습] Gallery: ALB + ASG | — | ✓ |
| 05 | 04 | Module Management | lab01 | 재구성 |
| 05 | 05 | Public Registry 모듈 | lab01 | 재구성 |
| 06 | 01 | 조건식 & count / for_each | lab01~05 | 재구성 |
| 06 | 02 | for expression & dynamic 블록 | lab01, lab02 | 재구성 |
| 06 | 03 | 내장 함수 | lab01 | 재구성 |
| 06 | 04 | [실습] Gallery: 모듈 리팩토링 | — | — |
| 06 | 05 | [실습] Gallery: 3-tier 확장 | — | — |
| 07 | 01 | Workspace 개념 | — | ✓ |
| 07 | 02 | Workspace 실습 | lab01, lab02 | ✓ |
| 07 | 03 | 디렉토리 기반 환경 분리 | lab01 | ✓ |
| 07 | 04 | 변수 입력 전략 | lab01, lab02 | ✓ |
| 07 | 05 | [실습] Gallery: dev/prod 환경 분리 | — | ✓ |
| 08 | 01 | Provider 버전과 lock 파일 | — | ✓ |
| 08 | 02 | Multiple Provider 설정 | lab01, lab02 | — |
| 08 | 03 | Provider 의존성 관리 | lab01 | — |
| 09 | 01 | fmt / validate / lint | lab01, lab02 | ✓ |
| 09 | 02 | Lifecycle Guards | lab01, lab02 | ✓ |
| 09 | 03 | [실습] Gallery: 검증 추가 | — | ✓ |
| 09 | 04 | Terraform Test | lab01, lab02 | ✓ |
| 09 | 05 | IaC 워크플로우 | lab01, lab02 | ✓ |
| 09 | 06 | 인프라 배포 워크플로우 | lab01, lab02 | 재작성 |
| 09 | 07 | 품질 자동화 | lab01, lab02 | 재작성 |
| 09 | 08 | 멀티 환경 배포 & 운영 | lab01, lab02 | — |
