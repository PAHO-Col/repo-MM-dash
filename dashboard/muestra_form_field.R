library(DBI)
library(RMariaDB)

con <- dbConnect(
  RMariaDB::MariaDB(),
  host="192.168.1.3",
  dbname="bdmisionmedica_dev_copy_copy",
  user="koyote",
  password="1q2w3e4R+"
)

sql <- "
SELECT
    id,
    field_name,
    field_type,
    field_required
FROM form_field
ORDER BY id
"

print(dbGetQuery(con, sql))

dbDisconnect(con)

