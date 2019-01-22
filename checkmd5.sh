#!/usr/bin/env bash

FILENAME=$1
CHECKSTRING=$2
LOCALMD5=$(md5sum "$1")

[[ "$LOCALMD5" == "$CHECKSTRING" ]]
exit $?