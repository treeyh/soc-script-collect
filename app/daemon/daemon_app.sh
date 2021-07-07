#!/bin/bash

# 
# nohup /data/app/tool-server/daemon_app.sh >>/data/app/tool-server/daemon_app.log 2>&1 &

set -e
set -x

#取当前目录
BASE_PATH=$(cd "$(dirname "$0")"; pwd)

#进程名字可修改
APP_NAME=ToolServer
# nohup xxxx >/dev/null 2>&1 -d &
CMD="/data/app/tool-server/start.sh"

# sleep 秒
SLEEP_SECOND=60s

# 用于grep的app名
GREP_APP_NAME=[${APP_NAME:0:1}]${APP_NAME:1}


while true ; do
  #用ps获取$APP_NAME进程数量 $(ps aux | grep -w ${GREP_APP_NAME} | grep -v grep |wc -l)
  NUM=$(pgrep -f ${APP_NAME} | wc -l)
  #echo $NUM
  #少于1，重启进程
  if [ "${NUM}" -lt "1" ];then
      echo "${APP_NAME} was killed"
      $CMD
  #大于1，杀掉所有进程，重启
  elif [ "${NUM}" -gt "1" ];then
    echo "more than 1 ${APP_NAME}, killall ${APP_NAME}"
    echo "ps aux | grep ${GREP_APP_NAME}"
    # 输出进程列表
    ps aux | grep ${GREP_APP_NAME}

    pkill -f ${APP_NAME}

    # 10秒杀进程时间
    sleep 10s
    $CMD
  fi
  # #kill僵尸进程
  # NUM_STAT=$(ps aux | grep -w ${APP_NAME} | grep T | grep -v grep | wc -l)
  # if [ "${NUM_STAT}" -gt "0" ];then
  #     echo "Z process ${APP_NAME}, kill ${APP_NAME}"
  #     pkill -9 -f ${APP_NAME}
  #     $CMD
  # fi

  sleep ${SLEEP_SECOND}
done

exit 0



