#!/bin/bash

docker run -d \
    --restart=on-failure:3 \
    -v /pool:/pool \
    -v /home/docker/mirror/config:/etc/mirror:rw \
    -v /home/docker/mirror/scripts:/home/scripts:ro \
    -v /home/docker/mirror/rsync:/home/rsync:ro \
    -v /home/docker/mirror/mirrors:/srv/mirrors:ro \
    -v /home/docker/mirror/status:/srv/status:rw \
    -v /var/log/mirrord:/var/log/mirrord \
    --name mirror \
    xdlinux/mirror
