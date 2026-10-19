# syntax=docker/dockerfile:1

FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY . ./
RUN ./mvnw -B -DskipTests -Dbuild.finalName=gallery package

EXPOSE 8080

CMD ["java", "-jar", "target/gallery.jar"]
