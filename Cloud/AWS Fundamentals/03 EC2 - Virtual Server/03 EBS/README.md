# 03 EC2 - Virtual Server / 03 EBS

EBS(Elastic Block Store)의 개념을 정리하고, EC2 Instance에 추가 Volume을 Attach한 뒤 OS에서 포맷/마운트하여 실제로 사용할 수 있는 디스크로 만드는 흐름, Snapshot으로 백업 지점을 만들고 복원하는 흐름, AMI로 빌드/실행 환경을 이미지화해 재배포하는 흐름을 실습한다.

## What you will learn

- EBS(블록 스토리지)와 Instance Store의 영속성 차이
- EBS Volume의 AZ 제약과 EC2 Attach 조건
- 주요 Volume Type(gp3, io2, st1, sc1)과 선택 감각
- Attach 후 OS 단계(디바이스 확인, 포맷, 마운트)의 의미
- Snapshot의 역할(백업/복구/복제)과 기본 운영 관점

## Examples

- `lab07` → EBS Volume 생성, EC2 Attach, 포맷/마운트, 쓰기/읽기 검증
- `lab08` → Snapshot 생성, Snapshot에서 Volume 생성, Attach 후 복원 데이터 검증
- `lab09` → Java/Git/Maven 설치 후 Custom AMI 생성(스냅샷) 및 재배포 검증 (Gallery 실행 환경)

## Reference

- Draft: `.cursor/draft/03.03.notion.cursor.md`
- Notion: [Notion 문서]()
