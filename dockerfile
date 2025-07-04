FROM maven:3.8.5-openjdk-17 as build
WORKDIR /app
COPY . .
run maven clean  install -DskipTests

FROM openjdk:23-jdk
WORKDIR /app
COPY presentacion/target/presentacion-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080