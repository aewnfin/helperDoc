# Samba
Samba 服务程序：
- smb
- nmb

> centos 6: 开机自启
> ```sh
> chkconfig --level 35 smb on
> chkconfig --level 35 nmb on
> ```
> centos 7: 开机自启
> ```sh
> systemctl enable smb nmb
> ```

## Server
Samba 使用的协议和端口：
- NetBIOS
    - 137/udp
    - 138/udp
- SMB
    - 139/tcp
- LDAP
    - 389/tcp
- CIFS
    - 445/tcp

## shell 命令
```sh
# 新建 Samba 用户
#smbpasswd -a root
smbpasswd -a jliu
#;redhat
pdbedit -L

# 创建文件夹
mkdir -p /srv/samba/guest
chmod -R 777 /srv/samba/guest

# 检查配置文件
testparm -s smb.conf

# 开机自启
systemctl enable smb nmb

# 开放防火墙
firewall-cmd --permanent --add-service=samba
firewall-cmd --reload
# success

# 关闭 Selinux
sed 's/enforcing/disabled' /etc/sysconfig/selinux
getenforce
#Permissive
reboot
```
<div STYLE="page-break-after:always"><div>

## 使用
windows：共享目录
```cmd
net  use  *  /del 删除缓存(命令窗口)
```

linux：客户端
```sh
smbclient  //192.168.140.253/共享目录 -U 用户 -p 密码
```
