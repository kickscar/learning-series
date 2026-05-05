# Terraform Core — Series Hierarchy

> Single Source of Truth. 모든 구조 변경은 이 파일에서 시작한다.

---

## 시리즈 개요

- **대상**: Cloud Fundamentals(AWS·Azure·GCP 중 하나 이상)를 학습한 개발자
- **방식**: Terraform 도구 자체의 메커니즘 중심. 실습 기반은 AWS (서비스 설명 없이 실습 수단으로만 사용)
- **목적**: Terraform의 핵심 개념과 동작 원리를 체계적으로 정리
- **언어**: 한국어 설명, 기술 용어는 영문 유지
- **Terraform 버전**: 1.14.x (챕터별로 요구 버전이 있는 경우 해당 섹션에 명시)
- **학습 철학**: 반복과 심화 — 핵심 개념을 Ch01에서 가볍게 소개하고 이후 챕터에서 점진적으로 깊어진다

---

## 문서 구조 규칙

### Chapter > Section > Section Lab / Chapter > Gallery

```
Chapter
├── Section 01              ← 이론 + Section Lab 포함
│   ├── [실습] lab01: ...
│   └── [실습] lab02: ...
├── Section 02              ← 이론만 (Lab 없음)
├── Section 03              ← 이론 + Section Lab 포함
│   └── [실습] lab01: ...
└── [실습] Gallery: ...     ← 시리즈 실습, 챕터 종속 (섹션 아님)
```

### 두 가지 실습 유형

| 유형 | 이름 | 번호 | State | 표기 예 |
|------|------|------|-------|---------|
| Section Lab | 섹션 개념 검증 실습 | 섹션 내 로컬 순번 (lab01~) | **Local** (일회성 샌드박스) | `[실습] lab02: count로 EC2 다중 생성` |
| 시리즈 실습 | Gallery | 없음 | **Remote** (S3, 챕터 간 누적) | `[실습] Gallery: EC2에 Gallery 앱 배포` |

- Section Lab: 개념 확인 후 `terraform destroy`로 정리. 로컬 State 사용.
- Gallery: 챕터마다 인프라가 누적 발전. **Ch04 Gallery(04.04)부터** S3 Remote Backend(`tf-core-tfstate` 버킷, `key = "gallery/terraform.tfstate"`) 사용. Ch02 Gallery는 Local State.

### Gallery 위치 원칙

- 섹션 종속이 아닌 **챕터 종속**
- 해당 챕터의 핵심 개념이 충분히 커버된 후 챕터 내 적절한 시점에 배치
- 번호 없음. 이전 Gallery 실습 결과를 누적하여 발전시키는 구조
- 강의 교재로 활용 시: 챕터 마무리 과제 수준

### Gallery Workload

- **앱**: gallery-spring-boot (Spring Boot 3.5.x, Java 21)
- **소스**: `Cloud/Workloads/gallery-spring-boot/`
- **기본 구성**: H2 인메모리 DB, 로컬 스토리지, 포트 8080 (dev 프로파일)

### Gallery 누적 진행 흐름

| 챕터 | Gallery 실습 | 핵심 변화 |
|------|-------------|----------|
| Ch02 | EC2 기본 배포 | EC2 + SG, 수동 설치 (SSM). `EC2:8080` |
| Ch04 | user_data 자동화 + Remote Backend | user_data + templatefile + systemd. S3 backend. `EC2:8080` |
| Ch05 | ALB + ASG | 3-Layer 모듈 기반, Gallery 앱 배포, ALB + ASG. `ALB:80` |
| Ch06 (06.04) | 모듈 리팩토링 | modules/ 호출 전환. 기존 동작 유지. `ALB:80` |
| Ch06 (06.05) | 3-tier 확장 | modules/rds + modules/s3 추가. 3-tier 완성. `ALB:80` |
| Ch07 | 환경 분리 | dev / prod 환경 분리. `ALB:80` (env별) |
| Ch09 | 검증 추가 | check 블록으로 HTTP 응답 상시 검증 |

### 파일 규칙

| 파일 | 위치 | 형식 |
|------|------|------|
| 노션 초안 (섹션) | `.claude/draft/` | `{ch_no}.{sec_no}.claude.notion.md` |
| 노션 초안 (Gallery) | `.claude/draft/` | `{ch_no}.{sec_no}.claude.notion.md` |
| 섹션 README | `{ch_no} {name}/{sec_no} {name}/` | `README.md` (draft 완료 후 별도 작성) |
| Gallery 예제 파일 | `{ch_no} {name}/{sec_no} [실습] Gallery: {name}/` | `.tf` 파일 등 |

---

