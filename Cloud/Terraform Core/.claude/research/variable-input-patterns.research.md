# Research: Variable Input Patterns — Industry Best Practices 검증

> 조사일: 2026-04-15
> 목적: Ch03 또는 Ch04 섹션 작성을 위한 변수 입력 패턴 4가지의 업계 정합성 검증
> 출처: HashiCorp 공식 문서, Gruntwork/Terragrunt, CloudPosse, Spacelift, Scalr, env0, 커뮤니티 블로그

---

## 검증 대상 패턴 4가지

| # | 패턴 | 요약 |
|---|------|------|
| 1 | `terraform.tfvars` — 공통/불변 프로젝트 설정 | "Idempotency & Tracing" |
| 2 | `-var-file` — 환경별 오버라이드 (dev.tfvars, prod.tfvars) | `*.auto.tfvars` 산재보다 명시적 |
| 3 | `TF_VAR_*` — 시크릿 및 CI/CD 파이프라인 값 | 파일에 남기지 않는 값 |
| 4 | `default` 값 — "guideline"일 뿐, 실제 배포에 의존하지 않음 | 의식적 결정 강제 |

---

## Pattern 1: terraform.tfvars for Common/Immutable Settings

### 업계 정합성: **강하게 정렬됨 (Strong Alignment)**

**HashiCorp 공식:**
- Terraform은 `terraform.tfvars`를 자동 로드한다. 이 파일은 "workspace default" 역할을 한다.
- Variable definition files는 "ideal for managing different environment configurations"라고 명시.

**env0 (Variable Hierarchy 가이드):**
- `terraform.tfvars`를 "workspace의 기본값을 정의하는 파일"로 정의. 이후 `-var` 또는 `-var-file`로 수정 가능하다고 설명.

**Scalr (tfvars 가이드):**
- `terraform.tfvars`를 "Development/local defaults" 및 "Non-sensitive shared configuration" 용도로 권장.
- 프로젝트 구조 예시에서 `terraform.tfvars.example`을 커밋하고 실제 파일은 `.gitignore`로 관리하는 패턴 제시.

**Spacelift:**
- `terraform.tfvars`는 "커맨드라인 플래그 없이 자동 로드되는 기본 설정 파일"로 설명.

**평가:**
- Project, Region 같은 공통 불변값을 `terraform.tfvars`에 두는 것은 업계 표준과 정확히 일치한다.
- "Idempotency & Tracing"이라는 명명은 독자적이지만, 핵심 의도(누가 실행해도 동일한 프로젝트 설정, VCS에서 추적 가능)는 업계 관행과 동일하다.
- 다만, **시크릿이 포함된 tfvars는 VCS에 커밋하지 말 것**이라는 주의사항은 모든 출처에서 강조한다.

---

## Pattern 2: -var-file for Environment-Specific Overrides

### 업계 정합성: **강하게 정렬됨 (Strong Alignment)**

**HashiCorp 공식:**
- `-var-file` 플래그로 다른 파일을 이름으로 지정할 수 있다.
- "later flags win" — 순서 기반 오버라이드가 명확하다.

**Scalr:**
- 명확한 디렉토리 구조 권장:
  ```
  project/
  ├── environments/
  │   ├── dev.tfvars
  │   ├── staging.tfvars
  │   └── prod.tfvars
  ```
- `terraform apply -var-file="environments/prod.tfvars"` 패턴 제시.
- 다중 레이어링: `terraform apply -var-file="base.tfvars" -var-file="prod.tfvars"`.

**env0:**
- Regional files (us.tfvars, eu.tfvars) + Size presets (small.tfvars, large.tfvars)을 조합하는 패턴 제시.
- `terraform apply -var-file="us.tfvars" -var-file="large.tfvars"` — 관심사별 분리.

**Gruntwork/Terragrunt:**
- Terragrunt는 `required_var_files`와 `optional_var_files`로 `-var-file` 패턴을 자동화한다.
- 디렉토리 기반 환경 분리: `live/dev/`, `live/prod/` 각각에 `terragrunt.hcl`의 `inputs` 블록으로 환경별 값 주입.

**auto.tfvars 대비 -var-file의 장점 (커뮤니티 합의):**
- `*.auto.tfvars`는 알파벳 순서로 자동 로드되어 예측 가능성이 떨어진다.
- CloudPosse는 `*.auto.tfvars`의 "random order" 로딩을 명시적으로 비판: "the order of operations is NOT defined, and it could succeed in one place (atmos), but fail in another (Spacelift)."
- `-var-file`은 **명시적 제어**를 제공하며, CI/CD 파이프라인에서 환경 선택이 투명하다.

**평가:**
- `*.auto.tfvars` 산재보다 `-var-file`을 선호하는 것은 **업계 주류 의견과 완전히 정렬**된다.
- 특히 CI/CD 환경에서 `-var-file`의 명시성은 거의 모든 출처에서 권장된다.
- `auto.tfvars`가 유용한 경우: 단일 환경에서 설정을 논리적으로 분리할 때(예: 네트워크.auto.tfvars, 컴퓨팅.auto.tfvars). 그러나 환경 분리 목적으로는 부적합.

