@echo off
cls

docker run -it --rm --name wallet713 ^
    --mount src="%~dp0\wallet713\data",target=/wallet713/data,type=bind ^
    --mount src="%~dp0\wallet713\txs",target=/wallet713/txs,type=bind ^
    wallet713 %*