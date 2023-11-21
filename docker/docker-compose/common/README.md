## docker初始化

### docker初始化网络

```bash
docker network create --subnet 172.10.0.0/24 --gateway 172.10.0.1 outer_network
docker network create --subnet 172.11.0.0/24 --gateway 172.11.0.1 inner_network

docker network create inner_network
```


`vim prepare-network.sh`

```bash
#!/bin/bash

NETWORK_NAME=inner_network

if [ -z $(docker network ls --filter name=^${NETWORK_NAME}$ --format="{{ .Name }}") ] ; then
  docker network create ${NETWORK_NAME};
fi

```

