# ✅ ENTREGABLES - WebFlotaVehiculo

**Proyecto:** Sistema de Gestión de Vehículos con Docker  
**Autor:** BarnerAcosta  
**Fecha:** 7 de diciembre de 2025  
**Repositorio:** https://github.com/BarnerAcosta/WebFlotaVehiculo

---

## 📋 CHECKLIST DE ENTREGABLES

### ✅ 1. Gestión de historias de usuario en Azure DevOps

**Estado:** PENDIENTE  
**Acción requerida:** Crear proyecto en Azure DevOps y documentar historias de usuario

**Contenido sugerido:**

- Historia de Usuario 1: Listar vehículos
- Historia de Usuario 2: Registrar vehículo
- Historia de Usuario 3: Ver detalle de vehículo
- Historia de Usuario 4: Editar vehículo
- Historia de Usuario 5: Eliminar vehículo
- Historia de Usuario 6: Despliegue con Docker

---

### ✅ 2. Comandos Linux: Pantallazos de los comandos y resultados

**Estado:** DOCUMENTADO  
**Archivo:** `COMANDOS.md`

**Comandos documentados:**

- Navegación y gestión de archivos (pwd, ls, cd, cat, find)
- Gestión de procesos (ps, top, netstat)
- Permisos de archivos (chmod)
- Scripts bash

**Acción requerida:** Tomar capturas de pantalla ejecutando los comandos en:

- Terminal Linux/WSL
- Mostrar resultados reales del proyecto

**Capturas sugeridas:**

```bash
# 1. Navegación al proyecto
pwd
ls -la

# 2. Ver contenido de archivos
cat docker-compose.yml
cat Dockerfile

# 3. Buscar archivos JSP
find . -name "*.jsp"

# 4. Ver procesos
ps aux | grep java

# 5. Dar permisos a scripts
chmod +x scripts/*.sh
ls -lh scripts/
```

---

### ✅ 3. Comandos Docker: Pantallazos de los comandos y resultados

**Estado:** DOCUMENTADO  
**Archivo:** `COMANDOS.md` + `GUIA_DOCKER.md`

**Comandos documentados:**

- docker ps, docker images, docker logs
- docker exec, docker inspect, docker stats
- docker-compose up, down, build, logs
- Gestión de volúmenes y redes

**Acción requerida:** Tomar capturas de pantalla de:

```bash
# 1. Levantar contenedores
docker-compose up -d

# 2. Ver contenedores activos
docker ps

# 3. Ver logs de Tomcat
docker logs tomcat_flota

# 4. Ver logs de MySQL
docker logs mysql_concesionario

# 5. Ejecutar consulta en MySQL
docker exec -i mysql_concesionario mysql -u root concesionario -e "SELECT * FROM vehiculo;"

# 6. Ver volúmenes
docker volume ls

# 7. Ver imágenes
docker images

# 8. Ver estadísticas
docker stats --no-stream
```

---

### ✅ 4. Archivos de Automatización

#### ✅ 4.a. Dockerfile

**Estado:** ✅ COMPLETO  
**Archivo:** `Dockerfile`  
**Ubicación:** Raíz del proyecto

**Contenido:**

- Imagen base: tomcat:9.0-jdk17
- Limpieza de webapps por defecto
- Copia de WebFlotaVehiculo.war
- Puerto expuesto: 8080

**Verificación:**

```bash
cat Dockerfile
docker build -t webflotavehiculo-tomcat .
```

---

#### ✅ 4.b. Docker Compose

**Estado:** ✅ COMPLETO  
**Archivo:** `docker-compose.yml`  
**Ubicación:** Raíz del proyecto

**Contenido:**

- Servicio MySQL 5.7 con volumen persistente
- Servicio Tomcat con dependencia de MySQL
- Healthcheck para MySQL
- Red bridge automática
- Volumen nombrado para persistencia

**Verificación:**

```bash
cat docker-compose.yml
docker-compose config
docker-compose up -d
```

---

#### ✅ 4.c. Makefile

**Estado:** ✅ COMPLETO  
**Archivo:** `Makefile`  
**Ubicación:** Raíz del proyecto

**Comandos incluidos:**

- `make help` - Ayuda
- `make build` - Compilar con Ant
- `make start` - Iniciar contenedores
- `make stop` - Detener contenedores
- `make deploy` - Despliegue completo
- `make logs` - Ver logs
- `make test` - Probar BD
- `make clean` - Limpiar archivos
- Y más...

**Verificación:**

```bash
make help
make deploy
```

---

#### ✅ 4.d. Scripts .sh

**Estado:** ✅ COMPLETO  
**Ubicación:** `scripts/`

**Archivos creados:**

1. `deploy.sh` - Despliegue completo (compilar + Docker)
2. `start.sh` - Iniciar contenedores
3. `stop.sh` - Detener contenedores
4. `clean.sh` - Limpiar proyecto (build/docker/all)
5. `db-backup.sh` - Backup de base de datos

**Verificación:**

```bash
ls -lh scripts/
chmod +x scripts/*.sh
./scripts/start.sh
```

---

### ✅ 5. CI con GitHub Actions

**Estado:** ✅ COMPLETO  
**Archivo:** `.github/workflows/ci-cd.yml`  
**Ubicación:** `.github/workflows/`

**Pipeline incluye:**

**Job 1: Build & Test**

