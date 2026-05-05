# Terraform: 코드로 설계하는 클라우드 인프라 — Lecture Hierarchy

> Single Source of Truth. 강의 구조 변경은 이 파일에서 시작한다.
> 시리즈 챕터 매핑은 참고용이며, 강의는 Day 단위로 운영한다.

---

## 과정 개요

- **기간**: 8일 (64시간) · 1일 8시간
- **대상**: Cloud Fundamentals 수료자 또는 AWS/Azure/GCP 중 하나 이상 경험자
- **실습 앱**: Gallery (Spring Boot 3.5.x, Java 21)
- **Gallery 진화**: 8일 동안 6번 점진적 발전

---

## Day 구성

| Day | 제목 | 시리즈 매핑 | Gallery |
|-----|------|-----------|---------|
| 01 | 기본 개념 & Terraform 시작 | Ch01 + Ch02 (01~03) | — |
| 02 | HCL 심화 & Gallery 첫 배포 | Ch02 (04~06) + Ch03 | EC2 수동 배포 |
| 03 | State Management | Ch04 | user_data + Remote Backend |
| 04 | Custom VPC 구축 (동적 구성 I) | Ch05.01 | — |
| 05 | SG, ALB & VPC 완성 (동적 구성 II) | Ch05.02~04 | Custom VPC + ALB |
| 06 | 모듈 & 3-tier 완성 | Ch06 | 모듈화 + RDS + S3 |
| 07 | 환경 분리 & 대규모 아키텍처 | Ch07 + 브릿지 | dev/prod 분리 |
| 08 | 코드 품질 & 프로젝트 | Ch09 + 프로젝트 | 검증 추가 |

---

## Day별 상세

### Day 01 — 기본 개념 & Terraform 시작

| 시간 | 주제 | 상세 | 실습 | 과제 |
|------|------|------|------|------|
| 1 | 자동화와 IaC | 자동화와 Provisioning | | |
| 2 | | DevOps, 설정관리, 오케스트레이션 | | |
| 3 | | IaC 개요 — 선언형 vs 절차형, 멀티클라우드 | | |
| 4 | 환경 구성 | AWS 계정, AWS CLI 설치 | | |
| 5 | | Terraform 설치 (tfenv), credentials 설정 | Lab: terraform version, aws sts get-caller-identity | |
| 6 | HCL 기초 | 블록·인수·속성, 타입 시스템, terraform console | Lab: terraform console 표현식 실험 | |
| 7 | | provider 블록, default_tags, version constraints | Lab: terraform init, .terraform.lock.hcl 확인 | |
| 8 | | resource 블록, plan/apply/destroy 첫 경험 | Lab: SG 생성 → apply → destroy | SG + EC2 배포, SSH 접속 확인 |

**시리즈 매핑**: Ch01 (01.01~01.03) + Ch02 (02.01~02.03)

---

### Day 02 — HCL 심화 & Gallery 첫 배포

| 시간 | 주제 | 상세 | 실습 | 과제 |
|------|------|------|------|------|
| 1 | variable & output | 타입, default, validation, -var 플래그 | | |
| 2 | | validation 실험, output 객체화, -json + jq | Lab: validation 오류 확인, -var 재정의 | |
| 3 | locals & data source | 단일 출처, namespace 조립 | | |
| 4 | | AMI 동적 조회, aws_vpc, aws_subnets | Lab: 5개 data source 활용 EC2 배포 | |
| 5 | Execution Model | init/plan/apply 내부 동작 (refresh→diff→plan) | | |
| 6 | | Dependency Graph, terraform graph, 병렬 실행 | Lab: terraform graph 시각화 (Graphviz) | |
| 7 | Gallery | EC2에 Gallery 앱 수동 배포 | Lab: SSM 접속, JDK 설치, Maven 빌드, 앱 실행 | |
| 8 | | lifecycle — create_before_destroy, prevent_destroy | Lab: lifecycle 블록 실험 | Gallery 앱 브라우저 접속 확인 |

**시리즈 매핑**: Ch02 (02.04~02.06 Gallery) + Ch03 (03.01~03.03)

---

### Day 03 — State Management

