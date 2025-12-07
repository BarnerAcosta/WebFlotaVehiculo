#!/bin/bash
# Script para detener los contenedores de WebFlotaVehiculo

set -e

echo "=========================================="
echo "  Deteniendo WebFlotaVehiculo"
echo "=========================================="
echo ""

echo "⏸️  Deteniendo contenedores..."
docker-compose stop

echo ""
echo "✅ Contenedores detenidos"
echo "ℹ️  Los datos se mantienen. Usa ./start.sh para reiniciar"
