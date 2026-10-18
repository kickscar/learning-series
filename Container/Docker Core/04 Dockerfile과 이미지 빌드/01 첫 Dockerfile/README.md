# 04 Dockerfile과 이미지 빌드 / 01 첫 Dockerfile

Dockerfile을 작성해 이미지를 직접 빌드한다. 최소 Dockerfile의 구성과 syntax 지시문, 빌드 명령과 이미지 이름을 정리하고, 빌드 컨텍스트가 전송되는 범위와 빌드 출력에서 단계와 실패 위치를 확인하는 방법을 다룬다.

## What you will learn

- 최소 Dockerfile의 구성(`FROM` · `COPY` · `RUN` · `CMD`)과 `# syntax=docker/dockerfile:1` 지시문
- `docker image build` 와 BuildKit, `-t` 를 생략한 빌드의 이름 없는 이미지(`<untagged>`)와 빌드 출처 정보에 따른 이미지 ID
- 빌드 컨텍스트의 범위, 명령이 사용하는 파일만 전송하는 BuildKit과 `COPY .` 의 전송량
- 빌드 출력의 단계 표시(`[1/3]`, `CACHED`)와 `history` 에서 확인하는 명령과 레이어의 대응
- 빌드 컨텍스트 밖 파일 참조와 명령 실패의 출력(`ERROR` 단계, Dockerfile 행 번호, 실패 원인)

## Examples

- `lab01` → 첫 이미지 빌드 (이름 없는 빌드와 이름을 지정한 빌드, 명령과 레이어, 빌드 컨텍스트의 전송량, 빌드 실패의 위치)

## Source

- `lab01-app/` → lab01에서 작성하는 `Dockerfile` · `message.txt`(`lab01-app` 이미지)와 `Dockerfile.all`(`lab01-all`) · `Dockerfile.outside` · `Dockerfile.fail`, lab01

## Reference

- Notion: [Notion 문서]()
