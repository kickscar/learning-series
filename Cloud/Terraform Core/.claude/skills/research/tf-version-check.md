# Skill: research/tf-version-check

## 목적

섹션에서 사용하는 Terraform 기능의 버전 요구사항, AWS provider 속성 변경사항을 조사하고
writer가 정확한 버전 정보를 draft에 반영할 수 있도록 reference를 제공한다.

> 공식 문서 URL은 `CLAUDE.md > 플랫폼 상수` 참조 (`developer.hashicorp.com/terraform`)

---

## 조사 항목

### 1. Terraform 버전 요구사항

- 섹션에서 사용하는 기능의 최초 도입 버전
- 현재 시리즈 기준 버전(1.10.x)에서 사용 가능 여부
- Preview → GA 전환 여부

주요 버전 참고:
| 기능 | 최소 버전 |
|------|----------|
| `check` 블록 | TF 1.5 |
| `terraform test` | TF 1.6 |
| mock provider | TF 1.7 |
| `precondition` / `postcondition` | TF 1.2 |

### 2. AWS Provider 속성 확인

- 섹션에서 사용하는 resource의 현재 지원 인수(argument) 목록
- Deprecated된 인수 여부 및 대체 인수
- 권장 AWS provider 버전 (`~> 5.0`)

### 3. 문법 변경사항

- 해당 기능의 최신 공식 문서 기준 문법
- 예제 코드의 현재 동작 여부

---

## 출력 형식

`.claude/research/{ch_no}.{sec_no}.md` 파일로 저장.

```markdown
# Research: {ch_no}.{sec_no} — {섹션 제목}

> 조사일: YYYY-MM-DD
> 기준: Terraform {version}, hashicorp/aws provider {version}

## 버전 요구사항

| 기능 | 최소 TF 버전 | 현재(1.10.x) 사용 가능 | 비고 |
|------|------------|----------------------|------|
| {기능명} | {버전} | ✓ / ✗ | |

## AWS Provider 속성

| 인수 | 상태 | 비고 |
|------|------|------|
| {인수명} | 정상 / Deprecated | 대체: {인수명} |

## 주의사항

- {deprecated 항목, 변경 예정 사항, 버전별 동작 차이 등}

## 참고 문서

- [{제목}]({URL})
```

---

## 조사 방법

1. `developer.hashicorp.com/terraform/language` — 언어 레퍼런스
2. `developer.hashicorp.com/terraform/language/upgrade-guides` — 버전별 변경사항
3. `registry.terraform.io/providers/hashicorp/aws/latest/docs` — AWS provider 문서
4. HashiCorp GitHub changelog 검색
