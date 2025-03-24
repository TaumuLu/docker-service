#!/bin/bash

# 定义需要跳过的文件数组
files_to_skip=(
  "Devops/frp/frpc/frpc.toml"
  "Proxy/subconverter/base/pref.toml"
)

# 显示使用方法
show_usage() {
  echo "用法: $0 [-r|--restore]"
  echo "不带参数: 设置文件为 skip-worktree"
  echo "-r, --restore: 取消文件的 skip-worktree 设置"
  exit 1
}

# 处理命令行参数
RESTORE=false
while [[ $# -gt 0 ]]; do
  case $1 in
  -r | --restore)
    RESTORE=true
    shift
    ;;
  -h | --help)
    show_usage
    ;;
  *)
    show_usage
    ;;
  esac
done

# 遍历数组并执行 git update-index
for file in "${files_to_skip[@]}"; do
  if [ "$RESTORE" = true ]; then
    git update-index --no-skip-worktree "$file"
    echo "已取消跳过: $file"
  else
    git update-index --skip-worktree "$file"
    echo "已设置跳过: $file"
  fi
done
