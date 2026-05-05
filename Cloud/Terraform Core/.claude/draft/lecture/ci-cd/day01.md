# Day 09 (CI/CD Day 1) — Git & IaC 워크플로우

> 시리즈 매핑: Ch09.05 (IaC 워크플로우)
> Git 섹션은 시리즈 외 — 강사 직접 진행

---

## 시간 1: Git 기초 — Configuration, 초기화
- **시리즈**: 시리즈 외 (강사 직접)
- **강의 포인트**: git config, 사용자 설정, 에디터 설정, `git init`
- **전환**: "코드 버전 관리의 기본"

## 시간 2: Snapshot & History
- **시리즈**: 시리즈 외
- **실습**: 원자적 커밋 만들기, 스냅샷 조회, 파일 되살리기(restore), 커밋 되돌리기(reset, revert)
- **강의 포인트**: 원자적 커밋 개념, `git log`, `git restore`, `git reset` vs `git revert` 차이

## 시간 3: Commit Convention & Ignoring Files
- **시리즈**: 시리즈 외
- **실습**: 커밋 히스토리 가공(Amend), 커밋된 파일 추적 중지
- **강의 포인트**: 커밋 메시지 컨벤션, `.gitignore` 패턴. Terraform에서 `.terraform/`, `*.tfstate` 무시 — Day 1~8 경험과 연결

## 시간 4: Branch & Merge + Conflict
- **시리즈**: 시리즈 외
- **실습**: 브랜치 생성 및 병합, 병합 충돌 해결하기
- **강의 포인트**: feature branch 전략, merge 종류(fast-forward, 3-way), 충돌 해결. "이 branch 전략이 CI/CD 파이프라인의 기반"

## 시간 5: Remote Repository & Pull Request
- **시리즈**: 시리즈 외
- **실습**: GitHub Authentication, main 브랜치 Push, GitHub Pull Request
- **강의 포인트**: push/pull, PR 생성·리뷰·merge. "PR이 인프라 변경의 시작점이 된다"
- **전환**: "Git 완료. 이제 PR에서 Terraform이 자동으로 돌아가게 하자"

## 시간 6: IaC 워크플로우 — 수동 apply의 위험, GitOps
- **시리즈**: Ch09.05 (이론)
- **강의 포인트**: 수동 `terraform apply`의 위험 — 누가 언제 뭘 apply했는지 추적 불가. plan → review → approve → apply 흐름. GitOps 개념: "Git이 진실의 원천". Day 1~8에서 수동으로 했던 것을 자동화하는 이유.
- **전환**: "GitHub Actions로 구현하자"

## 시간 7: GitHub Actions 기초 + OIDC 인증
- **시리즈**: Ch09.05 (lab01)
- **실습**: Hello World workflow 작성, AWS OIDC Provider 연동
- **강의 포인트**: workflow YAML 구조(trigger, job, step). secrets, environment. OIDC = IAM Role 기반 인증 (access key 없이). "CI에서 AWS에 안전하게 접근하는 방법"
- **라이브 데모**: push → Actions 탭에서 workflow 실행 확인

## 시간 8: PR → plan → comment 자동화
- **시리즈**: Ch09.05 (lab01~02)
- **실습**: PR 생성 시 자동 plan, plan output → PR comment
- **과제**: PR 기반 plan 자동화 완성
- **강의 포인트**: `terraform plan` CI step. plan 결과를 PR comment에 자동 게시 — 리뷰어가 "이 PR이 인프라에 어떤 변화를 주는지" 바로 확인. plan artifact 저장(`-out`).
- **마무리**: "PR에서 plan이 자동으로 돌아간다. 내일 품질 게이트를 추가한다"
