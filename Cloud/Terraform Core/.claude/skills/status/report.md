# Skill: status/report

진행 현황 보고 스킬.

---

## 실행 순서

### Step 1 — progress.md 읽기

`.claude/memory/progress.md` 읽기.

---

### Step 2 — 현황 출력

progress.md 내용을 그대로 대화에 출력한다.

추가로 챕터별 진행률 요약 출력:

```
| Ch | 섹션 수 | draft 완료 | Gallery |
|----|--------|-----------|---------|
| 01 |   4    |     0     |    —    |
...
```

챕터별 완료 수는 progress.md 테이블에서 해당 Ch 행의 draft ✓ 개수를 센다.

---

## 출력 규칙

- 대화로만 출력. 파일 생성/수정 없음.
- 보고 후 "다음 작업 대상으로 바로 넘어갈까요?"로 마무리.
