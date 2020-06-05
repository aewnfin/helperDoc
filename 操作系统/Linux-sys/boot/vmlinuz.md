# vmlinuz
——可引导的、已压缩的 Linux 内核。

- <span class="x">zImage</span>(vmlinuz)
    - 适用于低端内存（低于 640K ）
- <span class="x">bzImage</span>(vmlinuz)
    - 适用于高端内存（ 1M 以上）

> "vm" 代表 "Virtual Memory"——“虚拟内存”

> "z" 表示已经压缩；
> zImage(vmlinuz) 和bzImage(vmlinuz) 都使用 gzip 压缩，并且开头部分内嵌有 gzip 解压缩代码

## 相关
<span class="x">zImage</span> 由编译内核时通过 "`make zImage`" 创建，然后通过 "`cp` `/usr/src/linux-2.4/arch/i386/linux/boot/zImage` `/boot/vmlinuz`" 产生。

<span class="x">bzImage</span> 由编译内核时通过 "`make bzImage`" 创建，然后通过 "`cp` `/usr/src/linux-2.4/arch/i386/linux/boot/bzImage` `/boot/vmlinuz`" 产生。








<style>
.x {
    color: lime;
}
</style>