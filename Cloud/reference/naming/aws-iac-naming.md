# AWS 리소스 네이밍 — IaC (코드)

> AWS-IaC(Terraform·CloudFormation) 리소스 네이밍 규칙. **규칙만 정리한다** — 서사·논리(언제 무엇을 도입하는지 등)는 이 규칙을 쓰는 시리즈 문서에서 다룬다.

---

## 1. 완성형 패턴

```
{org}-{project}-{env}-{layer}-{capability}-{identity}
```

| 세그먼트 | 설명 | 예 |
|---------|------|----|
| `org` | 최상위 식별자. 실무의 organization/team/product. 시리즈에서는 시리즈명 | `tf-core`, `aws-iac` |
| `project` | 실습/프로젝트 식별자 | `lab01`, `gallery` |
| `env` | 배포 환경 | `dev`, `stg`, `prod` |
| `layer` | 아키텍처 계층 | `network`, `platform`, `workload` |
| `capability` | 리소스 종류 약어 (§3) | `sg`, `instance`, `vpc`, `rds` |
| `identity` | 리소스 정체성 (§4) | `instance`, `private-a`, `web` |

패턴이 처음부터 완성형으로 등장하지 않는다. `locals`의 **namespace**로 조립하며, 필요한 세그먼트를 더해 확장한다.

---

## 2. namespace 조립

코드에서 리소스 이름은 항상 이 구조다:

```
{namespace}-{capability}-{identity}
```

`{namespace}`는 `{org}`~`{layer}` 구간을 `locals`에서 조립한 접두어다. 최소 형태에서 완성형까지 확장된다.

```hcl
# 최소: namespace = {project}
locals {
  project   = "org-lab01"                    # org+project를 하나로
}
# 이름: ${local.project}-sg-instance

# 확장: namespace = {org}-{project}-{env}-{layer}
locals {
  org         = "org"
  project     = "gallery"
  environment = var.env
  layer       = "platform"
  namespace   = "${local.org}-${local.project}-${local.environment}-${local.layer}"
}
# 이름: ${local.namespace}-sg-instance-web
```

- `variable "env"`에는 validation(`dev`/`stg`/`prod`)과 `default = "dev"`를 둔다.
- `{layer}`는 모듈과 대응한다 (Layer = Module).

---

## 3. Capability 약어

**원칙: 축약하지 않는다.** 아래는 AWS에서 고유명사화된 관례적 약어만 인정한다.

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

### 데이터 / 스토리지 / IAM
| Full Name | Capability |
|-----------|-----------|
| RDS Instance | `rds` |
| S3 Bucket | `s3bucket` |
| KMS Key | `kmskey` |
| IAM Role | `iamrole` |
| IAM Instance Profile | `iamprofile` |
| IAM Policy | `iampolicy` |

---

## 4. identity — 범주 · 조합 · 생략 · TF 레이블

### 구성 범주
| 범주 | 설명 | 예시 |
|------|------|------|
| Target | 이 리소스가 보호/연결하는 대상 | `instance`, `alb`, `lambda` |
| Type | 리소스의 성격/종류 | `private`, `public`, `external`, `internal` |
| Attr | 리소스의 특성/용도 | `minimal`, `storage`, `web`, `was` |
| Loc | 위치(가용 영역 등) | `a`, `b`, `c` |

capability가 하나뿐이면 identity를 생략한다. 여러 개면 `-`로 조합한다.

### Target 패턴
SG·IAM Role 등 **다른 리소스를 대상으로 동작하는 리소스**는 identity에 대상의 capability 또는 이름을 쓴다.

| 리소스 | TF 레이블 | AWS 이름 | identity = |
|--------|----------|---------|-----------|
| SG → EC2 보호 | `"instance"` | `…-sg-instance` | 대상 capability |
| SG → EC2 보호(속성 추가) | `"instance_minimal"` | `…-sg-instance-minimal` | 대상 capability + Attr |
| IAM Role → EC2용 | `"web"` | `…-iamrole-web` | 대상 이름 |

### Attachment 패턴
두 리소스를 연결하는 관계 리소스는 **양쪽 대상을 조합**한다.

| 리소스 | TF 레이블 | 의미 |
|--------|----------|------|
| IAM Role Policy Attachment | `"web_ssm"` | web role + ssm policy |

### TF 리소스 레이블과의 관계
**`{identity}`가 TF 리소스 레이블이 된다** (`-` → `_` 변환).

```text
AWS 이름:  {namespace}-sg-instance-minimal
TF 레이블: resource "aws_security_group" "instance_minimal"

AWS 이름:  {namespace}-subnet-private-a
TF 레이블: resource "aws_subnet" "private_a"
```

---

## 5. 3-Layer 아키텍처

```
network > platform > workload
```

| Layer | 역할 | AWS 리소스 예시 |
|-------|------|---------------|
| `network` | Connectivity 기반. 가장 긴 Lifecycle | VPC, Subnet, IGW, NATGW, RTB, NACL |
| `platform` | 보안·접근·운영 공통 기반 | SG, IAM Role, ALB, CloudWatch |
| `workload` | 실제 비즈니스 서비스. 변경이 가장 잦음 | EC2, RDS, S3, ECS |

`{layer}`는 이 세 값을 가진다. Layer = Module(각 모듈 디렉토리가 하나의 layer에 대응).

---

## 6. 태그 구조

공통 태그는 `provider`의 `default_tags`로 관리한다. **locals 네이밍 토큰과 태그 키가 1:1로 대응**한다. 리소스 태그에는 `Name`만 선언한다.

```hcl
default_tags {
  tags = {
    Organization = local.org           # org
    Project      = local.project       # project
    Environment  = local.environment   # env
    ManagedBy    = "Terraform"
  }
}
```

`org`/`project`를 분리하기 전 단계에서는 `Project = local.project`(org+project 통합) 하나로 둘 수 있다.

---

## 7. S3 버킷

S3 버킷의 `bucket` 인수는 AWS 글로벌 고유 이름이다. `ami`·`instance_type`과 같은 리소스 인수이므로 네이밍 룰과 별개다. Name 태그는 룰(`{namespace}-{capability}-{identity}`)을 따른다.

- `bucket` 이름이 이미 사용 중이면 `-{account_id}` suffix를 붙인다.
- 예: `bucket = "org-tfstate"` (State 백엔드), `bucket = "org-gallery"` (앱 스토리지)
