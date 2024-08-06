
touch /setup.sql && chmod 777 /setup.sql
cat << EOF > setup.sql
    flush privileges;
	create database $DB_NAME;
	create user '$DB_USER'@'%' identified by '$DB_PASSWORD';
	grant all privileges on $DB_NAME.* to '$DB_USER'@'%' identified by '$DB_PASSWORD';
	flush privileges;
EOF


mariadbd --user=mysql --bootstrap < /setup.sql
sleep 2

exec "$@"