| 시간 | 주제 | 상세 | 실습 | 과제 |
|------|------|------|------|------|
| 1 | State 개념 | State 역할 — desired vs actual, drift 감지 | | |
| 2 | | State 파일 구조 — JSON, serial, lineage | | |
| 3 | Remote Backend | S3 backend, native locking (use_lockfile) | | |
| 4 | | migrate-state vs reconfigure, partial config | Lab: S3 tfstate 버킷 생성, local→remote 이전 | |
| 5 | State 명령어 | state list / show / mv / rm | | |
| 6 | | import, moved 블록, removed 블록 | Lab: Gallery state mv→rm→import 복구 시나리오 | |
| 7 | Gallery | user_data + templatefile + systemd 자동 배포 | Lab: 처음부터 Remote Backend, user_data 자동화 | |
| 8 | | var.web_port 변경 실험 — EC2 재생성 부수효과 | Lab: plan으로 user_data 변경 → EC2 교체 확인 | Gallery user_data 자동 배포 확인 |

**시리즈 매핑**: Ch04 (04.01~04.05 + Gallery)

---

### Day 04 — Custom VPC 구축 (동적 구성 I)

| 시간 | 주제 | 상세 | 실습 | 과제 |
|------|------|------|------|------|
| 1 | 조건식 & count | 조건식, count 정수 반복, count.index | | |
| 2 | | 조건부 리소스 생성 — count = condition ? 1 : 0 | Lab: Custom VPC + IGW 기반 생성 | |
| 3 | | | Lab: count로 EIP 복수 생성 | |
| 4 | | | Lab: count 조건부 NAT Gateway (plan only) | |
| 5 | for_each | map/set 기반 반복, each.key/each.value | | |
| 6 | | count vs for_each 비교 — reindexing 문제 | Lab: for_each map으로 Subnet ×4 + Route Table | |
| 7 | | for_each set, toset() 변환 | Lab: for_each set으로 NAT Gateway 재구현 | |
| 8 | | count vs for_each 정리, output 하드코딩 문제 인식 | | Subnet ×4 + NAT GW 배포 결과 확인 |

**시리즈 매핑**: Ch05.01

---

### Day 05 — SG, ALB & Custom VPC 완성 (동적 구성 II)

| 시간 | 주제 | 상세 | 실습 | 과제 |
|------|------|------|------|------|
| 1 | for expression | list/map 변환, if 필터, for_each 입력값 전처리 | | |
| 2 | dynamic 블록 | 중첩 블록 반복 생성, content, iterator | Lab: for expression + dynamic ingress — 단일 SG | |
| 3 | | for_each + merge + dynamic — Layer별 분리 | Lab: 복수 SG (platform/workload 분리) | |
| 4 | 내장 함수 | cidrsubnet, lookup, try/can, startswith | | |
| 5 | Custom VPC 완성 | 전체 통합 + dynamic route + 동적 output | Lab: Custom VPC 완성 — 내장 함수로 검증 강화 | |
| 6 | ALB | ALB + Target Group + Listener 아키텍처 | | |
| 7 | | ALB 배포, EC2 ×2 for_each, Target 연결 | Lab: ALB + TG + EC2 ×2 배포 | |
| 8 | Gallery | Custom VPC 이전 + ALB — "코드가 커졌다" | Lab: Gallery custom VPC + ALB endpoint | Gallery ALB endpoint 접속 확인 |

**시리즈 매핑**: Ch05.02 + Ch05.03 + Ch05.04 Gallery

---

### Day 06 — 모듈 & 3-tier 완성

| 시간 | 주제 | 상세 | 실습 | 과제 |
|------|------|------|------|------|
| 1 | 모듈 개념 | root/child module, variable/output, source | | |
| 2 | | Provider 상속, 독립 스코프 | Lab: vpc/sg/ec2 단일 파일 모듈 분리 | |
| 3 | 모듈 경계와 인프라 계층 | 3-Layer (network/platform/workload), Cross-Cloud | | |
| 4 | | 파일 분리 — HashiCorp Style Guide | Lab: network 디렉토리 모듈 + NAT GW 확장 | |
| 5 | 모듈 조합 | output→input, 의존성, terraform graph | Lab: network + workload 모듈 조합 | |
| 6 | RDS & S3 | RDS 주요 개념, S3 서비스 개요 | | |
| 7 | | Auto Scaling 개요 | | |
| 8 | Gallery | 3-Layer 모듈화 + RDS + S3 — 3-tier 완성 | Lab: Gallery 모듈화, MariaDB + S3 전환 | Gallery 3-tier 인프라 완성 확인 |

