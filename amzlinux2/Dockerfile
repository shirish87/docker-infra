FROM amazonlinux:latest

ENV DOCKER_COMPOSE_VERSION 1.24.0
ENV NGINX_VERSION 1.12

RUN yum install -y openssh-server sudo && \
    sed -i 's/#\s*PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    ssh-keygen -q -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa && \
    ssh-keygen -q -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa && \
    ssh-keygen -q -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519 && \
    mkdir -p ~/.ssh && \
    systemctl enable sshd.service

RUN amazon-linux-extras install -y nginx$NGINX_VERSION && \
    systemctl enable nginx.service && \
    amazon-linux-extras install -y docker && \
    curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

COPY ./users /users
RUN chmod +x /users/create-users.sh && \
    /users/create-users.sh docker

# SSH login fix. Otherwise user is kicked off after login
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd

ARG DOCKER_HOST="unix:///var/run/docker.sock"
ENV DOCKER_HOST="${DOCKER_HOST}"
RUN echo "DOCKER_HOST=${DOCKER_HOST}" >> /etc/environment

RUN yum install -y git make

CMD ["/usr/sbin/init"]
