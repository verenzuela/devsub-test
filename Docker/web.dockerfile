FROM nginx:1.13

ADD Docker/prod-vhost.conf /etc/nginx/conf.d/default.conf