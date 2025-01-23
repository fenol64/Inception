FROM debian:bookworm

ARG DOMAIN_NAME

RUN apt update && apt install php8.2-fpm php8.2-mysql wget -y

RUN wget --no-check-certificate --progress=dot:giga https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /tmp/wp-cli.phar
RUN mv /tmp/wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/
COPY ./tools/setup.sh /usr/local/bin

ENTRYPOINT ["sh", "/usr/local/bin/setup.sh"]
