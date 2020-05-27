FROM php:7.3.6-fpm-alpine3.9

RUN apk add --no-cache openssl bash mysql-client nodejs npm
RUN docker-php-ext-install pdo pdo_mysql

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

#RUN pecl install swoole \ 
#&& docker-php-ext-enable swoole
#Copyr the file in project called 9501 to the path inside the image
#COPY index.php /var/www
#EXPOSE the port 9501 to 9501 in docker

#Set the initial path to the path inside workdir, inside container
WORKDIR /var/www
#Remover volder html from container
RUN rm -rf /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local

#RUN composer install && \
#            cp .env.example .env && \
#            php artisan key:generate && \
#            php artisan config:cache
#COPY all files of the path
#COPY . /var/www

#Link folder public of laravel with folder html inside container
RUN ln -s public html

EXPOSE 9000
#Comands when container starts
ENTRYPOINT ["php-fpm"]