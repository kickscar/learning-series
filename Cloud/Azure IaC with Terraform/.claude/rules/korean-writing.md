# 한국어 작문 규칙

## 기본 원칙

- 문서는 **한국어**로 작성한다
- 기술 용어는 **영문 유지**한다

## 영문 용어 처리

### 첫 등장 시

영문과 한국어를 함께 표기한다:

```
State (상태 파일)을 Remote Backend (원격 저장소)에 저장한다.
```

### 이후 사용

영문만 사용한다:

```
State를 업데이트하면 Remote Backend에 반영된다.
```

### 번역 금지 용어

아래 용어는 한국어로 번역하지 않고 영문 그대로 사용한다:

**Terraform 용어**:
Provider, Resource, State, Module, Workspace, Backend, Variable, Locals, Output,
HCL, Plan, Apply, Destroy, Init, Data Source, Provisioner, Lifecycle

**Azure 용어**:
Resource Group, Subscription, Management Group, Entra ID, Managed Identity,
RBAC, Service Principal, VNet, Subnet, NSG, NAT Gateway, Load Balancer,
Application Gateway, VM Scale Set, Storage Account, Blob, Key Vault,
Container Registry, Container Apps, Private Endpoint, Private DNS Zone,
Availability Zone, Workload Identity Federation, OIDC

**CLI/도구 용어**:
az CLI, terraform, GitHub Actions, CI/CD, YAML, JSON

## 문체

### 사용하는 문체

**~다 체** (서술체)를 사용한다:

```
✓ Resource Group은 Azure 리소스의 논리적 컨테이너다.
✓ Managed Identity를 사용하면 시크릿 관리가 불필요하다.
✓ 다음 섹션에서 VNet을 구성한다.
```

### 금지 문체

```
✗ ~하십시오 (경어체)
✗ ~해주세요 (요청체)
✗ ~할 수 있습니다 (격식체)
✗ ~해봅시다 (청유체)
```

## 숫자·단위

- 숫자는 아라비아 숫자: 3개, 10.0.0.0/16
- 포트는 숫자: 8080, 443
- 버전은 원문 그대로: azurerm 4.x, Terraform 1.14.x
