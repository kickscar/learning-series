# syntax=docker/dockerfile:1

# [전역 빌드 인자] 각 스테이지에서 이름만 다시 선언해 사용한다
ARG BUILD_DIR=workspace
ARG APP_NAME=gallery

# ==============================================================================
# STAGE 01: build (JDK)
# ==============================================================================
FROM eclipse-temurin:21-jdk AS build
ARG BUILD_DIR
ARG APP_NAME

WORKDIR /${BUILD_DIR}

# [의존성 해결] 의존성 목록(pom.xml)이 바뀔 때만 다시 실행된다
COPY .mvn/ .mvn/
COPY mvnw mvnw.cmd pom.xml ./
RUN --mount=type=cache,target=/root/.m2 ./mvnw -B dependency:go-offline

# [애플리케이션 빌드] 소스가 바뀌면 이 단계부터 다시 실행된다
COPY src ./src
RUN --mount=type=cache,target=/root/.m2 ./mvnw -B -DskipTests -Dbuild.finalName=${APP_NAME} package

# ==============================================================================
# STAGE 02: extract (build)
# ==============================================================================
FROM build AS extract

# [layered jar 추출] build 스테이지의 작업 디렉터리 · 빌드 인자를 그대로 이어받는다
RUN java -Djarmode=tools -jar target/${APP_NAME}.jar extract --layers --launcher --destination extracted

# ==============================================================================
# STAGE 03: runtime (JRE)
# ==============================================================================
FROM eclipse-temurin:21-jre
ARG BUILD_DIR
ARG APP_NAME
# 화면 푸터에 표시할 버전 (예: --build-arg version=1.0). 비우면 표시하지 않는다
ARG version=

WORKDIR /${APP_NAME}

# [비root 사용자] 고정 UID · GID 로 사용자를 만든다
RUN groupadd -r -g 10001 gallery && useradd -r -u 10001 -g gallery gallery

# [업로드 디렉터리] 실행 사용자가 파일을 쓸 수 있도록 소유자를 바꾼다
RUN mkdir uploads && chown 10001:10001 uploads

# [layered jar 복사] 자주 바뀌지 않는 레이어부터 복사한다
COPY --from=extract /${BUILD_DIR}/extracted/dependencies/ ./
COPY --from=extract /${BUILD_DIR}/extracted/spring-boot-loader/ ./
COPY --from=extract /${BUILD_DIR}/extracted/snapshot-dependencies/ ./
COPY --from=extract /${BUILD_DIR}/extracted/application/ ./

# [환경 변수 기본값 셋팅]
# JVM 실행 옵션
ENV JAVA_TOOL_OPTIONS="-XX:MaxRAMPercentage=75.0" \
    # 프로필 및 Datasource (비밀번호는 컨테이너 실행 시 외부 주입)
    SPRING_PROFILES_ACTIVE=dev \
    SPRING_DATASOURCE_URL=jdbc:h2:mem:gallery;DB_CLOSE_DELAY=-1;MODE=MYSQL \
    SPRING_DATASOURCE_USERNAME=sa \
    # SPRING_DATASOURCE_PASSWORD= \
    # 로컬 스토리지 설정
    APP_STORAGE_TYPE=local \
    APP_STORAGE_LOCAL_URL_PREFIX=/assets/images/uploads \
    # AWS S3 설정
    APP_STORAGE_S3_BUCKET=gallery \
    # 화면 푸터 버전
    APP_RUNTIME_VERSION=${version}

USER 10001:10001
EXPOSE 8080

ENTRYPOINT ["java", "org.springframework.boot.loader.launch.JarLauncher"]
