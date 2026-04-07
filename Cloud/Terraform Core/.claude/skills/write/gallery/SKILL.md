# Skill: write/gallery

Gallery 챕터 실습 draft 작성 스킬.

---

## 입력

- `plan/{ch_no}-*.md` — Gallery 내용, 전제 조건, 추가/변경 코드
- `plan/series-hierarchy.md` — Gallery 전체 누적 흐름 파악
- `.claude/research/{ch_no}.{sec_no}.md` — 버전 정보 (존재하는 경우)

## 출력

`.claude/draft/{ch_no}.gallery.claude.notion.md`

---

## 실행 절차

### 1. Gallery 누적 상태 파악
- series-hierarchy.md의 Gallery 맵에서 이전 Chapter까지 Gallery 구성 확인
- 이번 Chapter에서 무엇이 추가/변경되는지 파악
- 이전 Gallery 코드에서 복사해 시작하는 파일 목록 확인

### 2. 디렉토리 구조 결정
- 기본: `{ch_no} {챕터명}/Gallery - {실습명}/`
- 모듈 분리 챕터(Ch05~): `modules/` 서브디렉토리 포함

### 3. 작성 구조
- `template.md` 참조
- 각 작업 단계: `# {n}. {작업명}` H1
- 코드 블록: 파일 구조 먼저(A방식) → 파일 내용 순서로
- 결과 확인: `terraform output` 우선 + 브라우저 Gallery 앱 확인

### 4. progress.md 업데이트

`.claude/memory/progress.md` 에서 해당 Gallery 행 (`Sec = G`) 의 `draft` 컬럼을 `—` → `✓` 로 변경.
요약 섹션의 "Gallery draft 완료" 카운트도 함께 업데이트.

### 5. 규칙 준수 확인
참조: `.claude/rules/`

| 규칙 | 확인 항목 |
|------|----------|
| style-guide | H1 타이틀 없이 시작, 리소스명 규칙 `tf-core-gallery-*` |
| korean-writing | 영문 용어 기준 |
| diagram-gen | 전체 아키텍처 (이번 Chapter 변경 부분 강조) |
| code-blocks | hcl/bash/text 언어 지정 |

---

## 주의사항

- Gallery는 샌드박스: `terraform destroy`로 마무리
- 다음 Gallery에서 이 코드를 복사해 시작한다는 안내 포함
- 모듈이 분리된 경우 `modules/` 디렉토리 복사 안내 명시
- 참고 링크: `[섹션 실습 lab{no}: {제목}](섹션 디렉토리/lab{no}/)` 형식
- Section Lab과 달리 Gallery는 챕터 단위 독립 — 같은 챕터 섹션 lab 완료가 전제
