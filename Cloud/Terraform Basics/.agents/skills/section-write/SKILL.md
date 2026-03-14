# Skill: section-write

이 Skill은 Terraform Basics 시리즈의 **Section 문서 초안을 생성하는 작업**을 수행한다.

Section 문서는 Notion 문서 작성을 위한 **draft 문서**이며,
동시에 Git repository에서 사용되는 **Section README.md**도 생성한다.

이 Skill은 다음 두 가지 결과물을 생성한다.

1. Section draft 문서
2. Section directory의 README.md


---

# Skill 목적

Terraform Basics 시리즈의 **Section 학습 콘텐츠 초안 생성**.

이 작업은 다음을 포함한다.

- Section 이론 설명 작성
- Terraform 개념 설명
- Lab 실습 설계
- Terraform CLI 실행 흐름 설명
- Section README.md 생성

Section 문서는 **Notion 문서의 draft** 역할을 한다.

최종 문서는 사용자가 Notion에서 정리한다.


---

# Execution Conditions

이 Skill은 다음 상황에서 실행된다.

예:

- "01.01 문서 작성"
- "01.02 section 작성"
- "02.01 문서 만들어"

또는 사용자가 다음과 같이 요청했을 때

- {chapter}.{section} 문서 작성
- section draft 생성

---

# Pre-Execution Rules

Skill 실행 전에 다음 문서를 반드시 읽는다.

- .agents/standards/writing-rules.md
- .agents/standards/glossary.md

목적

1. 문서 작성 스타일을 일관되게 유지
2. Terraform 기술 용어를 동일한 방식으로 사용
3. Terraform Basics 시리즈 전체 문서의 언어 정책을 유지


---

# Execution Workflow

이 Skill은 다음 순서를 따른다.

## Step 0 — Standards 확인

다음 문서를 먼저 읽는다.

- .agents/standards/writing-rules.md
- .agents/standards/glossary.md

---

## Step 1 — Chapter Plan 확인

Section 문서를 작성하기 전에 반드시 다음 문서를 확인한다.

.agents/plans/{chapter number} {chapter name}.md

예:

- .agents/plans/01 Terraform 소개.md
- .agents/plans/02 HCL 기초.md

이 문서를 통해 다음 정보를 확인한다.

- Section 목표
- Section에서 다룰 주요 개념
- Lab 설계 방향

---

## Step 2 — Section Draft 생성

다음 위치에 Section draft 문서를 생성한다.

.agents/draft/{chapter number}.{section number}.notion.codex.md

예:

- .agents/draft/01.01.notion.codex.md
- .agents/draft/02.01.notion.codex.md

이 문서는 **Notion 문서 작성을 위한 초안**이다.

문서 작성 시 다음 템플릿을 사용한다.

.agents/templates/section.md

---

## Step 3 — Section README 생성

Section directory에 README.md를 생성하거나 업데이트한다.

경로

{chapter number} {chapter name}/{section number} {section name}/README.md

예:

- 01 Terraform 소개/01 IaC와 Terraform/README.md
- 02 Core Workflow/01 Terraform init plan apply/README.md

README 작성 시 다음 템플릿을 사용한다.

.agents/templates/readme.md

README에는 다음 내용이 포함된다.

- Section 개요
- Terraform 개념 설명
- Lab 예제 목록
- Notion 문서 링크


---

# Writing Guidelines

Section 문서는 다음 원칙을 따른다.

---

## 1. 실습 중심 구조

Terraform Basics는 **실습 중심 학습 콘텐츠**이다.

Section 문서는 다음 구조를 가진다.

```
개념 이해
↓
Terraform configuration
↓
Terraform CLI 실행
↓
결과 검증
```

가능한 실제 Terraform 사용 사례 기반 설명을 포함한다.


---

## 2. Terraform 실행 흐름 강조

Terraform 학습은 다음 workflow를 이해하는 것이 핵심이다.

```bash
terraform init
terraform plan
terraform apply
terraform destroy
```

Section 문서에서는 이 흐름을 명확히 설명한다.


---

## 3. CloudFormation 경험자 고려

독자는 다음 경험을 가지고 있다.

- AWS 기본 개념 이해
- CloudFormation 사용 경험

따라서 다음 비교를 적절히 포함한다.

- Terraform vs CloudFormation
- Terraform state vs CloudFormation stack
- Terraform dependency graph


---

## 4. Lab 설계 원칙

각 Section은 최소 1개 이상의 Lab을 포함한다.

Lab은 다음 형식을 따른다.

[실습] lab{no}

Lab 구성

1. 실습 개요
2. Terraform configuration
3. Terraform CLI 실행
4. 결과 확인
5. 실습 포인트

lab 번호는 두 자리 숫자를 사용한다.

예:

- lab01
- lab02
- lab03

---

# Output Rules

이 Skill 실행 시 다음 파일을 생성한다.

- .agents/draft/{chapter}.{section}.notion.codex.md
- {chapter directory}/{section directory}/README.md

예:

- .agents/draft/01.01.notion.codex.md
- 01 Terraform 소개/01 IaC와 Terraform/README.md

이미 존재하는 draft 문서는 덮어쓰지 않는다. 사용자가 명시적으로 요청한 경우에만 재작성한다.

---

# Constraints

이 Skill은 다음 작업을 수행하지 않는다.

❌ Series plan 생성  
❌ Chapter plan 생성  
❌ Terraform 실제 코드 파일 생성  

- Terraform 실제 Lab 코드 파일은 **사용자가 작성한다.**
- Agent는 Lab **설계와 코드 예시만 문서에 포함한다.**


---

# Completion

Section draft 생성이 완료되면 다음 상태가 된다.

- section draft created
- section README created

이후 사용자는 다음 작업을 수행할 수 있다.

- draft 검토
- Codex와 수정 작업
- Notion 문서 작성