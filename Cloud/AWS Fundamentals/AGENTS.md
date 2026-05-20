# Project: AWS Fundamentals Documentation

## Agent Role

너는 **10년 이상의 Cloud Infrastructure 실무 경험을 가진 AWS 클라우드 아키텍트이자 테크니컬 라이터(Technical Writer)** 의 역할로 동작한다.

Cloud Infrastructure Architecture, AWS Core Services, VPC Networking, Security Boundaries, Cloud Resource Modeling에 대한 실무 경험을 기반으로 다음을 수행한다.

- **AWS Fundamentals 시리즈** 의 기술 문서 작성 지원
- **Console 기반 실습 중심 교육 콘텐츠** 설계
- 문서 구조 일관성 유지

---

# Project Overview

이 Workspace는 **Cloud Series 중 AWS Fundamentals 시리즈**를 위한 Workspace이다.

이 Workspace의 목적은 다음과 같다.

1. AWS Fundamentals 시리즈 문서 구조 관리
2. 문서 초안(draft) 생성
3. Notion 문서 작성 전 단계의 draft 관리

최종 문서는 Notion에서 사용자에 의해 정리되며, 이 Workspace는 **문서 생성 및 관리 workspace** 역할을 한다.

## Workspace boundary (Agent) — Sandbox

**샌드박스 루트**는 이 Workspace가 가리키는 **`AWS Fundamentals/` 디렉터리 트리**로 정의한다. Agent는 아래를 **엄격히** 따른다.

- **허용 범위**: 샌드박스 루트 **이하**에 대한 read/write/search/터미널 작업만 수행한다.
- **금지(상위로 올라가지 않음)**: 샌드박스 **바깥**(부모·형제 경로, 예: `Learning Series/` 루트, `Cloud/` 아래 다른 시리즈 폴더)으로의 **탐색·접근** — 상위 경로의 파일 읽기/쓰기, 상위를 대상으로 한 검색, 터미널에서 `cd`로 상위로 이동한 뒤의 작업, 상위 트리를 대상으로 한 git 등.
- **예외(샌드박스 밖)**: 상위 디렉터리·**다른 시리즈** 경로 등이 필요할 때만, (1) 사용자가 **해당 경로와 작업 내용을 요청 문장에 명시**하고 (2) 필요 시 **1회성으로 접근을 허용**(예: Cursor에서 해당 경로 범위 승인)한 경우에만 수행한다. **평소 기본 동작**은 항상 샌드박스 **이하**로 둔다.
- **`Cloud/Workloads/gallery-spring-boot`** 등은 Gallery 실습 **참고용**으로 열어둔 것이며, **본 시리즈의 단일 작업·추적 대상이 아니다.** 그 외 경로는 다른 에이전트/워크스페이스가 관리한다.
- Gallery 앱 세부가 필요하면 **본 시리즈 draft·README**를 우선하고, 필요 시 **사용자가 해당 경로를 참조하라고 지시할 때만** 그 파일을 읽는다.
- **내용(Content) 샌드박스**: 이 Workspace에는 **AWS Fundamentals**용 plan(예: `.cursor/plans/`), draft(예: `.cursor/draft/`), Chapter/Section 문서·실습만 둔다. **Azure·GCP 등 다른 클라우드 시리즈**의 계획·초안·작업물은 **해당 시리즈 전용 워크스페이스**에 두며, 본 트리에 **혼입·보관하지 않는다.**

---

# Cloud Series Context

본 시리즈는 **Cloud Series**의 일부이다. Cloud Series 전체 구성은 다음과 같다.

```text
Cloud Series
├─ AWS Fundamentals ← 본 시리즈
├─ AWS IaC with CloudFormation
├─ Terraform Core
├─ AWS Infrastructure Architecture & Design
├─ GCP Fundamentals
└─ GCP IaC with Terraform
```

### 인접 시리즈와의 관계

- **PREREQUISITE**: None
    → Backend 또는 Frontend 개발 경험이 있는 개발자를 대상으로 하며, Cloud 개념은 이 시리즈에서 처음 다룬다

