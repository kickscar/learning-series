# Rule: readme

섹션 콘텐츠 디렉토리의 `README.md` 작성 규칙. **draft 통과 후 자동 작성**(별도 요청 불필요).

---

## 위치와 성격

- **draft(`.claude/draft/`)와 별개 산출물**이다. draft는 Notion 이관용 초안, README는 **GitHub 저장소 방문자용 안내 문서**다.
- 출력: `{챕터 디렉토리}/{섹션 디렉토리}/README.md`
- 파이프라인: draft(작성) → Notion 이관(사용자) → GitHub. README는 **Notion ↔ GitHub 상호레퍼런스**.
- **간결하게.** 상세 설명은 Notion에 있으므로 README는 요약과 링크만 둔다.

---

## 작성 시점 (자동)

draft 작성 + 상호체크(self-check + 사용자 검토) 통과 후 **자동으로** 다음을 한다.

1. **콘텐츠 디렉토리 확인/생성**: `{챕터 디렉토리}/{섹션 디렉토리}/`가 없으면 만든다(디렉토리 이름의 `:`는 `-`로 치환, 이미 있으면 그 이름 유지).
2. **README.md 작성/재생성**: 아래 템플릿으로.
3. 완료 보고에 **draft 경로 + README 경로**를 함께 명시.

---

## 템플릿 (섹션 유형별)

섹션 제목·챕터명은 각 시리즈 `series-hierarchy.md` 기준. 플랫폼 의존 표현은 각 시리즈 `CLAUDE.md > 플랫폼 상수`.

### 이론형 (실습 없음)

```markdown
# {챕터 번호} {챕터명} / {섹션 번호} {섹션명}

{1~2줄 섹션 요약. draft 개요 단락 기반}

## What you will learn

- {학습 포인트 1}
- {학습 포인트 2}
- {학습 포인트 3}

## Reference

- Draft: `.claude/draft/{ch_no}.{sec_no}.claude.notion.md`
- Notion: [Notion 문서]()
```

### 실습형 / 혼합형 (실습 포함)

```markdown
# {챕터 번호} {챕터명} / {섹션 번호} {섹션명}

{1~2줄 섹션 요약}

## What you will learn

- {학습 포인트 1}
- {학습 포인트 2}
- {학습 포인트 3}

## Examples

- `lab{no}` → {이 Lab이 다루는 개념 요약}
- `lab{no}` → {이 Lab이 다루는 개념 요약}

## Reference

- Draft: `.claude/draft/{ch_no}.{sec_no}.claude.notion.md`
- Notion: [Notion 문서]()
```

### Gallery 섹션

```markdown
# {챕터 번호} {챕터명} / {섹션 번호} {섹션명}

{1~2줄 Gallery 실습 요약. 이번 챕터에서 Gallery에 무엇이 추가/변경되는지}

## What you will learn

- {학습 포인트 1}
- {학습 포인트 2}
- {학습 포인트 3}

## Gallery Project

- `Gallery: {작업명}` → {이번 챕터의 Gallery 변경 내용 요약}

## Reference

- Draft: `.claude/draft/{ch_no}.{sec_no}.claude.notion.md`
- Notion: [Notion 문서]()
```

---

## 작성 원칙

- **What you will learn**: draft 핵심 정리 기반 3~5개 포인트.
- **Examples**: `lab{no}` 번호와 그 Lab이 다루는 개념을 매핑. 예제 파일이 없으면 생략.
- **Notion 링크는 비워 둔다**(`[Notion 문서]()`). 사용자가 Notion 완성 후 채운다.
- README는 draft 복붙이 아니라 **요약**이다. 상세는 Notion에 있다.
- 서술 톤은 `korean-writing`을 따른다(README 본문도 번역투·② 규칙 적용).
