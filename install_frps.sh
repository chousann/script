#!/bin/bash
# frp官方下载
# https://github.com/fatedier/frp/releases
# 下载 frp
wget -O frp_0.49.0_linux_amd64.tar.gz https://github.com/fatedier/frp/releases/download/v0.49.0/frp_0.49.0_linux_amd64.tar.gz
# 解压 frp
tar -xzvf frp_0.49.0_linux_amd64.tar.gz
cd frp_0.49.0_linux_amd64/
# 配置 frps 设置
read -ep "请输入FRPS监听端口: （7000）" bind_port &&
read -ep "请输入FRPS Token: （freefrp.net）" token
if [[ -z "${bind_port}" ]]; then
	bind_port=7000
fi
if [[ -z "${token}" ]]; then
	token=freefrp.net
fi
# 配置 frps
cat << EOF > ./frps.ini
[common]
bind_port = ${bind_port}
token = ${token}
EOF
# 启动 frps
nohup ./frps -c ./frps.ini > run.log 2>&1 &