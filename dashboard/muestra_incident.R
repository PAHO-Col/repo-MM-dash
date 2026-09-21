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
SELECT
 id,
 incident_title,
 incident_date,
 incident_active,
 incident_verified
FROM incident
LIMIT 20
")

print(datos)

dbDisconnect(con)
