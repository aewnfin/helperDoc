# MySQL 程序概述
## MySQL 服务器
- mysqld
- mysql_safe
- mysql.server
- mysqld_multi

## 安装 升级辅助程序
- comp_err
- mysql_secure_installation
- mysql_ssl_rsa_setup
- mysql_tzinfo_to_sql
- mysql_upgrade

## MySQL 客户端
- mysql
- mysqladmin
- mysqlcheck
- mysqldump
- mysqlimport
- mysqlpump
- mysqlsh
- mysqlshow
- mysqlslap

## 管理和实用程序
- innochecksum
- myisam_ftdump
- myisamchk
- myisamlog
- myisampack
- mysql_config_editor
- mysqlbinlog
- mysqldumpslow

## MySQL 开发实用程序
- mysql_config
- my_print_defaults

## 杂项实用程序
- lz4_decompress
- perror
- zlib_decompress

## GUI 程序
- MySQL for Excel
- MySQL Notifier
- MySQL Workbench


# 选项文件
## 优先级
| 选项文件                   | 生效范围                          |
|---------------------------|-----------------------------------|
| /etc/my.cnf               |全局                               |
| /etc/mysql/my.cnf         |全局                               |
| SYSCONFDIR/my.cnf         |全局 -CMake 指定                   |
| $MYSQL_HOME/my.cnf        |仅服务器                           |
| defaults-extra-file       |--defaults-extra-file 选项指定      |
| ~/.my.cnf                 |特定用户                            |
| ~/.mylogin.cnf            |特定用户-登录路径选项文件            |
| DATADIR/mysqld-auto.cnf   |仅服务器                            |

- SYSCONFDIR        : 构建时由 CMake 选项 SYSCONFDIR 指定的目录，默认为 etc 下安装目录
- MYSQL_HOME        : 环境变量，mysqld_safe 启动服务器时，以 BASEDIR 将其设置为 MySQL 基本安装目录
- DATADIR           : 在处理 mysqld-auto.cnf 之前，可由其它选项文件或命令行选项通过 `--datadir` 来更改
- !include          : 在选项文件中包含其他选项文件
- !includedir       : 搜索目录,在选项文件中包含其他选项文件

## 加载方式
- --defaults-extra-file=file_name
- --defaults-file=file_name
- --defaults-group-suffix=str
- --login-path=name
- --no-defaults
- --print-defaults