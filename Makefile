.PHONY: plugins docker run

all: plugins docker

plugins:
	cd example-plugin && go build -buildmode=plugin -o ../plugins/example-plugin.so plugin.go
	go build -buildmode=plugin -o plugins/router-plugin.so ./router-plugin
	go build -buildmode=plugin -o plugins/proxy-plugin.so ./proxy-plugin

docker:
	docker build -t hands-on-krakend:v1.0.0 .

run: docker
	docker run -p 8080:8080 -p 8090:8090 hands-on-krakend:v1.0.0
