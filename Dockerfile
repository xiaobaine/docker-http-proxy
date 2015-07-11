FROM nginx
MAINTAINER Xujian Chen <xjchen@echo58.com>

# Use Reverse Proxy Config
COPY nginx.conf /etc/nginx/nginx.conf

# Install OpenSSH Server
RUN apt-get update && \
    apt-get -y install openssh-server pwgen && \
    mkdir -p /var/run/sshd && \
    sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config

ADD run.sh /run.sh

CMD ["/run.sh"]

EXPOSE 22
EXPOSE 80
