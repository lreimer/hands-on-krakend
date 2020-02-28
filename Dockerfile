FROM golang:1.13 as builder

COPY ./router-plugin/ /router-plugin
RUN cd /router-plugin && go build -buildmode=plugin -o router-plugin.so .

COPY ./proxy-plugin/ /proxy-plugin
RUN cd /proxy-plugin && go build -buildmode=plugin -o proxy-plugin.so .

# replace with official krakend:1.1.0 once released
FROM disc/krakend:1.0.0

ENV GIN_MODE=release
CMD ["run", "-d", "-c", "/etc/krakend/krakend.json"]

COPY --from=builder /router-plugin/router-plugin.so /etc/krakend/plugins/
COPY --from=builder /proxy-plugin/proxy-plugin.so /etc/krakend/plugins/

COPY krakend.json /etc/krakend/krakend.json
