FROM debian:stretch-slim

VOLUME [ "/home/grin/chain_data", "/home/grin/wallet_data", "/home/grin/txs" ]

RUN apt-get update -y \
    && apt-get install -y libreadline-dev wget \
    && apt-get upgrade -y \
    && wget https://github.com/mimblewimble/grin/releases/download/v1.0.0/grin-v1.0.0-479973573-linux-amd64.tgz \
    && tar xfz grin-v1.0.0-479973573-linux-amd64.tgz \
    && mv grin /usr/local/bin/grin \
    && rm grin-v1.0.0-479973573-linux-amd64.tgz \
    && cd /home/grin \
    && grin server config

EXPOSE 3413/tcp
WORKDIR /home/grin
ENTRYPOINT [ "/usr/local/bin/grin" ]