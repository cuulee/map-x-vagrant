#! /bin/bash

cp $dirConfig/nginx/nginx.conf /etc/nginx/nginx.conf
cp $dirConfig/nginx/mapx.conf /etc/nginx/sites-available/mapx.conf
ln -s /etc/nginx/sites-available/mapx.conf /etc/nginx/sites-enabled/mapx.conf
service nginx restart

