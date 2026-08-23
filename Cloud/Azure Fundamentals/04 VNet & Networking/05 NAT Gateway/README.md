# 04 VNet & Networking / 05 NAT Gateway

앞 "Azure Bastion"에서 **들어가는 길(관리 접속)**은 Bastion으로 냈다. 이 섹션은 격리를 유지한 채 **나가는 길(아웃바운드)**만 연다 — NAT Gateway는 outbound 전용(응답만 통과)이라 인바운드는 여전히 **들어올 길이 없다**. 나가기(NAT GW)와 들어오기(Public IP/LB)가 별개 조각임을 확인한다.

## What you will learn

- NAT Gateway — 아웃바운드 전용 SNAT(밖에서 먼저 오는 연결 차단, 응답만 통과)
- **subnet은 스코프, NAT는 아웃바운드 정책** — subnet 자체는 나가는 길을 모른다. NAT라는 정책 리소스를 붙여야 아웃바운드가 생긴다(앞 NSG=접근제어 정책과 평행)
- 구성 — `ng-lab10` + Public IP(SNAT 64,512포트/IP, Prefix로 확장) + 서브넷 연결(VM 전부 자동)
- 우선순위 — 기본/LB 아웃바운드보다 우선. AWS NAT Gateway와 동일
- 인바운드는 NAT GW가 아니라 Public IP/LB의 몫 — **NG의 PIP는 아웃바운드 SNAT 주소지 인바운드 입구가 아니다**(격리=경로 부재, 막은 게 아니라 길이 없음)

## Examples

- `lab10` → lab09 격리 상태(**사전 준비**: `nsg-lab10-snet`·Public IP 없는 `vm-lab10`·Bastion 접속)에 `ng-lab10`+`pip-lab10-ng`를 붙여 `snet-lab10-priv` 연결, `ping 8.8.8.8` 성공("Azure Bastion" 대비)·VM은 Public IP 없음 = **인바운드 경로 부재** 확인

## Reference

- Draft: `.claude/draft/04.05.claude.notion.md`
- Notion: [Notion 문서]()
