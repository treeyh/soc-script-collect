#!/bin/bash


for no in $(seq 1 6); do \
  mkdir -p redis-"${no}"/conf \
  && PORT=${no} envsubst < redis-cluster.tmpl > redis-"${no}"/conf/redis.conf \
  && mkdir -p redis-"${no}"/data;\
done