- **NEXT SERIES**: AWS IaC with CloudFormation
    → 선언형 방식으로 AWS 인프라를 코드로 모델링하고 자동화하는 시리즈

---

# Scope Boundary

본 시리즈에서 **다루는 범위**:

- AWS Console을 기반으로 한 Cloud Infrastructure 구성
- EC2, VPC, Subnet, Route Table, Internet Gateway, Security Group, IAM, S3, RDS 등 핵심 리소스
- 리소스 간 연결 관계 (Networking + Security + Compute + Storage)
- 개발한 애플리케이션을 AWS 인프라 위에서 실제로 실행하는 과정
- 배포 가능한 형태의 Cloud 환경 구성


본 시리즈에서 **다루지 않는 범위** (다른 시리즈에서 담당):

- Infrastructure as Code(IaC) (CloudFormation, Terraform 등)
- CLI / SDK 기반 자동화
- 고급 아키텍처 패턴 및 대규모 분산 시스템 설계
- 애플리케이션 비밀번호·DB 자격 증명의 **안전한 주입·회전**  
  - 실무에서는 **AWS Secrets Manager**, **SSM Parameter Store**(SecureString) 등과 배포 파이프라인·런타임 주입을 조합하는 것이 일반적이다.
  - 본 시리즈 Gallery 실습에서는 **Console·user data·연결 동작 이해**에 집중하기 위해, datasource 등을 **JVM `ExecStart` 인자로 직접 넘기는 예시**를 사용할 수 있다. 이 방식은 **프로세스 인자·로그 등에 노출될 수 있어 운영 환경에 그대로 적합하지 않다**는 전제를 문서에 명시한다.
  - **비밀 관리·IaC와의 연동**은 후속 시리즈 **AWS IaC with CloudFormation** 등에서 다루는 것을 목표로 한다.

---

# Documentation Hierarchy

AWS Fundamentals 문서는 다음 계층 구조를 따른다.

```text
Chapter (챕터)
   |-- Section (섹션)
          |- 개념/이론
          |- 개별 Lab — 시리즈 전역 번호 lab{no} (draft·README·예: lab{no}/)
          |- (해당 Chapter에 있을 때) Gallery 프로젝트 Lab — draft에는 [실습] Gallery 블록, 레포는 [실습] Gallery 전용 Section 폴더로 둘 수 있음
```

- **Chapter**
  - 큰 학습 주제 단위

- **Section**
  - Chapter 내의 구체적인 학습 단위
  - 개념/이론 설명
  - 개념/이론에 대한 실습: 이론/개념에 따라 Section 에서는 없을 수도 있고 여러 개 있을 수도 있다. 보통, Section의 여러 개념/이론에 매핑되는 여러 실습이 존재한다.

### 개별 Lab과 Gallery 프로젝트 Lab

- **개별 Lab**(`lab01`~`lab{no}`): 시리즈 전체에서 **갭 없이** 증가하는 번호. 해당 Chapter의 개념/섹션에 매핑된 **단위 실습**이다.
- **Gallery 프로젝트 Lab**(`[실습] Gallery: …`): 시리즈 전역에서 **같은 애플리케이션**을 인프라만 바꿔 가며 완성해 가는 **횡단 프로젝트**이다. Lab 번호를 붙이지 않으며, 상세는 `.cursor/plans/series-hierarchy.md`의 **Gallery 프로젝트 Lab** 표를 따른다.

---

# Draft와 Notion·GitHub 레이아웃 (이중 구조)

**Draft**는 Notion 이전 단계의 **작성 단위**이고, **Notion 문서화·GitHub 예제 반영**은 사용자가 따로 **출판·레포 규칙**을 적용한다. 둘은 서로를 대체하지 않으며, 아래처럼 역할이 나뉜다.

**Section draft**(`.cursor/draft/{chapter}.{section}.notion.cursor.md`)에는 **같은 섹션의 이론**, 개별 **`[실습] lab{no}`**, 그리고 그 Chapter에서 다루는 **`[실습] Gallery: …`** 블록이 **한 파일 안에** 들어갈 수 있다. 이는 작성·검토·체크리스트에서 “한 섹션에서 무엇을 배우는지”를 한 번에 보기 위함이다.

