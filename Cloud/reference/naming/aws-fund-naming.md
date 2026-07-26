# AWS 리소스 네이밍 — Fundamentals (콘솔)

> AWS-Fundamentals(콘솔 실습)용 리소스 네이밍 규칙. **규칙만 정리한다** — 서사·논리는 이 규칙을 쓰는 시리즈 문서에서 다룬다.

---

## 1. 패턴

```
{org}-{project}-{capability}-{identity}
```

| 세그먼트 | 값 | 설명 |
|---------|-----|------|
| `org` | **`aws-fund`** | 시리즈명 (실무의 organization/team/product에 대응) |
| `project` | **`lab{NN}`** 또는 **`gallery`** | 실습 단위. Section Lab은 `lab01`…, 횡단 프로젝트는 `gallery` |
| `capability` | `vpc`, `sg`, `instance`… | 리소스 종류 약어 (§2) |
| `identity` | `web`, `private-a`, `instance`… | 리소스 정체성 (§3) |

예: `aws-fund-lab03-sg-instance`, `aws-fund-gallery-vpc`, `aws-fund-lab04-subnet-private-a`

---

## 2. Capability 약어

**원칙: 축약하지 않는다.** 아래는 AWS에서 고유명사화된 관례적 약어만 인정한다.

### 네트워크
| Full Name | Capability |
|-----------|-----------|
| Virtual Private Cloud | `vpc` |
| Subnet | `subnet` |
| Internet Gateway | `igw` |
| NAT Gateway | `natgw` |
| Security Group | `sg` |
| Route Table | `rtb` |
| Network ACL | `nacl` |
| VPC Endpoint | `vpce` |

### 컴퓨팅 / 로드밸런싱
| Full Name | Capability |
|-----------|-----------|
| EC2 Instance | `instance` |
| Application Load Balancer | `alb` |
| Target Group | `tg` |
| Launch Template | `lt` |
| Auto Scaling Group | `asg` |

### 데이터 / 스토리지 / IAM
| Full Name | Capability |
|-----------|-----------|
| RDS Instance | `rds` |
| S3 Bucket | `s3bucket` |
| KMS Key | `kmskey` |
| IAM Role | `iamrole` |
| IAM Instance Profile | `iamprofile` |
| IAM Policy | `iampolicy` |

---

## 3. identity — 범주 · 조합 · 생략

`{identity}`는 리소스의 정체성을 드러내는 키워드다. 네 범주를 조합한다.

| 범주 | 설명 | 예시 |
|------|------|------|
| Target | 이 리소스가 보호/연결하는 대상 | `instance`, `alb` |
| Type | 리소스의 성격/종류 | `private`, `public`, `external` |
| Attr | 리소스의 특성/용도 | `web`, `was`, `minimal`, `storage` |
| Loc | 위치(가용 영역 등) | `a`, `b`, `c` |

### 조합

| 리소스 | 이름 | identity |
|--------|------|----------|
| EC2 보호 SG | `aws-fund-lab03-sg-instance` | 대상 capability (Target) |
| SG (속성 추가) | `aws-fund-lab03-sg-instance-minimal` | Target + Attr |
| Private Subnet (AZ a) | `aws-fund-lab04-subnet-private-a` | Type + Loc |
| Web용 EC2 | `aws-fund-gallery-instance-web` | Attr |

### 생략

해당 capability가 **하나뿐이면 identity를 생략**한다. 여러 개면 `-`로 조합한다.

| 상황 | 이름 |
|------|------|
| VPC는 실습당 하나 | `aws-fund-lab04-vpc` |
| IGW는 VPC당 하나 | `aws-fund-lab04-igw` |
| Private Subnet 2개 (AZ 분리) | `aws-fund-lab04-subnet-private-a`, `…-private-b` |

---

## 4. 태그 (콘솔 수동)

| 태그 | 필수 | 값 예시 |
|------|------|--------|
| `Name` | 필수 | `aws-fund-gallery-vpc` (리소스 이름 그대로) |
| `Project` | 권장 | `aws-fund-lab03` 또는 `aws-fund-gallery` |

---

## 5. 예시

**Section Lab (lab03, EC2)**
```
aws-fund-lab03-vpc
aws-fund-lab03-subnet-public-a
aws-fund-lab03-sg-instance
aws-fund-lab03-instance-web
```

**Gallery (횡단 프로젝트)**
```
aws-fund-gallery-vpc
aws-fund-gallery-subnet-private-a
aws-fund-gallery-natgw
aws-fund-gallery-sg-web
aws-fund-gallery-instance-web
aws-fund-gallery-rds
```

**S3 버킷** — `bucket` 인수는 AWS 글로벌 고유 이름이라 네이밍 룰과 별개다. Name 태그는 룰을 따른다.
```
bucket 인수: aws-fund-gallery   (중복 시 -{account_id} suffix)
Name 태그:   aws-fund-gallery-s3bucket-storage
```
