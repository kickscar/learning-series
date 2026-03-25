# AWS Fundamentals ↔ Workloads

## Series location

- `Learning Series/Cloud/AWS Fundamentals`
- 시리즈 `AGENTS.md`, `.cursor/plans/`, `README.md` 에서 Gallery 로드맵 정의.

## Workload connections

| Workload | Relationship | Summary |
|----------|--------------|---------|
| **gallery-spring-boot** | **primary** | 시리즈 **Series Project: Gallery** 의 단일 Spring Boot 구현체. Ch03(EC2)·Ch06(S3)·Ch07(RDS)·Ch08(ECS) 및 Ch04·Ch05 인프라 전환 Lab과 **설정·배포 환경**으로 대응. |

## Pedagogical labels ↔ implementation

시리즈 문서의 이름은 **Lab·단계 라벨**이다. 구현은 **하나의 애플리케이션**에서 프로파일·`app.storage`·datasource 등으로 맞춘다.

| Document label | Typical focus | Workload hook |
|----------------|---------------|----------------|
| Gallery-Static | EC2에 최초 배포, 정적 자원·기본 동작 | 로컬 스토리지, H2, `dev` |
| Gallery - Custom VPC | 동일 앱, VPC 이전 | 앱 변경 거의 없음 |
| Gallery - ALB | Private subnet, ALB | 헬스·리스너·타깃만 맞춤 |
| Gallery-S3 | 파일 업로드 → S3 | `app.storage.type=s3` |
| Gallery-Full | RDS + S3 | JDBC → RDS, S3 유지 |
| Gallery-Docker | 컨테이너·ECS | 이미지·Task 정의 |

## References

- [../workloads/gallery-spring-boot.md](../workloads/gallery-spring-boot.md)
- [../matrix.md](../matrix.md)
