#!/bin/bash

set -e
set -x

# 指定分割后文件大小

split -b 500m -d run.log run