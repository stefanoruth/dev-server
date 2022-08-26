FROM ubuntu:22.10

# Server updates
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y curl wget

ENV NODE_ENV development

WORKDIR '/dev-server'

COPY . .

RUN chmod 1777 ./scripts/*

# # Install Node
ENV NODE_VERSION v18.8.0
RUN ./scripts/install-node.sh

# Install Yarn
ENV YARN_VERSION v1.22.19
RUN ./scripts/install-yarn.sh


WORKDIR '/code'
