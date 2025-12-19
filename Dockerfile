FROM php:8.2-apache

RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN a2enmod rewrite

# Alterar DocumentRoot para /painel
RUN sed -ri 's!/var/www/html!/var/www/html/painel!g' \
    /etc/apache2/sites-available/*.conf \
    /etc/apache2/apache2.conf

COPY . /var/www/html/painel

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
