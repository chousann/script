#!/bin/bash
# frp官方下载
# https://github.com/fatedier/frp/releases
# 下载 frp
wget -O frp_0.49.0_linux_amd64.tar.gz https://github.com/fatedier/frp/releases/download/v0.49.0/frp_0.49.0_linux_amd64.tar.gz
# 解压 frp
tar -xzvf frp_0.49.0_linux_amd64.tar.gz
cd frp_0.46.1_linux_arm64/
# 配置 frps 设置
bind_port="7000"
token="freefrp.net"
read -ep "请输入FRPS监听端口: （7000）" bind_port &&
read -ep "请输入FRPS Token: （freefrp.net）" token
# 配置 frps
cat << EOF > ./frps.ini
[common]
bind_port = $(bind_port)
token = $(token)
EOF
# 启动 frps
# nohup ./frps -c ./frpa.ini > run.log 2>&1 &