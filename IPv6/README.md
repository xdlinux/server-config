```
net.ipv6.conf.default.forwarding=1
net.ipv6.conf.all.forwarding=1
```
开启 IPv6 数据包转发

```
net.ipv6.conf.default.accept_ra=2
net.ipv6.conf.default.use_tempaddr=0
net.ipv6.conf.all.accept_ra=2
net.ipv6.conf.all.use_tempaddr=0
```

> accept_ra – BOOLEAN
>         Accept Router Advertisements; autoconfigure using them.
>
>         Possible values are:
>           0 Do not accept Router Advertisements.
>           1 Accept Router Advertisements if forwarding is disabled.
>           2 Overrule forwarding behaviour. Accept Router Advertisements even if forwarding is enabled.
>
>         Functional default:
>           enabled if local forwarding is disabled.
>           disabled if local forwarding is enabled.

> use_tempaddr - INTEGER
>         Preference for Privacy Extensions (RFC3041).
>           <= 0 : disable Privacy Extensions
>           == 1 : enable Privacy Extensions, but prefer public
>                  addresses over temporary addresses.
>           >  1 : enable Privacy Extensions and prefer temporary
>                  addresses over public addresses.
>         Default:  0 (for most devices)
>                  -1 (for point-to-point devices and loopback devices)

以上 6 条参数，解决了：

1. 如何在 Docker 容器内使用 IPv6 网络
2. 启用 IPv6 forwording 后无法获取地址
3. ISP 不允许使用多于 1 个的 IPv6 地址

[这里](https://groups.google.com/forum/#!topic/xidian_linux/p3XW0jJz4Wo)有描述。
