# select operating system
FROM ubuntu:16.04

# install operating system packages 
RUN apt-get update -y &&  apt-get install git curl gettext unzip wget software-properties-common python python-software-properties dnsutils make -y 

## add more packages, if necessary
# install Java8
RUN add-apt-repository ppa:webupd8team/java -y && apt-get update && apt-get -y install openjdk-8-jdk-headless


# use bpkg to handle complex bash entrypoints
RUN curl -Lo- "https://raw.githubusercontent.com/bpkg/bpkg/master/setup.sh" | bash
RUN bpkg install cha87de/bashutil -g
## add more bash dependencies, if necessary 

# add config, init and source files 
# entrypoint
ADD init /opt/docker-init
RUN chmod +x  /opt/docker-init/entrypoint
ADD conf /opt/docker-conf
RUN chmod +x /opt/docker-conf/spark-env.sh

# data folders


# apache spark
RUN wget http://mirror.dkd.de/apache/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz -O /tmp/spark-2.3.1-bin-hadoop2.7.tgz
RUN  tar -xvzf /tmp/spark-2.3.1-bin-hadoop2.7.tgz -C /opt/

 
# expose ports
EXPOSE 8080
EXPOSE 6066
EXPOSE 7077

# start from init folder
WORKDIR /opt/docker-init
ENTRYPOINT ["./entrypoint"]