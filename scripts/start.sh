#!/bin/bash
# Script para iniciar los contenedores de WebFlotaVehiculo

set -e

echo "=========================================="
echo "  Iniciando WebFlotaVehiculo"
echo "=========================================="
echo ""

# Verificar si los contenedores existen
if [ "$(docker ps -a -q -f name=mysql_concesionario)" ]; then
    echo "▶️  Iniciando contenedores existentes..."
    docker-compose start
else
    echo "🚀 Levantando contenedores por primera vez..."
    docker-compose up -d
    echo "⏳ Esperando 30 segundos para que Tomcat despliegue..."
    sleep 30
fi

echo ""
echo "📊 Estado de los contenedores:"
docker ps --filter "name=mysql_concesionario" --filter "name=tomcat_flota"

echo ""
echo "✅ Aplicación iniciada"
echo "🌐 Accede a: http://localhost:8080/WebFlotaVehiculo/listarVehi.jsp"
