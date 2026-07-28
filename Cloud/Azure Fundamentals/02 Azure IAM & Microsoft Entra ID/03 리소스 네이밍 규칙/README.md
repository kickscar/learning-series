# 02 Azure IAM & Microsoft Entra ID / 03 리소스 네이밍 규칙

리소스에 이름을 붙이는 규칙을 정하고, AWS와 Azure가 같은 계층을 어느 방향으로 읽는지 이해하는 이론 섹션. 이 규칙은 시리즈 전체 실습에 적용된다.

## What you will learn

- 이름 패턴: `rg-{프로젝트}`, `{종류}-{프로젝트}-{정체성}`, **프로젝트는 모든 이름에**, type-first(CAF)
- 하나의 하이라키, 두 방향: AWS(org 앵커, 하강) vs CAF(capability 앵커) — 타입 토큰만 앞으로
- RG는 논리 경계 → 이름이 자기서술(project 남김). 하드/소프트: 테넌트=하드(org 뺌), RG=소프트(project 남김)
- 종류 약어: vnet·snet·nsg·vm·img·pip·st… (AWS 대응 비교)
- 정체성(identity): 대상·유형·속성·위치 4범주, 하나뿐이면 생략

## Reference

- Draft: `.claude/draft/02.03.claude.notion.md`
- Notion: [Notion 문서]()
