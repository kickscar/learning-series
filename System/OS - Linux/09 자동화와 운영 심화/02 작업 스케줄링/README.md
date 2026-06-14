# 09 자동화와 운영 심화 / 02 작업 스케줄링

cron으로 주기적 작업을, at으로 일회성 작업을 예약한다. systemd timer는 인식 수준.

## What you will learn

- cron: crontab -e/-l/-r, cron 표현식 (분 시 일 월 요일), cron 환경
- 시스템 cron: /etc/crontab, /etc/cron.daily/, anacron
- at: 일회성 예약 (at, atq, atrm)
- systemd timer: .timer unit, OnCalendar, list-timers (인식)

## Reference

- Notion: [Notion document](https://app.notion.com/p/02-379dc703ccda800f986fd5944b34e43d?source=copy_link)
