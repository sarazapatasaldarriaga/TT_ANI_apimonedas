FROM openjdk:23-jdk
WORKDIR /app
COPY presentaciontarget/presentacion-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080