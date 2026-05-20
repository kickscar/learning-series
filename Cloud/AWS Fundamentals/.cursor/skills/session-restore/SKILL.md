# Skill: session-restore

세션 재시작(또는 컨텍스트 단절) 시, 마지막 작업 상태를 빠르게 복원하고 현재 상태를 리포팅하기 위한 workflow다.

---

## Trigger

사용자 프롬프트에 다음이 포함되면 실행한다:

- "세션 복원", "상태 복원", "복구", "리포트", "현황"
- "AGENTS.md 읽고 지금까지 작업 과정 리포팅"

---

## Workflow

### Step 1. 필수 문서 로드

- `AGENTS.md`
- `.cursor/rules/*` (특히 `write-section.mdc`, `check-writings.mdc`, `reorg-structure.mdc`)
- `.cursor/memory/context_bridge.md`
- `.cursor/plans/series-hierarchy.md`

### Step 2. 진행 중 작업 감지

- `.cursor/requests/reorg.pending` 존재 여부를 확인한다.
  - 존재 시: "구조 변경 진행 중"으로 리포트하고, reorg-structure workflow가 먼저 완료되어야 함을 알린다.

### Step 3. 상태 리포트 출력 (대화로만)

다음을 간결하게 요약한다:

- 현재 plan 상태(확정/작업중/완료) 및 시리즈 구성 개요(챕터/섹션 수)
- 최근 memory 변경 사항(최근 1~3개 항목)
- 현재 확정된 핵심 규칙(헤딩 체계, Lab/Gallery 규칙, 다이어그램/이미지/스냅샷 규칙)
- `.cursor/plans/series-hierarchy.md`의 "작업 현황" 표에서 최근 변경된 항목(또는 완료된 항목)을 함께 요약한다.
- 다음 추천 작업 1~2개 (예: `01.01 문서 작업` 등)

### Step 4. 변경 금지

세션 복원 단계에서는 사용자의 명시적 요청이 없는 한 파일을 수정하지 않는다.
