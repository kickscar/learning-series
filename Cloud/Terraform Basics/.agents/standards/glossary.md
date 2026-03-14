# Glossary

이 문서는 Terraform Basics 시리즈에서 사용하는 **기술 용어 표기 기준**을 정의한다.

목적

- 문서 전체에서 동일한 용어 사용
- Terraform / IaC 개념 표기 통일
- Codex agent가 일관된 용어로 문서를 작성하도록 지원

설명 규칙

- 정의는 **간결하게 작성**
- 기본 표기(form)를 명시
- 번역하지 않는 용어는 명시한다


---

# Terraform Core

### Terraform

Infrastructure as Code(IaC) 도구.

기본 표기

`Terraform`

번역하지 않는다.

---

### HCL

Terraform configuration 언어.

전체 명칭

`HashiCorp Configuration Language(HCL)`

기본 표기

`HCL`

---

### provider

Terraform이 특정 플랫폼(AWS, Azure, GCP 등)과 상호작용하도록 하는 플러그인.

기본 표기

`provider`

번역하지 않는다.

---

### resource

Terraform configuration에서 관리되는 인프라 객체.

예

- EC2 instance
- VPC
- S3 bucket

기본 표기

`resource`

---

### data source

이미 존재하는 인프라 정보를 조회하는 Terraform 구성 요소.

기본 표기

`data source`


---

# Terraform Configuration

### configuration

Terraform에서 인프라를 정의하는 코드.

기본 표기

Terraform configuration

---

### variable

Terraform configuration에서 사용하는 입력 변수.

기본 표기

input variable

---

### output

Terraform configuration 실행 결과로 노출되는 값.

기본 표기

`output`

---

### local value

Terraform configuration 내부에서 정의되는 지역 변수.

기본 표기

`local value`

---

# Terraform CLI

### terraform init

Terraform 작업 디렉토리를 초기화하는 명령.

기본 표기

`terraform init`

---

### terraform plan

실제 변경 적용 전에 인프라 변경 계획을 생성하는 명령.

기본 표기

`terraform plan`

---

### terraform apply

Terraform configuration을 실행하여 인프라를 생성하거나 수정하는 명령.

기본 표기

`terraform apply`

---

### terraform destroy

Terraform이 관리하는 인프라를 삭제하는 명령.

기본 표기

`terraform destroy`

---

# Terraform State

### Terraform state

Terraform이 관리하는 인프라 상태 정보.

기본 표기

`Terraform state`

---

### state file

Terraform state가 저장되는 파일.

기본 표기

`state file`

---

### remote backend

Terraform state를 원격 저장소에 저장하는 backend.

예

- S3
- Terraform Cloud

기본 표기

`remote backend`

---

### local backend

state file을 로컬 파일로 저장하는 backend.

기본 표기

`local backend`

---

### state locking

여러 사용자가 동시에 Terraform state를 수정하지 못하도록 하는 보호 메커니즘.

기본 표기

`state locking`

---

# Terraform Architecture

### dependency graph

Terraform이 resource 간 의존 관계를 분석하여 생성하는 실행 그래프.

기본 표기

`dependency graph`

---

### idempotency

같은 configuration을 여러 번 실행해도 동일한 상태가 유지되는 특성.

기본 표기

`idempotency`

---

### drift

실제 인프라 상태가 Terraform state와 다른 상태.

기본 표기

`drift`

---

# Terraform Modules

### module

Terraform configuration을 재사용 가능한 단위로 구성한 구조.

기본 표기

`Terraform module`

---

### root module

Terraform 실행 디렉토리의 최상위 module.

기본 표기

`root module`

---

### child module

다른 module에서 호출되는 module.

기본 표기

`child module`

---

# Infrastructure as Code

### Infrastructure as Code(IaC)

인프라 구성을 코드로 관리하는 방식.

기본 표기

`Infrastructure as Code(IaC)`

---

### declarative configuration

원하는 인프라 상태를 선언적으로 정의하는 방식.

기본 표기

`선언형 설정(declarative configuration)`

---

### imperative configuration

실행 순서를 명령 형태로 정의하는 방식.

기본 표기

`imperative configuration`

---

# AWS Infrastructure Terms

Terraform Basics 실습 예제는 **AWS 환경을 기준으로 작성된다.**

다음 용어는 번역하지 않는다.

---

### VPC

Virtual Private Cloud.

기본 표기

`VPC`

---

### Subnet

VPC 내부 네트워크 세그먼트.

기본 표기

`Subnet`

---

### Internet Gateway

VPC와 Internet 연결을 제공하는 게이트웨이.

기본 표기

`Internet Gateway`

---

### NAT Gateway

Private Subnet이 Internet에 접근하도록 하는 게이트웨이.

기본 표기

`NAT Gateway`

---

### Security Group

인스턴스 수준의 방화벽.

기본 표기

`Security Group`

---

### EC2

Elastic Compute Cloud.

기본 표기

`EC2`

---

### S3

Simple Storage Service.

기본 표기

`S3`

---

# Cloud Computing Terms

### cloud computing

인터넷을 통해 컴퓨팅 자원을 제공하는 서비스 모델.

기본 표기

`cloud computing`

---

### region

클라우드 서비스가 제공되는 지리적 위치.

기본 표기

`region`

---

### availability zone

region 내부의 독립된 데이터센터 그룹.

기본 표기

`availability zone`

약어

`AZ`

---

# Terminology Rules

다음 규칙을 따른다.

- 동일 개념은 항상 동일한 용어 사용
- 고유 기술 용어는 번역하지 않는다
- 약어는 첫 등장 시 전체 명칭 병기
- Terraform CLI 명령은 항상 동일한 표기 사용

예

```
terraform init
terraform plan
terraform apply
```

---

# Usage Rules

문서 작성 시 다음 규칙을 따른다.

- glossary에 정의된 용어를 우선 사용한다.
- 동일 개념에 다른 용어를 사용하지 않는다.
- glossary에 없는 용어가 등장하면 glossary에 추가한다.