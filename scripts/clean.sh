#!/bin/bash
# Script para limpiar el proyecto WebFlotaVehiculo

set -e

echo "=========================================="
echo "  Limpieza de WebFlotaVehiculo"
echo "=========================================="
echo ""

# Opción 1: Limpiar solo archivos compilados
if [ "$1" == "build" ]; then
    echo "🧹 Limpiando archivos compilados..."
    ant clean
    rm -rf build/ dist/
    echo "✅ Archivos de compilación eliminados"
    exit 0
fi

# Opción 2: Limpiar contenedores pero mantener datos
if [ "$1" == "docker" ]; then
    echo "🧹 Limpiando contenedores Docker..."
    docker-compose down
    echo "✅ Contenedores eliminados (datos preservados)"
    exit 0
fi

# Opción 3: Limpiar TODO incluyendo datos
if [ "$1" == "all" ]; then
    echo "⚠️  ADVERTENCIA: Esto eliminará TODOS los datos de la base de datos"
    echo "Presiona Ctrl+C en los próximos 5 segundos para cancelar..."
    sleep 5
    
    echo "🧹 Limpiando archivos compilados..."
    ant clean
    rm -rf build/ dist/
    
    echo "🧹 Eliminando contenedores y volúmenes..."
    docker-compose down -v
    
    echo "✅ Limpieza completa finalizada"
    exit 0
fi

# Sin parámetros, mostrar ayuda
echo "Uso: $0 [build|docker|all]"
echo ""
echo "Opciones:"
echo "  build  - Limpiar solo archivos compilados (build, dist)"
echo "  docker - Limpiar contenedores (mantiene datos)"
echo "  all    - Limpiar TODO (archivos + contenedores + datos)"
echo ""
echo "Ejemplo: $0 build"