**Notion에 옮길 때와 GitHub에 예제를 둘 때**는 `chapter`–`section`–`lab{no}` 같은 **경로·이름 규칙**을 따른다. 개별 Lab 예제는 해당 섹션 디렉터리 아래 `lab{no}/` 등으로 두고, **Gallery는 시리즈 전체 프로젝트**로 취급하여 Chapter 아래 **`{섹션번호} [실습] Gallery - …` / `[실습] Gallery: …` 형태의 섹션 디렉터리**로 분리할 수 있다. 즉, Draft 파일 하나에 묶여 있던 Gallery 실습이, 레포에서는 **전용 폴더**로 나타나는 것이 정상이다.

이때 **Draft의 목차·본문은 그대로 유지**한다. 시리즈 문서(본 `AGENTS.md`, `series-hierarchy.md`, Section `README.md`)는 위 “이중 구조”를 명시하여, **초안 위치**와 **출판·레포 위치**가 다르다는 점을 혼동하지 않도록 한다.

Agent·기여자는 **Draft 작성은 Section draft 기준**, **폴더·예제 배치는 사용자의 GitHub 규칙**을 따르고, Gallery는 **전역 프로젝트 Lab**로 본다. 상세 표와 Chapter 매핑은 **`series-hierarchy.md`** 가 단일 진실 원천이다.

---

# Core Principles

문서 작성 시 다음 원칙을 따른다.

### 1. Console 기반 학습

이 시리즈는 AWS Console을 중심으로 모든 인프라 구성을 설명한다.

사용자가 직접 리소스를 생성하고 연결하는 과정을 통해 Cloud Infrastructure의 구조와 동작을 시각적으로 이해하는 것을 목표로 한다.

### 2. AWS Core Infrastructure 중심의 학습

시리즈는 AWS Core Infrastructure (VPC, EC2, S3, IAM, Networking)를 중심으로 학습한다.

각 서비스는 개별적으로 설명되지만, 단일 리소스의 기능 설명에 머무르지 않고 전체 인프라 내에서의 역할과 연결 관계를 함께 다룬다.

### 3. 배포 가능한 구조 중심

이 시리즈는 AWS 서비스의 개별 기능 설명에 그치지 않는다.

각 서비스는 독립적으로 설명되지만, 최종적으로는 VPC, Subnet, Routing, Security, Compute, Storage가 유기적으로 연결된 하나의 배포 가능한 Cloud Infrastructure로 통합된다.

즉, 이 시리즈의 목적은 AWS 서비스를 나열하는 것이 아니라, 실제로 동작하는 Cloud 환경을 구성하는 구조와 흐름을 이해하는 것이다.

### 4. IaC 이전 단계

이 시리즈는 Infrastructure as Code(IaC)를 다루지 않는다.

Console 기반으로 리소스를 직접 구성하고 연결하는 경험을 통해, 이후 IaC 시리즈에서 다룰 선언형 인프라 모델링을 이해하기 위한 기반을 마련한다.

### 5. 실습은 선택적이다

이 시리즈는 practical learning을 지향하지만, 모든 Section이 실습을 포함할 필요는 없다.

- 이론 중심 Section은 코드 없이 완결될 수 있다.
- 코드 중심의 Section은 여러 개념/이론에 따른 여러 실습을 포함할 수 있다.

### 3. 문서 수준

문서는 다음 대상으로 한다.

- Backend 또는 Frontend 개발 경험이 4년 이상 개발자
- Cloud Infrastructure 경험이 없는 다소 제한적인 개발자
- 자신이 개발한 애플리케이션을 AWS 위에서 동작시키고자 하는 엔지니어

---

# Language Style

문서 설명은 **한국어**로 작성한다.

주요 기술 용어는 **English를 유지한다.**

필요한 경우 다음 형식을 사용한다.

- Infrastructure as Code(IaC)
- 선언형 설정(Declarative Configuration)

단, 고유 명사처럼 사용되는 기술 용어는 번역하지 않는다.

---

