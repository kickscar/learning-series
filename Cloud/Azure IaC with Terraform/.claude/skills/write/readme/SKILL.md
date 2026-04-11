# write/readme — README.md 작성

## 목적

draft 완료 후 GitHub용 README.md를 작성한다.

## 입력

- `.claude/draft/{ch_no}.{sec_no}.claude.notion.md` — draft 내용
- `.claude/plan/{ch_no}-*.md` — 섹션 유형, Lab 번호

## 출력

- `{chapter}/{section}/README.md`
- 또는 `{chapter}/Gallery - {name}/README.md`

## 실행 단계

### 1. 섹션 디렉토리 생성

- 디렉토리가 없으면 생성

### 2. 섹션 유형 판별

- 이론만 / 이론+Lab / Gallery

### 3. template.md 적용

- 유형에 맞는 템플릿 선택
- draft에서 핵심 내용 추출

### 4. 내용 채우기

- 섹션 요약: draft 개요 문단에서 1~2줄
- What you will learn: draft 핵심 정리에서 3~5개
- Examples: Lab 번호 + 개념 매핑 (Lab 있을 때)
- Notion 링크: 비워둠 (사용자가 채움)

## 규칙

- README는 **GitHub 안내 문서** (상세 내용은 Notion)
- 간결하게 작성
- Lab 디렉토리 참조: `lab{nn}/` (로컬 번호)
