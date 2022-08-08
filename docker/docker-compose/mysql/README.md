# 部署 mysql

## 创建容器虚拟网卡

`vim prepare-network.sh`

```bash
#!/bin/bash

NETWORK_NAME=inner_network

if [ -z $(docker network ls --filter name=^${NETWORK_NAME}$ --format="{{ .Name }}") ] ; then
  docker network create ${NETWORK_NAME};
fi

```

`docker network create inner_network`
