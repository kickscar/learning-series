# 05 빌드 최적화 / 01 멀티스테이지 빌드

빌드와 실행을 스테이지로 나누는 멀티스테이지 빌드를 다룬다. 스테이지의 정의와 참조, 빌드 대상의 지정, 실행 스테이지의 사용자 구성, Dockerfile 명령의 배치 순서를 정리한다.

## What you will learn

- 단일 스테이지 이미지에 남는 빌드 도구와 소스, 멀티스테이지 빌드에서 `COPY --from` 으로 옮기는 산출물
- 스테이지 이름(`AS`)과 `COPY --from` 의 세 대상(스테이지 이름, 스테이지 번호, 외부 이미지)
- `--target` 과 대상이 의존하는 스테이지만 빌드하는 동작, 개발 · 테스트 · 운영 스테이지 구성
- 실행 스테이지의 비root 사용자(숫자 UID/GID `10001`, `USER`)와 쓰기 디렉터리 소유권
- Dockerfile 명령의 배치 순서(묶음 순서, `ARG` · `ENV` 위치와 예외)

## Examples

- `lab01` → 단일 스테이지와 멀티스테이지 비교 (이미지 크기와 레이어, 빌드 도구와 소스의 포함 여부, 실행 사용자와 쓰기 디렉터리)
- `lab02` → `--target` 과 스테이지 참조 (대상을 지정하지 않은 빌드, 중간 스테이지까지의 빌드, 테스트 스테이지 빌드, 외부 이미지에서의 복사)

## Source

- `lab01-single-multi/` → lab01에서 작성하는 `main.go`, `Dockerfile.single`(`lab01-single`), `Dockerfile.multi`(`lab01-multi`), lab01
- `lab02-target/` → lab02에서 작성하는 `main.go`, `Dockerfile`(`lab02-app`), `Dockerfile.external`(`lab02-external`), lab02

## Reference

- Notion: [Notion 문서]()
