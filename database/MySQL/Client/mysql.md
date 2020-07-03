# mysql
## 登录
> mysql -h [hostIP] -u [username] -p[password] [database]

## 使用
——SQL Shell，支持交互和非交互使用

- 交互式
    ```sql
    USE `database`
    script.sql
    ```
    > 输入一个SQL语句，以 `;` , `\g` 或者 `\G` 结束它，按 <kbd>Enter</kbd> 键来执行它
    >
    > 键入 <kbd>Control</kbd> + <kbd>C</kbd> 会中断当前语句（如果存在），否则将取消任何部分输入行
- 非交互式
    ```sh
    mysql db_name < script.sql > output.tab
    ```