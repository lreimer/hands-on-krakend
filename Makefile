.PHONY: plugin docker run

all: plugin docker

plugin:
	go build -buildmode=plugin -o example-plugin.so ./example-plugin

docker:
	docker build -t hands-on-krakend:v1.0.0 .

run: docker
	docker run -p 8080:8080 hands-on-krakend:v1.0.0
