#!/bin/bash

# 检查是否提供了文件夹名称
if [ -z "$1" ]; then
  echo "Usage: $0 <folder_name>"
  exit 1
fi

# 获取文件夹名称
FOLDER_NAME="$1"

# 创建文件夹
mkdir -p "$FOLDER_NAME"

# 在文件夹中创建空文件
touch "$FOLDER_NAME/docker-compose.yml"
touch "$FOLDER_NAME/README.md"

# 输出成功信息
echo "Folder '$FOLDER_NAME' created with docker-compose.yml and README.md"
