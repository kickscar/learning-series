# 01 가상화 개념 / 03 하드웨어 가상화 지원

소프트웨어 가상화의 한계와 CPU 하드웨어 가상화 기술(VT-x, AMD-V, EPT/NPT, VT-d/AMD-Vi)의 동작 원리를 이해하고, VirtualBox가 하드웨어 가상화를 전제 조건으로 요구하는 이유를 파악한다.

## What you will learn

- x86 아키텍처에서 Trap-and-Emulate가 불가능했던 이유
- Binary Translation의 원리와 한계
- Intel VT-x / AMD-V의 VMX root/non-root 모드 동작 원리
- EPT/NPT(메모리 가상화)와 VT-d/AMD-Vi(I/O 가상화)의 역할
- BIOS/UEFI 및 OS에서 하드웨어 가상화 지원을 확인하는 방법

## Reference

- Notion: [Notion document](https://app.notion.com/p/03-375dc703ccda807b84cbe8d3a152d1df?source=copy_link)
