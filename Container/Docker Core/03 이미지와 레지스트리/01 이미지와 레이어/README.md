# 03 이미지와 레지스트리 / 01 이미지와 레이어

이미지를 구성하는 레이어와 컨테이너의 쓰기 레이어를 정리한다. 레이어 이력과 기본 설정을 명령으로 확인하고, 같은 이미지와 같은 베이스를 사용하는 이미지가 레이어를 공유할 때의 디스크 사용량을 확인한다.

## What you will learn

- 레이어의 불변성과 빌드 단계(`ADD`, `COPY`, `RUN`은 레이어, 나머지는 설정)의 관계
- `docker image history` 의 단계와 레이어 수, `<missing>` 표시, `docker image inspect` 의 `RootFS.Layers` 와 `Config`
- 컨테이너 전용 쓰기 레이어, `docker container diff`, 컨테이너 삭제와 함께 사라지는 쓰기 레이어의 수명
- `pull` 출력의 `Already exists` 로 확인하는 베이스 이미지 간 레이어 공유
- `image ls` 의 `DISK USAGE` · `CONTENT SIZE` 와 `system df -v` 의 공유 크기 · 고유 크기, `container ls -s` 의 쓰기 레이어 크기와 `virtual`

## Examples

- `lab01` → 레이어 확인 (공유 레이어 다운로드, 레이어 이력과 설정, 디스크 사용량, 쓰기 레이어와 그 수명)

## Reference

- Notion: [Notion 문서]()