## Chapter / Section 구성

### Chapter 01 — Terraform 시작하기

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | IaC와 Terraform 포지셔닝 | — | 이론 (IaC 개념, 도구 유형, TF 포지셔닝 3축, 멀티클라우드 도구) |
| 02 | 설치 및 환경 구성 | lab01 | terraform CLI 설치, AWS credential 설정, provider 연결 확인 |
| 03 | Terraform 핵심 개념 | — | 이론 (전체 동작 흐름, 핵심 구성 요소, 작업 디렉터리·파일 구성) |

---

### Chapter 02 — HCL 기초

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | HCL 기본 문법 | lab01, lab02, lab03 | 이론 + 블록·인수·속성(plan), 타입 시스템(plan), terraform console 표현식 실험 |
| 02 | provider 블록 | lab01, lab02 | terraform 블록, required_providers, version constraints, default_tags 확인 |
| 03 | resource 블록 | lab01, lab02, lab03 | SG/EC2 생성, plan/apply/destroy 첫 경험, depends_on |
| 04 | locals & output | lab01, lab02 | locals object 구조화, namespace 패턴, output object 구조화 |
| 05 | variable & data source | lab01, lab02, lab03 | 변수 타입·validation, data source 조회, locals 통합 |
| 06 | [실습] Gallery: EC2에 Gallery 앱 배포 | — | user_data로 JDK 설치 + JAR 실행. 최초 배포 |

---

### Chapter 03 — Execution Model

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Terraform 워크플로우 | — | 이론 심화 (init/plan/apply/destroy 내부 동작, lock 파일) |
| 02 | Dependency Graph | lab01 | DAG, 병렬 실행, -target, terraform graph 시각화 |
| 03 | Destroy와 리소스 생명주기 | lab01 | lifecycle 블록, prevent_destroy, create_before_destroy |

---

### Chapter 04 — State Management

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | State란 무엇인가 | — | 이론 (실제 인프라와 state의 관계, desired vs actual) |
| 02 | State 파일 구조 | — | 이론 (terraform.tfstate 분석, serial·lineage) |
| 03 | Remote Backend | lab01, lab02 | S3 버킷 생성, S3 native locking(use_lockfile), backend 설정 및 state 이전 |
| 04 | [실습] Gallery: user_data 자동화 + Remote Backend 이전 | — | user_data + templatefile + systemd 자동 배포, state를 S3 backend로 이전 |
| 05 | State 명령어 | lab01, lab02, lab03 | state list/show, state mv/rm, import |

---

### Chapter 05 — 모듈

> Ch04까지 = TF 도구 학습 완료. Ch05부터 = 팀/실무 운용.
> 동적 구성 없이 하드코딩으로 모듈 구조를 잡는다. Infra Module에 충실.

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | 모듈 개념과 구조 | lab01, lab02, lab03 | root/child module, 입력·출력, Console→Module, object type variable, locals 구조화 |
| 02 | 모듈 경계와 인프라 계층 | lab01~04 | 3-Layer 점진 구축: lab01 network(public), lab02 network(full), lab03 +platform, lab04 +workload+연결 |
| 03 | [실습] Gallery: ALB + ASG | — | 05.02 layer 모듈 기반, Gallery 앱 배포, ALB + ASG + TG 자동 등록 |
| 04 | Module Management | lab01 | terraform graph 모듈 시각화, moved 블록, 모듈 버전 관리 |
| 05 | Public Registry 모듈 | lab01 | Terraform Registry 모듈 활용 |

---

### Chapter 06 — 재사용 가능한 모듈 & 동적 구성

> Ch05 Layer Module에서 리소스 코드를 분리해 재사용 가능한 모듈로 추출한다. 동적 구성(count/for_each/dynamic/함수)은 재사용 모듈을 만드는 도구다.

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | 조건식 & count / for_each | lab01~04 | Ch05 network/ 리팩토링: Subnet for_each, NAT GW count, modules/vpc+subnet 추출 |
| 02 | for expression & dynamic 블록 | lab01, lab02 | Ch05 platform/ 리팩토링: dynamic SG, modules/sg+lb 추출 |
| 03 | 내장 함수 | lab01 | 전체 modules/ 검증 강화: cidrsubnet/lookup/try/can |
| 04 | [실습] Gallery: 모듈 리팩토링 | — | Ch05 Gallery → modules/ 호출 구조 전환. 기존 동작 유지 확인 |
| 05 | [실습] Gallery: 3-tier 확장 | — | modules/rds + modules/s3 추가. MariaDB + S3 전환. 3-tier 완성 |

---

