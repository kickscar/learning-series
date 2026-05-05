# Rule: naming-tagging

리소스 네이밍과 태깅 규칙. 모든 lab·gallery 예제에 적용한다.

---

## 핵심 원칙

리소스 이름의 완성형 패턴:

```
{org}-{project}-{env}-{layer}-{capability}-{identity}
```

| 세그먼트 | 설명 | 예 |
|---------|------|----|
| `org` | 최상위 식별자. 현업에서는 organization, team, product에 대응. 이 시리즈에서는 시리즈명 `tf-core`를 org로 사용 | `tf-core` |
| `project` | 실습/프로젝트 식별자. 현업에서는 project, service에 대응 | `lab01`, `gallery` |
| `env` | 배포 환경 | `dev`, `prod` |
| `layer` | 아키텍처 계층 | `network`, `platform`, `workload` |
| `capability` | 리소스 종류 약어 | `sg`, `instance`, `vpc`, `rds` |
| `identity` | 리소스 정체성 키워드 | `instance`, `private-a`, `web` |

이 패턴이 처음부터 완성형으로 등장하지 않는다. Terraform의 `locals` 블록을 활용해 **namespace**로 조립하며, 챕터가 진행될수록 namespace가 확장된다.

---

## namespace — 점진적 확장

Terraform 코드에서 리소스 이름은 항상 이 구조다:

```
{namespace}-{capability}-{identity}
```

`{namespace}`가 챕터마다 확장되면서 최종적으로 완성형 패턴에 도달한다.

### Ch02~04.02: namespace = {project}

```hcl
locals {
  project = "tf-core-lab01"     # org + project를 하나로
}

# 리소스 이름: ${local.project}-sg-instance
# 결과:       tf-core-lab01-sg-instance
```

`local.project`가 namespace 역할을 하지만 명시적으로 `namespace`를 정의하지 않는다. Terraform에 익숙해지는 단계이므로 단순하게 유지한다.

### Ch04.03+: namespace = {org}-{project}

```hcl
locals {
  org       = "tf-core"
  project   = "lab02"
  namespace = "${local.org}-${local.project}"
}

# 리소스 이름: ${local.namespace}-sg-instance
# 결과:       tf-core-lab02-sg-instance
```

Remote Backend(S3) 도입으로 `local.org`를 분리한다. 시리즈 수준 리소스(tfstate 버킷 등)의 이름에 `local.org`가 필요하기 때문이다.

### Ch07+: namespace = {org}-{project}-{env}

```hcl
locals {
  org         = "tf-core"
  project     = "gallery"
  environment = var.env
  namespace   = "${local.org}-${local.project}-${local.environment}"
}

# 리소스 이름: ${local.namespace}-sg-instance
# 결과:       tf-core-gallery-dev-sg-instance
```

환경 분리(Workspace / 디렉토리 기반)를 도입하면서 `var.env`를 namespace에 포함시킨다. `variable "env"`에는 validation(`dev`, `stg`, `prod`)과 `default = "dev"`를 설정한다.

### Ch06+: namespace = {org}-{project}-{env}-{layer}

```hcl
locals {
  org         = "tf-core"
  project     = "gallery"
  environment = var.env
  layer       = "platform"
  namespace   = "${local.org}-${local.project}-${local.environment}-${local.layer}"
}

# 리소스 이름: ${local.namespace}-sg-instance-web
# 결과:       tf-core-gallery-dev-platform-sg-instance-web
```

모듈 도입으로 `{layer}`가 추가된다. Layer = Module — 각 모듈 디렉토리가 하나의 layer에 대응한다.

### Ch07: 환경 분리 체계화

Ch07에서 `var.env`를 namespace에 도입한다. Workspace·디렉토리 기반 환경 분리와 함께 `{env}` 세그먼트가 추가된다.

---

## identity

### 구성 범주

| 범주 | 설명 | 예시 키워드 |
|------|------|-----------|
| Target | 이 리소스가 보호/연결하는 대상 | `instance`, `alb`, `lambda` |
| Type | 리소스의 성격/종류 | `private`, `public`, `external`, `internal` |
| Attr | 리소스의 특성/용도 | `minimal`, `storage`, `web`, `was` |
| Loc | 위치 (가용 영역 등) | `a`, `b`, `c` |

해당 capability가 하나뿐이면 identity를 생략할 수 있다. 여러 개면 `-`로 조합한다.

### Target 패턴

