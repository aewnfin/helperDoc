#!/bin/bash
# 备份
cd /etc/yum.repos.d/
mv CentOS-Base.repo CentOS-Base.repo.bak

# 下载
# CentOS 5
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-5.repo
# CentOS 6
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
# CentOS 7
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

# 重新生成缓存
yum clean all
yum makecache
yum update