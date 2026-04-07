# Template: write/lab

섹션 실습 draft 작성 템플릿 (Terraform Core)

---

## 사용 규칙

- 이론 파트 뒤에 `# [실습] lab{no}: {제목}` H1으로 실습 시작
- 섹션에 lab이 여러 개면 이 템플릿을 순서대로 반복 작성
- 각 lab은 독립 샌드박스 — `terraform destroy`로 마무리
- 리소스명: `tf-core-lab{lab_no}-{type}` 규칙 준수
- 결과 확인: `terraform output` 우선, `aws CLI` 참고용

---

## 템플릿

---

# [실습] lab{no}: {실습 제목}

{실습 설명 1~2줄. 무엇을 구성하고, 어떤 결과가 만들어지는지 요약.}

### 실습 목표

- {무엇을 구성하는지}
- {어떤 리소스를 생성하는지}
- {최종적으로 어떤 상태가 되는지}

---

# 1. 전체 아키텍처

```mermaid
{생성되는 리소스와 연결 구조}
```

{아키텍처 해설 2~4줄: 구성 요소와 흐름 요약}

---

# 2. 사전 준비

- Terraform: **`1.10.x`**
- AWS Region: **`ap-northeast-2`**
- {이전 lab 또는 전제 조건이 있는 경우 명시}

**디렉토리 구조:**

```text
lab{no}/
├── main.tf
├── variables.tf
└── outputs.tf
```

---

# 3. {첫 번째 작업명}

{이 작업을 왜 하는지 1줄 설명 (선택)}

## main.tf

```hcl
{코드}
```

## variables.tf

```hcl
{코드}
```

## outputs.tf

```hcl
{코드}
```

---

# 4. {두 번째 작업명 — 추가 파일 또는 코드 변경이 있는 경우}

## {파일명}.tf

```hcl
{코드}
```

---

... 작업 단계 반복 ...

---

# {n}. 배포

## terraform init

```bash
$ terraform init

# 출력 예
Initializing the backend...
Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 5.0"...
- Installing hashicorp/aws v5.x.x...

Terraform has been successfully initialized!
```

## terraform plan

```bash
$ terraform plan

# 출력 예
Terraform will perform the following actions:

  # {resource_type}.{name} will be created
  + resource "{resource_type}" "{name}" {
      ...
    }

Plan: {N} to add, 0 to change, 0 to destroy.
```

## terraform apply

```bash
$ terraform apply -auto-approve

# 출력 예
Apply complete! Resources: {N} added, 0 changed, 0 destroyed.

Outputs:

{output_name} = "{output_value}"
```

---

# {n+1}. 결과 확인

## terraform output

```bash
$ terraform output

# 출력 예
{output_name} = "{output_value}"
```

**확인:**

- {확인 항목}: **`{예상 값}`**

## AWS CLI 확인 (참고)

```bash
$ aws {service} {command} --{option} {value}

# 출력 예
{예상 출력}
```

---

# {n+2}. 자원 정리

실습 완료 후 생성한 리소스를 제거한다.

```bash
$ terraform destroy -auto-approve

# 출력 예
Destroy complete! Resources: {N} destroyed.
```

삭제 대상:
- `{resource_type}.{name}`: `{리소스명}`
