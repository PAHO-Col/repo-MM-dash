library(DBI)
library(RMariaDB)

con <- dbConnect(
  RMariaDB::MariaDB(),
  host = "192.168.1.3",
  dbname = "bdmisionmedica_dev_copy_copy",
  user = "koyote",
  password = "1q2w3e4R+"
)

datos <- dbGetQuery(con,"
SELECT *
FROM category
LIMIT 20
")

print(datos)

dbDisconnect(con)
