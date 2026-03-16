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
- Section 성격에 맞는 구조 설계
- 필요한 경우에만 Lab 실습 설계
- 필요한 경우에만 Terraform CLI 실행 흐름 설명
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
- 이 Section이 개념 중심인지, 비교 중심인지, 실습 중심인지에 대한 단서

추가로 다음을 판단한다.

- AWS 리소스 설명이 문서의 중심인지, 아니면 Terraform 개념 설명을 위한 보조인지
- CloudFormation 비교가 핵심인지, 보조 비교인지

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

다만 이 템플릿은 **고정 목차를 강제하지 않는다.**

Section의 성격에 따라 다음 구조 중 하나를 선택하거나 조합한다.

- 개념 중심 구조
- 비교 중심 구조
- workflow 설명 구조
- 실습 중심 구조
- 설계/운영 중심 구조

작성 전에는 반드시 아래 중 하나를 먼저 선택한다.

- 개념 입문형
- 비교형
- workflow형
- 실습형
- 운영/설계형

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

다만 모든 Section이 반드시 실습을 포함해야 하는 것은 아니다.

Section 문서는 다음 두 방향 중 하나를 가질 수 있다.

```
개념 이해
↓
Terraform configuration
↓
Terraform CLI 실행
↓
결과 검증
```

또는,

```
배경 개념
↓
핵심 이론
↓
비교 / 분류 / 구조 설명
↓
필요 시 예제 또는 참고 자료
```

가능한 실제 Terraform 사용 사례 기반 설명을 포함하되, 개념 중심 Section에서는 코드나 실습 없이도 완결된 설명을 구성할 수 있다.

실습형 Section이 아니라면 불필요하게 Terraform code example이나 AWS resource 설명을 늘리지 않는다.


---

## 2. Terraform 실행 흐름 강조

Terraform 학습에서 다음 workflow는 중요하다.

```bash
terraform init
terraform plan
terraform apply
terraform destroy
```

그러나 모든 Section 문서에서 이 흐름을 동일한 비중으로 다룰 필요는 없다. workflow가 핵심 주제인 Section에서만 자세히 설명한다.


---

## 3. CloudFormation 경험자 고려

독자는 다음 경험을 가지고 있다.

- AWS 기본 개념 이해
- CloudFormation 사용 경험

따라서 다음 비교를 적절히 포함한다.

- Terraform vs CloudFormation
- Terraform state vs CloudFormation stack
- Terraform dependency graph

다만 CloudFormation은 **비교를 위한 보조 재료**로 사용한다.

- Terraform Basics의 중심축은 Terraform 자체다.
- CloudFormation은 차이를 설명하는 최소한의 범위에서만 다룬다.
- CloudFormation 리소스나 운영 방식 자체를 깊게 확장하지 않는다.


---

## 4. Lab 설계 원칙

Lab은 필요한 경우에만 포함한다.

다음과 같은 Section은 실습 없이 작성할 수 있다.

- 배경 개념 중심 Section
- 도구 비교 중심 Section
- 분류 체계 설명 Section
- 운영 원칙 정리 Section

다음과 같은 Section은 실습 포함을 우선 고려한다.

- Terraform CLI workflow Section
- resource 생성 및 변경 Section
- state, backend, module, AWS resource 구성 Section

실습형 Section에서도 AWS 인프라 자체의 상세 설명보다 Terraform이 해당 리소스를 어떻게 선언, 계획, 적용, 추적하는지에 초점을 둔다.

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

실습이 없을 경우 lab 섹션 전체를 생략할 수 있다.

## 5. 최종 문서 수준에 맞춘 서술 밀도

Section draft는 단순 요약보다 **최종 Notion 문서에 가까운 서술 밀도**를 목표로 한다.

다음을 적극 활용한다.

- 배경 개념에서 출발하는 도입
- 표를 통한 분류
- 도구 또는 방식 비교
- 단계별 동작 흐름
- 핵심 구성 요소 정리
- 참고 자료 제시

예를 들어 `01.01 IaC와 Terraform` 같은 Section은 바로 Terraform 코드 예제로 시작하지 않고 DevOps, 자동화, IaC, Terraform으로 이어지는 배경 흐름을 포함할 수 있다.

반대로 `Networking`, `Database`, `EC2`, `S3` 같은 AWS 리소스가 등장하더라도 Terraform Basics에서는 AWS 인프라의 세부 설계 문서처럼 확장하지 않는다. 해당 리소스는 Terraform 개념을 설명하는 사례로만 사용한다.

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
- Agent는 필요한 경우에만 Lab **설계와 코드 예시를 문서에 포함한다.**


---

# Completion

Section draft 생성이 완료되면 다음 상태가 된다.

- section draft created
- section README created

이후 사용자는 다음 작업을 수행할 수 있다.

- draft 검토
- Codex와 수정 작업
- Notion 문서 작성
