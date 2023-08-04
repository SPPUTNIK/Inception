FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install mariadb-server -y

COPY /tools/script.sh /home

RUN chmod 744 /home/script.sh

CMD ["sh", "/home/script.sh"]