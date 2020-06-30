# Linux 磁盘分区 <small>sda1 sda2 sdb1 hda1 …</small>
在 Linux 下硬盘分区的表示是通过 hd\*x 或 sd\*x 表示的，其中 \* 表示的是a、b、c … … x 表示的数字 1、2、3 … …
```sh
# 查看所有磁盘分区
fdisk -l
# Device    Boot    Start       End     Blocks  Id  System
# /dev/sda1 *        2048   1050623     524288  83  Linux
# /dev/sda2       1050624  14049279    6499328  83  Linux
# /dev/sda3      14049280  16146431    1048576  82  Linux swap / Solaris

lsblk
# NAME  MAJ:MIN RM  SIZE    RO  TYPE    MOUNTPOINT
# sda     8:0    0    8G     0  disk
# ├─sda1  8:1    0  512M     0  part    /boot
# ├─sda2  8:2    0  6.2G     0  part    /
# └─sda3  8:3    0    1G     0  part    [SWAP]
# sr0    11:0    1  792M     0  rom 

# 查看磁盘使用状况 %
df -h

# 图像化查看分区
cfdisk /dev/sda

# 查看硬盘 UUID TYPE
blkid

# 统计当前目录各文件夹大小
du -sh ./*
# 查找大文件
#du -h --max-depth=1 /var/
du -h --max-depth=1 | sort -n

# 查看内存大小
free -h

# 查看 CPU 核心数
cat /proc/cpuinfo| grep "cpu cores"| uniq

#####################################################
# 选择磁盘，进入 fdisk:命令行
fdisk /dev/sdb

m 菜单
p 显示当前设置
q 不保存退出
w 写入设置

d 删除分区
# Partition number (1-4): 1
n 新建分区
#   p   primary partition (1-4)
#   e   extended
    # 建立主分区
    select (default p): p
    # 建立扩展分区
    #select (default p): e
    # 分区编号
    Partition number (1-4): 1
    # 起始位置
    First cylinder (1-391, default 1):1
    # 结束位置
    last cylinder or +size or +sizeM or +sizeK (1-391, default 391):100
#   l   logical (5 or over)
    # 建立逻辑分区
    #select (default p): l
    # 起始位置
    First cylinder (1-391, default 1):1
    # 结束位置
    last cylinder or +size or +sizeM or +sizeK (1-391, default 391):100
    
# 格式化分区
mkfs.ext2 /dev/sdb1
mkfs.ext3 /dev/sdb6

# 挂载
mkdir /oracle
mkdir /web
mount /dev/adb1 /oracle
mount /dev/adb1 /web

# 查看挂载
df -h

## 开机自动挂载
vi /etc/fstab
#/dev/sdb1               /oracle                 ext2    defaults        0 0
#/dev/sdb6               /web                    ext3    defaults        0 0

###########################
#tmpfs 文件系统默认大小为内存的一半
mount tmpfs /dev/shm -t tmpfs -o size=32m

# 临时挂载
mount tmpfs /tmp -t tmpfs -o size=20m

# 临时修改大小
mount /dev/shm -o size=512M -o remount

# 开机启用配置
vi /etc/fstab
#tmpfs  /dev/shm    tmpfs   defaults,size=512m  0   0
# 立即生效
mount -o remount /dev/shm

# 绑定目录 /dev/shm/tmp 与 /tmp ，使用 /tmp 即使用 /dev/shm/tmp
mkdir /dev/shm/tmp
chmod 1777 /dev/shm/tmp
mount --bind /dev/shm/tmp /tmp
