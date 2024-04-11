#!/bin/bash

set -x

#取当前目录
BASE_PATH=`cd "$(dirname "$0")"; pwd`

cd ${BASE_PATH}

# DOCKER_TAG='registry-vpc.cn-shanghai.aliyuncs.com/soc/postgres:16.2-yuekai'
DOCKER_TAG='registry.cn-hangzhou.aliyuncs.com/soc/postgres:16.2-yuekai'

docker build -f ${BASE_PATH}/Dockerfile-postgres -t ${DOCKER_TAG} .
docker push ${DOCKER_TAG}

