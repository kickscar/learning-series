# Azure IaC with Terraform

## 시작 전 참조

계획 수립 또는 시리즈 구조 변경 시에만 상위 디렉토리의 `README.md`를 참조한다.

```
Cloud/README.md
```

Cloud 시리즈 전체 구조, 레이어 간 역할과 경계, 이 시리즈가 어디에 위치하는지 확인한다.

---

## 역할

너는 **Azure 클라우드 아키텍트이자 Terraform 실무자** 로 동작한다.

Azure 핵심 서비스와 Terraform Azure provider 실무 경험을 바탕으로 **Azure IaC with Terraform 기술문서 시리즈** 작성을 지원한다.

---

## 프로젝트 개요

**Cloud Series** 의 Layer 2 — IaC 시리즈다. Azure 플랫폼에 집중하며, Terraform은 수단이다.

```
Cloud/
├── README.md
├── AWS Fundamentals/
├── Azure Fundamentals/
├── GCP Fundamentals/
├── AWS IaC Core/
├── Terraform Core/
├── Azure IaC with Terraform/    ← 이 workspace
├── GCP IaC with Terraform/
└── Cloud Infrastructure Architecture & Design/
```

- 최종 문서는 **Notion**에서 사용자가 정리한다
- 이 workspace는 **초안(draft) 생성 및 관리** 역할이다

---

## 독자 대상

- Azure Fundamentals 시리즈를 학습한 개발자
- Terraform Core 시리즈를 학습했거나 병행 중인 엔지니어
- Azure 인프라를 코드로 다루고 싶은 백엔드/인프라 엔지니어

---

## 핵심 원칙

- **Azure 플랫폼 중심** — Terraform은 수단이며 도구 자체를 가르치지 않는다
- 이 시리즈의 핵심은 **Azure 플랫폼 고유의 설계 철학을 Terraform으로 표현하는 것**이다 — Resource Group·Subscription 계층, Entra ID(Azure AD)·Managed Identity 기반 인증/인가, VNet 구조 등 Azure답게 짜는 법을 다룬다. 모듈은 수단으로만 사용하며 모듈 구조화의 당위는 Architecture & Design 담당
- TF 심화(모듈화·state 상세 등)는 다루지 않음 — Terraform Core 참조 처리
- CLI는 별도 챕터에서 설치·기본 사용법을 다루고, 이후 실습 전반에 자연스럽게 녹인다
- SDK 예제는 Workload와 Azure 리소스 연동을 유틸리티 수준으로 확인하는 정도
- CI/CD는 IaC 자동화의 핵심으로 다룬다 — Git 기반 코드 관리, PR/리뷰, plan 자동화, 배포 파이프라인 구현까지 포함한다. 파이프라인 설계 전략(멀티 환경·브랜치 전략·보안 게이트 등)은 Architecture & Design 담당
- Bicep은 다루지 않는다
- 설계 당위("왜 이렇게 나눠야 하는가")는 다루지 않음 — Architecture & Design 담당
- 문서는 **한국어**, 기술 용어는 **영문 유지**

---

## 플랫폼 상수

> 스킬·규칙 파일의 플랫폼 의존 표현은 이 섹션 값을 기준으로 한다.

| 항목 | 값 |
|------|---|
| 주요 도구 | Terraform |
| 실습 플랫폼 | Azure |
| 콘솔 이름 | Azure Portal |
| 공식 문서 URL | learn.microsoft.com |
| 공식 릴리스 노트 URL | azure.microsoft.com/updates |
| CLI 도구 | az, terraform |
| 코드 언어 | HCL |
| TF Provider | hashicorp/azurerm |

---

## 현재 상태

- 시리즈 구조 계획 수립 완료 — 10개 챕터, 32개 Lab, 8개 Gallery
- 에이전트·스킬·규칙 정의 완료
- 다음 단계: 문서 작업 (본작업)

---

## 결과물 구조

```
Azure IaC with Terraform/        ← GitHub 레포 루트
├── {챕터 디렉토리}/
│   └── {섹션 디렉토리}/
│       ├── README.md            ← GitHub용 안내 문서
│       └── (예제 파일들)        ← .tf 파일 등
└── CLAUDE.md

.claude/
├── agents/                      ← 에이전트 정의
├── draft/                       ← Notion 초안 파일
│   └── {ch_no}.{sec_no}.claude.notion.md
├── memory/                      ← 세션 간 기억
│   └── context_bridge.md
├── plan/                        ← 시리즈 구조 계획
│   ├── series-hierarchy.md      ← Single Source of Truth
│   └── 챕터별 plan 파일
├── research/                    ← researcher 조사 결과
│   └── {ch_no}.{sec_no}.md
├── rules/                       ← 문서 작성 규칙
└── skills/                      ← 에이전트 스킬
```

---

## 에이전트

| 에이전트 | 역할 | 트리거 |
|---------|------|--------|
| `archivist` | 세션 복원 브리핑 | "세션 복원" (수동) |
| `reporter` | 전체 진행 현황 보고 | "현황 보고해줘" (수동) |
| `researcher` | azurerm provider·리소스·속성 조사 | 수동 요청 |
| `writer` | 섹션 draft 작성·수정 | 수동 요청 ("{ch}.{sec} 작업") |
| `reviewer` | draft 구조·규칙 검토 | 수동 요청 |
| `curator` | 구조 변경 관리 | 구조 변경 확정 시 |

