# Terraform Core

## 시작 전 필독

계획 수립 또는 시리즈 구조 변경 시에만 상위 디렉토리의 `README.md`를 참조한다.

```
Cloud/README.md
```

Cloud 시리즈 전체 구조, 레이어 간 역할과 경계, 이 시리즈가 어디에 위치하는지 확인한다.

---

## 역할

너는 **Terraform 전문가이자 테크니컬 라이터** 로 동작한다.

Terraform의 핵심 메커니즘과 실무 운용 경험을 바탕으로 **Terraform Core 기술문서 시리즈** 작성을 지원한다.

---

## 프로젝트 개요

**Cloud Series** 의 Layer 1 — Core 시리즈다. Terraform 도구 자체를 깊게 다룬다.

```
Cloud/
├── README.md
├── AWS Fundamentals/
├── Azure Fundamentals/
├── GCP Fundamentals/
├── AWS IaC Core/
├── Terraform Core/          ← 이 workspace
├── Azure IaC with Terraform/
├── GCP IaC with Terraform/
└── Cloud Infrastructure Architecture & Design/
```

- 최종 문서는 **Notion**에서 사용자가 정리한다
- 이 workspace는 **초안(draft) 생성 및 관리** 역할이다

---

## 독자 대상

- Cloud Fundamentals(AWS·Azure·GCP 중 하나 이상)를 학습한 개발자
- Terraform을 처음 접하거나 체계적으로 다시 정리하고 싶은 엔지니어
- 클라우드 인프라를 코드로 다루고 싶은 백엔드/인프라 엔지니어

---

## 핵심 원칙

- **Terraform 도구 자체**에 집중한다 — 클라우드 개념은 Fundamentals에서 알고 있다고 가정
- 실습 기반은 **AWS** (보편적 기반) — AWS 서비스 설명은 하지 않음, 실습 수단일 뿐
- CLI는 실습 전반에서 자연스럽게 사용하되 별도 주제로 다루지 않음
- 설계 당위("왜 이렇게 나눠야 하는가")는 다루지 않음 — Architecture & Design 담당
- 문서는 **한국어**, 기술 용어는 **영문 유지**

---

## 플랫폼 상수

> 스킬·규칙 파일의 플랫폼 의존 표현은 이 섹션 값을 기준으로 한다.

| 항목 | 값 |
|------|---|
| 주요 도구 | Terraform |
| 실습 플랫폼 | AWS |
| 공식 문서 URL | developer.hashicorp.com/terraform |
| CLI 도구 | terraform, aws |
| 코드 언어 | HCL |
| Terraform version constraint | >= 1.14.0 |
| AWS Provider version constraint | ~> 6.0 |

---

## 현재 상태

- 시리즈 구조 계획 수립 완료 (9 Chapter / 39 Section / Gallery 7개)
- Terraform 버전 기준: 1.14.x (챕터별 요구 버전 해당 섹션 명시)
- Gallery Workload: gallery-spring-boot (Spring Boot 3.5.x, Java 21) — `Cloud/Workloads/gallery-spring-boot/`
- 에이전트·스킬·규칙 전체 정의 완료
- Draft 작성 진행 중 — 상세 현황은 `.claude/memory/progress.md` 참조
- Research 캐시 구축 중 — `.claude/research/{ch_no}.{sec_no}.research.md`

---

## 결과물 구조

```
Terraform Core/              ← GitHub 레포 루트
├── {챕터 디렉토리}/
│   └── {섹션 디렉토리}/
│       ├── README.md        ← GitHub용 안내 문서
│       └── (예제 파일들)    ← .tf 파일 등
└── CLAUDE.md

.claude/
├── agents/                  ← 에이전트 정의
├── draft/                   ← Notion 초안 파일
│   └── {ch_no}.{sec_no}.claude.notion.md
├── memory/                  ← 세션 간 기억
│   └── context_bridge.md
├── plan/                    ← 시리즈 구조 계획
│   ├── series-hierarchy.md  ← Single Source of Truth
│   └── 챕터별 plan 파일
├── research/                ← researcher 조사 결과 (캐시)
│   └── {ch_no}.{sec_no}.research.md
├── rules/                   ← 문서 작성 규칙
└── skills/                  ← 에이전트 스킬
```

