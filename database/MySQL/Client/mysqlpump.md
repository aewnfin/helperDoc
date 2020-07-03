# mysqlpump
—— MySQL 5.7

> 权限要求：
> - SELECT表
> - SHOW VIEW视图
> - TRIGGER触发器
> - LOCK TABLES特权
> - --single-transaction选项

## 语法
生成转储文件：
```sh
# 默认行为
mysqlpump --all-databases

# 转储单个数据库或该数据库中的某些表
mysqlpump db_name
mysqlpump db_name tbl_name1 tbl_name2 ...

# 要将所有名称参数都视为数据库名称
mysqlpump --databases db_name1 db_name2 ...

# 要将授权表内容作为逻辑定义以 CREATE USER 和 GRANT 语句的形式转储
mysqlpump --exclude-databases=% --users
```

重新加载转储文件：
```sh
# 要重新加载转储文件
mysqlpump [options] > dump.sql
mysql < dump.sql
```

## 限制
1. **mysqlpump** 默认不转储 erformance_schema ， ndbinfo 或 sys 数据库
2. **mysqlpump** 默认不转储 INFORMATION_SCHEMA 模式
3. **mysqlpump** 默认不转储 InnoDB `CREATE TABLESPACE` 语句
4. **mysqlpump** 默认情况下转储的 mysql 系统数据库不包括含有用户定义的授权表：
    - user
    - db
    - tables_priv
    - columns_priv
    - procs_priv
    - proxies_priv

> 要转储任何用户授权表，请
> ```sh
> mysqlpump mysql user db ...
> ```
> 或者
> ```sh
> # 以逻辑定义形式转储用户帐户
> mysqlpump --include-users=user1,user2
> mysqlpump --exclude-databases=% --users
> ```

---

## windows 系统
> 在 **Windows** PowerShell 上使用,默认的 UTF-16 编码文件将无法使用，请_
> ```ps1
> # 变通以 ASCII 格式创建输出
> mysqlpump [options] --result-file=dump.sql
> ```
