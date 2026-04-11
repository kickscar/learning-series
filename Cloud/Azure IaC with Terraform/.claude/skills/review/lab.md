# review/lab — Section Lab 검토

## 목적

Section Lab draft의 구조·규칙 준수 여부를 검토한다.

## 체크리스트

### 1. 구조 준수

- [ ] 파일명: `{ch_no}.{sec_no}.claude.notion.md`
- [ ] Lab 헤딩: `# [실습] lab{no}: {제목}`
- [ ] 실습 목표: `### 실습 목표` + 불릿 리스트
- [ ] 필수 섹션: 전체 아키텍처, 사전 준비, 작업 단계, 배포, 결과 확인
- [ ] 자원 정리: 챕터 내 누적이면 건너뛰기 안내, 아니면 terraform destroy

### 2. Lab 누적 규칙

- [ ] 챕터 내 이전 Lab 의존 시 `# 2. 사전 준비`에 명시
- [ ] 챕터 간 의존 없음 (Gallery가 챕터 간 연결)

### 3. HCL 완성도

- [ ] 모든 .tf 파일 포함 (providers.tf, variables.tf, main.tf, outputs.tf)
- [ ] 파일 구조 다이어그램 (`text` 코드 블록)
- [ ] 리소스 네이밍: `azure-iac-lab{no}-{env}-{layer}-{capability}-{role}`

### 4. 실습 단계

- [ ] 파일별 코드 → 설명 순서
- [ ] terraform init → plan → apply 순서
- [ ] 코드에 인라인 주석 없음

### 5. 결과 확인

- [ ] **terraform output** — 필수
- [ ] **az CLI 확인** — 필수 (콘솔 대체)
- [ ] 명령어(`bash`)와 출력(`text`) 분리

### 6. 코드 블록 규칙

- [ ] 언어 지정: `hcl`, `bash`, `text`
- [ ] 민감 정보: `xxx` 또는 `{설명}` 처리

### 7. 시리즈 원칙

- [ ] Azure 서비스 기초 설명 없음
- [ ] azurerm provider 버전 민감 기능 표기

## 판정

- **OK**: 수정 불필요
- **수정 필요**: 위치 + 사유 명시
- **기술 오류**: 플래그 (사용자 확인 필요)