SG, IAM Role, IAM Instance Profile 등 **다른 리소스를 대상으로 동작하는 리소스**는 identity에 대상의 capability 또는 이름을 쓴다.

| 리소스 | TF 레이블 | AWS 이름 | identity = |
|--------|----------|---------|-----------|
| SG → EC2 보호 | `"instance"` | `sg-instance` | 대상 capability |
| SG → EC2 보호 (속성 추가) | `"instance_minimal"` | `sg-instance-minimal` | 대상 capability + Attr |
| IAM Role → EC2용 | `"web"` | `iamrole-web` | 대상 이름 |
| IAM Instance Profile → EC2용 | `"web"` | `iamprofile-web` | 대상 이름 |

### Attachment 패턴

두 리소스를 연결하는 관계 리소스는 **양쪽 대상을 조합**한다.

| 리소스 | TF 레이블 | 의미 |
|--------|----------|------|
| IAM Role Policy Attachment | `"web_ssm"` | web role + ssm policy |

### TF 리소스 레이블과의 관계

**`{identity}`가 TF 리소스 레이블이 된다** (`-` → `_` 변환).

```text
AWS 이름: {namespace}-sg-instance-minimal
TF 레이블: resource "aws_security_group" "instance_minimal"

AWS 이름: {namespace}-subnet-private-a
TF 레이블: resource "aws_subnet" "private_a"
```

---

## 3-Layer 아키텍처

```
network > platform > workload
```

| Layer | 역할 | AWS 리소스 예시 |
|-------|------|---------------|
| `network` | Connectivity 기반. 가장 긴 Lifecycle | VPC, Subnet, IGW, NATGW, RTB, NACL |
| `platform` | 보안·접근·운영 공통 기반 | SG, IAM Role, ALB, CloudWatch |
| `workload` | 실제 비즈니스 서비스. 변경이 가장 잦음 | EC2, RDS, S3, ECS |

이 분리는 클라우드 중립적이다.

| Layer | AWS | Azure | GCP |
|-------|-----|-------|-----|
| network | VPC, Subnet, IGW | VNet, Subnet, NSG | VPC, Subnet, Firewall |
| platform | SG, ALB, IAM Role | App Gateway, Key Vault | Cloud Armor, IAM |
| workload | EC2, RDS, S3 | VM, Azure SQL, Blob | GCE, Cloud SQL, GCS |

### 2단 모듈 구조

Ch05에서 Infra Module(하드코딩), Ch06에서 Resource Module(동적)을 도입한다.

**Ch05 — Infra Module (하드코딩, 프로젝트 전용):**

```text
network/          ← Infra Module: VPC, Subnet, IGW, NATGW (하드코딩)
platform/         ← Infra Module: SG, ALB, IAM (하드코딩)
workload/         ← Infra Module: EC2, RDS, S3 (하드코딩)
```

**Ch06 — Resource Module 추출 + Infra Module 리팩토링:**

```text
modules/          ← Resource Modules (동적, 재사용 가능)
├── vpc/
├── subnet/
├── s3/
├── lb/
├── instance/
└── iam/
network/          ← Infra Module → modules/ 호출로 리팩토링
platform/
workload/
```

---

## Capability 약어

**축약하지 않는 것이 원칙**이나, 아래 목록은 AWS에서 관례적으로 사용하는 고유명사화된 약어로 인정한다.

### 네트워크

| Full Name | Capability |
|-----------|-----------|
| Virtual Private Cloud | `vpc` |
| Subnet | `subnet` |
| Internet Gateway | `igw` |
| NAT Gateway | `natgw` |
| Security Group | `sg` |
| Route Table | `rtb` |
| Network ACL | `nacl` |
| VPC Endpoint | `vpce` |
| Transit Gateway | `tgw` |
| Customer Gateway | `cgw` |

### 컴퓨팅 / 로드밸런싱

| Full Name | Capability |
|-----------|-----------|
| EC2 Instance | `instance` |
| Application Load Balancer | `alb` |
| Target Group | `tg` |
| Launch Template | `lt` |
| Auto Scaling Group | `asg` |

### 데이터 / 스토리지

| Full Name | Capability |
|-----------|-----------|
| RDS Instance | `rds` |
| S3 Bucket | `s3bucket` |
| KMS Key | `kmskey` |

### IAM

| Full Name | Capability |
|-----------|-----------|
| IAM Role | `iamrole` |
| IAM Instance Profile | `iamprofile` |
| IAM Policy | `iampolicy` |

