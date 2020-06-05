# System.map
——特定于内核版本的内核符号表。
|函数名\变量名|内核地址|
|--|--|
|checkCPUtype|c01000a5|
|size_t|c0343f20|
|···||

> “Linux 内核”直接通过地址来识别变量或函数名；其它应用程序如需要知道符号的地址，或者需要知道地址对应的符号，则需要查询“内核符号表”

Linux 符号表使用到2个文件:
1. /proc/ksyms
2. System.map

> <u>/proc/ksyms</u> 是一个 “proc file”，在内核引导时被创建，并非是一个真正的文件，它指向是内核数据。

## 相关
在编译内核时， System.map 由 `nm vmlinux` 命令产生，并且不相关的符号被滤出。

<u>/usr/src/linux-2.4/Makefile</u> :
```sh
nm vmlinux | grep -v '\(compiled\)\|\(\.o$$\)\|\( [aUw] \)\|\(\.\.ng$$\)\|\(LASH[RL]DI\)' | sort > System.map
cp /usr/src/linux/System.map /boot/System.map-2.4.7-10
```