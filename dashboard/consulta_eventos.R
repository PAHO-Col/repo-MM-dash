library(DBI)

sql <- "
SELECT

i.id,
i.incident_title,
i.incident_date,

c.category_title,

c.parent_id

FROM incident i

LEFT JOIN incident_category ic
ON i.id = ic.incident_id

LEFT JOIN category c
ON ic.category_id = c.id

WHERE i.incident_active = 1
"

datos <- dbGetQuery(con, sql)

print(head(datos))
