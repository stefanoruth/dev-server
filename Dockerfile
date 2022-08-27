FROM ubuntu:22.10

# Server updates
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install curl wget htop vim.tiny zsh git tmux redis redis-server postgresql postgresql-contrib

ENV NODE_ENV development

WORKDIR '/dev-server'

COPY . .

# Zsh
RUN echo "source /dev-server/home/.zshrc" >> ~/.zshrc

RUN chmod 1777 ./scripts/*

# Install Node
ENV NODE_VERSION v18.8.0
RUN ./scripts/install-node.sh

# Install Yarn
ENV YARN_VERSION v1.22.19
RUN ./scripts/install-yarn.sh

# Oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Configure Tmux
RUN ln -s /dev-server/home/.tmux.conf ~/.tmux.conf
# RUN ./scripts/tmux-start.sh

WORKDIR '/code'

CMD [ "zsh" ]