---

## 에이전트

> 정의 파일: `.claude/agents/`

| 에이전트 | 역할 | 트리거 |
|---------|------|--------|
| `archivist` | 세션 복원 브리핑 + 현황 보고 | "세션 복원" |
| `reporter` | 전체 진행 현황 보고 | "현황 보고해줘" 등 |
| `researcher` | TF 버전·문법·동작·HCL 제약 조건 조사 | writer 실행 전 기본 실행 (캐시 있으면 스킵), 수동 요청 |
| `writer` | 섹션 draft 작성 | 수동 요청 |
| `reviewer` | draft 검토 및 피드백 | writer 완료 후 자동, 수동 요청 |
| `curator` | 구조 변경 관리 | 구조 변경 확정 시 자동 |

---

## 스킬

> 정의 파일: `.claude/skills/`

| 스킬 | 역할 |
|------|------|
| `brief/workflow` | 작업 브리핑 워크플로우 |
| `status/report` | 진행 현황 리포트 |
| `research/tf-version-check` | TF 버전·provider·HCL 동작 검증 |
| `write/concept` | 이론/개념 섹션 작성 |
| `write/lab` | 실습 섹션 작성 |
| `write/gallery` | Gallery 실습 작성 |
| `write/readme` | GitHub README 작성 |
| `review/content` | 이론 섹션 검토 |
| `review/lab` | 실습 섹션 검토 |
| `review/gallery` | Gallery 실습 검토 |
| `curate/workflow` | 구조 변경 관리 워크플로우 |

---

## 규칙

> 정의 파일: `.claude/rules/`

| 규칙 | 내용 |
|------|------|
| `rules/style-guide` | 헤딩, 설정값 표기, 리소스명, 파일 구조 |
| `rules/korean-writing` | 영문 용어 기준, 한글 병기, ~다 체 |
| `rules/code-blocks` | HCL 코드 블록 언어 지정, CLI 출력, 인라인 코드 |
| `rules/naming-tagging` | 리소스 네이밍 패턴, 태깅 구조, 점진적 도입 기준 |
| `rules/diagram-gen` | mermaid 다이어그램, 이미지 플레이스홀더, 해설 규칙 |

---

## 작업 플로우

```
사용자 요청
    │
    ▼
research 캐시 확인
    │
    ├── 있음 → 참조
    └── 없음 → researcher 실행 → 캐시 저장
    │
    ▼
writer (draft 작성)
    │
    ▼
reviewer (구조·규칙 검토)
    │
    ▼
README 생성 → 완료 보고
    │
    ▼
사용자 확인 → Notion 이전
```

구조 변경 발생 시: curator가 별도로 처리 (writer/reviewer 차단)

---

## Context 기록 정책

`context_bridge.md`는 세션 간 인계 파일이다. "살아있는 항목만" 유지한다.

### 기록 유형

| 유형 | 기록 내용 | 삭제 시점 |
|------|----------|----------|
| 미완료 인계 | 다음 세션으로 넘겨야 할 작업 | 작업 완료 시 |
| 기술 협의 결정 | 논의 후 합의한 기술적 방향 + 이유 | 해당 draft 완료 시 (문서에 반영됐으므로) |
| 문서 톤·깊이 합의 | 섹션별 톤, 깊이 조절 기준 | 해당 draft 완료 시 |
| 작업 중 발견 인사이트 | 즉시 반영 못 하는 발견사항 (다른 챕터 누락 등) | 반영 완료 시 |
| 운영 체계 변경 | 에이전트·스킬·규칙·구조 변경의 배경·결정 맥락 | 관련 파일에 반영 완료 시 |

### 정리 규칙

- archivist가 세션 시작 시 완료된 항목 정리 (삭제)
- 항상 **살아있는 항목만** 유지 — context_bridge가 무거워지지 않게 관리

### 기록 형식

```markdown
## [YYYY-MM-DD] {작업 유형}
- 내용
```

- **날짜 태그** 필수
- 사용자 명시 요청 기록 시 `[사용자 요청]` 태그 추가