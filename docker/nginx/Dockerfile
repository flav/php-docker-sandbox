FROM nginx:latest

RUN apt-get update && apt-get install -y \
		openssl \
		&& rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -days 3650 -sha256 \
	-newkey rsa:4086 -keyout "/etc/nginx/localhost.key" \
	-out "/etc/nginx/localhost.crt" \
	-subj "/C=XX/ST=XXX/L=XXXX/O=XXXX/CN=localhost" \
	&& openssl dhparam -out "/etc/nginx/dhparm.pem" 512


