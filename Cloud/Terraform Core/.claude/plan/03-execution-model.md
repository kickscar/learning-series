# Chapter 03 — Execution Model

## 목표

Terraform이 코드를 실행하는 내부 메커니즘을 깊이 이해한다.
init → plan → apply → destroy 각 단계의 내부 동작, 의존 관계 그래프, 리소스 생명주기를 체계적으로 파악한다.

---

## Section 구성

### Section 01 — Terraform 워크플로우
- **유형**: 이론
- **기반 자료**: `01.04.claude.notion.md` (구 Ch01 Sec04) — 심화 확장
- **내용**:
  - `terraform init` 내부 동작: Provider 다운로드 흐름, lock 파일 생성/검증
  - `.terraform/` 디렉토리 구조 심화
  - `.terraform.lock.hcl`: 버전 고정 + 해시 검증, VCS 커밋 이유
  - `terraform plan` 3단계: refresh → diff → execution plan 생성
  - refresh 메커니즘: State와 실제 인프라 동기화, `-refresh=false`
  - `terraform apply`: plan 재실행, API 호출, State 업데이트
  - `terraform apply -out=tfplan` 패턴 (CI/CD)
  - `terraform destroy`: State 기반 삭제 계획 생성
- **Lab**: 없음

---

### Section 02 — Dependency Graph
- **유형**: 이론 + 실습
- **내용**:
  - 리소스 간 암묵적 의존성 탐지 방식 (참조 표현식 파싱)
  - 의존 관계 그래프(DAG: Directed Acyclic Graph) 개념
  - `terraform graph` 명령 및 Graphviz 시각화
  - 병렬 실행: 독립 리소스의 동시 생성/삭제
  - `-parallelism` 옵션으로 병렬도 제어
  - `-target` 옵션: 특정 리소스만 plan/apply (주의사항 포함)
  - `depends_on` 명시적 의존성이 필요한 상황
- **Lab**:
  - `[실습] lab01: terraform graph 시각화`
    - 여러 리소스(VPC, SG, EC2)로 구성된 코드 작성
    - `terraform graph | dot -Tsvg > graph.svg` 실행
    - 의존 관계 그래프 확인
    - 병렬 실행 순서를 plan 출력에서 확인

---

### Section 03 — Destroy와 리소스 생명주기
- **유형**: 이론 + 실습
- **내용**:
  - destroy의 역순 삭제 원리 (의존 관계 그래프 역전)
  - `lifecycle` 블록 개요
    - `create_before_destroy`: 교체 시 새 리소스 먼저 생성
    - `prevent_destroy`: 실수 삭제 방지
    - `ignore_changes`: 특정 인수 변경 무시
    - `replace_triggered_by`: 참조 리소스 변경 시 강제 교체
  - `-target=<resource>` destroy로 특정 리소스만 삭제
  - `terraform apply -replace=<resource>`: 강제 교체 (taint 대체)
- **Lab**:
  - `[실습] lab01: lifecycle 블록 실습`
    - `prevent_destroy`로 실수 삭제 방지 확인
    - `create_before_destroy`로 교체 순서 변경 확인
    - `ignore_changes`로 외부 변경 무시 확인

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/03.01.claude.notion.md` |
| 02 | `.claude/draft/03.02.claude.notion.md` |
| 03 | `.claude/draft/03.03.claude.notion.md` |

> Sec01 기반 자료: `01.04.claude.notion.md` (구 Ch01 Sec04 Terraform 동작 원리) 심화 확장

## 상태

| Section | 상태 |
|---------|------|
| 01 | draft완료 |
| 02 | draft완료 |
| 03 | draft완료 |
