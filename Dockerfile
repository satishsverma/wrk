# Docker image for wrk: Modern HTTP benchmarking tool.
#
# Reference:  https://github.com/wg/wrk
#
# Version     4.2.0
#

FROM debian:11.6 AS build

ENV VERSION=4.2.0
ENV TARBALL=https://github.com/wg/wrk/archive/$VERSION.tar.gz

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update  && \
    echo "==> Install curl & helper tools..."  && \
    apt-get install -y --force-yes -q --no-install-recommends curl make gcc build-essential libssl-dev unzip

RUN echo "==> Download & compile..."  && \
    cd /tmp  && \
    curl -L --insecure $TARBALL -o wrk-src.tar.gz && \
    tar xvzf wrk-src.tar.gz

RUN cd /tmp/wrk-$VERSION  && \
    make       && \
    cp wrk /

FROM gcr.io/distroless/cc-debian11
COPY --from=build /wrk /

WORKDIR /data

ENTRYPOINT ["/wrk"]

CMD [ "--help" ]