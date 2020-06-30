---
toc:
    depth_from: 2
---
@import "style.css"

# Linux
[TOC]

## 版本号
“linux 内核”版本号格式：{++主版本.次版本.释出版本-修改版本++}
- 次版本：为偶数表示<span class="version">稳定版</span>；为奇数表示<span class="version">开发版</span>
    > 例如：2.6.32-642.el6.x86_64 表示稳定版
- 释出版本：在主次版本架构不变的情况下，新增的功能累积到一定程度后释出的内核版本
- 修改版本：修改一些 bug 等

## 文件系统
&emsp;从一个操作系统<small>（*例如 Microsoft Windows*）</small>迁移到另一个操作系统时，将深刻影响最终用户的一件事是文件系统之间的差异

### 文件系统层次结构
&emsp;与 UNIX 一样，Linux 选择使用 <ruby>单个分层目录结构<rp>（</rp><rt>single hierarchical directory structure</rt><rp>）</rp></ruby> 的文件系统，一切都从以 `/` 表示的“根目录”开始，然后扩展为子目录，而不是具有所谓的“驱动器”。
> &emsp;在 Windows 环境中，几乎可以将文件放置在任何位置：C 驱动器，D 驱动器，E 驱动器等。这种文件系统称为 <ruby>分层结构<rp>（</rp><rt>hierarchical structure</rt><rp>）</rp></ruby> ，由程序本身（程序目录）管理，而不是由操作系统管理。

&emsp;另一方面，Linux 根据对引导过程的重要性从 `/` {++根目录++}降序的对子目录进行排序：
- `/bin -> /usr/bin`
- `/boot`
- `/dev`
- `/etc`
- `/home`
- `/lib -> /usr/lib`
- `/lib64 -> /usr/lib64`
- `/media`
- `/mnt`
- `/opt`
- `/proc`
- `/root`
- `/sbin -> /usr/sbin`
- `/srv`
- `/sys`
- `/tmp`
- `/usr`
- `/var`

### 文件名与文件路径
&emsp;像 Unix 一样，Linux 也选择{==区分文件名大小写==}；使用前斜杠 '/' 而不是 Windows 的反斜杠 '\\' 划分文件路径

### 程序与存放位置
> 如果在 Windows 中安装程序，则通常会将其大多数文件存储在其自己的目录结构中。
> 例如，帮助文件可以位于
>`C:\Program Files \[program-name]\`
> 或
> `C:\Program Files\[program-name]\help`
> 或
> `C:\Program Files\[program-name]\humpty\dumpty\doo`
> 之下

&emsp;在 Linux 中，程序将其文档放入 `/usr/share/doc/[program-name]`；手册页放入 `/usr/share/man/man[1-9]` 信息页放入 `/usr/share/info` —— {==它们被合并到系统层次结构中并与系统层次结构合并。==}

### 文件的共享
&emsp;所有 Linux 用户都知道，除非明确使用命令“安装了”分区或设备，否则系统不知道该分区或设备的存在。这似乎不是提供对分区或设备的访问的最简单方法，但是与其他操作系统相比，它具有更大的灵活性。
&emsp;让我们以 `/usr` 目录为例。根目录的此子目录包含大多数系统可执行文件。使用 Linux 文件系统，您可以选择使用无数协议集{++（例如 NFS（Sun），Coda（CMU）或 AFS（IBM））++}通过网络将其挂载到另一个分区，甚至挂载到另一台计算机上。底层系统将不会也不需要知道差异。`/usr` 目录的存在是完全透明的。它似乎是本地目录，它是本地目录结构的一部分。
||shareable|unshareable|
|--|--|--|
|**static**|/usr <br> /opt|/etc <br> /boot|
|**variable**|/var/mail <br> /var/spool/news|/var/run <br> /var/lock|
> - **shareable** 文件定义为那些可以存储在一台主机上并在其他主机上使用的文件
> - **unshareable** 文件是不可共享的文件。对于例如，在用户主目录中的文件是可共享的，而设备锁文件不是
> - **static** 文件包括二进制文件，库文件，文档文件和其他文件，这些文件在没有系统管理员干预的情况下不会更改
> - **variable** 文件定义为非静态文件

## 标准
- <ruby>文件系统标准<rp>（</rp><rt>file system standard</rt><rp>）</rp></ruby> [FSSTND](http://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/c23.html)
- <ruby>文件系统层次结构标准<rp>（</rp><rt>Filesystem Hierarchy Standard</rt><rp>）</rp></ruby> [FHS](https://www.pathname.com/fhs/)
- Linux Standard Base LSB
