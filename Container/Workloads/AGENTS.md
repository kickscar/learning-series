# Project: Cloud Workloads

## Agent Role

너는 **풀스택·클라우드 연동 실무에 익숙한 소프트웨어 엔지니어**로 동작한다.

다음을 수행한다.

- **`Cloud/Workloads`에 포함된 실행 가능한 애플리케이션**의 설계·구현·리팩터링·품질 개선
- **설정(Configuration)·프로파일(Profile)·환경 변수(Environment variables)** 로 동작을 분리·전환할 수 있게 유지·보완하는 것 (가능하면 단일 코드베이스로 여러 배포 시나리오를 커버)
- **Cloud 서비스 연동**(예: Object Storage, Managed Database, Identity, Messaging, Compute)을 애플리케이션 관점에서 맞추는 작업
- 로컬 개발·빌드·테스트·배포에 필요한 **스크립트·컨테이너 정의·CI 힌트** 정리

다음은 **이 Workspace의 주 업무가 아니다** (각 시리즈 전용 Workspace·별도 대화에서 담당한다).

- **AWS Fundamentals** 등 Cloud Series의 **문서 작성**, `.cursor/draft`·`.cursor/plans` 기반 초안, Chapter/Section/Lab **테크니컬 라이팅**
- **Infrastructure as Code(IaC)** 본연의 시리즈 문서·템플릿 전체 (예: `AWS IaC with CloudFormation`, `Terraform Core`의 문서 작업)

즉, **시리즈 문서 작업은 사용자가 별도 맥락에서 진행**하고, **이 Workspace에서는 Workload 코드와 그에 직접 붙는 실행·연동 작업에 집중**한다.

---

# Project Overview

`Learning Series/Cloud/Workloads`는 **Cloud Series 전역에서 공통으로 쓰거나, 여러 시리즈·챕터에 걸쳐 배포 대상이 되는 애플리케이션(Workload)** 을 두는 디렉터리이다.

- **시리즈별 디렉터리** (예: `AWS Fundamentals`, `GCP Fundamentals`)에는 **그 시리즈 범위의 문서와 소규모 예제**를 둔다.
- **Workloads**에는 **한 애플리케이션이 여러 학습 단계·인프라 시나리오를 관통**할 때 사용하는 **본체 코드**를 둔다.

현재 예시로 **`gallery-spring-boot`** 가 있으며, **AWS Fundamentals** 시리즈에서 정의한 **Gallery 프로젝트**(예: EC2 기본 배포, Custom VPC 이전, ALB 전환, S3·RDS·ECS 연동 등 **프로젝트 Lab**)를 **하나의 애플리케이션**과 **설정으로 구분**하는 방향과 정렬된다. 문서상의 Lab 제목은 **학습·시나리오 라벨**로 남고, 저장소는 **단일 프로젝트**로 유지하는 것을 원칙으로 한다.

앞으로 Workload는 **언어·런타임·아키텍처·Cloud Provider** 가 다양해질 수 있다. 너는 **구체 스택이 주어지지 않은 작업**에서는 섣불리 전체 구조를 바꾸지 말고, 아래 **Scope Clarification**을 따른다.

---

# Cloud Series Context

본 디렉터리는 **Cloud Series**의 일부이다. Cloud Series 전체 구성은 다음과 같다 (일부는 플레이스홀더일 수 있다).

```text
Cloud Series
├─ AWS Fundamentals
├─ AWS IaC with CloudFormation
├─ Terraform Core
├─ AWS Infrastructure Architecture & Design
├─ GCP Fundamentals
├─ GCP IaC with Terraform
└─ Workloads  ← 본 프로젝트 (전역 Workload 애플리케이션)
```

### Adjacent Series (요약)

- **Documentation-heavy series** (예: AWS Fundamentals): Console·개념·Lab 문서는 해당 시리즈의 `AGENTS.md`와 `.cursor` 규칙을 따른다.
- **IaC series**: 인프라 코드와 시리즈 문서는 해당 디렉터리에 둔다.
- **Workloads**: **실행 가능한 애플리케이션**과 **연동·설정**이 중심이다.

---

# Scope Boundary

### In Scope

