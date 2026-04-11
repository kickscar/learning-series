# 코드 블록 규칙

## 언어 지정

모든 코드 블록에 언어를 명시한다:

| 용도 | 언어 | 예시 |
|------|------|------|
| Terraform 코드 | `hcl` | provider, resource, variable 정의 |
| 셸 명령어 | `bash` | terraform, az CLI 명령어 |
| 명령어 출력 | `text` | plan 결과, CLI 출력 |
| JSON 데이터 | `json` | tfstate, az CLI JSON 출력 |
| YAML 설정 | `yaml` | GitHub Actions 워크플로우 |
| 다이어그램 | `mermaid` | 아키텍처, 흐름도 |
| Java 코드 | `java` | Azure SDK 예제 (Ch01 한정) |
| 파일 트리 | `text` | 디렉토리 구조 |

## 이론 섹션

- 개념 설명용 코드는 `hcl` 또는 `text` 사용
- 실행 불가능한 예시 코드는 `text` 사용

## Lab 섹션

### HCL 코드

```hcl
resource "azurerm_resource_group" "main" {
  name     = "${var.project}-${var.env}-platform-rg-main"
  location = var.location

  tags = local.common_tags
}
```

- 인라인 주석 넣지 않음 — 설명은 코드 블록 아래에 작성
- 파일 단위로 전체 코드 제시 (부분 발췌 지양)

### 명령어와 출력 분리

명령어:
````
```bash
terraform plan
```
````

출력:
````
```text
Plan: 3 to add, 0 to change, 0 to destroy.
```
````

- 명령어와 출력을 하나의 코드 블록에 섞지 않음

### az CLI 확인

```bash
az group show --name azure-iac-lab06-dev-platform-rg-main --output table
```

```text
Name                                    Location       Status
--------------------------------------  -------------  ---------
azure-iac-lab06-dev-platform-rg-main    koreacentral   Succeeded
```

## 인라인 코드

- 파일명, 속성, 명령어, 리소스 주소에 백틱 사용
- 예: `main.tf`, `location`, `terraform init`, `azurerm_virtual_network.main`

## 민감 정보

- 시크릿, 패스워드는 `xxx` 또는 `{설명}`으로 표시
- 예: `ARM_CLIENT_SECRET=xxxxxxxx`, `password = "{Key Vault에서 참조}"`
