#!/bin/bash
# author:aewnfin
# date:2020-03-19 星期四 17:40

#yum deplist lighttpd-fastcgi
echo "准备"
yum install epel-release -y
yum update

echo "这将安装 Lighttpd 服务器"
yum install lighttpd -y
echo "安装 Lighttpd-组件"
yum install lighttpd-fastcgi -y

echo "安装完成"
lighttpd -v

echo "启动"
systemctl start lighttpd