# 08 Docker Compose / 06 [실습] Gallery: Compose 전환

앞 Gallery 실습에서 실행 명령으로 하나씩 기동하던 데이터베이스와 Gallery를 `compose.yaml` 로 전환한다. 헬스체크 기반 기동 순서로 한 번의 `docker compose up` 에 전체를 구성하고, 비밀번호를 `.env` 로 분리하며, 빌드 인자로 지정한 버전을 화면 푸터에 표시한다. 복제본을 확장해 각 복제본을 식별하고, 소스 수정 후의 재빌드와 재적용 동작을 확인한다.

## What you will learn

- 실행 스테이지의 빌드 인자 `version` 과 `ENV APP_RUNTIME_VERSION`, 값을 쓰는 `ENV` 바로 앞에 `ARG` 를 두는 이유(캐시), 화면 푸터의 `Instance` · `Version`
- 실행 명령과 `compose.yaml` 의 대응, `db` 헬스체크(`healthcheck.sh --connect --innodb_initialized`)와 `service_healthy` 로 한 번에 기동하는 구성
- `.env` 의 `${…}` 치환과 작은따옴표로 감싼 특수문자 비밀번호, `.gitignore` · `.dockerignore` 의 `.env` · `compose.yaml` 제외, `docker compose config` 로 확인하는 치환 결과
- 고정 포트로 확장할 때의 포트 충돌(`port is already allocated`)과 포트 범위 게시(`127.0.0.1:8081-8083:8080`), 서비스 이름에 복제본 주소를 모두 응답하는 내장 DNS(`dns-tester` 서비스의 `nslookup`)와 보장되지 않는 요청 분산, `--remove-orphans`
- 소스 수정 후 `up -d` 와 `up -d --build` 의 차이, 선언과 실행 상태를 비교해 바뀐 서비스만 다시 생성하는 재적용, 볼륨에 유지되는 업로드 데이터

## Gallery Project

- Gallery: Compose 전환 → `gallery:8.6` 과 `mariadb:11` 을 `compose.yaml` 로 선언하고 헬스체크 기반 기동 순서, `.env` 비밀번호 분리, 빌드 인자 버전 표시를 적용한다. 이 구성이 1차 Gallery의 최종 구성이며 게시 이미지 `dkrcore/gallery:1.0` 과 같은 구성이다

## Source

- `gallery/` → 이번 실습을 마친 소스. 05.05 Gallery의 소스에 `Dockerfile` 의 버전 인자, `compose.yaml`, `.gitignore` · `.dockerignore` 의 추가 항목을 반영했다. 강의용 저장소의 `08/06/gallery` 와 같다
- `.env` 는 저장소에 포함하지 않는다. 실습 문서의 `DB_ROOT_PASSWORD` · `DB_GALLERY_PASSWORD` 로 `gallery/.env` 를 작성한 뒤 실행한다

디렉터리 이름 `gallery` 가 Compose 프로젝트 이름이 된다.

## Reference

- Notion: [Notion 문서]()
