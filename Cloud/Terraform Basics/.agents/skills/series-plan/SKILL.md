# Skill: series-plan

이 Skill은 Terraform Basics 시리즈의 **전체 문서 구조를 설계하는 작업**을 수행한다.

Series plan은 다음 두 가지 문서를 생성한다.

1. `series-hierarchy.md`
2. 각 Chapter의 `chapter plan`

생성 위치

.agents/plans/


---

# Skill 목적

Terraform Basics 시리즈의 전체 학습 구조를 설계한다.

이 작업은 다음을 포함한다.

- Chapter hierarchy 정의
- Chapter별 학습 목표 정의
- Section 구성 설계
- Section별 Lab 방향 정의

Series plan이 완료되어야 Section 문서 작성이 가능하다.

---

# Execution Conditions

이 Skill은 다음 상황에서 실행된다.

예:

"plan 작성"
"hierarchy 만들어"
"series plan 생성"

또는 사용자가 다음 작업을 요청했을 때

"series 구조 설계"
"chapter 계획 작성"


---

# Pre-Execution Rules

Skill 실행 전에 다음 문서를 반드시 읽는다.

- .agents/standards/writing-rules.md
- .agents/standards/glossary.md

목적

1. 문서 작성 스타일을 일관되게 유지
2. Terraform 기술 용어를 동일한 방식으로 사용
3. Terraform Basics 시리즈 전체 문서의 언어 정책을 유지

이 문서의 규칙은 **Series plan 작성에도 동일하게 적용된다.**

---


# Execution Workflow

이 Skill은 다음 순서를 따른다.

## Step 1 — series hierarchy 생성

다음 문서를 생성한다.

.agents/plans/series-hierarchy.md

이 문서에는 다음이 포함된다.

- Terraform Basics 전체 Chapter 목록
- Chapter 간 학습 흐름
- 각 Chapter의 핵심 학습 주제

예:

- Chapter 01 Terraform 소개
- Chapter 02 HCL 기초
- Chapter 03 Terraform Core Concepts
- Chapter 04 Terraform Workflow
- Chapter 05 Terraform State
- Chapter 06 Terraform Modules
- Chapter 07 Terraform Production Practices

이 문서는 `.agents/templates/plan-series-hierarchy.md` 템플릿을 사용한다.

이미 존재하는 경우 수정하지 않는다. 사용자가 명시적으로 요청한 경우에만 재작성한다.

---

## Step 2 — Chapter plan 생성

각 Chapter에 대해 다음 문서를 생성한다.

.agents/plans/{chapter number} {chapter name}.md

예:

- .agents/plans/01 Terraform 소개.md
- .agents/plans/02 HCL 기초.md
- .agents/plans/03 Terraform 핵심 개념.md

각 문서는 다음 내용을 포함한다.

- Chapter Definition
- Section 목록
- Section 설명
- Lab 설계
- Expected Learning Outcomes
- Modern Key Concepts

Chapter 번호는 두 자리 숫자를 사용한다.

예:

- 01 Terraform 소개
- 02 HCL 기초
- 03 Terraform 핵심 개념

Section 번호는 Chapter 내에서 두 자리 숫자를 사용한다.

예:

- 01 IaC와 Terraform
- 02 Terraform vs CloudFormation
- 03 Terraform 설치

이 문서는 `.agents/templates/plan-chapter.md` 템플릿을 사용한다.

이미 존재하는 plan 문서는 덮어쓰지 않는다. 사용자가 명시적으로 요청한 경우에만 재작성한다.


---

# Writing Guidelines

Series plan 작성 시 다음 원칙을 따른다.

## 1. 실습 중심 구조

Terraform Basics는 **실습 중심 학습 콘텐츠**이다.

각 Chapter는 다음 구조를 가진다.

```
개념 이해
↓
Terraform configuration
↓
Terraform CLI 실행
↓
결과 검증
```

---

## 2. Terraform workflow 중심 구성

Terraform 학습은 다음 흐름을 따른다.

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

## 3. CloudFormation 경험자 고려

독자는 다음 경험을 가지고 있다.

- AWS 기본 개념 이해
- CloudFormation 사용 경험

따라서 다음 비교를 적절히 포함한다.

- Terraform vs CloudFormation
- Terraform dependency graph
- Terraform state vs CloudFormation stack

---

# Output Rules

Skill 실행 시 다음을 생성한다.

- .agents/plans/series-hierarchy.md
- .agents/plans/01 {chapter}.md
- .agents/plans/02 {chapter}.md

미 존재하는 plan 문서는 덮어쓰지 않는다.

사용자가 명시적으로 요청한 경우에만 재작성한다.

---

# Constraints

이 Skill은 다음 작업을 수행하지 않는다.

❌ Section draft 생성  
❌ Lab 코드 작성  
❌ README 생성  

이 작업들은 다음의 다른 Skill이 담당한다.

- section-write

Lab 설계와 실습 설명은 별도 `lab-write` skill이 아니라 `section-write`에서 함께 처리한다.

---

# Completion

Series plan이 생성되면 다음 상태가 된다.

- series-hierarchy complete
- chapter plans complete

이후 사용자는 다음 작업을 요청할 수 있다.

"{chapter}.{section} 문서 작성"

이 경우 `section-write` skill이 실행된다.
