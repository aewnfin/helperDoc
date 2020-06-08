---
toc:
    depth_from: 2
---
@import "style.css"

# 移动 C 盘 Users 文件夹

<div id="tags" style="text-align: right;">
<img src="/logo/魔术师.svg" height="30">
<img src="/logo/气球狗.svg" height="30">
<img src="/logo/兔子.svg" height="30">
</div>

[TOC]

## 背景
&emsp;Windows 用户的 {==个人数据==}{++“桌面”、“我的文档”..++} 默认存放于 {==系统盘==}{++通常为 C 盘++} 下的 {==用户==}{++Users++} 目录之内。

**用户文件夹处于系统盘的坏处在于：**
- 如若系统盘一旦坏掉，就可能连带用户文件一并丢失
- 由于用户文件处于系统盘，也没办法时常备份“干净的系统盘”
- 用户文件夹的文件越来越多可能会导致系统盘容量不足。

&emsp;如果能把用户文件夹挪到另外一块硬盘{++或者另外一个硬盘分区++}上，那么系统维护就会容易得多。平时生成的文件{++大多数人放在“桌面”、“我的文档”里的文件最多++}，都被保存在系统盘之外；于是随时可以在不必担心用户文件丢失的情况下重新安装系统{++或恢复系统备份++}

## 步骤
### 1. 准备另外一个硬盘 <u>作为目标文件夹</u>
### 2. 复制 ==Users== 文件夹内容 <u>到目标文件夹</u>
1. 注销当前账户
2. 登录 `Administrator` 账户
3. 以管理员身份执行拷贝命令
    ```bat
    robocopy C:\Users C:\New /E /COPYALL /XJ /XD C:\Users\Administrator
    ```
4. 注销 `Administrator` 账户
### 3. 使系统盘下路径 `C:\\Users\` 指向 <u>目标文件夹</u>

1. 在登录界面点击 “ <img src="img\轻松访问.png" height="20"> ”-“轻松访问” ，勾选 “(不使用键盘输入)屏幕键盘”
2. 点击 “确定”

    ![cmd](img\cmd.png)
3. 执行命令重命名卷
    ```bat
    move C:\Users C:\Users2 && move C:\New C:\Users
    ```
> <big>也许有用的命令</big>
> - `resmon` 打开 “资源和性能监视器” 命令
## 扫尾
### 转移 `Administrator` 账户
1. 登录其他拥有 `管理员` 权限的账户
2. 以管理员身份执行拷贝命令
    ```bat
    robocopy C:\Users2\Administrator C:\Users\Administrator /E /COPYALL /XJ
    ```
### 禁用 `Administrator` 账户
1. 打开 “计算机管理”，选择 “系统工具” 》“本地用户和组” 》“用户”
2. 在 “Administrator” 用户 “属性” 中勾选 “账户已禁用(B)”
3. 点击按钮 “确定”

### 还原 `osk.exe` 权限
1. 删除软连接 `C:\Windows\System32\osk.exe`
2. 以管理员身份重命名 `osk1.exe` 为 `osk.exe`
3. 取消之前赋予 `Administrators` 的权限
4. 手动输入 `NT SERVICE\TrustedInstaller` 更改 `osk.exe` 文件所有者 

### 取消 “帮助中心” 开机设置
1. 打开 “轻松访问中心”

    ![轻松访问中心](img\轻松访问中心.png)
2. 点击 “使用没有鼠标或键盘的计算机”

    ![使用没有鼠标或键盘的计算机](img\使用没有鼠标或键盘的计算机.png)
3. 取消勾选 “使用屏幕键盘(K)”

    ![使用没有鼠标或键盘的计算机2](img\使用没有鼠标或键盘的计算机2.png)
4. 点击 “确定(O)”