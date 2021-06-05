# Dockerfile
FROM php:8.0-apache

RUN echo 'Start...'

#RUN docker-php-ext-install mysqli

LABEL maintainer="https://github.com/Max-42"

LABEL maintainer="max@oppermann.fun"

#Not important if you not using the same reverse proxy
ENV VIRTUAL_HOST=docs.example.com
ENV LETSENCRYPT_HOST=docs.example.com

COPY ./config/000-default.conf /etc/apache2/sites-available/000-default.conf

COPY ./config/apache2.conf  /etc/apache2/apache2.conf


RUN a2enmod rewrite

COPY ./src /var/www/
RUN chown -R www-data:www-data /var/www

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
