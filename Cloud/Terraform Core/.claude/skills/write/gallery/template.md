# Template: write/gallery

Gallery 챕터 실습 draft 작성 템플릿 (Terraform Core)

---

## 사용 규칙

- 헤딩 없이 시작 (Notion 타이틀이 대신)
- Gallery는 샌드박스 — `terraform destroy`로 마무리
- 리소스명: `tf-core-gallery-{type}` 규칙 준수
- 이전 Gallery 코드를 복사해 시작한다는 안내 포함
- 모듈 분리 시 `modules/` 디렉토리 함께 복사 안내
- 결과 확인: `terraform output` + 브라우저 Gallery 앱 접근 확인

---

## 템플릿

---

{실습 설명 1~2줄. 이전 Gallery에서 무엇이 바뀌는지, 어떤 코드 변화가 핵심인지 요약.}

### 실습 목표

- {목표 1}
- {목표 2}
- {목표 3}

---

# 1. 전체 아키텍처

```mermaid
{누적 아키텍처 — 이번 Chapter에서 추가/변경된 부분 강조}
```

또는

[이미지: 전체 아키텍처 - {구성 요소} - {이번 Chapter 변경 강조 포인트}]

{아키텍처 해설 2~4줄. 이번 Chapter에서 달라진 점 중심으로.}

---

# 2. 사전 준비

- Terraform: **`1.10.x`**
- AWS Region: **`ap-northeast-2`**
- 전제 조건: {이전 Gallery 섹션 또는 이번 챕터 섹션 lab} 완료

**이전 Gallery 코드 복사:**

{Ch01 Gallery (최초)인 경우 이 섹션 생략}
{이후 Gallery부터:}

이전 Gallery(`{이전 챕터} Gallery - {실습명}/`) 디렉토리의 파일을 복사해 시작한다.

```bash
# 이전 Gallery 디렉토리에서 복사
cp -r "../{이전 챕터 디렉토리}/Gallery - {이전 실습명}/." .
```

{모듈이 있는 경우:}
`modules/` 디렉토리를 포함해 복사한다.

**디렉토리 구조:**

```text
Gallery - {실습명}/
├── main.tf
├── variables.tf
├── outputs.tf
{모듈 있는 경우:}
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── sg/
    └── ec2/
```

---

# 3. {첫 번째 작업명}

{이 작업을 왜 하는지 1줄 설명}

## main.tf

```hcl
{코드}
```

### 참고
- [섹션 실습 lab{no}: {실습 제목}]({섹션 디렉토리}/lab{no}/)

---

# 4. {두 번째 작업명}

## {파일명}.tf

```hcl
{코드}
```

### 참고
- [섹션 실습 lab{no}: {실습 제목}]({섹션 디렉토리}/lab{no}/)

---

... 작업 단계 반복 ...

---

# {n}. 배포

## terraform init

```bash
$ terraform init

# 출력 예
Terraform has been successfully initialized!
```

## terraform plan

```bash
$ terraform plan

# 출력 예
Plan: {N} to add, 0 to change, 0 to destroy.
```

## terraform apply

```bash
$ terraform apply -auto-approve

# 출력 예
Apply complete! Resources: {N} added, 0 changed, 0 destroyed.

Outputs:

public_ip = "13.125.xxx.xxx"
instance_id = "i-0abc1234567890def"
```

---

# {n+1}. 결과 확인

## terraform output

```bash
$ terraform output

# 출력 예
public_ip = "13.125.xxx.xxx"
```

## Gallery 앱 접근

브라우저에서 `http://{public_ip}:8080` 접속하여 Gallery 앱이 정상 동작하는지 확인한다.

[콘솔화면: 브라우저 > http://{public_ip}:8080 > Gallery 앱 메인 화면]

**확인:**

- Gallery 앱 메인 페이지 로드 확인
- 이미지 업로드 동작 확인
- {이번 Chapter 변경 사항에 따른 추가 확인 항목}

---

# {n+2}. 자원 정리

Gallery 실습은 샌드박스 방식으로 운영한다. 실습 완료 후 전체 인프라를 제거한다.

```bash
$ terraform destroy -auto-approve

# 출력 예
Destroy complete! Resources: {N} destroyed.
```

다음 Gallery 실습(Ch{next_no})에서는 이 디렉토리의 코드를 복사해 시작한다.
{모듈이 있는 경우: "`modules/` 디렉토리를 포함해 복사한다."}
