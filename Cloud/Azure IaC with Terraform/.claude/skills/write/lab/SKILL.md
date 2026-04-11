# write/lab — Section Lab 작성

## 목적

plan 파일 기반으로 Section Lab을 작성한다.

## 입력

- `.claude/plan/{ch_no}-*.md` — Lab 번호, 내용, 사용 리소스
- `.claude/research/{ch_no}.{sec_no}.md` — 조사 결과 (있으면)

## 출력

- `.claude/draft/{ch_no}.{sec_no}.claude.notion.md` (이론 뒤에 이어서 작성)

## 실행 단계

### 1. 정보 수집

- plan 파일에서 Lab 내용·리소스 파악
- research 파일 존재 시 참조

### 2. 작성

- `template.md` 구조에 따라 작성
- 이론 섹션이 있으면 `# 참고 자료` 뒤에 Lab 시작
- 이론 없이 Lab만 있으면 Lab으로 바로 시작

### 3. Lab 구조

```
# [실습] lab{no}: {제목}
### 실습 목표
# 1. 전체 아키텍처
# 2. 사전 준비
# 3. {작업 단계}
## {file}.tf
# n. 배포
## terraform init → plan → apply
# n+1. 결과 확인
## terraform output
## az CLI 확인
# n+2. 자원 정리 (해당 시)
## terraform destroy
```

### 4. 규칙 검증

모든 rules/ 파일 대조

## Lab 독립성 규칙

- Section Lab은 **챕터 내에서 누적** 가능 (이전 Lab의 리소스 유지)
- 챕터의 마지막 Lab 또는 Gallery에서 정리
- Lab 간 의존성이 있으면 `# 2. 사전 준비`에 명시

## 결과 확인 방법

| 방법 | 우선순위 | 도구 |
|------|---------|------|
| C-method: terraform output | **필수** | `terraform output` |
| A-method: az CLI 확인 | **필수** | `az {group} show` 등 |

> 이 시리즈는 콘솔 대신 **az CLI로 결과를 확인**한다. A-method는 필수다.

## 리소스 네이밍

```
azure-iac-lab{lab_no}-{env}-{layer}-{capability}-{role}
```
