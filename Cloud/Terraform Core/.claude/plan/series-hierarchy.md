# Terraform Core — Series Hierarchy

> Single Source of Truth. 모든 구조 변경은 이 파일에서 시작한다.

---

## 시리즈 개요

- **대상**: Cloud Fundamentals(AWS·Azure·GCP 중 하나 이상)를 학습한 개발자
- **방식**: Terraform 도구 자체의 메커니즘 중심. 실습 기반은 AWS (서비스 설명 없이 실습 수단으로만 사용)
- **목적**: Terraform의 핵심 개념과 동작 원리를 체계적으로 정리
- **언어**: 한국어 설명, 기술 용어는 영문 유지
- **Terraform 버전**: 1.10.x (챕터별로 요구 버전이 있는 경우 해당 섹션에 명시)

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

| 유형 | 이름 | 번호 | 표기 예 | 위치 |
|------|------|------|---------|------|
| Section Lab | 섹션 개념 검증 실습 | 섹션 내 로컬 순번 (lab01~) | `[실습] lab02: count로 EC2 다중 생성` | Section draft 내 포함 |
| 시리즈 실습 | Gallery | 없음 | `[실습] Gallery: EC2에 Gallery 앱 배포` | 챕터 종속, 전용 draft 파일 |

### Gallery 위치 원칙

- 섹션 종속이 아닌 **챕터 종속**
- 해당 챕터의 핵심 개념이 충분히 커버된 후 챕터 마지막 또는 적절한 시점에 배치
- 번호 없음. 이전 Gallery 실습 결과를 누적하여 발전시키는 구조

### Gallery Workload

- **앱**: gallery-spring-boot (Spring Boot 3.5.x, Java 21)
- **소스**: `Cloud/Workloads/gallery-spring-boot/`
- **기본 구성**: H2 인메모리 DB, 로컬 스토리지, 포트 8080 (dev 프로파일)

### Gallery 누적 진행 흐름

| 챕터 | Gallery 실습 | 핵심 변화 |
|------|-------------|----------|
| Ch01 | EC2 기본 배포 | EC2 + SG, user_data로 JDK 설치 + JAR 실행. 최초 배포 |
| Ch03 | Remote Backend 이전 | TF state를 S3 + DynamoDB backend로 이전. 앱은 그대로 |
| Ch05 | 모듈화 | vpc / sg / ec2 모듈 분리. 인프라 코드 재구성 |
| Ch06 | 환경 분리 | dev / prod 환경 분리 (workspace 또는 디렉토리 방식) |
| Ch08 | 검증 추가 | check 블록으로 Gallery EC2 HTTP 응답 상시 검증 |

### 파일 규칙

| 파일 | 위치 | 형식 |
|------|------|------|
| 노션 초안 (섹션) | `.claude/draft/` | `{ch_no}.{sec_no}.claude.notion.md` |
| 노션 초안 (Gallery) | `.claude/draft/` | `{ch_no}.gallery.claude.notion.md` |
| 섹션 README | `{ch_no} {name}/{sec_no} {name}/` | `README.md` (draft 완료 후 별도 작성) |
| Gallery 예제 파일 | `{ch_no} {name}/Gallery - {name}/` | `.tf` 파일 등 |

---

## Chapter / Section 구성

### Chapter 01 — Terraform 시작하기

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | IaC와 Terraform 포지셔닝 | — | 이론 (IaC 개념, TF 위치, 멀티클라우드 도구) |
| 02 | 설치 및 환경 구성 | lab01 | terraform CLI 설치, AWS credential 설정, provider 연결 확인 |
| 03 | 첫 번째 리소스 배포 | lab01, lab02 | EC2 + Security Group 생성, plan/apply/destroy 사이클 |
| 04 | Terraform 동작 원리 | — | 이론 (init→plan→apply→destroy 내부 동작, .terraform 디렉토리) |
| Gallery | [실습] Gallery: EC2에 Gallery 앱 배포 | — | user_data로 JDK 설치 + JAR 실행. 최초 배포 |

---

### Chapter 02 — HCL & 핵심 블록

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | HCL 문법 기초 | — | 이론 (블록, 인수, 표현식, 타입 시스템) |
| 02 | resource 블록 | lab01, lab02 | EC2 + SG 참조 표현식, depends_on |
| 03 | variable & output | lab01, lab02 | 변수 타입·기본값 정의, output 활용 |
| 04 | locals & data source | lab01, lab02 | locals 표현식, AMI data source 조회 |

---

