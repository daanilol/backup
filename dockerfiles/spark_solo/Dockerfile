FROM ubuntu:22.04

RUN apt update -y && apt upgrade -y && \
    apt install curl \
    openjdk-11-jdk -y \
    wget

#Definindo variáveis de ambiente
ARG SPARK_VERSION=3.5.5
ARG HADOOP_VERSION=3
ARG SCALA_VERSION=2.12
ENV SPARK_HOME=/opt/spark
ENV PATH="$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH"

RUN wget https://dlcdn.apache.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    tar -xvf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} ${SPARK_HOME} && \
    rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

# Expor portas comuns do Spark (opcional)
# Spark Master
EXPOSE 7077
# Spark Master Web UI
EXPOSE 8080 
# Spark Application UI
EXPOSE 4040 
# Spark History Server UI (se configurado)
EXPOSE 18080 
