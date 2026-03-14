# Writing Rules

이 문서는 Terraform Basics 시리즈 문서 작성 시 적용되는 **기술 문서 작성 규칙(technical writing rules)**을 정의한다.

이 규칙은 다음 목적을 가진다.

- 문서 스타일 일관성 유지
- 기술 용어 표기 통일
- 실습 중심 교육 문서 작성 기준 제공
- Codex agent가 동일한 방식으로 문서를 생성하도록 가이드

이 규칙은 다음 작업에 적용된다.

- Section draft 작성
- Lab 설명 작성
- README 작성


---

# Language Policy

문서 설명은 **한국어**로 작성한다. 다만 다음 기술 용어는 **English 표기를 유지한다.**

예:

- Terraform
- HCL
- provider
- resource
- module
- Terraform state
- remote backend
- dependency graph
- plan
- apply
- destroy

## 혼합 표기 규칙

핵심 개념이 처음 등장할 때는 다음 형식을 사용한다.

- infrastructure as Code(IaC)
- 선언형 설정(declarative configuration)

단, 고유명사처럼 사용되는 기술 용어는 번역하지 않는다.

예:

- Web
- Internet
- NAT
- VPC
- Subnet
- EC2
- Terraform


---

# Document Writing Principles

Terraform Basics 문서는 다음 원칙을 따른다.

## 1. 실습 중심(practical learning)

이 시리즈는 **실습 중심 교육 콘텐츠**이다.

문서는 다음 흐름을 따른다.

```
개념 이해
↓
Terraform configuration
↓
Terraform CLI 실행
↓
결과 확인
```

가능한 실제 Terraform 사용 사례 기반 설명을 포함한다.


## 2. 기술 중심 서술

문서는 **건조한 기술 설명(technical description)**을 기본으로 한다. 다음 사항을 준수한다.

- 과도한 비유 사용 금지
- 추상적인 표현 사용 금지
- 마케팅 문체 사용 금지
- 기술 사실 중심 설명

목표는 **읽는 사람이 이해하도록 설명하는 것이 아니라 기술 자체를 정확히 서술하는 것**이다.


## 3. 개념 설명 방식

개념 설명은 다음 구조를 따른다.

```
정의
↓
필요성
↓
Terraform에서의 역할
↓
간단한 예시
```

설명 방식

- 서술형 문장 중심
- 필요 시 표, 리스트 활용
- 핵심 개념 설명용 코드 블록 사용 가능


---

# Title and Section Rules

## 제목 규칙

제목(H1, H2)에는 **범주 또는 맥락**을 포함한다. 콜론(:)을 사용하여 부제를 추가할 수 있다.

제목 형식

{개념} : {비교 또는 구조}

예:

- Terraform Workflow : init → plan → apply
- Terraform State : Local State vs Remote Backend


## 계층 깊이 제한

문서의 제목 계층은 최소화한다.

권장 구조

- H1 : Section title
- H2 : Main topic
- H3 : Sub topic

H4 이상 사용은 권장하지 않는다.

## 소제목 작성 방식

소제목 아래에서는 **문단 중심 설명**을 사용한다.

규칙

- 소제목 아래에는 최소 한 문단의 설명을 작성한다.
- 문단과 문단 사이에는 빈 줄을 둔다.

예:

```
    ### Terraform Resource 

    Terraform resource는 인프라 객체를 정의하는 가장 기본적인 구성 요소이다. Terraform configuration에서 resource 블록을 통해 실제 클라우드 인프라가 생성된다.
```

---

# Concept Emphasis

핵심 개념이 등장할 때는 **blockquote**를 사용하여 강조한다.

예:

```
    > Terraform은 Infrastructure as Code(IaC) 도구이다.
```

또는,

```
    > 이 구조가 Terraform의 dependency graph를 형성한다.
```

동일한 개념 설명이나 예시는 **한 문서에서 한 번만 설명**한다. 필요한 경우 다음 방식으로 참조한다.

```
    앞서 살펴본 Terraform workflow 예시와 같이
```

---

# Terminology Rules

기술 용어 표기 규칙은 다음을 따른다.

## 핵심 용어 강조

핵심 용어가 처음 등장할 때는 다음 형식을 사용한다.

