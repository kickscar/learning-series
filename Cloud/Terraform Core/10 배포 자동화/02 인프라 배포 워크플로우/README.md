# Ch10 배포 자동화 / 02 인프라 배포 워크플로우

09.05의 Review + Deploy 워크플로우에 AWS OIDC 인증을 추가하고, 실제 인프라(VPC)를 배포한다. PR comment에 plan 결과를 게시하고, merge 시 concurrency 제어와 함께 apply를 실행한다.

## What you will learn

- AWS OIDC 인증: 임시 자격 증명으로 CI에서 AWS 접근 (장기 Key 불필요)
- OIDC Provider + IAM Role을 Terraform으로 생성 (시리즈 패턴 적용)
- PR comment에 plan 결과 게시 (`hashicorp/setup-terraform` wrapper + `actions/github-script`)
- concurrency group으로 동시 apply 방지
- 09.05의 워크플로우 구조에 step을 추가하는 확장 패턴

## Examples

- `lab01` → OIDC 인프라 생성 + `09.06.review.yml` (OIDC + plan + PR comment)
- `lab02` → `09.06.deploy.yml` (OIDC + apply + concurrency), lab01 PR merge로 인프라 자동 배포

## Reference

- Notion: [Notion 문서](https://www.notion.so/06-357dc703ccda80ea8e36efb039500e7e?source=copy_link)
