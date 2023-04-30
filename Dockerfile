#######################
# VOLUME NOT INCLUDED #
#######################

FROM php:8.1-apache
LABEL maintainer="Nanush7"
LABEL version="6.0.4"

RUN apt-get update && apt-get install -y unzip

# Download LimeSurvey CE.
ARG LSCE_DOWNLOAD_URL="https://download.limesurvey.org/latest-master/limesurvey6.0.4+230427.zip"
ARG LSCE_CHECKSUM="ccac5691b31795e9dec6cfd6c06270955f40d483529a8dde614ba3413cf46399"
RUN curl -sSL "${LSCE_DOWNLOAD_URL}" --output "/tmp/limesurvey.zip" && \
        echo "${LSCE_CHECKSUM} /tmp/limesurvey.zip" | sha256sum -c - && \
        unzip -q "/tmp/limesurvey.zip"
RUN bash -c "mv limesurvey/* ."
RUN bash -c "rm -f /tmp/limesurvey.zip && rm -rf limesurvey"

# Set permissions.
WORKDIR /var/www/html
RUN chmod 777 application/config
RUN chmod -R 777 tmp
RUN chmod -R 777 upload

# Install PHP extensions.
RUN apt-get install -y \
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
