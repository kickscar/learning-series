# 06 서비스와 소프트웨어 / 01 부팅과 systemd

부팅 과정(UEFI→GRUB→커널→systemd)을 이해하고, systemctl로 서비스를 제어한다.

## What you will learn

- 부팅 5단계: UEFI Firmware → GRUB 2 → Linux 커널 → initramfs → systemd(PID 1)
- systemd의 역할: 서비스 관리, 의존성 해결, 병렬 시작, 로그 수집
- systemd 타깃: multi-user.target(서버 기본), graphical.target, rescue.target
- systemctl 서브커맨드: start, stop, restart, reload, enable, disable, status
- enable ≠ start: enable은 부팅 연동, start는 현재 실행
- systemctl status 출력 해석: Loaded(enabled/disabled), Active(running/dead/failed)

## Reference

- Notion: [Notion document](https://app.notion.com/p/01-systemd-379dc703ccda80a393f5d609ae6d0f2d?source=copy_link)
