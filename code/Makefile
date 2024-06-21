DOCKER_STACK = high-interaction-honeypot

setup: create_dirs cert
	@echo "First time setup done(dont call this agin)!"

create_dirs:
	@echo "First time setup..."
	mkdir -p /app/panel/certs/

cert:
	@echo "Generating SSL Certificate..."
	sudo openssl req -x509 -sha256 -nodes -days 4096 -newkey rsa:2048 -keyout /app/panel/certs/panel.key -out /app/panel/certs/panel.crt -subj "/C=US/ST=CSPF/L=CSPF/O=Dis/CN=honeypot"
	@echo "SSL Generated"

up:
	@echo "Starting containers..."
	sudo docker compose -p ${DOCKER_STACK} up -d
	@echo "Containers started!"

#up_build: starts all containers in the background and recreates them
up_build:
	@echo "Stopping containers..."
	sudo docker compose -p ${DOCKER_STACK} down
	@echo "Building (when required) and Starting containers..."
	sudo docker compose -p ${DOCKER_STACK} up -d --build
	@echo "sudo docker images build and containers started!"

# down: stops all containers
down:
	@echo "Stopping containers..."
	sudo docker compose -p ${DOCKER_STACK} down
	@echo "Containers stopped!"
