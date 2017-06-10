#!/bin/bash

export GNUPGHOME=/home/keyrings/linuxmint

arch=i386,amd64

section=main,universe,multiverse,upstream,romeo,import,backport

release=sarah

server=mirrors.xdlinux.info

inPath=/linuxmint

proto=http

outPath=/srv/mirrors/linuxmint

debmirror       -a $arch \
                --source \
                -s $section \
                -h $server \
                -d $release \
                -r $inPath \
                --progress \
                --method=$proto \
                $outPath \
                --i18n \
                --check-gpg \
                --postcleanup \
                --diff=mirror \
                --allow-dist-rename
