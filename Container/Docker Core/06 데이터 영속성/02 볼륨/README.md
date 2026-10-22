# 06 데이터 영속성 / 02 볼륨

볼륨을 생성 · 조회 · 삭제하는 명령과 실제 경로, `--mount` 와 `-v` 의 연결 문법, 읽기 전용 연결을 정리한다. 이미지의 `VOLUME` 이 만드는 익명 볼륨의 누적과 정리, 볼륨을 처음 연결할 때의 복사 동작, 임시 컨테이너를 이용한 볼륨 백업과 복원을 다룬다.

## What you will learn

- `docker volume create` · `ls` · `inspect` · `rm` · `prune` 과 `Mountpoint` 의 실제 경로, 사용 중인 볼륨의 삭제 거부
- `docker volume prune` 의 기본 삭제 대상(익명 볼륨)과 `-a` 로 명명된 볼륨까지 삭제하는 경우
- `--mount type=volume` 과 `-v` 의 문법 비교, 연결마다 정하는 읽기 전용(`readonly` · `:ro`)과 여러 컨테이너의 공유
- `VOLUME` 을 선언한 이미지가 실행마다 만드는 익명 볼륨의 누적, 빈 볼륨으로의 복사와 비어 있지 않은 볼륨, `volume-nocopy`
- 임시 컨테이너의 `tar` 를 이용한 볼륨 백업과 복원, 데이터베이스 볼륨의 백업 기준

## Examples

- `lab01` → 볼륨 생성과 공유 (볼륨 생성과 실제 경로, 두 컨테이너의 공유, 읽기 전용 연결, 사용 중인 볼륨의 삭제)
- `lab02` → 익명 볼륨과 복사 동작 (익명 볼륨의 누적, 빈 볼륨의 복사와 `volume-nocopy`, 비어 있지 않은 볼륨, `prune` 정리, 백업과 복원)

## Source

- `lab02-seed/` → lab02에서 작성하는 `Dockerfile`(`VOLUME /data` 와 기본 파일 `/data/app.conf`, `lab02-seed:1.0` 이미지), lab02. 백업 파일 `lab02-vol-copy.tar` 는 실습에서 생성한다

## Reference

- Notion: [Notion 문서]()
