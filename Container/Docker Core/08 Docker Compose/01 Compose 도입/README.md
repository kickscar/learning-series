# 08 Docker Compose / 01 Compose 도입

앞 장의 Gallery 실습에서 네트워크 생성과 긴 실행 명령으로 구성한 Gallery와 데이터베이스를 파일 하나에 선언하는 Docker Compose를 도입한다. 수동 실행의 한계를 정리하고, Compose 파일의 형식과 현재 기준, 프로젝트 이름과 리소스 이름, 자동으로 생성되는 네트워크, 기동과 정리 명령을 다룬다.

## What you will learn

- 실행 명령으로 관리하는 구성의 한계(반복 입력, 전달, 기록)와 선언으로의 전환
- Compose Specification과 기본 파일 이름(`compose.yaml`), 사용하지 않는 `version` 속성의 경고, Compose 버전 번호
- 프로젝트 이름의 결정 순서(`-p`, `COMPOSE_PROJECT_NAME`, `name`, 디렉터리 이름)와 리소스 이름(`{프로젝트}-{서비스}-{번호}`, `{프로젝트}_default`, `{프로젝트}_{볼륨}`)
- 자동 생성 네트워크와 서비스 이름을 이용한 접속, 프로젝트 이름별로 독립된 리소스 집합
- `up -d`, `ps`, `exec`, `ls`, `down`, `down -v` 와 `down` 후에도 남는 볼륨

## Examples

- `lab01` → 첫 Compose 파일 (앞 장 실행 명령의 `compose.yaml` 전환, 서비스별 기동과 상태 · 접속 확인, 자동 생성 리소스와 서비스 이름 해석, `version` 경고, 프로젝트별 리소스, `down` 과 재기동)

## Source

- `lab01/` → lab01에서 작성하는 `compose.yaml`(서비스 `db` · `app`, 볼륨 `vol-db` · `vol-uploads`), lab01. 디렉터리 이름 `lab01` 이 프로젝트 이름이 된다

## Reference

- Notion: [Notion 문서]()
