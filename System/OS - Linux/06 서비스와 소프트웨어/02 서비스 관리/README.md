# 06 서비스와 소프트웨어 / 02 서비스 관리

유닛 파일의 구조를 이해하고, 커스텀 서비스를 직접 등록한다.

## What you will learn

- 유닛 파일 경로: /usr/lib/systemd/system/ (패키지) vs /etc/systemd/system/ (관리자)
- 유닛 파일 구조: [Unit] 의존성, [Service] 실행 방식, [Install] 부팅 연동
- Type: simple, forking, oneshot, notify
- Restart 정책: on-failure, always
- daemon-reload: 유닛 파일 변경을 systemd에 인식
- 커스텀 서비스 등록: 스크립트 작성 → 유닛 파일 → daemon-reload → start → enable

## Reference

- Notion: [Notion document](https://app.notion.com/p/02-379dc703ccda80eab52ac54c398ba0ee?source=copy_link)
