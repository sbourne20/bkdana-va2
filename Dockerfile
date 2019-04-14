FROM nginx:mainline-alpine
LABEL maintainer="iwan <iwan.budihalim@bkd.id>"
COPY start.sh /start.sh
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf
COPY site.conf /etc/nginx/sites-available/default.conf
COPY /src/. /var/www

RUN apk add --update \
php7 \
php7-tokenizer \
php7-fpm \
php7-pdo \
php7-pdo_mysql \
php7-mcrypt \
php7-mbstring \
php7-xml \
php7-openssl \
php7-json \
php7-phar \
php7-zip \
php7-dom \
php7-session \
php7-zlib && \
php7 -r "copy('http://getcomposer.org/installer', 'composer-setup.php');" && \
php7 composer-setup.php --install-dir=/usr/bin --filename=composer && \
php7 -r "unlink('composer-setup.php');" && \
ln -s /etc/php7/php.ini /etc/php7/conf.d/php.ini

EXPOSE 443 80
WORKDIR /var/www


# CMD ["/start.sh"]

