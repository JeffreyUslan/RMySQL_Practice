library("RSQLite")
library("dplyr")

#make a database
my_db <- src_sqlite("my_db.sqlite3", create = T)

Table_1=read.csv("amazon_test.csv")


copy_to(my_db, Table_1)

query="SELECT Account_id, Month, Payment"
query=paste(query,"FROM Table_1 join (")
query=paste(query,"SELECT max(Payment), Account_id, Month")
query=paste(query,"FROM Table_1 join (")
query=paste(query,"SELECT distinct Account_id")
query=paste(query,"FROM Table_1")
query=paste(query,") using(Account_id)")
query=paste(query,"GROUP BY Account_id")
query=paste(query,") using(Account_id, Month)")
query=paste(query,"ORDER BY Payment DESC")

tbl(my_db, sql(query))

  
  

