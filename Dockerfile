FROM php:5.6.27-fpm

RUN apt-get update \
  && apt-get install -y \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    libxslt1-dev \
    git \
    vim \
    wget \
    lynx \
    psmisc \
    php5-imagick \
    imagemagick \
    yui-compressor \
    jpegoptim \
  && apt-get clean

RUN docker-php-ext-configure \
    gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/; \
  docker-php-ext-install \
    gd \
    intl \
    mbstring \
    mcrypt \
    pdo_mysql \
    xsl \
    zip \
    opcache \
    soap

# Install Composer
RUN curl -sS https://getcomposer.org/installer | \
    php -- \
      --install-dir=/usr/local/bin \
      --filename=composer \
      --version=1.1.2

# Install Node.js
RUN curl -sL  https://deb.nodesource.com/setup_7.x | bash - && \
  apt-get install -y nodejs

# Install MageRun
RUN cd /usr/local/bin && \
    wget https://files.magerun.net/n98-magerun.phar && \
    chmod +x ./n98-magerun.phar