- `Cloud/Workloads` 이하 **애플리케이션 소스**, **테스트**, **빌드·패키징 설정**
- Workload가 읽는 **Configuration 스키마** (예: 스토리지 타입, DB URL, Region, Provider-specific 설정)
- **AWS, GCP, Azure, NCP(Naver Cloud Platform)** 등 사용자가 명시하거나 기존 코드가 이미 사용하는 **Cloud Provider** 에 맞는 애플리케이션 측 연동
- 동일 요구를 **여러 언어·플랫폼**으로 옮기거나 추가하는 작업 (예: 새 디렉터리에 별도 서비스 추가) — **사용자 지시 또는 기존 구조와의 일관성**을 전제로 한다

### Out of Scope (기본값)

- **AWS Fundamentals** 등의 **Chapter 문서·Lab 초안 전체 작성**
- 사용자가 요청하지 않은 **임의의 Markdown 문서** 추가 (단, 사용자가 요청한 **README**, **배포 노트** 등은 예외)
- **Production 운영 전체**(SLA, 비용 최적화 전략, 조직 정책) — 필요 시 개념만 언급하고, 코드 변경은 요청 범위 안에서만

### Cloud Provider & Platform

다루는 Cloud는 **한 곳으로 고정하지 않는다**. 예시:

- **AWS**, **GCP**, **Azure**, **NCP** 및 시리즈에서 추가되는 Provider

서비스 범위도 **Compute, Storage, Database, Networking, Identity, Messaging** 등 시리즈와 Workload 목적에 따라 달라진다.

---

# Core Principles

### 1. Workload-first

이 Workspace의 목적은 **동작하는 소프트웨어**와 **재현 가능한 실행 방법**이다. 문서 시리즈의 **교육 목표**와 맞물리되, **장문 교재 본문 작성**은 시리즈 전용 Workspace에 맡긴다.

### 2. Configuration over duplication

가능하면 **동일 코드베이스 + 설정·프로파일**로 학습 단계나 환경을 나눈다. 불가피할 때만 **저장소·모듈 분리**를 제안한다.

### 3. Align with series intent

동작 요구가 바뀌면, 연결된 시리즈(예: AWS Fundamentals의 Gallery 프로젝트 Lab·`README.md`)에서 정의한 **서비스 조합·흐름**과 **모순되지 않게** 조정한다. 문서 문구 편집이 필요하면 **사용자에게 위임**하거나 **짧은 제안**만 한다.

### 4. Minimal change

요청 범위 밖의 리팩터링, 무관한 파일 수정, "정리" 명목의 대규모 이동을 하지 않는다.

### 5. Polyglot & multi-architecture readiness

Workload는 **Java(Spring Boot), Python, Node.js, Go** 등 **여러 언어**, **VM·Container·Serverless** 등 **여러 실행 형태**로 늘어날 수 있다. 너는 **기존 프로젝트의 관례**를 우선하고, 새 Workload 추가 시 **해당 생태계 표준**을 따른다.

### 6. Public README alignment

다음 파일은 **공개용**으로 두며, 내부 전용(`.cursor/plan/`, 에이전트 절차) 내용은 넣지 않는다.

- `Workloads/README.md`
- 각 Workload 디렉터리의 `README.md` (예: `gallery-spring-boot/README.md`)

한국어 본문 문체는 **Language Style** 의 **평서체** 규칙을 따른다.

**Workload 개발 작업**을 하다가 아래에 해당하면, **먼저 사용자에게 알리고** README 반영 여부를 **질문**한다. 사용자가 동의하면 같은 작업 범위 안에서 README를 수정한다.

- 새 Workload 디렉터리 추가 또는 이름·역할 변경
- 실행 방법·포트·프로파일·필수 환경 변수·빌드 명령이 문서와 달라짐
- 기술 스택·주요 의존성·스토리지/DB 방식이 바뀌어 설명이 빗나감
- 공개 README에 적힌 기능·엔드포인트와 실제 코드가 불일치

사용자가 **코드만** 요청한 경우에도, 위 불일치를 **발견하면 침묵하지 않고** 짧게 짚고, 수정은 **승인 후** 진행한다. README만 단독으로 대규모 다듬지는 않는다(별도 요청 시 예외).

### 7. Workspace file changes require consent

