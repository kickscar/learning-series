# syntax=docker/dockerfile:1

# Stage01: Build
# eclipse-temurin:*-focal 태그는 레지스트리에 없을 수 있음 → 21-jdk / 21-jre 사용
FROM eclipse-temurin:21-jdk AS build
ARG workspace=workspace
ARG application

WORKDIR /${workspace}
COPY .mvn/ .mvn/
COPY mvnw mvnw.cmd pom.xml ./

RUN --mount=type=cache,target=/root/.m2 ./mvnw -B dependency:go-offline
COPY src ./src

RUN --mount=type=cache,target=/root/.m2 ./mvnw -B -Dbuild.finalName=${application} -DskipTests package

# Stage02: Extract layered jar
FROM build AS prepare-application
ARG workspace=workspace
ARG temp=temp
ARG application

WORKDIR /${workspace}/${temp}
COPY --from=build /${workspace}/target/${application}.jar ${application}.jar
RUN java -Djarmode=tools -jar ${application}.jar extract --layers --launcher

# Stage03: Runtime
FROM eclipse-temurin:21-jre
ARG workspace=workspace
ARG temp=temp
ARG application
# 화면 푸터에 표시할 버전 (예: --build-arg version=1.0). 비우면 표시하지 않는다
ARG version=

WORKDIR /${application}

COPY --from=prepare-application /${workspace}/${temp}/${application}/dependencies/ ./
COPY --from=prepare-application /${workspace}/${temp}/${application}/snapshot-dependencies/ ./
COPY --from=prepare-application /${workspace}/${temp}/${application}/spring-boot-loader/ ./
COPY --from=prepare-application /${workspace}/${temp}/${application}/application/ ./

# 비root 사용자를 고정 UID/GID로 생성한다.
# USER를 숫자로 지정해야 Kubernetes의 runAsNonRoot 검증(Pod Security Restricted)을 통과한다.
RUN groupadd -r -g 10001 spring && useradd -r -u 10001 -g spring spring \
    && mkdir -p uploads \
    && chown -R 10001:10001 /${application}

EXPOSE 8080
USER 10001:10001

ENV SPRING_PROFILES_ACTIVE=dev
ENV SPRING_DATASOURCE_URL=jdbc:h2:mem:gallery;DB_CLOSE_DELAY=-1;MODE=MYSQL
ENV SPRING_DATASOURCE_USERNAME=sa
ENV SPRING_DATASOURCE_PASSWORD=
ENV APP_STORAGE_TYPE=local
ENV APP_STORAGE_LOCAL_URL_PREFIX=/assets/images/uploads
ENV APP_STORAGE_S3_BUCKET=gallery
ENV APP_RUNTIME_VERSION=${version}

# 로컬 저장소는 WORKDIR 기준 상대 경로 `uploads` 로 고정 (명령줄 인자가 env·yaml보다 우선 → 호스트 절대경로 주입 완화)
ENTRYPOINT ["java", "org.springframework.boot.loader.launch.JarLauncher", "--app.storage.local.path=uploads"]
