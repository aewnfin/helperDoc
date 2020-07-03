## 初始化当前目录为 git 仓库
#git init
## 初始化指定目录
##git init workspace
#
## 查看项目当前暂存状态
#git status -s
## U 工作区新文件
## A 已加入暂存
## M 内容变更，需要重新加入暂存
#
## U -> A 将文件纳入版本控制（存放于暂存区）
##git add file_name
#git add .
##git add *.c
##git add README
#
#
## 提交暂存区内容加入版本库 -a 跳过繁琐的流程
#git commit -m 'add into git today'
#
## 在其它地方克隆此版本库
## git clone [url] [dir_name]
##git clone git://github.com/schacon/grit.git mygrit
#git clone file:///C/Users/bjiang/Documents/workspace/xx/.git xx.git

# 为本地仓库设置远程仓库
git remote add localH file:///H/wisedata_Repository/xx.git/

# 查看缓存变更的内容
# 尚未缓存的改动 AM ++—— A
git diff
# 查看已缓存的改动 A ++—— ??
git diff --cached
# 查看已缓存的与未缓存的所有改动
git diff HEAD
# 显示摘要而非整个 diff
git diff --stat

# M -> 0 取消已缓存的内容
git reset HEAD file_name

# 从 Git 中删除文件
# -f 强制删除
# --cached 取消追踪文件，仅从跟踪清单中删除
# -r 递归的删除
git rm file_name

# 移动 和 重命名
git mv file_name_old file_name_new

######################################################
# 分支
######################################################
# 创建分支命令
# -d 删除分支
git branch branch_name
# 没有参数时，默认列出分支
git branch
# * master

# 切换分支命令
# -b 创建新分支并立即切换
git checkout branch_name
# 切换分支的时候，Git 会用该分支的最后提交的快照替换你的工作目录的内容

# 合并分支命令
git merge branch_name
# 合并冲突

######################################################
# 历史记录
######################################################
# --oneline 查看简洁的历史记录 -5 显示 5 条
# --graph 查看 分支、合并 的历史记录
# --reverse 倒序显示
# --author=name 查找指定用户的提交日志
# 指定日期进行查找
# --since --before={3.weeks.ago} --until --after={2010-04-18}
# --no-merges 隐藏合并提交
# --decorate 查看我们打过的标签
git log

######################################################
# 标签
######################################################
# 永远记住那个特别的提交快照
# -a 创建一个带注解的标签
# -d 删除标签
git tag -a v1.0
# 填写注解

# 对版本 85fc7e7 追加标签
git tag -a v0.9 85fc7e7

# 查看所有标签
git tag
# 查看 v1.0 版本修改的内容
git show v1.0

# 指定标签信息命令
git tag -a <tagname> -m "runoob.com标签"
# PGP签名标签命令
git tag -s <tagname> -m "runoob.com标签"

######################################################
# 远程仓库
######################################################
# add [别名] [url] 添加远程仓库，可以指定一个简单的名字
# rm [别名] 删除远程仓库
# 默认 列出远程仓库
git remote

# 生成连接秘钥 SSH Key
#ssh-keygen -t rsa -C "youremail@example.com"

# 提交到远程仓库
git push -u 远程仓库 master

# 从远程仓库下载新分支与数据
git fetch

######################################################
# 配置
######################################################
# --system 系统级别 /etc/gitconfig C:\Users\[用户名]\.gitconfig
# --global 用户级别 ~/.gitconfig [盘符]:\.gitconfig
# --local 当前仓库级别 .git/config
# --list 列出配置参数
git config

# 设置提交时使用的 名字 和 邮箱
git config --global user.name 'runoob'
git config --global user.email 'test@runoob.com'

###################
# 绑定 github
######################
# 生成秘钥
ssh-keygen -t rsa
# 把公钥 id_rsa.pub 的内容添加到
# GitHub 》 Settings 》 SSH and GPG Keys
# 测试是否成功
ssh -T git@github.com
#Hi guobinhit!
