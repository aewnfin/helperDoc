# 创建表 pet
create table pet (name varchar(20), owner varchar(20),
    species varchar(20), sex char(1), birth date, death date);

# 显示表结构
describe 'table_name';

# 从 .txt 填充数据到表-pet
load data local infile 'pet.txt' into table pet ;
# 由于在 Windows 上使用 '\r\n' 作为行终止符
load data local infile 'pet.txt' into table pet
    lines terminated by '\r\n' ;
# 由于在 macOS 上使用 '\r' 作为行终止符
load data local infile 'pet.txt' into table pet
    lines terminated by '\r' ;

# 插入数据
insert into pet
    values ('Puffball','Diane','hamster','f','1999-03-30',NULL);

# 清除所有数据
delete from pet ;

# 更新数据
update pet set birth = '1989-08-31' where name = 'Bowser' ;

# BNF 巴科斯范式
查询 ::=
'select' ['DISTINCT'] columns 'from' table { ',' table} [ 'where' screening ] ';'
columns     :   ( '*' | column {',' column} )
column      :   [table '.' ]<string>
table       :   [database '.' ]<string>
database    :   <string>
<string>    :   'text'
screening   :   condition { ('AND'|'OR') condition}
# 优先级
AND > OR
condition   :   column ( > | < | = | >= | <= | != | 'is not') value
value       :   ( <string> | <int> | <date> | 'NULL')
<int>       :   [0-9]*
<date>      :   yyyy-mm-dd
DISTINCT=排除重复

排序 ::=
<查询> 'ORDER BY' ['BINARY'] column ['DESC'] {',' ['BINARY'] column ['DESC'] } ';'
BINARY=区分大小写
DESC=降序

别名 ::=
column 'AS' <string>


