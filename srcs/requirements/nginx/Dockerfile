FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install nginx -y 

RUN mkdir /etc/nginx/ssl

COPY /tools/abel-bou.key /etc/nginx/ssl/
COPY /tools/abel-bou.crt /etc/nginx/ssl/

COPY conf/default /etc/nginx/sites-available/

CMD ["nginx","-g", "daemon off;"]
