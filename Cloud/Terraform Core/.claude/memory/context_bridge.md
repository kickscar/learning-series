# Context Bridge

> "살아있는 항목만" 유지한다. 완료된 항목은 삭제한다.
> 기록 유형·삭제 시점·형식: `CLAUDE.md > Context 기록 정책` 참고.

---

## [2026-04-11] 기술 협의 결정

- **리소스 이름은 문서에서 하드코딩**: `local.namespace` 패턴(`"${local.namespace}-sg-web"`)은 실무 운용 스킬이지 학습 문서 내용이 아니다. 문서에서는 `"tf-core-lab01-sg-web"` 같은 명시적 문자열이 독자에게 훨씬 명확. 오프라인 대면 전달 영역.
- **Section Lab 번호는 섹션 내 로컬 유지**: 전역 순번(lab01~lab44) 검토했으나 불필요. 각 lab은 destroy하는 샌드박스이고, 모듈(Ch06+)에서는 `{layer}`가 구분자 역할을 하므로 lab 번호 자체가 빠진다.

---

## [2026-04-12] 기술 협의 결정

- **02.02에 default_tags lab 추가**: resource 블록 전(02.02 provider 섹션)에서 `default_tags` + `tags_all` 동작을 plan으로 확인하는 lab. 단순 기능 확인이 아니라 **시리즈 전체 네이밍·태깅 체계의 출발점**. AWS는 Azure Resource Group/GCP Project 같은 리소스 계층 샌드박스가 없어서 네이밍·태깅이 논리적 계층 구조를 대신한다. 이 체계를 Ch02 초반에 체화시켜야 Ch06 모듈화({layer}), Ch07 환경 분리(Environment 태그), 후속 IaC CI/CD(태그 기반 배포 환경 필터링)로 자연스럽게 연결된다.
- **`local.project` 패턴 통일**: `local.project = "tf-core-lab{n}"`를 단일 출처로 사용. `default_tags` Project 태그와 리소스 이름(`"${local.project}-{capability}-{identity}"`) 모두 이 값에서 파생. namespace 조립(`${local.project}-${var.env}`)은 env가 필요한 시점(Ch05, Ch07)에 도입. env 기반 배포 환경 관리는 이 시리즈 범위 밖 — CI/CD IaC 시리즈 담당.

---

## [2026-04-13] 기술 협의 결정

- **`{role}` → `{identity}` 변경**: 네이밍 패턴 `{project}-{env}-{layer}-{capability}-{identity}`. role은 기능 역할(web, db)만 연상시키지만, 실제로는 Target(instance, alb), Type(private, public), Attr(minimal, storage), Loc(a, b) 등 다양한 의미 범주를 조합해야 한다. identity가 이를 포괄. TF 리소스 레이블 = identity (`-` → `_`). 해당 capability가 하나뿐이면 생략 가능.
- **Target 패턴**: SG, IAM Role, IAM Instance Profile 등 다른 리소스를 대상으로 동작하는 리소스는 identity에 대상의 capability + identity를 쓴다. `aws_security_group` → EC2 `"app"` 보호 → `"instance_app"`. 구성이 단순하든 복합이든 무관 — SG는 항상 Target 패턴.
- **Attachment 패턴**: 두 리소스를 연결하는 관계 리소스는 양쪽 대상을 조합한다. `aws_iam_role_policy_attachment "instance_web_ssm"` → instance_web role + ssm policy.
- **EC2 identity는 Attr(용도)**: 인스턴스가 실제로 무엇을 하는지로 판단. httpd 설치하고 포트 열어서 웹 서비스하면 → `"web"`, 아무 서비스 없는 최소 구성 → `"minimal"`. 실제 동작 기준으로 정직하게 판단한다.
- **실습 코드 작성 원칙 — 점진적 연결 + 누적 적용**: 모든 예제 코드는 독립적으로 의미 있으면서 다음 단계의 밑바탕이 된다. 의미 파편화된 "보여주기용" 코드는 두지 않는다. **앞에서 배운 개념은 뒤에서 당연하게 적용된다** — 새 섹션 실습에는 그 섹션의 새 개념만 설명하고, 이전 섹션에서 확립한 패턴(validation, output 객체화, SSM, naming 등)은 설명 없이 코드에 자연스럽게 포함한다. 누적 적용 기준:
  - 02.02~: `local.project` + `default_tags`
  - 02.03~: `{identity}` 네이밍, Target/Attachment 패턴, SSM 접속 (SSH ingress 없음, key_name 없음)
  - 02.04~: locals object 구조화 (`local.instance`, `local.iamrole`), capability 기반 object 이름, `this` 레이블, output object 패턴 + `-json` + `jq`
  - 02.05~: variable validation, `data "aws_ami"` + Amazon Linux 2023, data source → locals 통합 패턴, `aws_iam_policy_document`
  - 04.03~: `local.org` / `local.project` / `local.namespace` 분리
  - Ch07~: `var.env` + `local.namespace`에 `{env}` 추가, 환경 분리
  - 이후 챕터도 동일 원칙으로 계속 누적

