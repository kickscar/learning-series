# 02 설치와 초기 설정 / 03 시스템 초기 설정

서버를 받았을 때 가장 먼저 하는 일. 호스트명, 타임존, NTP 동기화, 로캘, 시스템 업데이트를 설정한다.

## What you will learn

- hostnamectl로 호스트명 관리 (Static, Pretty, Transient)
- timedatectl로 타임존 설정과 NTP 동기화 확인
- chrony를 통한 NTP 시간 동기화 (chronyc sources)
- localectl로 로캘 확인 (서버 표준: en_US.UTF-8)
- dnf update로 시스템 업데이트와 커널 업데이트 시 재부팅

## Reference

- Notion: [Notion document](https://app.notion.com/p/03-379dc703ccda808a9ed8d31fe7abd6b5?source=copy_link)
