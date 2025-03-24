## 相关链接

- https://github.com/NginxProxyManager/nginx-proxy-manager
- https://docs.halo.run/getting-started/install/other/nginxproxymanager/

## 关闭 80 服务

```
sudo systemctl stop apache2
sudo systemctl stop nginx

sudo systemctl disable apache2
sudo systemctl disable nginx
```

## 添加跨域

```conf
location / {
  # 代理到后端服务
  proxy_pass $forward_scheme://$server:$port;

  # 添加 CORS 头部
  add_header 'Access-Control-Allow-Origin' '*' always;  # 允许所有域名跨域请求
  add_header 'Access-Control-Allow-Methods' 'GET, POST, PUT, DELETE, OPTIONS' always;  # 允许的请求方法
  add_header 'Access-Control-Allow-Headers' 'Origin, X-Requested-With, Content-Type, Accept, Authorization' always;  # 允许的请求头

  # 处理预检请求
  if ($request_method = 'OPTIONS') {
      add_header 'Access-Control-Allow-Origin' '*';
      add_header 'Access-Control-Allow-Methods' 'GET, POST, PUT, DELETE, OPTIONS';
      add_header 'Access-Control-Allow-Headers' 'Origin, X-Requested-With, Content-Type, Accept, Authorization';
      add_header 'Access-Control-Max-Age' 1728000;  # 设置预检请求缓存的时间
      return 204;  # 返回空响应
  }

  # 其他代理设置
  proxy_set_header Host $host;
  proxy_set_header X-Real-IP $remote_addr;
  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  proxy_set_header X-Forwarded-Proto $scheme;
}
```