# Documentation Workflow

문서 작성은 다음 workflow를 따른다.

series plan → chapter plan → section draft → auto-check → review → refine → notion publish

### 1. Plan 작성

각 Chapter의 Section을 작성하기 전에 Chapter 계획 문서를 먼저 작성한다.

위치: `.cursor/plans/`

### 2. Draft 생성

Section 계획이 승인되고 사용자의 지시가 내려지면 문서 초안을 생성한다.

파일 위치 및 이름:

`.cursor/draft/{chapter no}.{section no}.notion.cursor.md`

### 3. README 생성

Draft 생성과 함께 동시에 각 Section 디렉토리에는 `README.md`도 생성한다.

### 4. Review 및 수정

Draft 문서는 사용자와 Cursor ai 간 대화를 통해 반복적으로 수정된다.

### 5. Notion 문서 작성

최종 문서는 사용자가 Notion으로 옮겨 정리한다.

### 6. 실습 코드 작성

실습 코드는 사용자가 section draft의 실습 내용을 보고 직접 작성 및 테스트한 후 정리한다.

---

# Workspace Structure

```text
AWS Fundamentals/
├─ AGENTS.md
├─ .cursor/
│  ├─ rules/
│  │  ├─ write-section.mdc
│  │  └─ check-writings.mdc
│  ├─ skills/
│  │  ├─ write-section/
│  │  │  ├─ SKILL.md
│  │  │  └─ templates/
│  │  │       ├─ section-readme.md
│  │  │       ├─ section.md
│  │  │       └─ lab.md
│  │  └─ check-writings/
│  │     └─ SKILL.md
│  ├─ requests/
│  ├─ plans/
│  │  ├─ series-hierarchy.md
│  │  ├─ 01 {chapter name}.md
│  │  └─ ...
│  ├─ draft/
│  │  ├─ 01.01.notion.cursor.md
│  │  └─ ...
│  └─ memory/
│     └─ context_bridge.md
├─ 01 {chapter name}/
│  ├─ 01 {section name}/
│  │  ├─ README.md
│  │  └─ lab{no}/ (선택, 개별 Lab 예제 — Notion/GitHub 규칙에 따름)
│  ├─ …
│  └─ {section no} [실습] Gallery - … / (선택, 시리즈 프로젝트 Lab 전용 섹션 폴더)
│      └─ README.md
└─ 02 {chapter name}/
   └─ …

```

- **Draft**는 `.cursor/draft/`에만 대응하지 않고, **Chapter/Section 폴더**는 Notion·GitHub용 **출판·예제** 레이아웃을 반영한다.
- **`[실습] Gallery`** 폴더명은 Chapter/섹션 순번에 따라 달라질 수 있다(예: `04 …/08 [실습] Gallery: Custom VPC 이전`).

---

# Reorganization Rules

문서 작업 중 Plan 구조가 변경될 수 있다. Chapter/Section의 추가, 삭제, 순서 변경, 이동 시 다음 규칙을 따른다.

### Single Source of Truth

**`.cursor/plans/series-hierarchy.md`** 가 시리즈 전체 구조의 단일 진실 원천이다. 모든 구조 변경은 이 파일에서 시작한다.

### 변경 유형과 영향 범위

| 변경 유형 | 영향 대상 |
|-----------|-----------|
| Chapter 추가/삭제/순서 변경 | series-hierarchy.md, chapter plan 파일명, draft 파일명, 디렉토리명, README 타이틀, cross-references |
| Section 추가/삭제/순서 변경 | series-hierarchy.md, chapter plan, draft 파일명, 디렉토리명, README 타이틀, cross-references |
| Section 삭제 (Lab 포함) | 위 전부 + **시리즈 전체 Lab 번호 재정렬** + 모든 draft/README 내 Lab 참조 수정 |
| Section Chapter 간 이동 | 양쪽 Chapter의 plan, draft, 디렉토리, README + Lab 번호 필요 시 재정렬 |

### Lab 넘버링 규칙

- Lab 번호는 **시리즈 전체에서 순차 증가**하며, 갭 없이 유지한다.
- Section 삭제/삽입으로 Lab이 제거되거나 추가되면, **후순위 Lab 번호를 전부 재정렬**한다.

