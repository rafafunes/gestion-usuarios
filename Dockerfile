# Dockerfile para Gestion de Usuarios
# 
# Comandos útiles:
# Construir imagen:  docker build -t usuarios-app .
# Ejecutar contenedor: docker run -d --name Gestion-Usuarios -p 8081:8081 usuarios-app
# Detener contenedor:  docker stop Gestion-Usuarios
# Borrar contenedor:   docker rm Gestion-Usuarios
# Borrar imagen:       docker rmi usuarios-app

# Etapa 1: Build
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Etapa 2: Runtime
FROM eclipse-temurin:17-jre
LABEL name="Gestion-Usuarios"
LABEL description="Aplicacion de Gestion de Usuarios"
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8081
ENV SERVER_PORT=8081
ENTRYPOINT ["java", "-jar", "app.jar"]
