# 02 하이퍼바이저와 가상 머신 / 03 가상 스토리지

가상 디스크의 원리, 포맷(VDI/VMDK/VHD), 할당 방식(동적/고정), 컨트롤러(SATA/NVMe/IDE)를 이해하고, VM에 디스크를 추가하여 관리한다.

## What you will learn

- 가상 디스크가 호스트 파일 시스템의 파일 하나로 존재한다는 것
- VDI, VMDK, VHD 포맷의 차이와 변환 방법
- 동적 할당과 고정 할당의 원리와 성능 차이
- SATA, NVMe, IDE 컨트롤러의 역할
- VBoxManage로 디스크 정보 확인, 크기 조정, 포맷 변환

## Examples

- `lab01` → VM에 추가 디스크 연결, 디스크 정보 확인, 크기 조정

## Reference

- Notion: [Notion document](https://app.notion.com/p/03-375dc703ccda806e94e4f3c2ac6aff5e?source=copy_link)
