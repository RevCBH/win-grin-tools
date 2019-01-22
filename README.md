# Setup

1. Install and start [Docker for Windows](https://docs.docker.com/docker-for-windows/install/).
2. Share the drive where you cloned this repository with docker. Search for 'Shared Drives' on the [Docker for Windows](https://docs.docker.com/docker-for-windows/install/) page for details.
3. Run `setup.bat`. It will build the docker image, create a docker volume named `grin_chain_data` to store the blockchain data, create a `wallet_data` folder to store the grin wallet, create a `txs` folder for placing transaction files, start the grin container, and setup a wallet.
4. Type `docker ps` in the command prompt and check that the grin container is running.

You can do `docker attach grin` to watch the grin TUI and track chain download status. To detach, type `Ctrl+P` then `Ctrl+Q`.

`docker stop grin` and `docker start grin` will stop and start the container.

# Using Grin

The `grin.bat` file calles grin inside the running container and passes any provided arguments.

## Transaction files
 
 The `txs` folder is a place to put transaction files. So if you got sent a file called `payment.tx` you would:
 
 1. Place it in the `txs` folder.
 2. Run `./grin wallet receive --input txs/payment.tx`
 3. Take the generated `payment.tx.response` file from the `txs` folder and send it back.

 For more info on using the wallet, see [here](https://github.com/mimblewimble/docs/wiki/How-to-use-the-Grin-wallet).
