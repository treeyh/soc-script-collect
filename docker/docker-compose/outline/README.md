## 部署

### 创建目录

```bash

mkdir -p /opt/app/outline/data/linx/files
mkdir -p /opt/app/outline/data/linx/meta
mkdir -p /opt/app/outline/data/minio/data
mkdir -p /opt/app/outline/conf


```

`docker network create --subnet 172.12.0.0/24 --gateway 172.12.0.1 outline_network`
