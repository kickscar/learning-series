# Azure 리소스 네이밍 — Fundamentals (콘솔)

> azure-fund(Portal 실습)용 리소스 네이밍 규칙. **규칙만 정리한다** — 교육적 서사는 시리즈 문서에서 다룬다.
> base인 **AWS-fund와 동등레벨 비교**로 원칙을 적는다. 원칙: 형식 통일이 아니라 **Azure 구조에 맞는 정합한 네이밍**.

---

## 1. 하나의 하이라키, 시리즈별 파생

모든 클라우드 네이밍은 **하나의 포함(containment) 계층**을 훑는 것이다. 넓은 것이 좁은 것을 담는다.

```
org ⊃ project ⊃ env ⊃ layer ⊃ capability ⊃ identity
(가장 넓음/안정)                              (가장 좁음/구체)
```

각 시리즈는 여기서 **(어느 세그먼트를 포함하나) + (어느 끝에 앵커하나)** 두 가지로 갈린다.

| 시리즈 | 패턴 | 앵커 |
|--------|------|------|
| aws-fund | `{org}-{project}-{capability}-{identity}` | org (하강) |
| aws-iac | `{org}-{project}-{env}-{layer}-{capability}-{identity}` | org (하강) |
| **azure-fund** | **`{capability}-{project}-{identity}`** | **capability (CAF)** |
| azure-iac | (추후 확정 — env·layer/region 포함) | capability |

- **AWS는 org를 왼쪽에 앵커**해 내려온다(이름 = 주소/path). 컨테이너가 account뿐이라 org·project를 **이름이 짊어진다.**
- **Azure/CAF는 capability를 맨 앞으로** 당긴다(이름 = "나는 무엇인가" 선언, 종류별 정렬 목적). `테넌트 ⊃ 구독 ⊃ RG`가 상위 계층을 담아 **이름이 상위에서 해방**된다.
- 둘의 차이는 "완전 역순"이 아니라 **타입 토큰만 맨 앞으로 이동**한다는 것. 나머지 순서(넓은→좁은)와 **identity-마지막**은 공유한다.

---

## 2. azure-fund 파생 — 무엇을 빼나

Azure full(capability 앵커)에서 fund가 세 세그먼트를 뺀다.

```
{capability}-{org}-{project}-{env}-{layer}-{identity}   ← Azure full
   ─ org    : 테넌트가 담는 하드 경계        → 뺀다
   ─ env    : fund는 배포/환경을 안 다룸      → azure-iac 몫
   ─ layer  : IaC(모듈·state) 개념, 콘솔엔 메커니즘 없음 → azure-iac 몫
= {capability}-{project}-{identity}
```

**하드/소프트 원리 (왜 org는 빼고 project는 남기나):**
- `org`의 그릇(**테넌트/구독**)은 인프라를 진짜로 격리하는 **하드 경계** → 믿고 이름에서 뺀다.
- `project`의 그릇(**RG**)은 **논리 경계**다(수명주기·RBAC·과금만, 네트워크/인프라는 안 가름). 게다가 lab들이 전역 뷰에서 공존한다 → 그래서 **이름이 자기서술**한다(project를 남긴다).

> `layer`를 fund에 넣지 않는 이유: layer = Module(코드 모듈·state 경계)이라 콘솔엔 그 메커니즘이 없다. 이름에 박아도 라벨이 하는 일이 없다. fund의 평평한 `rg-gallery`는 그대로 두고, **레이어링·재사용은 그것이 진짜 값을 갖는 azure-iac에서** 다룬다(fund→iac 브릿지).

---

## 3. 패턴

```
Resource Group : rg-{project}
리소스          : {capability}-{project}[-{identity}]
```

| 요소 | 값 | 성격 |
|------|-----|------|
| `rg-{project}` | `rg-lab13`, `rg-gallery` | 절대 |
| `capability` | CAF 약어 (§4), type-first | 절대 |
| `project` | `lab{NN}` / `gallery` | **모든 리소스에 항상** |
| `identity` | Target/Type/Attr/Loc (§5), 하나뿐이면 생략 | 추천(사용자 영역) |

- **평면 원칙**: 부모-자식(vnet↔snet)을 따지지 않는다. subnet도 project를 그대로 갖는다 → `snet-gallery-private`. **계층 상속 규칙 없음.**
- 예: `vnet-lab13`, `snet-gallery-public`, `vm-gallery-web`, `nsg-lab13-vm`

---

## 4. Capability(type) 약어 — AWS ↔ Azure(CAF)

