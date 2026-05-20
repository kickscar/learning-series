# Ch05 동적 구성 / 02 for expression & dynamic 블록

값을 변환하는 `for` expression과 블록을 동적으로 생성하는 `dynamic` 블록을 다룬다. Custom VPC에 Security Group을 추가하면서 둘의 조합을 체험한다.

## What you will learn

- `for` expression: list/map 변환, `if` 필터, locals에서 데이터 전처리
- `dynamic` 블록: 중첩 블록(ingress) 반복 생성, `content`, `iterator`
- `for_each` + `dynamic` 조합으로 복수 SG를 Layer별로 분리 생성
- 이중 `for` expression으로 설정 변경에 동적으로 대응하는 output

## Lab

- **lab01**: for expression(map→list + if 필터) + dynamic ingress — 단일 SG, 동적 output
- **lab02**: for_each + merge + dynamic — 복수 SG (platform/workload Layer별 분리), 이중 for output

## Reference

- [Notion](https://www.notion.so/02-for-expression-dynamic-344dc703ccda80a1a07eebe0ac26c577?source=copy_link)
