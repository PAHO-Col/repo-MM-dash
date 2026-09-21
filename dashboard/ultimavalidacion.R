library(DBI)
library(RMariaDB)

con <- dbConnect(
  RMariaDB::MariaDB(),
  host = "192.168.1.3",
  user = "koyote",
  password = "1q2w3e4R+",
  dbname = "bdmisionmedica_dev_copy_2025"
)

print(dbListFields(con, "incident"))


dbDisconnect(con)
