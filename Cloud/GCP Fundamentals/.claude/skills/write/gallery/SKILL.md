# Skill: write/gallery

Gallery 시리즈 실습 섹션 draft 작성 스킬.

---

## 입력

- `plan/{ch_no}-*.md` — Gallery 섹션 내용, 전제 조건, 추가/변경 리소스
- `plan/series-hierarchy.md` — Gallery 전체 진화 흐름 파악
- `.claude/research/{ch_no}.{sec_no}.md` — 콘솔 경로, 설정 필드

## 출력

`.claude/draft/{ch_no}.{sec_no}.claude.notion.md`

---

## 실행 절차

### 1. Gallery 누적 상태 파악
- series-hierarchy.md에서 이전 Chapter까지 Gallery 구성 확인
- 이번 Chapter에서 무엇이 추가/변경되는지 파악

### 2. 작성 구조
- 각 리소스 단계: `# {n}. {리소스명}` H1
  - `### 1. 설정값` — 독자 환경에 따라 달라질 수 있는 값 포함
  - `### 2. 참고` — 해당 리소스를 다룬 섹션 실습 링크

- 설정값 표기:
  ```
  - {필드명}: `{값이름}` (예: gcp-fund-gallery-...)
  ```

### 3. 스크린샷 명시
- 생성 스텝: 스크린샷 없음 (참고 링크로 대체)
- 리소스 확인, 앱 실행, 결과 검증: `[콘솔화면: ...]` 명시

### 4. 규칙 준수 확인
참조: `.claude/rules/`

| 규칙 | 확인 항목 |
|------|----------|
| style-guide | H1 타이틀 없이 시작, 설정값 표기 |
| korean-writing | 영문 용어 기준 |
| diagram-gen | 전체 아키텍처 (이번 Lab 변경 부분 강조) |

---

## 주의사항

- ⚠️ 비용 주의 섹션 작성 안 함
- 자원 정리: Gallery 인프라 **삭제 안 함** — 비용 절감 시 중지 옵션만 안내
- 참고 링크는 `[섹션 실습 lab{no}: {제목}]({Notion 링크})` 형식 (Notion 링크는 빈 괄호로)
