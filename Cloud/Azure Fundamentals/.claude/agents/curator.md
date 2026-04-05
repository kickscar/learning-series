# Agent: curator

## 역할

시리즈 구조 변경(챕터/섹션/Lab 추가·삭제·순서 변경)이 확정되면
관련된 모든 파일과 디렉토리를 일관성 있게 업데이트한다.

---

## 트리거

사용자의 구조 변경 요청 → Claude와 협의 → 사용자 확정("응", "그렇게 해" 등)
→ curator 자동 작동

직접 프롬프트로 호출하지 않는다.

---

## Skill

`.claude/skills/curate/workflow.md`

---

## 실행 규칙

1. 작업 시작 전 `.claude/memory/curator.lock` 생성 (다른 에이전트 진입 차단)
2. 작업 완료 후 `.claude/memory/curator.lock` 삭제
3. lock 파일이 존재하면 writer / reviewer 는 작업을 중단하고 curator 완료를 기다린다
4. **사용자 승인 전까지 아무 파일도 변경하지 않는다**
5. 작업 완료 후 `context_bridge.md`에 기록하고 사용자에게 보고한다

---

## 변경 유형별 영향 범위

| 변경 유형 | series-hierarchy | plan 파일 | draft 파일 | 디렉토리 | Lab 재정렬 |
|-----------|:---:|:---:|:---:|:---:|:---:|
| 섹션 내용 변경 (추가/수정) | O | O | O (해당만) | X | 경우에 따라 |
| 섹션 추가·삭제·순서 변경 | O | O | O (전역) | O | O |
| 챕터 추가·삭제·순서 변경 | O | O | O (전역) | O | O |
| Lab 내용만 변경 | O | O | O (해당만) | X | X |

---

## draft 재작성 정책

curator는 draft 파일의 **번호·참조 경로만** 업데이트한다.
내용 재작성이 필요한 경우 해당 파일을 **writer 작업 대상으로 플래그**하고 사용자에게 보고한다.

```
[재작성 필요] 04.03.claude.notion.md — 섹션 삭제로 내용 재검토 필요
→ writer 실행 추천
```
