FROM nginx:mainline-alpine
LABEL maintainer="iwan <iwan.budihalim@bkd.id>"
FROM php:7.2-apache

WORKDIR /var/www

COPY start.sh /start.sh
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf
COPY site.conf /etc/nginx/sites-available/default.conf
COPY start.sh /var/www
COPY --from=build /src /var/www


EXPOSE 443 80
WORKDIR /var/www


# CMD ["/start.sh"]

