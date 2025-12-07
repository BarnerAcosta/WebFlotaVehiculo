#!/bin/bash
# Script de despliegue para WebFlotaVehiculo
# Compila el proyecto y despliega en Docker

set -e  # Detener en caso de error

echo "=========================================="
echo "  WebFlotaVehiculo - Deploy Script"
echo "=========================================="
echo ""

# Compilar con Ant
echo "📦 Compilando proyecto con Ant..."
ant dist

if [ $? -ne 0 ]; then
    echo "❌ Error en la compilación"
    exit 1
fi

echo "✅ Compilación exitosa"
echo ""

# Detener contenedores actuales
echo "⏸️  Deteniendo contenedores..."
docker-compose down

# Reconstruir imagen de Tomcat
echo "🔨 Reconstruyendo imagen de Tomcat..."
docker-compose build --no-cache

# Levantar contenedores
echo "🚀 Levantando contenedores..."
docker-compose up -d

# Esperar a que Tomcat despliegue
echo "⏳ Esperando 30 segundos para que Tomcat despliegue la aplicación..."
sleep 30

# Verificar estado
echo ""
echo "📊 Estado de los contenedores:"
docker ps --filter "name=mysql_concesionario" --filter "name=tomcat_flota"

echo ""
echo "✅ Despliegue completado"
echo "🌐 Accede a: http://localhost:8080/WebFlotaVehiculo/listarVehi.jsp"