---

## [2026-04-16] 기술 협의 결정

- **`local.project` → `local.org` / `local.project` / `local.namespace` 분리 (Ch04+)**: Ch02~03에서 `local.project = "tf-core-lab{n}"`으로 통째로 사용하던 것을 Ch04부터 분리한다. `local.org = "tf-core"`(최상위 식별자, 현업의 organization에 대응), `local.project = "lab{n}"`(실습 식별자), `local.namespace = "${local.org}-${local.project}"`(리소스 네이밍 접두어). 02.05에서 `local.namespace`를 locals 조합 패턴 시연으로 도입했고, Ch04에서 org/project 분리로 구조화한다. Ch06에서 `{layer}`, Ch07에서 `{env}`가 추가된다.
- **S3 버킷 네이밍은 리소스 네이밍 룰과 별개**: tfstate 버킷 = `{org}-tfstate` (`tf-core-tfstate`), Gallery 앱 버킷 = `{org}-gallery` (`tf-core-gallery`). `{project}-{capability}-{identity}` 패턴을 적용하지 않는다. 버킷은 글로벌 고유 식별자이며 용도가 이름에 직접 드러나면 충분하다.
- **시리즈 전체 State를 단일 S3 버킷에서 관리**: `tf-core-tfstate` 버킷에 `key`로 State 파일을 구분한다 (`lab01/terraform.tfstate`, `gallery/terraform.tfstate` 등). lab마다 버킷을 생성하지 않는다.
- **`local.org` 도입 배경**: 시리즈 전체 실습이 많아 공통 식별자가 필요하다. 현업에서는 organization이나 team 식별자에 대응한다. tfstate 버킷, Gallery 앱 버킷 등 시리즈 수준 리소스의 네이밍 근거가 된다.
- **State 저장 정책**: Section Lab은 **로컬 State** (일회성 샌드박스, destroy 후 종료). Gallery는 **Remote State** (`tf-core-tfstate` 버킷, `key = "gallery/terraform.tfstate"`) — 챕터 간 누적 인프라.
- **누적 적용 기준 추가**:
  - 04.03~: `local.org` / `local.project` / `local.namespace` 분리, S3 remote backend (`use_lockfile = true`) — Gallery에만 적용
- **Ch05 Sec01 "변수 입력 방법" → Ch07 Sec04 "변수 입력 전략"으로 이동**: 변수 입력 방법은 모듈(Ch06)과 환경 분리(Ch07) 컨텍스트가 있어야 의미 있다. Ch05는 Sec02~04 → Sec01~03으로 재번호. Ch07은 Sec04 추가, Gallery → Sec05. 총 섹션 수 34 유지.
- **Ch06 모듈 구조: Layer = Module**: 5개 리소스별 모듈(vpc/sg/ec2/s3/rds) → 3개 Layer 모듈(network/platform/workload)로 변경. 모듈 내부는 리소스 개념별 .tf 파일로 구성 (vpc.tf, security.tf, service.tf 등). Section Lab은 단순 구성, Gallery는 운영 수준 구성.
- **platform 모듈 파일 구성**: `security.tf`(IAM, SG), `edge.tf`(ALB, CloudFront 등 트래픽 진입점), `observing.tf`(CloudWatch — 문서에서는 미다루, 수업에서 활용 가능)
- **3-Layer는 클라우드 중립적**: network/platform/workload 이름이 AWS, Azure, GCP 공통. 후속 시리즈(Azure IaC, GCP IaC)에서도 동일 Layer 이름 사용.

