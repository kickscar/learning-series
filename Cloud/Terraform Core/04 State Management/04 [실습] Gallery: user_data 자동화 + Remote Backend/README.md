# Ch04 State Management / [실습] Gallery: user_data 자동화 + Remote Backend

Ch02 Gallery의 수동 설치를 `user_data` + `templatefile` + `systemd`로 자동화하고, S3 Remote Backend로 State를 관리한다.

## What you will learn

- `user_data` + `templatefile`로 JDK 설치, 소스 빌드, systemd 서비스 등록 자동화
- 처음부터 S3 Remote Backend 시작 — 04.03 lab01에서 생성한 tfstate 버킷 활용
- `local.org` / `local.project` / `local.namespace` 패턴과 `Organization` / `Project` 태그 분리
- `templatefile`의 `$$` 이스케이프와 변수 주입 패턴
- user_data 디버깅: cloud-init 로그 확인

## Reference

- Notion: [Notion 문서](https://www.notion.so/04-Gallery-Remote-Backend-343dc703ccda8028a076e571201bc832?source=copy_link)
