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
- 버전: `1.10.x`, `~> 5.0`

---

## 참고/주의 표기

기술적 주의사항은 본문에 자연스럽게 포함:
```
이 시점에서 {리소스}를 destroy하면 {영향}이 발생한다.
```

비용 주의 섹션 없음.