**시리즈 매핑**: Ch06 (06.01~06.05 + Gallery)

---

### Day 07 — 환경 분리 & 대규모 아키텍처

| 시간 | 주제 | 상세 | 실습 | 과제 |
|------|------|------|------|------|
| 1 | Workspace | workspace 개념, workspace vs 디렉토리 비교 | | |
| 2 | | workspace 생성·전환, State 분리 | Lab: dev/prod workspace, S3 State 경로 확인 | |
| 3 | 디렉토리 기반 환경 분리 | envs/dev, envs/prod 구조, backend 분리 | | |
| 4 | | | Lab: 디렉토리 기반 dev/prod 환경 구성 | |
| 5 | 변수 입력 전략 | tfvars 공통, -var-file 환경별, TF_VAR_*, sensitive | Lab: 우선순위 실험, sensitive 마스킹 | |
| 6 | Gallery | dev/prod 환경 분리 | Lab: Gallery dev/prod 독립 인프라 | |
| 7 | 대규모 아키텍처 | Architecture 구성도 소개, 주요 고려 사항 | | |
| 8 | | Infra/App 배포 Workflow — CI/CD 연동 브릿지 | | 프로젝트 구현 계획 수립 |

**시리즈 매핑**: Ch07 (07.01~07.05 Gallery) + 브릿지

---

### Day 08 — 코드 품질 & 프로젝트

| 시간 | 주제 | 상세 | 실습 | 과제 |
|------|------|------|------|------|
| 1 | 코드 품질 | terraform fmt, validate, tflint | Lab: fmt/validate/lint 실행 | |
| 2 | | precondition, postcondition, check 블록 | Lab: check 블록으로 HTTP 상시 검증 | |
| 3 | Gallery | Gallery 검증 추가 + 전체 코드 리뷰 | Lab: Gallery check 블록 추가 | |
| 4 | | Gallery 누적 결과물 점검 (Day 2→Day 8 진화) | | |
| 5 | 프로젝트 구현 | 인프라 — VPC, Subnet, IGW, NAT GW, SG | | |
| 6 | | 컴퓨팅 & 네트워킹 — EC2, ALB, Auto Scaling | | |
| 7 | | 스토리지 & 데이터베이스 — S3, RDS + 모듈화 | | |
| 8 | 발표 & 마무리 | 구현 결과 발표, 인사이트 교류, 향후 학습 로드맵 | | 프로젝트 최종 제출 |

**시리즈 매핑**: Ch09 (09.01~09.03 Gallery) + 프로젝트

---

## Gallery 진화 맵

| Day | Gallery | 핵심 변화 |
|-----|---------|----------|
| Day 2 | EC2 수동 배포 | SSM 접속, 수동 설치. Local State |
| Day 3 | user_data + Remote | 자동 배포, S3 Remote State |
| Day 5 | Custom VPC + ALB | Custom VPC 이전, ALB endpoint |
| Day 6 | 모듈화 + 3-tier | network/platform/workload 모듈, RDS + S3 |
| Day 7 | dev/prod 분리 | 환경별 독립 인프라 |
| Day 8 | 검증 추가 | check 블록으로 상시 검증 |

---

## 교안 파일

| Day | 교안 파일 |
|-----|---------|
| 01 | `day01.md` |
| 02 | `day02.md` |
| 03 | `day03.md` |
| 04 | `day04.md` |
| 05 | `day05.md` |
| 06 | `day06.md` |
| 07 | `day07.md` |
| 08 | `day08.md` |

## 상태

| Day | 상태 |
|-----|------|
| 01 | — |
| 02 | — |
| 03 | — |
| 04 | — |
| 05 | — |
| 06 | — |
| 07 | — |
| 08 | — |
