FROM php:8.2-fpm-bookworm

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    ffmpeg \
    curl 

RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && echo "xdebug.mode=coverage" && echo "max_excution_time=240" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN apt-get install -y nodejs npm

RUN apt-get install poppler-utils -y

RUN apt-get update && apt-get install -y libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick

ARG DOCKER_USER=docker

RUN addgroup --gid 1000 --system $DOCKER_USER && \
    adduser --allow-bad-names --disabled-password --uid 1000 --ingroup $DOCKER_USER --gecos "" $DOCKER_USER

# Change ownership of the application to the www-data user
# RUN chown -R $DOCKER_USER:$DOCKER_USER /var/www/html
USER $DOCKER_USER

EXPOSE 9000