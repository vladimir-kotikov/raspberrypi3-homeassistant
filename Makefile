TAG=vlkoti/raspberrypi3-homeassistant:latest

all: image

image: Dockerfile
	docker build -t $(TAG) .

push:
	docker push $(TAG)
