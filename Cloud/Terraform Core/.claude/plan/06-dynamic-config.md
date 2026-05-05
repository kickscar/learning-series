# Chapter 06 — 재사용 가능한 모듈 & 동적 구성

## 목표

Ch05에서 하드코딩으로 구성한 Layer 모듈을 동적으로 진화시킨다.
count / for_each / for expression / dynamic 블록과 내장 함수로 모듈의 재사용성과 유연성을 확보한다.
Ch05의 Layer 모듈을 리팩토링하면서 해당 문법을 배우고, 재사용 가능한 모듈을 추출한다.

> **설계 원칙 (내부 가이드, draft에 직접 포함 안 함):**
> Ch06 = Resource Module 개념에 충실. Ch05의 하드코딩 Layer 모듈을 재사용 가능한 단위로 추출·리팩토링한다.
> Resource Module, Layer Module 용어는 사용하지 않는다. 나중에 이 용어를 접했을 때
> "Ch05가 Layer Module이었고, Ch06이 Resource Module이었구나" 하고 자연스럽게 연결되도록 한다.
>
> **2단 구조**:
> - `modules/` — 재사용 가능한 모듈 (동적, 1 depth). 다른 프로젝트에서 그대로 쓸 수 있다.
> - `network/`, `platform/`, `workload/` — 프로젝트 전용 조립. modules/ 호출.
>
> ```
> gallery/
> ├── modules/          ← 재사용 가능 모듈 (동적)
> │   ├── vpc/
> │   ├── subnet/
> │   ├── sg/
> │   ├── lb/
> │   ├── instance/
> │   ├── iam/
> │   ├── rds/          ← 06.05에서 추가
> │   └── s3/           ← 06.05에서 추가
> ├── network/          ← modules/ 호출로 리팩토링
> ├── platform/
> └── workload/
> ```

---

## 핵심 원칙

- **섹션 제목은 교과서적** (count/for_each, for expression/dynamic, 내장 함수)
- **내용은 Ch05 Layer 모듈을 리팩토링하면서** 해당 문법을 배운다
- **이론은 문법 소개** (가능하면 실습 코드 일부를 예시로), **실습에서 본격적으로 적용**
- 각 섹션이 Ch05의 특정 Layer와 매핑된다

| Ch06 Section | 교과서 제목 | Ch05 리팩토링 대상 | 추출하는 모듈 |
|-------------|-----------|-------------------|-------------|
| Sec01 | 조건식 & count / for_each | network/ | `modules/vpc`, `modules/subnet` |
| Sec02 | for expression & dynamic | platform/ (SG, ALB) | `modules/sg`, `modules/lb` |
| Sec03 | 내장 함수 | 전체 modules/ | 검증 강화 |
| Sec04 | Gallery: 리팩토링 | Ch05 Gallery 전체 | 리팩토링 확인 (기존 동작 유지) |
| Sec05 | Gallery: 3-tier 확장 | Gallery + 신규 | `modules/rds`, `modules/s3` 추가 |

---

## Section 구성

### Section 01 — 조건식 & count / for_each
- **유형**: 이론 + 실습
- **이론**: count, for_each, 조건식 문법 (실습 코드 일부로 예시)
- **리팩토링 대상**: Ch05 network/ (하드코딩 VPC + Subnet ×4 + NAT GW + EIP)
- **Lab**:
  - `[실습] lab01: for_each — Subnet ×4 동적 생성`
    - Ch05의 하드코딩 subnet ×4 → for_each map으로 전환
  - `[실습] lab02: count — EIP 조건부 생성`
    - count 정수 반복, count.index
  - `[실습] lab03: count 조건부 + for_each set — NAT GW`
    - count = condition ? 1 : 0, for_each + toset()
    - count vs for_each 비교 (reindexing 문제)
  - `[실습] lab04: network/ 리팩토링`
    - modules/vpc + modules/subnet 추출
    - network/ → modules/ 호출 구조로 전환

---

### Section 02 — for expression & dynamic 블록
- **유형**: 이론 + 실습
- **이론**: for expression, dynamic 블록 문법 (실습 코드 일부로 예시)
- **리팩토링 대상**: Ch05 platform/ (하드코딩 SG, ALB)
- **Lab**:
  - `[실습] lab01: dynamic ingress — 단일 SG 동적화`
    - for expression으로 SG config 추출 + dynamic ingress
  - `[실습] lab02: for_each + dynamic — 복수 SG + ALB 동적화`
    - layer별 SG 분리 (platform/workload)
    - modules/sg, modules/lb 추출

---

### Section 03 — 내장 함수
- **유형**: 이론 + 실습
- **이론**: cidrsubnet, lookup, try/can, startswith (실습 코드 일부로 예시)
- **리팩토링 대상**: 전체 modules/
- **Lab**:
  - `[실습] lab01: 모듈 검증 강화`
    - cidrsubnet — subnet CIDR 자동 계산 (하드코딩 CIDR 제거)
    - lookup — optional parameter 처리
    - try/can — 방어적 코딩
    - startswith — public/private subnet 분기 (dynamic route)

---

### Section 04 — [실습] Gallery: 모듈 리팩토링
- **유형**: 시리즈 실습
- **전제 조건**: Ch05 Gallery(05.04) 완료, Ch06 Sec01~03 완료
- **내용**:
  - Ch05 Gallery(05.03 ALB+EC2, 05.04 ASG)를 Sec01~03에서 만든 modules/로 리팩토링
  - modules/ 완성: vpc, subnet, sg, lb, instance, iam
  - network/, platform/, workload/ → modules/ 호출 구조로 전환
  - **기존 Gallery와 동일하게 동작하는지 확인** — "리팩토링해도 똑같이 동작한다"
  - ALB DNS로 Gallery 앱 접속 확인

---

### Section 05 — [실습] Gallery: 3-tier 확장
- **유형**: 시리즈 실습
- **전제 조건**: Ch06 Gallery(06.04) 완료
- **내용**:
  - modules/rds 신규 추가 (RDS)
  - modules/s3 신규 추가 (S3)
  - Gallery 앱: MariaDB 연결 + S3 스토리지 전환
  - **재사용 가능한 모듈의 효용성 증명** — "새 리소스 추가가 쉽다"
  - IAM 정책 확장 (S3 접근 정책 추가)
  - 3-tier 완성

---

## 기존 코드 재활용

| Old Lab | 재활용 | 비고 |
|---------|--------|------|
| Sec01 lab01~05 (flat count/for_each) | 문법 흐름 재활용, 모듈 맥락으로 전환 | flat → module extraction |
| Sec02 lab01~02 (flat dynamic SG) | 거의 그대로, SG module extraction 추가 | dynamic + merge 패턴 동일 |
| Sec03 lab01 (full integration) | 코드 대부분 재활용, module 구조로 리팩토링 | cidrsubnet/lookup/try 로직 동일 |
| Gallery (미완성) | 새로 작성, lab00 참고 | RDS+S3 추가 |
| lab00 (proto-module) | Gallery 최종 참고 모델 | Resource Module 완성형 |

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/06.01.claude.notion.md` |
| 02 | `.claude/draft/06.02.claude.notion.md` |
| 03 | `.claude/draft/06.03.claude.notion.md` |
| 04 (Gallery) | `.claude/draft/06.04.claude.notion.md` |
| 05 (Gallery) | `.claude/draft/06.05.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 재구성 |
| 02 | 재구성 |
| 03 | 재구성 |
| 04 (Gallery) | 재구성 |
| 05 (Gallery) | 재구성 |
