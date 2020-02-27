FROM golang:1.13 as builder

COPY ./example-plugin/ /example-plugin
RUN cd /example-plugin && go build -buildmode=plugin -o example-plugin.so .

# replace with official krakend:1.1.0 once released
FROM disc/krakend:1.0.0

ENV GIN_MODE=release
CMD ["run", "-d", "-c", "/etc/krakend/krakend.json"]

COPY --from=builder /example-plugin/example-plugin.so /etc/krakend/plugins/
COPY krakend.json /etc/krakend/krakend.json