---

## [2026-04-20] 기술 협의 결정

- **Section Lab remote state 공유 검토 → 불가 → 독립 유지**: Ch05 lab이 점진적 구축이라 remote state 공유를 검토했으나, 각 lab의 `local.project`(lab01~05)가 달라 namespace가 변경되면서 리소스 재생성이 발생한다. 또한 lab 간 리소스 이름/구성이 달라(EIP `main` → `natgw`, count → for_each) state 공유 시 삭제가 발생한다. 결론: Section Lab은 독립 디렉토리 + local state 유지.
- **시리즈 전환점 — Ch05까지 = TF 도구 학습, Ch06~ = 팀/실무 운용**: Ch05 Gallery에서 코드가 200줄 이상으로 커지며 "한 파일에 모든 리소스"의 한계를 체감. Ch06 모듈화가 이 문제를 해결. 이 메시지가 05.04 Gallery draft에 명시적으로 포함됨.
- **Ch05 locals 구조가 Ch06 모듈의 빌드업**: `local.network` / `local.platform` / `local.workload` 설정 분리가 Ch05에서 이미 시작된다. Ch06에서 이 설정 구조가 각 모듈의 `variable` 진입점이 된다. "괜히 한 것이 아니라 빌드업"임을 Ch06에서 환기할 것.
- **Ch05 Gallery 추가**: "Custom VPC 이전 + ALB" — Gallery 총 6개. series-hierarchy, CLAUDE.md 반영 완료.

---

## [2026-04-24] 기술 협의 결정

- **Ch05/Ch06 swap — 모듈 먼저, 동적 구성 나중에**: 기존 Ch05(동적 구성)→Ch06(모듈) 순서를 Ch05(모듈)→Ch06(동적 구성)으로 변경. 이유: 동적 구성은 "모듈의 재사용성"이라는 동기가 있어야 의미 있다. 하드코딩 모듈(Infra Module)을 먼저 만들고, 동적 구성으로 유연하게 만드는 것(Resource Module 진화)이 자연스러운 학습 흐름.
- **Ch05 모듈 = 하드코딩 Infra Module**: 동적 구성 없이 하나의 인프라에 충실한 모듈 구조. Custom VPC + ALB를 network/platform/workload 3-Layer 모듈로 구성. "동작하지만 유연하지 않다" → Ch06 동기.
- **Ch06 동적 구성 = Resource Module 진화**: count/for_each/dynamic/함수로 Ch05 모듈을 유연하게. 재사용 가능한 모듈로 진화. + RDS + S3 추가해 3-tier 완성.
- **시리즈 전환점 수정**: Ch04까지 = TF 도구 학습, **Ch05부터** = 팀/실무 운용 (기존 Ch05→Ch06 기준에서 변경).
- **기존 Ch05/Ch06 draft 전부 재구성 필요**: draft 완료 카운트 24→17로 조정.
- **2단 모듈 구조 — 시리즈 핵심, IaC 확장 고리**:
  - **Resource Module** (`modules/`): "한 가지를 잘 하는" 재사용 도구. vpc, subnet, s3, lb, instance, iam 등. 동적 구성(Ch06)으로 유연성 확보. 1 depth. 다른 프로젝트에서 그대로 쓸 수 있다.
  - **Infrastructure Module** (root: `network/`, `platform/`, `workload/`): "함께 배포 + 권한 경계" 기준 조립. 프로젝트 전용. Resource Module을 호출만 한다.
  - Ch05에서 Infra Module(하드코딩) 먼저 → Ch06에서 Resource Module 추출(동적) → Infra Module이 Resource Module을 호출하도록 리팩토링
  - 이 구조를 독자에게 **자연스럽게 체험**시킨다. 명시적 "이게 Resource Module이다" 분류보다 코드 경험이 우선. 설계 당위는 Architecture & Design 시리즈.
  - **이 구조가 후속 IaC 시리즈(Azure IaC with Terraform, GCP IaC with Terraform)의 확장 고리다.** modules/의 Resource Module은 Cloud 중립적 인터페이스로 진화 가능.
