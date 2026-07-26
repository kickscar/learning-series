# Azure 리소스 네이밍 — Fundamentals (콘솔)

> Azure-Fundamentals(Portal 실습)용 리소스 네이밍 규칙. base인 **AWS-fund와 동등레벨 비교**로 원칙을 적는다.
> **규칙만 정리한다** — 교육적 서사·서술은 azure-fund 시리즈 문서에서 다룬다.
> 원칙: 형식 통일이 아니라 **Azure 구조에 맞는 정합한 네이밍**을 추구한다.

---

## 1. 왜 AWS와 다른가 — 구조 차이

Azure는 AWS에 없는 **두 컨테이너**를 가진다. 그래서 이름에서 조직·프로젝트 세그먼트를 뺀다.

| 개념 | AWS | Azure | 이름에 미치는 영향 |
|------|-----|-------|------------------|
| 조직 경계 | (account 암묵) | **Entra 테넌트**(암묵) | `{org}` 안 넣음 |
| 프로젝트 컨테이너 | **없음** | **Resource Group(명시)** | `{project}` 안 넣음 — RG가 담음 |

- AWS-fund: `aws-fund-gallery-vpc` (컨테이너 없음 → 이름이 `{org}-{project}`를 짊어짐)
- Azure-fund: RG `rg-gallery` 안의 `vnet` (테넌트+RG가 스코프 → 이름은 종류+정체성만, **type-first**)

**원리**: 이름이 짊어지는 양 = 그릇이 주지 않는 네임스페이스만큼. RG가 project를 담으므로 리소스 이름은 가벼워진다. Azure 관례(CAF, Cloud Adoption Framework)는 **리소스 종류를 앞에** 둔다.

---

## 2. 패턴

```
Resource Group : rg-{project}
리소스          : {capability}-{identity}
```

| 요소 | 값 | 설명 | 성격 |
|------|-----|------|------|
| `rg-{project}` | `rg-lab03`, `rg-gallery` | 프로젝트 컨테이너. project 스코프를 담당 | 절대 |
| `capability` | CAF 약어 (§3) | 리소스 종류 (type-first) | 절대 |
| `identity` | `public`/`web`… | 같은 capability가 여럿일 때 구분 (§4). 하나뿐이면 생략 | **추천(사용자 영역)** |

- project(`gallery`/`lab{NN}`)는 **리소스 이름에 넣지 않는다** — RG가 이미 담는다.
- 예: `vnet`, `snet-public`, `nsg-vm`, `vm-web`

> region/instance suffix(CAF 실무 관례)는 fund에서 생략한다(단일 리전·인스턴스). → `azure-iac-naming.md`.

---

## 3. Capability(type) 약어 — AWS ↔ Azure 대응

Azure는 **CAF 공식 약어**를 쓴다.

| 역할 | AWS | Azure(CAF) | 비고 |
|------|-----|-----------|------|
| 가상 네트워크 | `vpc` | `vnet` | |
| 서브넷 | `subnet` | `snet` | |
| 인터넷 게이트웨이 | `igw` | **—** | Azure는 명시적 IGW 없음(암묵 라우팅) |
| NAT 게이트웨이 | `natgw` | `ng` | |
| 방화벽(스테이트풀) | `sg` | `nsg` | Azure NSG는 subnet·NIC 모두 커버 |
| 네트워크 ACL | `nacl` | **—** | Azure는 NSG로 통합 |
| 라우트 테이블 | `rtb` | `rt` | UDR |
| 공용 IP | (EIP) | `pip` | Azure는 별도 리소스 |
| Private 연결 | `vpce` | `pep` | Private Endpoint |
| VM | `instance` | `vm` | |
| L4 로드밸런서 | (nlb) | `lb` | Azure Load Balancer |
| L7 로드밸런서 | `alb` | `agw` | Application Gateway |
| 오토스케일 | `asg` | `vmss` | VM Scale Set |
| 관계형 DB | `rds` | `mysql` / `sql` | Azure Database for MySQL / Azure SQL |
| 오브젝트 스토리지 | `s3bucket` | `st` | Storage Account (§4 제약) |
| 키 관리 | `kmskey` | `kv` | Key Vault (§4 제약) |
| 워크로드 신원 | `iamrole`/`iamprofile` | `id` | Managed Identity(Entra) |
| 컨테이너 레지스트리 | (ecr) | `cr` | ACR (§4 제약) |
| 컨테이너 앱 | (ecs) | `ca` | Container Apps |

