同步工具运行在 Docker 容器内。

使用[mirror](https://github.com/ideal/mirror/)执行计划任务。

同步工具为`rsync`。

`debmirror` 已弃用。

~~注: `debmirror[Package: debmirror Version: 1:2.25ubuntu2]`，此版本 Bug 见[Debian Bug report logs - #824590](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=824590)，补丁:`./packages/debmirror.diff`。~~

```bash
$ tree sync
.
├── docker # 容器构建目录
│   ├── Dockerfile
│   ├── packages
│   │   ├── debmirror.diff
│   │   ├── deb-multimedia-keyring_2016.8.1_all.deb
│   │   ├── deepin-keyring_2015.10.09_all.deb
│   │   ├── ez_setup-0.9.tar.gz
│   │   ├── kali-archive-keyring_2015.2_all.deb
│   │   ├── linuxmint-keyring_2016.05.26_all.deb
│   │   └── mirror-0.6.8.tar.gz
│   └── run.sh
├── mirror # mirror 配置文件
│   ├── mirror.ini
│   └── plugin.ini
├── README.md
├── rsync # rsync --include-file 参数引用文件
│   ├── archlinuxcn.txt
│   ├── centos.txt
│   ├── debian-cd.txt
│   ├── debian-multimedia.txt
│   ├── debian-security.txt
│   ├── debian.txt
│   ├── deepin-cd.txt
│   ├── deepin.txt
│   ├── epel.txt
│   ├── fedora.txt
│   ├── kali-images.txt
│   ├── kali.txt
│   ├── linuxmint.txt
│   ├── opensuse.txt
│   ├── openwrt.txt
│   ├── ubuntu-releases.txt
│   ├── ubuntu.txt
│   └── virtualbox.txt
└── scripts # 其他同步脚本
    ├── android.py
    ├── aosp.sh
    ├── debian.sh          # 未使用
    ├── deb-multimedia.sh  # 未使用
    ├── deepin.sh          # 未使用
    ├── homebrew.sh
    ├── kali.sh            # 未使用
    ├── linuxmint.sh       # 未使用
    ├── repo
    └── ubuntu.sh          # 未使用
```
