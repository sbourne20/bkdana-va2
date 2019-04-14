FROM nginx:mainline-alpine
LABEL maintainer="iwan <iwan.budihalim@bkd.id>"
COPY site.conf /site.conf

EXPOSE 443 80
WORKDIR /var/www
