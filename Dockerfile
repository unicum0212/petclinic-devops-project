FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/*
RUN apt-add-repository --yes ppa:ansible/ansible
RUN apt update
RUN apt install ansible -y
RUN apt-get install python3 -y
RUN apt update
RUN apt-get install python3-pip -y
RUN pip3 install boto3
RUN ansible-galaxy collection install amazon.aws

RUN mkdir /ansible

ENV ANSIBLE_LOCAL_TEMP=/tmp
