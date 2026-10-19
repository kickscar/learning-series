# 04 Dockerfile과 이미지 빌드 / 03 [실습] Gallery: 첫 이미지 빌드

시리즈 실습 애플리케이션인 gallery-spring-boot의 이미지를 처음으로 빌드한다. JDK 베이스 이미지에서 애플리케이션을 빌드하는 단일 스테이지 Dockerfile로 이미지를 만들고, 컨테이너를 실행해 이미지 업로드와 인스턴스 식별자를 확인한다.

## What you will learn

- 예제 소스의 구성(Java 21, Maven Wrapper, H2 인메모리 데이터베이스, 로컬 스토리지 `uploads`, 포트 `8080`)과 이미지 구성의 관계
- 컨테이너 안에서 애플리케이션을 빌드하는 단일 스테이지 Dockerfile (`eclipse-temurin:21-jdk`, `./mvnw package`)
- 첫 빌드의 시간 구성(베이스 이미지 다운로드와 Maven 빌드)과 이미지 크기
- 루프백 주소에 게시한 컨테이너 실행, 업로드 파일의 저장 위치(`/app/uploads`)
- 화면 푸터의 인스턴스 식별자와 컨테이너 ID의 일치

## Gallery Project

- Gallery: 첫 이미지 빌드 → 단일 스테이지 Dockerfile로 `gallery:4.3` 을 빌드하고 `gallery-app` 컨테이너로 실행한다. 이후 Gallery 실습은 이 Dockerfile을 단계적으로 고쳐 나간다

## Source

- `gallery/` → 예제 소스와 이번 실습의 `Dockerfile`(`gallery:4.3`). 강의용 저장소의 `04/03/gallery` 와 같다

## Reference

- Notion: [Notion 문서]()
