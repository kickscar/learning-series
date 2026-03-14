# {Series Name} - Series Hierarchy Plan

이 문서는 **{Series Name} Series의 전체 문서 구조(Chapter / Section / Lab)**를 정의하는 계획 문서이다.

Series 전체 학습 흐름을 설계하고 각 Chapter 및 Section에서 다루는 개념과 실습(Lab)을 정리한다.

---

# Series Overview

이 Series의 목적은 다음과 같다.

- {Series 목적 설명}
- {학습 목표}
- {이 Series가 전체 커리큘럼에서 차지하는 위치}

예:

- Terraform을 이용한 Infrastructure as Code(IaC) 기본 개념 학습
- Terraform CLI 사용법 및 기본 Workflow 이해
- 실제 Infrastructure provisioning 실습

---

# Target Audience

이 Series는 다음 학습자를 대상으로 한다.

### Beginner

- {선수 지식}
- {필요 배경}

예:

- AWS 기본 개념
- CloudFormation 입문
- Cloud infrastructure 기본 이해

### Intermediate

- {심화 학습자 관심 영역}

예:

- Infrastructure layering
- Terraform module 설계
- production 수준 IaC 설계

---

# Series Structure

이 Series는 다음 계층 구조를 따른다.

```
Chapter
    |-- Section
        |- Lab
```

설명:

- **Chapter**
  - 큰 학습 주제 단위
- **Section**
  - 구체적인 학습 단위
  - 개념 설명 + Lab 설계 포함
- **Lab**
  - 실제 실습 코드

---

# Chapter Plan

---

## Chapter 01: {Chapter Name}

{Chapter 설명}

예:

Terraform의 기본 개념과 Infrastructure as Code(IaC)의 필요성을 이해한다.

```
| Section | 내용 | Lab |
|-------|------|-----|
| 1.1 | {Section 제목} | {실습 내용} |
| 1.2 | {Section 제목} | {실습 내용} |
| 1.3 | {Section 제목} | {실습 내용} |
```

---

## Chapter 02: {Chapter Name}

{Chapter 설명}

```
| Section | 내용 | Lab |
|-------|------|-----|
| 2.1 | {Section 제목} | {실습 내용} |
| 2.2 | {Section 제목} | {실습 내용} |
| 2.3 | {Section 제목} | {실습 내용} |
```

---

## Chapter 03: {Chapter Name}

{Chapter 설명}

```
| Section | 내용 | Lab |
|-------|------|-----|
| 3.1 | {Section 제목} | {실습 내용} |
| 3.2 | {Section 제목} | {실습 내용} |
| 3.3 | {Section 제목} | {실습 내용} |
```

---

# Series Progression

이 Series의 학습 흐름은 다음과 같다.

```
Chapter1 핵심 주제}
↓
{Chapter2 핵심 주제}
↓
{Chapter3 핵심 주제}
↓
{최종 목표}
```

예:

```
IaC 개념 이해
↓
Terraform 기본 Workflow
↓
State 관리
↓
Module 기반 인프라 설계
```

---

# Series Integration

이 Series는 다음 Series와 연계된다.

```
| Chapter | 연계 Series |
|-------|-------------|
| {Chapter} | {연계 Series 설명} |
| {Chapter} | {연계 Series 설명} |
```

예:

```
| Chapter | 연계 Series |
|-------|-------------|
| Module 설계 | Terraform Advanced |
| Infrastructure Layering | Cloud Architecture Series |
```

---

# Notes

이 문서는 **Series 전체 구조를 설계하는 계획 문서**이다.

Section 문서 작성 시에는 다음 문서를 기반으로 진행한다.

.agents/plans/{chapter}.{section}.md

예:

.agents/plans/01.01.IaC와 Terraform.md