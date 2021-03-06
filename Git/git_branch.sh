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