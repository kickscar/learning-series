# Ch02 HCL 기초 / 05 locals & data source

`locals`로 variable과 data source 조회 결과를 구조화하고, resource가 locals만 참조하는 흐름을 만든다.

## What you will learn

- `locals` 블록 구조와 `local.이름` 참조, `locals` vs `variable` 선택 기준
- `variable → local(구조화) → resource` 흐름 — resource는 variable을 직접 참조하지 않는다
- `local.instance` object로 설정값을 의미 있는 구조로 재조립
- `data` source 개념: Read-Only 조회, plan 시 값 확정
- data source 조회 결과를 locals에 통합 — 출처가 달라도 resource는 locals만 본다

## Lab

- **lab01**: `local.instance` object로 variable 구조화, namespace 단일 출처, `-var` 환경 변경 실험
- **lab02**: data source(AMI, VPC, Subnet, IAM Policy) 조회 결과를 `local.instance`에 통합, 하드코딩 제거

## Reference

- Notion: [Notion 문서](https://www.notion.so/05-locals-data-source-33ddc703ccda8056a4f3e8bda417494d?source=copy_link)
