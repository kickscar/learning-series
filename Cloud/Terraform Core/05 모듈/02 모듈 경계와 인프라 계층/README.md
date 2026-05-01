# Ch05 모듈 / 02 모듈 경계와 인프라 계층

모듈화의 경계 기준을 잡고, 3-Layer 모듈(network/platform/workload)을 실무 수준으로 구축한다. 4개의 실습으로 Layer를 하나씩 추가하며, 역방향 금지 + 자유로운 하위 참조 구조를 체험한다. 각 lab은 독립 디렉토리로 해당 시점의 완전한 코드를 갖는다.

## What you will learn

- 모듈화 경계 판단 기준 — 재사용성, 크기, 변경 빈도
- 3-Layer 모듈 구조 — network/platform/workload (Cross-Cloud 중립적)
- 의존 방향 — 역방향 금지, 상위 layer는 하위 layer를 자유롭게 참조
- 모듈 내부 파일 분리 — HashiCorp Style Guide, 파일을 분리해도 인프라는 변하지 않는다
- 설정 스키마의 `(default)` + `(known after apply)` 주석 패턴
- network output의 점진적 확장 (id → id + cidr_block)

## Lab

- **lab01**: network (public) — VPC, IGW, Public Subnet ×2 (AZ-a, AZ-b), RTB. list 타입 variable, index 기반 리소스, computed key output
- **lab02**: network (full) — + NAT GW, EIP, Private Subnet ×2, Private RTBs. subnet_private을 분리하는 이유, 하드코딩 한계와 Ch06 동적 구성 동기
- **lab03**: + platform — ALB + TG + Listener + SG, IAM. optional default 활용, `(default)` 주석 패턴
- **lab04**: network + platform + workload — 3-Layer 완성. EC2 + SG + TG Attachment, network에 cidr_block 추가, 간단 HTTP 서버로 전체 인프라 동작 확인 (24 리소스)

## Reference

- Notion: [Notion 문서](https://www.notion.so/02-345dc703ccda80bfacc6e3f88d244641?source=copy_link)
