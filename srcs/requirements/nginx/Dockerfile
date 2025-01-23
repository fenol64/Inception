FROM debian:bookworm

# Install Nginx
RUN apt-get update && apt-get install -y nginx openssl

# Copy the configuration file
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Copy the init script
COPY ./tools/generate_certificate.sh /

# Set the permissions
RUN chmod +x /generate_certificate.sh

# Generate the certificate
RUN /generate_certificate.sh

# run the init script
ENTRYPOINT ["nginx", "-g", "daemon off;"]