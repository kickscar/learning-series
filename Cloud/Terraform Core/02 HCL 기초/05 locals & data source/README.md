# Ch02 HCL 기초 / 05 locals & data source

`locals`로 코드 내부 반복을 제거하고, `data` source로 기존 인프라 정보를 동적으로 조회한다.

## What you will learn

- `locals` 블록 구조와 `local.이름` 참조 방식
- `locals` vs `variable` 선택 기준 (내부 계산 vs 외부 입력)
- 공통 태그 중앙화, 변수 조합 등 주요 활용 패턴
- `data` source 개념: Read-Only 조회, plan 시 값 확정
- `aws_ami` / `aws_vpc` / `aws_availability_zones` data source 활용

## Examples

- `lab01` → `locals`로 project, environment, common_tags 정의 → SG + EC2에서 참조 → `environment` 변경 시 plan 변경 범위 확인
- `lab02` → `aws_ami` data source로 최신 Amazon Linux 2023 AMI 동적 조회 → EC2 `ami` 인수에 참조 → plan 출력에서 조회 결과 확인

## Reference

- Notion: [Notion 문서](https://www.notion.so/05-locals-data-source-33ddc703ccda8056a4f3e8bda417494d?source=copy_link)
