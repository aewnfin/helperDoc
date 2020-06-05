#!/bin/bash
# shell 提示符格式1
echo $PS1
#[\u@\h \W]\$

# shell 提示符格式2
echo $PS2
#>

# https://www.cnblogs.com/Dreamer-qiao/p/7617344.html
PS1='[\[\e[32;40m\]\u@\h \w \t\e[m]\$'
# shell 环境变量配置文件
# 所有用户
vi /etc/bashrc
# 当前用户
vi ~/.bashrc

################
# 当前所有受支持的 shell
cat /etc/shells
#/bin/sh                                                                                                                              
#/bin/bash                                                                                                                            
#/sbin/nologin                                                                                                                        
#/usr/bin/sh                                                                                                                          
#/usr/bin/bash                                                                                                                        
#/usr/sbin/nologin                                                                                                                    
#/bin/tcsh                                                                                                                            
#/bin/csh                                                                                                                             
#/bin/zsh 

# 当前的 shell 环境
echo $SHELL

# chsh 修改默认 shell
grep merle /etc/passwd
#merle:x:1000:1000:merle:/home/merle:/bin/zsh
chsh

# usermod 修改默认 shell
usermod -s /bin/zsh merle

# 创建用户时指定
useradd -s /bin/zsh username