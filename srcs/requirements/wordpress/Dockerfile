FROM debian:bullseye

EXPOSE 9000

# Update and upgrade packages, then install packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y php7.4-mysql php7.4-fpm mariadb-client curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/

RUN mkdir -p /run/php
RUN sed -i "s/listen.*/listen = wordpress:9000/" /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/configure.sh /var/www/
RUN chmod +x /var/www/configure.sh



ENTRYPOINT ["/var/www/configure.sh"]
CMD ["php-fpm7.4", "-F"]