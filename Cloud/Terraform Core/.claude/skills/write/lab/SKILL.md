# Skill: write/lab

섹션 실습 draft 작성 스킬.
이론(write/concept) 다음에 연속으로 하나의 draft 파일에 작성.
섹션에 lab이 여러 개인 경우 순서대로 이어서 작성.

---

## 입력

- `plan/{ch_no}-*.md` — lab 번호, 실습 내용, 생성 리소스
- `.claude/research/{ch_no}.{sec_no}.md` — 버전 정보 (존재하는 경우)

## 출력

`.claude/draft/{ch_no}.{sec_no}.claude.notion.md` (lab 파트 추가)

---

## 실행 절차

### 1. 정보 수집
- plan 파일에서 lab 번호(로컬 순번), 목표, 생성 리소스 목록 확인
- 섹션 내 lab 개수 확인 — 여러 개면 순서대로 모두 작성

### 2. 작성 구조
- H1 `# [실습] lab{no}: {제목}` 으로 각 lab 시작 (Notion 페이지 분리 기준)
- `# 1. 전체 아키텍처`, `# 2. 사전 준비` 고정
- `# 3.` 이후: 단계별(B방식) 큰 틀 + 각 단계 내 파일 구조(A방식) 혼합
- 배포 단계: `terraform init → plan → apply` 순서
- 결과 확인: `terraform output` 우선, `aws CLI` 참고용 병행
- 자원 정리: `terraform destroy` (샌드박스)

### 3. progress.md 업데이트

`.claude/memory/progress.md` 에서 해당 섹션 행의 `draft` 컬럼을 `—` → `✓` 로 변경.
요약 섹션의 "draft 완료" 카운트도 함께 업데이트.

### 4. 규칙 준수 확인
참조: `.claude/rules/`

| 규칙 | 확인 항목 |
|------|----------|
| style-guide | H1 타이틀 없이 시작, 설정값 볼드+백틱, 파일 구조 표기, 리소스명 규칙 |
| korean-writing | ~다 체, 영문 용어 기준 |
| diagram-gen | 전체 아키텍처 다이어그램 + 해설 |
| code-blocks | hcl/bash/text 언어 지정 |

---

## 주의사항

- 이론 파트 끝(`# 참고 자료`) 다음에 `# [실습] lab{no}: {제목}` H1으로 실습 시작
  → 이론/실습 경계 구분 + Notion에서 섹션/Lab 페이지 분리 기준
- 리소스명: `tf-core-lab{lab_no}-{type}` 규칙 준수
- 자원 정리: 섹션 lab은 반드시 `terraform destroy`로 정리 (샌드박스)
- 여러 lab 작성 시 각 lab은 독립적인 샌드박스 — 이전 lab 리소스에 의존하지 않음
