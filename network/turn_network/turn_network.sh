#!/bin/bash

set -e
set -x

echo 'env: $1'

if [ $1x == 'home'x ]
then
    echo 'turn home ip'
    rm /etc/sysconfig/network-scripts/ifcfg-ens33
    cp /etc/sysconfig/network-scripts/ifcfg-ens33.bak.h /etc/sysconfig/network-scripts/ifcfg-ens33
    systemctl restart network
elif [ $1x == 'work'x ]
then
    echo 'trun work ip'
    rm /etc/sysconfig/network-scripts/ifcfg-ens33
    cp /etc/sysconfig/network-scripts/ifcfg-ens33.bak.w /etc/sysconfig/network-scripts/ifcfg-ens33
    systemctl restart network
else
    echo 'env not home or work'
fi
echo 'turn network end'

