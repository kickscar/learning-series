# 05 프로세스와 시스템 자원 / 01 프로세스

프로세스를 조회하고 상태를 관찰하며, 포어그라운드와 백그라운드를 제어한다. 01.02에서 이론으로 다룬 프로세스를 도구로 직접 들여다본다.

## What you will learn

- PID, PPID, 부모-자식 트리 구조. PID 1 = systemd
- 프로세스 상태: R(Running), S(Sleeping), D(Uninterruptible), T(Stopped), Z(Zombie)
- ps aux (리소스 사용량) vs ps -ef (부모-자식 관계). 출력 컬럼 해석
- top: 실시간 모니터링. htop: 컬러+트리+마우스 (EPEL 설치)
- pstree: 프로세스 트리 표시
- load average: R+D 상태 프로세스 수의 시간 평균. 코어 수 대비 해석. uptime, /proc/loadavg, nproc
- 포어그라운드/백그라운드: &, Ctrl+Z, jobs, fg, bg

## Reference

- Notion: [Notion document](https://app.notion.com/p/01-379dc703ccda80ebbdd9e9c477c69f26?source=copy_link)