---

## 태그 구조

공통 태그는 `provider` 블록의 `default_tags`로 관리한다. Ch02부터 사용한다. **locals 네이밍 토큰과 태그 키가 1:1로 대응**한다. 리소스 태그에는 `Name`만 선언한다.

```hcl
# Ch02~04: local.project가 org+project를 하나로 담는 시기
default_tags {
  tags = {
    Project   = local.project          # "tf-core-lab01"
    ManagedBy = "Terraform"
  }
}
```

```hcl
# Ch02.05+: Environment 추가
default_tags {
  tags = {
    Project     = local.project        # "tf-core-lab01"
    Environment = local.environment    # var.env → local
    ManagedBy   = "Terraform"
  }
}
```

```hcl
# Ch04+: org/project 분리 → 태그도 분리
default_tags {
  tags = {
    Organization = local.org           # "tf-core"
    Project      = local.project       # "lab01"
    Environment  = local.environment
    ManagedBy    = "Terraform"
  }
}
```

> Ch06+ Layer/Capability 태그의 구체적 구현은 Ch06 모듈 설계 시 확정한다.

---

## S3 버킷 참고

S3 버킷의 `bucket` 인수는 AWS 글로벌 고유 이름이다. `ami`나 `instance_type`과 같은 리소스 인수이므로 리소스 네이밍 룰과는 별개다. Name 태그는 네이밍 룰(`{namespace}-{capability}-{identity}`)을 그대로 따른다.

| 버킷 | `bucket` 인수 | 용도 |
|------|--------------|------|
| State 백엔드 | `tf-core-tfstate` | 시리즈 전체 State 저장. `key`로 실습별 분리 |
| Gallery 앱 스토리지 | `tf-core-gallery` | Gallery 앱 이미지 업로드 |

`bucket` 이름이 이미 사용 중이라면 `-{account_id}` suffix를 붙인다.

---

## 설계 배경

이 규칙의 주요 결정과 그 이유를 기록한다.

### `{identity}`를 Ch02부터 도입한 이유

원래 Ch06(모듈)에서 `{layer}`와 함께 도입 예정이었다. 하지만 `{identity}`는 TF 리소스 레이블과 1:1 매핑된다는 점이 핵심이다. `resource "aws_security_group" "instance_minimal"` → 이름에 `-instance-minimal` — 코드를 열지 않고 AWS 콘솔에서 바로 어떤 리소스인지 추적할 수 있다. 이 추적성은 Ch02 첫 리소스부터 필요하므로 앞당겼다.

초기에는 `{role}`(web, db, api)로 정의했으나, 실제 리소스를 작성하면서 역할뿐 아니라 Target(instance, alb), Type(private, public), Attr(minimal, storage), Loc(a, b) 등 다양한 의미 범주가 필요하다는 것을 확인했다. 이를 포괄하기 위해 `{identity}`로 변경했다.

### `{env}`를 Ch07에서 도입하는 이유

`{env}`는 환경 분리가 필요한 시점에 도입한다. variable을 배운다고(Ch02.05) 바로 env를 namespace에 넣을 필요가 없다. Ch07에서 Workspace·디렉토리 기반 환경 분리를 학습하면서 `var.env`가 namespace에 자연스럽게 합류한다.

### `default_tags`를 Ch02부터 사용하는 이유

Ch08 Provider 심화에서 공식 소개하지만, Ch02 draft부터 `default_tags`를 실제로 사용한다. Provider가 Project/ManagedBy를 자동 주입하면 리소스 코드는 `Name`만 선언하면 된다. 태그 관심사가 분리되어 코드가 깨끗해지고, plan 출력에서 `tags` vs `tags_all` 차이를 자연스럽게 학습할 수 있다.

### Section Lab 번호를 섹션 내 로컬로 유지하는 이유

전역 순번(lab01~lab44)을 검토했으나 불필요하다고 판단했다. 각 Section Lab은 실습 후 `terraform destroy`하는 샌드박스이므로 AWS에 동시에 존재할 일이 적다.

### 문서에서 리소스 이름을 하드코딩하는 이유

실무에서는 `local.namespace`로 이름을 조립하는 것이 좋은 패턴이지만, 학습 문서에서는 `"tf-core-lab01-sg-web"` 같은 명시적 문자열이 독자에게 훨씬 명확하다. namespace 조립 로직은 프로그래밍 스킬이지 문서로 전달하기 어려운 영역이다.
