FROM alpine:latest

MAINTAINER Hemanth BITRA<hemanthbitra@live.com>
LABEL Quickly serve static files using Python http.server module.

WORKDIR /usr/app

ADD . /usr/app

RUN echo "Hello World" && \
  apk add python3 && \
  rm -rf /tmp/* && \
  rm -rf /var/cache/* 
EXPOSE 8000
ENTRYPOINT ["python3", "-m", "http.server"]
