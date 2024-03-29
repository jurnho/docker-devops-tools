FROM ubuntu:20.04
RUN apt update
RUN apt-get install -y wget
RUN apt-get install -y unzip
RUN apt-get install -y openssh-client
RUN apt-get install -y git
RUN apt-get install -y vim

WORKDIR /opt
# RUN wget https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
RUN wget https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.7.5.zip

RUN unzip awscli-exe-linux-x86_64-2.7.5.zip
RUN /opt/aws/install
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y groff

WORKDIR /opt
RUN wget https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip
RUN unzip terraform_0.13.5_linux_amd64.zip -d terraform_0.13.5_linux_amd64

RUN wget https://releases.hashicorp.com/terraform/1.2.2/terraform_1.2.2_linux_amd64.zip
RUN unzip terraform_1.2.2_linux_amd64.zip -d terraform_1.2.2_linux_amd64

RUN mkdir /opt/aws-vault
WORKDIR /opt/aws-vault
RUN wget https://github.com/99designs/aws-vault/releases/download/v6.2.0/aws-vault-linux-amd64
RUN ln -s aws-vault-linux-amd64 aws-vault
RUN chmod 755 aws-vault-linux-amd64
RUN apt-get install -y pass

RUN apt-get install -y python3-pip
RUN pip3 install ansible boto3

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y dnsutils

RUN useradd -m devops --shell /bin/bash

WORKDIR /