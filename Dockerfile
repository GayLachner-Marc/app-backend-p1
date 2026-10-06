

# ---------- Fase 1: compilación ----------
FROM eclipse-temurin:25-jdk AS build

WORKDIR /app

COPY . .

RUN chmod +x mvnw && ./mvnw package -DskipTests


# ---------- Fase 2: ejecución ----------
FROM eclipse-temurin:25-jre

WORKDIR /app

COPY --from=build /app/target/app-backend-p1-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
