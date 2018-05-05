# Install the Debian image
FROM debian:stretch

# Maintainer info
MAINTAINER Emil Yavorov Zahariev "emil.z@pigeonline.io"

# Update the repos, apply any updates and install them and Clean dangling packages
RUN apt-get update && \
apt-get install -y aptitude sudo vim nginx php7.0-fpm nano curl wget git postgresql postgresql-client python3 python3-pip virtualenv python-django gunicorn && \
aptitude upgrade -y && \
aptitude clean && \
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
apt-get install -y nodejs && \
npm install vue

# Make directory to mount with host
RUN mkdir /mnt/hostMachMount

# Expose ports
EXPOSE 80 443
