# 네이밍 & 태깅 규칙

## 핵심 원칙

**Azure CAF (Cloud Adoption Framework) 네이밍 컨벤션을 따른다.**

Azure는 Resource Group이 리소스의 네임스페이스 경계 역할을 한다. RG가 프로젝트·환경·맥락을 담고 있으므로, RG 안의 리소스는 짧고 명확한 이름이면 충분하다.

---

## Resource Group — 네임스페이스 경계

```
--- rg-azure-iac-lab04 ----------- (sandbox)

  vnet-base
  subnet-web
  subnet-private
  nsg-vm-web
  vm-web

-----------------------------------
```

RG 이름이 프로젝트(`azure-iac`)와 맥락(`lab04`)을 담고 있으므로, 내부 리소스에 이를 반복하지 않는다.

## 네이밍 패턴

### RG 레벨

```
rg-{project}-{context}
```

| 용도 | context | 예시 |
|------|---------|------|
| Section Lab | `lab{no}` | `rg-azure-iac-lab04` |
| Gallery (단일 환경) | `gallery` | `rg-azure-iac-gallery` |
| Gallery (환경 분리, Ch07~) | `gallery-{env}` | `rg-azure-iac-gallery-dev`, `rg-azure-iac-gallery-prod` |

### 리소스 레벨 (RG 내부)

```
{type}-{role}
```

CAF 약어를 prefix로 사용하고, 역할(role)을 붙인다:

| 예시 | 설명 |
|------|------|
| `vnet-base` | 기본 VNet |
| `subnet-web` | 웹 서브넷 |
| `subnet-private` | 프라이빗 서브넷 |
| `nsg-vm-web` | vm-web에 연결된 NSG |
| `vm-web` | 웹 서버 VM |
| `pip-agw` | Application Gateway용 Public IP |
| `agw-web` | 웹 트래픽용 Application Gateway |
| `id-gallery` | Gallery용 Managed Identity |

### 전역 고유 리소스

Storage Account, Key Vault, ACR은 Azure 전체에서 유니크해야 한다. 하이픈 제약이 있는 리소스는 CAF 권장에 따라 처리한다:

| 리소스 | 제약 | 예시 |
|--------|------|------|
| Storage Account | 영소문자+숫자, 하이픈 불가, 3~24자 | `stazureiaclab23` |
| Key Vault | 영숫자+하이픈, 3~24자 | `kv-azure-iac-gallery-dev` |
| ACR | 영숫자만, 하이픈 불가, 5~50자 | `acrazureiacgallery` |

---

## CAF 리소스 약어

> [Azure CAF — Resource abbreviations](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations) 참조

이 시리즈에서 사용하는 주요 약어:

| Full Name | 약어 |
|-----------|------|
| Resource Group | `rg` |
| Virtual Network | `vnet` |
| Subnet | `subnet` |
| Network Security Group | `nsg` |
| NAT Gateway | `natgw` |
| Public IP | `pip` |
| Private Endpoint | `pe` |
| Private DNS Zone | `pdnsz` |
| Load Balancer | `lb` |
| Application Gateway | `agw` |
| Virtual Machine | `vm` |
| VM Scale Set | `vmss` |
| Managed Identity | `id` |
| Key Vault | `kv` |
| Storage Account | `st` |
| MySQL Flexible Server | `mysql` |
| Container Registry | `acr` |
| Container Apps | `ca` |
| Container Apps Environment | `cae` |

---

## 태그 구조

### 기본 태그 (Ch03~)

```hcl
locals {
  common_tags = {
    Project   = "azure-iac"
    Env       = var.env
    ManagedBy = "terraform"
  }
}
```

### 확장 태그 (Ch07~ 구조화 이후)

```hcl
locals {
  common_tags = {
    Project   = "azure-iac"
    Env       = var.env
    Layer     = var.layer
    ManagedBy = "terraform"
  }
}
```

---

## 참고

- [Azure CAF — Resource abbreviations](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)
- [Azure CAF — Naming rules and restrictions](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules)
