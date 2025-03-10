FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY website /srv/www/website
