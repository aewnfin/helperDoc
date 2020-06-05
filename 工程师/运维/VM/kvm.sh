#!/bin/bash

#egrep '(vmx|svm)' /proc/cpuinfo
# 硬件虚拟化支持 (Intel VT)
grep vmx /proc/cpuinfo
# 硬件虚拟化支持 (AMD V)
grep svm /proc/cpuinfo

# 在 BIOS 里开启 VT
#Intel(R) Virtualization Tech [Enabled]
# 如有必要，还需在 BIOS 中开启 VT-d

# 确保内核版本较新，支持 KVM
uname -r
# 如果在 2.6.20 以下的 linux 版本，需升级内核

# Ubuntu 中安装
sudo apt-get install kvm qemu qemu-kvm virt-manager kernel-package linux-source kqemu-source build-essential
# /dev/kvm
# 如果无需图形管理器，只需要安装前三个即可
virsh -c qemu:///system list
# Connecting to uri: qemu:///system
# Id Name State

# CentOS 中安装
# 选择 Selinux 为 enable
system-config-securitylevel-tui
# 安装
yum install kvm kmod-kvm qemu
# 再装入kvm模块：
# (Intel 机器)
#yum install modprobe kvm-intel
# (amd机器)
#yum install modprobe kvm-amd
# 检查是否装入 kvm 模块
/sbin/lsmod | grep kvm

# /usr/libexec
# /bin
# /usr/bin
# /usr/sbin
qemu-kvm
# 找不到 qemu-kvm 可执行文件，可执行以下命令：
#yum provides "*/qemu-kvm"

