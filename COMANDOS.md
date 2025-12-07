# Comandos Linux y Docker - WebFlotaVehiculo

## 📋 Documentación de Comandos Ejecutados

### 1. COMANDOS LINUX BÁSICOS

#### Navegación y gestión de archivos

```bash
# Ver directorio actual
pwd

# Listar archivos
ls -la

# Navegar al proyecto
cd /ruta/del/proyecto/WebFlotaVehiculo

# Ver contenido de un archivo
cat docker-compose.yml

# Buscar archivos
find . -name "*.jsp"

# Ver permisos de archivos
ls -lh scripts/
```

#### Gestión de procesos

```bash
# Ver procesos activos
ps aux | grep java

# Ver uso de recursos
top

# Ver puertos en uso
netstat -tulpn | grep 8080
netstat -tulpn | grep 3306
```

---

### 2. COMANDOS DOCKER

#### Gestión de contenedores

```bash
# Listar contenedores activos
docker ps

# Listar todos los contenedores (incluyendo detenidos)
docker ps -a

# Ver logs de un contenedor
docker logs tomcat_flota
docker logs mysql_concesionario

# Seguir logs en tiempo real
docker logs -f tomcat_flota

# Inspeccionar un contenedor
docker inspect mysql_concesionario

# Ver estadísticas de recursos
docker stats
```

#### Ejecución de comandos en contenedores

```bash
# Ejecutar comando en contenedor MySQL
docker exec -it mysql_concesionario mysql -u root concesionario

# Verificar conexión a MySQL
docker exec mysql_concesionario mysqladmin -u root ping

# Consultas SQL directas
docker exec -i mysql_concesionario mysql -u root concesionario -e "SELECT * FROM vehiculo;"

# Acceder al shell del contenedor
docker exec -it tomcat_flota bash
docker exec -it mysql_concesionario bash

# Ver variables de entorno
docker exec tomcat_flota env
```

---

### 3. COMANDOS DOCKER-COMPOSE

#### Iniciar y detener servicios

```bash
# Levantar todos los servicios
docker-compose up -d

# Ver logs de todos los servicios
docker-compose logs

# Detener servicios
docker-compose stop

# Iniciar servicios detenidos
docker-compose start

# Reiniciar servicios
docker-compose restart

# Detener y eliminar contenedores
docker-compose down

# Detener y eliminar contenedores + volúmenes
docker-compose down -v
```

#### Construcción y rebuild

```bash
# Construir imágenes
docker-compose build

# Construir sin usar caché
docker-compose build --no-cache

# Reconstruir y levantar
docker-compose up -d --build

# Ver configuración de docker-compose
docker-compose config
```

#### Verificación y diagnóstico

```bash
# Ver servicios en ejecución
docker-compose ps

# Ver procesos dentro de los contenedores
docker-compose top

# Ver eventos en tiempo real
docker-compose events
```

---

### 4. COMANDOS DE GESTIÓN DE IMÁGENES

```bash
# Listar imágenes locales
docker images

# Ver imágenes del proyecto
docker images | grep webflotavehiculo

# Eliminar una imagen
docker rmi webflotavehiculo-tomcat

# Limpiar imágenes sin usar
docker image prune

# Ver información detallada de una imagen
docker image inspect mysql:5.7
```

---

### 5. COMANDOS DE GESTIÓN DE VOLÚMENES

```bash
# Listar volúmenes
docker volume ls

# Ver volumen de MySQL
docker volume inspect webflotavehiculo_mysql_data

# Crear backup del volumen
docker run --rm -v webflotavehiculo_mysql_data:/data -v $(pwd)/backups:/backup ubuntu tar czf /backup/mysql_backup.tar.gz /data

# Eliminar volúmenes sin usar
docker volume prune
```

---

### 6. COMANDOS DE RED

```bash
# Listar redes
docker network ls

# Inspeccionar red del proyecto
docker network inspect webflotavehiculo_default

# Ver qué contenedores están en la red
docker network inspect webflotavehiculo_default | grep -A 5 "Containers"
```

---

### 7. COMANDOS COMBINADOS ÚTILES

```bash
# Reinicio completo del proyecto
docker-compose down && docker-compose build --no-cache && docker-compose up -d

# Ver todos los logs juntos
docker-compose logs -f --tail=100

# Exportar base de datos
docker exec mysql_concesionario mysqldump -u root concesionario > backup_$(date +%Y%m%d).sql

# Importar base de datos
docker exec -i mysql_concesionario mysql -u root concesionario < backup.sql

# Verificar salud de MySQL
docker exec mysql_concesionario mysqladmin -u root status

# Ver IP de los contenedores
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mysql_concesionario
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' tomcat_flota
```

---

### 8. COMANDOS DE COMPILACIÓN (ANT)

```bash
# Compilar proyecto
ant dist

# Limpiar archivos compilados
ant clean

# Compilar y desplegar
ant dist && docker-compose down && docker-compose build && docker-compose up -d
```

---

### 9. COMANDOS MAKEFILE

```bash
# Ver ayuda
make help

# Compilar
make build

# Iniciar contenedores
make start

# Detener contenedores
make stop

# Desplegar (compilar + reconstruir + levantar)
make deploy

# Ver logs
make logs

# Probar conexión a BD
make test

# Limpiar todo
make clean
```

---

### 10. SCRIPTS BASH

```bash
# Dar permisos de ejecución
chmod +x scripts/*.sh

# Desplegar aplicación
./scripts/deploy.sh

# Iniciar servicios
./scripts/start.sh

# Detener servicios
./scripts/stop.sh

# Limpiar proyecto
./scripts/clean.sh build
./scripts/clean.sh docker
./scripts/clean.sh all

# Hacer backup de BD
./scripts/db-backup.sh
```

---

## 📸 CAPTURAS RECOMENDADAS

Para documentar tu proyecto, toma capturas de pantalla de:

1. **`docker-compose up -d`** - Mostrando creación de contenedores
2. **`docker ps`** - Mostrando contenedores corriendo
3. **`docker logs tomcat_flota`** - Mostrando despliegue de Tomcat
4. **`docker exec ... SELECT * FROM vehiculo`** - Mostrando datos en BD
5. **`make help`** - Mostrando comandos disponibles
6. **`make deploy`** - Mostrando proceso de despliegue completo
7. **Navegador** - Mostrando la aplicación funcionando
8. **GitHub Actions** - Mostrando pipeline ejecutándose

---

## ✅ VERIFICACIÓN COMPLETA

```bash
# Script de verificación completa
echo "=== Verificando Docker ==="
docker --version
docker-compose --version

echo "=== Verificando contenedores ==="
docker ps

echo "=== Verificando MySQL ==="
docker exec mysql_concesionario mysqladmin -u root ping

echo "=== Verificando datos ==="
docker exec -i mysql_concesionario mysql -u root concesionario -e "SELECT COUNT(*) FROM vehiculo;"

echo "=== Verificando Tomcat ==="
curl -s http://localhost:8080 | grep -q "Tomcat" && echo "✅ Tomcat OK" || echo "❌ Tomcat ERROR"

echo "=== Verificando aplicación ==="
curl -s http://localhost:8080/WebFlotaVehiculo/listarVehi.jsp | grep -q "Vehículos" && echo "✅ App OK" || echo "❌ App ERROR"
```

---

**Fecha de documentación:** 7 de diciembre de 2025  
**Proyecto:** WebFlotaVehiculo  
**Autor:** BarnerAcosta
