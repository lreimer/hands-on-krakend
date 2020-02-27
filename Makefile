.PHONY: plugin docker

all: plugin docker

plugin:
	GOOS=linux GOARCH=amd64 go build -buildmode=plugin -o example-plugin.so ./example-plugin

docker:
	docker build -t hands-on-krakend:v1.0.0 .
