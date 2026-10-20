# syntax=docker/dockerfile:1

FROM eclipse-temurin:21-jdk

WORKDIR /app

# 의존성 해결: 의존성 목록(pom.xml)이 바뀔 때만 다시 실행된다
COPY .mvn/ ./.mvn/
COPY mvnw pom.xml ./
RUN ./mvnw -B dependency:go-offline

# 애플리케이션 빌드: 소스가 바뀌면 이 단계부터 다시 실행된다
COPY src/ ./src/
RUN ./mvnw -B -DskipTests -Dbuild.finalName=gallery package

# JVM 실행 옵션
ENV JAVA_TOOL_OPTIONS="-XX:MaxRAMPercentage=75.0"

# 애플리케이션 설정의 기본값 (개발 프로필, H2 인메모리 데이터베이스, 로컬 스토리지)
ENV SPRING_PROFILES_ACTIVE=dev
ENV SPRING_DATASOURCE_URL="jdbc:h2:mem:gallery;DB_CLOSE_DELAY=-1;MODE=MYSQL"
ENV SPRING_DATASOURCE_USERNAME=sa
# ENV SPRING_DATASOURCE_PASSWORD=   비밀번호는 이미지에 넣지 않는다. 실행할 때 주입한다
ENV APP_STORAGE_TYPE=local
ENV APP_STORAGE_LOCAL_PATH=uploads

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "target/gallery.jar"]