- 상태(State)
- 모듈(Module)
- 프로바이더(Provider)

두 번째 등장 이후에는 한글 또는 영어 중 하나를 일관되게 사용한다.

## 약어 규칙

약어가 처음 등장할 때는 전체 명칭을 함께 표기한다.

예:

- Infrastructure as Code(IaC)
- Hypertext Transfer Protocol(HTTP)

## 영문 표기 규칙

영문 기술 용어는 **정확한 대소문자 표기**를 유지한다.

예:

```
HTTP/2
HTTPS
WebSocket
Terraform
AWS
```

# Code Block Rules

코드 블록 작성 시 다음 규칙을 따른다.

## 언어 태그

코드 블록에는 반드시 언어 태그를 명시한다.

예:

```markdown
    
    ```HCL

    ```
```


## 예제 코드에는 파일 경로를 주석으로 표시한다.

예:

```markdown
    # ./lab01/main.tf
```


## 실행 가능한 코드

실습 코드는 복사하여 바로 실행할 수 있는 완전한 코드를 제공한다. 부분 코드 대신 가능한 전체 예제를 제공한다. 개념이나 이론 설명에서 제시한 전체 코드가 너무 길면 내(사용자)가 노션 문서 작성 시 판단해서 줄이거나 발췌한다.

Terraform 코드 예제는 HCL 언어 태그를 사용한다.

```hcl
resource "aws_instance" "example" {
}
```

## 민감 정보 처리

민감 정보는 placeholder를 사용한다.

예:

```
your-api-key
your-secret-key
```

실제 API 키나 인증 정보는 문서에 포함하지 않는다.


## Cloud Provider for Examples

Terraform Basics 시리즈의 예제 코드와 Lab은 **AWS provider**를 기준으로 작성한다.

이 선택은 다음 이유 때문이다.

- AWS는 Terraform에서 가장 널리 사용되는 provider
- 예제 인프라 구성이 단순함
- 학습자가 AWS 환경에 익숙한 경우가 많음

예제 코드에서는 다음 Terraform resource를 사용한다.

- aws_instance
- aws_vpc
- aws_subnet
- aws_security_group
  

---

# Diagram and Image Rules

## Mermaid 사용

아키텍처 구조나 workflow 설명에는 Mermaid 다이어그램을 사용한다.

예:

```markdown
    ```mermaid
    graph TD
    terraformInit --> terraformPlan
    terraformPlan --> terraformApply
    ```
```

## Mermaid 작성 규칙

Mermaid 노드 ID에는 공백을 사용하지 않는다.

허용

```
terraformPlan
terraform_apply
```

비허용

```
terraform plan
terraform apply
```

## 다이어그램 설명

모든 다이어그램 또는 이미지는 하단에 한 줄 설명을 포함한다.

예:

```
Terraform workflow : init → plan → apply 흐름
```

## 이미지 대체 규칙

Mermaid로 표현하기 어려운 경우 다음 placeholder를 사용한다.

```
[다이어그램/이미지 추가: Terraform dependency graph 구조]
```

Notion 문서 작성 시 실제 내(사용자)가 이미지로 교체한다.


---

# Code Placement Rules

코드의 위치는 다음 기준을 따른다.

핵심 개념 설명에 필요한 코드는 해당 개념 섹션 안에 포함한다.

예:

```
### Terraform Resource

resource "aws_instance" "example" {
  ami           = "ami-1234"
  instance_type = "t3.micro"
}
```

이 코드는 개념 설명용 코드이다. 실습용 코드는 별도의 Lab 섹션에서 다룬다.


---

# Version Policy

문서 내용은 최신 Terraform 버전을 기준으로 작성한다.

구식 문법이나 deprecated 기능은 설명하지 않는다.

필요한 경우 다음과 같이 명시한다.

```
Terraform 1.x 기준
```

---

# Writing Consistency

문서는 다음 기준을 유지한다.

- 동일 개념은 동일한 용어로 표현
- 동일 예제는 중복 작성하지 않는다
- 코드 예제는 일관된 형식 유지

Terraform CLI 명령어는 동일한 방식으로 표기

예:

```
terraform init
terraform plan
terraform apply
```

항상 동일한 표기를 사용한다.