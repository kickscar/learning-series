# Section Lab 템플릿

## 기본 구조

```
# [실습] lab{no}: {제목}

### 실습 목표

- {목표 1}
- {목표 2}
- {목표 3}

# 1. 전체 아키텍처

{mermaid 다이어그램 — 이 Lab에서 생성하는 리소스 구성}

{2~4줄 설명}

# 2. 사전 준비

- Terraform: 1.14.x 이상
- azurerm provider: ~> 4.x
- Azure 리전: **`koreacentral`**
- 이전 Lab 리소스: {필요 시 명시}

디렉토리 구조:

```text
lab{no}/
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
└── terraform.tfvars
```

# 3. {첫 번째 작업}

## providers.tf

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}
```

{설명}

## variables.tf

```hcl
variable "project" {
  type    = string
  default = "azure-iac"
}
```

{설명}

## main.tf

```hcl
resource "azurerm_resource_group" "main" {
  name     = "${var.project}-lab{no}-${var.env}-platform-rg-main"
  location = var.location
  tags     = local.common_tags
}
```

{설명}

# 4. {추가 작업} (필요 시)

{파일별 코드 + 설명}

# n. 배포

## terraform init

```bash
terraform init
```

```text
Initializing the backend...
...
Terraform has been successfully initialized!
```

## terraform plan

```bash
terraform plan
```

```text
Plan: {n} to add, 0 to change, 0 to destroy.
```

## terraform apply

```bash
terraform apply
```

```text
Apply complete! Resources: {n} added, 0 changed, 0 destroyed.
```

# n+1. 결과 확인

## terraform output

```bash
terraform output
```

```text
resource_group_name = "azure-iac-lab{no}-dev-platform-rg-main"
```

## az CLI 확인

```bash
az group show --name azure-iac-lab{no}-dev-platform-rg-main --output table
```

```text
Name                                     Location       Status
---------------------------------------  -------------  ---------
azure-iac-lab{no}-dev-platform-rg-main   koreacentral   Succeeded
```

# n+2. 자원 정리

> 이 Lab의 리소스를 다음 Lab에서 사용하는 경우, 이 단계는 건너뛴다.

## terraform destroy

```bash
terraform destroy
```

```text
Destroy complete! Resources: {n} destroyed.
```
```

## 서식 규칙

- HCL 코드에 인라인 주석 넣지 않음 — 설명은 코드 블록 아래
- 명령어(`bash`)와 출력(`text`) 코드 블록 분리
- 민감 정보: `xxx` 또는 `{설명}`으로 표시
- 자원 정리 섹션: 챕터 내 누적 Lab이면 건너뛰기 안내
