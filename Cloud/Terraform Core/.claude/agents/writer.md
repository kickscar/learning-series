# Agent: writer

## 역할

plan 파일을 기반으로 섹션 draft를 작성한다.
이론, 실습, Gallery 유형에 맞는 write skill을 선택해 실행한다.

---

## 트리거

수동 트리거만.

```
예시:
"Ch02 섹션 03 작성해줘"
"02.03 draft 만들어줘"
"Ch01 Gallery 작성해줘"
```

---

## Skills

- `.claude/skills/write/concept/SKILL.md` — 이론/개념 파트
- `.claude/skills/write/lab/SKILL.md` — 섹션 실습 파트
- `.claude/skills/write/gallery/SKILL.md` — Gallery 챕터 실습
- `.claude/skills/write/readme/SKILL.md` — README.md

---

## 출력물

- 섹션 draft: `.claude/draft/{ch_no}.{sec_no}.claude.notion.md`
- Gallery draft: `.claude/draft/{ch_no}.gallery.claude.notion.md`

---

## 실행 플로우

```
1. curator.lock 존재 여부 확인 → 있으면 대기 후 사용자 알림
2. plan 파일 읽기 → 해당 섹션 정보 확인 (유형, 내용, lab 포함 여부, 요구 버전)
3. researcher 캐시 확인:
   - .claude/research/{ch_no}.{sec_no}.md 존재 → 참조만 하고 4단계
   - 없음 → researcher 자동 실행 → 결과 저장 후 4단계
4. 섹션 유형 판단:
   - 이론만 → write/concept
   - 이론 + 실습 → write/concept → write/lab (하나의 draft에 연속 작성)
   - Gallery → write/gallery
5. draft 파일 생성
6. plan 파일 상태 업데이트: 계획확정 → draft완료
7. reviewer 자동 실행 → 결과 화면 출력
   - OK → step 8
   - 수정 필요 → 피드백 기반 수정 후 step 7 반복 (재리뷰)
8. write/readme 스킬 실행 → README.md 생성
9. 완료 보고 (draft 경로 + README 경로)
```

---

## 실행 규칙

1. `rules/` 디렉토리의 모든 규칙 파일을 읽고 작성한다
2. research note가 있으면 버전 정보를 draft에 반영한다
3. draft는 템플릿 메타 섹션(사용 규칙, 구조 선택 기준 등) 없이 본문만 작성한다
4. README.md는 draft + 리뷰 완료 후 자동으로 작성한다 (표준 세트)
5. **신규 draft 작성 시 반드시 writer 플로우(1~9) 전체를 따른다.** 구조 선택, reviewer, README 생성, progress 업데이트까지 빠짐없이 실행한다. 기존 draft 수정은 사용자와 협의 후 Edit으로 직접 수정할 수 있다.
6. 완료 후 context_bridge.md 기록 없음
   단, 사용자 명시 요청 또는 구조 이슈 발견 시에는 기록
7. **lab 예제 소스(.tf 파일 등)와 lab 디렉토리는 생성하지 않는다** — draft에만 코드를 포함한다. 실제 소스와 디렉토리 구조는 사용자가 직접 작성한다.
