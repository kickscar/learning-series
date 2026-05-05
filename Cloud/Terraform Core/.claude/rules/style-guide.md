# Rule: style-guide

문서 스타일 공통 규칙. 모든 write skill에 적용.

---

## 헤딩 규칙

### 이론/개념 섹션

| 레벨 | 용도 | 형식 |
|------|------|------|
| H1 | 개념/토픽명 | `# {개념명}` — 번호 없음 |
| H2 | 하위 주제 | `## 1. {주제명}` — 번호 있음 |
| H3 | 세부 항목 | `### ① {항목}` — ①②③ 패턴 |

### 실습 섹션

| 레벨 | 용도 | 형식 |
|------|------|------|
| H1 | 작업 단계 | `# 1. {단계명}` — 번호 있음 |
| H2 | 파일 단위 / CLI 단계 | `## {파일명}.tf` 또는 `## terraform {명령}` |
| H3 | 세부 항목 | `### ① {항목}` 또는 `### 1. {항목}` |

- **헤딩에 볼드(`**`) 처리 안 함**
- H1 `# 전체 아키텍처`, `# 사전 준비`, `# 핵심 정리`, `# 참고 자료` 고정

---

## 문서 시작 규칙

- **챕터명/섹션명 헤딩 없이 시작** — Notion 타이틀이 대신
- 이론 섹션: 첫 H1 전에 개요 단락 1~3줄 (앞 섹션 환기 + 이번 섹션 예고)
- 실습 섹션: 설명 텍스트 1~2줄 + `### 실습 목표`

---

## 이미지 플레이스홀더

```
[콘솔화면: AWS Console > {서비스} > {화면} > {핵심 포인트 설명}]
[이미지: {개념/구조 설명} — {독자가 봐야 할 포인트}]
```

- 결과 검증, 리소스 확인 단계에서 필요 시 명시
- 플레이스홀더 뒤에 해설 1~2줄 추가 (선택)

---

## 설정값 / 확인값 표기

- 설정값: **`{값}`** (볼드 + 백틱)
- 리소스 주소: `aws_instance.web` (백틱만)
- 파일명: `main.tf` (백틱만)
- 인수명: 그대로 (볼드 없음)

예:
```
- instance_type: **`t3.micro`**
- region: **`ap-northeast-2`**
```

---

## 모듈 파일 배치 순서

모듈 코드와 draft에서 파일을 나열하는 순서:

| 순서 | 파일 | 역할 |
|------|------|------|
| 1 | `main.tf` | 뭘 만든다 (리소스) |
| 2 | `locals.tf` | 어떤 설정으로 (모듈 구성) |
| 3 | `variables.tf` + `datasources.tf` | 뭘 받아야 하고 (외부 입력 + 조회) |
| 4 | `outputs.tf` | 뭘 내보낸다 |
| (부가) | `providers.tf` | root 모듈만 (provider + backend) |

### 리소스 원형 주석

main.tf의 리소스 블록 위에 **리소스 원형**(하드코딩된 원래 모습)을 주석으로 포함한다. 이전 lab의 코드가 locals/module로 구조화되기 전의 모습을 보여준다.

```hcl
# resource "aws_instance" "minimal" {
#   ami           = "ami-0c003e98ceffee43e"
#   instance_type = "t3.micro"
# }
resource "aws_instance" "this" {
  ami           = local.instance.ami
  instance_type = local.instance.instance_type
}
```

---

## 파일 구조 표기

실습 디렉토리 구조는 코드 블록(`text`)으로 표기. 파일 나열은 배치 순서를 따른다.

```text
lab01/
├── main.tf
├── locals.tf
├── variables.tf
└── outputs.tf
```

모듈 포함 시:
```text
Gallery/
├── main.tf
├── locals.tf
├── variables.tf
├── outputs.tf
└── modules/
    ├── network/
    │   ├── main.tf
    │   ├── locals.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── platform/
    └── workload/
```

---

## 리소스명 규칙

| 유형 | 형식 | 예시 |
|------|------|------|
| Section Lab | `tf-core-lab{lab_no}-{capability}-{identity}` | `tf-core-lab01-sg-instance`, `tf-core-lab02-instance-minimal` |
| Gallery | `tf-core-gallery-{capability}-{identity}` | `tf-core-gallery-sg-instance`, `tf-core-gallery-instance-web` |

- `{lab_no}`: 섹션 내 로컬 lab 번호 (01, 02...)
- `{capability}`: 리소스 종류 약어 — 목록은 `rules/naming-tagging.md` 참고
- `{identity}`: TF 리소스 레이블과 일치 (`-` → `_`). 리소스 정체성을 드러내는 키워드 조합. 상세 규칙은 `rules/naming-tagging.md` 참고

---

## Terraform 리소스 주소 표기

```
`{resource_type}.{name}` 형식으로 인라인 코드로 표기.
예: `aws_instance.web`, `aws_security_group.gallery`
```
