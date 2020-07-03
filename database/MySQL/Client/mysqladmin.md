# mysqladmin
——执行管理操作的客户端
> 检查服务器的配置和当前状态，创建和删除数据库等等

```sh
mysqladmin [options] command [command-arg] [command [command-arg]] ...
```
## 命令
- create
- debug
- drop
- extended-status
- flush-hosts
- flush-logs [binary engine error general relay slow]
- flush-privileges
- flush-status
- flush-tables
- flush-threads
- kill id,id,...
- password new_password
- ping
- processlist
- reload
- refresh
- shutdown
- start-slave
- status
- stop-slave
- variables
- version

## 设置变量
```sh
--var_name=value
```
- connect_timeout
    连接超时之前的最大秒数。默认值为43200（12小时）
- shutdown_timeout
    等待服务器关闭的最大秒数。默认值为3600（1小时）
