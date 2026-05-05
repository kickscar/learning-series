# Rule: code-blocks

코드 블록 작성 규칙.

---

## 언어 지정 필수

모든 코드 블록에 언어를 명시한다.

| 언어 | 사용 상황 |
|------|----------|
| `hcl` | Terraform 설정 파일 (.tf, .tfvars) |
| `bash` | terraform CLI, aws CLI, shell 명령어 |
| `json` | terraform.tfstate, JSON 출력 |
| `yaml` | 설정 파일 (비 HCL) |
| `mermaid` | 다이어그램 |
| `text` | **기본값** — terraform plan/apply/output 출력, 로그, 파일 트리 |

---

## HCL 코드 블록

```hcl
resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  tags = local.common_tags
}
```

- 인수 정렬: `terraform fmt` 기준 유지
- 실제 값 대신 변수/참조 표현식 우선 사용

---

## CLI 명령어와 출력

명령어와 출력을 하나의 블록에 포함. `# 출력 예` 주석으로 구분.

> CLI 도구명은 `CLAUDE.md > 플랫폼 상수` 참조 (`terraform`, `aws`)

```bash
$ terraform apply -auto-approve

# 출력 예
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

instance_id = "i-0abc1234567890def"
public_ip = "13.125.xxx.xxx"
```

- 프롬프트 `$` 표시
- 민감한 실제 값은 `xxx` 또는 `{설명}` 처리
- 생략 부분: `...(생략)...`

---

## terraform plan/apply 출력

`text` 언어 사용.

```text
Terraform will perform the following actions:

  # aws_instance.web will be created
  + resource "aws_instance" "web" {
      + ami           = "ami-0c02fb55956c7d316"
      + instance_type = "t3.micro"
      ...
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```

---

## 파일 트리

디렉토리/파일 구조는 `text` 언어 사용.

```text
lab01/
├── main.tf
├── variables.tf
└── outputs.tf
```

---

## 인라인 코드

백틱(`` ` ``)으로 감싼다.

- 파일명: `main.tf`, `variables.tf`
- 디렉토리: `lab01/`, `modules/vpc/`
- 리소스 주소: `aws_instance.web`
- 명령어: `terraform apply`
- 인수명: `instance_type`, `ami`
- 값: `t3.micro`, `ap-northeast-2`

---

## 설정값 표기 (코드 블록 아님)

실습의 주요 설정값은 목록으로 표기.

```text
**설정:**

- instance_type: **`t3.micro`**
- region: **`ap-northeast-2`**
- Name 태그: **`tf-core-lab01-ec2`**
```
