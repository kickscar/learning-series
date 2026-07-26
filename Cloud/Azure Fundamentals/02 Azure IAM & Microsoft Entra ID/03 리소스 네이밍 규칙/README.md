# 02 Azure IAM & Microsoft Entra ID / 03 리소스 네이밍 규칙

리소스에 이름을 붙이는 규칙을 정하고, Azure 이름이 왜 AWS보다 가벼운지를 계정 구조에서 이해하는 이론 섹션. 이 규칙은 시리즈 전체 실습에 적용된다.

## What you will learn

- 이름 패턴: `rg-{프로젝트}`, `{종류}-{정체성}`, 프로젝트는 이름에 안 넣음(RG가 담음), type-first(CAF)
- 종류 약어: vnet·snet·nsg·vm·pip·st… (AWS 대응 비교)
- 왜 Azure 이름이 가벼운가: 테넌트(조직)·RG(프로젝트)가 조직화를 흡수, 이름엔 종류·정체성만
- 정체성(identity): 대상·유형·속성·위치 4범주로 구분, 하나뿐이면 생략

## Reference

- Draft: `.claude/draft/02.03.claude.notion.md`
- Notion: [Notion 문서]()
