#!/bin/bash
apt update -y
apt install nginx -y 
systemctl start nginx
systemctl enable nginx 
echo "<h2> Hello world from $(hostname -f) </h2>" | tee /usr/share/nginx/html/index.html
