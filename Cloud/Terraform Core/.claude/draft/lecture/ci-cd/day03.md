# Day 11 (CI/CD Day 3) — 멀티 환경 배포 & 운영

> 시리즈 매핑: Ch09.07

---

## 시간 1: 멀티 환경 배포 전략
- **시리즈**: Ch09.07 (이론)
- **강의 포인트**: Day 7(Ch07)에서 dev/prod 환경을 분리했다. 여기서는 그 환경을 CI/CD로 자동 배포한다. 환경별 tfvars, 디렉토리 분리 — Ch07 패턴 그대로. GitHub Environments 개념 소개.
- **전환**: "GitHub Environments로 구현하자"

## 시간 2: Lab — GitHub Environments + approval 설정
- **시리즈**: Ch09.07 (lab01)
- **실습**: GitHub Environments 설정 (dev, prod), prod에 manual approval
- **강의 포인트**: Environment = 배포 대상 + 보호 규칙. dev: 자동 승인, prod: required reviewer. Environment secrets로 환경별 AWS credentials 분리.
- **라이브 데모**: Repository Settings → Environments → prod protection rules

## 시간 3: Lab — dev 자동 apply → prod manual approve → apply
- **시리즈**: Ch09.07 (lab01)
- **실습**: 멀티 환경 순차 배포 워크플로우
- **강의 포인트**: workflow에서 `environment:` 지정. dev job → 자동 apply. prod job → approval 대기 → 승인 후 apply. "dev에서 먼저 검증하고 prod에 적용"
- **라이브 데모**: PR merge → dev apply 자동 → prod 대기 → GitHub에서 approve → prod apply

## 시간 4: State 잠금 & 동시성
- **시리즈**: Ch09.07 (lab02 일부)
- **실습**: 동시 PR에서 lock 충돌 재현 + 해결
- **강의 포인트**: S3 native locking(`use_lockfile`)이 CI에서도 동작. 두 PR이 동시에 apply 시도 → 409 ConflictionalRequestConflict. 해결: job 순차 실행(`concurrency` 설정) 또는 재시도.
- **라이브 데모**: 두 브라우저에서 동시에 PR merge → lock 충돌 에러 확인

## 시간 5: Drift 감지 — 정기 plan
- **시리즈**: Ch09.07 (lab02)
- **실습**: cron schedule workflow — 정기 plan 실행
- **강의 포인트**: Day 3(Ch04)에서 drift 개념을 배웠다. 여기서 자동 감지한다. `schedule: cron: '0 9 * * 1-5'` — 평일 매일 plan. drift 발견 시 GitHub Issue 자동 생성 또는 Slack 알림. "콘솔에서 누가 뭘 바꿨는지 자동으로 감지"
- **라이브 데모**: AWS 콘솔에서 SG 규칙 수동 변경 → 다음 plan에서 drift 감지 확인

## 시간 6: 운영 패턴 정리
- **강의 포인트**: 지금까지 만든 전체 파이프라인 리뷰:

```
PR 생성
  ├── fmt check
  ├── validate
  ├── tfsec
  └── terraform plan → PR comment
  ▼
코드 리뷰 + 품질 게이트 통과
  ▼
main merge
  ├── dev: 자동 apply
  └── prod: manual approve → apply
  ▼
정기 drift 감지 (cron → plan → 알림)
```

Terraform Cloud/HCP 소개 (관리형 대안). Terragrunt 소개 (DRY 패턴). "이 도구들은 우리가 만든 것을 더 편하게 해주는 것 — 본질은 같다"

## 시간 7: 모듈 버전 관리 & Registry 활용
- **강의 포인트**: 로컬 모듈 → Private Registry 게시. 모듈 버전 태깅. 팀 간 모듈 공유. "Day 6에서 만든 network 모듈을 다른 팀도 쓰고 싶다면?" Public Registry 모듈 활용 복습 (Ch06.05).
- **전환**: "전체 과정 마무리"

## 시간 8: 전체 리뷰 & 마무리
- **과제**: 최종 파이프라인 제출
- **강의 포인트**: 11일 전체 여정 리뷰:

| Day | 핵심 |
|-----|------|
| Day 1~2 | HCL 문법, 첫 배포 |
| Day 3 | State 관리 |
| Day 4~5 | Custom VPC 동적 구성 |
| Day 6 | 모듈화 + 3-tier |
| Day 7 | 환경 분리 |
| Day 8 | 코드 품질 |
| Day 9~11 | CI/CD 파이프라인 |

"Terraform으로 인프라를 코드로 설계하고, 팀에서 안전하게 배포하는 법까지 완성했다."

향후 학습 로드맵: Architecture & Design, Azure/GCP IaC, Kubernetes IaC.