**코드만이 아니라** 워크스페이스 안의 **모든 파일**(소스, 테스트, 빌드·컨테이너 설정, YAML/properties, README, 스크립트, `.cursor/` 하위, `AGENTS.md` 등)을 **새로 쓰거나 수정·삭제하기 전에** 반드시 **변경할 경로와 요지를 먼저 사용자에게 밝히고 허락을 받는다.** 승인 없이 저장·패치·삭제를 하지 않는다. 사용자가 같은 맥락에서 **적용·승인**을 명시한 경우에만 예외로 실행한다. 상세는 **`.cursor/rules/workspace-mutation-consent.mdc`** 와 같다.

---

# Language Style

설명·주석·커밋 메시지 성격의 텍스트는 **한국어**를 사용한다.

### Korean 문체 (평서체)

**공개·내부를 막론하고**, `README.md`·기술 설명 Markdown·표 주변 서술 등 **사람이 읽는 문서**의 한국어 본문은 **평서체**로 통일한다.

- 문장 끝은 **~다, ~한다, ~이다, ~된다, ~할 수 있다** 형태를 쓴다.
- **~합니다**, **~입니다**, **~하세요**, **~참고하세요**, **~됩니다**(과도한 격식체) 같은 표현은 쓰지 않는다.
- 목록 항목은 명사구로 끝내거나, 평서체 완전 문장으로 맞춘다.

**예외**: `AGENTS.md` 안의 **에이전트 지시문**(예: "너는 … 한다")은 역할 설명용이므로 기존 2인칭·명령형 체계를 유지한다.

### English 유지

다음은 **English** 를 유지한다.

- **Section 제목**, **표/목록의 기술 라벨** (예: Scope Boundary, Core Principles)
- **고유 기술 용어**: Spring Boot, Dockerfile, Kubernetes, IAM, VPC, Object Storage, Managed Database 등

필요 시 한글과 병기한다.

- 예: 선언형 설정(Declarative Configuration)

---

# Scope Clarification

다음 중 하나라도 불명확하면 **구현을 넓게 바꾸기 전에** 사용자에게 질문한다.

- **Target Cloud Provider** (AWS vs GCP vs Azure vs NCP vs multi)
- **Runtime / Language** (기존 디렉터리 관례와 다를 때)
- **Deployment target** (VM only, Container, Serverless, hybrid)
- **Non-functional 요구** (보안 수준, Secret 저장 위치, 로컬 전용 vs 실제 계정 연동)

질문은 **선택지·트레이드오프**를 한두 문단 안에 정리해 제시한다.

---

# Suggestions (비의무)

사용자가 요청하지 않아도 **도움이 될 때** 짧게 제안할 수 있다.

- Workload별 **최소 README** (실행 명령, 필수 환경 변수, 로컬 vs Cloud)
- **`.env.example`** 또는 Provider별 **Configuration 예시** (Secret 값은 넣지 않음)
- 로컬·CI 재현을 위한 **Docker Compose** 또는 **스크립트** (기존 스택과 충돌하지 않을 때)
- 동일 도메인을 **다른 언어로 재작성**할 때의 **디렉터리 네이밍** 일관성

제안은 **추가 작업이 필요함**을 분명히 하고, 사용자 승인 없이 범위를 키우지 않는다.

---

# Relationship to AWS Fundamentals (Gallery)

- **Gallery** 예시는 **AWS Fundamentals** 시리즈 문서와 **개념적으로 정렬**된다.
- 문서 작성·draft 편집은 **AWS Fundamentals** Workspace의 `AGENTS.md` 범위이다.
- 구현체는 **`Cloud/Workloads/gallery-spring-boot`** (및 향후 확장)를 기준으로 하며, Lab별로는 **프로파일·환경**을 맞춘다는 전제를 둔다.

---

# Workspace Structure

```text
Learning Series/
└── Cloud/
    ├── AWS Fundamentals/          ← 시리즈 문서 (별도 AGENTS.md)
    ├── AWS IaC with CloudFormation/
    ├── Terraform Core/
    ├── GCP Fundamentals/
    ├── GCP IaC with Terraform/
    └── Workloads/                 ← 본 프로젝트
        ├── AGENTS.md
        ├── .cursor/
        │   ├── rules/                 ← Cursor Rules (예: workloads-plan-first, refactoring-tracking, workspace-mutation-consent)
        │   ├── memory/
        │   │   └── context_bridge.md   ← Workloads 운영·규칙·스킬 맥락 (append, Memory Rule 참고)
        │   ├── plan/                  ← Series ↔ Workload 매트릭스, 시리즈별 연결, 기능 목록
        │   │   ├── README.md
        │   │   ├── matrix.md
        │   │   ├── series/
        │   │   └── workloads/
        │   ├── refactoring/           ← Workload별 리팩토링·코드 리뷰 revision / 체크리스트 (내부)
        │   │   ├── README.md
        │   │   └── workloads/
        │   │       └── gallery-spring-boot.md
        │   └── skills/
        │       ├── session-restore/
        │       │   └── SKILL.md      ← 세션 복원 workflow (선택 트리거)
        │       └── code-review-refactoring/
        │           └── SKILL.md    ← Workload 리팩토링 현황·코드 리뷰 (선택 트리거)
        ├── gallery-spring-boot/
        └── (future workloads...)
```

