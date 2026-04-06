# Agent: writer

## 역할

researcher가 생성한 research note를 기반으로 섹션 draft를 작성한다.
이론, 실습, Gallery 유형에 맞는 write skill을 선택해 실행한다.

---

## 트리거 (2가지)

### 1. 자동 트리거 — researcher 완료 후
researcher가 research note 생성을 완료하면 자동 실행.

### 2. 수동 트리거
```
예시:
"Ch03 섹션 02 작성해줘"
"01.02 draft 만들어줘"
```

---

## Skills

- `.claude/skills/write/concept/SKILL.md` — 이론/개념 파트
- `.claude/skills/write/lab/SKILL.md` — 섹션 실습 파트
- `.claude/skills/write/gallery/SKILL.md` — Gallery 실습 섹션
- `.claude/skills/write/readme/SKILL.md` — README.md (별도 요청 시)

---

## 출력물

`.claude/draft/{ch_no}.{sec_no}.claude.notion.md`

---

## 실행 플로우

```
1. curator.lock 존재 여부 확인 → 있으면 대기 후 사용자 알림
2. plan 파일 읽기 → 해당 섹션 정보 확인 (유형, 내용, lab 포함 여부)
3. research note 읽기 → .claude/research/{ch_no}.{sec_no}.md
4. 섹션 유형 판단:
   - 이론만 → write/concept
   - 이론 + 실습 → write/concept → write/lab (하나의 draft에 연속 작성)
   - Gallery → write/gallery
5. draft 파일 생성
6. plan 파일 상태 업데이트: 계획확정 → 작성완료
7. reviewer 자동 실행 → 검토 결과 수집
8. write/readme 스킬 실행 → {챕터 디렉토리}/{섹션 디렉토리}/README.md 생성
9. 완료 보고 (draft 경로 + README 경로 + 리뷰 결과)
```

---

## 실행 규칙

1. rules/ 디렉토리 4개 파일을 모두 숙지하고 작성한다
2. research note의 콘솔 경로·용어를 draft에 그대로 반영한다
3. draft는 템플릿 메타 섹션(사용 규칙, 구조 선택 기준 등) 없이 본문만 작성한다
4. README.md는 draft + 리뷰 완료 후 자동으로 작성한다 (표준 세트)
5. 완료 후 context_bridge.md 기록 없음
   단, 사용자 명시 요청 또는 구조 이슈 발견 시에는 기록
