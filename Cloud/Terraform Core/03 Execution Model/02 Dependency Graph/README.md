# Ch03 Execution Model / 02 Dependency Graph

Terraform이 리소스 간 의존 관계를 DAG(Directed Acyclic Graph)로 표현하고, 이를 기반으로 실행 순서와 병렬성을 결정하는 메커니즘을 다룬다.

## What you will learn

- DAG 개념과 Terraform의 그래프 빌드 과정 (참조 파싱 → 엣지 생성 → 비순환 검증)
- `terraform graph`로 DOT 형식 그래프 출력 및 Graphviz 시각화
- 암묵적 의존성(참조 표현식)과 명시적 의존성(`depends_on`)의 성능 차이
- 독립 리소스의 병렬 실행과 `-parallelism` 옵션
- `-target`의 upstream/downstream 처리 방식과 사용 주의사항

## Lab

- **lab01**: SG + IAM + EC2 구성의 의존 관계 그래프를 `terraform graph`로 출력하고 Graphviz로 시각화. apply 출력에서 병렬 실행 순서 확인

## Reference

- Notion: [Notion 문서](https://www.notion.so/02-Dependency-Graph-343dc703ccda80e99e5ceb05bdde5aca?source=copy_link)
