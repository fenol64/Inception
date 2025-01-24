FROM debian:buster

RUN apt -y update && apt install wget -y && apt install php php-mysql  -y

COPY ./tools/init.sh /
RUN chmod +x /init.sh

CMD ["/init.sh"]