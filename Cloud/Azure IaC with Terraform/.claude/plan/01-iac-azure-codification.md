# Chapter 01 — IaC와 Azure 코드화

## 목표

IaC의 본질이 Terraform 하나가 아님을 전달한다.
CLI(ad-hoc 스크립트) → SDK → 프로비저닝 도구(Terraform)로 이어지는 **코드화 스펙트럼**을 이해하고,
각 수준의 역할과 한계를 직접 체감한 후 Terraform의 포지셔닝을 파악한다.

---

## 핵심 메시지

- CLI 명령어를 스크립트로 묶으면 그것도 **당당한 IaC 자동화**다
- SDK로 Gallery 앱이 Azure Storage에 연동하듯, 코드로 인프라에 접근하는 것은 자연스러운 확장이다
- Terraform은 이 스펙트럼에서 **선언적·멱등성·상태 관리**를 제공하는 프로비저닝 도구로 자리한다

---

## Section 구성

### Section 01 — IaC 개요 — 코드화의 세 가지 수준
- **유형**: 이론
- **내용**:
  - IaC란 무엇인가 — 콘솔 클릭에서 코드로
  - 코드화의 세 가지 수준:
    1. **CLI / 스크립트**: ad-hoc 자동화, 셸 스크립트로 반복 작업 제거
    2. **SDK**: 프로그래밍 언어로 인프라 API 호출, 애플리케이션과 인프라의 경계
    3. **프로비저닝 도구**: 선언적 정의, 상태 관리, 의존성 해소 (Terraform, CloudFormation, Pulumi)
  - 각 수준의 강점과 한계
  - 이 시리즈의 범위: CLI를 기본 도구로, SDK는 개념 이해, Terraform이 주력
- **Lab**: 없음

### Section 02 — az CLI 설치와 핵심 명령어
- **유형**: 이론 + 실습
- **내용**:
  - az CLI 설치 방법 (macOS, Linux, Windows)
  - `az login` — 인증 흐름
  - 핵심 명령어 구조: `az <group> <command> [--parameters]`
  - 리소스 조회: `az group list`, `az vm list`
  - 리소스 생성/삭제: `az group create`, `az group delete`
  - 출력 형식: `--output table/json/tsv`
  - 이 시리즈에서 CLI 활용 방식: **콘솔 대신 CLI로 확인**
- **Lab**:
  - `[실습] lab01: az CLI 설치 및 기본 명령어`
    - az CLI 설치 및 버전 확인
    - `az login`으로 인증
    - Resource Group 생성 → 조회 → 삭제 (CLI만으로 완료)
    - `--output table` / `--output json` 비교

### Section 03 — Azure SDK for Java — VM 유틸리티
- **유형**: 이론 + 실습
- **내용**:
  - Azure SDK 개요: 각 언어별 SDK 존재 (Java, Python, .NET, Go, JS)
  - Java SDK 구조: `azure-resourcemanager` 라이브러리
  - SDK의 역할: 애플리케이션에서 Azure 리소스에 프로그래밍 방식으로 접근
  - Gallery 앱과 SDK의 관계: Storage 연동, VM 정보 조회 등이 SDK 영역
  - "IaC를 공부하는 사람이라면 이 연결고리가 자연스럽게 보여야 한다"
- **Lab**:
  - `[실습] lab02: Azure SDK for Java — VM 유틸리티`
    - 간단한 Java 프로젝트에서 Azure SDK 의존성 추가
    - VM 목록 조회 유틸리티 작성
    - 실행 후 결과 확인 (az CLI 결과와 비교)

### Section 04 — Terraform 포지셔닝
- **유형**: 이론
- **내용**:
  - CLI 스크립트의 한계: 명령적(imperative), 멱등성 보장 불가, 상태 추적 없음
  - SDK의 한계: 코드량 과다, 의존성 관리 직접 수행, 인프라 전용이 아님
  - Terraform이 해결하는 것: 선언적 정의, 상태 파일, 의존성 그래프, plan/apply 워크플로우
  - Terraform Core 시리즈와의 관계: HCL 문법·핵심 개념은 Terraform Core에서 학습
  - 이 시리즈의 접근: Azure 플랫폼 고유 패턴을 Terraform으로 구현
- **Lab**: 없음

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/01.01.claude.notion.md` |
| 02 | `.claude/draft/01.02.claude.notion.md` |
| 03 | `.claude/draft/01.03.claude.notion.md` |
| 04 | `.claude/draft/01.04.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획수립 |
| 02 | 계획수립 |
| 03 | 계획수립 |
| 04 | 계획수립 |
