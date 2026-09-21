library(DBI)
library(RMariaDB)

con <- dbConnect(
  RMariaDB::MariaDB(),
  dbname = "bdmisionmedica_dev_copy_2025",
  host = "192.168.1.3",
  user = "koyote",
  password = "1q2w3e4R+"
)

sql <- "
SELECT
    i.id,
    cat.category_title
FROM incident i
JOIN incident_category ic
    ON ic.incident_id=i.id
JOIN category cat
    ON cat.id=ic.category_id
LIMIT 20
"

print(dbGetQuery(con, sql))


dbDisconnect(con)
