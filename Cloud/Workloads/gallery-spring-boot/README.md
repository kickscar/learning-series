# Gallery (Spring Boot)

이미지를 업로드하고 목록에서 보거나 삭제할 수 있는 간단한 웹 갤러리 애플리케이션이다. 업로드 파일은 **로컬 디스크**에 저장하거나 **Amazon S3**에 저장하도록 선택할 수 있다.

---

## 기능

- 갤러리 목록 조회
- 이미지 파일 업로드(선택적으로 코멘트 입력)
- 항목 삭제(저장소의 파일과 DB 레코드 정리)
- 로컬 스토리지 또는 S3 기반 스토리지 전환(`app.storage.type`)

---

## 기술 스택

| 구분 | 사용 |
|------|------|
| Runtime | Java 21 |
| Framework | Spring Boot 3.5.x |
| View | Thymeleaf |
| Persistence | MyBatis, H2(기본), MariaDB JDBC 포함 |
| Cloud SDK | AWS SDK v2 (S3, 선택 시) |
| Build | Maven |

---

## 사전 요구 사항

- JDK 21
- (S3 사용 시) AWS 자격 증명 및 버킷 — SDK 기본 제공 체인(환경 변수, 프로파일 등)을 사용한다.

---

## 빌드

프로젝트 루트에서 Maven Wrapper로 패키징한다. 테스트를 포함한 전체 빌드는 아래 명령을 사용한다.

```bash
./mvnw clean package
```

Windows:

```bash
mvnw.cmd clean package
```

- **산출물**: `target/cloud-workload-gallery-0.0.1-SNAPSHOT.jar`
- **테스트만** 실행: `./mvnw test`
- **테스트 생략** 후 패키지: `./mvnw clean package -DskipTests`

`pom.xml`의 `finalName`은 프로퍼티 **`build.finalName`** 으로 정의되어 있으므로, 빌드 시 아래처럼 산출 파일 이름을 `gallery.jar`로 고정할 때는 예를 들어 다음과 같다.

```bash
./mvnw clean package -Dbuild.finalName=gallery
```

Windows:

```bash
mvnw.cmd clean package -Dbuild.finalName=gallery
```

이때 산출물은 **`target/gallery.jar`** 이다. 아래 JAR 실행 예시도 이 파일명을 기준으로 한다. 기본 `clean package` 만 쓸 때는 **`target/cloud-workload-gallery-0.0.1-SNAPSHOT.jar`** 가 생성되므로, 실행 시 경로만 맞추면 된다.

---

## 실행 방법

```bash
./mvnw spring-boot:run
```

Windows:

```bash
mvnw.cmd spring-boot:run
```

활성 프로파일 **기본(default)은 `dev`** 이며, 애플리케이션은 **http://localhost:8080** 에서 동작한다.

---

## 설정

주요 설정은 `src/main/resources/application.yaml` 및 프로파일(`dev`, `prod`)에서 다룬다.

| 항목 | 설명 |
|------|------|
| `spring.profiles.active` | 활성 프로파일. **기본(default)은 `dev`** 이며, 별도로 넘기지 않아도 된다. `prod` 를 쓸 때만 명시한다. |
| `spring.datasource.*` | DB 연결. 기본은 인메모리 H2(MySQL 모드). MariaDB 등으로 교체 가능하다. |
| `app.storage.type` | `local` 또는 `s3` |
| `app.storage.local.path` | 로컬 저장 디렉터리 (상대 경로는 프로세스 작업 디렉터리 기준) |
| `app.storage.local.url-prefix` | 브라우저에서 접근하는 업로드 파일 URL prefix |
| `app.storage.s3.bucket` | S3 버킷 이름 (`app.storage.type=s3` 일 때) |

---

## HTTP 엔드포인트 (요약)

| Method | Path | 설명 |
|--------|------|------|
| GET | `/` | 목록 화면 |
| POST | `/new` | `multipart/form-data` — `file`, `comment` |
| GET | `/{id}/delete` | 항목 삭제 |

---

## dev와 prod 프로파일

`application.yaml` 에서 **`spring.profiles.active`** 기본값은 **`dev`** 이다. 인자를 넘기지 않으면 **기본(default)으로 `dev`** 가 적용된다. **`prod`** 는 `--spring.profiles.active=prod` 로만 전환한다.

| 구분 | `dev` (default) | `prod` |
|------|--------|--------|
| **HTTP 포트** | `8080` | `80` |
| **로깅** | 기본 콘솔 패턴 (`application.yaml` 의 `logging`) | `logback-prod.xml` 사용, 구조화·운영 로그에 맞춘 설정 |
| **기타** | Thymeleaf 캐시 끔, DevTools(핫 리로드 등) 사용 | Thymeleaf 캐시 켬, `logging.ops.level` 등 운영용 레벨 |

`prod` 는 **80번 포트**에 바인딩하므로, Linux·macOS 등에서는 관리자 권한이 필요할 수 있다. 권한 없이 띄울 때는 실행 시 `--server.port=8080` 처럼 포트를 덮어쓸 수 있다.

---

## JAR 실행과 환경 조합 (gallery.jar)

Spring Boot 는 **`--속성=값`** 으로 설정을 덮어쓴다. 비밀번호 등은 명령줄에 노출되기 쉬우므로, 운영에서는 환경 변수나 외부 설정 파일 사용을 권장한다.

### 자주 쓰는 파라미터

| 목적               | 예시                                                                                  |
|------------------|-------------------------------------------------------------------------------------|
| 프로파일             | `prod` 를 쓸 때만 `--spring.profiles.active=prod` (기본 `dev` 는 생략 가능) |
| 포트               | `--server.port=8080`                                                                |
| 스토리지             | `--app.storage.type=s3`                                                             |
| S3 버킷            | `--app.storage.s3.bucket=버킷이름`                                                      |
| 외부 DB(MariaDB 등) | `--spring.datasource.url=...` , `--spring.datasource.username=...` , `--spring.datasource.password=...` |

### 조합 예시

**1) 기본 프로파일 + H2 + 로컬 스토리지**

```bash
java -jar target/gallery.jar
```

**2) 운영 프로파일 + H2 + 로컬 스토리지 + (포트:8080)**

```bash
java -jar target/gallery.jar \
--spring.profiles.active=prod \
--server.port=8080
```

**3) 운영 프로파일 + H2 + S3 스토리지 + (포트:8080)**

```bash
java -jar target/gallery.jar \
--spring.profiles.active=prod \
--app.storage.type=s3 \
--app.storage.s3.bucket=my-gallery-bucket \
--server.port=8080
```

**4) 운영 프로파일 + MariaDB + S3 스토리지 + (포트:8080)**

```bash
java -jar target/gallery.jar \
--spring.profiles.active=prod \
--spring.datasource.url=jdbc:mariadb://db.example.com:3306/gallery \
--spring.datasource.username=gallery \
--spring.datasource.password='비밀번호' \
--app.storage.type=s3 \
--app.storage.s3.bucket=gallery \
--server.port=8080
```

---

## 라이선스

상위 저장소의 라이선스·이용 조건을 따른다.
