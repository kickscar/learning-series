# 09 자동화와 운영 심화 / 04 부팅과 트러블슈팅

GRUB 2에서 커널 매개변수를 편집하고, systemd 타깃을 변경하고, root 비밀번호를 복구한다. 인식 수준.

## What you will learn

- GRUB 2: /etc/default/grub, grub2-mkconfig, 메뉴 편집 (e, Ctrl+X)
- systemd 타깃: rescue.target, emergency.target (root 비밀번호 필요)
- root 비밀번호 복구: rd.break, mount remount, chroot, passwd, autorelabel
- SELinux 재라벨링: touch /.autorelabel의 이유 (09.03 연계)

## Lab

- lab01: root 비밀번호 복구 (GRUB → rd.break → passwd → autorelabel)

## Reference

- Notion: [Notion document](https://app.notion.com/p/04-379dc703ccda80fab53ac5c67d271aa0?source=copy_link)