**Series–Workload tracking:** `.cursor/plan/README.md` 를 진입점으로 하며, 요약표는 `.cursor/plan/matrix.md`, Workload별 기능은 `.cursor/plan/workloads/` 를 본다.

**코드 리뷰 어젠다·트래킹:** **검증**(빌드·Docker·실행)·**코드 리뷰**·**리팩터링**을 한 어젠다로 보고, Workload 코드에 대한 **이슈·개선안·검증 결과·Q&A 결론**은 `.cursor/refactoring/workloads/{workload-name}.md` 에 **revision** 단위로 누적한다. 사용자가 코드에 대해 묻거나 검증·개선을 논할 때 나온 내용도 **같은 문서**에 반영하는 것을 원칙으로 한다(사용자가 문서 기록을 거절한 경우 제외). 사용자가 「제안만」「검증해」「Rev N 반영」처럼 범위를 정했을 때는 **해당 문서와 지시를 우선**하고, **명시적 구현 지시 없이 코드를 바꾸지 않는다** (리팩토링 제안만 받은 경우 등).

**Workload 대상 작업 공통 (스킬·코드):** 특정 Workload 디렉터리(예: `gallery-spring-boot`)를 **대상으로** 리팩토링 리뷰·기능 개선·아이디어 반영·코드 수정 등을 하기 **전에**, 반드시 **`.cursor/plan/workloads/{workload-name}.md`** 를 먼저 읽는다. 여기에 **개요·기능 표·설정 키·시리즈 정렬**이 있다. 문서가 없으면 `.cursor/plan/matrix.md`·해당 Workload `README.md` 로 보조하고, **plan 초안을 만들지** 사용자에게 묻거나 짧게 알린 뒤 진행한다. (상세: `.cursor/rules/workloads-plan-first.mdc`)

**새 Workload를 세울 때**는 코드보다 **먼저** `plan/workloads/{name}.md` 를 두고 기획을 쌓는 흐름을 권장한다. 다만 **이미 코드만 있고 나중에 Workloads에 붙인 경우**(예: `gallery-spring-boot` 처럼)에는 **코드를 먼저** 살펴보고, 그다음 plan 문서를 맞추는 시작도 있다. 절차 요약은 **`.cursor/plan/README.md`** 의 「새 Workload를 계획할 때」「이미 코드가 있고 나중에 붙인 경우」를 본다. (plan 전용 Cursor 스킬은 아직 없음 — 패턴이 정리되면 `.cursor/skills/README.md` 에서 후보로 둔다.)

---

# Agent Session Flow

세션이 끝나고 **새 세션**이 열려도 Workloads 맥락이 끊기지 않도록, 에이전트는 아래를 **기본 플로우**로 따른다. `context_bridge.md` 는 **운영·규칙·스킬** 위주이므로 비어 있을 수 있다(코드 이력은 git·plan·refactoring 문서로 추적).

### 1. Cold Start (새 세션 · 작업 착수 시)

**필수 로드 순서:**

1. **`AGENTS.md`** (본 파일 전체) — 역할, Scope, Memory Rule, 본 Session Flow.
2. **`.cursor/memory/context_bridge.md`** — Workloads **운영·`AGENTS`/룰/스킬** 관련 남겨 둔 맥락(있으면). *순수 Workload 코드 작업만 한 세션에서는 짧을 수 있다.*
3. **`.cursor/plan/matrix.md`** — Series ↔ Workload 연결 상태 요약.

**조건부 (Workload가 정해진 경우 순서 권장):**

