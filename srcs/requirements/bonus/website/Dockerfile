FROM debian:bookworm

# Install nodejs
RUN apt-get update && apt-get install -y nodejs npm git

# Copy the website
RUN git clone https://github.com/fenol64/turbo_digital.git /website

WORKDIR /website
RUN npm install && npm run build

# Run the website
CMD ["npm", "run", "start"]