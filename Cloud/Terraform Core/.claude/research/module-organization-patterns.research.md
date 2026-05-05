# Research: Terraform Module Organization Patterns — Community Debate

> 조사일: 2026-04-15
> 주제: 모듈을 infrastructure layer별로 나눌 것인가, resource type별로 나눌 것인가, function별로 나눌 것인가

---

## 1. 커뮤니티의 주요 진영 (The Debate)

Terraform 모듈 조직 패턴에 대해 커뮤니티에는 세 가지 주요 접근이 존재한다. 단, 이들은 상호 배타적이지 않으며 실무에서는 거의 항상 혼합된다.

### Camp A: Resource-Type Modules (리소스 타입별 모듈)

- 모듈 하나가 AWS 서비스 하나를 감싼다 (vpc/, ec2/, s3/, iam/)
- terraform-aws-modules 커뮤니티 프로젝트가 대표적
- Registry에 `terraform-aws-modules/vpc/aws`, `terraform-aws-modules/ec2-instance/aws` 등으로 게시
- **장점**: 재사용성 극대화, 여러 프로젝트에서 공유 가능
- **단점**: 단일 리소스를 감싸는 thin wrapper가 되기 쉬움
- **HashiCorp의 경고**: "If you have trouble finding a name for your module that isn't the same as the main resource type inside it, that may be a sign that your module is not creating any new abstraction."

### Camp B: Layer-Based Modules (인프라 계층별 모듈)

- network/, platform/, workload/ 또는 networking/, compute/, database/
- 인프라 의존성 방향에 따라 계층을 나눔
- Medium 기사 (Majidbasharat, 2026)에서 정의한 패턴:
  - Core Infrastructure Layer (VPC, Subnet, SG)
  - Platform Layer (K8s, LB, Container Registry)
  - Application Layer (App Services, Lambda, API)
- **장점**: 배포 순서와 의존성이 명확, 계층별 독립 배포 가능
- **단점**: Xebia (2024)가 지적한 anti-pattern 가능성 — 불필요한 분리로 복잡성 증가

### Camp C: Functional/Composition Modules (기능/목적별 모듈)

- HashiCorp 공식 튜토리얼이 권장하는 방식
- 모듈을 encapsulation, privilege boundary, volatility 기준으로 분리
- 예: Network, Web, App, Database, Routing, Security
- **장점**: 비즈니스 맥락에 맞는 추상화, 팀 권한 분리 자연스러움
- **단점**: 프로젝트마다 다른 구조가 되어 재사용성 감소

---

## 2. HashiCorp 공식 입장

### Module Composition 문서

핵심 원칙:
- **Flat module tree**: "in most cases we strongly recommend keeping the module tree flat, with only one level of child modules"
- **Dependency inversion**: 모듈이 의존성을 스스로 생성하지 않고, root module에서 주입받음
- **No thin wrappers**: 단일 리소스를 감싸는 모듈은 권장하지 않음

> 출처: https://developer.hashicorp.com/terraform/language/modules/develop/composition

### Standard Module Structure

- main.tf, variables.tf, outputs.tf, README.md 필수
- nested modules는 modules/ 서브디렉토리에 배치
- examples/ 디렉토리로 사용 예시 제공

> 출처: https://developer.hashicorp.com/terraform/language/modules/develop/structure

### Module Creation Recommended Pattern (공식 튜토리얼)

Producer/Consumer 모델:
- Producer 팀이 모듈을 작성, Consumer 팀이 소비
- 모듈 분리 기준 세 가지: **Encapsulation** (함께 배포되는 것), **Privileges** (권한 경계), **Volatility** (변경 빈도)
- 예시 분리 결과: Network, Web, App, Database, Routing, Security
- "Modules should be opinionated and designed to do one thing well"
- "Target 80% of use cases in the MVP; never code for edge cases"

> 출처: https://developer.hashicorp.com/terraform/tutorials/modules/pattern-module-creation

### Creating Modules 가이드

- "A good module should raise the level of abstraction by describing a new concept in your architecture"
- "Over-using modules can make your overall Terraform configuration harder to understand and maintain"

> 출처: https://developer.hashicorp.com/terraform/language/modules/develop

**요약**: HashiCorp는 특정 조직 패턴(layer/resource-type/function)을 명시적으로 권장하지 않는다. 대신 원칙을 제시한다 — flat tree, dependency inversion, meaningful abstraction, no thin wrappers. 공식 튜토리얼의 예시는 기능/책임 기반 분리에 가장 가깝다.

---

## 3. 주요 리더/조직의 패턴

### Anton Babenko / terraform-best-practices.com

가장 체계적인 분류 체계를 제시:

**Resource Module**: 연결된 리소스들의 집합. 가장 작은 버전 관리/공유 단위.
- 예: terraform-aws-modules/vpc (VPC + Subnet + NAT GW + IGW)

**Infrastructure Module**: resource module들의 집합. 논리적으로 연결되지 않을 수 있지만 같은 목적을 수행.
- 예: terraform-aws-atlantis (vpc module + security-group module + ECS 등)
- provider 설정을 포함하며, 일반적으로 하나의 논리 단위(AWS Region 등)로 제한

**Composition**: infrastructure module들의 집합. 여러 논리 단위에 걸칠 수 있음.
- terraform_remote_state가 infrastructure module 간 접착제 역할

> 출처: https://www.terraform-best-practices.com/key-concepts

코드 구조 규모별 권장:
- Small: 리소스 20-30개 이하, 단일 state
- Medium: 여러 AWS 계정/환경, off-the-shelf infrastructure module 사용
- Large: 커스텀 infrastructure module 필수, 복사-붙여넣기 최소화
- Very Large: 멀티 클라우드

> 출처: https://github.com/antonbabenko/terraform-best-practices/blob/master/examples.md

### Gruntwork

**Two-Repository Architecture**:
- `infrastructure-modules` 리포: 재사용 가능한 "blueprint" 모듈
- `infrastructure-live` 리포: 환경별 실제 인프라 정의 (Terragrunt 사용)

**Live 폴더 구조**:
```
account/
└── _global/          ← IAM users, Route 53 등 리전 무관 리소스
└── region/
    └── _global/      ← 리전 내 공통
    └── environment/
        └── category/ ← networking, compute, services
            └── resource/
```

- category가 사실상 layer 역할 (networking, compute, services)
- 모듈 자체는 기능별로 분리 (webserver-cluster, mysql 등)
- 입력 변수로 설정 주입, locals로 내부 일관성, outputs로 인터페이스 노출

> 출처: https://docs.gruntwork.io/2.0/docs/overview/concepts/infrastructure-live/
> 출처: https://gruntwork.io/blog/how-to-create-reusable-infrastructure-with-terraform-modules

### CloudPosse

- **Component 기반 아키텍처**: `components/terraform/` 디렉토리에 root module 배치
- **Stack 기반 구성**: YAML catalog으로 컴포넌트 인스턴스 정의
- **null-label 패턴**: `{namespace}-{environment}-{stage}-{name}-{attributes}` 네이밍
- **Resource Factory 패턴**: YAML 선언 + Terraform 구현 분리
- "Simply wrapping terraform resources for the purposes of modularizing code is not that helpful. Implementing a specific use-case of those resources is more helpful."

> 출처: https://docs.cloudposse.com/best-practices/terraform/
> 출처: https://docs.cloudposse.com/resources/legacy/fundamentals/terraform/

### AWS Prescriptive Guidance

- main.tf에 모든 리소스를 기본 배치, 150줄 초과 시 iam.tf, networking.tf 등으로 분리
- 논리적 아키텍처 역량(networking, data tier, security controls, applications)별 모듈화
- nested module은 1-2 레벨 이하 유지
- thin wrapper 명시적 반대

> 출처: https://docs.aws.amazon.com/prescriptive-guidance/latest/terraform-aws-provider-best-practices/structure.html

---

## 4. Three-Layer Architecture 패턴 (Hybrid)

Anton Babenko의 분류가 커뮤니티에서 가장 널리 인용되는 하이브리드 패턴이다:

```
composition (환경/리전별 배포 단위)
  └── infrastructure module (프로젝트별 비즈니스 단위)
      └── resource module (재사용 가능한 리소스 집합)
          └── individual resources
```

DEV.to의 "Terraform Three-Layer Architecture" 기사가 이를 구체적으로 구현:

```
project-root/
├── resource-modules/        ← 재사용, 리소스 타입별
│   ├── storage/s3/
│   ├── database/dynamodb/
│   └── security/kms/
├── infra/                   ← 프로젝트별, resource module 조합
│   └── remote-backend/
│       ├── main.tf          ← s3 + dynamodb + kms 조합
│       ├── variables.tf
│       └── outputs.tf
└── composition/             ← 환경/리전별 배포
    └── remote-backend/
        └── ap-northeast-1/
            └── prod/
                └── main.tf  ← infra module 호출
```

> 출처: https://dev.to/jumptotech/terraform-three-layer-architecture-24fe

### Cross-Cutting Concern: IAM은 어디에?

커뮤니티 합의:
- **소규모**: 각 모듈 내 iam.tf에 해당 리소스의 IAM 포함 (AWS 가이드: 150줄 초과 시 분리)
- **중규모**: Security 모듈로 분리 (HashiCorp 튜토리얼의 Security 모듈)
- **대규모/멀티 계정**: _global/ 디렉토리에 계정 수준 IAM 중앙 관리 (Gruntwork 패턴)
- **하이브리드**: 리소스별 IAM Role은 해당 모듈에, 조직 정책/SCP는 중앙 Security 모듈에