| 역할 | AWS | Azure(CAF) | 비고 |
|------|-----|-----------|------|
| 가상 네트워크 | `vpc` | `vnet` | |
| 서브넷 | `subnet` | `snet` | |
| 인터넷 게이트웨이 | `igw` | **—** | Azure는 암묵 라우팅 |
| NAT 게이트웨이 | `natgw` | `ng` | |
| 방화벽(스테이트풀) | `sg` | `nsg` | Azure NSG는 subnet·NIC 통합 |
| 네트워크 ACL | `nacl` | **—** | NSG로 통합 |
| 라우트 테이블 | `rtb` | `rt` | UDR |
| 공용 IP | (EIP) | `pip` | 별도 리소스 |
| Private 연결 | `vpce` | `pep` | Private Endpoint |
| VM | `instance` | `vm` | |
| VM 이미지 | (ami) | `img` | Compute Gallery 이미지 |
| L4 로드밸런서 | (nlb) | `lb` | Azure Load Balancer |
| L7 로드밸런서 | `alb` | `agw` | Application Gateway |
| 오토스케일 | `asg` | `vmss` | VM Scale Set |
| 관계형 DB | `rds` | `mysql` / `sql` | Azure DB for MySQL / Azure SQL |
| 오브젝트 스토리지 | `s3bucket` | `st` | Storage Account (§7) |
| 키 관리 | `kmskey` | `kv` | Key Vault (§7) |
| 워크로드 신원 | `iamrole` | `id` | Managed Identity |
| 컨테이너 레지스트리 | (ecr) | `cr` | ACR (§7) |
| 컨테이너 앱 | (ecs) | `ca` | Container Apps |

---

## 5. identity — 범주

같은 capability가 같은 project 안에 여럿일 때 구분하는 키워드. 네 범주로 수렴(AWS와 동일).

| 범주 | 예시 |
|------|------|
| Target | `nsg-lab13-vm` (보호/연결 대상) |
| Type | `snet-gallery-public`, `snet-gallery-private` |
| Attr | `vm-gallery-web`, `vm-gallery-was` |
| Loc | `snet-gallery-web-a` (AZ) |

- **하나뿐이면 생략**: `vnet-gallery`, `ng-gallery`, `lb-lab13`.
- 리소스마다 자연스러운 범주를 고른다. 특정 범주로 고정하지 않는다.

---

## 6. 하위 구성(sub-config) — 부모에 담김

LB/AGW의 내부 구성(frontend IP config, backend pool, health probe, load-balancing/routing rule, listener, backend settings)은 **RG 평면의 리소스가 아니라 부모 리소스(`lb-gallery`)의 속성**이다. 이미 이름 있는 부모 안에 있으므로 **project를 붙이지 않고 기능명으로** 쓴다.

```
feip-lb, bepool-web, probe-http, rule-http, listener-http, beset-http
```

---

## 7. 전역 고유 (st / kv / cr)

project를 항상 이름에 넣으므로, 더 이상 "예외로 project 복귀"가 아니다(그냥 규칙). 남는 특수 처리는 둘뿐이다.

- **문자 제약**: `st`·`cr`은 소문자+숫자, **하이픈 불가**. `kv`는 하이픈 가능.
- **충돌 tiebreaker**: 테넌트에서 딴 **짧은 org 코드(4~6자)**를 붙인다. (테넌트 GUID는 길이·하이픈 때문에 못 들어감.)

| 리소스 | type | 제약 | 기본 | 충돌 시 |
|--------|------|------|------|---------|
| Storage Account | `st` | 3–24, 소문자+숫자 | `stgallery`, `stlab17` | `stgallery{code}` |
| Key Vault | `kv` | 3–24, 영숫자+하이픈 | `kv-gallery` | `kv-gallery-{code}` |
| Container Registry | `cr` | 5–50, 영숫자 | `crgallery` | `crgallery{code}` |

---

## 8. SSH 키 (로컬 아티팩트)

키는 Azure 리소스가 아니라 로컬 `.pem` 파일이다. 패턴에 맞춰 `key-{project}`로 쓴다(프로젝트당 하나면 identity 생략).

```
key-lab13, key-gallery
```

---

## 9. 태그

- Portal 수동. `Project` 태그 권장.
- 이름이 이미 project를 담으므로 태그 의존도는 낮다.

---

## 10. 예시

**Section Lab (lab13)**
```
rg-lab13
  ├── vnet-lab13
  ├── snet-lab13-web
  ├── nsg-lab13-web
  ├── vm-lab13-web-1 / vm-lab13-web-2
  ├── lb-lab13            (feip-lb · bepool-web · probe-http · rule-http)
  ├── pip-lab13-lb
  └── key-lab13           (로컬 .pem)
```

**Gallery (횡단 프로젝트)**
```
rg-gallery
  ├── vnet-gallery
  ├── snet-gallery-public / snet-gallery-private
  ├── ng-gallery,  pip-gallery-ng
  ├── nsg-gallery-web
  ├── vm-gallery-web,  img-gallery-web
  ├── lb-gallery / agw-gallery,  pip-gallery-lb / pip-gallery-agw
  ├── vmss-gallery-web
  ├── stgallery           (전역 고유, 충돌 시 stgallery{code})
  └── key-gallery         (로컬 .pem)
```

---

## 11. AWS ↔ Azure 대응 (자기서술 공유)

| AWS-fund | Azure-fund |
|----------|------------|
| `aws-fund-lab13-vpc` | `vnet-lab13` |
| `aws-fund-lab13-subnet-public-a` | `snet-lab13-public` |
| `aws-fund-lab13-sg-instance` | `nsg-lab13-vm` |
| `aws-fund-gallery-natgw` | `ng-gallery` |
| `aws-fund-gallery-instance-web` | `vm-gallery-web` |

공통: **project가 항상 이름에**(자기서술). 차이: type 위치(AWS 뒤 / Azure 앞), org(AWS 포함 / Azure 생략 — 테넌트).
