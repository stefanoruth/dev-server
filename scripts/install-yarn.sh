#!/bin/bash

curl -OLSs https://github.com/yarnpkg/yarn/releases/download/${YARN_VERSION}/yarn-${YARN_VERSION}.tar.gz
tar xzf yarn-${YARN_VERSION}.tar.gz -C /usr/local
ln -s /usr/local/yarn-${YARN_VERSION}/bin/yarn /bin/yarn
rm yarn-${YARN_VERSION}.tar.gz
