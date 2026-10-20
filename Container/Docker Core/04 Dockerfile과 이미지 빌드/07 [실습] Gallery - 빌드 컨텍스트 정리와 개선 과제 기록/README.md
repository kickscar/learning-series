# 04 Dockerfile과 이미지 빌드 / 07 [실습] Gallery: 빌드 컨텍스트 정리와 개선 과제 기록

앞 섹션에서 다룬 `.dockerignore` 와 명령 순서를 Gallery의 Dockerfile에 적용한다. 버전 관리 저장소와 빌드 산출물이 있는 개발 중인 작업 디렉터리를 재현해 빌드 컨텍스트에 포함되는 파일을 확인하고, `.dockerignore` 로 제외한다. 이어서 의존성 해결을 소스 복사 앞에 두어 소스를 수정한 뒤의 재빌드 시간을 비교하고, 이미지 `gallery:4.7` 에 남은 문제를 측정값으로 기록한다.

## What you will learn

- `git init` 과 `docker container cp` 로 재현한 개발 중인 작업 디렉터리(`.git`, `target/`)와 빌드 컨텍스트 크기
- `COPY . ./` 가 `.git` 과 `target/` 을 이미지에 복사하는 문제, `.dockerignore` 로 제외한 뒤의 전송량과 이미지의 파일 비교
- 소스 한 줄 수정으로 Maven 빌드 전체가 다시 실행되는 `COPY . ./` 의 캐시 무효화
- 의존성 목록(`pom.xml`)을 먼저 복사하고 `dependency:go-offline` 으로 의존성을 해결하는 명령 순서, 소스 수정 후 재빌드 시간 비교(`90.1s` → `18.1s`)
- 같은 앞 단계 뒤에 갈래로 저장되는 빌드 캐시, 복원한 소스가 첫 빌드의 결과를 재사용하는 동작
- 이미지 크기(`512MB`), 첫 빌드 시간, 재빌드 시간, 실행 사용자(`root`)의 측정 기록

## Gallery Project

- Gallery: 빌드 컨텍스트 정리와 개선 과제 기록 → `.dockerignore` 와 의존성 먼저 복사하는 Dockerfile로 `gallery:4.7` 을 빌드하고, 이미지 크기 · 빌드 시간 · 실행 사용자를 측정해 기록한다

## Source

- `gallery/` → 예제 소스와 이번 실습의 `Dockerfile`(`gallery:4.7`) · `.dockerignore`. 애플리케이션 소스는 `05 [실습] Gallery - 실행 명령과 실행 환경/gallery` 와 같다. 강의용 저장소의 `04/07/gallery` 와 같다

## Reference

- Notion: [Notion 문서]()
