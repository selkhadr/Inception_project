FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    php8.2 \
    php-fpm \
    php-cli \
    php8.2-fpm \
    wget \
    curl \
    php-mysql \
    php-mbstring \
    php-xml \
    php-redis \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /run/php\
    && sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

WORKDIR	 /var/www/html/wordpress

RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY tools/auto_config.sh /auto_config.sh


ENTRYPOINT [ "sh", "/auto_config.sh" ]

CMD ["php-fpm8.2", "-F"]
