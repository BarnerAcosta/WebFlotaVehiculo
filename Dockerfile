# Etapa 1: Compilación
FROM tomcat:9.0-jdk17 AS builder

# Instalar Ant
RUN apt-get update && \
    apt-get install -y ant && \
    rm -rf /var/lib/apt/lists/*

# Copiar código fuente y dependencias
WORKDIR /build
COPY src/ ./src/
COPY web/ ./web/
COPY lib/ ./lib/
COPY build-docker.xml ./build.xml

# Compilar proyecto con Ant
RUN ant -f build.xml dist

# Etapa 2: Imagen final
FROM tomcat:9.0-jdk17

# Limpiar aplicaciones por defecto
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiar WAR compilado desde la etapa anterior
COPY --from=builder /build/dist/WebFlotaVehiculo.war /usr/local/tomcat/webapps/WebFlotaVehiculo.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
