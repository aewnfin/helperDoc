# 回显
:: '@' - 关闭本行回显;'echo off' - 关闭请求回显功能
@echo off 
:: 'echo' 语法：echo [{on|off}] [message]
echo hello world!
:: 'pause' - 暂停命令“Press any key to continue. . .（或：请按任意键继续. . .)”
pause & exit

# 注释
:: 这里是注释
rem 这里是注释

# 调用其他批处理程序，也可以调用标签行
:: 'call' 语法：call [路径文件名|标签]
call:1

# 调用外部程序
:: 'start' 参数 MIN-窗口最小化 ; HIGH-高优先级开始程序 ; WAIT-等待应用程序结束
start 

# 无条件跳转
:: ':' + '标签' ; 'goto' '跳转到 标签'
:1
start
goto 1

# 变量
:: 'set' : 设置变量
set aa=abcd
:: '%%' : 调用变量
echo %aa%
:: 删除变量
set aa=
:: 显示所有变量及其值
set
:: 显示所有以s开头的变量及值
set s

# 参数
:: 当前运行的批处理的完全路径
%0
:: 传递来的第1-9个参数
%1
%2
...
%9

# 返回值
:: 'errorlevel' 获取上一步命令的返回值
reg delete HKCU /v try /f
if %errorlevel%==0 (echo 删除成功！) else (echo 删除失败！)

# 重定向
:: '>' 输出
echo aaaaa>a.txt
:: '>>' 追加 ; 注意！输出数字请加上空格 'echo 9313 >a.txt'
echo aaaaa>>a.txt
:: '<' 输入
set /p ifo=<a.txt

# 管道命令
echo y | del a.txt

# 转义符
:: 特殊符号 '|' '&' '>' '<' 转义符 '^'
echo aaaa^>a.txt
:: '%' 转义符 '%'
echo 已完成100%%

# 逻辑命令符
:: '&' '&&' '||' 连接 n 个 DOS 命令

# 语句结构-选择
:: '=='-等于 ; 'EQU'- 等于 ; 'NEQ'-不等于 ; 'LSS'-小于 ; 'LEQ'-小于或等于
if %str1%==%str2% (echo 字符串相同！) else (echo 字符串不相同！)
:: 选择开关 '/i' 不区分字符串大小写; 'not' 对判断结果进行逻辑非
if /i not %choice% EQU n echo 当前时间是：%date% %time%
:: 'exist' 存在判断; '%0' 代表该批处理的全称; '%~df0' 是对 '%0' 的修正，只保留了其驱动器盘符和路径
if exist %0 echo 文件%0是存在的！
if not exist %~df0 (
    echo 文件夹%~df0不存在！
) else (
    echo 文件夹%~df0存在！
)
:: 'defined' 判断变量是否存在
if defined var (echo var=%var%) else echo var尚未定义！
:: 'errorlevel ' 判断命令执行后的返回码
masm %1.asm
if errorlevel 1 pause & edit %1.asm
link %1.obj

# 语句结构-循环
:: 格式：“ FOR %%variable IN (set) DO command ”; '%%'-批处理书写格式；'%'-DOS中书写格式
for %%i in (a,"b c",d) do echo %%i
:: 格式：“ FOR /L %%variable IN (start,step,end) DO command ”; 控制循环次数
for /l %%i in (1,2,10) do md %%i
:: 格式：“ FOR /F ["options"] %%variable IN (set) DO command ”
for /f "tokens=1-3 delims=," %%a in ("1,2,10") do echo a=%%a b=%%b c=%%c
:: 开关 '/D' 或 '/R' 的 for 语句是与目录或文件有关的命令; 遍历文件夹
setlocal enabledelayedexpansion
FOR /R d: %%i IN (.) DO (
    set dd=%%i
    set "dd=!dd:~0,-1!"
    echo !dd!
)

# 字符串-截取
set ifo=abcdefghijklmnopqrstuvwxyz0 12 3456789
:: 截取前 5 个字符
echo %ifo:~0,5%
:: 截取最后 5 个字符
echo %ifo:~-5%
:: 截取第一个到倒数第 6 个字符
echo %ifo:~0,-5%
:: 从第 4 个字符开始，截取 5 个字符
echo %ifo:~3,5%
:: 从倒数第 14 个字符开始，截取 5 个字符
echo %ifo:~-14,5%
:: 实用功能
echo 当前时间是：%time% 即 %time:~0,2%点%time:~3,2%分%time:~6,2%秒%time:~9,2%厘秒

# 字符串-替换
set aa=伟大的中国！我为你自豪！
:: 替换
echo %aa:中国=中华人民共和国%
:: 保存替换的结果
set "aa=%aa:中国=中华人民共和国%"

# 字符串-合并
set aa=伟大的中国！
set bb=我为你自豪！
:: 合并
echo %aa%%bb%
:: 保存合并的结果
set "aa=%aa%%bb%"

# 路径字符串-扩充
:: 完整路径
echo %0
:: 去掉引号
echo %~0
:: 所在分区
echo %~d0
:: 所处路径
echo %~p0
:: 文件名
echo %~n0
:: 扩展名
echo %~x0
:: 文件属性
echo %~a0
:: 修改时间
echo %~t0
:: 文件大小
echo %~z0

