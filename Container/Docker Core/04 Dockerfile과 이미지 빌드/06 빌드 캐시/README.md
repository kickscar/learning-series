# 04 Dockerfile과 이미지 빌드 / 06 빌드 캐시

빌드 출력의 `CACHED` 표시가 나오는 기준을 다룬다. 명령별로 캐시를 판정하는 기준과 연쇄 무효화를 확인하고, 명령의 배치와 `.dockerignore` 로 다시 빌드하는 시간을 줄이는 방법을 정리한다.

## What you will learn

- 빌드 캐시의 재사용과 명령별 판정 기준(`RUN` 의 명령 문자열, `COPY` · `ADD` 의 체크섬, 수정 시각 제외)
- 연쇄 무효화와 변경 빈도 기준의 명령 정렬, 의존성 설치와 소스 복사의 순서
- 캐시 버스팅과 `&&` 결합, 인자 정렬과 버전 고정
- `.dockerignore` 의 두 가지 효과(전송량 감소, 캐시 무효화 범위 축소), 작성 규칙과 제외 대상
- `--no-cache` 빌드와 `docker builder prune` 을 이용한 빌드 캐시 정리

## Examples

- `lab01` → 캐시 판정 확인 (변경 없는 재빌드, `RUN` 명령의 변경, 파일 내용의 변경, 수정 시각의 변경)
- `lab02` → 순서와 `.dockerignore` (두 구성의 재빌드 시간 비교, `.dockerignore` 유무에 따른 전송량과 이미지의 파일, 캐시 무시와 정리)

## Source

- `lab01-cache/` → lab01에서 작성하는 `Dockerfile`(`lab01-cache`)과 `message.txt`. 1단계의 상태이고, 2단계에서 `RUN date` 의 형식을, 3단계에서 `message.txt` 의 내용을 바꾼다, lab01
- `lab02-order-ignore/` → lab02에서 작성하는 `Dockerfile.src.first`(`lab02-src-first`) · `Dockerfile.deps.first`(`lab02-deps-first`), `packages.txt`, `src/run.sh`, `.dockerignore`. `.dockerignore` 는 4단계에서 작성하므로 3단계까지는 이 파일을 빼고 진행한다. `src/logs/app.log` 와 `src/.env` 는 3단계의 명령으로 생성한다, lab02

## Reference

- Notion: [Notion 문서]()
