#!/bin/bash

export GNUPGHOME=/home/keyrings/kali

arch=i386,amd64

section=main,contrib,non-free

release=sana,sana-proposed-updates
release=kali-rolling,kali-rolling-only

server=mirrors6.tuna.tsinghua.edu.cn
#server=[2001:da8:d800:95::110]

inPath=/kali

proto=http

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
