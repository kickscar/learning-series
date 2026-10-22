# 06 데이터 영속성 / 04 [실습] Gallery: 데이터 영속성

앞 Gallery 실습의 `gallery:5.5` 를 다시 빌드하지 않고 그대로 실행하면서 업로드 경로에 볼륨을 연결한다. 볼륨에서도 업로드 디렉터리의 소유권이 유지되는 이유와 소유권이 맞지 않는 볼륨에서 업로드가 실패하는 경우를 확인하고, 볼륨으로 보존되지 않는 메타데이터의 한계를 확인한다.

## What you will learn

- 이미지 설정(`APP_STORAGE_LOCAL_PATH=uploads`, `WORKDIR /gallery`)으로 확인하는 업로드 경로 `/gallery/uploads` 와 볼륨 없이 교체할 때의 업로드 파일 소실
- 명명된 볼륨 `gallery-vol-uploads` 의 연결과 컨테이너 교체 후 업로드 파일 유지
- 빈 볼륨에 복사되는 업로드 디렉터리의 소유자(`10001`)와 `volume-nocopy` · `root` 가 기록한 볼륨에서의 업로드 실패(`500`, `Permission denied`), 임시 컨테이너의 `chown` 을 이용한 해결
- 파일은 남아도 H2 인메모리 데이터베이스의 메타데이터는 소실되는 한계
- 이미지를 다시 빌드하지 않는 이유: 데이터를 어디에 둘지는 실행할 때 `--mount` 로 정하고, 이미지에 `VOLUME` 을 선언하지 않는다

## Gallery Project

- Gallery: 데이터 영속성 → `gallery:5.5` 의 업로드 경로에 명명된 볼륨을 연결해 컨테이너 교체 후에도 업로드 파일을 유지한다. Dockerfile과 이미지는 앞 실습과 같다

## Reference

- Notion: [Notion 문서]()
