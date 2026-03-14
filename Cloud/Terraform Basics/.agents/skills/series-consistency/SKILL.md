# Skill: series-consistency

이 Skill은 Terraform Basics 시리즈의 **문서 구조와 일관성을 검증하는 작업**을 수행한다.

Terraform Basics 문서는 다음 요소들로 구성된다.

- series hierarchy
- chapter plans
- section draft 문서
- section README
- lab 설계

이 Skill은 이러한 요소들이 **서로 일관되게 유지되는지 검사한다.**

이 Skill은 **문서를 생성하지 않는다.**

문서 구조의 문제를 발견하면 **문제 목록과 수정 제안을 제공한다.**


---

# Skill 목적

Terraform Basics 시리즈의 **구조적 일관성 유지**.

검사 대상

- Series hierarchy
- Chapter plan
- Section draft
- Section README
- Lab naming

이 Skill은 다음을 보장한다.

- 문서 numbering 규칙 유지
- plan ↔ draft 일관성 유지
- Section 구조 유지
- Terraform 용어 사용 일관성 유지


---

# Execution Conditions

이 Skill은 다음 상황에서 실행된다.

예:

- series consistency 검사
- 문서 구조 점검
- series check

또는 다음 상황에서 자동 실행될 수 있다.

- 새로운 Section draft 생성 이후
- 여러 Section이 작성된 이후
- series plan 변경 이후

---

# Pre-Execution Rules

Skill 실행 전에 다음 문서를 반드시 읽는다.

- .agents/standards/writing-rules.md
- .agents/standards/glossary.md

목적

- 문서 스타일 기준 확인
- Terraform 용어 사용 기준 확인


---

# Execution Workflow

이 Skill은 다음 순서를 따른다.

---

## Step 1 — Series Hierarchy 검사

다음 문서를 확인한다.

.agents/plans/series-hierarchy.md

검사 항목

- Chapter numbering 규칙

```
01
02
03
```

- Chapter 순서 논리

Terraform 학습 흐름

```
Terraform 소개
↓
HCL syntax
↓
resource / provider
↓
Terraform workflow
↓
Terraform state
↓
Terraform module
↓
production infrastructure
```

이 흐름이 깨졌는지 검사한다.


---

## Step 2 — Chapter Plan 검사

다음 문서들을 확인한다.

.agents/plans/*.md

검사 항목

- Chapter numbering 규칙
- Section numbering 규칙
- Section 설명 존재 여부
- Lab 설계 포함 여부

예:

- 01 Terraform 소개.md
- 02 HCL 기초.md
- 03 Terraform Core Concepts.md

각 Chapter는 다음 구조를 가져야 한다.

- Chapter Definition
- Section List
- Section Description
- Lab Design
- Expected Learning Outcomes
- Modern Key Concepts

---

## Step 3 — Section Draft 검사

다음 위치의 문서를 확인한다.

.agents/draft/*.md

검사 항목

- Section numbering 규칙

```
01.01
01.02
02.01
```

- Chapter plan과 Section 일치 여부
- section.md template 구조 유지 여부

필수 구조

```
개요
이론 / 개념 설명
[실습] lab01
```

---

## Step 4 — Section README 검사

다음 위치의 문서를 확인한다.


{chapter directory}/{section directory}/README.md


검사 항목

- README 존재 여부
- Section draft와 README 일치 여부
- README template 구조 유지 여부


---

## Step 5 — Lab Naming 검사

Section directory 내 Lab 파일 검사

예:

- lab01.tf
- lab02.tf
- lab03.tf

검사 항목:

- lab 번호 규칙

```
lab01
lab02
lab03
```

- README와 lab 목록 일치 여부


---

## Step 6 — Terminology Consistency 검사

문서 전체에서 다음 용어 사용을 확인한다.

예:

- Terraform state
- remote backend
- provider
- module
- dependency graph

다음 기준을 따른다.

- standards/glossary.md 정의와 동일한 용어 사용
- 번역 혼용 방지


---

# Output Format

검사 결과는 다음 형식으로 제공한다.

Series Consistency Report

예:

```bash
[OK] Chapter numbering
```

```bash
[WARN] Section numbering mismatch
02.03 missing in chapter 02
```

```bash
[WARN] README missing
03 Terraform Workflow / 02 Terraform apply
```

```bash
[WARN] Lab numbering issue
lab02.tf missing
```

---

# Correction Suggestions

문제가 발견되면 다음을 제안한다.

예:

```bash
Suggested Fix
```

```bash
Create README.md
03 Terraform Workflow / 02 Terraform apply
```

```bash
Rename
lab2.tf → lab02.tf
```


---

# Constraints

이 Skill은 다음 작업을 수행하지 않는다.

❌ 문서 생성  
❌ draft 수정  
❌ plan 수정  

이 Skill은 **검사와 제안만 수행한다.**


---

# Completion

검사가 완료되면 다음 상태가 된다.

```bash
series consistency verified
```

또는,

```bash
series consistency issues detected
```

사용자는 이후 다음 작업을 수행할 수 있다.

- 문제 수정
- section 재작성
- plan 수정