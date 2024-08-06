FROM debian:stable

RUN apt-get update && apt-get upgrade && apt-get install -y nginx openssl

RUN mkdir -p /etc/ssl/localcerts

RUN openssl req -new -x509 -days 365 -noenc -out /etc/ssl/localcerts/cert.pem -keyout /etc/ssl/localcerts/cert.key -subj "/C=MA"

RUN chmod 600 /etc/ssl/localcerts/cert*

COPY ./conf/nginx.conf /etc/nginx/conf.d

WORKDIR	/etc/nginx/conf.d/


CMD ["nginx", "-g", "daemon off;"]