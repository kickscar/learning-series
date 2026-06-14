# 08 스토리지 / 01 디스크와 파티션

디스크를 추가하고, 파티션 → 파일시스템 → 마운트 → 영구 등록까지 수행한다. 01.04에서 이론으로 다룬 체인을 직접 실행한다.

## What you will learn

- 블록 디바이스 이름 규칙: /dev/sda, /dev/nvme0n1, 파티션 번호
- MBR vs GPT: 파티션 수, 디스크 크기 제한, UEFI 연관
- lsblk: 블록 디바이스 조회. blkid: UUID 확인
- df -hT: 파일시스템 사용량. du -sh: 디렉토리 사용량
- fdisk: 파티션 생성 (GPT). mkfs.xfs / mkfs.ext4: 파일시스템 생성
- mount / umount: 마운트. /etc/fstab: UUID로 영구 마운트

## Reference

- Notion: [Notion document](https://app.notion.com/p/01-379dc703ccda8003a2dfd58bdb138974?source=copy_link)
