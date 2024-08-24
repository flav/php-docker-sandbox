FROM php:8.3.10-fpm

# https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#run

# Man pages for dev
#  https://unix.stackexchange.com/a/480460
RUN <<EOF
	sed -i '/path-exclude \/usr\/share\/man/d' /etc/dpkg/dpkg.cfg.d/docker
	sed -i '/path-exclude \/usr\/share\/groff/d' /etc/dpkg/dpkg.cfg.d/docker
	apt-get update
	apt-get install --reinstall -y groff man-db manpages man coreutils curl
	rm -rf /var/lib/apt/lists/*
EOF

# Misc packages for dev
RUN <<EOF
	apt-get update && apt-get install -y \
	bind9-host \
	curl \
	db-util \
	default-mysql-client \
	dnsutils \
	dstat \
	gawk \
	git \
	iputils-ping \
	jq \
	net-tools \
	netcat \
	postgresql-client \
	procps \
	pv \
	silversearcher-ag \
	supervisor \
	telnet \
	tree \
	vim \
	wget \
	zip
	rm -rf /var/lib/apt/lists/*
EOF

# Php extensions
#  https://github.com/mlocati/docker-php-extension-installer (as noted at
#  https://hub.docker.com/_/php/)
RUN <<EOF
	curl -sSLf -o /usr/local/bin/install-php-extensions \
		https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions
	chmod +x /usr/local/bin/install-php-extensions
	install-php-extensions \
		apcu \
		dba \
		ast \
		gd \
		mcrypt \
		memcached \
		opcache \
		pcntl \
		pdo_mysql \
		pdo_pgsql \
		pdo_sqlite \
		redis \
		soap \
		sockets \
		sqlite3 \
		xdebug \
		zip
EOF

# Composer
#  https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md
RUN <<EOF
	set -xe;
	export EXPECTED_SIGNATURE=$(php -r "echo file_get_contents('https://composer.github.io/installer.sig');");
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');";
	export ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');");

	if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]; then
		>&2 echo 'ERROR: Invalid installer signature';
		rm composer-setup.php;
		exit 1;
	fi;

	php composer-setup.php --install-dir=/usr/local/bin --filename=composer ;
	rm composer-setup.php;
EOF

RUN useradd -m php
USER php

WORKDIR /var/www/app
EXPOSE 9000
CMD ["php-fpm"]
