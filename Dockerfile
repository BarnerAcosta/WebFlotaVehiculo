FROM tomcat:9.0-jdk17

# Limpiar aplicaciones por defecto
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiar tus archivos JSP a la raíz de Tomcat
COPY dist/WebFlotaVehiculo.war /usr/local/tomcat/webapps/WebFlotaVehiculo.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
