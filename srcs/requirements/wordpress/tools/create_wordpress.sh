#!/bin/sh

#check if wp-config.php exist
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

	# Download the latest version of WordPress and extract it
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz

	# Move all files and directories from the extracted WordPress directory to the current directory
	mv wordpress/* .
	# Remove the downloaded archive and the empty WordPress directory
	rm -rf latest.tar.gz
	rm -rf wordpress

	# Replace the default database configuration with environment variables
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	# Copy the modified configuration file to wp-config.php
	cp wp-config-sample.php wp-config.php

fi

# Execute any command passed as arguments to the script
exec "$@"