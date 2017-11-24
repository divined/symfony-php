ARG FROM_TAG

FROM wodby/php:${FROM_TAG}

ENV WODBY_DIR_FILES="/mnt/files" \
    WODBY_DIR_CONF="/var/www/conf" \

    PHP_REALPATH_CACHE_TTL="3600" \
    PHP_OUTPUT_BUFFERING="16384" \

    DRUSH_PATCHFILE_URL="https://bitbucket.org/davereid/drush-patchfile.git"

USER root

RUN set -ex && \
    mkdir -p /usr/local/bin && \
    curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
    chmod a+x /usr/local/bin/symfony && \
    mv /usr/local/bin/actions.mk /usr/local/bin/php.mk && \
    # Change overridden target name to avoid warnings.
    sed -i 's/git-checkout:/php-git-checkout:/' /usr/local/bin/php.mk && \
    mkdir -p $WODBY_DIR_FILES $WODBY_DIR_CONF && \
    chown www-data:www-data $WODBY_DIR_CONF

USER www-data

COPY templates /etc/gotpl/
COPY actions /usr/local/bin
COPY init /docker-entrypoint-init.d/
