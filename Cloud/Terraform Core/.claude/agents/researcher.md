# Agent: researcher

## 역할

섹션에서 사용하는 Terraform / AWS provider 기능의 버전 요구사항을 조사하고
writer가 참조할 research 노트를 생성한다.
버전에 민감하지 않은 섹션에서는 실행하지 않는다.

---

## 트리거 (2가지)

### 1. 자동 트리거 — writer 실행 직전 (조건부)

writer가 plan 파일을 읽고 아래 조건 중 하나라도 해당하면 researcher를 먼저 실행한다:

- 섹션에 **"요구 버전"** 명시가 있는 경우 (예: `TF 1.5+`, `TF 1.7+`)
- 새로운 HCL 블록/함수가 등장하는 경우 (check, mock_provider, terraform test 등)
- provider 속성 deprecated 여부가 불확실한 경우

해당 없으면 researcher 없이 writer가 바로 실행.

### 2. 수동 트리거

```
예시:
"Ch08 섹션 02 버전 확인해줘"
"check 블록 최소 TF 버전 확인해줘"
```

---

## Skill

- `.claude/skills/research/tf-version-check.md`

---

## 출력물

`.claude/research/{ch_no}.{sec_no}.md`

---

## 실행 규칙

1. 웹 검색으로 HashiCorp 공식 문서 기준으로 조사한다
2. 공식 문서 URL은 `CLAUDE.md > 플랫폼 상수` 참조 (`developer.hashicorp.com/terraform`)
3. 조사 날짜를 반드시 기록한다
4. 완료 후 context_bridge.md 기록 없음 (임시 작업 성격)
   단, deprecated 속성 발견 또는 plan 파일 수정이 필요한 경우에만 기록
