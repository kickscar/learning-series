# Day 10 (CI/CD Day 2) — 파이프라인 구축 & 품질 자동화

> 시리즈 매핑: Ch09.05 (lab02) + Ch09.06

---

## 시간 1: merge → apply 자동화
- **시리즈**: Ch09.05 (lab02)
- **실습**: plan artifact 저장, main merge 시 자동 apply
- **강의 포인트**: plan 파일(`-out=tfplan`) artifact 업로드 → apply job에서 다운로드. `terraform apply tfplan` — 승인 불필요. branch 전략: feature → PR(plan) → review → merge(apply).
- **라이브 데모**: PR merge → Actions에서 apply 자동 실행 확인

## 시간 2: apply 결과 확인 + 워크플로우 정리
- **강의 포인트**: apply 후 output 확인. 실패 시 rollback 전략(코드 revert → PR → plan → apply). Day 9에서 만든 PR→plan + 여기서 merge→apply = **기본 파이프라인 완성**.
- **전환**: "파이프라인은 됐다. 이제 품질 게이트를 추가하자"

## 시간 3: 코드 품질 게이트 — fmt + validate + tflint in CI
- **시리즈**: Ch09.06 (이론 전반)
- **강의 포인트**: Day 8(Ch09 Sec01)에서 로컬로 실행했던 fmt/validate/tflint를 CI에서 자동화. `terraform fmt -check` — 포맷 안 맞으면 CI 실패. `terraform validate`. tflint. "merge 전에 자동으로 걸러진다"
- **전환**: "로컬에서도 자동으로 하고 싶다면"

## 시간 4: pre-commit hooks
- **시리즈**: Ch09.06 (lab01 일부)
- **실습**: pre-commit + terraform fmt/validate 설정
- **강의 포인트**: pre-commit framework 설치. `.pre-commit-config.yaml` 작성. commit 전에 fmt/validate 자동 실행. "CI에서 걸리기 전에 로컬에서 먼저 잡는다"
- **라이브 데모**: 포맷 깨진 코드 commit 시도 → pre-commit이 차단

## 시간 5: tfsec — 보안 스캐닝 자동화
- **시리즈**: Ch09.06 (lab01)
- **실습**: tfsec CI step 추가, 보안 이슈 감지
- **강의 포인트**: tfsec = Terraform 전용 보안 스캐너. SG에 0.0.0.0/0 ingress → 경고. S3 퍼블릭 액세스 → 경고. CI에서 자동 실행 → PR에 결과 리포트.
- **라이브 데모**: 의도적으로 보안 취약한 SG 코드 push → tfsec 경고 확인

## 시간 6: 통합 파이프라인 조립
- **시리즈**: Ch09.06 (lab01~02)
- **실습**: fmt → validate → tfsec → plan → comment 전체 조립
- **강의 포인트**: 여러 step을 하나의 workflow로 조합. step 순서와 실패 시 중단. "하나라도 실패하면 plan까지 도달하지 않는다"
- **라이브 데모**: 전체 파이프라인이 순차 실행되는 것 확인

## 시간 7: branch protection + required checks
- **시리즈**: Ch09.06 (lab02)
- **실습**: branch protection 설정, required checks
- **강의 포인트**: GitHub branch protection rules. required status checks — 품질 게이트 통과 필수. "merge 버튼이 비활성화된다". approve label 자동 부여(선택).
- **라이브 데모**: 품질 게이트 실패한 PR → merge 버튼 비활성 확인

## 시간 8: 파이프라인 정리
- **과제**: 품질 게이트 통과해야 merge 가능한 파이프라인 완성
- **강의 포인트**: 지금까지 만든 것 정리:

```
PR 생성
  ├── fmt check
  ├── validate
  ├── tfsec
  └── terraform plan → PR comment
  ▼
코드 리뷰 + 품질 게이트 통과
  ▼
main merge → terraform apply
```

- **마무리**: "단일 환경 파이프라인 완성. 내일 dev/prod 멀티 환경으로 확장한다"
