# 07 네트워크와 원격 운영 / 03 콘솔, 터미널, 원격 접속

Console, Terminal, Terminal Emulator, PTY의 차이를 이해하고, SSH 원격 접속 환경을 구축한다. 이후 모든 실습은 SSH로 진행한다.

## What you will learn

- Console, Dumb Terminal(VT100), Terminal Emulator, PTY(/dev/pts/*)의 구분
- UNIX가 처음부터 멀티유저 터미널을 위해 설계된 역사적 맥락
- SSH의 탄생(1995, Ylönen)과 OpenSSH(OpenBSD 유산)
- SSH 비밀번호 인증과 키 기반 인증(Ed25519)의 차이
- sshd 설정 (/etc/ssh/sshd_config, 드롭인 디렉토리)
- 비밀번호 인증 비활성화 (클라우드 환경 대비)
- scp, sftp를 통한 파일 전송

## Reference

- Notion: [Notion document](https://app.notion.com/p/03-379dc703ccda80b5ae86ee9991990995?source=copy_link)
