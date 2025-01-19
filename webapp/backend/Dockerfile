# 使用官方 Node.js 镜像作为基础镜像
FROM node:18

# 设置工作目录
WORKDIR /usr/src/app

# 将 package.json 和 package-lock.json 复制到容器中
COPY package*.json ./

# 安装依赖
RUN npm install

# 将应用的代码复制到容器中
COPY . .

# 暴露容器的 3000 端口
EXPOSE 3000

# 启动应用
CMD ["npm", "start"]