# 初始化指定目录
# git init [workspace]
# 初始化当前目录为 git 仓库
git init

# 查看项目当前暂存状态
git status -s
# U 工作区新文件
# A 已加入暂存
# M 内容变更，需要重新加入暂存

# U -> A 将文件纳入版本控制（存放于暂存区）
# git add [file_name]
#git add README
#git add *.c
git add .

# 提交暂存区内容加入版本库
# -a 跳过繁琐的流程
# -m [关于此次提交的说明]
git commit -m 'add into git today'

# ===============================================================
# 作为远程仓库使用
# ---------------------------------------------------------------
# 修改.git/config文件，添加如下代码
#[receive]
#denyCurrentBranch = ignore

# 刷新 .git 索引，查看当前分支接受了远程 push 之后的内容
git reset --hard

# https://blog.csdn.net/wangjia55/article/details/48549403
#git config --bool core.bare true
# ---------------------------------------------------------------