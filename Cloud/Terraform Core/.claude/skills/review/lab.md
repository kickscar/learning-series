# Skill: review/lab

Section Lab draft 검토 스킬.

---

## 체크리스트

### 1. 구조 준수

- [ ] 파일명: `{ch_no}.{sec_no}.claude.notion.md` 형식 (섹션 단위 — 다수 Lab 포함 가능)
- [ ] 각 Lab 헤딩: `## [실습] lab{no}: {실습 제목}` 형식
- [ ] Lab 순번: 섹션 내 로컬 순번 (`lab01`, `lab02`...) — 전역 순번 아님
- [ ] 필수 섹션 존재: 목표, 파일 구조, 단계별 실습, 결과 확인, 정리(destroy)

### 2. Lab 독립성

- [ ] 각 Lab이 독립 sandbox — 이전 Lab 결과에 의존하지 않음
- [ ] 단, 동일 섹션 내 Lab 간 개념 연계 설명은 허용 (코드 의존 아님)

### 3. HCL 코드 완결성

- [ ] 실습에 필요한 모든 `.tf` 파일 코드 포함 (main.tf, variables.tf, outputs.tf 등)
- [ ] 파일 구조 다이어그램 있음 (`lab{no}/` 디렉토리 기준)
- [ ] 리소스명 규칙 준수: `tf-core-lab{lab_no}-{type}` (rules/style-guide.md)

### 4. 실습 단계 (B방식: step-by-step)

- [ ] 단계별 코드 → 설명 순서 (B방식 기본)
- [ ] `terraform init` → `terraform plan` → `terraform apply` 순서 명시
- [ ] 각 단계 목적 설명 포함

### 5. 결과 확인

- [ ] C방식 (terraform output) 필수 포함
  - `terraform output` 또는 `terraform show` 기반
  - 예상 출력 예시 있음 (` ```text ` 블록)
- [ ] A방식 (AWS CLI) 참조 포함 (선택, 권장)
  - `aws ec2 describe-instances` 등 실제 리소스 확인 명령어
  - C방식 보조 수단으로 명시

### 6. 샌드박스 종료

- [ ] 각 Lab 마지막에 `terraform destroy` 단계 있음
- [ ] destroy 전 확인 사항 명시 (apply 완료 상태 가정)

### 7. 코드 블록 규칙 (rules/code-blocks.md)

- [ ] HCL 코드: ` ```hcl `
- [ ] CLI 명령어: ` ```bash `
- [ ] 출력 결과: ` ```text `

### 8. TF Core 원칙

- [ ] AWS 서비스 동작 설명 없음 (Terraform 동작에 집중)
- [ ] Terraform 버전 민감 문법에 어노테이션 있음 (해당 시)

---

## 판정 기준

- **OK**: 모든 항목 통과 — README 작성 진행
- **수정 필요**: 위치(Lab 번호 + 단계) + 이유 명시 후 writer 재실행 요청
- **기술 오류 의심**: 별도 flagging, 수정은 사용자 판단
