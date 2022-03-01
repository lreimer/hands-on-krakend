.PHONY: plugins docker run

all: plugins docker

plugins:
	cd example-plugin && go build -buildmode=plugin -o ../plugins/example-plugin.so .
	cd router-plugin && go build -buildmode=plugin -o ../plugins/router-plugin.so .
	cd proxy-plugin && go build -buildmode=plugin -o ../plugins/proxy-plugin.so .

docker:
	docker build -t hands-on-krakend .

run: docker
	docker run -p 8080:8080 -p 8090:8090 hands-on-krakend
