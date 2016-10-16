#!/bin/bash

export GNUPGHOME=/home/keyrings/kali

arch=i386,amd64

section=main,contrib,non-free

release=sana,sana-proposed-updates

server=mirrors6.tuna.tsinghua.edu.cn

inPath=/kali

proto=rsync

outPath=/srv/mirrors/kali

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
