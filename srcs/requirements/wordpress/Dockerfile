FROM debian:bullseye

WORKDIR /var/www/html

RUN apt-get update && apt-get upgrade -y

RUN apt-get install wget  php  php-mysql  php-fpm -y

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp 

COPY tools/script.sh /home

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN chmod 777 /home/script.sh

CMD ["sh", "/home/script.sh"]
