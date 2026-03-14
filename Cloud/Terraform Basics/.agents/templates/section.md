# {chapter}.{section} {section title}

---

# 개요

이 Section에서 다루는 Terraform 개념과 학습 흐름을 설명한다.

다음 관점을 중심으로 서술한다.

- 이 Section이 Terraform workflow에서 어떤 위치인지
- 어떤 문제를 해결하기 위한 개념인지
- 이후 Section들과 어떻게 연결되는지

가능하면 **인프라 설계 관점**에서 설명한다.

---

# 학습 목표

이 Section 학습 후 다음을 이해하거나 수행할 수 있어야 한다.

- Terraform 개념 이해
- Terraform 코드 구조 이해
- Terraform CLI 사용
- Terraform resource 동작 이해

---

# 핵심 개념

이 Section에서 다루는 주요 개념들을 설명한다.

## {concept 1}

개념 설명

가능하면 다음을 포함한다.

- 정의
- 왜 필요한가
- Terraform에서 어떤 역할을 하는가

## {concept 2}

개념 설명

필요 시 다음을 포함한다.

- 구조 설명
- 동작 원리
- Terraform architecture 관점

---

# Architecture / 동작 원리

Terraform이 실제로 어떻게 동작하는지 설명한다.

예:

- Terraform dependency graph
- resource creation order
- provider interaction
- state management

가능하면 **다이어그램 또는 단계 설명 형태**로 작성한다.

---

# Terraform Configuration Example

Terraform 코드 예제를 통해 개념을 설명한다.

```hcl
resource "example" "sample" {
  name = "example"
}
```

코드 설명

- 어떤 resource인지
- 어떤 설정이 중요한지
- Terraform plan에서 어떤 변화가 발생하는지

---



# [실습] Lab{no}

이 Section에서 수행할 실습을 설명한다.

## Lab 목표

실습을 통해 다음을 확인한다.

- Terraform workflow 이해
- Terraform resource 생성 과정 이해
- Terraform plan / apply 결과 확인

## 실습 환경

```
| 항목                | 내용                     |
| ----------------- | ---------------------- |
| Terraform Version | {version}              |
| Cloud Provider    | AWS                    |
| 실행 방식             | Terraform CLI          |
| 검증 방식             | Terraform plan / apply |
```

## 실습 코드

Terraform configuration

```hcl
# example
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}
```

## 실행

```bash
terraform init
terraform plan
terraform apply
```

## 결과 검증

다음을 확인한다.

- Terraform plan 결과
- Terraform state
- 생성된 cloud resource

## 실습 포인트

이 실습에서 중요한 포인트

- Terraform resource 생성 흐름
- Terraform dependency 처리
- Terraform state 기록

---


# 정리

이 Section에서 학습한 핵심 내용을 정리한다.

- Terraform 핵심 개념
- Terraform 코드 구조
- Terraform 실행 흐름

다음 Section에서 다룰 내용과 연결한다.
