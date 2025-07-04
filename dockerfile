FROM openjdk:23-jdk
WORKDIR /app
COPY presentacion/target/presentacion-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080