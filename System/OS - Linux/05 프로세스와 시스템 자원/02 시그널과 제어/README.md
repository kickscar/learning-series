# 05 프로세스와 시스템 자원 / 02 시그널과 제어

프로세스에 시그널을 보내 종료·제어하고, 우선순위를 조절하며, SSH 종료 후에도 프로세스를 유지하는 방법을 다룬다.

## What you will learn

- 시그널: SIGTERM(15), SIGKILL(9), SIGHUP(1), SIGINT(2), SIGTSTP(20)
- kill (PID), killall (이름), pkill (패턴)로 시그널 전송
- nice 값: -20~19 범위, nice로 시작 시 지정, renice로 실행 중 변경
- nohup: SIGHUP 무시, SSH 끊김 후 프로세스 유지, nohup.out

## Reference

- Notion: [Notion document](https://app.notion.com/p/02-379dc703ccda8062be77d655d82a55dd?source=copy_link)
