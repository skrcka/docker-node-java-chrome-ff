
FROM node:10-alpine

RUN apk update
RUN apk upgrade

#bash
RUN apk add bash
#java
RUN apk add openjdk8-jre

#firefox
RUN \
# Use edge repos
echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories && \
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update && apk upgrade && \
    apk add firefox


COPY . .
COPY test.sh /usr/local/bin