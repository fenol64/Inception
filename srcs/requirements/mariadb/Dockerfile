FROM debian:bookworm

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server

# Copy the configuration file
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the init script
COPY ./tools/init_script.sh /bin/init_script.sh

# Set the permissions
RUN chmod +x /bin/init_script.sh

# run the init script
CMD ["/bin/init_script.sh"]

