# Ch07 환경 분리 / 03 디렉토리 기반 환경 분리

환경별 디렉토리(`envs/dev/`, `envs/prod/`)를 독립된 root module로 구성하고, 공유 모듈 호출 + `terraform.tfvars`로 환경별 값을 주입하는 방식을 실습한다.

## What you will learn

- 디렉토리 기반 분리: 각 환경이 독립된 root module — `init`, State 모두 독립
- 공유 모듈 상대경로 참조 (`../../modules/`)
- `terraform.tfvars` 디렉토리별 자동 로드 — `-var-file` 불필요
- Backend 분리: 환경별 `key` 하드코딩
- "얇은 환경 디렉토리" 원칙 — 모듈 호출 + 변수 주입만 담당
- 단점은 코드 이중화 — 공유 모듈(Ch05)로 최소화

## Examples

- `lab01` → 디렉토리 기반 dev/prod 환경 구성, 공유 모듈 호출, State 독립 확인

## Reference

- Notion: [Notion 문서](https://www.notion.so/03-34edc703ccda804ebf5ec597e4a65257?source=copy_link)
