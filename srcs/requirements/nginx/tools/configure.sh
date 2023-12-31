#!/bin/bash

sed -i "s/SERVER_NAME/$DOMAIN_NAME/g" /etc/nginx/sites-enabled/nginx.conf

if [ ! -f "/etc/ssl/certs/certificate.crt" ]; then
	echo "No certificate found: creating certificate"
	openssl req -new \
		-newkey rsa:2048 \
		-x509 \
		-sha256 \
		-days 365 \
		-nodes \
		-out /etc/ssl/certs/certificate.crt \
		-keyout /etc/ssl/private/certificate.key \
		-subj "/C=$SSL_COUNTRY/ST=$SSL_STATE/L=$SSL_LOCALITY/O=$SSL_ORGANISATION/CN=$DOMAIN_NAME"
else
	echo "certificate available"
fi

exec "$@"