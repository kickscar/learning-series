# 03 가상 네트워크 / 02 토폴로지 설계

Internal Network로 공개/사설 서브넷을 설계하고, Router VM으로 서브넷 간 통신과 외부 접속을 구성하여 멀티 서브넷 토폴로지를 완성한다. 이 시리즈의 마무리 실습이다.

## What you will learn

- 공개/사설 서브넷 분리 설계와 주소 계획
- Router VM의 역할 (IP Forwarding, NAT MASQUERADE, 기본 게이트웨이)
- Rocky Linux 9의 firewalld로 NAT MASQUERADE 구성 (inter-zone policy 포함)
- 서브넷 간 통신과 외부 접속을 traceroute로 경로 확인

## Examples

- `lab01` → router-vm + web-vm + db-vm으로 멀티 서브넷 토폴로지 구축

## Reference

- Notion: [Notion document](https://app.notion.com/p/02-37fdc703ccda8037b86afb6543169050?source=copy_link)
