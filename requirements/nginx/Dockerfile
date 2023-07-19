FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install nginx -y && apt-get install openssl -y && apt-get install vim -y

RUN mkdir /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/abel.crt -keyout /etc/nginx/ssl/abel.key -subj "/C=MA/ST=IDF/L=Benguerir/O=1337/OU=1337/CN=abel-bou.1337.ma/UID=abel-bou"

COPY conf/default /etc/nginx/sites-available/

CMD ["nginx","-g", "daemon off;"]
