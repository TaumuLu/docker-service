FROM jenkins/jenkins:lts

USER root

# 安装 Docker CLI（docker命令）
RUN apt-get update && \
    apt-get install -y docker.io && \
    rm -rf /var/lib/apt/lists/*

# 确保 jenkins 用户可以访问 docker.sock（此处权限通过挂载时处理）
USER jenkins
