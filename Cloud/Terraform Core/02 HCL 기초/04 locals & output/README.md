# Ch02 HCL 기초 / locals & output

리소스에 하드코딩된 값을 `locals` 블록으로 구조화하고, 배포 결과를 `output` 블록으로 구조적으로 출력한다.

## What you will learn

- `locals` 블록 구조와 `local.이름` 참조
- locals vs variable 차이 (내부 정의 vs 외부 주입)
- `local.instance`, `local.iamrole` object 패턴으로 리소스 설정 구조화
- 리소스 레이블 `this` 통일 (TF 커뮤니티 관례)
- `output` object 구조화 (flat → 리소스 개념별 그룹핑)
- `terraform output -json | jq` 패턴

## Examples

- `lab01` → 리소스 하드코딩 값을 locals object로 구조화, `this` 레이블 도입, 리소스 원형 주석
- `lab02` → flat output을 리소스 개념별 object로 전환, `-json` + `jq` 체험

## Reference

- Notion: [Notion 문서](https://www.notion.so/04-locals-ouput-355dc703ccda807e94c5f7d388d21706?source=copy_link)
