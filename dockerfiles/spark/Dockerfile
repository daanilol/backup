#Instalando a distro
FROM ubuntu:22.04

#Criando uma variável de ambiente
RUN SPARK_HOME="master"

#Criando diterorio para o spark
RUN apt update && apt upgrade -y && \
    apt install wget -y \
    openjdk-11-jdk \
    sudo


#ENV JAVA_HOME=/opt/java/openjdk
#ENV PATH=$JAVA_HOME/bin:$PATH

RUN adduser --disabled-password ubuntu && usermod -aG sudo ubuntu && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#Fazendo download e descompactando arquivo
RUN wget https://dlcdn.apache.org/spark/spark-3.5.5/spark-3.5.5-bin-hadoop3.tgz && \
    tar xzf spark-3.5.5-bin-hadoop3.tgz && \
    mv spark-3.5.5-bin-hadoop3 /opt/spark && \
    rm -r spark-3.5.5-bin-hadoop3.tgz && \
    mkdir -p /opt/spark/spark-events

COPY entrypoint.sh /opt/spark/conf

#Adicionando as linhas ao final do arquivo:
RUN echo "export SPARK_HOME=/opt/spark" >> /home/ubuntu/.bashrc && \
    echo "export PATH=\$PATH:\$SPARK_HOME/bin" >> /home/ubuntu/.bashrc

USER ubuntu

WORKDIR /home/ubuntu

ENTRYPOINT ["bash", "/opt/spark/conf/entrypoint.sh"]
