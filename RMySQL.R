library(DBI)
library(RMySQL)
library(dbConnect)
uid="root"
pwd="1234"
db="rmysql_test"
host_ip="localhost"
drv <- dbDriver("MySQL")
con<-dbConnect(drv,user=uid,password=pwd,host=host_ip)
con<-dbConnect(drv, "testdb", username="testuser", password="testpass")
  
  