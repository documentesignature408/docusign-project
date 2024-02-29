FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/project.docusign-0.0.1-SNAPSHOT.jar demo.jar
ENTRYPOINT ["java", "-jar", "demo.jar"]


mvn -N io.takari:maven:0.7.7:wrapper
chmod +x mvnw
./mvnw clean package
./mvnw.cmd clean package
java -jar target/your-application.jar
