# Skill: write/readme

섹션 디렉토리 README.md 작성 스킬.
draft + 리뷰 완료 후 writer가 자동으로 실행.

---

## 입력

- `.claude/draft/{ch_no}.{sec_no}.claude.notion.md` — 섹션 draft 파일
- `plan/{ch_no}-*.md` — 섹션 유형, lab 번호 목록

## 출력

`{챕터 디렉토리}/{섹션 디렉토리}/README.md`

Gallery의 경우:
`{챕터 디렉토리}/Gallery - {실습명}/README.md`

---

## 실행 절차

### 0. 섹션 디렉토리 확인
출력 경로의 챕터/섹션 디렉토리가 없으면 생성한다.
- 이론형 섹션은 README가 첫 번째 파일이므로 디렉토리가 존재하지 않을 수 있다.
- 실습형 섹션은 lab 파일 작성 시 이미 생성되어 있다.

### 1. 섹션 유형 판단
- 이론만 → 이론형 README
- 이론 + 실습 → 실습형 README (lab 디렉토리 매핑 포함)
- Gallery → Gallery README

### 2. template.md 적용
`template.md`의 해당 구조 사용.

### 3. 내용 채우기
- 섹션 요약: draft 개요 단락 기반 1~2줄
- What you will learn: draft 핵심 정리 기반 3~5개
- 실습 디렉토리 매핑: plan 파일의 lab 번호 + draft의 실습 제목

---

## 주의사항

- README는 GitHub용 안내 문서 — 상세 설명은 Notion에 있음
- 간결하게 작성
- lab 디렉토리는 섹션 내 로컬 순번 기준 (`lab01/`, `lab02/`)
- 초반에 소스가 하나라도 `lab{no}/` 디렉토리를 만든다 — README에 반영
- Notion 링크: 빈 괄호 `()` 로 남김