Security Group도 유사한 논쟁:
- Camp A: SG는 네트워크 리소스이므로 network 모듈에
- Camp B: SG는 보호 대상과 함께 (EC2 모듈에 SG 포함)
- Camp C: SG를 별도 모듈로 분리하여 유연하게 조합

---

## 5. 사용자 제안 패턴 분석

```
project/
├── modules/          ← reusable, generic resource modules
│   ├── ec2/
│   ├── s3/
│   ├── iam/
│   └── ...
├── network/          ← project-specific layer composition
├── platform/         ← project-specific layer composition
└── workload/         ← project-specific layer composition
```

### 이것은 인정된 패턴인가?

**YES** — Anton Babenko의 "resource module + infrastructure module" 패턴의 변형이다.

- `modules/` = resource modules (재사용 가능한 기본 단위)
- `network/`, `platform/`, `workload/` = infrastructure modules (프로젝트별 조합)
- 이 조합은 커뮤니티에서 널리 사용되는 하이브리드 패턴

### 커뮤니티에서 부르는 이름

정확히 하나의 공식 이름은 없지만:
- **"Resource Module + Infrastructure Module" 패턴** (Anton Babenko)
- **"Three-Layer Architecture"** (DEV.to)
- **"Layered Infrastructure Pattern"** (Medium, 2026)
- **"Modular Composition with Layer Separation"** (일반적 설명)

### HashiCorp 관점에서의 적합성

HashiCorp의 세 가지 원칙과 대조:

| 원칙 | 적합성 |
|------|--------|
| Flat module tree | modules/ 아래 resource module은 flat, layer는 1 depth composition → **적합** |
| Dependency inversion | layer가 resource module에 변수 주입 → **적합** |
| No thin wrappers | modules/ec2/가 단일 aws_instance만 감싸면 **위반**, VPC+Subnet+IGW면 **적합** |

**핵심 주의점**: modules/ 안의 각 모듈이 "meaningful abstraction"을 제공하는지가 관건이다. ec2/ 모듈이 aws_instance 하나만 감싸면 thin wrapper anti-pattern이다. 하지만 EC2 + EBS + ENI + User Data 조합이면 정당한 resource module이다.

---

## 6. 실제 대규모 조직 사례

### HashiCorp 공식 Enterprise Pattern

- Producer 팀이 모듈 작성, Private Registry에 게시
- Consumer 팀이 모듈 소비하여 인프라 배포
- 모듈별 독립 리포, semantic versioning, PR 기반 협업
- 모듈 분리 기준: Encapsulation + Privilege + Volatility

> 출처: https://developer.hashicorp.com/terraform/tutorials/recommended-patterns

### OpenCredo의 "Pattern Modules"

인프라 패턴을 템플릿으로 모듈화:
- Single instance deployment
- Load-balanced pool
- Coordinator/worker
- Primary/secondary
- Blue/green deployment

이 패턴 모듈들이 서로 조합되어 더 높은 수준의 아키텍처를 구성한다.

> 출처: https://opencredo.com/blogs/terraform-infrastructure-design-patterns

### Robert Glenn의 Module Taxonomy

구조적 분류:
- **Singleton**: 단일 리소스 (실험용)
- **Terminating Composite**: 긴밀하게 결합된 리소스 묶음 (VPC + Subnet)
- **Nesting Composite**: 로컬 모듈을 조합
- **Abstracted Composite**: 원격 모듈을 조합 (landing zone)
- **Wrapping**: 외부 모듈을 감싸서 인터페이스 제한 (보안 목적)
- **Heterogeneous Composite**: resource와 module 블록 혼용 (**anti-pattern**)

> 출처: https://medium.com/devoops-discourse/terraform-observed-part-1-module-types-9dec5aa9dc9f

---

## 7. Layer 기반 접근의 Anti-Pattern 경고

Xebia (2024)의 경고:
- "layers"는 Terraform 공식 개념이 아님 — 커뮤니티에서 자생한 용어
- 레이어 분리가 적절한 경우: 중대형 조직, 팀 간 책임 분리 필요, 라이프사이클 차이가 큰 경우
- Anti-pattern이 되는 경우: 소규모 팀이 불필요하게 모든 것을 분리, monolith 분해 트렌드에 맹목적으로 따름

> 출처: https://xebia.com/blog/anti-patterns-of-using-layers-with-terraform/

---

## 8. 종합 분석 — 커뮤니티 합의점

### 합의된 사항

