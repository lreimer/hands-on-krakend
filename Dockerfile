FROM golang:1.16.4 as builder

COPY ./example-plugin/ /example-plugin
RUN cd /example-plugin && go build -buildmode=plugin -o example-plugin.so .

COPY ./router-plugin/ /router-plugin
RUN cd /router-plugin && go build -buildmode=plugin -o router-plugin.so .

COPY ./proxy-plugin/ /proxy-plugin
RUN cd /proxy-plugin && go build -buildmode=plugin -o proxy-plugin.so .

FROM devopsfaith/krakend:1.4.1

EXPOSE 8080 8090
ENV GIN_MODE=release
CMD ["run", "-d", "-c", "/etc/krakend/krakend.json"]

COPY --from=builder /example-plugin/example-plugin.so /etc/krakend/plugins/
COPY --from=builder /router-plugin/router-plugin.so /etc/krakend/plugins/
COPY --from=builder /proxy-plugin/proxy-plugin.so /etc/krakend/plugins/

COPY krakend.json /etc/krakend/krakend.json
