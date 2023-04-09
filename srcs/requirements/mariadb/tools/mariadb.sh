#!/bin/sh

# Install and initialize the MariaDB database
mysql_install_db

# Start the MySQL service
/etc/init.d/mysql start

# Check if the database already exists
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then 
	echo "Database already exists"
else
	# If the database doesn't exist, create a new user with full privileges and grant all permissions on all databases
	mysql -uroot -e "CREATE USER 'root'@'%' IDENTIFIED BY 'rootaqadil'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"
	
	# Create the new database
	mysql -uroot -e "CREATE DATABASE $MYSQL_DATABASE;"
	
	# Grant all permissions to the new user on the new database
	mysql -uroot -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;"
fi

# Stop the MySQL service
/etc/init.d/mysql stop

# Execute any additional commands passed to the script
exec "$@"
