# mysqlcheck
——执行表维护：它检查，修理，优化，或分析表

使用SQL语句：
```sql
# 检查一个或多个表是否有错误
CHECK TABLE tbl_name [, tbl_name] ... 
    [option] ...
# 仅对某些存储引擎修复可能损坏的表
REPAIR [NO_WRITE_TO_BINLOG | LOCAL]
    TABLE tbl_name [, tbl_name] ...
    [QUICK] [EXTENDED] [USE_FRM]
# 生成表统计信息
ANALYZE [NO_WRITE_TO_BINLOG | LOCAL]
    TABLE tbl_name [, tbl_name] ...
# 优化表
OPTIMIZE [NO_WRITE_TO_BINLOG | LOCAL]
    TABLE tbl_name [, tbl_name] ...
```

> 特别的：
> 
> 新建符号链接 `mysqlrepair -> mysqlcheck` ,执行 `./mysqlrepair` 将默认执行 `mysqlcheck --repair` 指令
> |命令名|含义|
> |------|--------------|
> |mysqlcheck|--check|
> |mysqlrepair|--repair|
> |mysqlanalyze|--analyze|
> |mysqloptimize|--optimize|
