# 01 컨테이너와 Docker / 02 Docker 플랫폼의 구성

Docker가 무엇이고 어떤 구성 요소로 동작하는지 설명한다. Linux의 Docker Engine을 기준으로 Engine · CLI · 레지스트리의 역할과 관계를 정리하고, Docker Desktop이 여기에 무엇을 더한 구성인지 다룬다.

## What you will learn

- 컨테이너 기술의 구현체이자 빌드 · 실행 · 관리 도구, 플랫폼으로서의 Docker
- Docker Engine · Docker CLI · 레지스트리의 역할과 동작 흐름
- Engine 내부 구성(`dockerd` · BuildKit · containerd · runc)과 소켓 접근 권한
- Docker Desktop의 구성과 운영체제별 차이, context로 정하는 CLI의 연결 대상

## Reference

- Notion: [Notion 문서]()
