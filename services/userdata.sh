#!/bin/bash
apt update
apt install nginx -y 
systemctl start nginx
echo $'curl http://169.254.169.254/latest/meta-data/public-ipv4' > /var/www/html/index.nginx-debian.html
