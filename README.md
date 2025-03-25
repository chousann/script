# script

## frp内网穿透
### 内网穿透开启ssh服务
1:ssh 服务启动<br>
`service ssh restart`

2:frpc 启动<br>
`nohup ./frpc -c ./frpc.ini > run.log 2>&1 &`

步骤1,2疏通确认<br>
`ssh root@frp.freefrp.net -p 12403`

## redis 启动
`nohup redis-server > run.log 2>&1 &`