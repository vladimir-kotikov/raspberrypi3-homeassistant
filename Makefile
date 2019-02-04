TAG=vlkoti/raspberrypi3-homeassistant:latest

all: image

image: Dockerfile
	docker build -t $(TAG) .

deploy:
	docker-compose up -d homeassistant

push:
	docker push $(TAG)
