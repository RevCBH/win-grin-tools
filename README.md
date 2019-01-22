# Setup

1. Install and start [Docker for Windows](https://docs.docker.com/docker-for-windows/install/).
2. Share the drive where you cloned this repository with docker. Search for 'Shared Drives' on the [Docker for Windows](https://docs.docker.com/docker-for-windows/install/) page for details.
3. ***This will take a long time to finish.*** Run `setup.bat`. It will build the docker images, create a docker volume named `grin_chain_data` to store the blockchain data, create folders `wallet_data` and `txs` for grin wallet and placing transaction files, create the `wallet713` folder for wallet713 data, start the grin container, and setup a wallet.
4. Type `docker ps` in the command prompt and check that the grin container is running.

You can do `docker attach grin` to watch the grin TUI and track chain download status. To detach, type `Ctrl+P` then `Ctrl+Q`.

`docker stop grin` and `docker start grin` will stop and start the container.

# Using Grin

The `grin.bat` file calles grin inside the running container and passes any provided arguments.

## Transaction files
 
The `txs` folder is a place to put transaction files. So if you got sent a file called `payment.tx` you would:
 
1. Place it in the `txs` folder.
2. Run `./grin.cmd wallet receive --input txs/payment.tx`
3. Take the generated `payment.tx.response` file from the `txs` folder and send it back.

For more info on using the wallet, see [here](https://github.com/mimblewimble/docs/wiki/How-to-use-the-Grin-wallet).

# Using wallet713

## **IMPORTANT: wallet713 is not yet integrated with the local grin node and doesn't share wallet or tx data**

The `wallet713.bat` file will start a container running the wallet713 cli. It will pass any arguments, but you shouldn't need to. Use `wallet713\txs` instead of `txs` to share transaction file. Otherwise it should work the same. 

The most common reason to use wallet713 to listen on grinbox or keybase for transactions instead of having to pass around files or run a publicly accessible node. After you start wallet713 with `wallet713.bat`, you can simply type `listen` to start accepting transactions on grinbox.

If you want to leave it running after starting the listener, you can always press `Ctrl+P` then `Ctrl+Q` to detach. Then, `docker attach wallet713` to resume the session later.

# TODO

1. Integrate wallet713 with the local grin node to minimize trust on external sources.
2. Figure out how to make the release binary work for wallet713 instead of building from scratch.