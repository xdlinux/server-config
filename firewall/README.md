`iptables`位于`/etc/network/if-pre-up.d/`目录下，开启自动启动。
`iptables.rules`与`ip6tables.rules`位于`/etc`目录下。

除了 docker 自动添加的规则外，定义了以下几个规则：

* 开放 TCP 22(ssh) / 80(http) / 443 (https) 端口
* 接收 lo(环回地址) / 172.17.0.0/16(docker 容器) / fdbd:6b69:4dc6::/48(docker 容器) 的数据包
* 接收 icmp / icmpv6 协议的数据包
* 接收 RELATED,ESTABLISHED 状态的数据包
* 该网段 fdbd:6b69:4dc6::/48 执行 SANT 规则
* 默认策略 DROP

`peers`位于`/etc/ppp`，PPPoE 所使用的配置文件。

> 服务器网络情况：
> 两个网卡，一个为 eth1, IPv4 默认使用此网卡
> 另一个为 eth0，PPPoE 拨号后可以使用 IPv6 网络
> ppp1 为 PPTP VPN，连接至另一台服务器提供的电信网络，紧急情况下使用此服务同步；不提供 IPv6 服务。

几点比较重要的地方：

* `dsl-provider`配置文件
  1. `+ipv6` 启用 IPv6
  2. `nodefaultroute` 不更改默认网关
* `ppp1`配置文件
  1. `nodefaultroute`
  2. `noipv6` 关闭 IPv6
