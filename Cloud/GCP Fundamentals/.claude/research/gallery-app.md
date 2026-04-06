# Research: Gallery Spring Boot 앱 분석

> 조사일: 2026-04-06
> 소스 경로: `/Users/kickscar/Learning Series/Cloud/Workloads/gallery-spring-boot`

---

## 기술 스택

| 항목 | 내용 |
|------|------|
| Runtime | Java 21 |
| Framework | Spring Boot 3.5.12 |
| View | Thymeleaf |
| ORM | MyBatis |
| DB | H2 인메모리 (기본, MySQL 모드) / MariaDB 전환 가능 |
| 스토리지 | 로컬 파일시스템(`local`) 또는 AWS S3(`s3`) |
| Build | Maven |
| 빌드 명령 | `./mvnw clean package -Dbuild.finalName=gallery -DskipTests` |
| 산출물 | `target/gallery.jar` |

---

## HTTP 엔드포인트

| Method | Path | 설명 |
|--------|------|------|
| GET | `/` | 갤러리 목록 화면 (Thymeleaf) |
| POST | `/new` | 이미지 업로드 (`multipart/form-data`: `file`, `comment`) |
| GET | `/{id}/delete` | 항목 삭제 (파일 + DB) |
| GET | `/actuator/health` | 헬스체크 (JSON) |
| GET/POST | `/error` | Whitelabel 에러 핸들러 (JSON) |
| POST | `/error/404` | 404 응답 |
| POST | `/error/500` | 500 응답 |

---

## DB 스키마

```sql
CREATE TABLE IF NOT EXISTS `item` (
    `id`      INT          NOT NULL AUTO_INCREMENT,
    `url`     VARCHAR(200) NOT NULL,
    `comment` VARCHAR(200) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB;
```

---

## 프로파일

| 구분 | 포트 | DB | 로깅 |
|------|------|-----|------|
| `dev` (기본) | 8080 | H2 인메모리 | 콘솔 출력 |
| `prod` | 80 | H2 인메모리 (기본) | logback-prod.xml |

---

## 주요 설정값 (application.yaml)

```yaml
app:
  storage:
    type: local            # local | s3
    local:
      path: uploads
      url.prefix: /assets/images/uploads
    s3:
      bucket: gallery

management:
  endpoints.web.exposure.include: health
```

---

## EC2InstanceIdentity — GCP 주의사항

- `EC2InstanceIdentity` 클래스가 AWS IMDSv2(`http://169.254.169.254`)로 인스턴스 ID를 조회
- Thymeleaf 뷰 Footer에 `ec2InstanceId` 모델 어트리뷰트로 표시됨
- **GCP VM에서는 IMDSv2 타임아웃 → `"local"` 폴백**

### GCP에서 인스턴스 ID 주입 방법 (Startup Script)

```bash
INSTANCE_ID=$(curl -s -H "Metadata-Flavor: Google" \
  http://metadata.google.internal/computeMetadata/v1/instance/name)

java -jar /app/gallery.jar \
  --app.runtime.instance-id=$INSTANCE_ID
```

우선순위: `app.runtime.instance-id` 설정값 → `EC2_INSTANCE_ID` 환경변수 → IMDSv2 조회 → `"local"` 폴백

---

## 챕터별 스토리지/DB 연계 계획

| 챕터 | 스토리지 | DB | 비고 |
|------|----------|-----|------|
| Ch03 Gallery | `local` | H2 | External IP VM에 최초 배포, Startup Script |
| Ch04 Gallery | `local` | H2 | Private VM, Data Disk 마운트 (`/data/uploads`) |
| Ch07 Gallery | Cloud Storage | H2 | **앱 코드 수정 필요** — S3 SDK → GCS SDK |
| Ch08 Gallery | `local` | Cloud SQL (MySQL) | MariaDB JDBC → Cloud SQL Private IP |

---

## Ch03 Gallery — Startup Script 뼈대

```bash
#!/bin/bash
# JDK 21 설치
apt-get update -y
apt-get install -y temurin-21-jdk

# JAR 복사 (GCS 또는 다른 방법)
mkdir -p /app
gsutil cp gs://[BUCKET]/gallery.jar /app/gallery.jar

# GCE 인스턴스 이름 조회
INSTANCE_ID=$(curl -s -H "Metadata-Flavor: Google" \
  http://metadata.google.internal/computeMetadata/v1/instance/name)

# 앱 실행
java -jar /app/gallery.jar \
  --app.runtime.instance-id=$INSTANCE_ID &
```

---

## Docker

- 3-stage 멀티스테이지 빌드 (build → layered jar extract → runtime)
- Base: `eclipse-temurin:21-jdk` (build) / `eclipse-temurin:21-jre` (runtime)
- 빌드: `docker build --build-arg application=gallery -t gallery:local .`
- `--build-arg application=gallery` 필수 (기본값 없음)
- 컨테이너 기본 포트: 8080
- 로컬 스토리지: `/gallery/uploads` (볼륨 마운트 권장)
