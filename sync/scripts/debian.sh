#!/bin/bash

export GNUPGHOME=/home/keyrings/debian

arch=i386,amd64

section=main,contrib,non-free

release=jessie,jessie-updates,jessie-proposed-updates,jessie-backports,stretch,stretch-proposed-updates,stretch-updates

server=mirrors6.tuna.tsinghua.edu.cn

inPath=/debian

proto=rsync

outPath=/srv/mirrors/debian

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
