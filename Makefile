# Makefile para WebFlotaVehiculo
# Automatiza la compilación, despliegue y gestión de contenedores Docker

.PHONY: help build start stop restart clean logs test deploy down up rebuild

# Variables
COMPOSE = docker-compose
ANT = ant
PROJECT_NAME = WebFlotaVehiculo

# Ayuda - Muestra todos los comandos disponibles
help:
	@echo "=========================================="
	@echo "  WebFlotaVehiculo - Comandos Makefile"
	@echo "=========================================="
	@echo ""
	@echo "Comandos disponibles:"
	@echo "  make build      - Compilar el proyecto con Ant"
	@echo "  make start      - Iniciar contenedores Docker"
	@echo "  make stop       - Detener contenedores Docker"
	@echo "  make restart    - Reiniciar contenedores"
	@echo "  make logs       - Ver logs de los contenedores"
	@echo "  make deploy     - Compilar y desplegar (build + restart)"
	@echo "  make rebuild    - Reconstruir todo desde cero"
	@echo "  make clean      - Limpiar archivos compilados"
	@echo "  make down       - Detener y eliminar contenedores"
	@echo "  make test       - Probar conexión a la base de datos"
	@echo "  make status     - Ver estado de contenedores"
	@echo ""

# Compilar el proyecto con Ant
build:
	@echo "Compilando $(PROJECT_NAME)..."
	$(ANT) dist
	@echo "✅ Compilación completada"

# Iniciar contenedores
start:
	@echo "Iniciando contenedores..."
	$(COMPOSE) start
	@echo "✅ Contenedores iniciados"

# Levantar contenedores (primera vez o después de down)
up:
	@echo "Levantando contenedores..."
	$(COMPOSE) up -d
	@echo "⏳ Esperando 30 segundos para que Tomcat despliegue..."
	@timeout /t 30 /nobreak > nul
	@echo "✅ Aplicación lista en http://localhost:8080/WebFlotaVehiculo/listarVehi.jsp"

# Detener contenedores
stop:
	@echo "Deteniendo contenedores..."
	$(COMPOSE) stop
	@echo "✅ Contenedores detenidos"

# Detener y eliminar contenedores (mantiene datos)
down:
	@echo "Deteniendo y eliminando contenedores..."
	$(COMPOSE) down
	@echo "✅ Contenedores eliminados (datos preservados)"

# Reiniciar contenedores
restart: stop start

# Compilar y desplegar
deploy: build down
	@echo "Reconstruyendo imagen de Tomcat..."
	$(COMPOSE) build --no-cache
	@$(MAKE) up
	@echo "✅ Despliegue completado"

# Reconstruir todo desde cero
rebuild: clean deploy

# Ver logs de los contenedores
logs:
	@echo "Mostrando logs (Ctrl+C para salir)..."
	$(COMPOSE) logs -f

# Ver estado de contenedores
status:
	@echo "Estado de contenedores:"
	docker ps -a | findstr "$(PROJECT_NAME)\|CONTAINER"

# Probar conexión a base de datos
test:
	@echo "Probando conexión a MySQL..."
	docker exec mysql_concesionario mysqladmin -u root ping
	@echo "Verificando datos..."
	docker exec -i mysql_concesionario mysql -u root concesionario -e "SELECT COUNT(*) as total_vehiculos FROM vehiculo;"
	@echo "✅ Base de datos funcionando correctamente"

# Limpiar archivos compilados
clean:
	@echo "Limpiando archivos compilados..."
	$(ANT) clean
	@if exist build rmdir /s /q build
	@if exist dist rmdir /s /q dist
	@echo "✅ Limpieza completada"

# Limpiar todo incluyendo datos de Docker
clean-all: clean
	@echo "⚠️  ADVERTENCIA: Esto eliminará todos los datos de la base de datos"
	@echo "Presiona Ctrl+C para cancelar o espera 5 segundos..."
	@timeout /t 5 /nobreak
	$(COMPOSE) down -v
	@echo "✅ Todo limpiado (incluyendo datos)"

# Acceso rápido a la base de datos
db:
	@echo "Conectando a MySQL..."
	docker exec -it mysql_concesionario mysql -u root concesionario

# Ver todos los vehículos
list-vehicles:
	@echo "Lista de vehículos en la base de datos:"
	docker exec -i mysql_concesionario mysql -u root concesionario -e "SELECT v.placa, v.marca, v.referencia, v.modelo, t.nomTv as tipo FROM vehiculo v INNER JOIN tipovehi t ON v.id_tv = t.IdTv;"
