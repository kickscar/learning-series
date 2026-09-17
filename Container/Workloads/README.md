# Container Workloads

`Container/` 트랙의 실습에서 **실행 대상이 되는 애플리케이션**을 모아 둔 디렉터리다.
시리즈 문서와 소규모 예제는 각 시리즈 디렉터리에 두고, 이 디렉터리에는 **앱 소스**만 둔다.

---

## 개요

- **역할**: Docker Core와 Kubernetes Core의 **Gallery 실습**이 챕터마다 확장해 나가는 대상이다
- **성격**: 시리즈 문서가 앱을 바꿔 가며 설명하지 않는다. **같은 앱 하나를 계층마다 다른 방식으로 실행한다**
- **동기화**: 세 트랙(`Cloud/`, `Container/`, `System/`)이 같은 소스를 공유한다. 정본은 `Cloud/Workloads/` 다

---

## 포함된 Workload

| 이름 | 경로 | 설명 |
|------|------|------|
| **gallery-spring-boot** | [`gallery-spring-boot/`](gallery-spring-boot/) | 이미지 갤러리 웹 앱. Spring Boot 3.5.x / Java 21, Thymeleaf + MyBatis. 메타데이터는 H2 또는 MariaDB, 업로드 파일은 로컬 디스크 또는 오브젝트 스토리지 |
| **identicon** | [`identicon/`](identicon/) | 식별자로 아바타 이미지를 생성하는 보조 서비스. Spring Boot 3.3.x / Java 21, Redis 사용 |
| **gallery-asp-dotnet** | [`gallery-asp-dotnet/`](gallery-asp-dotnet/) | gallery-spring-boot의 .NET 포팅. .NET 8 / ASP.NET Core MVC + Razor. 도메인·엔드포인트·화면이 대칭이다 |

---

## Container Series와의 관계

| 시리즈 | 사용 방식 |
|--------|----------|
| **Container Fundamentals** | 연결 없음. 컨테이너 기술 본질을 다루며 애플리케이션 실습을 하지 않는다 |
| **Docker Core** | **gallery-spring-boot가 메인 실습 대상이다.** 이미지 빌드에서 시작해 Compose 구성까지 챕터마다 확장한다. identicon은 네트워크와 Compose 실습에서 두 번째 서비스로 사용한다 |
| **Kubernetes Fundamentals** | 연결 없음. 클러스터 구축을 다루며 워크로드 실습은 Kubernetes Core가 담당한다 |
| **Kubernetes Core** | **Docker Core에서 빌드한 이미지를 클러스터에 배포한다.** Deployment에서 시작해 Service·스토리지·설정 분리·보안·Helm까지 확장한다. identicon은 Service Discovery 실습에 사용한다 |
| **Cloud Native** | 서비스 아키텍처 구현의 대상으로 사용한다 |

### 계층 간 연결

```
Docker Core          이미지를 만든다        gallery:local
      ↓
Kubernetes Core      클러스터에 배포한다     Deployment → Service → PVC → Helm
      ↓
Cloud Native         서비스로 설계한다       아키텍처·릴리스·관측
```

**같은 앱이 계층을 따라 올라간다.** 학습자가 매번 새 예제를 익히지 않고 실행 방식의 차이에 집중할 수 있다.

### gallery-asp-dotnet의 위치

런타임이 다른 애플리케이션을 같은 방식으로 컨테이너화할 수 있다는 점을 보이는 데 사용할 수 있다.
빌드 단계와 최종 이미지의 구성이 Java와 어떻게 달라지는지 비교하는 소재다.
**현재 시리즈 문서에 연결된 실습은 없다.**

---

## 실행 관련 참고

- **`HostIdentity`** 가 요청을 처리한 인스턴스를 식별해 화면 푸터에 표시한다. 클라우드 메타데이터에 의존하지 않고 hostname을 사용한다
  - 컨테이너에서 hostname은 기본적으로 컨테이너 ID의 앞부분이다. **여러 복제본으로 확장했을 때 어느 컨테이너가 응답했는지 화면에서 확인할 수 있다**
- 빌드 산출물(`target/`, `bin/`, `obj/`)은 저장소에 포함하지 않는다. 각자 환경에서 빌드한다

---

## 라이선스

상위 저장소의 라이선스와 이용 조건을 따른다.
