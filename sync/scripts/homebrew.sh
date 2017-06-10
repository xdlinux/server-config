#!/bin/bash

PATH=/sbin:/usr/sbin:/bin:/usr/bin
outPath=/srv/mirrors/homebrew

cd ${outPath}/brew.git && git fetch --all && git update-server-info

cd ${outPath}/homebrew-core.git && git fetch --all && git update-server-info

cd ${outPath}/homebrew-science.git && git fetch --all && git update-server-info

cd ${outPath}/homebrew-python.git && git fetch --all && git update-server-info
