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
COPY .mvn/ ./.mvn/
COPY mvnw pom.xml ./
RUN --mount=type=cache,target=/root/.m2 \
    ./mvnw -B dependency:go-offline

# [애플리케이션 빌드] 소스가 바뀌면 이 단계부터 다시 실행된다
COPY src/ ./src/
RUN --mount=type=cache,target=/root/.m2 \
    ./mvnw -B -DskipTests -Dbuild.finalName=${APP_NAME} package

# ==============================================================================
# STAGE 02: extract (JRE)
# ==============================================================================
FROM eclipse-temurin:21-jre AS extract
ARG BUILD_DIR
ARG APP_NAME

WORKDIR /${BUILD_DIR}

# [layered jar 추출] 빌드 스테이지의 jar 파일을 레이어별 디렉터리로 나눈다
COPY --from=build /${BUILD_DIR}/target/${APP_NAME}.jar ./app.jar
RUN java -Djarmode=tools -jar app.jar extract --layers --destination extracted

# ==============================================================================
# STAGE 03: runtime (JRE)
# ==============================================================================
FROM eclipse-temurin:21-jre
ARG BUILD_DIR
ARG APP_NAME

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

# [JVM 실행 옵션]
ENV JAVA_TOOL_OPTIONS="-XX:MaxRAMPercentage=75.0"

# [애플리케이션 설정 기본값] 개발 프로필, H2 인메모리 데이터베이스, 로컬 스토리지
ENV SPRING_PROFILES_ACTIVE=dev
ENV SPRING_DATASOURCE_URL="jdbc:h2:mem:gallery;DB_CLOSE_DELAY=-1;MODE=MYSQL"
ENV SPRING_DATASOURCE_USERNAME=sa
# ENV SPRING_DATASOURCE_PASSWORD=   비밀번호는 이미지에 넣지 않는다. 실행할 때 주입한다
ENV APP_STORAGE_TYPE=local
ENV APP_STORAGE_LOCAL_PATH=uploads

USER 10001:10001
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
