FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/*
RUN apt-add-repository --yes ppa:ansible/ansible
RUN apt update
RUN apt install ansible -y

RUN mkdir /ansible
#RUN mkdir -p /ansible/green
#RUN mkdir /ansible/blue

ENV ANSIBLE_LOCAL_TEMP=/tmp

CMD ["/usr/bin/bash"]
