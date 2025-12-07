# 🚗 WebFlotaVehiculo - Sistema de Gestión de Vehículos

[![CI/CD Pipeline](https://github.com/BarnerAcosta/WebFlotaVehiculo/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/BarnerAcosta/WebFlotaVehiculo/actions)

## 📋 Descripción

Sistema web JSP para la gestión completa de una flota de vehículos con operaciones CRUD (Crear, Leer, Actualizar, Eliminar). Desplegado con Docker para fácil portabilidad y escalabilidad.

## 🛠️ Tecnologías Utilizadas

- **Backend:** Java JSP
- **Base de Datos:** MySQL 5.7 (contenedor Docker)
- **Servidor:** Apache Tomcat 9.0 con JDK 17 (contenedor Docker)
- **Frontend:** Bootstrap, ACE Admin Template, DataTables
- **Orquestación:** Docker Compose
- **Build:** Apache Ant
- **CI/CD:** GitHub Actions

## 🐳 Arquitectura Docker

```
┌─────────────────────────────────────┐
│   Navegador Web                     │
│   http://localhost:8080             │
└──────────────┬──────────────────────┘
               │
               ▼
┌──────────────────────────────────────┐
│  Tomcat Container (tomcat_flota)     │
│  - Puerto: 8080                      │
│  - Imagen: tomcat:9.0-jdk17         │
│  - App: WebFlotaVehiculo.war        │
└──────────────┬───────────────────────┘
               │ Conecta a mysql:3306
               ▼
┌──────────────────────────────────────┐
│  MySQL Container                     │
│  (mysql_concesionario)              │
│  - Puerto: 3306                      │
│  - Imagen: mysql:5.7                │
│  - BD: concesionario                │
│  - Volumen: mysql_data (persistente)│
└──────────────────────────────────────┘
```

## 📁 Estructura del Proyecto

```
WebFlotaVehiculo/
├── .github/
│   └── workflows/
│       └── ci-cd.yml          # Pipeline CI/CD automatizado
│
├── db/
│   └── concesionario.sql      # Script de inicialización MySQL
│
├── scripts/
│   ├── deploy.sh              # Despliegue completo
│   ├── start.sh               # Iniciar contenedores
│   ├── stop.sh                # Detener contenedores
│   ├── clean.sh               # Limpiar proyecto
│   └── db-backup.sh           # Backup de base de datos
│
├── src/
│   └── java/
│       └── dao/
│           └── conexionLib.java    # Gestión de conexiones BD
│
├── web/                       # ⭐ Código fuente JSP (EDITAR AQUÍ)
│   ├── listarVehi.jsp        # Listar vehículos
│   ├── ver_vehiculo.jsp      # Ver detalle
│   ├── editar_vehiculo.jsp   # Editar vehículo
│   ├── eliminar_vehiculo.jsp # Eliminar vehículo
│   ├── registrarVehi.jsp     # Registrar vehículo
│   └── registrarTv.jsp       # Registrar tipo de vehículo
│
├── nbproject/                 # Configuración NetBeans
│
├── .gitignore                 # Archivos ignorados por Git
├── build.xml                  # Script de compilación Apache Ant
├── docker-compose.yml         # Orquestación de contenedores
├── Dockerfile                 # Imagen personalizada Tomcat
├── Makefile                   # Comandos de automatización
│
├── README.md                  # 📖 Este archivo
├── GUIA_DOCKER.md            # 🐳 Guía completa Docker
├── COMANDOS.md               # 💻 Documentación comandos
└── ENTREGABLES.md            # ✅ Checklist de entregables
```

### 📝 Notas sobre la estructura:

- **`web/`** - Código fuente JSP, editar siempre aquí
- **`src/java/`** - Clases Java del proyecto
- **`scripts/`** - Scripts de automatización bash
- **`db/`** - Scripts de base de datos
- **Carpetas ignoradas**: `build/`, `dist/`, `lib/`, `apache-tomcat-*/` (generadas automáticamente)

## 🚀 INICIO RÁPIDO

### Requisitos Previos

- Docker Desktop instalado
- Git instalado
- Apache Ant (opcional, para desarrollo)

### Instalación en 3 pasos

```bash
# 1. Clonar el repositorio
git clone https://github.com/BarnerAcosta/WebFlotaVehiculo.git
cd WebFlotaVehiculo

# 2. Levantar los contenedores
docker-compose up -d

# 3. Esperar 30 segundos y acceder a:
# http://localhost:8080/WebFlotaVehiculo/listarVehi.jsp
```

¡Eso es todo! La aplicación estará corriendo con datos de ejemplo.

---

## 📖 GUÍAS DISPONIBLES

- **[GUIA_DOCKER.md](GUIA_DOCKER.md)** - Guía completa de uso con Docker
- **[COMANDOS.md](COMANDOS.md)** - Documentación de comandos Linux/Docker

---

## 🎯 USO CON MAKEFILE

```bash
# Ver todos los comandos disponibles
make help

# Compilar proyecto
make build

# Desplegar (compilar + reconstruir + levantar)
make deploy

# Iniciar contenedores
make start

# Detener contenedores
make stop

# Ver logs
make logs

# Probar conexión a BD
make test

# Limpiar todo
make clean
```

---

## 🎯 USO CON SCRIPTS

```bash
# Dar permisos (solo en Linux/Mac)
chmod +x scripts/*.sh

# Desplegar aplicación
./scripts/deploy.sh

# Iniciar servicios
./scripts/start.sh

# Detener servicios
./scripts/stop.sh

# Limpiar proyecto
./scripts/clean.sh all

# Backup de base de datos
./scripts/db-backup.sh
```

---

## 🗄️ Base de Datos

### Tablas:

- **vehiculo**: placa (PK), marca, referencia, modelo, id_tv (FK)
- **tipovehi**: IdTv (PK), nomTv

### Acceso directo a MySQL:

```bash
# Conectarse a MySQL
docker exec -it mysql_concesionario mysql -u root concesionario

# Consulta rápida
docker exec -i mysql_concesionario mysql -u root concesionario -e "SELECT * FROM vehiculo;"
```

---

## 🌐 URLs de la Aplicación

| Funcionalidad      | URL                                                                  |
| ------------------ | -------------------------------------------------------------------- |
| Lista de Vehículos | http://localhost:8080/WebFlotaVehiculo/listarVehi.jsp                |
| Registrar Vehículo | http://localhost:8080/WebFlotaVehiculo/registrarVehi.jsp             |
| Ver Detalle        | http://localhost:8080/WebFlotaVehiculo/ver_vehiculo.jsp?placa=ABC123 |
| Tomcat Manager     | http://localhost:8080/manager/html (admin/admin)                     |

---

## 🛠️ DESARROLLO

### Compilar después de cambios

```bash
# Opción 1: Con Makefile
make deploy

# Opción 2: Con comandos Docker
ant dist
docker-compose down
docker-compose build --no-cache
docker-compose up -d

# Opción 3: Con script
./scripts/deploy.sh
```

### Estructura de archivos importantes

```
web/                    ← EDITAR AQUÍ (código fuente JSP)
src/java/dao/          ← Clases Java
dist/                  ← Archivos compilados (generados)
build/                 ← Archivos temporales (generados)
```

**IMPORTANTE:** Siempre edita archivos en `web/`, no en la raíz del proyecto.

---

## 🔄 CI/CD con GitHub Actions

El proyecto incluye un pipeline automatizado que:

✅ Compila el proyecto con Ant  
✅ Construye imágenes Docker  
✅ Ejecuta pruebas de integración  
✅ Verifica que la BD funcione  
✅ Genera artefactos (WAR)

Ver: `.github/workflows/ci-cd.yml`

---

## 📊 VERIFICACIÓN COMPLETA

```bash
# Ver estado de contenedores
docker ps

# Verificar MySQL
docker exec mysql_concesionario mysqladmin -u root ping

# Verificar datos en BD
docker exec -i mysql_concesionario mysql -u root concesionario -e "SELECT COUNT(*) FROM vehiculo;"

# Verificar Tomcat
curl http://localhost:8080

# Verificar aplicación
curl http://localhost:8080/WebFlotaVehiculo/listarVehi.jsp
```

---

## 🗑️ LIMPIAR TODO

```bash
# Detener contenedores (mantiene datos)
docker-compose down

# Eliminar TODO incluyendo datos
docker-compose down -v

# Limpiar archivos compilados
make clean

# Limpiar archivos compilados + datos Docker
make clean-all
```

---

## 📝 Datos de Ejemplo

El proyecto incluye 5 vehículos de prueba:

- Toyota Corolla 2023
- Honda Civic 2022
- Yamaha MT-03 2021
- Ford F-150 2023
- Chevrolet NPR 2020

---

## 🤝 CONTRIBUIR

1. Fork el proyecto
2. Crea una rama (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -m 'Agregar nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un Pull Request

---

## 📄 Licencia

Este proyecto es de código abierto y está disponible bajo la licencia MIT.

---

## 👤 Autor

**BarnerAcosta**  
GitHub: [@BarnerAcosta](https://github.com/BarnerAcosta)

---

## 📞 Soporte

Si encuentras algún problema:

1. Revisa la [GUIA_DOCKER.md](GUIA_DOCKER.md)
2. Consulta [COMANDOS.md](COMANDOS.md)
3. Abre un issue en GitHub

---

**Última actualización:** 7 de diciembre de 2025

1. **Acceder a phpMyAdmin:**

   ```
   http://localhost/phpmyadmin
   ```

2. **Verificar tablas:**
   - Seleccionar base de datos **"concesionario"**
   - Confirmar que existen las tablas:
     - `vehiculo`
     - `tipovehi`

### **PASO 3: Iniciar Tomcat (Servidor de Aplicaciones) 🖥️**

1. **Abrir Command Prompt:**

   - Presionar `Windows + R`
   - Escribir `cmd` y presionar Enter

2. **Ejecutar script de Tomcat:**

   ```cmd
   "C:\Users\barne\OneDrive\Desktop\JAVA\JSP\WebFlotaVehiculo\INICIAR_TOMCAT_PERSISTENTE.bat"
   ```

   copy "C:\Users\barne\OneDrive\Desktop\JAVA\JSP\WebFlotaVehiculo\web\*.jsp" "C:\Users\barne\OneDrive\Desktop\JAVA\JSP\WebFlotaVehiculo\apache-tomcat-9.0.83\webapps\WebFlotaVehiculo\" && echo "✅ Archivos copiados correctamente - Listo para probar"

3. **Esperar inicialización:**
   - Esperar mensaje: "Server startup in [XXXX] milliseconds"
   - **⚠️ IMPORTANTE: NO cerrar esta ventana**
   - La ventana debe permanecer abierta mientras uses la aplicación

### **PASO 4: Acceder a la Aplicación 🌐**

1. **Esperar 15-20 segundos** después del inicio de Tomcat

2. **Abrir navegador** y acceder a:
   ```
   http://localhost:8080/WebFlotaVehiculo/listarVehi.jsp
   ```

## 🌐 URLs DE LA APLICACIÓN

### Páginas Principales

| Funcionalidad                  | URL                                                        |
| ------------------------------ | ---------------------------------------------------------- |
| **Lista de Vehículos**         | `http://localhost:8080/WebFlotaVehiculo/listarVehi.jsp`    |
| **Registrar Vehículo**         | `http://localhost:8080/WebFlotaVehiculo/registrarVehi.jsp` |
| **Registrar Tipo de Vehículo** | `http://localhost:8080/WebFlotaVehiculo/registrarTv.jsp`   |

### Páginas de Gestión

| Acción                | URL                               | Descripción                     |
| --------------------- | --------------------------------- | ------------------------------- |
| **Ver Vehículo**      | `ver_vehiculo.jsp?placa=XXX`      | Detalles completos del vehículo |
| **Editar Vehículo**   | `editar_vehiculo.jsp?placa=XXX`   | Formulario de edición           |
| **Eliminar Vehículo** | `eliminar_vehiculo.jsp?placa=XXX` | Confirmación de eliminación     |

## 🔧 FUNCIONALIDADES

### ✅ Operaciones CRUD Completas

#### **CREAR (Create)**

- ➕ Registrar nuevos vehículos
- ➕ Registrar nuevos tipos de vehículos

#### **LEER (Read)**

- 📋 Ver lista completa de vehículos
- 👁️ Ver detalles de cada vehículo
- 🔍 Buscar y filtrar vehículos

#### **ACTUALIZAR (Update)**

- ✏️ Editar cualquier vehículo (botón verde)
- 🔄 Modificar placa, marca, referencia, modelo y tipo

#### **ELIMINAR (Delete)**

- 🗑️ Eliminar vehículos (botón rojo)
- ⚠️ Confirmación de seguridad antes de eliminar

### 🎨 Interfaz de Usuario

- **Template:** Bootstrap + ACE Admin
- **Responsive Design:** Compatible con móviles y escritorio
- **DataTables:** Ordenar, buscar y paginar
- **Botones de Acción:** Ver (azul), Editar (verde), Eliminar (rojo)

## 🛑 PARAR LA APLICACIÓN

### Orden de Parada:

1. **Parar Tomcat:**

   - Cerrar la ventana de Command Prompt donde está ejecutándose
   - O presionar `Ctrl + C` en esa ventana

2. **Parar XAMPP:**
   - En XAMPP Control Panel: clic en "Stop" para MySQL
   - En XAMPP Control Panel: clic en "Stop" para Apache

## ⚠️ SOLUCIÓN DE PROBLEMAS

### XAMPP no inicia

```bash
# Soluciones:
- Ejecutar XAMPP como administrador
- Verificar que no haya otros servicios web ejecutándose
- Cambiar puertos si hay conflictos (80, 443, 3306)
```

### Tomcat da error de variables de entorno

```bash
# El script INICIAR_TOMCAT_PERSISTENTE.bat resuelve esto automáticamente
# Si persiste el problema, verificar:
- JAVA_HOME: C:\Program Files\Java\jdk-24
- CATALINA_HOME: [ruta del proyecto]\apache-tomcat-9.0.83
```

### Aplicación no carga

```bash
# Verificar en orden:
1. XAMPP: Apache y MySQL en "Running" (verde)
2. Tomcat: Mensaje "Server startup completed"
3. Esperar 15-20 segundos para inicialización completa
4. Verificar URL: http://localhost:8080/WebFlotaVehiculo/
```

### Error de conexión a base de datos

```bash
# Verificar:
- MySQL ejecutándose en XAMPP
- Base de datos "concesionario" existe
- Tablas "vehiculo" y "tipovehi" existen
- Usuario: root, Contraseña: (vacía)
```

## 🔧 CONFIGURACIÓN AVANZADA

### Cambiar Foto de Usuario

1. Ir a: `apache-tomcat-9.0.83\webapps\WebFlotaVehiculo\assets\images\avatars\`
2. Colocar imagen con nombre `mi_foto.jpg`
3. Tamaño recomendado: 64x64 píxeles

### Personalizar Base de Datos

Archivo de configuración en cada JSP:

```java
String url = "jdbc:mysql://localhost:3306/concesionario";
String usuario = "root";
String password = "";
```

## 📊 DATOS DE EJEMPLO

### Tipos de Vehículos por Defecto:

- Automóvil
- Motocicleta
- Camión
- Bus

### Vehículos de Ejemplo:

- **ABC123** - Toyota Corolla (2023) - Automóvil
- **DEF456** - Yamaha MT-03 (2021) - Motocicleta
- **GHI789** - Chevrolet Spark GT (2020) - Automóvil

## 🏗️ ARQUITECTURA

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Navegador     │    │   Tomcat 9.0    │    │   MySQL         │
│   (Frontend)    │◄──►│   (JSP Server)  │◄──►│   (Database)    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
        │                       │                       │
        │                       │                       │
    Bootstrap              Java JSP             Base de Datos
    ACE Template          Servlets              "concesionario"
```

## 📞 SOPORTE

### Archivos de Log

- **Tomcat:** `apache-tomcat-9.0.83\logs\catalina.YYYY-MM-DD.log`
- **XAMPP:** Panel de control muestra estado de servicios

### Scripts Útiles

- **`INICIAR_TOMCAT_PERSISTENTE.bat`** - Inicia Tomcat y mantiene activo
- **`INICIAR_TOMCAT_MEJORADO.bat`** - Script alternativo
- **`INICIAR_TOMCAT.bat`** - Script básico

## 📝 NOTAS IMPORTANTES

1. **Orden de inicio:** XAMPP primero, luego Tomcat
2. **Mantener ventanas abiertas:** No cerrar Command Prompt de Tomcat
3. **Tiempo de carga:** Esperar 15-20 segundos después de iniciar Tomcat
4. **Navegador recomendado:** Chrome, Firefox, Edge
5. **Puertos usados:** 8080 (Tomcat), 80 (Apache), 3306 (MySQL)

## 🎯 ESTADO DEL PROYECTO

- ✅ **Completamente funcional**
- ✅ **CRUD implementado**
- ✅ **Interfaz profesional**
- ✅ **Base de datos conectada**
- ✅ **Scripts de inicio automático**
- ✅ **Manejo de errores robusto**

---

## 📅 Información del Proyecto

- **Fecha de Última Actualización:** Octubre 2, 2026
- **Versión:** 1.0
- **Desarrollador:** Barner Acosta Ramirez (SoBar)
- **Empresa:** SoWil Company

---

### 🚀 ¡Tu Sistema de Gestión de Vehículos está listo para usar!

Sigue los pasos en orden y tendrás una aplicación web completamente funcional para gestionar tu flota de vehículos.

## 🚀 Cómo ejecutar el proyecto

1. **Clona este repositorio desde GitHub:**

   ```
   git clone https://github.com/tu-usuario/WebFlotaVehiculo.git
   ```

   (Reemplaza la URL por la de tu repositorio una vez subido)

2. **Restaura la base de datos MySQL:**

   - Abre tu gestor de MySQL (por ejemplo, phpMyAdmin o consola de MySQL).
   - Crea una base de datos nueva (por ejemplo, `flotavehiculo`).
   - Importa el archivo `database_setup.sql` incluido en el proyecto.

3. **Configura la conexión a la base de datos en el proyecto:**

   - Verifica que los parámetros de conexión (usuario, contraseña, nombre de la base) en el código fuente coincidan con tu entorno local.

4. **Inicia el servidor Tomcat:**
   - Ejecuta el script `INICIAR_TOMCAT_PERSISTENTE.bat` o inicia Tomcat manualmente.
   - Accede a la aplicación desde tu navegador en: `http://localhost:8080/WebFlotaVehiculo/web/index.jsp`

## 📦 Archivo de base de datos

El archivo `database_setup.sql` contiene la estructura y datos iniciales necesarios para probar el sistema.

## 📞 Contacto

Para dudas o problemas, contacta al desarrollador.
