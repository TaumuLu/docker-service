#!/bin/bash

# 定义各个服务的路径
services=(
  "Devops/frp/frpc"
)

# 显示使用方法
show_usage() {
  echo "用法: $0 [start|stop]"
  echo "start: 启动所有服务（默认）"
  echo "stop:  停止所有服务"
  exit 1
}

# 获取操作类型
ACTION=${1:-start}

case $ACTION in
start)
  # 遍历启动每个服务
  for service in "${services[@]}"; do
    echo "正在启动服务: $service..."
    docker-compose -f "$service/docker-compose.yml" up -d
  done
  echo "所有服务已启动！"
  ;;
stop)
  # 遍历停止每个服务
  for service in "${services[@]}"; do
    echo "正在停止服务: $service..."
    docker-compose -f "$service/docker-compose.yml" down
  done
  echo "所有服务已停止！"
  ;;
*)
  show_usage
  ;;
esac
