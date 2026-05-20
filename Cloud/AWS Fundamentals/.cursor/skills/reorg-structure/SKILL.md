# Skill: reorg-structure

Chapter/Section/Lab 구조 변경을 표준 절차로 수행하기 위한 workflow를 정의한다.

이 skill은 "구조 변경" 요청이 들어온 경우에만 사용한다.

---

## Trigger

사용자 프롬프트에 다음이 포함되면 실행한다:

- "구조 변경", "순서 변경", "삭제", "추가", "이동"
- Chapter/Section/Lab 번호 재정렬

---

## 핵심 원칙

- Single Source of Truth: `.cursor/plans/series-hierarchy.md`
- 승인 전에는 "영향 분석 리포트"까지만 수행한다. (실제 변경 금지)
- Lab 내용은 변경하지 않는다. 번호/참조만 정렬한다.
- 사용자 작성 실습 코드는 수정하지 않는다.

---

## Workflow

### Step 1. Reorg 모드 진입 (마커 생성)

`.cursor/requests/reorg.pending` 파일이 없으면 생성한다.

이 마커가 존재하는 동안:

- write-section 작업은 중단한다.
- check-writings는 구조 변경이 완료된 후 실행한다.

### Step 2. 변경 요청 정리

다음을 텍스트로 명확히 정리한다:

- 변경 유형(추가/삭제/이동/순서 변경/이름 변경)
- 변경 대상(Chapter/Section 번호/이름)
- Lab 영향(개별 Lab, Gallery Lab)

### Step 3. 영향 분석 리포트 생성 (승인 전)

다음을 목록화한다:

- 수정 대상 plan 파일
- 영향받는 draft 파일(존재하는 경우)
- 영향받는 디렉토리/README(존재하는 경우)
- 영향받는 루트 README(ToC/Labs/프로젝트 표)
- Lab 번호 재정렬 필요 여부 및 영향 범위
- Cross-reference("앞선/다음 Section", Lab 참조) 수정 필요 여부

가능하면 `.cursor/skills/reorg-structure/scripts/scan_workspace.sh`를 사용해 현재 상태를 스캔한다.

### Step 4. 사용자 승인

영향 분석 리포트와 변경 대상 목록을 사용자에게 제시하고 승인받는다.

### Step 5. 일괄 변경 실행 (승인 후)

`.cursor/rules/reorg-structure.mdc` 순서에 따라 일괄 변경한다.

### Step 6. 시리즈 전반 검증

구조 변경이 끝나면 `check-writings`를 시리즈 범위로 실행한다(카테고리 4 포함).

### Step 7. Memory 기록 및 마커 제거

- `.cursor/memory/context_bridge.md`에 변경 이력을 append한다.
- `.cursor/requests/reorg.pending` 파일을 제거한다.

---

## 출력물

- 리포트는 대화로만 출력한다.
- 승인을 받기 전에는 파일을 변경하지 않는다.

