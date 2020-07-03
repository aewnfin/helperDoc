git config
# --system 指定全局配置文件 /etc/gitconfig
# --global 指定当前用户文件   ~/.gitconfig
# --local  当前库的配置文件    .git/config
# ---------------------------------------------------------
# 查看当前配置
git config --list

# 初始化 user.name 和 user.email
git config --global user.name "输入你的用户名"
git config --global user.email "输入你的邮箱"

# 修改 user.name 和 user.email
git config --global --replace-all user.name "输入你的用户名"
git config --global --replace-all user.email "输入你的邮箱"