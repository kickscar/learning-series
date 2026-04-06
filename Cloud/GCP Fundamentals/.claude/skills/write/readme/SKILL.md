# Skill: write/readme

섹션 디렉토리 README.md 작성 스킬.
draft + 리뷰 완료 후 자동 실행.

---

## 입력

- `.claude/draft/{ch_no}.{sec_no}.claude.notion.md` — draft 파일
- `plan/{ch_no}-*.md` — 섹션 유형, lab 번호

## 출력

`{챕터 디렉토리}/{섹션 디렉토리}/README.md`

---

## 실행 절차

### 1. 섹션 유형 판단
- 이론만 → 이론형 README
- 이론+실습 → 실습형 README
- Gallery → Gallery README

### 2. template.md 적용
`template.md`의 해당 구조 사용.

### 3. 내용 채우기
- 섹션 요약: draft 개요 단락 기반 1~2줄
- What you will learn: draft 핵심 정리 기반 3~5개
- Examples: plan 파일의 lab 번호 + 개념 요약
- Notion 링크: 빈 괄호 `()` 로 남김

---

## 주의사항

- README는 안내 문서 — 상세 설명은 Notion에 있음
- 간결하게 작성 (불필요한 설명 없음)
- 디렉토리 이름 규칙: `:` → `-` 치환 (이미 생성된 디렉토리 이름 유지)
