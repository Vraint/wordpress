ARG WORDPRESS_VERSION=6.7.2
FROM wordpress:${WORDPRESS_VERSION}-php8.3-apache

COPY custom.ini $PHP_INI_DIR/conf.d/

RUN apt update \
&& apt install -y --no-install-recommends libmemcached-dev zlib1g-dev libxml2-dev libssl-dev pkg-config  \
&& docker-php-ext-install soap \
&& pecl install -f memcached redis apcu \
&& docker-php-ext-enable memcached redis apcu \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*