# write/concept — 이론/개념 섹션 작성

## 목적

plan 파일 기반으로 이론/개념 섹션의 draft를 작성한다.

## 입력

- `.claude/plan/{ch_no}-*.md` — 섹션 내용
- `.claude/research/{ch_no}.{sec_no}.md` — 조사 결과 (있으면)

## 출력

- `.claude/draft/{ch_no}.{sec_no}.claude.notion.md`

## 실행 단계

### 1. 정보 수집

- plan 파일에서 섹션 내용 파악
- research 파일 존재 시 버전·속성 정보 참조

### 2. 구조 선택

| 구조 | 적용 대상 |
|------|----------|
| Structure 1: 일반 개념 | IaC 개요, 인증 개념, 네이밍 규칙 등 |
| Structure 2: 메커니즘 | Remote State, RBAC 동작, Private Endpoint 등 |
| Structure 3: 리소스/블록 | azurerm 리소스 구조, provider 설정 등 |

### 3. 작성

- `template.md` 구조에 따라 작성
- 개요 문단으로 시작 (챕터/섹션 제목 없이)
- H1 번호 없음, H2 번호 있음, H3 원숫자
- `# 핵심 정리` + `# 참고 자료`로 마무리

### 4. 규칙 검증

- `rules/style-guide.md` — 헤딩, 인라인 표기
- `rules/korean-writing.md` — 용어, 문체
- `rules/diagram-gen.md` — 다이어그램 사용
- `rules/code-blocks.md` — 코드 블록 언어 지정
- `rules/naming-tagging.md` — 리소스명 표기

## 참조

- HCL 코드 예시는 실행 가능한 수준으로 작성
- 참고 자료 URL은 CLAUDE.md 플랫폼 상수 기준
  - Terraform: `registry.terraform.io/providers/hashicorp/azurerm/latest/docs`
  - Azure: `learn.microsoft.com`
- azurerm provider 버전 민감 기능은 `(azurerm x.x+)` 표기
