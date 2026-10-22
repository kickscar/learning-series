# 07 네트워크 / 04 [실습] Gallery: 네트워크

앞 Gallery 실습에서 컨테이너를 교체할 때 소실되던 메타데이터를 MariaDB 컨테이너로 분리한다. 이미지를 다시 빌드하지 않고 `gallery:5.5` 를 실행할 때 `-e` 로 데이터소스를 지정하고, 사용자 정의 네트워크에서 Gallery가 데이터베이스에 컨테이너 이름으로 접속하게 구성한다.

## What you will learn

- 이미지의 `ENV` 기본값(H2 인메모리 데이터소스)과 `-e` 로 바꾸는 데이터소스(`SPRING_DATASOURCE_URL` · `USERNAME` · `PASSWORD`), 이미지 재빌드가 필요 없는 이유
- 기본 bridge에서 데이터베이스 이름을 찾지 못해 시작에 실패하는 Gallery(`UnknownHostException`)와 사용자 정의 네트워크 `gallery-net` 의 이름 기반 데이터소스
- `MARIADB_*` 환경 변수로 초기화되는 데이터베이스 · 계정과 접속 확인, 특수문자 비밀번호의 작은따옴표 처리, 기존 볼륨에서는 환경 변수가 적용되지 않는 동작
- 데이터베이스 포트 비게시와 루프백 게시, `docker container inspect` 에 평문으로 보이는 비밀번호
- 두 컨테이너를 교체한 뒤 유지되는 메타데이터(`gallery-vol-db`)와 업로드 파일(`gallery-vol-uploads`), 수동 구성의 실행 명령과 사람이 지키는 실행 순서

## Gallery Project

- Gallery: 네트워크 → `gallery:5.5` 와 `mariadb:11` 을 사용자 정의 네트워크에 연결하고, 데이터베이스는 게시하지 않으며 Gallery는 루프백에만 게시한다. Dockerfile과 이미지는 앞 실습과 같다

## Reference

- Notion: [Notion 문서]()
