#!/bin/bash\
# author: aewnfin
# date: 2020-4-2
# 用于删除 mysql 服务器所有业务表数据

# 依赖 mysql 配置 ~/.mylogin.cnf

mysql --login-path=$1 -e "show databases ;" --skip-column-names \
| grep -Ev "mysql|information_schema|performance_schema|sys" \
| xargs mysqldump --login-path=$1 --databases --add-drop-database --no-data \
> dump.sql

mysql --login-path=$1 --verbose < dump.sql \
| grep -Ev "SET|^-|^$"
