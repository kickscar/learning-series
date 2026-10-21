# 05 빌드 최적화 / 05 [실습] Gallery: 빌드 최적화

앞 장에서 다룬 멀티스테이지 빌드, 실행 사용자, 캐시 마운트를 Gallery의 Dockerfile에 적용한다. 경로와 이름은 빌드 인자로 정리하고 스테이지마다 다시 선언해 사용한다. 앞 Gallery 실습에서 기록한 이미지 크기, 첫 빌드 시간, 소스 수정 후 재빌드 시간, 실행 사용자를 같은 방법으로 다시 측정해 개선 전후를 비교한다.

## What you will learn

- 빌드 스테이지(JDK)와 실행 스테이지(JRE)로 나눈 멀티스테이지 전환, `FROM` 앞의 전역 `ARG` 와 스테이지마다의 재선언, exec 형식 `ENTRYPOINT` 를 위한 실행 파일 이름 `app.jar` 고정
- Spring Boot의 layered jar 추출(`-Djarmode=tools … extract --layers`)과 레이어별 `COPY`, 소스 수정 후 바뀌는 레이어(`98.3kB`)
- 고정 UID · GID `10001` 의 비root 사용자, 작업 디렉터리 소유자 때문에 실패하는 업로드(`500`)와 `uploads` 디렉터리의 소유자 지정
- 의존성 해결 · 애플리케이션 빌드 단계의 캐시 마운트(`/root/.m2`), 의존성 추가 후 의존성 해결 단계 비교(`447.0s` → `3.8s`)
- 앞 실습과의 측정값 대조: 이미지 크기(`512MB` → `174MB`), 첫 빌드 시간, 소스 수정 후 재빌드 시간(`18.1s` → `9.4s`), 실행 사용자(`root` → `gallery`)

## Gallery Project

- Gallery: 빌드 최적화 → 멀티스테이지 · layered jar · 비root 사용자 · 캐시 마운트를 단계별로 적용한 Dockerfile로 `gallery:5.5` 를 빌드하고, 앞 실습(`gallery:4.7`)과 같은 항목을 측정해 대조표를 작성한다

## Source

- `gallery/` → 예제 소스와 이번 실습의 최종 `Dockerfile`(`gallery:5.5`). 애플리케이션 소스와 `.dockerignore` 는 `04 Dockerfile과 이미지 빌드/07 [실습] Gallery - 빌드 컨텍스트 정리와 개선 과제 기록/gallery` 와 같다. 강의용 저장소의 `05/05/gallery` 와 같다

## Reference

- Notion: [Notion 문서]()
