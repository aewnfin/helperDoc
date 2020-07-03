# mysqlshow
——MySQL SHOW 语句命令行工具

> 输出仅显示您具有某些特权的那些数据库，表或列的名称

```sh
mysqlshow [options] [db_name [tbl_name [col_name]]]
```

> shell 通配符 `*` `?` 将转换为 SQL 通配符 `%` `_` 当尝试显示的名称中包含`_`符号,这可能引发混乱,请_
> ```sh 
> # 在命令行上添加额外的 % 作为单独的参数，以轻松的修复这一点
> mysqlshow xx_ %
> ```
