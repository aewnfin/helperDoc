@echo off
:: 装机时需要分区
:: Win7 32位 磁盘最小 16G
:: Win7 64位 磁盘最小 20G

:: NTFS 文件系统
:: FAT 转 NTFS
convert D: /fs:ntfs
:: 格式化硬盘
Format D: /fs:ntfs

:: 进入磁盘操作模式
diskpart
::list disk
::select disk 0
::list partition
::list volume
::exit