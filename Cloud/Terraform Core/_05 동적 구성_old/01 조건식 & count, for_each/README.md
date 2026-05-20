# Ch05 동적 구성 / 01 조건식 & count, for_each

조건식으로 값을 분기하고, `count`와 `for_each`로 리소스를 반복 생성한다. Custom VPC를 점진적으로 구축하면서 각 패턴을 체험한다.

## What you will learn

- 조건식 `condition ? true_val : false_val`과 `count = condition ? 1 : 0` 조건부 리소스 생성
- `count`: 정수 기반 반복, `count.index`, 인덱스 기반 리소스 주소
- `for_each`: map/set 기반 반복, `each.key`/`each.value`, 키 기반 리소스 주소
- count vs for_each 선택 기준 — NAT Gateway를 두 방식으로 구현해 비교

## Lab

- **lab01**: Custom VPC 기반 생성 (VPC + IGW) — Ch05 전체 base infrastructure
- **lab02**: count 정수 반복으로 EIP 복수 생성, count.index 활용
- **lab03**: count 조건부 생성으로 NAT Gateway (plan only — 서브넷 미생성)
- **lab04**: for_each map으로 Subnet ×4 + Route Table 생성, 키 기반 접근
- **lab05**: for_each set으로 NAT Gateway 재구현, lab03과 비교

## Reference

- [Nortion 문서](https://www.notion.so/01-count-for_each-344dc703ccda806e9f0bcfbfa2ada1b0?source=copy_link)
