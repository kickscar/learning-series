# NCP 리소스 네이밍 — Fundamentals (콘솔)

> NCP는 AWS를 모델로 한 플랫폼이라 네이밍도 **AWS Fundamentals(`aws-fund-naming.md`)를 기준**으로 이식한다. capability 약어 3개(`acg`/`nacl`/`lc`)만 NCP 실제 서비스명으로 다르고 나머지는 AWS와 동일하다.

---

## 1. 패턴

```
{org}-{project}-{capability}-{identity}
```

| 세그먼트 | 값 | 설명 |
|---------|-----|------|
| `org` | **`ncp-fund`** | 시리즈명 (실무의 organization/team/product에 대응) |
| `project` | **`lab{NN}`** 또는 **`gallery`** | 실습 단위. Section Lab은 `lab01`…, 횡단 프로젝트는 `gallery` |
| `capability` | `vpc`, `acg`, `server`… | 리소스 종류 약어 (§2) |
| `identity` | `server`, `private-a`, `web`… | 리소스 정체성 (§3). 하나뿐이면 생략 |

예: `ncp-fund-lab07-acg-server`, `ncp-fund-gallery-vpc`, `ncp-fund-lab06-subnet-private-a`

---

## 2. Capability 약어 — AWS ↔ NCP

**원칙: 축약하지 않는다.** NCP 콘솔의 실제 서비스명을 기준으로 하고, 관례적 약어만 인정한다.

### 네트워크
| Full Name (NCP) | Capability | AWS 대응 |
|-----------------|-----------|----------|
| VPC | `vpc` | `vpc` (동일) |
| Subnet | `subnet` | `subnet` (동일) |
| **Access Control Group** | **`acg`** | `sg` (Security Group) |
| **Network ACL** | **`nacl`** | `nacl` (동일) |
| NAT Gateway | `natgw` | `natgw` (동일) |
| Route Table | `rtb` | `rtb` (동일) |

> ACG는 서버(NIC) 레벨 방화벽, Network ACL은 서브넷 레벨 방화벽이다. AWS의 SG/NACL 이중 구조와 같다.
> Internet Gateway는 NCP VPC에서 Internet Gateway 전용 리소스로 명시 생성하지 않는다(라우팅으로 처리). 필요 시 draft에서 콘솔 기준 확인.

### 컴퓨팅 / 로드밸런싱
| Full Name (NCP) | Capability | AWS 대응 |
|-----------------|-----------|----------|
| Server | `server` | `instance` (EC2) |
| Block Storage | `bs` | (EBS) |
| Load Balancer | `lb` | `alb` |
| Target Group | `tg` | `tg` (동일) |
| Auto Scaling Group | `asg` | `asg` (동일) |
| **Launch Configuration** | **`lc`** | `lt` (Launch Template) |

> Load Balancer는 생성 시 타입(Application/Network/Network Proxy)을 고른다. 이 시리즈는 Application(L7) 중심이라 `lb` 하나로 쓰고, 타입 구분이 필요하면 identity로 표기한다.

### 데이터 / 스토리지 / 계정
| Full Name (NCP) | Capability | AWS 대응 |
|-----------------|-----------|----------|
| Object Storage (Bucket) | `bucket` | `s3bucket` (전역 고유, §5) |
| Cloud DB for MySQL | `clouddb` | `rds` |
| Container Registry | `registry` | (ECR, 전역 고유 확인, §5) |
| Sub Account | `subaccount` | (IAM User) |
| Role | `role` | `iamrole` |

---

## 3. identity — 범주 · 조합 · 생략

`{identity}`는 리소스의 정체성을 드러내는 키워드다. 네 범주를 조합한다(AWS 이식).

| 범주 | 설명 | 예시 |
|------|------|------|
| Target | 이 리소스가 보호/연결하는 대상 | `server`, `lb` |
| Type | 리소스의 성격/종류 | `private`, `public`, `bastion` |
| Attr | 리소스의 특성/용도 | `web`, `was`, `minimal` |
| Loc | 위치(Zone 등) | `a`, `b` |

### 조합

| 리소스 | 이름 | identity |
|--------|------|----------|
| Server 보호 ACG | `ncp-fund-lab07-acg-server` | 대상 capability (Target) |
| ACG (속성 추가) | `ncp-fund-lab07-acg-server-minimal` | Target + Attr |
| Private Subnet (Zone a) | `ncp-fund-lab06-subnet-private-a` | Type + Loc |
| Bastion Server | `ncp-fund-lab10-server-bastion` | Type |
| Web용 Server | `ncp-fund-gallery-server-web` | Attr |

### 생략

해당 capability가 **하나뿐이면 identity를 생략**한다. 여러 개면 `-`로 조합한다.

