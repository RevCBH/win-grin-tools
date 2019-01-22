FROM debian:stretch-slim

VOLUME [ "/home/grin/chain_data", "/home/grin/wallet_data", "/home/grin/txs" ]

ADD https://github.com/mimblewimble/grin/releases/download/v1.0.0/grin-v1.0.0-479973573-linux-amd64.tgz /grin-v1.0.0-479973573-linux-amd64.tgz
COPY checkmd5.sh /checkmd5.sh

RUN /checkmd5.sh grin-v1.0.0-479973573-linux-amd64.tgz grin-v1.0.0-479973573-linux-amd64.tgz "f8e3f4711496b14653ebd982ac13ea3e  grin-v1.0.0-479973573-linux-amd64.tgz" \
    && apt-get update -y \
    && apt-get install -y libreadline-dev \
    && apt-get upgrade -y \
    && tar xfz grin-v1.0.0-479973573-linux-amd64.tgz \
    && mv grin /usr/local/bin/grin \
    && rm grin-v1.0.0-479973573-linux-amd64.tgz \
    && cd /home/grin \
    && grin server config

EXPOSE 3413/tcp
WORKDIR /home/grin
ENTRYPOINT [ "/usr/local/bin/grin" ]