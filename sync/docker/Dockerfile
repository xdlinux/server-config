FROM ubuntu:16.04

COPY packages /tmp/packages

RUN sed -i s/archive.ubuntu.com/mirrors.xdlinux.info/g /etc/apt/sources.list \
    && sed -i 's/mirrors.xdlinux.info\/ubuntu\/\ xenial-security/mirrors.tuna.tsinghua.edu.cn\/ubuntu\/\ xenial-security/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
                                            ed \
                                            patch \
                                            xz-utils \
                                            debmirror \
                                            python2.7-minimal \
                                            python-setuptools \
                                            debian-archive-keyring \
    && rm -rf /var/lib/apt/lists/*

RUN cd /tmp/packages/ \
    && dpkg --install *.deb \
    && tar xf ez_setup-0.9.tar.gz \
    && cd /tmp/packages/ez_setup* \
    && python2.7 setup.py install \
    && cd /tmp/packages/ \
    && tar xf mirror-0.6.8.tar.gz \
    && cd /tmp/packages/mirror* \
    && python2.7 setup.py build && python2.7 setup.py install \
    && patch /usr/bin/debmirror /tmp/packages/debmirror.diff \
    && rm -rf /tmp/packages

RUN mkdir -p /home/keyrings \
    && mkdir -p /home/keyrings/debian \
    && gpg --no-default-keyring --keyring /home/keyrings/debian/trustedkeys.gpg --import /usr/share/keyrings/debian-archive-keyring.gpg \
    && mkdir -p /home/keyrings/ubuntu \
    && gpg --no-default-keyring --keyring /home/keyrings/ubuntu/trustedkeys.gpg --import /usr/share/keyrings/ubuntu-archive-keyring.gpg \
    && mkdir -p /home/keyrings/deepin \
    && gpg --no-default-keyring --keyring /home/keyrings/deepin/trustedkeys.gpg --import /usr/share/keyrings/deepin-archive-keyring.gpg \
    && mkdir -p /home/keyrings/kali \
    && gpg --no-default-keyring --keyring /home/keyrings/kali/trustedkeys.gpg --import /usr/share/keyrings/kali-archive-keyring.gpg \
    && mkdir -p /home/keyrings/linuxmint \
    && gpg --no-default-keyring --keyring /home/keyrings/linuxmint/trustedkeys.gpg --import /usr/share/keyrings/linuxmint-keyring.gpg \
    && mkdir -p /home/keyrings/deb-multimedia \
    && gpg --no-default-keyring --keyring /home/keyrings/deb-multimedia/trustedkeys.gpg --import /etc/apt/trusted.gpg.d/deb-multimedia-keyring.gpg

VOLUME ["/pool", "/etc/mirrord", "/home/scripts", "/home/sync", "/srv/mirrors", "/var/log"]

CMD ["mirrord", "--config=/etc/mirrord", "--do-not-daemonize"]
