# Chapter 07 — IaC 코드 구조화

## 목표

Ch03~06에서 flat하게 작성한 Terraform 코드를 실무 수준으로 구조화한다.
프로젝트 구조 설계, 네이밍 규칙 전면 적용(리팩토링), 모듈 분리, 환경 분리를 수행한다.
"왜 구조화해야 하는가"의 당위성은 다루지 않는다 — Ch03~06을 거치며 체감한 복잡도가 답이다.

---

## 핵심 메시지

- Ch02에서 소개한 Azure CAF 네이밍을 Ch03~06에서 자연스럽게 적용해왔다 → 여기서 **태깅을 추가**하고 **모듈과 연계**
- 모듈은 **수단**이다 — 모듈 구조화의 아키텍처 당위는 Architecture & Design 담당
- 환경 분리는 **실무에서 이렇게 한다**를 보여준다 — 설계 전략은 Architecture & Design 담당
- Ch08~09는 이 구조 위에서 작성한다

---

## Terraform Core 대응

| 이 시리즈 | Terraform Core |
|----------|---------------|
| Sec 03: 모듈 활용 | Ch06: 모듈 (개념, 로컬 모듈, 조합, Registry) |
| Sec 04: 환경 분리 | Ch07: 환경 분리 (Workspace, 디렉토리 기반) |

> Terraform Core에서 모듈·환경 분리의 **메커니즘**을 배웠다면, 이 시리즈에서는 **Azure 실무에서의 적용**에 집중한다.

---

## Section 구성

### Section 01 — 프로젝트 구조 설계
- **유형**: 이론
- **내용**:
  - Terraform 프로젝트 디렉토리 레이아웃 패턴
    - 단일 디렉토리 (소규모)
    - 레이어별 분리: network / compute / data (중규모)
    - 환경별 분리: envs/dev, envs/prod (다중 환경)
  - 파일 분리 전략: main.tf, variables.tf, outputs.tf, providers.tf, backend.tf, locals.tf
  - Azure 특화 고려: RG별 vs 레이어별 분리
  - Ch03~06 Gallery 코드가 왜 구조화가 필요한지 — 현재 상태 리뷰
- **Lab**: 없음

### Section 02 — 태깅 전략과 locals 활용
- **유형**: 이론 + 실습
- **내용**:
  - Ch03~06에서 적용한 CAF 네이밍 회고 — RG 스코프 덕분에 짧은 이름이 가능했다
  - 태깅 전략: `locals` 블록으로 공통 태그 관리
    ```hcl
    locals {
      common_tags = {
        Project   = "azure-iac"
        Env       = var.env
        Layer     = var.layer
        ManagedBy = "terraform"
      }
    }
    ```
  - Ch07에서 Layer 태그 추가 — 모듈 분리와 연계
  - azurerm provider `default_tags` 활용 (provider 레벨 태그)
  - 태그 기반 리소스 조회: `az resource list --tag Layer=network`
- **Lab**:
  - `[실습] lab20: 태깅 전략 적용`
    - Ch03~06 Gallery 코드에 locals 기반 공통 태그 적용
    - Layer 태그 추가
    - `az resource list --tag` 으로 태그 기반 조회 확인

### Section 03 — 모듈 활용 — 실무 패턴
- **유형**: 이론 + 실습
- **내용**:
  - 모듈 분리 기준: 레이어(network / compute / data) 단위
  - 로컬 모듈 구조: `modules/network/`, `modules/compute/`, `modules/data/`
  - 모듈 인터페이스 설계: variables.tf (입력), outputs.tf (출력)
  - 모듈 간 의존성: output → variable 연결
  - Azure 실무 팁: RG를 모듈 외부에서 생성 → 모듈에 주입
- **Lab**:
  - `[실습] lab21: 로컬 모듈 분리`
    - Gallery 코드를 network / compute 모듈로 분리
    - root module에서 모듈 조합
    - `terraform plan`으로 변경 없음(refactor-only) 확인

### Section 04 — 환경 분리 — dev/prod
- **유형**: 이론 + 실습
- **내용**:
  - tfvars 기반 환경 분리: `dev.tfvars`, `prod.tfvars`
  - `terraform plan -var-file="dev.tfvars"` 워크플로우
  - 환경별 backend 설정: backend key 분리
  - 디렉토리 기반 분리 소개 (envs/dev, envs/prod) — 비교만
  - Terraform Core Ch07 Workspace와의 관계 정리
- **Lab**:
  - `[실습] lab22: 환경 분리 (dev/prod)`
    - dev.tfvars / prod.tfvars 작성 (VM 크기, 인스턴스 수 차이)
    - dev 환경 배포 → prod 환경 배포
    - 환경별 state 파일 분리 확인

### Section 05 — [실습] Gallery: Gallery 인프라 구조화
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab20~22 완료, Ch06 Gallery 트래픽 구성 완료
- **내용**:
  - Ch03~06 Gallery 전체 코드를 구조화:
    1. 디렉토리 정리: modules/ + envs/ 구조
    2. 네이밍 locals 적용 (lab20 결과 통합)
    3. network 모듈: VNet, Subnet, NSG, NAT GW, PE, DNS
    4. compute 모듈: VMSS, AGW, LB
    5. identity 모듈: MI, RBAC
    6. dev.tfvars / prod.tfvars 분리
  - `terraform plan` — 기존 인프라 변경 없음(refactor-only) 확인
  - 이후 Ch08~09는 이 구조 위에 data / container 모듈을 추가
- **예제 파일**: `07 IaC 코드 구조화/05 [실습] Gallery - Gallery 인프라 구조화/` 하위

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/07.01.claude.notion.md` |
| 02 | `.claude/draft/07.02.claude.notion.md` |
| 03 | `.claude/draft/07.03.claude.notion.md` |
| 04 | `.claude/draft/07.04.claude.notion.md` |
| 05 Gallery | `.claude/draft/07.05.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획수립 |
| 02 | 계획수립 |
| 03 | 계획수립 |
| 04 | 계획수립 |
| 05 Gallery | 계획수립 |
