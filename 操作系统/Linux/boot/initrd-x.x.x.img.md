# initrd-x.x.x.img
——用来加载 ext3 等文件系统及 scsi 设备的驱动，能够临时地引导硬件到“实际内核 vmlinuz” 可以接管并继续引导的状态。

> “实际内核 vmlinuz” 中并没有 scsi 硬件的驱动，所以在装入 scsi 模块之前，内核不能加载 scsi 硬盘下的根文件系统，但 scsi 模块却又存储在根文件系统的 <u>/lib/modules</u> 下。
>
> “initrd 内核”用于修正 scsi 引导问题，实现一些加载模块和安装文件系统的功能。

> initrd 是 “initial ramdisk” 的简写
## 相关
“mkinitrd 实用程序”能够创建 “initrd 映象文件”
> `mkinitrd` 命令是 RedHat 专有的，其它 Linux 发行版或许有相应的命令。