---

## Pattern 3: TF_VAR_* for Secrets and CI/CD

### 업계 정합성: **강하게 정렬됨 (Strong Alignment)**

**HashiCorp 공식:**
- `TF_VAR_name` 환경 변수로 변수 값 설정 가능. 대소문자 구분.
- Terraform Enterprise/Cloud에서는 "Sensitive" 체크박스로 변수를 마스킹.

**Spacelift:**
- "TF_VAR_ prefix는 시크릿 전달에 선호되는 방법 — 값이 파일이 아닌 메모리에 존재하고, CI/CD 도구 및 시크릿 관리 도구와 자연스럽게 통합된다."

**CloudPosse:**
- "All variable inputs for secrets must never define a default value."
- `sensitive = true` 마킹 필수.
- 시크릿은 모듈 output으로 노출하지 말고 AWS Secrets Manager, SSM Parameter Store 등에 직접 기록.

**oneuptime (2026 가이드):**
- "Small teams can start with CI/CD platform secrets and TF_VAR_ environment variables. As you grow, move to a dedicated secrets manager."
- `sensitive = true`와 `TF_VAR_` 조합으로 터미널 출력 및 파일에 값이 남지 않도록 권장.

**Scalr:**
- CI/CD 통합 패턴: `export TF_VAR_region="us-east-1" && terraform plan`
- 플랫폼 레벨 시크릿 관리: "variables defined in Scalr never reach Git — they're injected at runtime."

**평가:**
- `TF_VAR_*`를 시크릿 및 CI/CD 전용으로 사용하는 것은 **업계 표준**이다.
- 추가로 고려할 사항: `sensitive = true` + `ephemeral` (TF 1.10+) 조합으로 state/plan에서도 시크릿 제거 가능.
- 성숙한 조직은 TF_VAR_ → Vault/AWS Secrets Manager 동적 시크릿으로 진화한다.

---

## Pattern 4: Default Values as "Guidelines" Only

### 업계 정합성: **부분적으로 정렬됨 (Partial Alignment) — 뉘앙스 필요**

**HashiCorp 공식:**
- default는 precedence 최하위. "If present, the default value will be used if no value is set when calling the module or running Terraform."
- 공식 문서에서 "guideline"이라는 용어는 사용하지 않는다.

**커뮤니티 합의 — "Critical Variables Without Defaults":**
- "Making variables required by omitting the default argument forces callers to provide explicit values for settings that should not be left to chance — environment names, credentials, network ranges, and project identifiers."
- "The small friction of requiring explicit values prevents the much larger pain of misconfigured infrastructure."
- Aamod Kadam (Medium): "If you want the consumer of Terraform code to specify a value, then do not provide any default values. This forces consumers to think about it."

**CloudPosse — "Sane Defaults" 철학:**
- 모듈은 "as turnkey as possible"이어야 한다. default 값은 "가장 안전한 설정"을 보장해야 한다.
- 보안 관련(encryption enabled 등)은 default로 안전한 값을 설정한다.
- `nullable = false` + 빈 컬렉션 기본값(`{}`, `[]`) 패턴을 적극 활용.
- **단, 시크릿은 절대 default를 두지 않는다.**

**Spacelift:**
- "Use defaults sparingly. Avoid hardcoding values in variable defaults when environments differ significantly."

**Gruntwork/Terragrunt:**
- 모듈 자체에 reasonable defaults를 두고, 환경별 `inputs` 블록에서 오버라이드하는 패턴.
- "minimalist terragrunt.hcl containing primarily the input values that differ from environment to environment."

### 뉘앙스 분석

"default as guideline" 패턴은 **두 가지 업계 관점 사이**에 위치한다:

| 관점 | 지지자 | 설명 |
|------|--------|------|
| **A. Sane Defaults** | CloudPosse, Gruntwork | 모듈은 default로 안전하게 동작해야 한다. "turnkey" 원칙. |
| **B. Force Explicit** | 커뮤니티 다수, 보안 가이드 | Critical variable에는 default를 두지 말아야 한다. 의식적 결정을 강제한다. |

**"Default as guideline"은 관점 B에 가깝지만, 완전히 동일하지는 않다.**

- 관점 B는 "critical variable에는 default 없음"이 핵심이다.
- "Default as guideline"은 default를 두되 "의존하지 않는다"는 것인데, **이것은 업계에서 명시적으로 정의된 패턴은 아니다.**
- 업계 표준은 더 이분법적이다: **default를 두거나(sane default), 아예 두지 않거나(force explicit).**

### 개선 제안

"Default as guideline"을 다음과 같이 재구성하면 업계 관행과 정확히 정렬된다:

1. **Critical variables (env, credentials, CIDR 등):** default 없음 → 명시적 입력 강제
2. **Operational variables (instance_type, ami 등):** sane default 제공 → 오버라이드 가능
3. **Structural variables (tags, naming prefix):** terraform.tfvars에서 관리 → 프로젝트 일관성

이렇게 분류하면 "guideline"이라는 애매한 표현 없이 변수의 성격에 따른 명확한 전략이 된다.