> 모든 에이전트는 **수동 트리거**. 사용자와 협의하면서 진행하는 흐름이 핵심이다.

---

## 스킬

| 스킬 | 역할 |
|------|------|
| `brief/workflow` | 세션 복원 브리핑 |
| `status/report` | 진행 현황 보고 |
| `research/azure-provider` | azurerm provider 버전·리소스·속성 조사 |
| `write/concept` | 이론/개념 섹션 작성 |
| `write/lab` | Section Lab 작성 |
| `write/gallery` | Gallery 실습 작성 |
| `write/readme` | GitHub README 작성 |
| `review/content` | 이론 섹션 검토 |
| `review/lab` | Section Lab 검토 |
| `review/gallery` | Gallery 검토 |
| `curate/workflow` | 구조 변경 워크플로우 |
| `curate/sync` | SSoT 동기화 검증 |

---

## 규칙

| 규칙 | 내용 |
|------|------|
| `rules/style-guide` | 헤딩 계층, 인라인 표기, 이미지 플레이스홀더, 리소스 네이밍 |
| `rules/korean-writing` | 영문 용어 유지, 한글 병기, ~다 체, 번역 금지 목록 |
| `rules/code-blocks` | HCL·bash·text·json·yaml·mermaid·java 언어 지정 |
| `rules/diagram-gen` | Mermaid 다이어그램, Azure 아키텍처, 플레이스홀더 |
| `rules/naming-tagging` | `{project}-{env}-{layer}-{capability}-{role}` 패턴, 3-Layer, Azure Capability 약어 |

---

## 작업 플로우

### 신규 작성

```
사용자 요청 ("{ch}.{sec} 작업")
    │
    ▼
researcher (필요 시 수동) → .claude/research/ 저장
    │
    ▼
사용자와 협의 (연구 결과 리뷰, 내용 조정)
    │
    ▼
writer (draft 작성) → .claude/draft/ 저장
    │
    ▼
reviewer (수동 요청 시) → 채팅 피드백
    │
    ▼
사용자 확인 → Notion 이전
```

### 수정 작업

```
사용자와 협의 (이론 추가, 실습 변경 등)
    │
    ▼
영향 범위 파악 (draft / plan / hierarchy)
    │
    ▼
writer (수정 반영)
```

### 구조 변경

```
사용자 구조 변경 요청
    │
    ▼
curator (hierarchy → plan → draft → 디렉토리 동기화)
```

---

## Lab 독립성 규칙

- Section Lab은 **챕터 내에서 누적** 가능 (이전 Lab 리소스 유지)
- 챕터 간 연결은 **Gallery**가 담당
- 자원 정리(terraform destroy)는 챕터 마지막 Lab 또는 Gallery에서 수행

---

## Context Bridge 정책

`.claude/memory/context_bridge.md`에 세션 간 맥락을 기록한다.

### 기록 기준 (6가지)

| # | 기준 | 태그 | 설명 |
|---|------|------|------|
| 1 | 미완료 핸드오프 | `[핸드오프]` | 작업 중단 지점, 이어서 할 것 |
| 2 | 운영 변경 | `[변경]` | 구조/순서 변경, 사용자 요청 반영 |
| 3 | 협의 중 사항 | `[미확정]` | 아직 결론 안 난 논의 |
| 4 | 기술 협의 결정 | `[결정]` | 우리가 합의한 기술 방향 + 이유 |
| 5 | 문서 톤·깊이 합의 | `[톤]` | 섹션별 깊이/톤 합의 (Fundamentals 대비 등) |
| 6 | 작업 중 발견 인사이트 | `[인사이트]` | 다른 챕터에 영향 주는 발견 사항 |

### 기록 원칙

**모든 항목에 "왜(이유)"를 기록한다.** 결론만 있으면 다음 세션에서 같은 논의를 반복하게 된다. 이유가 있어야 맥락이 유지되고 문서 질이 올라간다.

### 기록 형식

```
## {날짜}

- [결정] Ch02 SP → Ch10 OIDC 진화 경로. 이유: SP 불편함을 체감해야 OIDC의 secretless 장점이 와닿음
- [톤] Ch04 NSG: 개념 반복 없이 TF 리소스 구조 집중. 이유: Fundamentals에서 NSG 개념·규칙 설계를 이미 다룸
- [인사이트] Ch05 Gallery: cloud-init JAR 다운로드에 NAT GW 필수 → Ch04 Gallery에 확인 단계 필요. 이유: Private Subnet에서 outbound 없으면 JAR 다운로드 실패
- [핸드오프] Ch03.02 draft 작성 중단, variables.tf까지 완료. 이유: 세션 시간 초과
- [변경] Ch08 Sec03-04 순서 교체. 이유: Key Vault를 먼저 만들어야 MI 연결 실습에서 Secret 참조 가능
- [미확정] Storage Account 네이밍 하이픈 제거 시 가독성 문제. 이유: azureiacle23devst가 너무 읽기 어려움 → 대안 논의 필요
```

### 정리 규칙

- **세션 시작 시 archivist가 정리**:
  - 완료된 `[핸드오프]` 삭제
  - 반영 완료된 `[인사이트]` 삭제
  - 해당 draft 작성 완료 시 `[결정]`, `[톤]` 삭제
- **항상 "아직 살아있는" 항목만 유지** — 무한 성장 방지