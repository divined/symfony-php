ARG FROM_TAG

FROM wodby/php:${FROM_TAG}

ENV WODBY_DIR_FILES="/mnt/files" \
    WODBY_DIR_CONF="/var/www/conf" \
    PHP_REALPATH_CACHE_TTL="3600" \
    PHP_OUTPUT_BUFFERING="16384" \

USER root

RUN set -ex && \
    mkdir -p /usr/local/bin && \
    curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
    chmod a+x /usr/local/bin/symfony
