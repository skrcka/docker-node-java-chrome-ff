
FROM node:10-alpine

RUN apk update
RUN apk upgrade

#bash
RUN apk add bash
#java
RUN apk add openjdk8-jre

#chromium
RUN apk add chromium

RUN mkdir -p /usr/src/app \
    && adduser -D chrome \
    && chown -R chrome:chrome /usr/src/app

USER chrome
WORKDIR /usr/src/app

ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/
USER root
COPY . .
COPY test.sh /usr/local/bin
