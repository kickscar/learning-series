# Skill: check-writings

작성된 Section draft와 README의 정합성을 검증하는 Agent의 작업 플로우를 정의한다.

---

## Trigger

### 자동 실행

write-section Agent가 draft + README 작성을 완료한 직후 자동으로 실행된다.

### 수동 실행

사용자 프롬프트: `{chapter no}.{section no} 검증해줘`

예: `01.02 검증해줘`, `03.01 검증해줘`

사용자가 수시로 요청할 수 있다. Notion 문서 작업 후, 실습 코드 작성 후 등 시점에 관계없이 요청 가능하다.

---

## 검증 카테고리

| 카테고리 | 설명 |
|----------|------|
| 1. 구조 정합성 | draft가 section.md / lab.md 템플릿 구조를 따르는지 |
| 2. Plan 정합성 | draft 내용이 chapter plan 범위와 일치하는지 |
| 3. 톤앤매너 정합성 | write-section.mdc 규칙을 따르는지 |
| 4. Cross-document 정합성 | 여러 Section 간 일관성 (복수 Section 존재 시) |
| 5. README 정합성 | README와 draft 간 정보가 일치하는지 |

---

## Workflow

### Step 1. Rule 확인

`.cursor/rules/check-writings.mdc`를 읽고 검증 규칙을 확인한다.

`.cursor/requests/reorg.pending`가 존재하면, 구조 변경 진행 중으로 간주하고 검증을 중단한다.
구조 변경 완료 후(마커 제거 후) 다시 실행한다.

### Step 2. 대상 파일 확인

검증 대상을 수집한다.

- `.cursor/draft/{chapter no}.{section no}.notion.cursor.md`
- `{chapter no} {chapter name}/{section no} {section name}/README.md`
- Section 디렉토리 내 실습 코드 파일 (수동 실행 시, 사용자가 작성한 파일이 있으면 포함)

### Step 3. 참조 문서 로드

검증 기준이 되는 문서를 읽는다.

- `.cursor/plans/{chapter no} {chapter name}.md` (Plan)
- `.cursor/skills/write-section/templates/section.md`
- `.cursor/skills/write-section/templates/lab.md`
- `.cursor/skills/write-section/templates/section-readme.md`
- `.cursor/rules/write-section.mdc`

### Step 4. 검증 범위 결정

| 실행 방식 | 카테고리 |
|-----------|----------|
| 자동 (write-section 직후) | 1, 2, 3, 5 |
| 수동 (단일 Section) | 1, 2, 3, 5 + 실습 산출물 검증(존재하는 경우) |
| 수동 (Chapter 전체 / 시리즈 전체) | 1, 2, 3, 4, 5 |

- 수동 실행 시 Section 디렉토리에 실습 산출물(스크립트/설정/메모 등)이 존재하면, draft/README의 안내와 **모순되는 지점이 없는지**를 추가로 검증한다.
- Cross-document(4)는 해당 범위에 복수 Section이 존재할 때만 실행한다.

### Step 5. 검증 실행

`.cursor/rules/check-writings.mdc`의 체크리스트 항목을 순서대로 검증한다.

### Step 6. 리포트 출력

대화로 리포트를 출력한다. 별도 파일은 생성하지 않는다.

리포트 형식:

```markdown
# Check Report: {chapter no}.{section no} {section name}

## 구조 정합성
- [PASS] 헤딩 체계 준수 (H1/H2/H3, H3는 ①/②)
- [FAIL] `# 핵심 정리` 섹션 누락

## Plan 정합성
- [PASS] 주요 내용 커버
- [WARN] Plan에 없는 추가 주제: "{주제명}"

## 톤앤매너 정합성
- [PASS] 평서형 종결 사용
- [FAIL] 경어체 사용 발견 (3건)

## 시각 요소
- [PASS] `mermaid`/이미지 삽입 위치가 명시되고, 바로 아래 2~4줄 해설이 있음
- [FAIL] 실습 단계별 Console 스냅샷 명시 누락 (4.2 단계)

## Cross-document 정합성
- [PASS] Lab 넘버링 순차 유지

## README 정합성
- [PASS] Lab 목록 일치
- [FAIL] Reference에 Draft 경로 누락
```

상태 표기:

| 표기 | 의미 |
|------|------|
| `[PASS]` | 규칙 준수 |
| `[FAIL]` | 규칙 위반 (수정 필요) |
| `[WARN]` | 주의 사항 (사용자 판단 필요) |

### Step 7. 수정 제안

`[FAIL]` 항목이 있을 경우, 구체적인 수정 방법을 제안한다.

- 자동 실행 시: 사용자 승인 없이 즉시 수정하지 않는다. 수정 사항을 보고하고 사용자 지시를 기다린다.
- 수동 실행 시: 동일하게 보고 후 사용자 지시를 기다린다.

---

## 주의 사항

- 리포트는 대화로만 출력한다. 별도 파일을 생성하지 않는다.
- `[FAIL]` 발견 시 자동 수정하지 않는다. 사용자에게 보고하고 지시를 기다린다.
- 수동 실행 시 Section 디렉토리의 실습 산출물(있는 경우)도 검증 대상에 포함한다.
- 경로에 공백이 포함된 디렉토리를 사용할 때는 항상 따옴표를 사용한다.