- **lab00 코드의 위치**: lab00의 동적 구성 코드는 Ch06 Gallery에서 Resource Module로 제자리를 찾는다. 모듈 없이 flat 파일에서 동적 구성을 했던 것(파일 네이밍으로 proto-module 시뮬레이션)이 이제 실제 모듈 구조 위에 놓인다.
- **map output 패턴 도입 시점 — Ch05 Gallery(05.04)**: `{ (var.name) = { 정보 } }` 패턴은 Ch05 Sec01~03에서 사용하지 않는다. 단일 리소스 모듈이나 하나뿐인 모듈에서 map wrapper는 불필요한 ceremony. **같은 타입 여러 개를 이름으로 구분해야 할 때** 동기가 생긴다. Ch05 Gallery에서 subnet 4개 하드코딩이 첫 등장 시점. Ch06 동적 구성에서 `for_each`가 자연스럽게 이 구조를 생성하며 본격 활용.
- **Ch05 Sec01 output 구조**: lab01은 단순 output(`output "id"`), root output은 object 패턴(`{ id = module.vpc.id }`). lab02~03은 리소스별 object output(`output "vpc" { value = { id = ... } }`). root output은 `output "resource" { value = { network = module.network, iam = module.iam } }`. name variable은 리소스 식별자(모듈 식별 아님) — 단일 리소스 모듈은 `name`, 복합 모듈은 `vpc_name`/`subnet_name`/`role_name`.
- **var.env는 02.05부터 연속 사용**: naming-tagging "예외" 표기를 제거하고 02.05+부터 env가 namespace에 포함되는 것으로 정리 완료. Ch07은 "도입"이 아니라 "체계화".
- **모듈 variable/output 네이밍 원칙**: variable(input)은 AWS 리소스 argument 이름과 일치시킨다(`cidr_block`, `availability_zone`). output은 소비자가 정해져 있지 않으므로 모듈 설계자가 자유롭게 정한다(`output "vpc" { id = ... }`).
- **Ch05 구조 확정 — 5섹션, Gallery 1개**: 05.01 모듈 개념(draft완료), 05.02 모듈 경계와 인프라 계층(draft완료), 05.03 Gallery: ALB+ASG, 05.04 Module Management, 05.05 Public Registry. 전체 38섹션, Gallery 7개.
- **Ch05 Gallery = compute path, Ch06 Gallery = + data path**: Ch05 Gallery에서 S3+RDS 제외. ALB+EC2/ASG까지만 하드코딩. Ch06 Gallery에서 Resource Module 추출 + RDS+S3 추가로 3-tier 완성. Ch06 Gallery가 리팩토링뿐 아니라 새 인프라 추가의 실질적 내용을 갖는다.
- **Ch05/Ch06 설계 원칙 — 용어 없이 개념 체험**: Layer Module, Resource Module 용어는 사용하지 않는다. Ch05는 "인프라 계층 = 모듈 단위" 개념에 충실, Ch06은 "재사용성을 위한 추출·리팩토링" 개념에 충실. 독자가 나중에 용어를 접했을 때 "Ch05가 Layer Module, Ch06이 Resource Module이었구나" 하고 연결되도록 설계.
- **05.02 Lab lab01~04 확정**: 독립 디렉토리 4개. 각 lab이 해당 시점의 완전한 코드를 갖는다. lab03에서 workload가 network만 참조, lab04에서 platform 추가 후 workload가 platform도 참조. "역방향 금지 + 자유로운 하위 참조" 패턴 체험. 설정 스키마(configuration schema) + `(known after apply)` 주석 컨벤션 도입.
- **설정 흐름 3-layer (Architecture & Design 시리즈로 이관)**: root locals(설정 스키마, 사용자 관점) → module variables(인터페이스) → module locals(리소스 생성을 위한 가공, 구현 관점) → resource. flat vs object 선택 기준: Layer Module(여러 리소스)은 object 필수, Resource Module(단일 리소스)은 flat 가능. root locals가 module variable 구조와 일치해야 하는 이유(인터페이스 매칭), 동적 설정 `(known after apply)` 주석 컨벤션, spec 패턴(고유 속성 vs 연결/동작 설정) — 이 시리즈에서 체험하고, Architecture & Design에서 당위성을 다룬다.
- **3-Layer 의존 방향 — 역방향 금지 + 자유로운 하위 참조**: 엄격한 단일 체인(workload→platform→network)이 아니라, workload가 network와 platform을 자유롭게 참조하는 팬아웃 구조. 규칙은 "역방향 금지"만. AWS/Azure/GCP 공통 제약 — Launch Template/VMSS/Instance Template이 layer를 관통하는 join point. 업계 표준(HashiCorp flat composition, AWS domain decomposition, Platform Spec 4-layer)도 엄격한 단일 체인 강제 안 함. "왜 2-tier가 아니라 3-layer인가" 당위성 논의는 Architecture & Design 시리즈로 미룬다 — 이 시리즈에서는 변경 빈도 차이를 체험하는 것으로 충분.
- **Ch06 구조 확정 — 5섹션, Gallery 2개**: Sec01~03은 교과서 제목이지만 내용은 Ch05 Layer 모듈 리팩토링. Gallery 2개: 06.04 리팩토링, 06.05 3-tier 확장.

