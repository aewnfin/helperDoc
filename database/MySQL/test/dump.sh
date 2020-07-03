#!/bin/bash

# 需要权限: select 转储表, show view 转储视图, trigger 转储触发器, lock table --single-transaction
mysqldump\

# [默认]选择-不包含 create database 和 use 语句 ———— 失效 goto:dropDB
#db1 table1 table2 \
# 选择-特定数据库 -B ;输出将额外增加 create database 和 use 语句
--databases db1 db2 db3 \
# 选择-所有库 -A
#--all-databases \

# [默认]锁表
#--add-locks
# 不锁表
#--skip-add-locks

# 删除-在对应 create database 语句前增加 drop database 删除语句 tag:dropDB
--add-drop-database \
# [默认]删除-在建表之前, 先执行删表操作
#--add-drop-table \
# 删除-在创建触发器之前, 先删除触发器
#--add-drop-trigger

# 排除-数据 -d
--no-data
# 排除表结构 -t

# 过程控制-关闭默认缓冲, 转为逐行转储
#--quick
# 过程控制--opt(内含--quick) ;如需开启缓冲 goto:skip
#--opt
# 过程控制-开启内存缓冲 tag:skip
#--skip-quick

# [默认]口令-使用账户
#-u root
# 口令-请输入密码
-p

# 网络-指定接口
#--bind-address

# 帮助
#--help

# 输出-为每个转储的表产生两个输出文件 :数据文件 tbl_name.txt , 建表文件 tbl_name.sql
#--tab=/tmp \
# [默认]输出-将SQL语句写入标准输出 :包含 CREATE , INSERT 语句
> file_name.sql







# 不备份-数据 ,只备份表结构
--skip-dump-rows \
