# 04 Dockerfile과 이미지 빌드 / 05 [실습] Gallery: 실행 명령과 실행 환경

앞에서 빌드한 Gallery 이미지가 정지 시그널을 받았을 때 어떻게 종료되는지 확인한다. exec 형식과 셸 형식의 주 프로세스, 정지 시간, 종료 코드를 비교한 뒤, 실행 명령을 exec 형식 `ENTRYPOINT` 로 정하고 실행 환경의 기본값을 `ENV` 로 지정한 이미지를 빌드한다.

## What you will learn

- 베이스 이미지의 엔트리포인트 스크립트(`/__cacert_entrypoint.sh`)가 `exec "$@"` 로 `CMD` 를 실행하는 구성
- exec 형식(PID 1 `java`, 1초 이내, 종료 코드 `143`)과 셸 형식(PID 1 `sh -c`, 약 10초, 종료 코드 `137`)의 정지 비교
- exec 형식 `ENTRYPOINT` 로 실행 명령 고정, 베이스 이미지 `CMD` 초기화
- `JAVA_TOOL_OPTIONS` 와 애플리케이션 설정(`SPRING_*`, `APP_STORAGE_*`)의 기본값을 `ENV` 로 지정, 비밀번호는 이미지에 넣지 않음
- `docker image inspect` 로 확인하는 이미지의 설정 계약, 실행할 때 `-e` 로 바꾸는 실행 환경

## Gallery Project

- Gallery: 실행 명령과 실행 환경 → exec 형식 `ENTRYPOINT` 와 `ENV` 기본값으로 `gallery:4.5` 를 빌드하고 `gallery-app` 컨테이너로 실행한다. `-e` 로 JVM 옵션과 실행 프로필을 바꿔 다시 실행한다

## Source

- `gallery/` → 예제 소스와 이번 실습의 `Dockerfile`(`gallery:4.5`). 애플리케이션 소스는 `03 [실습] Gallery - 첫 이미지 빌드/gallery` 와 같다. 강의용 저장소의 `04/05/gallery` 와 같다

## Reference

- Notion: [Notion 문서]()
