# 禁用 usb 设备 <small><small><small><span style="color:red;">未经测试，仅从网络摘录<span></small></small></small>
## 从策略组入手
1. 打开“策略组”，需要运行命令 gpedit.msc 
2. 编辑策略组，依次选择 “用户配置”》“管理模板”》“系统”》“可移动存储访问”》
    可以看到，关于可移动磁盘有两条设置可选：
    - 可移动磁盘：拒绝读取权限
    - 可移动磁盘：拒绝写入权限

双击或右键编辑 “可移动磁盘：拒绝读取权限”
    - [x] 启用
双击或右键编辑 “可移动磁盘：拒绝写入权限”
    - [x] 启用

> 至此 USB 存储设备已禁用

## 从驱动入手
在路径 “C:\Windows\inf\” 下，有文件：
```
usbstor.inf
usbstor.PNF
usbport.inf
usbport.PNF
```

1. 依次右键以上文件，选择“属性”，在【安全】选项卡中修改“用户组 SYSTEM” 的权限 “完全控制” 为
    - [x] 拒绝 
2. 重启计算机

以禁止 win7 自动识别 usb 并安装驱动
> （原先在当前计算机使用过的 usb 设备能正常使用）


## 从注册表入手
1. 打开“注册表”需要运行命令 regedit
2. 编辑注册表，查找位置 “HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR”

右键修改表项 “Start” 数值为 4
（原“3”-手动，“2”-自动，“4”-禁止）

这将禁用 usb 端口访问
> ——只能听到“咚”的一声，但看不到U盘的信息，打开计算机也没有U盘盘符