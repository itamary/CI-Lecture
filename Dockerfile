FROM ubuntu:16.04

MAINTAINER Itamar

RUN apt-get update \
    && apt-get install -y nginx php\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf

ADD default /etc/nginx/sites-available/default
ADD index.php /var/www/html

EXPOSE 80
CMD ["nginx"]
