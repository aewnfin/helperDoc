# 终端
CentOS 7 （命令行模式下）终端 （tty）最多为 6 个，可以通过命令 `chvt n` （n 为 1~6）切换命令行模式终端。
> tty0 表示当前虚拟终端
```sh
# 切换至虚拟终端 tty4
chvt 4

# 当前虚拟终端
tty
# /dev/tty4

# 虚拟终端使用情况
w

# 退出虚拟终端
logout

```
