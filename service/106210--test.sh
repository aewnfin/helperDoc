#!/bin/bash
####################
# 主机ip:192.168.106.210
####################

cat /etc/redhat-release
# CentOS 6.9
uname -a
# x86_64

# https://pkgs.org/

# mirror.centos.org
# http://mirror.centos.org/centos/7/os/x86_64/Packages/tk-devel-8.5.13-6.el7.x86_64.rpm
yum install tk-devel -y

# mirror.centos.org
# http://mirror.centos.org/centos/7/os/x86_64/Packages/libffi-3.0.13-18.el7.x86_64.rpm
yum install libffi-devel -y

# mirrors.aliyuncs.com
# mirrors.cloud.aliyuncs.com

# firefox 68.6.0
yum install firefox-68.6.0-1.el6.centos.x86_64 -y

# geckodriver 0.26.0
# https://linux.cn/article-7369-1.html
# https://github.com/mozilla/geckodriver/releases
#curl https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz
cd /tmp/
wget https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz
tar -zxvf geckodriver-v0.26.0-linux64.tar.gz
mv geckodriver /usr/local/bin

############################################################################
# yum install openssl-devel -y
# openssl 1.0.1e-fips 11 Feb 2013

# openssl 1.0.2 or 1.1.x
# https://www.openssl.org/source/
cd /tmp/
wget https://www.openssl.org/source/openssl-1.1.1f.tar.gz
tar -zxvf openssl-1.1.1f.tar.gz
cd openssl-1.1.1f
./config --prefix=/usr/local/openssl no-zlib
make && make install
# 备份
#mv /usr/bin/openssl /usr/bin/openssl.bak
#mv /usr/include/openssl/ /usr/include/openssl.bak
# 链接
ln -s /usr/local/openssl/include/openssl /usr/include/openssl
ln -s /usr/local/openssl/lib/libssl.so.1.1 /usr/local/lib64/libssl.so
ln -s /usr/local/openssl/bin/openssl /usr/bin/openssl
# 添加库搜索路径
echo "/usr/local/openssl/lib" >> /etc/ld.so.conf
ldconfig -v

openssl version
# OpenSSL 1.1.1f 31 Mar 2020

# Python 3.8.2
# 已有 Python 2.6.6
# https://www.python.org/ftp/python/
cd /tmp/
wget https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tgz
tar -zxvf Python-3.8.2.tgz
#yum install zlib-devel -y
cd Python-3.8.2
./configure prefix=/usr/local/python3 --with-openssl=/usr/local/openssl
make && make install
# Installing collected packages: pip-19.2.3 , setuptools-41.2.0

#mv /usr/bin/python /usr/bin/python.bak
ln -s /usr/local/python3/bin/python3.8 /usr/bin/python3
python3 -V

# pip jieba
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3

# 替换镜像 清华 https://pypi.tuna.tsinghua.edu.cn/simple ；5 分钟同步一次官网 pypi

# 永久替换镜像 “~/.pip/pip.conf”
mkdir ~/.pip
> ~/.pip/pip.conf
echo "[global]" >> ~/.pip/pip.conf
echo "index-url = https://pypi.tuna.tsinghua.edu.cn/simple" >> ~/.pip/pip.conf

# 临时替换镜像 -i https://pypi.tuna.tsinghua.edu.cn/simple 
pip3 install --upgrade pip
pip3 install jieba 
# jieba-0.42.1
#pip3 install -r requirements.txt


## yum 依赖 Python2
#vi /usr/bin/yum
## 把#! /usr/bin/python修改为#! /usr/bin/python2
#vi /usr/libexec/urlgrabber-ext-down
## 把#! /usr/bin/python 修改为#! /usr/bin/python2

# 爬虫乱码？ 安装字体
# yum install bitmap-fonts bitmap-fonts-cjk