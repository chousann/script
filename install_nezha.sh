#!/bin/sh
# 安装
# https://github.com/naiba/nezha
# https://nezha.wiki/
apk update && apk add --no-cache wget unzip
# 下载 nezha
wget https://raw.githubusercontent.com/chousann/script/main/nezha.zip -O nezha.zip
# 解压 nezha
mkdir -p nezha
unzip nezha.zip
cd nezha
read -ep "安装面板端:1 OR 启动面板:2 (1|2)" flg
if [ "$flg" == 2 ];then
# 配置 nezha
	read -ep "请输入 Oauth2 应用的 Client ID: " nz_github_oauth_client_id &&
	read -ep "请输入 Oauth2 应用的 Client Secret: " nz_github_oauth_client_secret &&
	read -ep "请输入 GitHub/Gitee 登录名作为管理员，多个以逗号隔开: " nz_admin_logins &&
	read -ep "请输入站点访问端口: (默认 8008)" nz_site_port &&
	read -ep "请输入用于 Agent 接入的 RPC 端口: (默认 5555)" nz_grpc_port
	sed -i "s/Oauth2_Admin/${nz_admin_logins}/" data/config.yaml
	sed -i "s/GRPC_Port/${nz_grpc_port}/" data/config.yaml
	sed -i "s/HTTP_Port/${nz_site_port}/" data/config.yaml
	sed -i "s/Oauth2_ClientID/${nz_github_oauth_client_id}/" data/config.yaml
	sed -i "s/Oauth2_ClientSecret/${nz_github_oauth_client_secret}/" data/config.yaml
fi
# 启动 nezha
./app