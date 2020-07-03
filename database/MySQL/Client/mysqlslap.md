# mysqlslap
——诊断程序，模拟MySQL服务器的客户端负载，就像多个客户端正在访问服务器一样

```sh
mysqlslap [options]
```

## 执行 SQL 语句
选项，例如 `--create` 或 `--query` 使您能够指定包含 **SQL 语句**的<u>字符串</u>或包含语句的<u>文件</u>。
> 如果指定文件，则默认情况下该文件每行必须包含一个语句（隐式的，语句定界符是换行符`\n`）
> ```sh
> # 指定其他定界符
> mysqlslap --delimiter=";" 
> ```
> **注意**：您不能在文件中包含注释，mysqlslap 无法理解它们。

## 运行过程
```sh
mysqlslap --delimiter=";" \
    # ①创建架构用于测试，此阶段使用单个客户端连接
    --create="CREATE TABLE a (b int);INSERT INTO a VALUES (23)"
    # query.sql 文件包含多个以';'分隔的查询
    --query=query.sql 
    # ②运行负载，50 个客户端，每个查询 200 次，此阶段可以使用许多客户端连接
    --concurrency=50 --iterations=200
    # ③清理（​​断开连接，如果指定，则删除表），此阶段使用单个客户端连接
```