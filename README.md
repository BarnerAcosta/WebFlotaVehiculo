# 🚗 WebFlotaVehiculo - Sistema de Gestión de Vehículos

## 📋 Descripción

Sistema web JSP para la gestión completa de una flota de vehículos con operaciones CRUD (Crear, Leer, Actualizar, Eliminar). Incluye interfaz profesional con Bootstrap/ACE y conexión directa a base de datos MySQL.

## 🛠️ Tecnologías Utilizadas

- **Backend:** Java JSP
- **Base de Datos:** MySQL (via XAMPP)
- **Servidor:** Apache Tomcat 9.0.83
- **Frontend:** Bootstrap, ACE Admin Template
- **IDE Recomendado:** IntelliJ IDEA / NetBeans

## 📁 Estructura del Proyecto

```
WebFlotaVehiculo/
├── apache-tomcat-9.0.83/           # Servidor Tomcat
├── src/java/                       # Código fuente Java
├── web/                            # Archivos JSP y recursos web
├── lib/                            # Librerías JAR
├── INICIAR_TOMCAT_PERSISTENTE.bat  # Script para iniciar Tomcat
└── README.md                       # Este archivo
```

## 🗄️ Base de Datos

### Tablas Principales:
- **vehiculo**: Almacena información de vehículos (placa, marca, referencia, modelo, id_tv)
- **tipovehi**: Tipos de vehículos (IdTv, nomTv)

### Configuración:
- **Host:** localhost:3306
- **Base de Datos:** concesionario
- **Usuario:** root
- **Contraseña:** (vacía)

## 🚀 INSTALACIÓN Y CONFIGURACIÓN

### Requisitos Previos

1. **Java JDK 24** instalado
2. **XAMPP** instalado y configurado
3. **Windows 10/11**

### Verificar Instalación de Java

```cmd
java -version
```

Debe mostrar: `java version "24.0.2"`

## 📝 PASO A PASO PARA EJECUTAR LA APLICACIÓN

### **PASO 1: Iniciar XAMPP (Base de Datos) 🗄️**

1. **Abrir XAMPP Control Panel:**
   - Buscar "XAMPP Control Panel" en el menú de inicio
   - Ejecutar como administrador (recomendado)

2. **Iniciar servicios necesarios:**
   - Hacer clic en **"Start"** junto a **Apache**
   - Hacer clic en **"Start"** junto a **MySQL**
   - Ambos deben mostrar "Running" en verde

3. **Verificar funcionamiento:**
   - Ir a: `http://localhost/phpmyadmin`
   - Verificar que existe la base de datos **"concesionario"**

### **PASO 2: Verificar la Base de Datos 📊**

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

| Funcionalidad | URL |
|---------------|-----|
| **Lista de Vehículos** | `http://localhost:8080/WebFlotaVehiculo/listarVehi.jsp` |
| **Registrar Vehículo** | `http://localhost:8080/WebFlotaVehiculo/registrarVehi.jsp` |
| **Registrar Tipo de Vehículo** | `http://localhost:8080/WebFlotaVehiculo/registrarTv.jsp` |

### Páginas de Gestión

| Acción | URL | Descripción |
|--------|-----|-------------|
| **Ver Vehículo** | `ver_vehiculo.jsp?placa=XXX` | Detalles completos del vehículo |
| **Editar Vehículo** | `editar_vehiculo.jsp?placa=XXX` | Formulario de edición |
| **Eliminar Vehículo** | `eliminar_vehiculo.jsp?placa=XXX` | Confirmación de eliminación |

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
