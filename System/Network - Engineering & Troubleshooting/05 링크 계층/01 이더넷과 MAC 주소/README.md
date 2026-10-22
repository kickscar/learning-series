# 05 링크 계층 / 01 이더넷과 MAC 주소

이더넷 프레임 구조, MAC 주소, EtherType, MTU를 다룬다. 이론 전용.

## What you will learn

- 이더넷: IEEE 802.3, LAN 표준
- 프레임 구조: Dst MAC + Src MAC + EtherType + Payload(46~1500) + FCS
- EtherType: 0x0800(IPv4), 0x0806(ARP), 0x86DD(IPv6)
- MAC 주소: 48비트, OUI(제조사) + NIC. VirtualBox = 08:00:27
- 유니캐스트, 브로드캐스트(FF:FF:FF:FF:FF:FF), 멀티캐스트
- MTU 1500 → MSS 1460
- IP 주소(L3, 네트워크 간) vs MAC 주소(L2, 같은 네트워크 내)

## Reference

- Notion: [Notion document]()
