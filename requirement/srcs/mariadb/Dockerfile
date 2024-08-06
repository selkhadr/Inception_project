FROM debian:bookworm

RUN apt-get update && apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysqld

RUN chmod 777 /var /var/run /var/run/mysqld /run/mysqld /var/lib/mysql

COPY /tools/setup-mariadb.sh /

RUN chmod +x /setup-mariadb.sh

ENTRYPOINT ["sh", "/setup-mariadb.sh"]

CMD ["mariadbd", "--user=mysql", "--bind-address=0.0.0.0"]