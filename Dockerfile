FROM maven:3.5-jdk-11 as BUILD

COPY ./ ./

RUN mvn --batch-mode -f /pom.xml clean package
FROM openjdk:11-jdk
EXPOSE 8082
COPY --from=BUILD /target ./target
WORKDIR ./target

CMD ["java", "-jar", "User-BackEnd-Docker.jar"]
