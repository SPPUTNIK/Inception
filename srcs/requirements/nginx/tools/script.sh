#!/bin/bash

service nginx start

cd etc/nginx/conf.d/

ln -s file.conf /etc/nginx/sites-enabled/

service nginx restart

nginx -t




# include /etc/nginx/conf.d/*.conf;
#         include /etc/nginx/sites-enabled/*;