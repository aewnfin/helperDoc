#!/bin/bash
# author:aewnfin
# date:2020-03-19 星期四 17:54

echo "获取 mysql 安装源"
cd /tmp/
wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
yum localinstall mysql80-community-release-el7-3.noarch.rpm

echo "指定 mysql 安装版本为 5.7"
yum install yum-utils -y
yum-config-manager --disable mysql80-community
yum-config-manager --enable mysql57-community
echo "查看已启用版本："
yum repolist enabled | grep mysql
echo "安装 MySQL database"
yum install mysql-community-server -y

echo "开放端口"
firewall-cmd --permanent --add-port=3306/tcp
firewall-cmd --reload
echo "防火墙状态："
firewall-cmd --list-all

echo "启动 MySQL 服务器,初始化..."
service mysqld start
echo "MySQL 服务器状态："
service mysqld status

echo "初始密码："
grep 'temporary password' /var/log/mysqld.log
echo "请尽快更改 root 密码"
mysql -u root -p


