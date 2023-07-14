FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt install nginx -y && apt install openssl -y

RUN apt-get install vim -y && apt-get install curl -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/abel.crt -keyout /etc/nginx/ssl/abel.key -subj "/C=MA/ST=IDF/L=Benguerir/O=1337/OU=1337/CN=abel-bou.1337.ma/UID=abel-bou"

COPY conf/nginx.conf /etc/nginx/conf.d/

RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]