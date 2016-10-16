#!/bin/bash

export GNUPGHOME=/home/keyrings/deepin

arch=i386,amd64

section=main,contrib,non-free

release=unstable

server=mirrors6.tuna.tsinghua.edu.cn

inPath=/deepin

proto=rsync

outPath=/srv/mirrors/deepin

debmirror       -a $arch \
                --no-source \
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
