FROM debian:bookworm

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Copy the configuration file
#COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Copy the init script
COPY ./tools/generate_certificate.sh /bin/generate_certificate.sh

# Set the permissions
RUN chmod +x /bin/generate_certificate.sh

# run the init script
ENTRYPOINT ["nginx", "-g", "daemon off;"]