1. **Thin wrapper는 나쁘다** — HashiCorp, AWS, CloudPosse, 커뮤니티 모두 동의
2. **Flat module tree가 좋다** — 깊은 중첩보다 1 depth composition
3. **Dependency inversion** — 모듈이 의존성을 받아야 한다
4. **모듈은 의미 있는 추상화를 제공해야 한다** — 새로운 "개념"을 만들어야 함

### 합의되지 않은 사항

1. **Layer vs Function vs Resource-type**: 정답이 없다. 팀 규모, 조직 구조, 인프라 복잡도에 따라 다름
2. **모듈 granularity**: 어디까지를 하나의 모듈로 묶을 것인가
3. **IAM 위치**: 각 모듈에 포함 vs 별도 Security 모듈
4. **Monorepo vs Multi-repo**: 소규모는 monorepo, 대규모는 multi-repo 경향이지만 절대적이지 않음

### 실무 패턴 스펙트럼

```
Simple                                                    Complex
|─────────────────────────────────────────────────────────|
Flat resources    Resource modules    Layered infra    Full composition
(no modules)      (VPC module,        modules          (resource +
                   EC2 module)        (network/,        infrastructure +
                                      compute/)         composition)
```

프로젝트가 성장하면서 오른쪽으로 이동하는 것이 자연스러운 진화 경로다.

---

## Sources

- [HashiCorp - Module Composition](https://developer.hashicorp.com/terraform/language/modules/develop/composition)
- [HashiCorp - Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
- [HashiCorp - Creating Modules](https://developer.hashicorp.com/terraform/language/modules/develop)
- [HashiCorp - Module Creation Recommended Pattern](https://developer.hashicorp.com/terraform/tutorials/modules/pattern-module-creation)
- [HashiCorp Blog - Module Creation Recommended Pattern](https://www.hashicorp.com/en/blog/terraform-tutorial-module-creation-recommended-pattern)
- [Terraform Best Practices - Key Concepts (Anton Babenko)](https://www.terraform-best-practices.com/key-concepts)
- [Terraform Best Practices - Code Structure](https://www.terraform-best-practices.com/code-structure)
- [Terraform Best Practices - Examples (GitHub)](https://github.com/antonbabenko/terraform-best-practices/blob/master/examples.md)
- [Gruntwork - How to Create Reusable Infrastructure with Terraform Modules](https://gruntwork.io/blog/how-to-create-reusable-infrastructure-with-terraform-modules)
- [Gruntwork - Recommended Folder Structure](https://docs.gruntwork.io/2.0/docs/overview/concepts/infrastructure-live/)
- [Gruntwork - Infrastructure Live Example (GitHub)](https://github.com/gruntwork-io/terragrunt-infrastructure-live-example)
- [CloudPosse - Terraform Best Practices](https://docs.cloudposse.com/best-practices/terraform/)
- [CloudPosse - terraform-aws-components (GitHub)](https://github.com/cloudposse/terraform-aws-components)
- [AWS Prescriptive Guidance - Terraform Code Structure](https://docs.aws.amazon.com/prescriptive-guidance/latest/terraform-aws-provider-best-practices/structure.html)
- [DEV.to - Terraform Three-Layer Architecture](https://dev.to/jumptotech/terraform-three-layer-architecture-24fe)
- [Medium - Terraform Architecture Patterns (Majidbasharat, 2026)](https://medium.com/@majidbasharat21/terraform-architecture-patterns-designing-scalable-and-maintainable-infrastructure-as-code-3f3f00ce37fd)
- [OpenCredo - Terraform Infrastructure Design Patterns](https://opencredo.com/blogs/terraform-infrastructure-design-patterns)
- [Xebia - Anti-patterns Of Using Layers With Terraform](https://xebia.com/blog/anti-patterns-of-using-layers-with-terraform/)
- [Medium - Terraform Observed: Module Types (Robert Glenn)](https://medium.com/devoops-discourse/terraform-observed-part-1-module-types-9dec5aa9dc9f)
- [Medium - IaC Module Anti-Patterns: Resource Wrapper Modules](https://medium.com/azure-terraformer/iac-module-anti-patterns-dont-create-resource-wrapper-modules-2dc3b6a5a833)
- [Spacelift - Terraform Modules vs Resources at Scale](https://spacelift.io/blog/terraform-modules-vs-resources)
- [terraform-aws-modules (Terraform Registry)](https://registry.terraform.io/modules/terraform-aws-modules)
- [InfoQ - Advice on Writing and Rightsizing Terraform Modules](https://www.infoq.com/news/2025/11/advice-rightsizing-terraform/)
- [HashiCorp - Enterprise Patterns](https://developer.hashicorp.com/terraform/tutorials/recommended-patterns)
