
# 切换不同环境的网络ip

使用方法，两个环境 `home`, `work`

```bash

./turn_network.sh work

```

网络配置

```bash

TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=static
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=ens33
UUID=e2798bf0-3f19-4c9b-bcff-aa2af9718c1a
DEVICE=ens33
ONBOOT=yes

IPADDR=192.168.32.247
NETMASK=255.255.255.0
GATEWAY=192.168.32.1
DNS1=114.114.114.114

```