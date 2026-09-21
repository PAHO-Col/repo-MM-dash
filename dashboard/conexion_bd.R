library(DBI)
library(RMariaDB)

con <- dbConnect(
  RMariaDB::MariaDB(),
  host = "IP",
  dbname = "NOMBRE_DB",
  user = "NOMUSUARIO",
  password = "CLAVE"
)
