# 06 서비스와 소프트웨어 / 04 로그와 모니터링

Linux의 로깅 체계를 이해하고 journalctl과 /var/log로 로그를 조회한다.

## What you will learn

- 로깅 체계: journald(바이너리 수집) → rsyslog(/var/log 텍스트 기록)
- journalctl: -u (서비스별), -f (실시간), --since/--until (시간), -p (우선순위), -b (부팅)
- 우선순위: emerg(0)~debug(7). -p err = err 이상
- /var/log 주요 파일: messages(일반), secure(인증), cron, boot.log, dnf.log
- logger: 로그 메시지 생성. journald와 rsyslog 양쪽에 기록

## Reference

- Notion: [Notion document](https://app.notion.com/p/04-379dc703ccda80308ab4e03b8c1135ef?source=copy_link)
