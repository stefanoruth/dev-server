FROM --platform=linux/amd64 ubuntu:22.10

ENV NODE_VERSION v18.8.0
ENV YARN_VERSION v1.22.19

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y curl wget



RUN wget https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.gz &&\
    tar xzf node-${NODE_VERSION}-linux-x64.tar.gz -C /usr/local &&\
    ln -s /usr/local/node-${NODE_VERSION}-linux-x64/bin/node /bin/node &&\
    rm node-${NODE_VERSION}-linux-x64.tar.gz

RUN curl -OLSs https://github.com/yarnpkg/yarn/releases/download/${YARN_VERSION}/yarn-${YARN_VERSION}.tar.gz &&\
    tar xzf yarn-${YARN_VERSION}.tar.gz -C /usr/local &&\
     ln -s /usr/local/yarn-${YARN_VERSION}/bin/yarn /bin/yarn &&\
    rm yarn-${YARN_VERSION}.tar.gz

# RUN apt-get install curl
# RUN apt install nodejs=18.8.0

WORKDIR '/code'

# COPY . .

EXPOSE 8080

# RUN node -v
# RUN yarn -v

# # Install
# RUN (cd api && yarn install)
# RUN (cd app && yarn install)

# # Build
# RUN (cd api && yarn build)
# RUN (cd app && yarn build)


