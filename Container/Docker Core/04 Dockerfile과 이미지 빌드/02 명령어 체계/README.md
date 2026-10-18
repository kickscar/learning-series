# 04 Dockerfile과 이미지 빌드 / 02 명령어 체계

Dockerfile의 명령을 범위와 효과에 따라 정리한다. 이름이 비슷하거나 동작을 오해하기 쉬운 `COPY` 와 `ADD`, `ENV` 와 `ARG`, `EXPOSE` 와 포트 게시를 구분하고, 작업 디렉터리와 사용자, 볼륨, 헬스체크, 레이블과 정지 시그널을 지정하는 명령을 다룬다.

## What you will learn

- 레이어를 생성하는 명령과 이미지의 설정으로 기록되는 명령의 구분, 명령의 적용 범위
- `COPY` 와 `ADD` 의 tar 처리 차이와 두 명령의 선택 기준
- `ENV` 와 `ARG` 의 값이 남는 범위, `FROM` 앞 `ARG` 의 제약, 빌드 인자로 전달한 비밀값이 빌드 이력에 남는 문제
- `WORKDIR` 의 상대 경로 누적과 `USER`, `EXPOSE` 와 `-p` · `-P` 포트 게시, `VOLUME` 의 익명 볼륨
- `HEALTHCHECK` 의 옵션과 상태 표시(`starting` · `healthy` · `unhealthy`), `LABEL` 과 `STOPSIGNAL`

## Examples

- `lab01` → 명령어 동작 확인 (`COPY` 와 `ADD` 의 tar 처리, `ENV` 와 `ARG` 의 범위, 비밀값 노출, `FROM` 앞의 `ARG`, `WORKDIR` 의 누적과 `USER`)
- `lab02` → `EXPOSE` 와 `HEALTHCHECK` (포트 게시 없이 실행, `-p` 와 `-P` 의 게시 주소, 헬스체크 상태, 비정상 상태의 컨테이너)

## Source

- `lab01-instructions/` → lab01에서 작성하는 `Dockerfile.copy`(`lab01-copy`) · `Dockerfile.env`(`lab01-env`) · `Dockerfile.secret`(`lab01-secret`) · `Dockerfile.fromarg`(`lab01-fromarg`) · `Dockerfile.workdir`(`lab01-workdir`)와 `hello.txt`. `files.tar` 는 lab01 1단계의 `tar -cf files.tar hello.txt` 로 생성한다, lab01
- `lab02-web/` → lab02에서 작성하는 `Dockerfile`(`nginx:1.30` + `HEALTHCHECK`, `lab02-web` 이미지), lab02

## Reference

- Notion: [Notion 문서]()
