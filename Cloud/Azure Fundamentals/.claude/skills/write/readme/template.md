# Template: write/readme

Section 디렉토리 README.md 템플릿 (Azure Fundamentals)

GitHub Repository 방문자를 위한 안내 문서.
Notion draft와 별개. 간결하게 작성.

---

## 이론형 Section (실습 없음)

```markdown
# {Chapter no} {Chapter name} / {Section no} {Section name}

{1~2줄 섹션 요약}

## What you will learn

- {학습 포인트 1}
- {학습 포인트 2}
- {학습 포인트 3}

## Reference

- Draft: `.claude/draft/{ch_no}.{sec_no}.claude.notion.md`
- Notion: [Notion 문서]()
```

---

## 실습형 / 혼합형 Section (실습 포함)

```markdown
# {Chapter no} {Chapter name} / {Section no} {Section name}

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

---

## Gallery Section

```markdown
# {Chapter no} {Chapter name} / {Section no} {Section name}

{1~2줄 Gallery 실습 요약. 이번 Chapter에서 Gallery에 무엇이 추가/변경되는지.}

## What you will learn

- {학습 포인트 1}
- {학습 포인트 2}
- {학습 포인트 3}

## Gallery Project

- `Gallery: {작업명}` → {이번 Chapter의 Gallery 변경 내용 요약}

## Reference

- Draft: `.claude/draft/{ch_no}.{sec_no}.claude.notion.md`
- Notion: [Notion 문서]()
```

---

## 작성 원칙

- README는 **안내 문서**, 상세 내용은 Notion에 있음
- What you will learn: 3~5개 핵심 포인트
- Examples: `lab{no}` 번호와 해당 Lab이 다루는 개념 매핑 (예제 파일이 없으면 생략)
- Notion 링크는 비워두고 사용자가 Notion 완성 후 채움
