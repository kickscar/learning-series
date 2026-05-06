# Ch10 배포 자동화 / 04 멀티 환경 배포 & 운영

Ch07 디렉토리 기반 환경 분리를 CI/CD에 연결하고, GitHub Environments로 prod 배포에 수동 승인 게이트를 추가한다. Monitor 워크플로우로 drift를 정기 감지하고 GitHub Issue로 알린다.

## What you will learn

- Ch07 디렉토리 기반 환경 분리를 `working-directory`로 CI에 연결
- `needs:` 의존성으로 dev → prod 순차 배포
- GitHub Environments + Required reviewers로 prod 수동 승인
- `terraform plan -detailed-exitcode` (exit code 2)로 drift 감지
- Scheduled workflow(cron) + GitHub Issue 자동 생성
- Concurrency group + S3 lockfile 이중 보호

## Examples

- `lab01` → `09.08.deploy.yml`: dev 자동 → prod 승인 → apply. GitHub Environments 설정
- `lab02` → `09.08.monitor.yml`: cron drift detection, 수동 drift 유발 → Issue 생성 확인

## Reference

- Notion: [Notion 문서]()
