# Template: write/readme

섹션 README.md 작성 템플릿 (Terraform Core)

GitHub Repository 방문자를 위한 안내 문서.
Notion draft와 별개. 간결하게 작성.

---

## 이론형 README

이론만 있는 섹션 (Lab 없음).

```markdown
# {Ch no} {Ch name} / {Sec no} {Sec name}

{1~2줄 섹션 요약}

## What you will learn

- {학습 포인트 1}
- {학습 포인트 2}
- {학습 포인트 3}

## Reference

- Notion: [Notion 문서]()
```

---

## 실습형 README

이론 + Section Lab이 있는 섹션.

```markdown
# {Ch no} {Ch name} / {Sec no} {Sec name}

{1~2줄 섹션 요약}

## What you will learn

- {학습 포인트 1}
- {학습 포인트 2}
- {학습 포인트 3}

## Examples

- `lab01` → {이 Lab이 다루는 개념 요약}
- `lab02` → {이 Lab이 다루는 개념 요약}

## Reference

- Notion: [Notion 문서]()
```

---

## Gallery README

Gallery 챕터 실습.

```markdown
# {Ch no} {Ch name} / Gallery - {실습명}

{1~2줄 Gallery 실습 요약. 이전 Gallery에서 무엇이 추가/변경되는지.}

## What you will learn

- {학습 포인트 1}
- {학습 포인트 2}
- {학습 포인트 3}

## Gallery Project

- `Gallery: {실습명}` → {이번 Chapter의 Gallery 변경 내용 요약}

## Reference

- Notion: [Notion 문서]()
```

---

## 작성 원칙

- README는 **안내 문서**, 상세 내용은 Notion에 있음
- What you will learn: 3~5개 핵심 포인트
- Examples: lab 번호와 해당 Lab이 다루는 개념 매핑 — 실습 없는 섹션은 섹션 생략
- Notion 링크는 비워두고 사용자가 Notion 완성 후 채움
