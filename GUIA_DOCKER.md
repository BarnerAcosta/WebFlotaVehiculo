# 🚀 Guía de Uso - WebFlotaVehiculo con Docker

## 📋 Requisitos Previos

- Docker Desktop instalado y ejecutándose
- Apache Ant instalado (para compilar)
- Puerto 8080 y 3306 disponibles

---

## 🚀 INICIAR TODO

```powershell
# 1. Navegar a la carpeta del proyecto
cd C:\Users\barne\dev\JSP\WebFlotaVehiculo

# 2. Levantar los contenedores (MySQL + Tomcat)
docker-compose up -d

# 3. Verificar que los contenedores estén corriendo
docker ps

# 4. Esperar 20-30 segundos para que Tomcat despliegue la aplicación
```

**Acceder a la aplicación:**

- Lista de vehículos: http://localhost:8080/WebFlotaVehiculo/listarVehi.jsp
- Registrar vehículo: http://localhost:8080/WebFlotaVehiculo/registrarVehi.jsp
- Tomcat Manager: http://localhost:8080/manager/html (usuario: `admin`, contraseña: `admin`)

---

## ⏸️ DETENER TODO

### Desde la terminal:

```powershell
# Opción 1: Detener contenedores (mantiene datos)
docker-compose stop

# Opción 2: Detener y eliminar contenedores (mantiene datos en volumen)
docker-compose down
```

### Desde Docker Desktop (GUI):

1. Abre **Docker Desktop**
2. Ve a la pestaña **"Containers"**
3. Busca el grupo **"webflotavehiculo"** (verás `mysql_concesionario` y `tomcat_flota`)
4. Haz clic en el botón **⏸️ Stop** del grupo o de cada contenedor individual

---

## ▶️ INICIAR CONTENEDORES YA CREADOS

### Desde la terminal:

```powershell
# Iniciar contenedores que ya existen (más rápido que docker-compose up)
docker-compose start
```

### Desde Docker Desktop (GUI):

1. En **Docker Desktop** → pestaña **"Containers"**
2. Busca el grupo **"webflotavehiculo"**
3. Haz clic en el botón **▶️ Start** del grupo o de cada contenedor

---

## 🔄 REINICIAR DESPUÉS DE CAMBIOS EN EL CÓDIGO

```powershell
# 1. Compilar los cambios con Ant
ant dist

# 2. Detener contenedores actuales
docker-compose down

# 3. Reconstruir imagen de Tomcat con nuevo WAR
docker-compose build --no-cache

# 4. Levantar contenedores nuevamente
docker-compose up -d

# Alternativa rápida (todo en una línea):
ant dist; docker-compose down; docker-compose build --no-cache; docker-compose up -d
```

---

## 📊 VER LOGS Y DIAGNOSTICAR PROBLEMAS

```powershell
# Ver logs de Tomcat
docker logs tomcat_flota

# Ver logs de MySQL
docker logs mysql_concesionario

# Seguir logs en tiempo real (Ctrl+C para salir)
docker logs -f tomcat_flota

# Ver estado de los contenedores
docker ps -a
```

---

## 🗄️ ACCEDER A LA BASE DE DATOS

### Desde la terminal MySQL:

```powershell
# Conectarse al contenedor MySQL
docker exec -it mysql_concesionario mysql -u root concesionario

# Una vez dentro, ejecutar consultas SQL:
SHOW TABLES;
SELECT * FROM tipovehi;
SELECT * FROM vehiculo;
SELECT v.placa, v.marca, v.referencia, v.modelo, t.nomTv
FROM vehiculo v
INNER JOIN tipovehi t ON v.id_tv = t.IdTv;

# Salir
exit
```

### Consultas rápidas sin entrar:

```powershell
# Ver todos los vehículos
docker exec -i mysql_concesionario mysql -u root concesionario -e "SELECT * FROM vehiculo;"

# Ver tipos de vehículo
docker exec -i mysql_concesionario mysql -u root concesionario -e "SELECT * FROM tipovehi;"
```