---

## [2026-04-28~29] 05.01/05.02 draft 완성 + 기술 협의

- **05.01 이론 보강**: § 4 리소스 설정값의 variable화 (VPC raw → variable, default, 네이밍 규칙), § 5~7 번호 밀림
- **05.01 lab01~03 전면 수정**: 코드 순서 main→variables→outputs, 리소스 원형 주석 패턴, variable default 반영 (enable_dns_*, map_public_ip_on_launch), optional은 lab03 object type에서 도입
- **05.02 lab 순서 변경**: lab03 workload → **platform**, lab04 platform → **workload**. 이유: workload를 먼저 올려도 SSM 연결 안 됨, 검증 불가
- **05.02 lab01~04 전면 수정**: 실제 코드 패턴 반영 (list type, index 기반, computed key, nested merge, spec 패턴, 설정 스키마 주석)
- **리소스 원형(raw resource) 주석 패턴**: 05.01, 05.02에서 모듈화되는 리소스의 원래 모습을 주석으로 코드 블록 상단에 배치. 값은 리터럴. Ch06+에서는 불필요.
- **코드 설명 순서**: main.tf → variables.tf → outputs.tf. "뭘 만든다 → 뭘 받는다 → 뭘 내보낸다"
- **설정 스키마 주석 두 패턴**: `(known after apply)` — 동적 값, `(default)` — optional default 생략. variable 스키마 구조로 주석. object 껍데기(`{ }`)는 항상 남겨둔다 — merge 패턴 통일 + 실수 방지.
- **root module output 3가지 용도**: 디버깅/개발(module 전체 노출), 사용자 접근 정보(endpoint), State 간 연동. 05.01 lab02에서 설명.
- **Ch05 Gallery 통합**: 05.03(ALB+EC2) + 05.04(ASG) → **05.03 Gallery: ALB+ASG** 하나로. Ch05 5섹션, 전체 38섹션, Gallery 7개.
- **natgw subnet_id는 모듈 내부 참조**: Layer Module에서는 같은 모듈의 `aws_subnet.public_0.id`를 직접 참조 — variable로 뺄 수 없다 (순환 참조). Resource Module(Ch06)에서 분리하면 그때 variable로.

---

## [2026-04-29] 기술 협의 결정

- **모듈 구성 패턴 전환**: root settings schema + merge 패턴 → 모듈 locals 소유 + flat variable. 모듈은 자기 리소스 설정을 locals에서 정의한다. variable은 모듈이 스스로 해결 못하는 것만: ① namespace(정체성) ② cross-module 의존(다른 모듈 output). 계기: 05.01 lab02의 prefix 문제를 root object variable이 아닌 모듈 locals로 해결해야 했다. root schema + merge는 Ch06에서 소멸할 임시 패턴 — 처음부터 가르치지 않는다. 용어: "모듈 구성(module configuration)" — 모듈 locals.tf의 리소스 설정 구조. 영향: 05.01 lab03~, 05.02 전체, 05.03 Gallery, Ch06 구조에 적용.
- **코드 배치 순서 변경**: main.tf → locals.tf → variables.tf → outputs.tf. 기존 main→variables→outputs에서 locals가 추가되며 순서 변경. "뭘 만든다 → 어떤 설정으로 → 뭘 받아야 하고 → 뭘 내보낸다"
- **누적 적용 기준 교체**: "05.01 lab03~: 모듈 구성 패턴 (모듈 locals 설정, flat variable)" — 기존 "root settings schema, merge 패턴, `(known after apply)` 주석" 삭제
- **Ch06 Gallery 가정 확정**: RDS → platform 모듈, user_data templates → workload 모듈 내부
- **05.03 Gallery draft 완료**, 07.01~07.05 draft 완료 (07.05는 Ch06 가정)
- **08.01부터 1st iteration 계속**

