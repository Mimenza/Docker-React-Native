# Nombre del contenedor Docker
CONTAINER_NAME = react-native-container
IMAGE_NAME = react-native-environment
PROJECT_DIR = my-app

# Construir la imagen de Docker
build:
	docker build -t $(IMAGE_NAME) .

# Iniciar el contenedor interactivo con el proyecto
start:
	docker run -it -p 8081:8081 --rm --name $(CONTAINER_NAME) -v $(PWD)/$(PROJECT_DIR):/app $(IMAGE_NAME)

# Ejecutar React Native CLI dentro del contenedor
run:
	docker exec -it $(CONTAINER_NAME) npx react-native run-android

# Abrir una shell interactiva en el contenedor
shell:
	docker exec -it $(CONTAINER_NAME) bash

# Crear un nuevo proyecto React Native en el contenedor
init:
	docker exec -it $(CONTAINER_NAME) npx react-native init $(PROJECT_DIR)

# Limpiar el contenedor (detenerlo si está en ejecución)
stop:
	docker stop $(CONTAINER_NAME)

# Eliminar el contenedor
remove:
	docker rm $(CONTAINER_NAME)

# Eliminar la imagen de Docker
clean:
	docker rmi $(IMAGE_NAME)

# Ver el estado del contenedor
status:
	docker ps -a | grep $(CONTAINER_NAME)

# Crear un nuevo proyecto React Native y lanzar el contenedor
create:
	make init
	make start

# Detener y eliminar contenedor
destroy:
	make stop
	make remove

