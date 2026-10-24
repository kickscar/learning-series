# 01 클러스터의 구성 요소 / 04 [부록] 클라우드 VM 실습 환경

호스트에서 VirtualBox를 쓸 수 없는 경우를 위한 대체 경로로, AWS EC2에 로컬 VM과 같은 노드 이름과 사설 IP(`192.168.56.10` ~ `.12`)를 가진 노드 3대를 AWS CLI 스크립트로 만든다. 다음 장부터의 본문을 그대로 쓸 수 있도록, 클라우드 VM에서 달라지는 지점을 함께 정리한다.

## What you will learn

- 전용 VPC · 퍼블릭 서브넷 · 보안 그룹 · 키 페어 · Rocky Linux 9 인스턴스 3대의 구성과 사설 IP 고정
- `{Organization}-{Project}-{capability}-{identity}` 자원 네이밍과 `Name` · `Organization` · `Project` 태그, 태그를 조건으로 한 자원 조회
- 로컬 VM과의 차이(단일 인터페이스 `eth0`, swap · firewalld 없음, 공인 IP 변경, LoadBalancer 대신 NodePort 확인)
- worker → `cp` 정지, `cp` → worker 기동 순서와 생성의 역순 삭제, 비용과 정리

## Source

- `aws/create-cluster.sh` → VPC부터 인스턴스 3대까지 자원 생성, 노드별 사설 · 공인 IP 표 출력
- `aws/stop-cluster.sh` → worker 노드를 먼저, `cp` 를 마지막에 정지
- `aws/start-cluster.sh` → `cp` 를 먼저, worker 노드를 나중에 기동하고 새 공인 IP 표 출력
- `aws/delete-cluster.sh` → `Organization=k8s-core` · `Project=cluster` 태그 자원을 생성의 역순으로 삭제, 키 페어와 로컬 개인 키 삭제

학습자 호스트의 `~/k8s-core/aws/` 에서 실행한다. AWS CLI v2와 자격 증명, 리전(`ap-northeast-2`) 설정이 필요하다.

## Reference

- Notion: [Notion 문서]()
