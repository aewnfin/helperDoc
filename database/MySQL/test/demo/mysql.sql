# 建立连接 指定数据库
shell>mysql -h host -u user_name -p 'database_name'
Enter password: ********

# \c 终止输入
# \q 退出连接 = quit
mysql>select
    ->user()
    ->\c
mysql>

# 提示
mysql>
    -> '
    '> 等待'字符串'结束 "
    "> 等待"字符串"结束 `
    `> 等待`标识符`结束 /*
    /*>等待/*注释*/结束

# 退出
mysql>quit
Bye
