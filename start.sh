#!/bin/bash

# 定义各个服务的路径
services=(
    "frp/frpc"
)

# 遍历启动每个服务
for service in "${services[@]}"; do
    echo "Starting service in $service..."
    docker-compose -f "$service/docker-compose.yml" up -d
done

echo "All services started!"
