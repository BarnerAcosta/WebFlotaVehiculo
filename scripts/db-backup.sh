#!/bin/bash
# Script para hacer backup de la base de datos MySQL

set -e

BACKUP_DIR="./backups"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/concesionario_$DATE.sql"

echo "=========================================="
echo "  Backup de Base de Datos"
echo "=========================================="
echo ""

# Crear directorio de backups si no existe
mkdir -p "$BACKUP_DIR"

echo "💾 Creando backup de la base de datos..."
docker exec mysql_concesionario mysqldump -u root concesionario > "$BACKUP_FILE"

if [ $? -eq 0 ]; then
    echo "✅ Backup creado exitosamente:"
    echo "   $BACKUP_FILE"
    echo ""
    echo "📊 Tamaño: $(du -h "$BACKUP_FILE" | cut -f1)"
else
    echo "❌ Error al crear el backup"
    exit 1
fi
