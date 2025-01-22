# 使用官方 Nginx 镜像
FROM nginx:latest

# 拷贝自定义 Nginx 配置
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 将静态资源复制到 Nginx 的默认 HTML 目录
COPY public/ /usr/share/nginx/html/

# 暴露 80 端口
EXPOSE 80
