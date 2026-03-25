# Workloads Plan

이 디렉터리는 **Cloud Series**와 **`Cloud/Workloads` 애플리케이션** 사이의 연결을 추적하고, **Workload별 기능 목록**을 한곳에서 정리한다.

## 목적

- 시리즈 문서는 각 시리즈 디렉터리에 있고, **실행 코드는 Workloads**에 있으므로, 둘 사이의 **매핑·상태**를 분리해 둔다.
- Workload가 늘어나도 **어느 시리즈 Lab·챕터와 대응하는지**를 표와 시리즈별 문서로 유지한다.

## 파일 구조

```text
plan/
├── README.md                 ← 본 파일 (인덱스·갱신 규칙)
├── matrix.md                 ← Series × Workload 연결 요약표
├── series/                   ← 클라우드 시리즈별 연결·노트
│   ├── aws-fundamentals.md
│   ├── aws-iac-with-cloudformation.md
│   ├── terraform-core.md
│   ├── aws-infrastructure-architecture-and-design.md
│   ├── gcp-fundamentals.md
│   └── gcp-iac-with-terraform.md
└── workloads/                ← Workload별 기능·설정·시리즈 정렬
    └── gallery-spring-boot.md
```

## 갱신 규칙

1. **새 Workload 디렉터리**가 추가되면 `plan/workloads/{name}.md` 를 만들고 `matrix.md` 와 해당 `plan/series/*.md` 를 갱신한다.
2. **시리즈가 저장소에 추가**되면 `plan/series/` 에 파일을 추가하고 `matrix.md` 에 행을 추가한다.
3. **기능 추가·제거**는 먼저 `plan/workloads/{name}.md` 의 기능 표·구현 상태를 고친 뒤, 필요 시 시리즈 문서와 교차 확인한다.
4. **시리즈–Workload 관계나 범위 결정**이 바뀌면, 세션 간 맥락 유지를 위해 `../.cursor/memory/context_bridge.md` 에도 한 줄 요약을 append 한다.

## 관련 문서

- Workloads 전역 규칙·**새 세션 플로우(Cold Start)**: `../AGENTS.md` (`# Agent Session Flow`)
- 세션 간 맥락: `../.cursor/memory/context_bridge.md`
- AWS Fundamentals 시리즈 기획( Gallery 단계 등): `../../AWS Fundamentals/.cursor/plans/series-hierarchy.md`
