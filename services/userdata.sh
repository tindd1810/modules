#!/bin/bash
apt update -y
apt install -y nginx
systemctl start nginx
systemctl enable nginx 
echo "<h2> Hello world from $(hostname -f) </h2>" | tee /var/www/html/index.html
