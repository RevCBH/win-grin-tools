FROM debian:stretch-slim

VOLUME [ "/wallet713/data", "wallet713/txs" ]

COPY wallet713-setup.sh /setup.sh
RUN /setup.sh

WORKDIR /wallet713
ENTRYPOINT [ "/usr/local/bin/wallet713", "--config", "/wallet713/wallet713.toml" ]
