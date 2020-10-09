#!/bin/bash

set -e
set -x

# 指定分割后文件行数

split -l 500000 -d run.log run