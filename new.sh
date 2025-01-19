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
touch "$FOLDER_NAME/.gitignore"

# 输出成功信息
# 输出成功信息
echo -e "Created Folder $FOLDER_NAME"
echo -e "Created files at:"
echo -e "\033[32m$PWD/$FOLDER_NAME/docker-compose.yml\033[0m"
echo -e "\033[32m$PWD/$FOLDER_NAME/README.md\033[0m"
echo -e "\033[32m$PWD/$FOLDER_NAME/.gitignore\033[0m"