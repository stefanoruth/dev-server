#!/bin/bash

type=$(uname --m)

if [[ $type == "aarch64" ]]
then
    system="arm64"
elif [[ $type == "x86_64" ]]
then
    system="x64"
else
    echo "Invalid system type: $type"
    exit 1
fi

wget https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-${system}.tar.gz
tar xzf node-${NODE_VERSION}-linux-${system}.tar.gz -C /usr/local
ln -s /usr/local/node-${NODE_VERSION}-linux-${system}/bin/node /bin/node
rm node-${NODE_VERSION}-linux-${system}.tar.gz
