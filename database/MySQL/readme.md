# 启动
## 使用 systemd 管理 mysqld
- 自启动
```bash
# Systemd 支持自启动
systemctl enable mysqld
```
- 手动
```bash
# 手动使用 systemctl 命令启用手动服务器管理
systemctl {start|stop|restart|status} mysqld
# Systemd 兼容 System V
service mysqld {start|stop|restart|status}
```

# 配置
## 优先级
①环境变量 < 选项文件 < 命令行 < 运行时

②先指定的选项 < 后重复、矛盾的选项

> 例外①：
> 对于服务器数据目录中的 *mysqld-auto.cnf* 选项文件最后被处理，因此它甚至优先于命令行选项。

> 例外②：
> 对于 mysqld ,第一次出现的 `--user` 受到保护，以防止在命令行中覆盖选项文件中指定的用户。

```bash
# 要确定程序是否读取选项文件，请使用 --help 选项调用它
mysql --help | grep cnf
#/etc/my.cnf /etc/mysql/my.cnf /usr/etc/my.cnf ~/.my.cnf

# 对于 mysqld ，请使用 --verbose 和 --help
mysqld -verbose --help | grep cnf
#/etc/my.cnf /etc/mysql/my.cnf /usr/etc/my.cnf ~/.my.cnf
```
## 环境变量
- shell 命令处理器（例如sh，ksh， bash，zsh等）
```bash
MYSQL_TCP_PORT=3306
export MYSQL_TCP_PORT
```

## 选项文件
例子-全局选项文件：
```ini
[client]
port=3306
socket=/tmp/mysql.sock

[mysqld]
port=3306
socket=/tmp/mysql.sock
key_buffer_size=16M
max_allowed_packet=128M

[mysqldump]
quick
```
例子-客户端选项文件：
```ini
[client]
# The following password will be sent to all standard MySQL clients
password="my password"

[mysql]
no-auto-rehash
connect_timeout=2
```
其他：
```ini
# 设置为仅由特定 MySQL版本系列的 mysqld 服务器读取
[mysqld-8.0]
sql_mode=TRADITIONAL

# 包含选项文件
!include /home/mydir/myopt.cnf
# 包含选项文件目录，查找.cnf结尾文件 注意：MySQL不保证目录中选项文件的读取顺序
!includedir /home/mydir
```

> 许多选项文件是使用任何文本编辑器创建的纯文本文件，例外是：
> - 登录路径文件 .mylogin.cnf 是由 mysql_config_editor 实用程序创建的加密文件
> - 数据目录中的 mysqld-auto.cnf 文件，此 JSON 格式的文件包含持久的系统变量设置；它是由服务器在执行SET PERSIST或 SET PERSIST_ONLY 语句后创建的

## 命令行
以下选项影响选项文件的处理，因此必须在命令行而不是选项文件中给出它们。
```bash
# 在全局选项文件之后但在用户选项文件之前读取此选项文件
--defaults-extra-file=file_name
# 只读给定的选项文件
--defaults-file=file_name
# 不仅阅读常规选项组，而且阅读具有常规名称和后缀 str 的组
--defaults-group-suffix=str
# 从 .mylogin.cnf 登录路径文件中的 name 登录路径读取选项
--login-path=name
# 不要读取任何选项文件
--no-defaults
# 打印程序名称及其从选项文件中获取的所有选项
--print-defaults
```

## 运行时
——许多 MySQL 程序都有内部变量，可以在运行时使用 SET 语句设置。
```sql
# 设置全局系统变量，请在变量名称前加上 GLOBAL 关键字或 @@GLOBAL. 限定符：
SET GLOBAL max_connections = 1000;
SET @@GLOBAL.max_connections = 1000;

# 设置会话系统变量，请在变量名前面增加 SESSION 或 LOCAL 关键字，又或 @@SESSION. ， @@LOCAL. 或 @@ ，或不加关键字：
SET SESSION sql_mode = 'TRADITIONAL';
SET LOCAL sql_mode = 'TRADITIONAL';
SET @@SESSION.sql_mode = 'TRADITIONAL';
SET @@LOCAL.sql_mode = 'TRADITIONAL';
SET @@sql_mode = 'TRADITIONAL';
SET sql_mode = 'TRADITIONAL';

# 要将全局系统变量持久保存到 mysqld-auto.cnf 数据目录中的 选项文件中，请在变量名称前加上 PERSIST 关键字或 @@PERSIST. 限定符：
SET PERSIST max_connections = 1000;
SET @@PERSIST.max_connections = 1000;

# 不在运行时设置应用全局变量值的情况下，将全局系统变量持久化 mysqld-auto.cnf 文件中，请在变量名称前添加 PERSIST_ONLY 关键字或 @@PERSIST_ONLY. 限定符：
SET PERSIST_ONLY back_log = 100;
SET @@PERSIST_ONLY.back_log = 100;
```

# 配置环境变量
`/etc/systemd/system/mysqld.service.d/override.conf`
`/etc/sysconfig/mysql`
- 使用命令指定选项而不直接修改systemd配置文件
```sh
systemctl set-environment MYSQLD_OPTS="--general_log=1"
systemctl unset-environment MYSQLD_OPTS
```
## 参数
- override.conf
```ini
[service]
LimitNOFILE=文件描述符限制
LimitCore=核心文件大小
Nice=优先级
```
## 环境变量
- override.conf
```ini
# 语法 Environment="var=value"
Environment="LD_PRELOAD=/path/to/malloc/library"
Environment="TZ=time_zone_setting"
```
- /etc/sysconfig/mysql
```ini
LD_PRELOAD=内存分配库
NOTIFY_SOCKET=套接字，当Type=notify进程启动类型
TZ=时区
# 定选项而不直接修改systemd配置文件
MYSQLD_OPTS=1
# 禁止自动初始化空数据目录
NO_INIT=true
```

## 加载配置
- override.conf
```sh
# 较新的systemd版本支持以下命令,创建或更 override.conf
systemctl edit mysqld

# 更改之后需要重新加载systemd配置
systemctl daemon-reload
systemctl restart mysqld
```
- /etc/sysconfig/mysql
```sh
# 更改 /etc/sysconfig/mysql 之后需要重启服务器
systemctl restart mysqld
```

# 多实例
- 单元文件 mysqld@.service
- 选项文件 /etc/my.cnf
要管理名为 replica01 和 replica02 的两个实例，请在选项文件中添加以下内容：
```ini
[mysqld@replica01]
datadir=/var/lib/mysql-replica01
socket=/var/lib/mysql-replica01/mysql.sock
port=3307
log-error=/var/log/mysqld-replica01.log

[mysqld@replica02]
datadir=/var/lib/mysql-replica02
socket=/var/lib/mysql-replica02/mysql.sock
port=3308
log-error=/var/log/mysqld-replica02.log
```
## 启动
- 由普通的systemd命令管理实例
```sh
# 启动
systemctl start mysqld@replica01
systemctl start mysqld@replica02
```
## 自启动
```sh
systemctl enable mysqld@replica01
systemctl enable mysqld@replica02
# 支持使用通配符
systemctl status 'mysqld@replica*'
```


