# 07 네트워크와 원격 운영 / 01 네트워크 구성

IP 주소, 라우팅, DNS를 조회하고, NetworkManager(nmcli)로 네트워크를 설정하며, 연결을 진단한다.

## What you will learn

- IP 주소와 CIDR 서브넷, 게이트웨이, DNS 기초
- ip addr/route: 네트워크 상태 조회. ip 설정은 일시적
- nmcli: 영구적 네트워크 설정. modify → up으로 적용
- /etc/hosts (로컬 이름 해석), /etc/resolv.conf (DNS 서버)
- ping: 연결 확인. ss -tlnp: 열린 포트와 프로세스 확인 (netstat 대체)

## Reference

- Notion: [Notion document](https://app.notion.com/p/01-379dc703ccda80ff91cfe2d6aca2eeca?source=copy_link)
