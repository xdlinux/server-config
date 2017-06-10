#!/bin/bash

export GNUPGHOME=/home/keyrings/debian

arch=i386,amd64,all

section=main,contrib,non-free

release=jessie,jessie-updates,jessie-proposed-updates,jessie-backports,stretch,stretch-proposed-updates,stretch-updates,stretch-backports,sid

server=mirrors6.tuna.tsinghua.edu.cn
#server=mirrors6.ustc.edu.cn

inPath=/debian

proto=http

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
                --diff=none \
                --allow-dist-rename \
                --ignore-small-errors \
                --include='/Translation-.*\.bz2$'
