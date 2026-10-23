# 08 Docker Compose / 03 의존성과 기동 순서

서비스 사이의 기동 순서를 Compose 파일에 선언한다. 컨테이너가 시작된 것과 서비스가 준비된 것의 차이를 정리하고, `depends_on` 의 단축형과 확장형, 서비스의 헬스체크, 서비스 기동 전에 실행하는 준비 단계(`pre_start`)와 생명주기 훅, 기동 순서 보장의 한계를 다룬다.

## What you will learn

- 컨테이너 시작과 서비스 준비 상태의 차이, 단축형 `depends_on` 이 보장하는 시작 · 정지 순서
- 확장형 `depends_on` 의 `condition`(`service_started` · `service_healthy` · `service_completed_successfully`)과 `restart` · `required`
- 서비스 `healthcheck` 필드와 `HEALTHCHECK` 옵션의 대응, `start_period` · `start_interval`, 단독 실행과 Compose에서의 헬스체크 결과 사용
- `pre_start` 준비 단계(일회성 컨테이너, 실패하면 서비스를 시작하지 않음)와 `post_start` · `pre_stop` 훅
- 실패한 컨테이너를 같은 컨테이너로 다시 시작하는 재시작 정책과 기동 순서 보장의 한계

## Examples

- `lab01` → 단축형의 한계 확인 (한 번에 기동한 Gallery의 접속 실패, `restart: on-failure` 로 재시작 후 기동)
- `lab02` → 헬스체크 기반 기동 (헬스체크 상태 변화, `service_healthy` 로 실패 없는 기동, `pre_start` 실패와 원인 확인, 업로드 볼륨 소유자 준비)

## Source

- `lab01/` → lab01 마지막 단계의 `compose.yaml`(단축형 `depends_on` + `restart: on-failure`), lab01
- `lab02/` → lab02 마지막 단계의 `compose.yaml`(`healthcheck`, `service_healthy`, `pre_start`), lab02

디렉터리 이름 `lab01` · `lab02` 가 Compose 프로젝트 이름이 된다.

## Reference

- Notion: [Notion 문서]()
