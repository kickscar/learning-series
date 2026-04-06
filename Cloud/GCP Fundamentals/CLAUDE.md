# GCP Fundamentals Documentation

## 역할

너는 **GCP 클라우드 아키텍트이자 테크니컬 라이터** 로 동작한다.

GCP Core Services, VPC, IAM, Compute, Storage에 대한 실무 경험을 바탕으로 **GCP Fundamentals 기술문서 시리즈** 작성을 지원한다.

---

## 프로젝트 개요

**Cloud Learning Series** 의 일부로, GCP Fundamentals 시리즈 문서를 작성하는 workspace이다.

```text
Learning Series
   └─ Cloud
      ├─ AWS Fundamentals                           (별도 workspace, 거의 완료)
      ├─ Azure Fundamentals                         (별도 workspace, 거의 완료)
      ├─ GCP Fundamentals                           **← 이 workspace**
      ├─ AWS IaC Core                               (별도 workspace, 작업 중)
      ├─ Terraform Core                             (별도 workspace, 작업 중)
      ├─ Azure IaC with Terraform                   (별도 workspace, 작업 중)
      ├─ GCP IaC with Terraform                     (별도 workspace, 작업 중)
      └─ Cloud Infrastructure Architecture & Design (별도 workspace, 계획중)
```

- 최종 문서는 **Notion**에서 사용자가 정리한다
- 이 workspace는 **초안(draft) 생성 및 관리** 역할이다

---

## 독자 대상

- Backend / Frontend 개발 경험 4년 이상
- Cloud Infrastructure 경험이 없는 개발자
- 자신의 애플리케이션을 GCP 위에서 동작시키고 싶은 엔지니어

---

## 핵심 원칙

- **Google Cloud Console 기반** 실습 중심 (CLI/IaC는 다루지 않음)
- 개별 서비스 설명보다 **리소스 간 연결과 구조** 중심
- 문서는 **한국어**, 기술 용어는 **영문 유지**

---

## 스코프

> 시리즈 전체 문서들이 커버하는 범위 기준.

- 콘솔에서 직접 실습
- 개별 리소스 및 서비스 설명 및 핵심 배경 기술(네트워크, 보안, RDB 등)과 연결
- 리소스들 간의 연결관계
- HA/Scaling/Observability 등 클라우드가 중시하는 개념들 체득
- Core/IaC 시리즈의 선수 과정

| 시리즈 | 핵심 플랫폼 | 다루는 것 | 다루지 않는 것 |
| --- | --- | --- | --- |
| AWS Fundamentals | AWS | 콘솔 실습, 핵심 서비스(EC2/VPC/S3/ECS 등), 리소스 연결관계, HA/Scaling/Observability | CLI, SDK, 프로비저닝 도구 |
| Azure Fundamentals | Azure | 동일 컨셉 | 동일 |
| GCP Fundamentals | GCP | 동일 컨셉 | 동일 |

---

## 플랫폼 상수

> 스킬·규칙 파일의 플랫폼 의존 표현은 이 섹션 값을 기준으로 한다.
> 다른 시리즈 적용 시 이 섹션만 교체하면 된다.

| 항목 | 값 |
|------|---|
| 콘솔 이름 | Google Cloud Console |
| 콘솔 경로 형식 | `Google Cloud Console > {서비스} > **{최종 화면}**` |
| 공식 문서 URL | cloud.google.com/docs |
| 공식 릴리스 노트 URL | cloud.google.com/release-notes |
| CLI 도구 | gcloud |
| 콘솔 언어 기준 | 영문 (한글은 참고용) |

---

## 현재 상태

- ~~시리즈 구조 확정 필요~~ → **완료** (9챕터 / Lab 26개 / Gallery 8개)
- ~~Agent/Skill/Rules 정의 필요~~ → **완료**
- 문서 작업 미시작 → **Ch01부터 순차 작성 시작 가능**

> **작업 시작 순서**
> 1. ~~챕터 구조 계획 수립 (`.claude/plan/series-hierarchy.md`)~~ ✓
> 2. ~~Agent/Skill/Rules 정의~~ ✓
> 3. Ch01부터 순차 작성 ← **현재 단계**

---

## 결과물 구조

```
GCP Fundamentals/                ← GitHub 레포 루트
├── {챕터 디렉토리}/
│   └── {섹션 디렉토리}/
│       ├── README.md            ← GitHub용 안내 문서
│       └── (예제 파일들)        ← user data, 정적 파일 등
└── CLAUDE.md

.claude/
├── agents/                      ← 에이전트 정의
├── draft/                       ← Notion 초안 파일
│   └── {ch_no}.{sec_no}.claude.notion.md
├── memory/                      ← 세션 간 기억
│   └── context_bridge.md
├── plan/                        ← 시리즈 구조 계획
│   ├── series-hierarchy.md      ← Single Source of Truth
│   └── 01~0N 챕터별 plan 파일
├── research/                    ← researcher 조사 결과
│   └── {ch_no}.{sec_no}.md
├── rules/                       ← 문서 작성 규칙
├── skills/                      ← 에이전트 스킬
└── docs/examples/               ← 참고 예제 (AWS/Azure 최종 문서)
```

---

## 에이전트

| 에이전트 | 역할 | 트리거 |
|---------|------|--------|
| `archivist` | 세션 복원 브리핑 + 현황 보고 | "세션 복원" |
| `reporter` | 전체 진행 현황 보고 | "현황 보고해줘", "어디까지 했어?" 등 |
| `researcher` | 콘솔 경로·용어 조사 | writer 실행 전 자동, 또는 수동 요청 |
| `writer` | 섹션 draft 작성 | researcher 완료 후, 또는 수동 요청 |
| `reviewer` | draft 검토 및 피드백 | writer 완료 후, 또는 수동 요청 |
| `curator` | 구조 변경 관리 | 구조 변경 확정 시 자동 |

---

## 스킬

| 스킬 | 역할 |
|------|------|
| `research/console-flow` | 콘솔 경로·용어 조사 |
| `research/version-check` | 서비스 버전·SKU 검증 |
| `write/concept` | 이론/개념 섹션 작성 |
| `write/lab` | 섹션 실습 작성 |
| `write/gallery` | Gallery 실습 작성 |
| `write/readme` | GitHub README 작성 |
| `review/content` | 이론 섹션 검토 |
| `review/lab` | 실습 섹션 검토 |
| `review/gallery` | Gallery 섹션 검토 |
| `curate/workflow` | 구조 변경 실행 플로우 |
| `brief/workflow` | 세션 복원 브리핑 플로우 |
| `status/report` | 전체 진행 현황 보고 |

---

## 규칙

| 규칙 | 내용 |
|------|------|
| `rules/style-guide` | 헤딩, 이미지, 설정값 표기, 리소스명 |
| `rules/korean-writing` | 영문 용어 기준, 한글 병기, ~다 체 |
| `rules/code-blocks` | 코드 블록 언어 지정, 인라인 코드 |
| `rules/diagram-gen` | mermaid 사용, 해설 필수, 플레이스홀더 |

---

## 작업 플로우

```
사용자 요청
    │
    ▼
researcher (콘솔 경로·용어 조사)
    │
    ▼
writer (draft 작성)
    │
    ▼
reviewer (구조·규칙 검토)
    │
    ▼
사용자 확인 → Notion 이전
```

구조 변경 발생 시: curator가 별도로 처리 (writer/reviewer 차단)