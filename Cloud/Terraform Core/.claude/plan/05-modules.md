# Chapter 05 — 모듈

## 목표

모듈의 구조와 입출력 설계를 이해하고, 3-Layer 모듈을 완성해 ALB + ASG 인프라를 구성한다.
동적 구성 없이 하드코딩으로 모듈 구조를 잡는다. 인프라 계층(network/platform/workload)에 충실한 모듈 설계.
Ch04까지 = TF 도구 학습 완료. Ch05부터 = 팀/실무 운용.

> **설계 원칙 (내부 가이드, draft에 직접 포함 안 함):**
> Ch05 = Layer Module 개념에 충실. "인프라 계층 = 모듈 단위" 원칙으로 이론과 실습을 구성한다.
> Layer Module, Resource Module 용어는 사용하지 않는다. 나중에 이 용어를 접했을 때
> "Ch05가 Layer Module이었고, Ch06이 Resource Module이었구나" 하고 자연스럽게 연결되도록 한다.

---

## Section 구성

### Section 01 — 모듈 개념과 구조
- **유형**: 이론 + 실습
- **내용**:
  - 모듈이란: 디렉토리 = 모듈, root module vs child module
  - Console → Module 매핑: Console 입력 = variable, 결과 = output
  - module 블록: source(`./` 필수), variable, output
  - 모듈 output 참조: `module.<호출이름>.<output명>`
  - Provider 자동 상속, 독립 scope
- **Lab**:
  - `[실습] lab01: VPC + Subnet 모듈 — 모듈 기초`
    - vpc/, subnet/ 두 개 단일 리소스 모듈
    - input/output, 모듈 간 참조 (단순 output)
  - `[실습] lab02: Network + IAM 모듈 — 모듈 합치기`
    - network/ (VPC+IGW+Subnet+RTB), iam/ (Role+Profile+datasources.tf)
    - 리소스별 name variable, object output, policy_arn 외부 전달
  - `[실습] lab03: Network + IAM + Workload — EC2 실행`
    - root locals 모듈별 구조화, object type variable, merge
    - workload/ (SG+EC2), output은 소비자에 맞춤 (사용자 vs 다른 모듈)

---

### Section 02 — 모듈 경계와 인프라 계층
- **유형**: 이론 + 실습
- **내용**:
  - 모듈화의 경계: 재사용성, 크기, 변경 빈도
  - 3-Layer (network/platform/workload) + Cross-Cloud
  - 모듈 내부 파일 분리: HashiCorp Style Guide
  - 각 Layer가 담는 인프라 리소스와 역할 소개 (AWS 리소스 설명은 실습에서)
- **이론에서 실습 프리뷰**:
  - network: 연결 기반 — VPC, Subnet, IGW, NAT GW
  - workload: 실제 서비스 — EC2, SG
  - platform: 보안·접근·운영 — ALB, TG, IAM, SG
- **Lab 구조**: 하나의 디렉토리에서 Layer를 하나씩 쌓아가며 점진적으로 배포
  ```text
  05.02-lab/
  ├── variables.tf, locals.tf, providers.tf, datasources.tf
  ├── main.tf          ← lab마다 module 블록 추가
  ├── outputs.tf
  └── modules/
      ├── network/     ← lab01에서 생성, lab02에서 확장
      ├── workload/    ← lab03에서 추가
      └── platform/    ← lab04에서 추가
  ```
- **Lab**: 독립 디렉토리 4개 (lab01~04). 각 lab이 해당 시점의 완전한 코드를 갖는다.
  - `[실습] lab01: network — Public 인프라`
    - VPC, IGW, Public Subnet ×2 (list 타입, index 기반 리소스), Public RTB
    - computed key output: `(var.subnet_public[0].name)`, cidr_block 포함
  - `[실습] lab02: network — Private 인프라 확장`
    - + NAT GW, EIP, Private Subnet ×2, Private RTBs
    - natgw 설정의 한계 → Ch06 동적 구성 동기 강조
  - `[실습] lab03: platform — ALB + IAM`
    - modules/platform/ 추가: LB + TG + Listener + SG, IAM factory
    - network에 의존 (VPC, public subnet)
  - `[실습] lab04: workload — EC2 배포 + 전체 연결`
    - modules/workload/ 추가: EC2 + SG, private subnet 배치
    - network + platform에 의존 (iam_instance_profile, TG attachment)
    - 설정 스키마 `(known after apply)` 주석 패턴, 자유로운 하위 참조 체험
  - lab04 완료 시 3-Layer 모듈 완성 (24 리소스) → Gallery 준비 완료

---

### Section 03 — [실습] Gallery: ALB + ASG (Gallery 앱 배포)
- **유형**: 시리즈 실습
- **전제 조건**: Ch04 Gallery 완료, Ch05 Sec02 완료
- **내용**:
  - 05.02의 3-Layer 모듈 기반 Gallery 앱 배포
  - workload: Gallery 앱 EC2 (user_data + systemd) → ASG 전환
  - platform: ALB + TG + Launch Template + ASG (TG 자동 등록)
  - 접속 경로 변경: `EC2 public IP:8080` → `ALB DNS:80`
  - "하드코딩이라 인스턴스 추가하려면 코드 복사" → Ch06 동적 구성의 동기

---

### Section 04 — Module Management
- **유형**: 이론 + 실습
- **내용**:
  - terraform graph 모듈 시각화
  - moved 블록 (모듈 리네이밍/이동)
  - 모듈 버전 관리
- **Lab**:
  - `[실습] lab01: graph, moved 실습`

---

### Section 05 — Public Registry 모듈
- **유형**: 이론 + 실습
- **내용**:
  - Terraform Registry, 버전 제약, 입출력 문서
- **Lab**:
  - `[실습] lab01: Registry VPC 모듈 활용`

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/05.01.claude.notion.md` |
| 02 | `.claude/draft/05.02.claude.notion.md` |
| 03 (Gallery) | `.claude/draft/05.03.claude.notion.md` |
| 04 | `.claude/draft/05.04.claude.notion.md` |
| 05 | `.claude/draft/05.05.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | draft완료 |
| 02 | draft완료 |
| 03 (Gallery) | 재구성 |
| 04 | 재구성 |
| 05 | 재구성 |
