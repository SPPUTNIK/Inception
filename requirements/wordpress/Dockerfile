FROM debian:bullseye

WORKDIR /var/www/html

RUN apt-get update && apt-get upgrade -y

RUN apt-get install wget  php7.4  php-mysql mariadb-client  php7.4-fpm php-cli -y

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp 

COPY tools/script.sh /tmp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN chmod 777 /tmp/script.sh

# Use a shell to interpret the loop command
# ENTRYPOINT ["/bin/bash", "-c", "while true; do echo 'This is an infinite loop'; sleep 1; done"]

CMD ["sh", "/tmp/script.sh"]