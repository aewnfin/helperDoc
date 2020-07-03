# 版本号version() , 当前日期current_date
select version() , current_date ;
# 计算 算式
select sin(pi()/4) , (4+1)*5 ;

# 罗列权限可达数据库 = 等价
show database ;
show schemas ;

# 切换数据库 ‘不需要分号’
use database

# 当前数据库
select database() ;

# 显示表
show tables ;

