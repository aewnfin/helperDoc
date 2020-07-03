# 开放端口
firewall-cmd
    --permanent
    --zone=public

    --add-service=https
    --add-port=8080-8081/tcp

    --list-services
    --list-ports
    --list-all

# 创建用户
mysql> CREATE USER 'saber'@'%' IDENTIFIED BY 'Wise3575?';
mysql> GRANT ALL ON *.* TO 'saber'@'%'

mysql> show grants for saber@'%';
# 导入数据
mysqlimport [options] db_name textfile1 [textfile2 ...]

mysql> LOAD DATA LOCAL INFILE '/path/pet.txt' INTO TABLE pet;

# 查看