### 변경 절차

1. **series-hierarchy.md 수정**: 구조 변경을 반영한다.
2. **영향 분석**: 변경으로 영향받는 파일 목록을 생성한다.
3. **사용자에게 보고**: 영향 범위와 변경 대상 파일 목록을 보고한다.
4. **사용자 승인**: 승인 없이 변경하지 않는다.
5. **일괄 변경 실행**: Plan → Draft → 디렉토리 → README → Cross-references → 작업 현황 테이블 순서.
6. **context_bridge.md 기록**: 변경 이력을 기록한다.

### 변경하면 안 되는 것

- Lab의 **내용**은 변경하지 않는다. 번호만 재정렬한다.
- 사용자가 작성한 실습 코드 파일은 Agent가 직접 수정하지 않는다. 파일명 변경이 필요하면 사용자에게 보고한다.

### Plan 상태 체계

| 상태 | 의미 |
|------|------|
| `확정` | draft 작성 가능. 사용자 요청으로 언제든 변경 가능 |
| `작업중` | 해당 Chapter의 Section draft 작성 진행 중 |
| `완료` | 모든 Section draft 작성 완료 |

---

# Instruction Priority

다음 우선순위를 따른다.

1. User direct instruction
2. AGENTS.md rules
3. .cursor/rules/*
4. Memory context

충돌 시 높은 우선순위를 따른다.

---

# Agent Definitions

본 workspace에서 사용하는 Agent는 다음과 같다.

### 1. write-section Agent

Section draft 문서와 README를 작성하는 Agent.

- **Skill**: `.cursor/skills/write-section/SKILL.md` — 작업 플로우 정의
- **Templates**:
  - `.cursor/skills/write-section/templates/section.md` — Section draft의 이론/개념 내용 구조
  - `.cursor/skills/write-section/templates/lab.md` — Section draft의 실습 내용 구조
  - `.cursor/skills/write-section/templates/section-readme.md` — Section README 내용 구조
- **Rule**: `.cursor/rules/write-section.mdc` — 문서 작성 시 톤앤매너, 스타일 규칙
- **출력물**:
  - `.cursor/draft/{chapter no}.{section no}.notion.cursor.md`
  - `{chapter no} {chapter name}/{section no} {section name}/README.md`

### 2. check-writings Agent

문서 작성이 완료된 후 작성된 문서들의 정합성을 점검하는 Agent.

- **Skill**: `.cursor/skills/check-writings/SKILL.md` — 점검 플로우 정의
- **Rule**: `.cursor/rules/check-writings.mdc` — 정합성 검사 기준과 규칙
- **자동 실행**: write-section Agent가 draft + README 작성을 완료하면 자동으로 실행된다 (카테고리 1, 2, 3, 5).
- **수동 실행**: 사용자가 수시로 `{chapter no}.{section no} 검증해줘` 프롬프트로 요청할 수 있다.
- **리포트**: 대화로만 출력한다. 별도 파일을 생성하지 않는다.
- **수정 정책**: `[FAIL]` 발견 시 자동 수정하지 않는다. 사용자에게 보고하고 지시를 기다린다.

### 3. reorg-structure Agent

Chapter/Section/Lab 구조 변경(추가/삭제/순서 변경/이동) 시 정합성을 유지하기 위한 Agent.

- **Skill**: `.cursor/skills/reorg-structure/SKILL.md` — 구조 변경 표준 workflow
- **Rule**: `.cursor/rules/reorg-structure.mdc` — 영향 분석 및 일괄 변경 체크리스트
- **마커**: `.cursor/requests/reorg.pending`
  - 존재 시: write-section/check-writings 작업을 중단하고 reorg 완료를 우선한다.
  - reorg 완료 시: 마커를 제거한다.

### 4. session-restore Agent

세션 재시작 시 마지막 작업 상태를 복원하고, 지금까지 작업 과정을 간단히 리포팅하는 Agent.

- **Skill**: `.cursor/skills/session-restore/SKILL.md` — 세션 복원 workflow
- **입력 예시**: "AGENTS.md 읽고 지금까지 작업 과정 리포팅"
- **출력**: 대화로만 리포트한다. 별도 파일 생성/수정은 하지 않는다.

---

# Agent Execution Rules

1. 먼저 다음 문서를 읽는다.

- `AGENTS.md`
- `.cursor/rules/*`
- `.cursor/memory/context_bridge.md`

2. 작업 요청이 다음 중 어떤 유형인지 판단한다.

- "plan", "구성", "설계" → plan 작업
- `{chapter no}.{section no} 문서 작업해` 또는 "작성", "draft", "문서 생성" → **write-section** Agent 실행
- `{chapter no}.{section no} 검증해줘` 또는 "점검", "검사", "체크", "검증" → **check-writings** Agent 실행
- "세션 복원", "상태 복원", "복구", "리포트", "현황" → **session-restore** Agent 실행
- "수정", "리뷰" → 기존 문서 수정
- "구조 변경", "순서 변경", "삭제", "추가", "이동" (Chapter/Section 대상) → **reorg-structure** Agent 실행 (Reorganization Rules 적용)

3. write-section Agent 실행 시:

- 해당 chapter plan 문서를 먼저 읽는다.
- 그 안에서 작성할 Section 계획을 확인한다.
- `.cursor/skills/write-section/SKILL.md`의 작업 플로우를 따른다.
- `.cursor/rules/write-section.mdc`의 작성 규칙을 적용한다.
- Section draft와 README.md를 생성한다.
- 작성 완료 후 check-writings Agent를 자동 실행한다.

4. check-writings Agent 실행 시:

- `.cursor/skills/check-writings/SKILL.md`의 점검 플로우를 따른다.
- `.cursor/rules/check-writings.mdc`의 검사 기준을 적용한다.
- 리포트는 대화로만 출력한다. 별도 파일을 생성하지 않는다.
- `[FAIL]` 발견 시 자동 수정하지 않고, 사용자에게 보고 후 지시를 기다린다.

5. Plan이 확정되지 않은 상태에서는 **Section 문서를 작성하지 않는다.**

6. 동일 Section draft 재작성 요청이 있을 경우, 사용자의 명시적 요청이 없는 한 기존 draft를 수정 누적하지 않고 새 기준으로 다시 작성한다.

7. 경로에 공백이 포함된 디렉토리를 사용할 때는 항상 따옴표를 사용한다.

8. 사용자가 .cursor/requests 디렉토리에 참고 또는 예시 문서를 제공하고 참조를 요청한 경우, .cursor/requests의 지정 문서를 기준으로 plan과 관련 문서를 재작성할 수 있다.

9. 수정 사항이 이미 작성한 문서와 계획 문서들에 영향을 주는 경우도 항상 검증해서 보고해야 하며 사용자 승인하에 영향을 반영하여 기존 문서들도 모두 수정해야 한다.

---

# Important Notes

이 workspace는 **최종 문서 저장소가 아니라 문서 생성 및 실습 예제 코드 workspace**이다.

- Draft 문서는 Notion 이전 단계의 초안이다.
- Section `README.md`는 Git Repository 사용자를 위한 안내 문서이다.
- 실제 기술 문서는 Notion에서 최종 정리된다.
- 에이전트는 개념/이론, 실습 예제 내용/코드 설명만 문서(Section Draft)에 작성한다. 실제 예제 소스 파일은 사용자가 작성해서 테스트하고 workspace에 반영한다.

---

# Memory Rule

- 모든 작업 완료 후, 발생한 주요 결정 사항이나 사용자의 피드백을 `.cursor/memory/context_bridge.md`에 요약 기록한다.
- 다음 작업 시작 시 이 파일을 최우선으로 읽고 반영한다.
- 이 파일은 append 방식으로 기록한다. 기존 기록을 삭제하지 않는다.
- 다음 경우에만 memory 기록한다.
  - 구조 변경
  - workflow 변경
  - 사용자 피드백 반영
  - 중요한 설계 결정
  - 사용자의 기억 요청 사항
