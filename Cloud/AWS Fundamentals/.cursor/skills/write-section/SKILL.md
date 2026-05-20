# Skill: write-section

Section draft 문서와 README를 작성하는 Agent의 작업 플로우를 정의한다.

---

## Trigger

사용자 프롬프트: `{chapter no}.{section no} 문서 작업`

예: `01.02 문서 작업`, `03.01 문서 작업`

---

## Workflow

### Step 1. 필수 문서 확인

- AGENTS.md
- `.cursor/rules/write-section.mdc`
- `.cursor/memory/context_bridge.md`
- 해당 Chapter plan 문서 `.cursor/plans/{chapter no} {chapter name}.md` 를 읽고, 해당 Section의 주요 내용을 확인한다.
- Plan이 확정(승인)되지 않은 상태이면 작업을 중단하고 사용자에게 보고한다.
- `.cursor/requests/reorg.pending`가 존재하면, 구조 변경 진행 중으로 간주하고 작업을 중단한다.
  - 먼저 reorg-structure workflow를 완료한 뒤 write-section을 진행한다.

### Step 2. Section 성격 판단

Plan의 Section 정보를 기반으로 성격을 판단한다.

| 성격 | 기준 | 적용 템플릿 |
|------|------|------------|
| **이론형** | 실습 없음, 개념/이론 설명만 | `section.md` |
| **실습형** | 실습 중심, 이론은 실습 맥락에서 설명 | `section.md` + `lab.md` |
| **혼합형** | 이론 설명 + 실습 포함 | `section.md` + `lab.md` |

### Step 3. Gallery 프로젝트 Lab 판단

Chapter plan의 **프로젝트 Lab** 섹션을 확인하고, 현재 작성 중인 Section이 해당 Chapter의 **마지막 Section**인지 판단한다.

- **마지막 Section인 경우**: 프로젝트 Lab을 Section draft 끝에 포함한다.
- **마지막 Section이 아닌 경우**: 프로젝트 Lab을 작성하지 않는다.
- **프로젝트 Lab이 없는 Chapter인 경우**: 이 단계를 건너뛴다.

프로젝트 Lab 해석 원칙:

- 프로젝트 Lab은 해당 Chapter 전용 부록이 아니라, **시리즈 전역 프로젝트 흐름**의 일부이다.
- 각 Section은 먼저 해당 Section의 이론/개념과 개별 Lab을 다룬다.
- 해당 Chapter의 **마지막 Section**에서는, 그 Chapter에서 학습한 내용을 프로젝트 Lab에 반영한다.
- 따라서 프로젝트 Lab은 개별 Lab을 대체하는 것이 아니라, **Section 학습 결과를 시리즈 프로젝트에 연결하는 마지막 단계**로 작성한다.

Gallery Lab 유형:

| 유형 | 표기 | 설명 |
|------|------|------|
| 연동·배포 확장 | `[실습] Lab: Gallery - …` | 동일 앱으로 스토리지·DB·컨테이너 등을 단계적으로 연동 (예: S3 연동, RDS 연동, ECS 배포) |
| 인프라 전환 | `[실습] Lab: Gallery - …` | 동일 앱을 다른 네트워크·트래픽 경로로 옮기는 경우 (예: Custom VPC 이전, ALB 전환) |

Lab 제목은 시리즈 `README.md`의 **Series Project: Gallery** 표와 동일한 네이밍을 쓴다.

### Step 4. Series Context 적용 (중요)

현재 시리즈는 **AWS Fundamentals**임을 기준으로 다음을 반드시 적용한다.

- IaC는 다루지 않는다 (CloudFormation, Terraform 금지)
- 모든 실습은 AWS Console 기준으로 작성한다
- 개별 서비스 설명은 반드시 전체 인프라 구조와 연결한다
- 리소스를 분리된 개념으로 설명하지 않고, 연결된 시스템으로 설명한다
- 최종 목표는 "개발한 애플리케이션이 AWS에서 동작하는 것"이다

### Step 5. Rule 확인

`.cursor/rules/write-section.mdc`를 읽고, 문서 작성 시 톤앤매너 및 스타일 규칙을 확인한다.

### Step 6. section.md 템플릿 확인

`.cursor/skills/write-section/templates/section.md`를 읽고, Section draft의 이론/개념 부분 구조를 확인한다.

### Step 7. lab.md 템플릿 확인 (조건부)

Section 성격이 **실습형** 또는 **혼합형**인 경우, 또는 **Gallery 프로젝트 Lab을 포함하는 경우**에 실행한다.

`.cursor/skills/write-section/templates/lab.md`를 읽고, 실습 부분 구조를 확인한다.

**이론형이면서 Gallery Lab도 없는 경우 이 단계를 건너뛴다.**

### Step 8. Section Draft 작성

다음 원칙을 반드시 따른다.

#### 8.1 개념 설명 원칙

- AWS 서비스 설명은 기능 나열로 끝내지 않는다
- 각 서비스가 인프라 내에서 어떤 역할을 하는지 설명한다
- 반드시 다른 리소스와의 연결 관계를 포함한다

