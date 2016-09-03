## motd

Debian 8 发行版 motd 设置。 
motd 全称 message of the day，被用来传递消息。这么个显示：

```bash
me@R:~/community/server-config/ssh$ ssh vvl@xdlinux.info
Linux xdlinux 3.16.0-4-amd64 #1 SMP Debian 3.16.36-1 (2016-07-04) x86_64
         _ _ _                  
__  ____| | (_)_ __  _   ___  __
\ \/ / _` | | | '_ \| | | \ \/ /
 >  < (_| | | | | | | |_| |>  < 
/_/\_\__,_|_|_|_| |_|\__,_/_/\_\
                                

Welcome to Debian GNU/Linux 8.5 (jessie) (3.16.0-4-amd64).

System information as of: Sat Sep  3 20:47:01 CST 2016

System load:    2.40    IP Address: ***.***.***.***
Memory usage:   15.4%   System uptime:  3 days
Usage on /: 85% Swap usage: 0.0%
Local Users:    1   Processes:  148

0 updates to install.
0 are security updates.

Last login: Sat Sep  3 20:21:49 2016 from ***.***.***.***
```

配置文件说明：

```bash
vvl@xdlinux:~$ ls -l /etc/motd
lrwxrwxrwx 1 root root 13 9月   3 19:53 /etc/motd -> /var/run/motd
vvl@xdlinux:~$ tree /etc/update-motd.d
/etc/update-motd.d
├── 00-header
├── 10-sysinfo
├── 20-updates
└── 90-footer

0 directories, 4 files
vvl@xdlinux:~$ grep -i motd /etc/ssh/sshd_config 
PrintMotd no
```

[Debian Jessie Dynamic MOTD *注: motd 脚本来源*](https://oitibs.com/debian-jessie-dynamic-motd/)  
[Debian wiki motd](https://wiki.debian.org/motd)
