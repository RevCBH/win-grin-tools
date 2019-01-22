#!/usr/bin/env bash
set -o errexit
set -o pipefail

apt-get -y update
apt-get -y upgrade
apt-get -y install build-essential cmake git libgit2-dev clang libncurses5-dev libncursesw5-dev \
                   zlib1g-dev pkg-config libssl-dev llvm curl

curl https://sh.rustup.rs -sSf > /rustup.sh
bash /rustup.sh -y
source $HOME/.cargo/env

mkdir -p /build
cd build
git clone https://github.com/vault713/wallet713
cd wallet713
cargo build --release
cp target/release/wallet713 /usr/local/bin/wallet713
cd /
rm -rf /build

cat << WalletConfig > /wallet713/wallet713.toml
chain = "Mainnet"
wallet713_data_path = "/wallet713/data"
grinbox_domain = "grinbox.io"
default_keybase_ttl = "24h"
WalletConfig