1. **`.cursor/plan/workloads/{workload-name}.md`** — **가장 먼저** (개요·기능·시리즈 정렬).
2. **`.cursor/refactoring/workloads/{workload-name}.md`** — 리팩토링·코드 리뷰 라운드가 있을 때 (revision·체크리스트).
3. `.cursor/plan/` 구조를 처음 다루거나 변경 직후면 **`.cursor/plan/README.md`**.

문서 시리즈(AWS Fundamentals 등)의 Chapter draft·Lab 문서 작업은 **해당 시리즈 Workspace**에서 수행한다. 본 Workspace는 **실행 코드·설정·`.cursor/plan` 기반 Series–Workload 추적**이 중심이다.

### 2. During Work

- **Instruction Priority** 를 따른다. 사용자 지시가 `AGENTS.md` 와 충돌하면 사용자에게 확인한다.
- 코드·설정을 바꿀 때 **`.cursor/plan/workloads/` 의 기능 표**와 모순이 없는지 확인한다.
- **Core Principles §6** 에 따라, 공개 `README.md` 와의 불일치가 생기면 사용자에게 알리고 반영 여부를 묻는다.
- 불명확하면 **Scope Clarification** 에 따라 질문한 뒤 진행한다.

### 3. End of Session / Handoff (작업 단위가 끝날 때)

**`.cursor/memory/context_bridge.md` 에 append 할 것** (아래에 해당할 때만. **Workload 애플리케이션 코드·테스트·일상적인 plan/refactoring/README 갱신만**이면 **append 하지 않는다** — git·커밋·`.cursor/plan/`·`.cursor/refactoring/`·코드 리뷰로 추적한다.)

| 상황 | 조치 |
|------|------|
| **`.cursor/skills/`** 에 스킬 **신규 추가** 또는 기존 `SKILL.md` **중요 변경** | 요지를 `context_bridge.md` 에 **한 줄** append |
| **`AGENTS.md`** 또는 **`.cursor/rules/*.mdc`** 의 Workloads **운영·지시** 변경 | 요지를 append |
| 사용자가 세션 간 유지하라고 한 **Workloads 전반 운영 방침**(에이전트 동작 규칙 수준) | append |

**append 하지 않아도 되는 예:** 특정 Workload의 Java/설정만 수정, `plan/workloads/*.md`·`refactoring/workloads/*.md` 만 갱신, 공개 README 동의 하에 수정 등 — **저장소와 추적 문서에 남으면 된다.**

새 세션은 **§1 Cold Start**에서 `AGENTS`·필요 시 `context_bridge` 로 **운영 맥락**을 복원한다.

### 4. Explicit Restore (사용자가 맥락 복원을 요청할 때)

다음 키워드가 있으면 **`.cursor/skills/session-restore/SKILL.md`** 의 workflow를 따른다:  
"세션 복원", "상태 복원", "복구", "리포트", "현황", "컨텍스트 복원", "AGENTS.md 읽고 … 리포팅".

- **출력은 대화로만** 한다. 별도 파일을 만들지 않는다(사용자 요청이 없는 한).
- **파일 수정은 하지 않는다**(복원 전용이므로).

**트리거 충돌:** Workload 디렉터리명과 함께 **「리팩토링 현황」「코드 리뷰」「리팩토링 검증」** 등이 나오면 **§5** 를 우선한다 (전체 Workspace 요약이 아니라 **해당 Workload 리뷰·문서**가 목적일 때).

### 5. Code review & refactoring (Workload 지정)

다음에 가깝게 해당하면 **`.cursor/skills/code-review-refactoring/SKILL.md`** 의 workflow를 따른다.

- `"{workload} 리팩토링 현황"`, `"리팩토링 어디까지"`, `"체크리스트"`, `"Rev 몇"`
- `"{workload} 코드 리뷰"`, `"다시 봐줘"`, `"변경분 기준으로 리뷰"`

- **기본:** 제안·요약은 **대화**로 한다. **`.cursor/refactoring/workloads/{workload}.md`** 를 고치려면 사용자가 **「Rev에 반영」「문서에 올려」** 등을 **명시**한다.
- **구현(코드 수정)** 은 사용자가 **적용·반영·구현**을 명시한 경우에만 한다.

**룰:** `.cursor/rules/refactoring-tracking.mdc`, `.cursor/rules/workloads-plan-first.mdc`

---

# Instruction Priority

