<?php defined('SYSPATH') or die('No direct script access.'); ?>

2026-07-06 13:37:36 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 13:37:36 +00:00 --- debug: Database Library initialized
2026-07-06 13:37:36 +00:00 --- debug: Cache Library initialized
2026-07-06 13:37:36 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 13:37:36 +00:00 --- debug: Encrypt Library initialized
2026-07-06 13:37:36 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 13:37:36 +00:00 --- debug: Session Library initialized
2026-07-06 08:37:36 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 08:37:36 -05:00 --- debug: Database Library initialized
2026-07-06 08:37:36 -05:00 --- debug: Auth Library loaded
2026-07-06 08:37:36 -05:00 --- debug: Cache Library initialized
2026-07-06 08:37:36 -05:00 --- debug: Session Library initialized
2026-07-06 08:37:36 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 08:37:36 -05:00 --- debug: Database Library initialized
2026-07-06 08:37:36 -05:00 --- debug: Cache Library initialized
2026-07-06 08:37:36 -05:00 --- debug: :::::MMM  get_oldest_report_timestamp (models incident)
2026-07-06 08:37:36 -05:00 --- debug: :::::MMM  get_latest_report_timestamp (models incident)
2026-07-06 08:37:36 -05:00 --- alert: admin::permissions() in deprecated and replaced by Auth::has_permission()
2026-07-06 08:37:37 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-07-06 08:37:37 -05:00 --- debug: :::::MMM   Count query   (models incident)
2026-07-06 08:37:37 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-07-06 08:37:37 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE 1=1 ORDER BY i.incident_date DESC 
2026-07-06 08:37:37 -05:00 --- debug: Pagination Library initialized
2026-07-06 08:37:37 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-07-06 08:37:37 -05:00 --- debug: :::::MMM  Normal query       (models incident)
2026-07-06 08:37:37 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-07-06 08:37:37 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE 1=1 ORDER BY i.incident_date DESC LIMIT 0, 50
2026-07-06 08:37:37 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 08:37:37 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 08:37:37 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 08:37:37 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 08:37:37 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 08:37:37 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 08:37:37 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 08:37:37 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 08:37:37 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 08:37:37 -05:00 --- debug: Database Library initialized
2026-07-06 08:37:37 -05:00 --- debug: :::::::::::::::: count
2026-07-06 08:37:37 -05:00 --- debug: 
2026-07-06 08:37:37 -05:00 --- debug: :::::::::::::::: CONSULTA SQL EN EL ELSE
2026-07-06 08:37:37 -05:00 --- debug: SELECT c.id, c.parent_id, c.category_title, c.category_color, c.category_image, c.category_image_thumb FROM category c LEFT JOIN category c_parent ON (c.parent_id = c_parent.id) WHERE 1=1 ORDER BY c.category_position ASC
2026-07-06 08:37:37 -05:00 --- info: Missing i18n entry ui_main.web for language en_US
2026-07-06 08:37:37 -05:00 --- info: Missing i18n entry ui_main.keywords for language en_US
2026-07-06 08:37:37 -05:00 --- info: Missing i18n entry reports.documento for language en_US
2026-07-06 08:37:37 -05:00 --- debug: Regenerated CSRF token: ec1db14d3168cf0489001acce7d19ed3bfe5c3afb764ec5af353ad41d6fc0af3
2026-07-06 13:37:37 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 13:37:37 +00:00 --- debug: Database Library initialized
2026-07-06 13:37:37 +00:00 --- debug: Cache Library initialized
2026-07-06 13:37:37 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 13:37:37 +00:00 --- debug: Encrypt Library initialized
2026-07-06 13:37:37 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 13:37:37 +00:00 --- debug: Session Library initialized
2026-07-06 08:37:37 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 08:37:37 -05:00 --- debug: Database Library initialized
2026-07-06 08:37:37 -05:00 --- debug: Auth Library loaded
2026-07-06 08:37:37 -05:00 --- debug: Cache Library initialized
2026-07-06 08:37:37 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 08:37:37 -05:00 --- debug: Database Library initialized
2026-07-06 13:37:41 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 13:37:41 +00:00 --- debug: Database Library initialized
2026-07-06 13:37:41 +00:00 --- debug: Cache Library initialized
2026-07-06 13:37:41 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 13:37:41 +00:00 --- debug: Encrypt Library initialized
2026-07-06 13:37:41 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 13:37:41 +00:00 --- debug: Session Library initialized
2026-07-06 08:37:41 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 08:37:41 -05:00 --- debug: Database Library initialized
2026-07-06 08:37:41 -05:00 --- debug: Auth Library loaded
2026-07-06 08:37:41 -05:00 --- debug: Cache Library initialized
2026-07-06 08:37:41 -05:00 --- debug: Session Library initialized
2026-07-06 08:37:41 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 08:37:41 -05:00 --- debug: Database Library initialized
2026-07-06 08:37:41 -05:00 --- debug: Cache Library initialized
2026-07-06 08:37:41 -05:00 --- debug: ++++++++++++++++++++ Valor de role_id: 
2026-07-06 08:37:41 -05:00 --- debug: Pagination Library initialized
2026-07-06 08:37:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 08:37:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 08:37:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 08:37:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 08:37:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 08:37:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 13:37:42 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 13:37:42 +00:00 --- debug: Database Library initialized
2026-07-06 13:37:42 +00:00 --- debug: Cache Library initialized
2026-07-06 13:37:42 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 13:37:42 +00:00 --- debug: Encrypt Library initialized
2026-07-06 13:37:42 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 13:37:42 +00:00 --- debug: Session Library initialized
2026-07-06 08:37:42 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 08:37:42 -05:00 --- debug: Database Library initialized
2026-07-06 08:37:42 -05:00 --- debug: Auth Library loaded
2026-07-06 13:37:43 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 13:37:43 +00:00 --- debug: Database Library initialized
2026-07-06 13:37:43 +00:00 --- debug: Cache Library initialized
2026-07-06 13:37:43 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 13:37:43 +00:00 --- debug: Encrypt Library initialized
2026-07-06 13:37:43 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 13:37:43 +00:00 --- debug: Session Library initialized
2026-07-06 08:37:43 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 08:37:43 -05:00 --- debug: Database Library initialized
2026-07-06 08:37:43 -05:00 --- debug: Auth Library loaded
2026-07-06 08:37:43 -05:00 --- debug: Cache Library initialized
2026-07-06 08:37:43 -05:00 --- debug: Session Library initialized
2026-07-06 08:37:43 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 08:37:43 -05:00 --- debug: Database Library initialized
2026-07-06 08:37:43 -05:00 --- debug: Cache Library initialized
2026-07-06 08:37:43 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 08:37:43 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 08:37:43 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 08:37:43 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 08:37:43 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 08:37:43 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 13:37:43 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 13:37:43 +00:00 --- debug: Database Library initialized
2026-07-06 13:37:43 +00:00 --- debug: Cache Library initialized
2026-07-06 13:37:43 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 13:37:43 +00:00 --- debug: Encrypt Library initialized
2026-07-06 13:37:43 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 13:37:43 +00:00 --- debug: Session Library initialized
2026-07-06 08:37:43 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 08:37:43 -05:00 --- debug: Database Library initialized
2026-07-06 08:37:43 -05:00 --- debug: Auth Library loaded
2026-07-06 16:35:45 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:35:45 +00:00 --- debug: Database Library initialized
2026-07-06 16:35:45 +00:00 --- debug: Cache Library initialized
2026-07-06 16:35:45 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:35:45 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:35:45 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:35:45 +00:00 --- debug: Session Library initialized
2026-07-06 11:35:45 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:35:45 -05:00 --- debug: Database Library initialized
2026-07-06 11:35:45 -05:00 --- debug: Auth Library loaded
2026-07-06 11:35:45 -05:00 --- debug: Cache Library initialized
2026-07-06 11:35:45 -05:00 --- debug: Cache Library initialized
2026-07-06 11:35:45 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:35:45 -05:00 --- debug: Database Library initialized
2026-07-06 11:35:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:35:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:35:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:35:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:35:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:35:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:35:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:35:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:35:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 16:35:51 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:35:51 +00:00 --- debug: Database Library initialized
2026-07-06 16:35:51 +00:00 --- debug: Cache Library initialized
2026-07-06 16:35:51 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:35:51 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:35:51 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:35:51 +00:00 --- debug: Session Library initialized
2026-07-06 11:35:51 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:35:51 -05:00 --- debug: Database Library initialized
2026-07-06 11:35:51 -05:00 --- debug: Auth Library loaded
2026-07-06 11:35:51 -05:00 --- debug: Auth Library loaded
2026-07-06 16:35:51 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:35:51 +00:00 --- debug: Database Library initialized
2026-07-06 16:35:51 +00:00 --- debug: Cache Library initialized
2026-07-06 16:35:51 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:35:51 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:35:51 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:35:51 +00:00 --- debug: Session Library initialized
2026-07-06 11:35:51 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:35:51 -05:00 --- debug: Database Library initialized
2026-07-06 11:35:51 -05:00 --- debug: Auth Library loaded
2026-07-06 11:35:51 -05:00 --- debug: Session Library initialized
2026-07-06 11:35:51 -05:00 --- debug: Regenerated CSRF token: 17851fd8c93c796c1ed36a2c8bfc0e4721cdb8fd78260863c5295badae3a5974
2026-07-06 16:35:46 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:35:46 +00:00 --- debug: Database Library initialized
2026-07-06 16:35:46 +00:00 --- debug: Cache Library initialized
2026-07-06 16:35:46 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:35:46 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:35:46 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:35:46 +00:00 --- debug: Session Library initialized
2026-07-06 11:35:46 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:35:46 -05:00 --- debug: Database Library initialized
2026-07-06 11:35:46 -05:00 --- debug: Auth Library loaded
2026-07-06 11:35:46 -05:00 --- debug: Cache Library initialized
2026-07-06 11:35:46 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:35:46 -05:00 --- debug: Database Library initialized
2026-07-06 16:35:57 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:35:57 +00:00 --- debug: Database Library initialized
2026-07-06 16:35:57 +00:00 --- debug: Cache Library initialized
2026-07-06 16:35:57 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:35:57 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:35:57 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:35:57 +00:00 --- debug: Session Library initialized
2026-07-06 11:35:57 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:35:57 -05:00 --- debug: Database Library initialized
2026-07-06 11:35:57 -05:00 --- debug: Auth Library loaded
2026-07-06 11:35:57 -05:00 --- debug: Session Library initialized
2026-07-06 11:35:57 -05:00 --- info: Missing i18n entry auth.username.approval error for language en_US
2026-07-06 16:36:02 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:36:02 +00:00 --- debug: Database Library initialized
2026-07-06 16:36:02 +00:00 --- debug: Cache Library initialized
2026-07-06 16:36:02 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:36:02 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:36:02 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:36:02 +00:00 --- debug: Session Library initialized
2026-07-06 11:36:02 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:02 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:02 -05:00 --- debug: Auth Library loaded
2026-07-06 11:36:02 -05:00 --- debug: Session Library initialized
2026-07-06 11:36:02 -05:00 --- info: Missing i18n entry auth.username.approval error for language en_US
2026-07-06 16:36:04 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:36:04 +00:00 --- debug: Database Library initialized
2026-07-06 16:36:04 +00:00 --- debug: Cache Library initialized
2026-07-06 16:36:04 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:36:04 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:36:04 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:36:04 +00:00 --- debug: Session garbage collected: 7 row(s) deleted.
2026-07-06 16:36:04 +00:00 --- debug: Session Library initialized
2026-07-06 11:36:04 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:04 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:04 -05:00 --- debug: Auth Library loaded
2026-07-06 11:36:04 -05:00 --- debug: Session Library initialized
2026-07-06 11:36:04 -05:00 --- debug: Regenerated CSRF token: f7bc6cc4df61ba6c733ea1968f570944fd62b619de2296f307456e1d404e73b3
2026-07-06 16:36:09 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:36:09 +00:00 --- debug: Database Library initialized
2026-07-06 16:36:09 +00:00 --- debug: Cache Library initialized
2026-07-06 16:36:09 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:36:09 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:36:09 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:36:09 +00:00 --- debug: Session Library initialized
2026-07-06 11:36:09 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:09 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:09 -05:00 --- debug: Auth Library loaded
2026-07-06 11:36:09 -05:00 --- debug: Session Library initialized
2026-07-06 16:36:09 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:36:09 +00:00 --- debug: Database Library initialized
2026-07-06 16:36:09 +00:00 --- debug: Cache Library initialized
2026-07-06 16:36:09 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:36:09 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:36:09 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:36:09 +00:00 --- debug: Session Library initialized
2026-07-06 11:36:09 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:09 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:09 -05:00 --- debug: Auth Library loaded
2026-07-06 11:36:09 -05:00 --- debug: Cache Library initialized
2026-07-06 11:36:09 -05:00 --- debug: Session Library initialized
2026-07-06 11:36:09 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:09 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:09 -05:00 --- debug: Cache Library initialized
2026-07-06 16:36:09 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:36:09 +00:00 --- debug: Database Library initialized
2026-07-06 16:36:09 +00:00 --- debug: Cache Library initialized
2026-07-06 16:36:09 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:36:09 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:36:09 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:36:09 +00:00 --- debug: Session Library initialized
2026-07-06 11:36:09 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:09 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:09 -05:00 --- debug: Auth Library loaded
2026-07-06 11:36:09 -05:00 --- debug: Cache Library initialized
2026-07-06 11:36:09 -05:00 --- debug: Session Library initialized
2026-07-06 11:36:09 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:09 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:09 -05:00 --- debug: Cache Library initialized
2026-07-06 11:36:09 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:09 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:09 -05:00 --- debug: :::::MMM  get_number_reports_by_date (models incident)
2026-07-06 11:36:09 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:09 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:09 -05:00 --- debug: ::::::::: MMMM MOSTRAR EL VALOR DEL USER_ID
2026-07-06 11:36:09 -05:00 --- debug: 
2026-07-06 11:36:09 -05:00 --- debug: ADMIN
2026-07-06 11:36:09 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:09 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:09 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:09 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:09 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:09 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 16:36:10 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:36:10 +00:00 --- debug: Database Library initialized
2026-07-06 16:36:10 +00:00 --- debug: Cache Library initialized
2026-07-06 16:36:10 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:36:10 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:36:10 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:36:10 +00:00 --- debug: Session Library initialized
2026-07-06 11:36:10 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:10 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:10 -05:00 --- debug: Auth Library loaded
2026-07-06 16:36:16 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:36:16 +00:00 --- debug: Database Library initialized
2026-07-06 16:36:16 +00:00 --- debug: Cache Library initialized
2026-07-06 16:36:16 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:36:16 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:36:16 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:36:16 +00:00 --- debug: Session Library initialized
2026-07-06 11:36:16 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:16 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:16 -05:00 --- debug: Auth Library loaded
2026-07-06 11:36:16 -05:00 --- debug: Cache Library initialized
2026-07-06 11:36:16 -05:00 --- debug: Session Library initialized
2026-07-06 11:36:16 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:16 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:16 -05:00 --- debug: Cache Library initialized
2026-07-06 11:36:16 -05:00 --- debug: ++++++++++++++++++++ Valor de role_id: 
2026-07-06 11:36:16 -05:00 --- debug: Pagination Library initialized
2026-07-06 11:36:16 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:16 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:16 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:16 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:16 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:16 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 16:36:17 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:36:17 +00:00 --- debug: Database Library initialized
2026-07-06 16:36:17 +00:00 --- debug: Cache Library initialized
2026-07-06 16:36:17 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:36:17 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:36:17 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:36:17 +00:00 --- debug: Session Library initialized
2026-07-06 11:36:17 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:17 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:17 -05:00 --- debug: Auth Library loaded
2026-07-06 16:36:24 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:36:24 +00:00 --- debug: Database Library initialized
2026-07-06 16:36:24 +00:00 --- debug: Cache Library initialized
2026-07-06 16:36:24 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:36:24 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:36:24 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:36:24 +00:00 --- debug: Session Library initialized
2026-07-06 11:36:24 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:24 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:24 -05:00 --- debug: Auth Library loaded
2026-07-06 11:36:24 -05:00 --- debug: Cache Library initialized
2026-07-06 11:36:24 -05:00 --- debug: Session Library initialized
2026-07-06 11:36:24 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:24 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:24 -05:00 --- debug: Cache Library initialized
2026-07-06 11:36:24 -05:00 --- debug: ++++++++++++++++++++ Valor de role_id: 7
2026-07-06 11:36:24 -05:00 --- debug: Pagination Library initialized
2026-07-06 11:36:24 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:24 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:24 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:24 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:24 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:24 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 16:36:25 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:36:25 +00:00 --- debug: Database Library initialized
2026-07-06 16:36:25 +00:00 --- debug: Cache Library initialized
2026-07-06 16:36:25 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:36:25 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:36:25 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:36:25 +00:00 --- debug: Session Library initialized
2026-07-06 11:36:25 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:25 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:25 -05:00 --- debug: Auth Library loaded
2026-07-06 16:36:29 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:36:29 +00:00 --- debug: Database Library initialized
2026-07-06 16:36:29 +00:00 --- debug: Cache Library initialized
2026-07-06 16:36:29 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:36:29 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:36:29 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:36:29 +00:00 --- debug: Session Library initialized
2026-07-06 11:36:29 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:29 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:29 -05:00 --- debug: Auth Library loaded
2026-07-06 11:36:29 -05:00 --- debug: Cache Library initialized
2026-07-06 11:36:29 -05:00 --- debug: Session Library initialized
2026-07-06 11:36:29 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:29 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:29 -05:00 --- debug: Cache Library initialized
2026-07-06 11:36:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 16:36:29 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:36:29 +00:00 --- debug: Database Library initialized
2026-07-06 16:36:29 +00:00 --- debug: Cache Library initialized
2026-07-06 16:36:29 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:36:29 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:36:29 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:36:29 +00:00 --- debug: Session Library initialized
2026-07-06 11:36:29 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:29 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:29 -05:00 --- debug: Auth Library loaded
2026-07-06 16:36:10 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:36:10 +00:00 --- debug: Database Library initialized
2026-07-06 16:36:10 +00:00 --- debug: Cache Library initialized
2026-07-06 16:36:10 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:36:10 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:36:10 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:36:10 +00:00 --- debug: Session Library initialized
2026-07-06 11:36:10 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:10 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:10 -05:00 --- debug: Auth Library loaded
2026-07-06 11:36:10 -05:00 --- debug: Cache Library initialized
2026-07-06 11:36:10 -05:00 --- debug: Session Library initialized
2026-07-06 11:36:10 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:10 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:10 -05:00 --- debug: Cache Library initialized
2026-07-06 11:36:10 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:10 -05:00 --- debug: Database Library initialized
2026-07-06 16:36:57 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:36:57 +00:00 --- debug: Database Library initialized
2026-07-06 16:36:57 +00:00 --- debug: Cache Library initialized
2026-07-06 16:36:57 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:36:57 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:36:57 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:36:57 +00:00 --- debug: Session Library initialized
2026-07-06 11:36:57 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:57 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:57 -05:00 --- debug: Auth Library loaded
2026-07-06 11:36:57 -05:00 --- debug: Cache Library initialized
2026-07-06 11:36:57 -05:00 --- debug: Session Library initialized
2026-07-06 11:36:57 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:57 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:57 -05:00 --- debug: Cache Library initialized
2026-07-06 11:36:57 -05:00 --- debug: VALORES DE SELECT
2026-07-06 11:36:57 -05:00 --- debug: Auth Library loaded
2026-07-06 16:36:57 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:36:57 +00:00 --- debug: Database Library initialized
2026-07-06 16:36:57 +00:00 --- debug: Cache Library initialized
2026-07-06 16:36:57 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:36:57 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:36:57 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:36:57 +00:00 --- debug: Session Library initialized
2026-07-06 11:36:57 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:57 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:57 -05:00 --- debug: Auth Library loaded
2026-07-06 11:36:57 -05:00 --- debug: Cache Library initialized
2026-07-06 11:36:57 -05:00 --- debug: Session Library initialized
2026-07-06 11:36:57 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:57 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:57 -05:00 --- debug: Cache Library initialized
2026-07-06 11:36:57 -05:00 --- debug: ++++++++++++++++++++ Valor de role_id: 
2026-07-06 11:36:57 -05:00 --- debug: Pagination Library initialized
2026-07-06 11:36:57 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:57 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:57 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:57 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:57 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:36:57 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 16:36:58 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:36:58 +00:00 --- debug: Database Library initialized
2026-07-06 16:36:58 +00:00 --- debug: Cache Library initialized
2026-07-06 16:36:58 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:36:58 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:36:58 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:36:58 +00:00 --- debug: Session Library initialized
2026-07-06 11:36:58 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:36:58 -05:00 --- debug: Database Library initialized
2026-07-06 11:36:58 -05:00 --- debug: Auth Library loaded
2026-07-06 16:37:02 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:02 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:02 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:02 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:02 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:02 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:02 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:02 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:02 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:02 -05:00 --- debug: Auth Library loaded
2026-07-06 11:37:02 -05:00 --- debug: Auth Library loaded
2026-07-06 16:37:02 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:02 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:02 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:02 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:02 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:02 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:02 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:02 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:02 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:02 -05:00 --- debug: Auth Library loaded
2026-07-06 11:37:02 -05:00 --- debug: Session Library initialized
2026-07-06 11:37:02 -05:00 --- debug: Regenerated CSRF token: 90bdad8642b9b943cd778ef5529df5234fafc4768f61b03b168518b4c76f2ab4
2026-07-06 16:37:07 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:07 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:07 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:07 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:07 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:07 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:07 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:07 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:07 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:07 -05:00 --- debug: Auth Library loaded
2026-07-06 11:37:07 -05:00 --- debug: Session Library initialized
2026-07-06 16:37:07 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:07 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:07 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:07 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:07 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:07 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:07 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:07 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:07 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:07 -05:00 --- debug: Auth Library loaded
2026-07-06 11:37:07 -05:00 --- debug: Cache Library initialized
2026-07-06 11:37:07 -05:00 --- debug: Session Library initialized
2026-07-06 11:37:07 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:07 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:07 -05:00 --- debug: Cache Library initialized
2026-07-06 16:37:07 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:07 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:07 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:07 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:07 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:07 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:07 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:07 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:07 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:07 -05:00 --- debug: Auth Library loaded
2026-07-06 11:37:07 -05:00 --- debug: Cache Library initialized
2026-07-06 11:37:07 -05:00 --- debug: Session Library initialized
2026-07-06 11:37:07 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:07 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:07 -05:00 --- debug: Cache Library initialized
2026-07-06 11:37:07 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:07 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:07 -05:00 --- debug: :::::MMM  get_number_reports_by_date (models incident)
2026-07-06 11:37:07 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:07 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:07 -05:00 --- debug: ::::::::: MMMM MOSTRAR EL VALOR DEL USER_ID
2026-07-06 11:37:07 -05:00 --- debug: 
2026-07-06 11:37:07 -05:00 --- debug: 1
2026-07-06 11:37:07 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:07 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:07 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:07 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:07 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:07 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 16:37:08 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:08 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:08 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:08 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:08 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:08 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:08 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:08 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:08 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:08 -05:00 --- debug: Auth Library loaded
2026-07-06 16:37:11 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:11 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:11 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:11 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:11 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:11 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:11 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:11 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:12 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:12 -05:00 --- debug: Auth Library loaded
2026-07-06 11:37:12 -05:00 --- debug: Cache Library initialized
2026-07-06 11:37:12 -05:00 --- debug: Session Library initialized
2026-07-06 11:37:12 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:12 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:12 -05:00 --- debug: Cache Library initialized
2026-07-06 11:37:12 -05:00 --- debug: ++++++++++++++++++++ Valor de role_id: 
2026-07-06 11:37:12 -05:00 --- debug: Pagination Library initialized
2026-07-06 11:37:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 16:37:12 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:12 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:12 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:12 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:12 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:12 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:12 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:12 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:12 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:12 -05:00 --- debug: Auth Library loaded
2026-07-06 16:37:13 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:13 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:13 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:13 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:13 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:13 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:13 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:13 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:13 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:13 -05:00 --- debug: Auth Library loaded
2026-07-06 11:37:13 -05:00 --- debug: Cache Library initialized
2026-07-06 11:37:13 -05:00 --- debug: Session Library initialized
2026-07-06 11:37:13 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:13 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:13 -05:00 --- debug: Cache Library initialized
2026-07-06 11:37:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 16:37:14 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:14 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:14 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:14 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:14 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:14 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:14 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:14 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:14 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:14 -05:00 --- debug: Auth Library loaded
2026-07-06 16:37:30 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:30 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:30 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:30 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:30 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:30 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:30 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:30 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:30 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:30 -05:00 --- debug: Auth Library loaded
2026-07-06 11:37:30 -05:00 --- debug: Cache Library initialized
2026-07-06 11:37:30 -05:00 --- debug: Session Library initialized
2026-07-06 11:37:30 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:30 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:30 -05:00 --- debug: Cache Library initialized
2026-07-06 16:37:47 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:47 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:47 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:47 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:47 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:47 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:47 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:47 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:47 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:47 -05:00 --- debug: Auth Library loaded
2026-07-06 11:37:47 -05:00 --- debug: Cache Library initialized
2026-07-06 11:37:47 -05:00 --- debug: Session Library initialized
2026-07-06 11:37:47 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:47 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:47 -05:00 --- debug: Cache Library initialized
2026-07-06 11:37:47 -05:00 --- debug: VALORES DE SELECT
2026-07-06 11:37:47 -05:00 --- debug: Auth Library loaded
2026-07-06 16:37:47 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:47 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:47 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:47 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:47 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:47 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:47 +00:00 --- debug: Session garbage collected: 0 row(s) deleted.
2026-07-06 16:37:47 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:47 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:47 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:47 -05:00 --- debug: Auth Library loaded
2026-07-06 11:37:47 -05:00 --- debug: Cache Library initialized
2026-07-06 11:37:47 -05:00 --- debug: Session Library initialized
2026-07-06 11:37:47 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:47 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:47 -05:00 --- debug: Cache Library initialized
2026-07-06 11:37:47 -05:00 --- debug: ++++++++++++++++++++ Valor de role_id: 
2026-07-06 11:37:47 -05:00 --- debug: Pagination Library initialized
2026-07-06 11:37:47 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:47 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:47 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:47 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:47 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:47 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 16:37:47 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:47 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:47 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:47 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:47 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:47 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:47 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:47 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:47 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:47 -05:00 --- debug: Auth Library loaded
2026-07-06 16:37:07 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:07 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:07 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:07 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:07 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:07 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:07 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:07 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:07 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:07 -05:00 --- debug: Auth Library loaded
2026-07-06 11:37:07 -05:00 --- debug: Cache Library initialized
2026-07-06 11:37:07 -05:00 --- debug: Session Library initialized
2026-07-06 11:37:07 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:07 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:07 -05:00 --- debug: Cache Library initialized
2026-07-06 11:37:07 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:07 -05:00 --- debug: Database Library initialized
2026-07-06 16:37:56 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:56 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:56 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:56 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:56 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:56 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:56 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:56 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:56 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:56 -05:00 --- debug: Auth Library loaded
2026-07-06 11:37:56 -05:00 --- debug: Cache Library initialized
2026-07-06 11:37:56 -05:00 --- debug: Session Library initialized
2026-07-06 11:37:56 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:56 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:56 -05:00 --- debug: Cache Library initialized
2026-07-06 11:37:56 -05:00 --- debug: ++++++++++++++++++++ Valor de role_id: 8
2026-07-06 11:37:56 -05:00 --- debug: Pagination Library initialized
2026-07-06 11:37:56 -05:00 --- error: Excepción no atrapada  Error en la Base de Datos: Column 'crue_id' in where clause is ambiguous - SELECT `users`.*
FROM `users`
JOIN `crues_ips` ON (`users`.`crue_id` = `crues_ips`.`Id`)
JOIN `roles_users` ON (`roles_users`.`user_id` = `users`.`id`)
WHERE `crues_ips`.`crue_id` = 1070
AND `roles_users`.`role_id` = '8'
AND `crue_id` = '1070'
ORDER BY `name` ASC
LIMIT 0, 50 en el archivo system/libraries/drivers/Database/Mysqli.php en la línea 159
2026-07-06 16:37:56 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:56 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:56 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:56 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:56 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:56 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:56 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:56 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:56 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:56 -05:00 --- debug: Auth Library loaded
2026-07-06 16:37:56 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:56 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:56 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:56 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:56 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:56 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:56 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:56 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:56 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:56 -05:00 --- debug: Auth Library loaded
2026-07-06 16:37:56 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:56 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:56 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:56 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:56 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:56 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:56 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:56 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:56 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:56 -05:00 --- debug: Auth Library loaded
2026-07-06 16:37:56 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:56 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:56 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:56 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:56 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:56 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:56 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:56 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:56 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:56 -05:00 --- debug: Auth Library loaded
2026-07-06 16:37:57 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:57 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:57 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:57 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:57 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:57 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:57 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:57 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:57 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:57 -05:00 --- debug: Auth Library loaded
2026-07-06 16:37:59 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:59 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:59 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:59 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:59 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:59 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:59 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:59 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:59 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:59 -05:00 --- debug: Auth Library loaded
2026-07-06 11:37:59 -05:00 --- debug: Cache Library initialized
2026-07-06 11:37:59 -05:00 --- debug: Session Library initialized
2026-07-06 11:37:59 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:59 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:59 -05:00 --- debug: Cache Library initialized
2026-07-06 11:37:59 -05:00 --- debug: ++++++++++++++++++++ Valor de role_id: 
2026-07-06 11:37:59 -05:00 --- debug: Pagination Library initialized
2026-07-06 11:37:59 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:59 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:59 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:59 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:59 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:37:59 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 16:37:59 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:37:59 +00:00 --- debug: Database Library initialized
2026-07-06 16:37:59 +00:00 --- debug: Cache Library initialized
2026-07-06 16:37:59 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:37:59 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:37:59 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:37:59 +00:00 --- debug: Session Library initialized
2026-07-06 11:37:59 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:37:59 -05:00 --- debug: Database Library initialized
2026-07-06 11:37:59 -05:00 --- debug: Auth Library loaded
2026-07-06 16:38:04 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:38:04 +00:00 --- debug: Database Library initialized
2026-07-06 16:38:04 +00:00 --- debug: Cache Library initialized
2026-07-06 16:38:04 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:38:04 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:38:04 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:38:04 +00:00 --- debug: Session Library initialized
2026-07-06 11:38:04 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:38:04 -05:00 --- debug: Database Library initialized
2026-07-06 11:38:04 -05:00 --- debug: Auth Library loaded
2026-07-06 11:38:04 -05:00 --- debug: Cache Library initialized
2026-07-06 11:38:04 -05:00 --- debug: Session Library initialized
2026-07-06 11:38:04 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:38:04 -05:00 --- debug: Database Library initialized
2026-07-06 11:38:04 -05:00 --- debug: Cache Library initialized
2026-07-06 11:38:04 -05:00 --- debug: ++++++++++++++++++++ Valor de role_id: 
2026-07-06 11:38:04 -05:00 --- debug: Pagination Library initialized
2026-07-06 11:38:04 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:38:04 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:38:04 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:38:04 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:38:04 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 11:38:04 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-07-06 16:38:05 +00:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 16:38:05 +00:00 --- debug: Database Library initialized
2026-07-06 16:38:05 +00:00 --- debug: Cache Library initialized
2026-07-06 16:38:05 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-07-06 16:38:05 +00:00 --- debug: Encrypt Library initialized
2026-07-06 16:38:05 +00:00 --- debug: Session Database Driver Initialized
2026-07-06 16:38:05 +00:00 --- debug: Session Library initialized
2026-07-06 11:38:05 -05:00 --- debug: MySQLi Database Driver Initialized
2026-07-06 11:38:05 -05:00 --- debug: Database Library initialized
2026-07-06 11:38:05 -05:00 --- debug: Auth Library loaded
