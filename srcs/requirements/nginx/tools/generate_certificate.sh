#!/bin/sh
ALREADY_EXISTS='false'
DOMAIN_NAME='fnascime.42.fr'

if [ -f "/etc/nginx/key/certify.crt" ] && [ -f "/etc/nginx/key/private.key" ]; then
	ALREADY_EXISTS='true'
fi

if [ "$ALREADY_EXISTS" = 'false' ]; then
	mkdir /etc/nginx/key
	openssl genrsa -out /etc/nginx/key/private.key 2048
	openssl req -new -x509 -key /etc/nginx/key/private.key -out /etc/nginx/key/certify.crt -days 365 -subj "/CN=${DOMAIN_NAME}"
else
	echo "certificate already exists"
fi
