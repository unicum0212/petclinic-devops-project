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

RUN apt install curl \
    zip -y

# Install aws-cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/root/awscliv2.zip"
RUN unzip /root/awscliv2.zip
RUN . /root/aws/install
RUN rm /root/awscliv2.zip

RUN mkdir /ansible
RUN mkdir /ansible/playbooks

ENV ANSIBLE_LOCAL_TEMP=/tmp

ENTRYPOINT ["tail", "-f", "/dev/null"]
