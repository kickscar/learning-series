# Rule: korean-writing

한국어 문서 작성 규칙.

---

## 기본 원칙

- 문서는 **한국어**로 작성
- 기술 용어는 **영문 유지** — 번역하지 않음
- 문체: **~다 체** (서술형)

---

## 영문 용어 표기

### 첫 등장 시
영문과 한글을 함께 표기: `State (상태 파일)`

### 이후
영문만 사용: `State`

---

## 번역하지 않는 용어 목록

아래 용어는 한글 번역 없이 영문 그대로 사용한다.

- Terraform 개념어: Provider, Resource, State, Module, Workspace, Backend, Data Source, Output, Variable, Locals
- HCL 구문: resource, variable, output, locals, data, module, terraform, required_providers
- CLI 명령어: init, plan, apply, destroy, import, validate, fmt
- 동작어: Deploy, Provision, Apply, Destroy, Import, Migrate
- 상태어: Running, Stopped, Available, Healthy, Pending
- AWS 리소스: EC2, S3, VPC, Security Group, DynamoDB, IAM, AMI
- 도구명: Terraform, HCL, tfenv, tflint, Terratest

---

## 문장 구조

### em dash (`—`) 사용 제한

`—`는 한 섹션에 **1~2회** 이내로 사용한다. 남용하면 모든 문장이 "주 문장 — 부연" 구조가 되어 리듬이 단조로워진다.

| 상황 | 처리 |
|------|------|
| 핵심 규칙/원칙 전달 | `—` 쓰지 않는다. 독립 문장으로 분리한다 |
| 짧은 부연·보충 | `—` 허용 (한 섹션 1~2회) |
| 예시 제시 | `—` 대신 마침표 + 구체적 코드 인용 |

```text
# 나쁜 예 (— 남발)
인수 이름은 Terraform 리소스의 인수 이름과 맞춘다 — 리소스 원형과 1:1로 대응되어 혼란이 없다.
같은 모듈 안이므로 직접 참조할 수 있다 — lab01에서는 root module이 중개했다.

# 좋은 예
인수 이름은 Terraform 리소스의 인수 이름과 맞춘다. 리소스 원형의 `cidr_block`이 locals에서도 `cidr_block`이다.
같은 모듈 안이므로 직접 참조할 수 있다. lab01에서 root module이 중개하던 VPC ID를 이제 모듈 내부에서 바로 쓴다.
```

### 한 문장 한 메시지

한 문장에 두 가지 이상의 메시지를 담지 않는다. 같은 뜻을 다른 표현으로 반복하지 않는다.

```text
# 나쁜 예 (반복)
locals.tf 하나를 보면 이 모듈의 전체 설정이 보인다. 무엇을 직접 결정하고, 무엇을 외부에서 받는지가 한눈에 드러난다.

# 좋은 예
locals.tf가 이 모듈의 전체 설정을 담는다. 하드코딩 값, data source 참조, 외부 variable이 하나의 object에 모인다.
```

### 규칙의 점진적 서술

같은 규칙을 여러 코드 블록에서 반복 설명하지 않는다. **첫 등장에서 선언**하고, 이후에는 차이점만 짚는다.

```text
# 나쁜 예 (반복)
network: "모든 참조가 local.*로 통일된다"
iam: "network와 마찬가지로 모든 참조가 local.*로 통일된다"
workload: "main.tf에서 모든 참조가 local.*로 통일된다"

# 좋은 예
network: "모든 참조가 local.*로 통일된다. var.*를 직접 쓰지 않는다."
iam: "network와 같은 구조다."
workload: "같은 구조에 cross-module variable이 추가된다."
```

---

## 금지 표현

- ~~"~하십시오"~~ → `~한다`
- ~~"~해주세요"~~ → `~한다`
- ~~"~할 수 있습니다"~~ → `~할 수 있다`
- ~~"입력합니다"~~ → CLI 명령어 + 코드 블록으로 대체

---

## 숫자/단위

- 숫자는 아라비아 숫자: `8 GiB`, `3개`
- 포트: `8080`, `443`
- CIDR: `10.0.0.0/16`
- 버전: `1.14.x`, `~> 6.0`

---

## 참고/주의 표기

기술적 주의사항은 본문에 자연스럽게 포함:
```
이 시점에서 {리소스}를 destroy하면 {영향}이 발생한다.
```

비용 주의 섹션 없음.
