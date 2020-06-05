::sfc verifyonly
:: 扫描所有保护的系统文件的完整性，并尽可能修复有问题的文件
::sfc /scannow
:: KMSpico 被删
:: cmd.exe 被删


:: 检查映像是否可修复 --联网模式
:: 扫描映像来检查损坏
Dism /Online /Cleanup-Image /ScanHealth

:: 检查映像以查看是否可修复损坏
Dism /Online /Cleanup-Image /CheckHealth
:: 修复可修复的损坏
DISM /Online /Cleanup-image /Restorehealth

:: 使用已装载的映像作为修复源来修复一个脱机映像
Dism /Image:C:\offline /Cleanup-Image /RestoreHealth /Source:c:\test\mount\windows
:: 装载 Win10 ISO 镜像来进行修复，指向安装文件 install.wim 路径
DISM /Online /Cleanup-Image /RestoreHealth /Source:X:\sources\install.wim:1 /LimitAccess
:: 日志 %windir%/Logs/CBS/CBS.log