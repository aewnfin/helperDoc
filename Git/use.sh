# git clone [url] [dir_name]
# 克隆远程版本库
# --bare 不克隆文档树
git clone file:///h/workspace/.git workspace
# 支持协议：
# http/https
# ssh/
# git
# file
# ftp/ftps
# rsync

# git remote add [tag] [url]
# 为本地仓库设置远程仓库
#git remote add wisedata file:///h/workspace/.git
# 删除设置的远程仓库
#git remote rm [tag]
# 参看远程主机的网址
git remote -v

#git status
#git add
#git commit -m 'I have add a new file'

# 以不影响本地代码的方式，获取远程更新
#git fetch origin master
# 查看获取的远程分支
#git branch -r
#   origin/master
# 查看所有分支
#git branch -a
# * master
#   remotes/origin/master

# git pull <远程主机名> <远程分支名>:<本地分支名>
# 拉取合并远程分支到当前分支
git pull origin master

# git push <远程主机名> <本地分支名>:<远程分支名>
# 将本地分支的更新，推送到远程主机与之存在"追踪关系"的远程分支（通常两者同名），如果该远程分支不存在，则会被新建。
git push origin master

# ========================================================
# 新增远程仓库
# --------------------------------------------------------
# git remote add [tag] [url]
# 为本地仓库设置远程仓库
#git remote add local_hub file:///H/workspace.git/
# --------------------------------------------------------