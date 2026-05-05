# Ch02 HCL 기초 / variable & data source

`variable`로 외부 입력을 받고, `data source`로 기존 인프라를 조회한다. 둘 다 locals로 흡수되어 `var → local → resource` 흐름을 완성한다.

## What you will learn

- locals vs variable 역할 차이 (내부 정의 vs 외부 주입)
- `variable` 블록 구조: `type`, `default`, `description`
- 타입 제약: `string`, `number`, `list(string)`, `map(string)`, `object`
- `validation` 블록으로 변수의 허용 값 제한
- `-var` 플래그로 variable 재정의, SG 규칙 변경 체험
- `data source` 개념: 읽기 전용 조회, plan 시점 값 확정
- variable/data source → locals 통합 패턴
- 어떤 값을 variable로 추출하고, 어떤 값을 data source로 대체하는가

## Examples

- `lab01` → locals 하드코딩을 variable로 추출, `-var`로 CIDR/port 변경 → SG in-place update, 외부 접속 차단/허용/포트 불일치 체험
- `lab02` → variable validation (contains, 범위 검사), 잘못된 값 차단 재현
- `lab03` → data source(AMI, VPC, Subnet, IAM) 조회 결과를 locals object에 통합, 하드코딩 제거

## Reference

- Notion: [Notion 문서](https://www.notion.so/05-variable-data-source-355dc703ccda804eb936c6fdc6211ba3?source=copy_link)