> `igw`·`nacl`은 Azure에 **대응이 없다**(구조가 다름), `pip`·`agw`·`lb` 분리는 Azure 고유. 이 차이 자체가 두 클라우드의 구조 차이를 보여준다.

---

## 4. identity — 범주 · 리소스별 제약

### identity — 범주

`identity`는 같은 capability가 여럿일 때 구분하는 키워드다. 실무에서 대체로 아래 네 범주로 수렴한다(AWS와 동일).

| 범주 | 예시 |
|------|------|
| Target | `nsg-vm` (보호/연결 대상) |
| Type | `snet-public`, `snet-private` |
| Attr | `vm-web`, `vm-was` |
| Loc | `snet-web-a` (AZ) |

- **하나뿐이면 생략**한다: `vnet`, `ng`, `mysql`.
- 리소스마다 자연스러운 범주를 고른다(NSG=대상, 서브넷=유형, VM=속성). 특정 범주로 고정하지 않는다.
- project명(`gallery`/`lab{NN}`)은 identity가 아니다 — RG가 이미 담는다.

### Azure 고유 — 리소스별 이름 제약 (AWS엔 없음)

Azure는 **일부 리소스 이름을 플랫폼이 강제·거부**한다. 이 리소스들은 RG·테넌트 네임스페이스를 벗어나 **Azure 전역에서 유일**해야 하므로, 예외로 **project를 이름에 되살리고**(전역 식별), 충돌 시 **org를 tiebreaker**로 붙인다.

| 리소스 | type | 제약 | 기본 | 충돌 시 |
|--------|------|------|------|---------|
| Storage Account | `st` | 글로벌 고유 · 3–24자 · **소문자+숫자만(하이픈 불가)** | `stgallery` | `stgallery{org}` |
| Key Vault | `kv` | 글로벌 고유 · 3–24자 · 영숫자+하이픈 · 문자로 시작 | `kv-gallery` | `kv-gallery-{org}` |
| Container Registry | `cr` | 글로벌 고유 · 5–50자 · **영숫자만** | `crgallery` | `crgallery{org}` |

- `{org}` = 조직/계정 이름 = AWS account-id의 개념적 등가(전역 tiebreaker).
- **보장된 유일성**(GUID 등)은 이 규칙의 책임 밖이다 — 결정적 유일 토큰은 `azure-iac-naming.md`.
- project 복귀는 **전역 고유 리소스에 한정**된다. 일반 리소스(`vnet` 등)에 project를 넣는 건 이 예외가 아니라 그냥 중복이다.
- `st-gallery`처럼 하이픈 있는 이름은 st에서 **생성 불가** → `stgallery`로 붙여 쓴다.

---

## 5. 태그

- Portal에서 수동. `Project` 태그 권장.
- 그룹 관리는 **RG가 담당**하므로 태그 의존도가 AWS보다 낮다.
- Azure는 **리소스명 자체가 RG 내 식별자**라 `Name` 태그 개념이 약하다(리소스에 이미 이름이 있음).

---

## 6. 예시

**Section Lab (lab03)**
```
rg-lab03
  ├── vnet
  ├── snet-public
  ├── nsg-vm
  ├── pip-vm
  └── vm
```

**Gallery (횡단 프로젝트)**
```
rg-gallery
  ├── vnet
  ├── snet-public / snet-private
  ├── ng                    (NAT Gateway)
  ├── nsg-web
  ├── lb / agw
  ├── vm-web
  ├── mysql                 (Azure Database for MySQL)
  ├── stgallery             (Storage Account — 전역 고유, 하이픈 불가)
  └── kv-gallery            (Key Vault — 전역 고유)
```