### Chapter 07 — 환경 분리

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Workspace 개념 | — | 이론 (workspace vs 디렉토리 분리 방식 비교) |
| 02 | Workspace 실습 | lab01, lab02 | workspace 생성·전환, workspace별 리소스 분리 확인 |
| 03 | 디렉토리 기반 환경 분리 | lab01 | 환경별 디렉토리 구조, tfvars 분리 |
| 04 | 변수 입력 전략 | lab01, lab02 | tfvars 공통 설정, -var-file 환경별, TF_VAR_* CI/CD, default 전략 |
| 05 | [실습] Gallery: dev/prod 환경 분리 | — | Gallery 인프라를 dev / prod 환경으로 분리 |

---

### Chapter 08 — Provider 심화

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Provider 버전과 lock 파일 | — | 이론 (.terraform.lock.hcl, 버전 제약 문법) |
| 02 | Multiple Provider 설정 | lab01, lab02 | alias 설정, 멀티 리전 리소스 배포 |
| 03 | Provider 의존성 관리 | lab01 | version constraints, terraform providers lock, upgrade |

---

### Chapter 09 — 코드 품질 & 배포 자동화

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | fmt / validate / lint | lab01, lab02 | terraform fmt·validate, tflint 설치 및 실행 |
| 02 | Lifecycle Guards: precondition · postcondition · check | lab01, lab02 | precondition/postcondition, check 블록 (TF 1.5+). validation 기본은 Ch02 Sec04 |
| 03 | [실습] Gallery: 검증 추가 | — | check 블록으로 Gallery EC2 HTTP 응답 상시 검증 |
| 04 | Terraform Test | lab01, lab02 | .tftest.hcl 작성, mock provider (TF 1.7+) |
| 05 | IaC 워크플로우 | lab01, lab02 | IaC 파이프라인 전체 그림(4 역할), GitHub Actions 입문, Review+Deploy 워크플로우 체험 (AWS 없이) |
| 06 | 인프라 배포 워크플로우 | lab01, lab02 | AWS OIDC 인증, 인프라 plan+PR comment, apply+concurrency |
| 07 | 품질 자동화 | lab01, lab02 | quality-gate(fmt→validate→tflint→tfsec), pre-commit, branch protection |
| 08 | 멀티 환경 배포 & 운영 | lab01, lab02 | 멀티 환경 순차 배포, GitHub Environments+approval, drift 감지, monitor.yml |

---

## Gallery 맵

| Gallery | 챕터 | 전제 조건 | 핵심 포인트 | 접속 경로 |
|---------|------|-----------|------------|----------|
| EC2에 Gallery 앱 배포 | Ch02 | Ch02 Sec02~05 완료 | EC2 + SG, 수동 설치 (SSM 접속). 최초 배포 | `EC2 public IP:8080` |
| user_data 자동화 + Remote Backend | Ch04 | Ch02 Gallery 완료, Ch04 Sec03 완료 | user_data + templatefile + systemd. S3 backend | `EC2 public IP:8080` |
| ALB + ASG | Ch05 | Ch04 Gallery 완료, Ch05 Sec02 완료 | 3-Layer 모듈 기반, Gallery 앱 배포, ALB + ASG + TG 자동 등록 | `ALB DNS:80` |
| 모듈 리팩토링 | Ch06 | Ch05 Gallery 완료, Ch06 Sec01~03 완료 | modules/ 호출 구조 전환. 기존 동작 유지 확인 | `ALB DNS:80` |
| 3-tier 확장 | Ch06 | Ch06 Gallery(06.04) 완료 | modules/rds + modules/s3 추가. 3-tier 완성 | `ALB DNS:80` |
| dev/prod 환경 분리 | Ch07 | Ch05 Gallery 완료, Ch07 Sec01~04 완료 | 디렉토리 기반 환경 분리. envs/dev, envs/prod | `ALB DNS:80` (env별) |
| 검증 추가 | Ch09 | Ch05 Gallery 완료, Ch09 Sec02 완료 | check 블록으로 HTTP 상시 검증 | `ALB DNS:80` |

---

## 작업 상태

| Chapter | 상태 |
|---------|------|
| 01 Terraform 시작하기 | draft완료 |
| 02 HCL 기초 | draft완료 |
| 03 Execution Model | draft완료 |
| 04 State Management | draft완료 |
| 05 모듈 | 재구성 (5섹션, Gallery 1개) |
| 06 동적 구성 | 재구성 (5섹션, Gallery 2개: 리팩토링 + 3-tier 확장) |
| 07 환경 분리 | 계획확정 |
| 08 Provider 심화 | 계획확정 |
| 09 코드 품질 & 배포 자동화 | 재구성 (7→8섹션, Gallery 1개) |
