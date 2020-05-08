FROM debian:9

ARG VERSION

RUN apt-get update && apt-get install curl tar -y

RUN curl -L https://github.com/FairwindsOps/pluto/releases/download/v${VERSION}/pluto_${VERSION}_linux_amd64.tar.gz \
  -o /tmp/pluto.tar.gz \
  && tar xvfz /tmp/pluto.tar.gz -C /tmp \
  && mv /tmp/pluto /usr/local/bin/pluto \
  && chmod +x /usr/local/bin/pluto

ENTRYPOINT ["/usr/local/bin/pluto"]
