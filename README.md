Wrk in Docker
============

[![GitHub Build Status](https://github.com/satishsverma/wrk/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/satishsverma/wrk/actions/workflows/docker-publish.yml)

## Summary

This repository contains Dockerized [wrk](https://github.com/wg/wrk), published to the public container registry via **automated build** mechanism.


## Configuration

This docker image contains the following software stack:
- [Distroless](https://github.com/GoogleContainerTools/distroless/blob/main/cc/README.md) debian 11
- Basic libgcc stuff.
- wrk

Total image size is less than 30 MB.

### Dependencies

- [`gcr.io/distroless/cc-debian11`](https://github.com/GoogleContainerTools/distroless/blob/main/cc/README.md).

## Installation

Pull latest versions:

```sh
docker pull satishsverma/wrk:latest
```

#### Get help

```sh
docker run --rm satishsverma/wrk
```

## Benchmark Test

#### Simplest example
The simplest case we could run with wrk is:
```sh
docker run --rm satishsverma/wrk -t2 -c5 -d5s -H 'Host: example.com' --timeout 2s http://$APP1_PRIVATE_IP:3000/
```

Which means:
```sh
-t2: Use two separate threads
-c5: Open six connections (the first client is zero)
-d5s: Run the test for five seconds
-H 'Host: example.com': Pass a Host header
--timeout 2s: Define a two-second timeout
http://$APP1_PRIVATE_IP:3000/ The target application is listening on $APP1_PRIVATE_IP:3000
Benchmark the / path of our application
```

#### With Script.

```sh
docker run --rm  -v `pwd`:/data satishsverma/wrk -s script.lua  http://example.com/
```