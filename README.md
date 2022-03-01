# Hands on KrakenD

Demo repository for KrakenD API Gateway plugin showcase.

## Usage

When compiling the plugins, make sure to use the same Go version which Krakend has
been compiled with. Best to use a Dockerized build.

```bash
make docker
```

For quick and easy local development, you can use Tilt to continuously build and
deploy Krakend to a local Kubernetes cluster.

```bash
$ tilt up
```

## Maintainer

M.-Leander Reimer (@lreimer), <mario-leander.reimer@qaware.de>

## License

This software is provided under the MIT open source license, read the `LICENSE`
file for details.
