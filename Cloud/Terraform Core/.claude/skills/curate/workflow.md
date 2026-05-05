# Skill: curate/workflow

구조 변경 확정 후 curator가 실행하는 전체 작업 흐름.

---

## 사전 조건

- 사용자가 구조 변경을 확정했음 ("응", "그렇게 해" 등)
- `curator.lock` 파일 없음 (다른 curator 실행 중 아님)

---

## Phase 0: Lock 생성

```
.claude/memory/curator.lock 생성
내용: 변경 유형 + 시작 시각
```

writer / reviewer 진입 차단.

---

## Phase 1: 변경 범위 파악

변경 유형 확인 (curator.md 변경 유형별 영향 범위 테이블 참조):

| 변경 유형 | series-hierarchy | plan 파일 | draft 파일 | 디렉토리 |
|-----------|:---:|:---:|:---:|:---:|
| 섹션 내용 변경 | O | O | O (해당만) | X |
| 섹션 추가·삭제·순서 변경 | O | O | O (전역) | O |
| 챕터 추가·삭제·순서 변경 | O | O | O (전역) | O |
| Lab 내용만 변경 | O | O | O (해당만) | X |

영향 받는 파일 목록 작성 후 사용자에게 보고 → 승인 대기.

---

## Phase 2: series-hierarchy.md 업데이트

`.claude/plan/series-hierarchy.md` 수정:

- 챕터/섹션 추가·삭제: 해당 항목 추가 또는 제거
- 순서 변경: 번호 재정렬
- Lab 변경: 해당 섹션 Lab 항목 수정
- Gallery 위치 변경: Gallery map 업데이트

> series-hierarchy.md는 SSoT — 가장 먼저 업데이트.

---

## Phase 3: plan 파일 업데이트

영향 받는 챕터 plan 파일 수정:

- 섹션 추가·삭제: Section 구성 테이블 업데이트
- 번호 변경: `{ch_no}.{sec_no}` 형식 재정렬
- Draft 파일 테이블 업데이트
- 상태 테이블 업데이트

> **Section Lab 번호**: 섹션 내 로컬 순번 (`lab01`, `lab02`...) — 전역 재정렬 없음.
> 섹션이 삭제/이동되어도 다른 섹션의 lab 번호는 변경되지 않음.

---

## Phase 4: 디렉토리 구조 업데이트 (해당 시)

섹션/챕터 추가·삭제·순서 변경의 경우:

- 챕터 디렉토리명: `{ch_no} {챕터명}/`
- 섹션 디렉토리명: `{sec_no} {섹션명}/`
- Gallery 디렉토리명: `Gallery - {실습명}/` (번호 없음)
- 디렉토리 이동/생성/삭제 실행

---

## Phase 5: draft 파일 처리

### 번호·경로 업데이트 (curator 직접 처리)

영향 받는 draft 파일:
- 파일명 변경: `{ch_no}.{sec_no}.claude.notion.md` 재정렬
- Gallery draft: `{ch_no}.gallery.claude.notion.md` — 챕터 번호 변경 시만 해당

### 내용 재작성 필요 판단

아래 경우 writer 작업 대상으로 플래그:

```
[재작성 필요] {파일명} — {이유}
→ writer 실행 추천
```

재작성 필요 기준:
- 삭제된 섹션을 참조하는 내용 포함
- 순서 변경으로 "이전 섹션" 참조가 틀어진 경우
- 섹션 내용 자체가 변경된 경우

---

## Phase 5.5: progress.md 업데이트

`.claude/memory/progress.md` 반영:

- 섹션/챕터 추가: 새 행 삽입 (draft = `—`)
- 섹션/챕터 삭제: 해당 행 삭제
- 순서 변경: 행 순서 재정렬 + Ch/Sec 번호 수정
- 요약 섹션 카운트 재계산

> draft가 이미 `✓` 였던 행은 이동 후에도 `✓` 유지.

---

## Phase 6: 완료 처리

1. `curator.lock` 삭제
2. `context_bridge.md` 기록:
   ```
   ## [날짜] 구조 변경 — {변경 요약}
   - 변경 내용: ...
   - 영향 파일: ...
   - writer 재작성 필요: {있음/없음}
   ```
3. 사용자에게 보고:
   - 완료된 변경 목록
   - 재작성 필요 파일 (있는 경우)
   - writer 실행 추천 여부
