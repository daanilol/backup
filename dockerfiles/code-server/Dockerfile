FROM ubuntu:22.04
 
RUN apt update && apt upgrade -y && \
    apt install -y wget sudo curl python3 pip git

RUN adduser --disabled-password ubuntu && usermod -aG sudo ubuntu && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

 
RUN curl -fsSL https://code-server.dev/install.sh | sh
 
USER ubuntu
 
WORKDIR /home/ubuntu/workspace
 
EXPOSE 4277
 
CMD ["code-server", "--bind-addr", "0.0.0.0:4277", "--auth", "none"]
