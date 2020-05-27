FROM nginx:1.15.0-alpine

#Remove default file from nginx to configure php-fpm
RUN rm /etc/nginx/conf.d/default.conf
RUN apk add --no-cache bash

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

COPY ./nginx.conf /etc/nginx/conf.d

# ADD ./nginxteste.conf /etc/nginx/
