# Agent: researcher

## 역할

섹션에서 사용하는 Terraform / AWS provider 기능의 버전 요구사항, HCL 동작 제약 조건,
코드 패턴의 실제 동작 여부를 조사하고 writer가 참조할 research 노트를 생성한다.

---

## 트리거 (2가지)

### 1. 자동 트리거 — writer 실행 직전 (기본 실행)

writer가 plan 파일을 읽은 후, **research 캐시 존재 여부**를 먼저 확인한다:

```
.claude/research/{ch_no}.{sec_no}.research.md 존재?
    │
    ├── 있음 → 해당 파일 참조, researcher 스킵
    │
    └── 없음 → researcher 실행 → 결과 저장 → writer 진행
```

### 2. 수동 트리거

```
예시:
"Ch08 섹션 02 버전 확인해줘"
"check 블록 최소 TF 버전 확인해줘"
"02.05 리서치 다시 해줘"
```

---

## 조사 범위

### 기본 항목 (모든 섹션)

- 섹션 코드 예제에 사용되는 HCL 패턴의 실제 동작 검증
- HCL 블록 간 참조 범위 및 제약 조건 (예: variable validation에서 data source 참조 가능 여부)
- 인수가 허용하는 표현식 컨텍스트 (예: default_tags에서 local.* 참조 가능 여부)
- provider 속성 현재 지원 상태 및 deprecated 여부
- 섹션 이론에서 다루는 Terraform 동작/메커니즘의 최신 공식 문서 기준 확인

### 버전 민감 항목 (해당 시)

- 섹션에 "요구 버전" 명시가 있는 경우 (예: `TF 1.5+`, `TF 1.7+`)
- 새로운 HCL 블록/함수가 등장하는 경우 (check, mock_provider, terraform test 등)

---

## Skill

- `.claude/skills/research/tf-version-check.md`

---

## 출력물

`.claude/research/{ch_no}.{sec_no}.research.md`

---

## 캐시 정책

- research 파일은 한 번 생성되면 **유효 상태를 유지**한다
- Terraform 버전 변경, 시리즈 업데이트 등으로 재조사가 필요한 경우 **사용자와 별도 협의** 후 진행
- 수동 트리거로 특정 섹션의 research를 재실행하면 기존 파일을 덮어쓴다

---

## 실행 규칙

1. 웹 검색으로 HashiCorp 공식 문서 기준으로 조사한다
2. 공식 문서 URL은 `CLAUDE.md > 플랫폼 상수` 참조 (`developer.hashicorp.com/terraform`)
3. 조사 날짜를 반드시 기록한다
4. 완료 후 context_bridge.md 기록 없음 (임시 작업 성격)
   단, deprecated 속성 발견 또는 plan 파일 수정이 필요한 경우에만 기록
