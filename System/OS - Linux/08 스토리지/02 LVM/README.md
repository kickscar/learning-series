# 08 스토리지 / 02 LVM

LVM의 PV → VG → LV 계층 구조를 이해하고, 볼륨을 생성·확장한다. 인식 수준.

## What you will learn

- LVM vs Standard Partition: 동적 확장, 다중 디스크 통합
- PV(Physical Volume), VG(Volume Group), LV(Logical Volume), PE(Physical Extent)
- pvcreate → vgcreate → lvcreate 생성 순서
- lvextend -r: LV와 파일시스템 동시 확장 (온라인, 무중단)
- pvs, vgs, lvs: LVM 상태 조회

## Reference

- Notion: [Notion document](https://app.notion.com/p/02-LVM-379dc703ccda808c963dcb5708a64bf7?source=copy_link)