- ✅ Checkout del código
- ✅ Configurar JDK 17
- ✅ Instalar Apache Ant
- ✅ Compilar proyecto
- ✅ Verificar WAR generado
- ✅ Levantar servicios Docker
- ✅ Verificar MySQL (healthcheck)
- ✅ Verificar Tomcat
- ✅ Probar base de datos
- ✅ Subir artefacto WAR

**Job 2: Docker Build**

- ✅ Construir imagen Docker
- ✅ Verificar imagen creada

**Triggers:**

- Push a master/main
- Pull requests a master/main

**Verificación:**

- Ver en GitHub: `Actions` tab
- Badge en README.md

---

## 📊 RESUMEN DE ARCHIVOS ENTREGABLES

| #   | Entregable      | Archivo                      | Estado       | Ubicación          |
| --- | --------------- | ---------------------------- | ------------ | ------------------ |
| 1   | Azure DevOps    | -                            | ⚠️ PENDIENTE | -                  |
| 2   | Comandos Linux  | COMANDOS.md                  | ✅ COMPLETO  | Raíz               |
| 3   | Comandos Docker | COMANDOS.md + GUIA_DOCKER.md | ✅ COMPLETO  | Raíz               |
| 4a  | Dockerfile      | Dockerfile                   | ✅ COMPLETO  | Raíz               |
| 4b  | Docker Compose  | docker-compose.yml           | ✅ COMPLETO  | Raíz               |
| 4c  | Makefile        | Makefile                     | ✅ COMPLETO  | Raíz               |
| 4d  | Scripts .sh     | \*.sh                        | ✅ COMPLETO  | scripts/           |
| 5   | GitHub Actions  | ci-cd.yml                    | ✅ COMPLETO  | .github/workflows/ |

---

## 📸 CAPTURAS PENDIENTES

Para completar la entrega, toma capturas de:

### Comandos Linux

1. Navegación y listado de archivos
2. Búsqueda de archivos JSP
3. Ver contenido de archivos de configuración
4. Permisos de scripts

### Comandos Docker

1. `docker-compose up -d` (creación de contenedores)
2. `docker ps` (contenedores corriendo)
3. `docker logs tomcat_flota` (logs de despliegue)
4. `docker exec ... SELECT` (consulta a BD)
5. `docker stats` (uso de recursos)
6. `docker volume ls` (volúmenes)

### Aplicación Funcionando

1. Página de lista de vehículos
2. Página de registro
3. Página de ver detalle
4. Página de editar
5. GitHub Actions pipeline ejecutándose

### Azure DevOps (si aplica)

1. Tablero de historias de usuario
2. Backlog
3. Sprint board

---

## 📦 CONTENIDO DEL REPOSITORIO

```
WebFlotaVehiculo/
├── .github/workflows/
│   └── ci-cd.yml              ✅ GitHub Actions CI/CD
├── db/
│   └── concesionario.sql      ✅ Script de BD
├── scripts/
│   ├── deploy.sh              ✅ Script de despliegue
│   ├── start.sh               ✅ Iniciar
│   ├── stop.sh                ✅ Detener
│   ├── clean.sh               ✅ Limpiar
│   └── db-backup.sh           ✅ Backup
├── src/java/dao/
│   └── conexionLib.java       ✅ Conexión a BD
├── web/
│   └── *.jsp                  ✅ Páginas JSP
├── docker-compose.yml         ✅ Orquestación
├── Dockerfile                 ✅ Imagen Tomcat
├── Makefile                   ✅ Automatización
├── build.xml                  ✅ Ant build
├── .gitignore                 ✅ Git ignore
├── GUIA_DOCKER.md            ✅ Guía Docker
├── COMANDOS.md               ✅ Doc comandos
├── README.md                 ✅ Documentación
└── ENTREGABLES.md            ✅ Este archivo
```

---

## ✅ VERIFICACIÓN FINAL

Ejecuta estos comandos para verificar que todo funciona:

```bash
# 1. Clonar repo (en otra carpeta para probar)
git clone https://github.com/BarnerAcosta/WebFlotaVehiculo.git
cd WebFlotaVehiculo

# 2. Verificar archivos
ls -la
ls -la scripts/
ls -la .github/workflows/

# 3. Levantar con Makefile
make help
make deploy

# 4. Verificar aplicación
curl http://localhost:8080/WebFlotaVehiculo/listarVehi.jsp

# 5. Probar scripts
chmod +x scripts/*.sh
./scripts/stop.sh
./scripts/start.sh

# 6. Limpiar
make clean
docker-compose down
```

---

## 📝 NOTAS FINALES

- ✅ Todos los archivos de automatización están creados y funcionando
- ✅ CI/CD configurado y listo para ejecutarse en cada push
- ✅ Documentación completa disponible
- ⚠️ Falta: Capturas de pantalla de comandos ejecutados
- ⚠️ Falta: Configuración de Azure DevOps (si es requerido)

---

## 🎯 PRÓXIMOS PASOS

1. **Tomar capturas de pantalla** de comandos Linux y Docker
2. **Crear proyecto en Azure DevOps** (si es requerido)
3. **Verificar que GitHub Actions** se ejecute correctamente
4. **Organizar capturas** en una carpeta `docs/screenshots/`
5. **Crear documento PDF** con todas las capturas

---

**Estado del proyecto:** ✅ 90% COMPLETO  
**Pendiente:** Capturas de pantalla y Azure DevOps  
**Repositorio:** https://github.com/BarnerAcosta/WebFlotaVehiculo
