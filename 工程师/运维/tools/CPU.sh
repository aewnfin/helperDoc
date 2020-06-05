#!/bin/bash

# 查看 CPU 核心数
cat /proc/cpuinfo| grep "cpu cores"| uniq

# 总体的系统运行状态和所有 cpu 的使用率
top

# 12 秒每 2 秒定时采样系统资源占用
#yum install sysstat -y
vmstat 2 12

# 每 1 秒采集一次CPU使用率
#yum install sysstat -y
# -P 0 指定某颗 cpu
# -q 进程队列
# -w 创建的平均值和上下文切换的次数
sar -u 1 5
# 获取过去指定日期的性能参数
#sar -u -f /var/log/sa/sa08

# 比 sar 更加详细些
#yum install sysstat -y
mpstat 1 5

# 查看 io 使用情况，也可以来查看 cpu
iostat -c 1 2

# 每秒 cpu 使用率情况获取
dstat -c
# 最占 cpu 的进程获取
dstat --top-cpu