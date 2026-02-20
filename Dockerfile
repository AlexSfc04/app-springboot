# Etapa 1: Build
FROM maven:3.9.6-eclipse-temurin-21 AS builder

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY . .
RUN mvn clean package -DskipTests

# Etapa 2: Runtime
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Copiar el JAR desde la etapa de build
COPY --from=builder /app/target/task-manager-1.0.0.jar app.jar

# Exponer el puerto
EXPOSE 8080

# Establecer el comando de inicio
ENTRYPOINT ["java", "-jar", "app.jar"]
