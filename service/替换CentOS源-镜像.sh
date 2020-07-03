#!/bin/bash
########################
## 替换 CentOS 源-镜像 ##
########################
# 查看当前 CentOS 版本
cat /etc/centos-release

## 备份 ##
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak

## 替换 CentOS 6 源 ##
# 阿里云镜像站 http://mirrors.aliyun.com/repo/Centos-6.repo
#wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
# ================================= CentOS 6

## 替换 CentOS 7 源 ##
# 阿里云镜像站 http://mirrors.aliyun.com/repo/Centos-7.repo
#wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
# ================================= CentOS 7
## 改为使用 阿里云镜像站 源 ##
sed -i -e '/mirrors.cloud.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo
sed -i -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo

## 重新生成 yum 缓存 ##
yum clean all
yum makecache

## 升级系统 ##
#yum update