# 05 빌드 최적화 / 03 BuildKit 마운트

`RUN` 이 실행되는 동안에만 파일과 디렉터리를 연결하는 BuildKit 마운트를 다룬다. 캐시 마운트로 패키지 다운로드를 재사용하고, 시크릿 마운트로 비밀값을 이미지에 남기지 않고 전달하는 방법을 정리한다.

## What you will learn

- `RUN --mount` 와 마운트 타입 다섯 가지(`cache`, `secret`, `bind`, `tmpfs`, `ssh`)
- 캐시 마운트로 패키지 관리자의 다운로드를 재사용하는 동작과 이미지 크기의 차이
- 캐시 마운트의 보관(빌더 저장소, 자동 삭제, `--no-cache` 빌드, 확인 · 삭제 명령)
- 시크릿 마운트(`--secret`, `/run/secrets/{id}`)와 빌드 인자로 전달한 비밀값의 차이
- 시크릿과 캐시 판정, 값을 바꿀 때 함께 바꾸는 빌드 인자(`SECRET_VERSION`)

## Examples

- `lab01` → 캐시 마운트 (마운트 없는 빌드와 캐시 마운트 빌드의 이미지 크기, 의존성 추가 후 재빌드의 다운로드, 캐시 마운트 확인과 `--no-cache` 빌드)
- `lab02` → 빌드 시크릿 (빌드 인자와 시크릿 마운트의 빌드 이력 비교, 시크릿 값 변경과 `SECRET_VERSION`)

## Source

- `lab01-cache-mount/` → lab01에서 작성하는 `requirements.txt`, `app.py`, `Dockerfile.plain`(`lab01-plain`), `Dockerfile.cache`(`lab01-cache`), lab01
- `lab02-secret/` → lab02에서 작성하는 `Dockerfile.arg`(`lab02-arg`), `Dockerfile.secret`(`lab02-secret`), lab02. 비밀값 파일 `api-token.txt` 는 실습에서 생성한다

## Reference

- Notion: [Notion 문서]()
