<?php defined('SYSPATH') or die('No direct script access.'); ?>

2026-06-19 15:40:48 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 15:40:48 +00:00 --- debug: Database Library initialized
2026-06-19 15:40:48 +00:00 --- debug: Cache Library initialized
2026-06-19 15:40:48 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-19 15:40:48 +00:00 --- debug: Encrypt Library initialized
2026-06-19 15:40:48 +00:00 --- debug: Session Database Driver Initialized
2026-06-19 15:40:48 +00:00 --- debug: Session Library initialized
2026-06-19 10:40:48 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 10:40:48 -05:00 --- debug: Database Library initialized
2026-06-19 10:40:48 -05:00 --- debug: Auth Library loaded
2026-06-19 18:48:48 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 18:48:48 +00:00 --- debug: Database Library initialized
2026-06-19 18:48:48 +00:00 --- debug: Cache Library initialized
2026-06-19 18:48:48 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-19 18:48:48 +00:00 --- debug: Encrypt Library initialized
2026-06-19 18:48:48 +00:00 --- debug: Session Database Driver Initialized
2026-06-19 18:48:48 +00:00 --- debug: Session Library initialized
2026-06-19 13:48:48 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 13:48:48 -05:00 --- debug: Database Library initialized
2026-06-19 13:48:48 -05:00 --- debug: Auth Library loaded
2026-06-19 13:48:48 -05:00 --- debug: Cache Library initialized
2026-06-19 13:48:48 -05:00 --- debug: Cache Library initialized
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE INDEX REPORTS ::
2026-06-19 13:48:48 -05:00 --- alert: admin::permissions() in deprecated and replaced by Auth::has_permission()
2026-06-19 13:48:48 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-19 13:48:48 -05:00 --- debug: :::::MMM   Count query   (models incident)
2026-06-19 13:48:48 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-19 13:48:48 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE i.incident_active = 1 ORDER BY i.incident_date DESC 
2026-06-19 13:48:48 -05:00 --- debug: Pagination Library initialized
2026-06-19 13:48:48 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-19 13:48:48 -05:00 --- debug: :::::MMM  Normal query       (models incident)
2026-06-19 13:48:48 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-19 13:48:48 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE i.incident_active = 1 ORDER BY i.incident_date DESC LIMIT 0, 5
2026-06-19 13:48:48 -05:00 --- debug: :::::MMM  get_total_reports (models incident)
2026-06-19 13:48:48 -05:00 --- debug: :::::MMM  get_oldest_report_timestamp (models incident)
2026-06-19 13:48:48 -05:00 --- debug: :::::MMM  get_latest_report_timestamp (models incident)
2026-06-19 13:48:48 -05:00 --- debug: :::::MMM  get_total_reports_by_verified (models incident)
2026-06-19 13:48:48 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 13:48:48 -05:00 --- debug: Database Library initialized
2026-06-19 13:48:48 -05:00 --- debug: :::::::::::::::: count
2026-06-19 13:48:48 -05:00 --- debug: 1
2026-06-19 13:48:48 -05:00 --- debug: *********** get_custom_form_fields line 146 ::
2026-06-19 13:48:48 -05:00 --- debug: :::::::::. HELPER (get_custom_form_fields) CUSTOMFORMS  ::
2026-06-19 13:48:48 -05:00 --- debug: :::::MMM  is_valid_incident (models incident)
2026-06-19 13:48:48 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-19 13:48:48 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-19 13:48:48 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-19 13:48:48 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-19 13:48:48 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-19 13:48:48 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-19 13:48:48 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-19 13:48:48 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-19 18:48:57 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 18:48:57 +00:00 --- debug: Database Library initialized
2026-06-19 18:48:57 +00:00 --- debug: Cache Library initialized
2026-06-19 18:48:57 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-19 18:48:57 +00:00 --- debug: Encrypt Library initialized
2026-06-19 18:48:57 +00:00 --- debug: Session Database Driver Initialized
2026-06-19 18:48:57 +00:00 --- debug: Session Library initialized
2026-06-19 13:48:57 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 13:48:57 -05:00 --- debug: Database Library initialized
2026-06-19 13:48:57 -05:00 --- debug: Auth Library loaded
2026-06-19 13:48:57 -05:00 --- debug: Cache Library initialized
2026-06-19 13:48:57 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 13:48:57 -05:00 --- debug: Database Library initialized
2026-06-19 19:02:37 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 19:02:37 +00:00 --- debug: Database Library initialized
2026-06-19 19:02:37 +00:00 --- debug: Cache Library initialized
2026-06-19 19:02:37 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-19 19:02:37 +00:00 --- debug: Encrypt Library initialized
2026-06-19 19:02:37 +00:00 --- debug: Session Database Driver Initialized
2026-06-19 19:02:37 +00:00 --- debug: Session Library initialized
2026-06-19 14:02:37 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 14:02:37 -05:00 --- debug: Database Library initialized
2026-06-19 14:02:37 -05:00 --- debug: Auth Library loaded
2026-06-19 14:02:37 -05:00 --- debug: Cache Library initialized
2026-06-19 14:02:37 -05:00 --- debug: Session Library initialized
2026-06-19 14:02:37 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 14:02:37 -05:00 --- debug: Database Library initialized
2026-06-19 14:02:37 -05:00 --- debug: Cache Library initialized
2026-06-19 14:02:37 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 14:02:37 -05:00 --- debug: Database Library initialized
2026-06-19 14:02:37 -05:00 --- debug: :::::MMM  get_number_reports_by_date (models incident)
2026-06-19 14:02:37 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 14:02:37 -05:00 --- debug: Database Library initialized
2026-06-19 14:02:37 -05:00 --- debug: ::::::::: MMMM MOSTRAR EL VALOR DEL USER_ID
2026-06-19 14:02:37 -05:00 --- debug: 
2026-06-19 14:02:37 -05:00 --- debug: ADMIN
2026-06-19 14:02:37 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-19 14:02:37 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-19 14:02:37 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-19 14:02:37 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-19 14:02:37 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-19 14:02:37 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-19 19:02:38 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 19:02:38 +00:00 --- debug: Database Library initialized
2026-06-19 19:02:38 +00:00 --- debug: Cache Library initialized
2026-06-19 19:02:38 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-19 19:02:38 +00:00 --- debug: Encrypt Library initialized
2026-06-19 19:02:38 +00:00 --- debug: Session Database Driver Initialized
2026-06-19 19:02:38 +00:00 --- debug: Session Library initialized
2026-06-19 14:02:38 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 14:02:38 -05:00 --- debug: Database Library initialized
2026-06-19 14:02:38 -05:00 --- debug: Auth Library loaded
2026-06-19 14:02:38 -05:00 --- debug: Cache Library initialized
2026-06-19 14:02:38 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 14:02:38 -05:00 --- debug: Database Library initialized
2026-06-19 19:02:38 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 19:02:38 +00:00 --- debug: Database Library initialized
2026-06-19 19:02:38 +00:00 --- debug: Cache Library initialized
2026-06-19 19:02:38 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-19 19:02:38 +00:00 --- debug: Encrypt Library initialized
2026-06-19 19:02:38 +00:00 --- debug: Session Database Driver Initialized
2026-06-19 19:02:38 +00:00 --- debug: Session Library initialized
2026-06-19 14:02:38 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 14:02:38 -05:00 --- debug: Database Library initialized
2026-06-19 14:02:38 -05:00 --- debug: Auth Library loaded
2026-06-19 14:02:38 -05:00 --- debug: Cache Library initialized
2026-06-19 14:02:38 -05:00 --- debug: Session Library initialized
2026-06-19 14:02:38 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 14:02:38 -05:00 --- debug: Database Library initialized
2026-06-19 14:02:38 -05:00 --- debug: Cache Library initialized
2026-06-19 14:02:38 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-19 14:02:38 -05:00 --- debug: Database Library initialized
