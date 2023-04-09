# Base image to use for the container
FROM debian:buster

# Update the package list and install the necessary packages (MariaDB server, MariaDB client, and Vim) 
# Then remove the package list to keep the image small
RUN apt-get update \
    && apt-get install -y mariadb-server \
        mariadb-client \
        vim \
    && rm -rf /var/lib/apt/lists/*

# Allow mysqld to run as a daemon, purge and re-create /var/lib/mysql with appropriate ownership,
# and ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

# Expose the default MySQL port (3306) to the host
EXPOSE 3306

# Copy the mariadb.sh and dump.sql files from the host to /usr/local/bin/ in the container
COPY ./tools/mariadb.sh /usr/local/bin/
# Give execute permission to the mariadb.sh script
RUN chmod +x /usr/local/bin/mariadb.sh

# Define the entry point for the container (the script that will be run when the container starts)
ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]

# Define the default command to run when the container starts (in this case, start the mysqld process and enable the database to listen globally)
CMD ["mysqld", "--bind-address=0.0.0.0"]
