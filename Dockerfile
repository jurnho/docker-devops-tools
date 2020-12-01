FROM ubuntu:20.04
RUN apt update
RUN apt-get install -y wget
RUN apt-get install -y unzip
RUN apt-get install -y openssh-client
RUN apt-get install -y git
RUN apt-get install -y vim
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y awscli
WORKDIR /opt
RUN wget https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip
RUN unzip terraform_0.13.5_linux_amd64.zip -d terraform_0.13.5_linux_amd64

RUN mkdir /opt/aws-vault
WORKDIR /opt/aws-vault
RUN wget https://github.com/99designs/aws-vault/releases/download/v6.2.0/aws-vault-linux-amd64
RUN ln -s aws-vault-linux-amd64 aws-vault
RUN chmod 755 aws-vault-linux-amd64
RUN apt-get install -y pass

RUN mkdir /opt/terragrunt
WORKDIR /opt/terragrunt
RUN wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.26.7/terragrunt_linux_amd64
RUN chmod 755 terragrunt_linux_amd64
RUN ln -s terragrunt_linux_amd64 terragrunt

RUN apt-get install -y dnsutils

RUN useradd -m devops --shell /bin/bash