예:
- EC2 → VPC, Subnet, Security Group과 연결
- S3 → 정적 파일 저장 / 아키텍처 내 역할 설명

#### 8.2 구조 중심 작성

- VPC, Subnet, Routing, Security Group, Internet Gateway 등은 분리된 개념으로 설명하지 않는다
- 항상 "하나의 네트워크" 안에서 설명한다
- 최종적으로 배포 가능한 형태로 이어지도록 작성한다

#### 8.3 Console 기반 실습 원칙

- 실습은 AWS Console 기준으로 작성한다
- 단계별 UI 흐름을 기준으로 설명한다
- CLI, SDK, IaC는 포함하지 않는다

#### 8.4 배포 중심 관점

- 단순 리소스 생성으로 끝내지 않는다
- "이 리소스를 왜 만드는가?"를 반드시 설명한다
- 가능하면 애플리케이션 실행 흐름과 연결한다

#### 8.5 작성하기

`.cursor/draft/{chapter no}.{section no}.notion.cursor.md`를 작성한다.

- section.md 템플릿 구조에 따라 이론/개념 내용을 작성한다.
- 개별 Lab이 있는 경우, lab.md 템플릿 구조에 따라 실습 내용을 이어서 작성한다.
- Gallery 프로젝트 Lab이 있는 경우 (Step 3에서 판단), 개별 Lab 뒤에 Gallery Lab을 이어서 작성한다.
- `.cursor/rules/write-section.mdc`의 작성 규칙을 적용한다.

### Step 9. section-readme.md 템플릿 확인

`.cursor/skills/write-section/templates/section-readme.md`를 읽고, README 구조를 확인한다.

### Step 10. README.md 작성

README 작성 원칙:

- Section 내용을 반복하지 않는다
- 다음 정보를 포함한다:
  - Section 목적
  - 학습 내용 요약
  - 실습 포함 여부
  - 관련 Draft 위치
- Git Repository 사용자를 위한 안내 문서로 작성한다

`{chapter no} {chapter name}/{section no} {section name}/README.md`를 작성한다.

- 디렉토리가 존재하지 않으면 생성한다.
- 이때 **Chapter 디렉토리와 Section 디렉토리를 모두 생성**한다.
  - `{chapter no} {chapter name}/`
  - `{chapter no} {chapter name}/{section no} {section name}/`
- section-readme.md 템플릿 구조에 따라 작성한다.

### Step 11. 자동 검증 (check-writings)

draft + README 작성이 완료되면 바로 check-writings Agent를 실행한다.

- `.cursor/skills/check-writings/SKILL.md`의 워크플로우를 따른다.
- 검증 범위: 카테고리 1(구조), 2(Plan), 3(톤앤매너), 5(README)
- Cross-document(4)는 자동 실행에서 스킵한다.
- 리포트를 대화로 출력한다.
- `[FAIL]` 항목이 있으면 사용자에게 보고하고 지시를 기다린다.

### Step 11.1 작업 현황 표 갱신 (필수)

draft + README가 생성되면, `.cursor/plans/series-hierarchy.md`의 "작업 현황" 테이블에서 해당 Section 행을 갱신한다.

- Draft: `O`
- README: `O`
- 상태: `초안완료`

Lab 범위는 plan 기준 값을 유지한다.

### Step 12. Memory 업데이트

`.cursor/memory/context_bridge.md`에 작업 완료 기록을 append한다.

- 작성한 Section 번호와 이름
- Section 성격 (이론형/실습형/혼합형)
- Gallery Lab 포함 여부
- 자동 검증 결과 요약 (PASS/FAIL/WARN 건수)
- 특이 사항이나 사용자 피드백 (있는 경우)

---

## 출력물

| 파일 | 설명 |
|------|------|
| `.cursor/draft/{chapter no}.{section no}.notion.cursor.md` | Section draft (Notion 이전 단계 초안). Gallery Lab 포함 시 draft 끝에 이어서 작성. |
| `{chapter no} {chapter name}/{section no} {section name}/README.md` | Git Repository 사용자를 위한 Section 안내 문서 |

---

## 대용량 Section 처리

Section의 이론 + Lab이 많아 한 번에 출력이 어려운 경우:

1. 이론/개념 파트를 먼저 작성한다.
2. 사용자에게 "이론 파트 작성 완료. Lab 파트를 이어서 작성합니다."로 보고한다.
3. 개별 Lab 파트를 이어서 작성한다.
4. Gallery Lab이 있는 경우, 개별 Lab 뒤에 이어서 작성한다.
5. 모든 파트가 완료된 후 auto-check를 실행한다.

---

## 주의 사항

- Plan이 확정되지 않은 상태에서는 작업하지 않는다.
- 동일 Section draft 재작성 요청 시, 기존 draft를 수정 누적하지 않고 새 기준으로 다시 작성한다.
- 에이전트는 개념/이론, 실습 예제 내용/코드 설명만 작성한다. 실제 예제 소스 파일은 사용자가 작성한다.
- 경로에 공백이 포함된 디렉토리를 사용할 때는 항상 따옴표를 사용한다.
- Gallery Lab은 해당 Chapter의 마지막 Section에서만 작성한다.
