# Section README Template

이 템플릿은 Section 디렉터리의 README.md 구조를 정의한다.
GitHub Repository 사용자를 위한 간결한 안내 문서이며, Notion draft와는 별개의 문서이다.

---

## 문서 구조

### 이론형 Section (실습 없음)

```markdown
# {Chapter no} {Chapter name} / {Section no} {Section name}

{1~2줄 섹션 요약}

## What you will learn

- {학습 포인트 1}
- {학습 포인트 2}
- {학습 포인트 3}

## Reference

- Draft: `.cursor/draft/{chapter no}.{section no}.notion.cursor.md`
- Notion: [Notion 문서]()
```

### 실습형 / 혼합형 Section (실습 포함)

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

- Draft: `.cursor/draft/{chapter no}.{section no}.notion.cursor.md`
- Notion: [Notion 문서]()
```

### 실습형 / 혼합형 + Gallery 프로젝트 Lab (Chapter 마지막 Section)

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

## Gallery Project

- `Lab: Gallery-{version}` → {Gallery 앱 버전 변경 Lab 요약}
- `Lab: Gallery - {작업명}` → {Gallery 인프라 전환 Lab 요약}

## Reference

- Draft: `.cursor/draft/{chapter no}.{section no}.notion.cursor.md`
- Notion: [Notion 문서]()
```

---

## 구조 규칙

### 헤딩 체계 (GitHub 관례)

| 레벨 | 용도 |
|------|------|
| `# H1` | Section 타이틀 (문서당 1개) |
| `## H2` | 하위 섹션 (What you will learn, Examples, Gallery Project, Reference) |

- README는 **GitHub 관례**를 따른다.

### 필수 섹션

| 섹션 | 조건 | 설명 |
|------|------|------|
| 타이틀 (`# H1`) | 항상 | `{Chapter no} {Chapter name} / {Section no} {Section name}` |
| 섹션 요약 | 항상 | 타이틀 바로 아래 1~2줄 |
| What you will learn | 항상 | 핵심 학습 포인트 bullet list |
| Examples | 개별 Lab이 있는 경우만 | `lab{no}` → 개념 매핑 |
| Gallery Project | Gallery Lab이 포함된 Chapter 마지막 Section만 | `Lab: Gallery-{version}` 또는 `Lab: Gallery - {작업명}` → 내용 요약 |
| Reference | 항상 | Draft 경로 + Notion 링크 (Notion은 생성 시점에는 비워둠) |

### 작성 원칙

- 간결하게 작성한다. README는 상세 문서가 아니라 **안내 문서**이다.
- What you will learn은 **3~5개** 정도의 핵심 포인트로 구성한다.
- Examples는 Lab 번호와 해당 Lab이 다루는 **개념**을 간단히 매핑한다.
- Gallery Project는 Gallery Lab 이름과 해당 Lab이 다루는 **프로젝트 적용 내용**을 간단히 매핑한다.
- Notion 링크는 비워두고, 사용자가 Notion 문서 완성 후 채운다.