---

## [2026-04-30] 기술 협의 결정

- **Ch06 챕터명 변경**: "동적 구성" → **"재사용 가능한 모듈 & 동적 구성"**. Layer Module에서 리소스 코드를 분리해 재사용 가능한 모듈로 추출한다. 동적 구성은 재사용 모듈을 만드는 도구다.
- **Layer Module의 선언적 특성 유지 원칙**: 동적 구성(for_each, dynamic, cidrsubnet 등)은 분리된 재사용 모듈 안에 숨긴다. Layer Module은 "무엇을 만들어달라"고 선언만 한다. 조건부 모듈 생성(count)과 known set 순회(for_each over locals)는 Layer에서 허용.
- **2회 iteration 작업 순서**:
  - 시리즈는 3개 Part로 나뉜다: Part 1(Ch01~05.03) TF 도구 학습 + 하드코딩 모듈, Part 2(Ch05.04~06, Ch08.02~03) 재사용 모듈 + 동적 구성 + Provider 심화, Part 3(Ch07, Ch08.01, Ch09) 환경 분리 + CI/CD 배포 경로
  - 1st iteration = Part 3: Ch07 전체, Ch08.01, Ch09 전체. 05.03 Gallery(ALB+ASG+3-Layer+Remote State)가 CI/CD 대상 인프라로 충분하므로 Part 2 없이 배포 경로를 먼저 완성한다. 짧은 강의에서도 파이프라인 체험을 앞당길 수 있다
  - 2nd iteration = Part 2: Ch05.04~05, Ch06 전체, Ch08.02~03. Ch06은 05.03 코드가 안정된 후 리팩토링. Ch08.02~03은 모듈에 alias Provider를 넘기는 패턴이라 Ch06 모듈 구조를 전제한다
- **Ch05 전면 개편 완료**: 05.01 lab03 + 05.02 lab01~04 + 05.03 Gallery — 모듈 구성 패턴 적용, root schema/merge 제거, draft 수정 완료. (소스 코드는 사용자가 직접 작성)

---

## [2026-05-01] 기술 협의 결정

- **05.03 Gallery draft 수정 완료**: 모듈 구성 패턴(flat locals, vpc_id 독립, lt_*/asg_* prefix, local.infra, instance_refresh + DeployVersion tag) 반영
- **07.05 Gallery Ch06 가정 → Ch05 기반으로 재작성**: 환경 분리의 핵심은 "같은 인프라를 다른 설정으로 배포하는 것". ALB+ASG(05.03)로 충분. Gallery 누적 원칙은 인프라 진화(Ch06에서 완성)이고, Ch07+는 운용 방법이므로 어느 시점 인프라든 적용 가능
- **09.03 Gallery도 Ch05 기반**: 07.05와 같은 이유. check 블록 추가가 핵심이지 인프라 구조가 아님
- **08.01 draft 완료**, 09.01, 09.02 draft 완료 — 1st iteration 진행 중

---

## [2026-05-03] 기술 협의 결정

- **Ch02 섹션 재배치**: 02.04(variable & output) ↔ 02.05(locals & data source) 교환
  - 새 02.04 "locals & output": locals가 설정의 중심. `local → resource → output` 내부 흐름 먼저
  - 새 02.05 "variable & data source": `variable + datasource → locals` 외부 입력은 나중에
  - 이유: `var → local → resource` 흐름에서 destination(local)을 먼저 가르치고 source(variable)를 나중에. Ch07 환경 분리 전까지 variable 비중이 크지 않음
