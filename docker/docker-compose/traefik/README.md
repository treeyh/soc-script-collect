# traefik 部署

参考项目: https://github.com/soulteary/traefik-example

## 创建容器虚拟网卡

`vim prepare-network.sh`

```bash
#!/bin/bash

NETWORK_NAME=traefik_network

if [ -z $(docker network ls --filter name=^${NETWORK_NAME}$ --format="{{ .Name }}") ] ; then
  docker network create ${NETWORK_NAME};
fi

# docker network create traefik_network
```

## 生成必要的证书

`vim generate-certs.sh`

```bash
#!/bin/bash

mkdir -p ssl

OUTPUT_FILENAME="example.com"

printf "[req]
prompt                  = no
default_bits            = 4096
default_md              = sha256
encrypt_key             = no
string_mask             = utf8only

distinguished_name      = cert_distinguished_name
req_extensions          = req_x509v3_extensions
x509_extensions         = req_x509v3_extensions

[ cert_distinguished_name ]
C  = CN
ST = SH
L  = SH
O  = ${OUTPUT_FILENAME}
OU = ${OUTPUT_FILENAME}
CN = ${OUTPUT_FILENAME}

[req_x509v3_extensions]
basicConstraints        = critical,CA:true
subjectKeyIdentifier    = hash
keyUsage                = critical,digitalSignature,keyCertSign,cRLSign #,keyEncipherment
extendedKeyUsage        = critical,serverAuth #, clientAuth
subjectAltName          = @alt_names

[alt_names]
DNS.1 = ${OUTPUT_FILENAME}
DNS.2 = *.${OUTPUT_FILENAME}

">ssl/${OUTPUT_FILENAME}.conf

openssl req -x509 -newkey rsa:2048 -keyout ssl/${OUTPUT_FILENAME}.key -out ssl/${OUTPUT_FILENAME}.crt -days 3600 -nodes -config ssl/${OUTPUT_FILENAME}.conf

```

https://juejin.cn/post/7074942056304476196

https://juejin.cn/post/7074942056304476196
https://zhuanlan.zhihu.com/p/387817529
https://doc.traefik.io/traefik/routing/entrypoints/
https://www.traefik.tech/providers/docker/#exposedbydefault
