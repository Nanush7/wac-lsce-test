#######################
# VOLUME NOT INCLUDED #
#######################

FROM php:8.1-apache
LABEL maintainer="Nanush7"
LABEL version="6.0.4"

# Download LimeSurvey CE.
ARG LSCE_VERSION="6.0.4+230427"
ARG LSCE_DOWNLOAD_URL="https://github.com/LimeSurvey/LimeSurvey/archive/${LSCE_VERSION}.tar.gz"
ARG LSCE_CHECKSUM="05f95ba3d0591402263cc9bf5b9fdb8603f6dba3ece2dbf1be795ad7ba7fa8c2"
RUN curl -sSL "${LSCE_DOWNLOAD_URL}" --output "/tmp/limesurvey.tar.gz" && \
        echo "${LSCE_CHECKSUM} /tmp/limesurvey.tar.gz" | sha256sum -c - && \
        tar xzf "/tmp/limesurvey.tar.gz" --strip-components=1 -C /var/www/html/
RUN bash -c "rm -f /tmp/limesurvey.tar.gz"

# Set permissions.
WORKDIR /var/www/html
RUN chmod 777 application/config
RUN chmod -R 777 tmp
RUN chmod -R 777 upload

# Install PHP extensions.
RUN apt-get update && apt-get install -y \
        libldap2-dev \
        libfreetype6-dev \
        libjpeg-dev \
        libonig-dev \
        zlib1g-dev \
        libc-client-dev \
        libkrb5-dev \
        libpng-dev \
        libpq-dev \
        libzip-dev \
        libtidy-dev \
        libsodium-dev \
        curl \
        \
        && apt-get -y autoclean; apt-get -y autoremove; \
        rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
        docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
	    docker-php-ext-install -j$(nproc) \
        exif \
        gd \
        imap \
        ldap \
        mbstring \
        pdo \
        pdo_mysql \
        sodium \
        tidy \
        zip

EXPOSE 80
