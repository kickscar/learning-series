# 08 Docker Compose / 02 서비스 정의

서비스에 선언하는 속성을 정리한다. 앞 장들에서 다룬 `docker container run` 의 옵션이 Compose에서 어떤 속성으로 쓰이는지 한 곳에 모으고, 이미지와 빌드, 환경 변수와 YAML 값의 변환, 포트와 볼륨의 단축 문법과 확장 문법, 실행 제어, 리소스 제한, 복제본 확장을 막는 속성을 다룬다.

## What you will learn

- `docker container run` 옵션과 서비스 속성의 대응(`image` · `build`, `environment` · `env_file`, `ports` · `expose`, `volumes`, `networks`, `command` · `entrypoint` · `restart` · `init` · `user` · `working_dir`, `deploy.resources`, `container_name`)
- `build.target` 으로 고르는 스테이지와 `image` 유무에 따른 빌드 이미지 이름(`{프로젝트}-{서비스}` / 지정한 이름)
- `environment` 와 `env_file` 의 우선순위, 따옴표 없는 값이 바뀌는 YAML 값의 변환(`1.10` → `1.1`)
- 포트 · 볼륨의 단축 문법과 확장 문법(`--mount` 대응), 최상위 `volumes` 선언
- `--scale` 복제본 확장과 `container_name` 의 제약, `deploy.resources.limits` 의 메모리 · CPU 상한

## Examples

- `lab01` → 서비스 속성 적용 (단일 컨테이너 실행과 Compose 전환, 빌드 이미지 이름과 `target`, 환경 변수 우선순위, `init: true`, YAML 값의 변환, 최상위 `volumes` 누락 오류)
- `lab02` → 확장과 제약 (복제본 3개 확장, `container_name` 지정 시 확장 거부, 메모리 · CPU 상한 적용)

## Source

- `lab01/` → lab01에서 작성하는 `Dockerfile`(스테이지 `base` · `dev` · `prod`), `print-env.sh`, `app.env`, `compose.yaml`(마지막 단계의 상태), lab01
- `lab02/` → lab02 마지막 단계의 `compose.yaml`(리소스 상한), lab02

디렉터리 이름 `lab01` · `lab02` 가 Compose 프로젝트 이름이 된다.

## Reference

- Notion: [Notion 문서]()
