FROM php:7.1-fpm

# https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#run
RUN apt-get update && apt-get install -y \
	# composer \
	git zip \
	&& rm -rf /var/lib/apt/lists/*

# https://hub.docker.com/_/php/
RUN docker-php-ext-install -j$(nproc) pdo_mysql

# https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md
RUN set -xe; \
	export EXPECTED_SIGNATURE=$(php -r "echo file_get_contents('https://composer.github.io/installer.sig');"); \
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"; \
	export ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');"); \
	\
	if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]; then \
		>&2 echo 'ERROR: Invalid installer signature'; \
		rm composer-setup.php; \
		exit 1; \
	fi; \
	\
	php composer-setup.php --install-dir=/usr/local/bin --filename=composer ; \
	rm composer-setup.php;


RUN useradd -m php
USER php

WORKDIR /var/www/app
EXPOSE 9000
CMD ["php-fpm"]
