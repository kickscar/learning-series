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

다만 모든 Section이 반드시 실습을 포함해야 하는 것은 아니다.

문서는 다음 두 흐름 중 Section 성격에 맞는 구조를 선택할 수 있다.

```
개념 이해
↓
Terraform configuration
↓
Terraform CLI 실행
↓
결과 확인
```

또는,

```
배경 개념
↓
핵심 이론
↓
비교 / 분류 / 구조 설명
↓
필요 시 예제 / 실습 / 참고 자료
```

가능한 실제 Terraform 사용 사례 기반 설명을 포함한다. 그러나 개념 중심 문서는 코드와 실습 없이도 완결된 형태를 가질 수 있다.


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


## 4. 문서 유형 구분

Section draft는 다음 유형 중 하나 또는 여러 유형의 조합으로 작성할 수 있다.

### 개념 중심 Section

- 배경 개념에서 시작
- 정의와 필요성 중심
- 비교적 코드 비중이 낮음
- 표, 분류, 참고 자료 활용 가능

예:

- IaC와 Terraform
- DevOps와 자동화 배경

### 비교 중심 Section

- 두 개 이상의 도구, 방식, 구조를 비교
- 표를 우선 활용
- 차이점, 장단점, 적용 기준 설명

예:

- CloudFormation vs Terraform
- Declarative vs Imperative

### workflow 중심 Section

- 단계별 실행 흐름 설명
- CLI, state, plan, apply, destroy 같은 실행 순서 강조
- 필요한 경우 Mermaid 사용

### 실습 중심 Section

- 예제 코드, 실행 명령, 결과 검증 포함
- 실습 목표와 포인트를 명확히 제시

### 운영/설계 중심 Section

- production 운영 기준
- 구조적 trade-off
- 보안, 협업, 품질, 환경 분리 같은 주제


## 5. 대상 독자 보정

이 시리즈의 독자는 AWS 기본 개념과 CloudFormation 입문 경험이 있는 엔지니어다.

따라서 다음 원칙을 따른다.

- VPC, Subnet, EC2, S3, IGW 같은 AWS 기본 개념을 장황하게 재설명하지 않는다.
- AWS 서비스의 동작 자체보다 Terraform이 그 리소스를 어떻게 모델링하고 관리하는지에 초점을 둔다.
- AWS 리소스 설명은 Terraform 개념 이해에 필요한 최소 수준으로 제한한다.
- CloudFormation은 비교 기준으로 활용할 수 있지만, CloudFormation 자체를 깊게 설명하지 않는다.
- 문서의 중심축은 항상 Terraform 개념, Terraform workflow, Terraform state, module, backend, lifecycle에 둔다.

예:

- `aws_vpc` 예제를 보여줄 수는 있지만 VPC 네트워크 설계 자체를 길게 설명하지 않는다.
- CloudFormation stack과 비교는 가능하지만 CloudFormation template 작성법 자체를 길게 다루지 않는다.


---

# Title and Section Rules

## 제목 규칙

제목(H1, H2)에는 **범주 또는 맥락**을 포함한다. 콜론(:)을 사용하여 부제를 추가할 수 있다.

제목 형식

{개념} : {비교 또는 구조}

예:

- Terraform Workflow : init → plan → apply
- Terraform State : Local State vs Remote Backend

Notion 초안 문서에서는 다음과 같은 제목 스타일도 허용한다.

- `# **개요**`
- `# **Terraform**`
- `## IaC 도구의 유형`
- `# 실습 목표`
- `# 핵심 포인트`


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

실습형 문서에서는 다음 소제목 패턴도 적극 사용할 수 있다.

- `핵심 포인트`
- `실습 목표`
- `구성 요소`
- `검증 포인트`
- `Stack 배포 및 검증` 대신 Terraform 문맥에서는 `실행 및 검증`

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

필요한 경우 blockquote는 한 문서에서 여러 번 사용할 수 있다. 다만 선언문, 핵심 정의, 중요한 전환 문장에만 사용한다.

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

실습 코드가 필요한 경우 복사하여 바로 실행할 수 있는 완전한 코드를 제공한다. 부분 코드 대신 가능한 전체 예제를 제공한다. 개념 중심 Section에서는 코드 없이 설명만으로 구성할 수 있다.

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

코드 예제는 필요한 경우에만 포함한다. Section 목표가 개념 이해 또는 비교 설명이라면 코드 블록을 생략할 수 있다.

코드 예제의 목적은 AWS 인프라 자체 설명이 아니라 Terraform 개념 설명이다.
  

---

# Diagram and Image Rules

## Mermaid 사용

아키텍처 구조나 workflow 설명에는 Mermaid 다이어그램을 사용할 수 있다.

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

# Table Usage Rules

표는 다음 상황에서 적극 사용한다.

- 도구 비교
- 개념 분류
- 핵심 구성 요소 정리
- 장단점 비교
- 절차 요약
- 검증 포인트 정리

예:

- IaC 도구 유형
- Declarative vs Imperative
- Terraform 핵심 구성 요소

표는 설명을 대체하는 것이 아니라 설명을 압축하고 명확하게 만드는 용도로 사용한다.

특히 경험자 독자를 대상으로 할 때 표는 기초 개념 재설명보다 비교 기준과 구조 요약을 빠르게 전달하는 용도로 사용한다.


---

# Reference Rules

최종 문서 수준에 가까운 draft를 작성할 때는 필요한 경우 `참고 자료` 섹션을 포함할 수 있다.

다음 경우 참고 자료를 권장한다.

- 입문 개념 Section
- 비교 개념 Section
- Terraform 공식 개념을 정리하는 Section
- 실무 운영 기준을 소개하는 Section

참고 자료는 가능한 1차 자료 또는 공식 문서를 우선한다.


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
