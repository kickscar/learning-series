# 03 Compute - Azure Virtual Machine / 03 VM 디스크와 스토리지 연결

VM에 붙는 세 종류 디스크(OS·임시·데이터)의 차이를 이해하고, 데이터 디스크를 추가해 파티션·포맷·마운트까지 직접 수행하는 섹션. 포털의 "디스크 연결"이 주는 것은 raw 장치뿐이고, 나머지는 OS 몫이라는 경계를 드러낸다.

## What you will learn

- 디스크 3종: OS(영속)·Temporary(`/mnt`, 휘발성)·Data(영속), 임시 디스크 함정
- Managed Disk 유형: Standard HDD/SSD, Premium SSD의 성능·비용 트레이드오프
- 붙인 디스크를 쓰는 4단계: 연결(포털) → 파티션 → 포맷 → 마운트(OS)
- fstab는 장치 이름이 아닌 UUID + nofail로 등록

## Examples

- `lab07` → vm에 disk-data(16GB Standard SSD) 추가, `parted`/`mkfs.ext4`로 준비, `/data` 마운트 및 fstab UUID 등록

## Reference

- Draft: `.claude/draft/03.03.claude.notion.md`
- Notion: [Notion 문서]()
