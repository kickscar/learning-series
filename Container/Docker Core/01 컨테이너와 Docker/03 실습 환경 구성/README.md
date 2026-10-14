# 01 컨테이너와 Docker / 03 실습 환경 구성

운영체제별 실습 환경의 기준을 정하고 Docker를 설치한다. 설치 후 권한, 이미지 저장소, Docker Hub 요청 제한을 확인하고 첫 컨테이너를 실행한다.

## What you will learn

- 운영체제별 실습 환경 기준(Linux와 WSL 2는 Ubuntu + Docker Engine, macOS는 Docker Desktop)
- Docker 공식 저장소를 이용한 Docker Engine 설치와 `docker` 그룹 설정
- 이미지 저장소 방식(containerd image store 또는 overlay2) 확인
- Docker Hub 로그인과 요청 제한
- 첫 컨테이너 실행과 정리

## Examples

이 섹션의 실습은 CLI 명령으로만 진행하므로 예제 파일이 없다.

- `lab01` → Docker 설치 (Windows WSL 2 준비, Ubuntu Docker Engine, macOS Docker Desktop)
- `lab02` → 설치 확인과 환경 점검 (`docker version`, 이미지 저장소, Docker Hub 로그인)
- `lab03` → 첫 컨테이너 실행 (`hello-world`, Nginx 포트 게시, 자원 정리)

## Reference

- Notion: [Notion 문서]()
