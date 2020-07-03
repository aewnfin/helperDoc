# 配置服务器
MySQL 服务器 mysqld 具有许多 **命令选项** 和 **系统变量** ，可以在启动时进行设置以配置其操作。

## 查看配置
> 要确定服务器使用的默认命令选项和系统变量值，请执行以下命令：
```sh
shell> mysqld --verbose --help
```

> 要在服务器运行时查看服务器实际使用的当前系统变量值，请连接至该服务器并执行以下语句：
```sql
mysql> SHOW VARIABLES;
```

> 要查看正在运行的服务器的一些统计信息和状态指示器，请执行以下语句：
```sql
mysql> SHOW STATUS;
```

> 也可以使用 mysqladmin 命令获得系统变量和状态信息 ：
```sh
shell> mysqladmin variables
shell> mysqladmin extended-status
```


## 选项文件
在大多数情况下，希望确保服务器每次运行都使用相同的选项，确保这一点的最佳方法是在 **选项文件** 中列出它们。

- **mysqld** -Mysql服务器
```ini
# mysqld 从 [mysqld] 和 [server] 组中读取选项
[mysqld]
[server]
```

- **mysqld_safe** -MySQL服务器启动脚本
```ini
# mysqld_safe 从 [mysqld],[server],[mysqld_safe] 和 [safe_mysqld] 组读取选项
[mysqld]
[server]
[mysqld_safe]
[safe_mysqld]
```

- **mysql.server** -MySQL服务器启动脚本
```ini
# mysql.server 从 [mysqld] 和 [mysql.server] 组中读取选项
[mysqld]
[mysql.server]
```

> ### 注意
>对于某些 Linux 平台，从 RPM 或 Debian 软件包安装的 MySQL 包括对管理 MySQL 服务器启动和关闭的系统支持。在这些平台上，未安装 mysql.server 和 mysqld_safe ，因为它是不必要的。有关更多信息，请参见 第2.5.9节“使用systemd管理MySQL Server”。
>
> https://dev.mysql.com/doc/refman/8.0/en/using-systemd.html


## 验证
从 MySQL 8.0.16 开始，MySQL Server 支持一个 --validate-config 选项，该选项使您无需在正常操作模式下运行服务器即可检查启动配置是否存在问题：
```sh
mysqld --validate-config
```
