# SELinux <small><small>*Security-Enhanced Linux*</small></small>
——美国国家安全局（NAS）对于强制访问控 制的实现，在这种访问控制体系的限制下，进程只能访问那些在他的任务中所需要文件。

SELinux 就绪的发行版：
- Fedora
- Red Hat Enterprise Linux (RHEL)
- Debian
- Gentoo

SElinux 模式：
- enforcing ：强制
- permissive ：仅警告
- disabled ：停用

SElinux 配置文件：
- /etc/selinux/config

SElinux 策略保存的位置：
- /etc/selinux/<策略名>/policy/

## SElinux 命令介绍
### 查询状态
```sh
# 查询 selinux 状态
sestatus
# 查询 selinux 激活状态
selinuxenabled
echo $?
# 回显 -256 为非激活状态
```
### 切换模式
```sh
## 切换模式 - 仅警告
#setenforce permissive
setenforce 0
## 切换模式 - 强制
setenforce 1
# 查看当前模式
getenforce
```
### 检查安全上下文
```sh
# 检查帐号的安全上下文
id -Z
# 检查进程的安全上下文
ps -Z
# 检查文件与目录的安全上下文
ls -Z
```
### 修改 文件/目录 安全上下文与策略
- chcon -R -tsamba_share_t /tmp/abc
    - -u[user]
    - -r[role]
    - -t[type]
    - -R 递归

`getsebool -a` 同 `sestatus -b` ，查看本机 selinux 策略值。（策略值是对安全上下文的补充）
- setsebool -P allow_ftpd_anon_write=1
    - -P ：永久性设置

## 应用
### SElinux 与 samba
samba 共享的文件必须用正确的 selinux 安全上下文标记
```sh
chcon -R -t samba_share_t /tmp/abc
# 如果共享/home/abc，需要设置整个主目录的安全上下文
#chcon -R -r samba_share_t /home
```

> SP
>
> CentOS 系统自带的 `chcon` 工具只能修改文件、目录等的文件类型和策略。
> 所以需要安装 `semanage` 对端口、消息接口和网络接口等进行管理
> ```sh
> # yum install semanage
> # yum provides semanage
> yum -y install policycoreutils-python.x86_64
>
> # 管理登录linux的用户和SELinux局限的用户之间的映射
> semanage login [-S store] -{a|d|m|l|n|D} [-sr] login_name | %groupname
> # 管理策略模块
> semanage module [-S store] -{a|d|l} [-m [–enable | –disable] ] module_name
> # 管理网络端口类型定义
> semanage port [-S store] -{a|d|m|l|n|D} [-tr] [-p proto] port | port_range
> ```