| 상황 | 이름 |
|------|------|
| VPC는 실습당 하나 | `ncp-fund-lab06-vpc` |
| NAT Gateway는 VPC당 하나 | `ncp-fund-lab11-natgw` |
| Private Subnet 2개 (Zone 분리) | `ncp-fund-lab06-subnet-private-a`, `…-private-b` |

---

## 4. 하위 구성(sub-config) — 부모에 담김

Target Group의 Health Check, Auto Scaling의 정책 등 부모 리소스에 속한 설정은 별도 풀네임을 붙이지 않고 부모 이름 아래에서 관리한다(콘솔이 부모 컨텍스트로 보여줌). 필요 시 풀네임: `ncp-fund-lab12-tg-health-check`.

---

## 5. 전역 고유 (bucket / registry)

Object Storage Bucket과 Container Registry는 이름이 **전역에서 고유**해야 한다(S3 호환 Bucket은 URL 호스트, Registry도 전역 네임스페이스). 교육자료라 문서에 이름을 그대로 쓰면 전 세계 학습자가 충돌하므로, **`{uniq}` 토큰을 항상 표기**한다(azure-fund에서 정립한 규칙 이식).

- **`{uniq}`**: 각자 채우는 전역 유일 값(짧은 org 코드, 이니셜, 랜덤). 학습자는 문서의 `{uniq}`를 자기 값으로 바꾼다.
- 문자 제약: Bucket 이름은 소문자·숫자·하이픈(S3 호환 규칙). 세부 길이는 draft 착수 시 콘솔 확인.

| 리소스 | 문서 표기 | 예(학습자 치환) |
|--------|-----------|-----------------|
| Object Storage Bucket | `ncp-fund-gallery-bucket-{uniq}` | `ncp-fund-gallery-bucket-abc` |
| Container Registry | `ncp-fund-gallery-registry-{uniq}` | `ncp-fund-gallery-registry-abc` |

> ⚠️ Bucket/Registry의 정확한 문자·길이 제약과 전역고유 범위는 각 챕터(Ch06 Object Storage, Ch09 Container) draft 착수 시 NCP 콘솔로 확정한다. 위는 이식 초안이다.

---

## 6. SSH 키 (로컬 아티팩트)

Server 접속 키 페어는 로컬 파일이라 시리즈 네임스페이스로 관리한다: `key-lab04`, `key-gallery`. NCP 콘솔의 인증키 이름도 동일 규칙을 쓴다.

---

## 7. 태그 (콘솔 수동)

콘솔에서 수동으로 다는 태그는 `project`, `env`(실습은 생략 가능), `owner` 정도로 최소화한다. 자동 태깅(IaC)은 이 시리즈 범위 밖.

---

## 8. 예시

```
ncp-fund-lab06-vpc                       VPC (실습당 하나)
├── ncp-fund-lab06-subnet-public-a       Public Subnet (Zone a)
├── ncp-fund-lab06-subnet-private-a      Private Subnet (Zone a)
├── ncp-fund-lab07-acg-server            서버 보호 ACG
├── ncp-fund-lab08-nacl-private          Private Subnet NACL
├── ncp-fund-lab10-server-bastion        Bastion Server (Public)
├── ncp-fund-lab11-natgw                 NAT Gateway
├── ncp-fund-gallery-server-web          Web Server
├── ncp-fund-gallery-lb                  Application Load Balancer
├── ncp-fund-gallery-asg                 Auto Scaling Group
├── ncp-fund-gallery-bucket-{uniq}       Object Storage (전역 고유)
└── ncp-fund-gallery-clouddb             Cloud DB for MySQL
```

---

## 9. AWS ↔ NCP 대응 (자기서술 공유)

| AWS | NCP | 비고 |
|-----|-----|------|
| VPC / Subnet / Route Table / NAT Gateway | 동일 | 이름까지 같음 |
| Security Group | **ACG** | 서버(NIC) 레벨 |
| Network ACL | 동일 | 서브넷 레벨 |
| EC2 Instance | **Server** | |
| ALB | **Load Balancer**(Application) | 타입 선택형 |
| Launch Template | **Launch Configuration** | |
| Auto Scaling Group | 동일 | |
| S3 Bucket | **Object Storage** | S3 API 호환, 전역 고유 |
| RDS | **Cloud DB for MySQL** | |
| ECR | **Container Registry** | |
| IAM User/Role | **Sub Account / Role** | Org/OU 계층 없음 |

> NCP는 AWS 클론에 가까워 대응이 거의 1:1이다. 서비스가 없는 것(관리형 Bastion, 서버리스 컨테이너 실행, 관리형 파일 스토리지)은 편성하지 않고, 비교가 자연스러운 자리에서만 실무 중심으로 언급한다.
