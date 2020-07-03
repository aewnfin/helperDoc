# 将当前修改“已跟踪文件”加入贮藏
git stash
#--keep-index 不仅要贮藏所有已暂存的内容，同时还要将它们保留在索引中
git stash --keep-index
#-u 额外的，贮藏任何“未跟踪文件”
git stash -u
#-a 额外的，贮藏任何“明确忽略的文件”
git stash -a
#--patch 会交互式地提示哪些改动想要贮藏、哪些改动需要保存在工作目录中
git stash --patch

# 罗列贮藏
git stash list
#stash@{0}: WIP on master: 049d078 added the index file
#stash@{1}: WIP on master: 049d078 Revert "added file_size"
#stash@{2}: WIP on master: 21d80a5 added number to log

# 重新应用最进的贮藏
git stash apply
# 立即应用立即删除
git stash pop

# 文件的改动被重新应用了，但是之前暂存的文件却没有重新暂存。
#--index 来尝试重新应用暂存的修改
#git stash apply --index


# 重新应用指定的贮藏
git stash apply stash@{2}

# 删除指定的贮藏
git stash drop stash@{0}

# git stash branch <new branchname>
# 以你指定的分支名，从贮藏创建一个新分支
git stash branch testchanges