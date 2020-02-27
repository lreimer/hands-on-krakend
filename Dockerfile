FROM golang:1.12 as builder

COPY ./example-plugin/ /example-plugin
RUN cd /example-plugin && go build -buildmode=plugin -o example-plugin.so .

FROM devopsfaith/krakend:1.0.0

COPY --from=builder /example-plugin/example-plugin.so /etc/krakend/plugins/
COPY krakend.json /etc/krakend/krakend.json