- **새 02.04 lab01 코드 변경**: 현 02.05/lab01에서 `var.*` 참조를 전부 하드코딩으로 교체. "리소스에 박혀있는 값을 local로 구조화한다"가 핵심 메시지. 모듈 구성 패턴(Ch05)과 일관성 유지
- **누적 적용 기준 변경**: 02.04~: `local.instance` 구조화, output object. 02.05~: variable validation, data source → locals 통합

- **Ch02 섹션 재배치 완료**: 02.04(locals & output), 02.05(variable & data source). draft 재작성, README 업데이트, 디렉토리명 변경 완료
- **`{env}` 도입 시점 Ch07로 이동**: 02.05에서 var.env 제거. namespace 점진적 확장: Ch02~04.02({project}) → Ch04.03({org}-{project}) → Ch07({org}-{project}-{env})
- **리소스 네이밍 규칙 콜아웃**: 02.01 이론 끝에 추가 (capability 목록, namespace 점진 확장, identity 규칙)
- **리소스 원형 주석 규칙**: style-guide에 추가. main.tf 리소스 블록 위에 하드코딩 원형 주석 포함
- **파일 설명 순서 규칙 수정**: variables.tf → (variables.tf + datasources.tf) 통합
- **02.04 lab01**: locals object 구조화 + `this` 레이블 + 리소스 원형 주석. 코드에 맞춰 draft 재작성 완료
- **02.04 lab02**: output object 구조화 + `web_endpoint` + SSM/httpd 접속 체험 추가
- **02.05 lab01**: variable 추출 + 타입 정의 + `-var` CIDR/port 변경 체험
- **02.05 lab02**: variable validation
- **02.05 lab03**: data source → locals 통합 + `local.vpc_id` module-level + 4영역 다이어그램

- **02.06 Gallery draft 전면 재작성 완료**
- **03.02, 03.03 draft**: 리소스 레이블 `this`로 변경 완료 (이론 예시는 유지)
- **04.03 lab01 draft**: org/project 분리 + namespace + s3bucket object + computed key + 리소스 원형 반영 완료
- **04.03 lab02 draft**: env 제거, key prefix `04.03/lab02/` 반영 완료
- **naming-tagging.md**: S3 버킷 "네이밍 룰 예외" 제거. bucket은 리소스 인수일 뿐

- **05.01 draft 수정 완료**: env 제거, org/project/namespace 복원, computed key 전 모듈 output 반영, root main.tf key 접근(`["main"]`, `["public-a"]`, `["instance-web"]`) 반영, 환기 문구 정리
- **02.04 lab02 output**: computed key 반영 완료, SG computed key 없는 이유 + "Ch05에서 다시 다룬다" 서술

---

## [2026-05-05] 기술 협의 결정

- **Ch09 CI/CD 섹션 재구성 — 7→8 섹션**: IaC 파이프라인을 4 역할(Quality, Review, Deploy, Monitor)로 개념화하고, 3개 워크플로우 파일(`review.yml`, `deploy.yml`, `monitor.yml`)로 구현하는 프레임. 기존 09.05(과부하)를 09.05(개념+입문)와 09.06(인프라 배포)로 분리. 전체: 09.05 IaC 워크플로우 → 09.06 인프라 배포 워크플로우 → 09.07 품질 자동화 → 09.08 멀티 환경 배포 & 운영.
- **워크플로우 파일 진화 모델**: 09.05에서 review.yml+deploy.yml 생성(AWS 없이), 09.06에서 OIDC+실제인프라로 확장, 09.07에서 review.yml에 quality-gate job 추가, 09.08에서 deploy.yml 멀티환경 확장 + monitor.yml 신규. 각 섹션이 하나의 워크플로우를 추가/확장.
- **09.05 lab 설계**: lab01(review.yml, PR→plan), lab02(deploy.yml, merge→apply) — locals+output만으로 AWS 없이 GitHub Actions 메커니즘 체험. "이론의 두 흐름을 각각 한 lab씩."
- **총 섹션 수 38→39, Ch09 7→8섹션.** series-hierarchy, CLAUDE.md 반영 완료.

### 다음 세션 작업

- **09.05 draft 재작성** — 개념+입문(2 labs). 파이프라인 전체 그림 이론 + lab01(review.yml) + lab02(deploy.yml)
- **09.06~08 순차 작성** — 각 섹션별 draft → review → README

---