### Chapter 03 — State 메커니즘

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | State란 무엇인가 | — | 이론 (실제 인프라와 state의 관계, desired vs actual) |
| 02 | State 파일 구조 | — | 이론 (terraform.tfstate 분석, serial·lineage) |
| 03 | Remote Backend | lab01, lab02 | S3 버킷 + DynamoDB 생성, backend 설정 및 state 이전 |
| 04 | State 명령어 | lab01, lab02, lab03 | state list/show, state mv/rm, import |
| Gallery | [실습] Gallery: Remote Backend 이전 | — | Gallery 인프라 state를 S3 + DynamoDB backend로 이전 |

---

### Chapter 04 — 변수 심화 & 표현식

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | 변수 입력 방법 | lab01, lab02 | tfvars 파일, 환경변수(TF_VAR_*), CLI 플래그 |
| 02 | 조건식 & 반복 | lab01, lab02, lab03 | count, for_each, dynamic 블록 |
| 03 | 내장 함수 | lab01, lab02 | string / collection / numeric 함수 활용 |

---

### Chapter 05 — 모듈

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | 모듈 개념과 구조 | — | 이론 (root/child module, 입력·출력, 재사용성) |
| 02 | 로컬 모듈 작성 | lab01, lab02 | vpc 모듈, ec2 모듈 작성 및 입출력 설계 |
| 03 | 모듈 조합 | lab01 | 여러 모듈 조합, 의존성 처리 |
| 04 | Public Registry 모듈 | lab01 | Terraform Registry 모듈 활용 |
| Gallery | [실습] Gallery: 인프라 모듈화 | — | Gallery 인프라를 vpc / sg / ec2 모듈로 분리 |

---

### Chapter 06 — Workspace & 환경 분리

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Workspace 개념 | — | 이론 (workspace vs 디렉토리 분리 방식 비교) |
| 02 | Workspace 실습 | lab01, lab02 | workspace 생성·전환, workspace별 리소스 분리 확인 |
| 03 | 디렉토리 기반 환경 분리 | lab01 | 환경별 디렉토리 구조, tfvars 분리 |
| Gallery | [실습] Gallery: dev/prod 환경 분리 | — | Gallery 인프라를 dev / prod 환경으로 분리 |

---

### Chapter 07 — Provider 심화

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | Provider 버전과 lock 파일 | — | 이론 (.terraform.lock.hcl, 버전 제약 문법) |
| 02 | Multiple Provider 설정 | lab01, lab02 | alias 설정, 멀티 리전 리소스 배포 |
| 03 | Provider 의존성 관리 | lab01 | version constraints, terraform providers lock, upgrade |

---

### Chapter 08 — 코드 품질 & 테스트

| No | 제목 | Lab | 비고 |
|----|------|-----|------|
| 01 | fmt / validate / lint | lab01, lab02 | terraform fmt·validate, tflint 설치 및 실행 |
| 02 | Custom Validation & Runtime Guards | lab01, lab02, lab03 | validation 블록, precondition/postcondition, check 블록 (TF 1.5+) |
| 03 | Terraform Test | lab01, lab02 | .tftest.hcl 작성, mock provider (TF 1.7+) |
| 04 | CI/CD 연동 브릿지 | — | 이론 (GitHub Actions에서 TF 워크플로우 연결, 브릿지 수준) |
| Gallery | [실습] Gallery: 검증 추가 | — | check 블록으로 Gallery EC2 HTTP 응답 상시 검증 |

---

## Gallery 맵

| Gallery | 챕터 | 전제 조건 | 핵심 포인트 |
|---------|------|-----------|------------|
| EC2에 Gallery 앱 배포 | Ch01 | Ch01 Sec02~03 완료 | user_data로 JDK + JAR 실행. 최초 배포 |
| Remote Backend 이전 | Ch03 | Ch03 Sec03 완료 | state를 S3+DynamoDB로 이전 |
| 인프라 모듈화 | Ch05 | Ch05 Sec02~03 완료 | vpc/sg/ec2 모듈 분리 |
| dev/prod 환경 분리 | Ch06 | Ch06 Sec02~03 완료 | 환경별 인프라 분리 |
| 검증 추가 | Ch08 | Ch08 Sec02 완료 | check 블록으로 HTTP 상시 검증 |

---

## 작업 상태

| Chapter | 상태 |
|---------|------|
| 01 Terraform 시작하기 | 계획확정 |
| 02 HCL & 핵심 블록 | 계획확정 |
| 03 State 메커니즘 | 계획확정 |
| 04 변수 심화 & 표현식 | 계획확정 |
| 05 모듈 | 계획확정 |
| 06 Workspace & 환경 분리 | 계획확정 |
| 07 Provider 심화 | 계획확정 |
| 08 코드 품질 & 테스트 | 계획확정 |
