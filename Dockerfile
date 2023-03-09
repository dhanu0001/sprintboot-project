FROM openjdk:11-slim-buster as step_01
WORKDIR /app
COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .
COPY src src
RUN --mount=type=cache,target=/root/.m2,rw ./mvnw -B package

FROM openjdk:11-jre-slim-buster
WORKDIR /app
RUN apt update && apt install curl -y
COPY --from=step_01 /app/target/api.jar .
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "api.jar"]