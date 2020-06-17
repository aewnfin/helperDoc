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
@import "启用Administrator账户.md"
@import "为磁盘添加路径.md"
### 复制文件夹 "C:\Users" 到 "C:\New"
1. 打开 `C:\Windows\System32\cmd.exe` 输入以下命令，点击 <kbd>Enter</kbd>
    ```bat
    robocopy C:\Users C:\New /E /COPYALL /XJ /XD C:\Users\Administrator
    ```
@import "开启后门.md"
@import "重命名文件夹.md"
## 收尾工作
### 转移 `Administrator` 用户数据
1. 登录到原先的账户
2. 右键 `C:\Windows\System32\cmd.exe` 选择“以管理员身份运行”，输入以下命令，点击 <kbd>Enter</kbd> 执行
    ```bat
    robocopy C:\Users2\Administrator C:\Users\Administrator /E /COPYALL /XJ
    ```
### 重新禁用 `Administrator` 账户
1. 打开 `C:\Windows\system32\compmgmt.msc`，选择 “系统工具” 》“本地用户和组” 》“用户”

    ![计算机管理](img\计算机管理.png)
2. 右键用户 `Administrator` ，选择 “属性”

    ![Administrator属性](img\Administrator属性2.png)
3. 勾选 “<input type="checkbox" checked="checked"/>账户已禁用(B)”

    ![Administrator属性2](img\Administrator属性.png)
4. 点击按钮 <button>确定</button>

    ![计算机管理2](img\计算机管理2.png)

### 关闭后门
1. 右键 `C:\Windows\System32\cmd.exe` 选择“以管理员身份运行”，依次输入以下命令，依次点击 <kbd>Enter</kbd>
    ```bat{class="line-numbers"}
    cd C:\windows\system32
    del Utilman.exe
    rename Utilman_bak.exe Utilman.exe
    icacls Utilman.exe /grant:r administrators:(RX,R)
    takeown /F Utilman.exe /U "NT SERVICE\TrustedInstaller"
    ```

### 隐藏 `D` 盘
1. 打开 `C:\Windows\System32\compmgmt.msc`，选择 “存储” 》“磁盘管理”

    ![磁盘管理](img\磁盘管理.png)
2. 右键卷 `(D:)` ，选择 “更改驱动器号和路径(C)...”

    ![驱动器号和路径2](img\驱动器号和路径2.png)
6. 选择驱动器号 `D:`，点击按钮 <button>删除(R)</button>

    ![警告](img\警告.png)
7. 点击按钮 <button>是(Y)</button>

    ![磁盘管理2](img\磁盘管理2.png)