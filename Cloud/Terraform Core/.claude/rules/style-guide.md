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

## 파일 구조 표기

실습 디렉토리 구조는 코드 블록(`text`)으로 표기.

```text
lab01/
├── main.tf
├── variables.tf
└── outputs.tf
```

모듈 포함 시:
```text
Gallery - 인프라 모듈화/
├── main.tf
├── variables.tf
├── outputs.tf
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── sg/
    └── ec2/
```

---

## 리소스명 규칙

| 유형 | 형식 | 예시 |
|------|------|------|
| Section Lab | `tf-core-lab{lab_no}-{type}` | `tf-core-lab01-sg`, `tf-core-lab02-ec2` |
| Gallery | `tf-core-gallery-{type}` | `tf-core-gallery-ec2`, `tf-core-gallery-vpc` |

- `{lab_no}`: 섹션 내 로컬 lab 번호 (01, 02...)
- `{type}`: 리소스 타입 약어 (ec2, sg, vpc, s3, rg 등)

---

## Terraform 리소스 주소 표기

```
`{resource_type}.{name}` 형식으로 인라인 코드로 표기.
예: `aws_instance.web`, `aws_security_group.gallery`
```
