# 2020/4/18 最新 samba-4.12.1
# centos 6 ## samba-3.6.23-51.el6.x86_64
# centos 7 ## samba-4.9.1-6.el7.x86_64

# 用户：bjiang
# 密码：Bjiang0303
# 管理员 ???

cat /etc/redhat-release
# CentOS 6.9

# 安装 samba
#yum install samba -y
smbd -V

# 新建 Samba 用户
smbpasswd -a root
#passwd: redhat
pdbedit -L

# 创建文件夹
mkdir /samba
chmod 777 /samba

# 配置 /etc/samba/smb.conf
mv smb.conf smb.conf.bak
vi /etc/samba/smb.conf

# 检测配置文件
testparm -s smb.conf
# Loaded services file OK.

# 启动 Samba 服务
service smb start
service nmb start

# 设置开机自启动
chkconfig --level 35 smb on
chkconfig --level 35 nmb on
chkconfig --list | grep smb

# 配置防火墙
#cd /etc/sysconfig/
#echo "-A INPUT -m state --state NEW -m tcp -p tcp --dport 139 -j ACCEPT" > iptables
#echo "-A INPUT -m state --state NEW -m tcp -p tcp --dport 445 -j ACCEPT" > iptables
#echo "-A INPUT -m state --state NEW -m udp -p udp --dport 137 -j ACCEPT" > iptables
#echo "-A INPUT -m state --state NEW -m udp -p udp --dport 138 -j ACCEPT" > iptables
#service iptables save
#service iptables restart
#iptables -L -n
#iptables --list-rules