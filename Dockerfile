# Docker image for olog-mysql database

FROM mysql:5.7

MAINTAINER Maksim Rakitin <mrakitin@bnl.gov>

###############################################################################
# MR: install vim and set configs for bash and vim
RUN apt-get update && apt-get install -y git vim
# Dot files:
RUN cd && git clone https://github.com/mrakitin/dotfiles && \
    cp -v dotfiles/bashrc /root/.bashrc && \
    cp -v dotfiles/vimrc /root/.vimrc && \
    cp -v dotfiles/bash_history /root/.bash_history && \
    rm -rfv dotfiles/

ENV HISTFILE=/root/.bash_history
###############################################################################

# The only operation we should do is to copy the initialization script
# to the folder mentioned in the documentation
COPY sql/ /docker-entrypoint-initdb.d/
