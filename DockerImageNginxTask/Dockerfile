# Dockerfile to create an image with Nginx and MySQL

# Base image
FROM ubuntu:latest

# Maintainer information
MAINTAINER Naji <Naji270297@gmail.com>

# Update and install necessary packages
RUN apt-get update && \
    apt-get install -y nginx mysql-server

# Set the working directory
WORKDIR /app

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=your_password

# Add Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Add MySQL configuration file
COPY my.cnf /etc/mysql/my.cnf

# Add startup script
ADD start.sh /app/start.sh

# Create volume for MySQL data
VOLUME /var/lib/mysql

# Set the user
USER nobody

# Expose ports
EXPOSE 80 3306

# Define the command to run at container startup
CMD ["/app/start.sh"]
