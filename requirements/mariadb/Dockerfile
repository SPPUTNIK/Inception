FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install mariadb-server -y

COPY /tools/script.sh /tmp

RUN chmod 744 /tmp/script.sh

CMD ["sh", "/tmp/script.sh"]