### Desde herramientas gráficas (MySQL Workbench, DBeaver, etc.):

- **Host:** `localhost`
- **Puerto:** `3306`
- **Usuario:** `root`
- **Contraseña:** _(vacía)_
- **Base de datos:** `concesionario`

---

## 🗑️ LIMPIAR TODO (Reinicio Completo)

```powershell
# Detener y eliminar contenedores + imágenes creadas
docker-compose down --rmi all

# Si también quieres eliminar los DATOS de la base de datos
docker-compose down -v

# Limpiar sistema Docker completo (¡CUIDADO! Afecta todos los proyectos)
docker system prune -a
```

---

## 🔍 VERIFICAR QUE TODO FUNCIONA

```powershell
# 1. Verificar contenedores activos
docker ps

# Deberías ver:
# - mysql_concesionario (puerto 3306)
# - tomcat_flota (puerto 8080)

# 2. Verificar estado de salud de MySQL
docker inspect mysql_concesionario | findstr "Health"

# 3. Probar conexión a la base de datos
docker exec mysql_concesionario mysqladmin -u root ping

# 4. Verificar que Tomcat respondió
curl http://localhost:8080
```

---

## 🛠️ SOLUCIÓN DE PROBLEMAS COMUNES

### Error: Puerto 8080 ya está en uso

```powershell
# Ver qué proceso usa el puerto
netstat -ano | findstr :8080

# Detener proceso (reemplaza PID con el número que aparece)
taskkill /PID <PID> /F
```

### Error: No se puede conectar a MySQL

```powershell
# Verificar que MySQL esté saludable
docker exec mysql_concesionario mysqladmin -u root ping

# Reiniciar solo MySQL
docker restart mysql_concesionario
```

### La aplicación no muestra datos

```powershell
# 1. Verificar logs de Tomcat
docker logs tomcat_flota

# 2. Verificar que la base de datos tenga datos
docker exec -i mysql_concesionario mysql -u root concesionario -e "SELECT COUNT(*) FROM vehiculo;"

# 3. Reconstruir todo desde cero
docker-compose down -v
docker-compose up -d
```

---

## 📦 ESTRUCTURA DEL PROYECTO

```
WebFlotaVehiculo/
├── docker-compose.yml          # Configuración de contenedores
├── Dockerfile                  # Imagen de Tomcat personalizada
├── build.xml                   # Script de compilación Ant
├── db/
│   └── concesionario.sql      # Script de inicialización de BD
├── web/                        # Código fuente JSP (EDITAR AQUÍ)
│   ├── listarVehi.jsp
│   ├── ver_vehiculo.jsp
│   ├── editar_vehiculo.jsp
│   └── ...
├── src/java/dao/
│   └── conexionLib.java       # Clase de conexión a MySQL
└── dist/
    └── WebFlotaVehiculo.war   # Aplicación compilada
```

---

## 📝 NOTAS IMPORTANTES

- **SIEMPRE edita archivos en la carpeta `web/`**, no en la raíz del proyecto
- Después de editar JSP o clases Java, ejecuta `ant dist` para recompilar
- Los datos de MySQL persisten en un volumen Docker (sobreviven a `docker-compose down`)
- Para resetear completamente la BD, usa `docker-compose down -v`
- La configuración usa `mysql:3306` como host (nombre del servicio Docker), no `localhost`

---

## 🎯 URLs de la Aplicación

| Página             | URL                                                                  |
| ------------------ | -------------------------------------------------------------------- |
| Listar Vehículos   | http://localhost:8080/WebFlotaVehiculo/listarVehi.jsp                |
| Ver Detalle        | http://localhost:8080/WebFlotaVehiculo/ver_vehiculo.jsp?placa=ABC123 |
| Registrar Vehículo | http://localhost:8080/WebFlotaVehiculo/registrarVehi.jsp             |
| Registrar Tipo     | http://localhost:8080/WebFlotaVehiculo/registrarTv.jsp               |
| Tomcat Manager     | http://localhost:8080/manager/html                                   |

---

**Última actualización:** 7 de diciembre de 2025