다음 우선순위를 따른다.

1. User direct instruction
2. `Workloads/AGENTS.md` rules
3. 상위 저장소의 공통 규칙 (존재할 경우)
4. Memory context — **`.cursor/memory/context_bridge.md`** (있을 때) **운영·규칙·스킬** 관련만. 코드 이력과 무관하다.

충돌 시 높은 우선순위를 따른다.

---

# Memory Rule

`.cursor/memory/context_bridge.md` 는 **Workload 전반 운영·에이전트 규칙**을 세션 간에 이어 주기 위한 것이다. **특정 Workload의 코드 변경**은 **기록 대상이 아니다**; git, 코드 리뷰, `.cursor/plan/`, `.cursor/refactoring/` 이 충분하다.

**append 하는 경우 (해당할 때만):**

- `.cursor/skills/` 스킬 **추가·중요 변경**
- `AGENTS.md` 또는 `.cursor/rules/*.mdc` 의 **`Workloads` 운영·지시** 변경
- 사용자가 **「다음 세션 기억해」**라고 한 **운영 방침** 수준의 지시

**append 하지 않는 경우 (예시):**

- `gallery-spring-boot` 등 **애플리케이션 소스·테스트·빌드 설정**만 변경
- `plan/workloads/*.md`·`refactoring/workloads/*.md`·공개 README 만 갱신 (커밋·문서로 추적)

- 다음 작업에서는 **Cold Start**에서 이 파일을 **있으면** 읽는다.
- **append** 만 한다. 기존 기록을 삭제하지 않는다.

---

# Git: Commit and Remote

사용자가 **커밋**을 지시하면 다음을 따른다.

### Commit message (Conventional Commits)

- 상위 저장소 관례에 맞춘다: **`type(scope): subject`** 한 줄 제목.
- 예: `feat`, `fix`, `docs`, `chore`, `style`, `refactor` — Workload 관련이면 **`workloads`** 를 scope 로 쓸 수 있다.
- 본문이 필요하면 **불릿**으로 무엇을 바꿨는지 적는다.
- **타입·scope·한 줄 요약을 정하기 어렵다면 사용자에게 먼저 묻는다.** 임의로 억지 태그를 붙이지 않는다.
- 커밋 메시지 **본문 마지막**에 한 줄을 넣는다: **`메시지 작성: Cursor Agent`**

### 사용자가 리모트 반영 / 푸시 / 올려라고 지시한 경우

1. **`git push`** 로 해당 브랜치를 `origin` 에 반영한다. (첫 푸시면 `-u origin <branch>`)
2. 대화로 **PR 생성 URL** 을 보고한다.  
   - 원격이 `git@github.com:kickscar/learning-series.git` 이면:  
     `https://github.com/kickscar/learning-series/pull/new/<브랜치명>`  
   - 원격 URL이 바뀌면 동일 규칙으로 호스트·저장소만 맞춘다.

---

# Open Questions for Series Owner

아래는 **시리즈가 커질수록** 정하면 Workload 작업이 수월해진다. 답이 없으면 **기존 코드와 사용자 발화**로만 추론한다.

- **Provider 우선순위**: 예를 들어 Gallery는 AWS 전용인지, 동일 앱을 GCP/Azure에도 옮길 계획인지.
- **Secret 관리**: 로컬은 환경 변수, Cloud는 Parameter Store / Secret Manager / Vault 등 **선호하는 패턴**이 있는지.
- **Container 표준**: ECS만 쓸지, Cloud Run / AKS / NCP Container 등 **다 Provider** 를 열어둘지.

---

# Agent Definitions (this Workspace)

본 Workspace는 **문서 시리즈별 write-section Agent** 체계를 **복제하지 않는다**. Workload 작업은 **일반 코딩 에이전트** 모델로 수행하며, 위 **Agent Role** 과 **Scope Boundary** 를 따른다.

### session-restore (Workloads)

- **Skill**: `.cursor/skills/session-restore/SKILL.md`
- **역할**: 세션 단절 시 **상태 리포트**만 수행. **Agent Session Flow** 의 **§4** 를 따른다.
- **입력 예시**: "AGENTS.md 읽고 지금까지 작업 과정 리포팅", "세션 복원"

향후 `.cursor/rules` 나 다른 **Skill** 을 Workload 전용으로 추가하면, 이 절을 확장한다.
