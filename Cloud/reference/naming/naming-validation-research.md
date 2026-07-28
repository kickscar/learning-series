# 네이밍 체계 정합성 검증 — 업계 관행 대조

> 조사일: 2026-07-28
> 질문: "다른 회사도 이렇게 하나? 우리 azure-fund 네이밍 체계가 정합적인가?"
> 대상: `azure-fund-naming.md`의 규칙을 업계 표준·비평·도구와 대조.

---

## 우리 체계 요약

```
{capability}-{project}-{identity}
```
type-first · project 항상 · org 생략(테넌트) · env·layer 생략(fund) · RG=논리 경계.

---

## 설계 선택별 검증

### 1. CAF 패턴과의 정합 — ✅ 표준의 정합한 부분집합

업계 사실상 표준은 Microsoft CAF 패턴이다.
```
{type}-{workload}-{environment}-{region}-{instance}
예: pip-sharepoint-prod-westus-001
```
Terraform CAF 네이밍 모듈(Azure/terraform-azurerm-naming, Build5Nines)과 Azure Policy로 자동 생성·강제되는, 널리 채택된 표준이다. 우리 `{capability}-{project}-{identity}`는 이 표준에서 **env·region을 뺀 truncation**이다. → 표준의 부분집합으로 정합.

### 2. Type-first — ✅ CAF 정본, 단 업계가 갈리는 지점 (우리는 RG로 해소)

- **CAF 공식 = type-first(prefix)**, 명시 근거는 "리소스가 종류별로 정렬되게".
- **그러나 반론이 실재한다**: type-first는 포털에서 "무엇인가(type)"로 정렬돼 "무엇에 속하나(workload)" 그룹핑을 깬다는 비판이 있고(실무 블로그 다수), 일부는 **suffix(workload-first)** 를 권장한다. Azure 공식 Terraform 모듈도 suffix 옵션을 제공한다.
- **우리 입장**: type-first(CAF)를 택하되, 그 단점(workload 그룹핑 깨짐)을 **RG로 상쇄**한다. 모든 workload 리소스가 `rg-{workload}`에 모이므로, RG 안에서는 이미 workload로 스코프되어 type-first 정렬이 문제되지 않는다. 즉 **논쟁을 인지하고 RG-scoping으로 해소한 의식적 선택**이다.

### 3. RG = 논리 경계 (핵심 전제) — ✅ Microsoft 문서로 확증

우리 전제의 근간이 벤더 문서로 뒷받침된다. Microsoft 명시:
> "resource group은 **네트워크 격리를 제공하지 않는다**. **Virtual Network가 트래픽 격리 경계**다."

이름은 RG 내에서만 유일하고, 크로스-RG 연관은 태그로 잇는다. → "RG는 논리 경계라 이름이 자기서술해야 한다"는 우리 논리는 Microsoft의 격리 모델 문서와 일치한다.

### 4. org 생략 — ✅ 단일 테넌트/중소 규모 관행

- "organization은 최상위 management group으로 쓰거나, **중소 조직에선 이름의 일부**로 쓴다."
- "company·department는 **대규모** 조직이 사업부 간 네임스페이스가 필요할 때의 확장."

→ 단일 테넌트 학습 시리즈에서 org를 이름에서 빼고 테넌트/구독에 맡기는 것은 표준 관행 범위. (대규모 조직만 이름에 넣음.)

### 5. env·layer 생략 (fund) — ✅ 단순 컨텍스트 축약으로 인정

- "단순 환경에선 resource type·region을 이름에서 빼고 타입·태그에 의존"하는 접근이 관행으로 언급됨.
- 단순 환경엔 workload·environment 정도만 쓰는 축약도 인정.

→ fund(콘솔·단일 환경)에서 env·region·layer를 빼고 IaC 시리즈로 이연하는 것은 컨텍스트에 맞는 인정된 축약.

---

## 의식적 divergence (인지된 차이)

1. **싱글턴 instance 번호 생략**: CAF/실무는 "하나뿐이라도 `-001`을 붙여 두면 두 번째가 생겨도 rename 불필요"(Azure 이름 대부분 **immutable**)를 권장한다. 우리는 하나뿐이면 identity를 생략한다(`vnet-gallery`). **교육 명료성을 우선한 의도적 차이.** 프로덕션에선 번호가 immutability hedge가 된다.
2. **서술형 identity vs 번호 instance**: 우리 identity(`web`/`private`)는 CAF의 번호 instance와 다르나, CAF 자신도 서브넷 예시에서 purpose 서술어(`web` 등)를 쓴다 → CAF의 유연 범위 안.

---

## 결론

우리 체계는 **CAF 정본과 강하게 정합**하며 **내부적으로 일관**하다.

- 핵심 전제(**RG=논리 경계**)는 벤더 문서로 확증됨.
- **type-first**는 업계가 갈리는 지점이나, RG-scoping으로 단점을 해소한 의식적 선택.
- **축약**(org·env·layer 제외)은 단일 테넌트·콘솔·단일 환경이라는 컨텍스트에 맞는 인정된 관행.
- 유일한 실질 divergence(**싱글턴 번호 생략**)는 교육 목적의 의도된 단순화.

**"다른 회사도 이렇게 하나?"의 답**: 그렇다 — CAF를 따르는 곳이 표준이고 우리도 그 궤도 위에 있다. 다만 **type-first는 업계가 둘로 갈리는 지점**이라, 우리는 그것을 RG-scoping으로 정리했다.

---

## 출처

- [Define your naming convention — CAF](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming)
- [Abbreviation examples for Azure resources — CAF](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)
- [Naming rules and restrictions for Azure resources](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules)
- [Isolation in the Azure Public Cloud (VNet = 트래픽 경계, RG ≠ 네트워크 격리)](https://learn.microsoft.com/en-us/azure/security/fundamentals/isolation-choices)
- [Azure/terraform-azurerm-naming (공식 TF 네이밍 모듈)](https://github.com/Azure/terraform-azurerm-naming)
- [Build5Nines/terraform-azure-naming](https://github.com/Build5Nines/terraform-azure-naming)
- [Stop Naming Your Azure Resources Like It's 2010 (prefix vs suffix 비평)](https://medium.com/@byronbayer/stop-naming-your-azure-resources-like-its-2010-5dbde06099d8)
