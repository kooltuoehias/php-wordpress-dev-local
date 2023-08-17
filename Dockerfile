FROM debian:stable
RUN apt-get update 
RUN apt-get install -y \
    vim \
    nginx \
    mariadb-server php-fpm php-mysql \
    php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip \
    curl
RUN mkdir mkdir /var/www/wordpress.dev.local
RUN chown -R $USER:$USER /var/www/wordpress.dev.local
COPY wordpress.dev.local /etc/nginx/sites-available/wordpress.dev.local
RUN  ln -s /etc/nginx/sites-available/wordpress.dev.local /etc/nginx/sites-enabled/
RUN curl -SL https://wordpress.org/latest.tar.gz | tar xzC /tmp
COPY wp-config.php /tmp/wordpress/wp-config.php
RUN cp -a /tmp/wordpress/. /var/www/wordpress.dev.local
RUN chown -R www-data:www-data /var/www/wordpress.dev.local
ADD init.sh /usr/local/bin/init.sh
ADD wp.sql /usr/local/etc/wp.sql
RUN chmod 777 /usr/local/bin/init.sh
CMD /usr/local/bin/init.sh