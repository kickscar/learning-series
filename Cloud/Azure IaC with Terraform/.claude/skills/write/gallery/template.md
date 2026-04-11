# Gallery 실습 템플릿

## 기본 구조

```
{개요 문단 — 이전 Gallery 대비 변경 사항을 1~2문장으로}

### 실습 목표

- {목표 1}
- {목표 2}
- {목표 3}

# 1. 전체 아키텍처

{mermaid — 누적 아키텍처 중 이번 챕터 변경 부분 강조}

{2~4줄 설명}

# 2. 사전 준비

- Terraform: 1.14.x 이상
- azurerm provider: ~> 4.x
- Azure 리전: **`koreacentral`**
- 이전 Gallery: {Ch{n} Gallery 완료 필요}
- gallery-spring-boot: `../Workloads/gallery-spring-boot`

## 이전 Gallery 코드 복사

```bash
cp -r {이전 Gallery 경로}/* .
```

## 디렉토리 구조

```text
{ch_no} {ch_name}/{sec_no} [실습] Gallery - {name}/
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── terraform.tfvars
└── modules/              (Ch07~ 구조화 이후)
    ├── network/
    ├── compute/
    └── ...
```

# 3. {첫 번째 작업}

## {file}.tf

```hcl
{코드}
```

{설명}

### 참고

- [{리소스 문서}]({URL}) — Terraform Registry

# 4. {추가 작업}

{파일별 코드 + 설명}

# n. 배포

## terraform init

```bash
terraform init
```

## terraform plan

```bash
terraform plan
```

```text
Plan: {n} to add, 0 to change, 0 to destroy.
```

## terraform apply

```bash
terraform apply
```

```text
Apply complete! Resources: {n} added, 0 changed, 0 destroyed.
```

# n+1. 결과 확인

## terraform output

```bash
terraform output
```

```text
{주요 output 값}
```

## az CLI 확인

```bash
az {group} {command} --output table
```

```text
{출력 결과}
```

## Gallery 앱 접근 (해당 시)

{AGW Public IP 또는 Container Apps URL로 브라우저 접근}

```bash
curl http://{output_ip}:8080/actuator/health
```

```text
{"status":"UP"}
```

# n+2. 자원 정리

> 다음 Gallery에서 이 코드를 복사하여 사용한다. 정리 전 코드를 보관한다.

## terraform destroy

```bash
terraform destroy
```

```text
Destroy complete! Resources: {n} destroyed.
```
```

## 서식 규칙

- 문서 시작에 챕터/섹션 제목 넣지 않음
- 개요 문단 → 실습 목표 → 본문
- HCL 코드에 인라인 주석 넣지 않음
- 명령어(`bash`)와 출력(`text`) 코드 블록 분리
- Gallery 앱 자체 설명 금지 (인프라 구성만)
- `### 참고` 블록으로 Terraform Registry 링크 제공