---

## 종합 평가

| 패턴 | 업계 정합성 | 상세 |
|------|------------|------|
| **Pattern 1** terraform.tfvars 공통 설정 | **Strong** | 업계 표준 — 자동 로드되는 workspace default |
| **Pattern 2** -var-file 환경별 오버라이드 | **Strong** | 업계 주류 — auto.tfvars보다 명시적 제어 선호 |
| **Pattern 3** TF_VAR_* 시크릿/CI/CD | **Strong** | 업계 표준 — 파일에 남기지 않는 값의 표준 방법 |
| **Pattern 4** default as guideline | **Partial** | 의도는 맞으나 용어가 독자적. "Critical → no default / Operational → sane default" 이분법이 업계 표준 |

### Gap 분석

1. **Pattern 4 용어 개선 필요:** "Guideline"이라는 표현은 업계에서 사용하지 않는다. "Sane defaults for operational, no defaults for critical"로 재구성하면 더 명확하다.

2. **Precedence 계층 명시 권장:** 4가지 패턴이 Terraform의 precedence order와 어떻게 매핑되는지 독자에게 보여주면 이해가 깊어진다.
   ```
   default (lowest) → terraform.tfvars → *.auto.tfvars → -var-file → -var → TF_VAR_* (*)
   ```
   *참고: 실제 precedence에서 TF_VAR_*는 default 바로 위이고, -var/-var-file이 최상위다. 하지만 CI/CD에서 TF_VAR_*가 시크릿 전달 표준인 이유는 파일에 남지 않기 때문이지, precedence 때문이 아니다.

3. **ephemeral 변수 언급 고려:** TF 1.10+에서 `ephemeral = true`로 state/plan에서 시크릿을 완전히 제거할 수 있다. Pattern 3의 확장.

4. **sensitive = true 필수 조합:** TF_VAR_*로 전달하더라도 variable 선언에 `sensitive = true`가 없으면 plan 출력에 노출된다.

---

## Terraform Variable Precedence (정확한 순서)

공식 문서 기준, 낮은 우선순위 → 높은 우선순위:

1. `default` 값 (variable 블록)
2. `TF_VAR_*` 환경 변수
3. `terraform.tfvars` (자동 로드)
4. `terraform.tfvars.json` (자동 로드)
5. `*.auto.tfvars` / `*.auto.tfvars.json` (알파벳 순, 자동 로드)
6. `-var-file` (CLI, 지정 순서대로)
7. `-var` (CLI, 지정 순서대로 — 최상위)

> **주의:** TF_VAR_*는 terraform.tfvars보다 **낮은** 우선순위다. 이는 직관과 다를 수 있다.
> CI/CD에서 TF_VAR_*가 유용한 이유는 precedence가 아니라 **파일에 남지 않는 특성** 때문이다.
> 시크릿을 TF_VAR_*로 전달하면서 동시에 tfvars에 같은 변수를 두면, tfvars 값이 우선한다.

---

## 출처

- [HashiCorp — Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)
- [HashiCorp — Customize Configuration with Variables (Tutorial)](https://developer.hashicorp.com/terraform/tutorials/configuration-language/variables)
- [HashiCorp — CLI Environment Variables](https://developer.hashicorp.com/terraform/cli/config/environment-variables)
- [Spacelift — Terraform .tfvars files](https://spacelift.io/blog/terraform-tfvars)
- [Spacelift — How to Use Terraform Variables](https://spacelift.io/blog/how-to-use-terraform-variables)
- [Scalr — Mastering tfvars](https://scalr.com/learning-center/mastering-tfvars-a-concise-guide-for-terraform-and-opentofu/)
- [env0 — Managing Terraform Variable Hierarchy](https://www.env0.com/blog/managing-terraform-variable-hierarchy)
- [CloudPosse — Terraform Best Practices](https://docs.cloudposse.com/best-practices/terraform/)
- [CloudPosse — ADR: Use Defaults for Components](https://docs.cloudposse.com/resources/adrs/proposed/proposed-use-defaults-for-components/)
- [Gruntwork — How to Manage Multiple Environments with Terragrunt](https://www.gruntwork.io/blog/how-to-manage-multiple-environments-with-terraform-using-terragrunt)
- [Terragrunt — Keep Your Architecture DRY](https://terragrunt.gruntwork.io/docs/features/keep-your-terragrunt-architecture-dry/)
- [oneuptime — TF_VAR_ Environment Variables (2026)](https://oneuptime.com/blog/post/2026-02-23-how-to-pass-variables-via-environment-variables-tf-var-in-terraform/view)
- [oneuptime — Terraform Secrets in CI/CD (2026)](https://oneuptime.com/blog/post/2026-02-23-how-to-handle-terraform-secrets-in-cicd-pipelines/view)
- [HashiCorp Discuss — tfvars Best Practice](https://discuss.hashicorp.com/t/a-lot-of-tfvars-best-practice/37629)
- [Aamod Kadam — User Experience with Terraform Default Values](https://amod-kadam.medium.com/user-experience-with-terraform-default-values-3260b37c433b)
