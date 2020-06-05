#!/bin/bash

# 查看总流量
# -s 总流量
# -h 人类可读的格式
# link 选择各网卡
ip -s -h link

# 查看当前网络速率
#yum install -y epel-release && yum install -y nload
# eth0 指定网卡
nload eth0

# 查看实时网速网速
#yum install -y iptraf-ng
iptraf-ng -g

# 系统信息统计
#yum install -y dstat
# 接下来10秒内每秒的网络数据
dstat -tnf 1 10
# 替换 vmstat、iostat、netstat、nfsstat 和 ifstat 的全能系统信息统计工具

# 从磁盘IO、CPU负载、内存使用对系统活动进行报告
#yum install -y sysstat
# 接下来10秒内的tcp数据
sar -n TCP 1 10

# 查看连接/进程流量
ss -nt

# 查看每个连接的实时速率
#yum install -y epel-release && yum install -y iftop
# 实时查看 eth0 网卡的各个连接和网速
iftop -nN -i eth0

# 查看单个进程流量
#yum install -y epel-release && yum install -y nethogs
# 每2秒刷新流经eth0网卡的进程流量信息
nethogs -d 2 eth0

# 抓包
tcpdump
# 查看数据包
wireshark