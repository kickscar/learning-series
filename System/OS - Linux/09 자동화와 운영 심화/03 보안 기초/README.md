# 09 자동화와 운영 심화 / 03 보안 기초

SELinux(MAC)의 개념과 기본 보안 점검 체크리스트. 인식 수준.

## What you will learn

- DAC vs MAC: 소유자 기반 접근 제어 vs 커널 강제 정책
- SELinux: Enforcing/Permissive/Disabled 모드, targeted 정책
- 모드 확인·전환: getenforce, setenforce, /etc/selinux/config
- SELinux 컨텍스트: user:role:type:level, ls -Z, ps -Z
- 기본 보안 점검 체크리스트: SSH, 방화벽, 서비스, 패치, 패스워드

## Reference

- Notion: [Notion document](https://app.notion.com/p/03-379dc703ccda8005b625c3b8d6fd7d6d?source=copy_link)
