library(DBI)
library(RMariaDB)

con <- dbConnect(
  RMariaDB::MariaDB(),
  host="192.168.1.3",
  dbname="bdmisionmedica_dev_copy_copy",
  user="koyote",
  password="1q2w3e4R+"
)

tablas <- dbListTables(con)

for(tabla in tablas){

  sql <- paste0(
    "SHOW COLUMNS FROM `",
    tabla,
    "`"
  )

  campos <- tryCatch(
    dbGetQuery(con, sql),
    error = function(e) NULL
  )

  if(is.null(campos))
    next

  nombres <- tolower(campos$Field)

  if(any(grepl("municip", nombres)) ||
     any(grepl("depto", nombres)) ||
     any(grepl("depart", nombres))){

    cat("\n========================\n")
    cat("TABLA:", tabla, "\n")
    print(campos)

  }
}

dbDisconnect(con)
