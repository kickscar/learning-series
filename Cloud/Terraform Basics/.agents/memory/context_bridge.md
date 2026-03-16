# Context Bridge

이 문서는 Terraform Basics Codex workspace에서 발생한 주요 결정 사항을 기록한다.

Agent는 작업 완료 후 중요한 결정이 발생하면 이 문서를 업데이트한다.

## 2026-03-14

- `lab-write` skill은 더 이상 사용하지 않는다.
- Lab 설계와 실습 설명 작성 책임은 `section-write` skill에 통합한다.
- 관련 문서에서는 `section-write`를 section draft 생성과 Lab 설계 작성의 단일 진입점으로 설명한다.
- Terraform Basics의 초기 series plan을 생성했다.
- series plan은 7개 Chapter 구조로 정리했다: Terraform 소개, HCL 기초, Terraform 핵심 개념, Core Workflow, State Management, Module 구조와 재사용, Production Practices.
- 이후 section 문서 생성은 `.agents/plans/{chapter name}.md`를 기준으로 진행한다.
- `01.01 IaC와 Terraform` section draft와 README를 생성했다.
- `01.01`은 IaC 정의, Terraform 역할, provider / resource 구분, 첫 `terraform plan` 이해를 중심으로 작성했다.
- 사용자의 correction 기준에 맞춰 `AGENTS.md`와 `series-plan` skill을 수정했다.
- 앞으로 series plan 재수립 시 `.agents/correction/*.md`를 우선 읽고, correction이 있으면 기존 hierarchy와 chapter plans를 재작성할 수 있다.
- series scope 예시는 15개 Chapter 확장 구조를 기준으로 설명한다.
- series plan을 사용자의 correction 기준으로 15개 Chapter 구조로 재수립했다.
- 기존 7개 plan 파일은 새 구조와 충돌하므로 제거하고, `.agents/plans/01`부터 `.agents/plans/15`까지 chapter plan을 다시 생성했다.
- `CI/CD 연동`은 파일 경로상 `/`를 사용할 수 없어 plan 파일명은 `12 CI-CD 연동.md`로 저장하고, 문서 본문에서는 `CI/CD` 표기를 유지한다.
- 최종 문서 샘플 기준에 맞춰 section draft 작성 전략을 개정했다.
- `section.md`는 고정형 학습 템플릿에서 가변형 기술 문서 템플릿으로 변경했다.
- `section-write`는 모든 Section에 실습과 코드 예제를 강제하지 않고, Section 성격에 따라 선택적으로 포함하도록 변경했다.
- `writing-rules.md`에는 개념 중심, 비교 중심, workflow 중심, 실습 중심, 운영/설계 중심 Section 유형 규칙을 추가했다.
- AWS CloudFormation 샘플을 참고해 2차 정밀 개정을 수행했다.
- `section.md`에는 개념 입문형, 비교형, workflow형, 실습형, 운영/설계형 문서 패턴 카탈로그를 추가했다.
- `section-write`와 `writing-rules.md`에는 AWS 리소스 설명을 Terraform 개념 설명에 필요한 수준으로 제한하고, CloudFormation은 보조 비교 재료로만 사용하는 규칙을 추가했다.
- `01.01 IaC와 Terraform` draft를 새 기준으로 재작성했으며, 실습 중심 구조 대신 개념 입문형 구조로 정리했다.
- `01.02 CloudFormation vs Terraform 비교` draft와 README를 생성했다.
- `01.02`는 비교형 문서 패턴으로 작성했으며, CloudFormation 자체 설명은 최소화하고 Terraform의 state, plan, provider 중심 운영 모델을 이해하기 위한 비교 기준으로 정리했다.
- `01.03 Terraform 설치 및 환경 구성` draft와 README를 생성했다.
- `01.03`은 workflow/실습형 문서 패턴으로 작성했으며, 운영체제별 설치 명령 나열보다 Terraform CLI 실행 가능 상태, AWS 인증 준비, 작업 디렉토리 준비를 중심으로 정리했다.
- 이후 사용자 요청에 따라 `01.04 첫 번째 Terraform 프로젝트`는 Chapter 01 범위에서 제거했다.
- 관련 draft, README, Chapter 01 plan, series hierarchy, 연결 문구를 함께 정리했다.
