#!/bin/bash

# 如果-转储文件不包含 create database 和 use 语句 ;需创建数据库 goto:newDB
#mysqladmin create db1
# 重新加载 sql 备份 ;指定数据库 tag:newDB
#mysql db1 < file_name.sql
# 重新加载 sql 备份
mysql < file_name.sql

# 加载界定文本格式备份
#mysql db1 < t1.sql
#mysqlimport db1 t1.txt