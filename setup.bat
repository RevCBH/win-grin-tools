docker build -t grin -f grin.Dockerfile .
docker build -t wallet713 -f wallet713.Dockerfile
docker volume create grin_chain_data
mkdir wallet_data
mkdir txs
mkdir wallet713

docker run -itdP --name grin ^
    --mount src="%~dp0\wallet_data",target=/home/grin/wallet_data,type=bind ^
    --mount src="%~dp0\txs",target=/home/grin/txs,type=bind ^
    --mount src=grin_chain_data,target=/home/grin/chain_data,type=volume ^
    grin
docker exec -it grin /usr/local/bin/grin wallet init --here