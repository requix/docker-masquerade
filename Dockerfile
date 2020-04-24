FROM romeoz/docker-apache-php:7.1
MAINTAINER Volodymyr Marynychev <requix@gmail.com>

RUN apt-get update

# Install awscli
RUN apt-get install -y libpython-dev python-dev libyaml-dev python-pip
RUN pip install awscli --upgrade --user

# Install mysql-client
RUN apt-get install -y mysql-client

# Install masquerade
RUN curl -LO https://github.com/requix/masquerade/releases/latest/download/masquerade.phar
RUN chmod +x ./masquerade.phar && mv ./masquerade.phar /usr/bin/masquerade

# Run original image's entrypoint manually
CMD ["/sbin/entrypoint.sh"]
