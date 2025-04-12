# 使用官方 Uptime Kuma 镜像作为基础镜像
FROM louislam/uptime-kuma:1

# 暴露 Uptime Kuma 默认端口
EXPOSE 3001

# 设置工作目录（Uptime Kuma 镜像默认工作目录是 /app）
WORKDIR /app

# 数据卷（Render 会通过服务配置挂载磁盘）
VOLUME /app/data

# 启动命令（Uptime Kuma 镜像已内置 ENTRYPOINT，这里无需额外指定）
# CMD 已经在基础镜像中定义为启动 Uptime Kuma 服务

# 健康检查（可选，但推荐用于 Render，确保服务正常运行）
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD curl -f http://localhost:3001/health || exit 1
