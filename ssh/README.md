## ssh

Debian 8 发行版 openssh-server & openssh-sftp-server 设置

配置文件位置:

```
/etc/ssh/sshd_config
```

主要配置:

```
ListenAddress 0.0.0.0      // 只监听 22 端口
Protocol 2                 // 使用 SSH 第二版协议
PermitRootLogin no         // 禁止 Root 登录
PubkeyAuthentication yes   // 允许公钥(Public Key)认证
PasswordAuthentication no  // 禁止密码登录
```
