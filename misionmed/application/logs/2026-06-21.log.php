<?php defined('SYSPATH') or die('No direct script access.'); ?>

2026-06-21 18:57:03 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 18:57:03 +00:00 --- debug: Database Library initialized
2026-06-21 18:57:03 +00:00 --- debug: Cache Library initialized
2026-06-21 18:57:03 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 18:57:03 +00:00 --- debug: Encrypt Library initialized
2026-06-21 18:57:03 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 18:57:03 +00:00 --- debug: Session Library initialized
2026-06-21 13:57:03 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 13:57:03 -05:00 --- debug: Database Library initialized
2026-06-21 13:57:03 -05:00 --- debug: Auth Library loaded
2026-06-21 13:57:03 -05:00 --- debug: Cache Library initialized
2026-06-21 13:57:03 -05:00 --- debug: Session Library initialized
2026-06-21 13:57:03 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 13:57:03 -05:00 --- debug: Database Library initialized
2026-06-21 13:57:03 -05:00 --- debug: Cache Library initialized
2026-06-21 13:57:03 -05:00 --- debug: :::::MMM  get_oldest_report_timestamp (models incident)
2026-06-21 13:57:03 -05:00 --- debug: :::::MMM  get_latest_report_timestamp (models incident)
2026-06-21 13:57:03 -05:00 --- alert: admin::permissions() in deprecated and replaced by Auth::has_permission()
2026-06-21 13:57:03 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-21 13:57:03 -05:00 --- debug: :::::MMM   Count query   (models incident)
2026-06-21 13:57:03 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-21 13:57:03 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE 1=1 ORDER BY i.incident_date DESC 
2026-06-21 13:57:03 -05:00 --- debug: Pagination Library initialized
2026-06-21 13:57:03 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-21 13:57:03 -05:00 --- debug: :::::MMM  Normal query       (models incident)
2026-06-21 13:57:03 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-21 13:57:03 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE 1=1 ORDER BY i.incident_date DESC LIMIT 0, 50
2026-06-21 13:57:03 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:03 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:03 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:03 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:03 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:03 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:03 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:03 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:03 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 13:57:03 -05:00 --- debug: Database Library initialized
2026-06-21 13:57:03 -05:00 --- debug: :::::::::::::::: count
2026-06-21 13:57:03 -05:00 --- debug: 
2026-06-21 13:57:03 -05:00 --- debug: :::::::::::::::: CONSULTA SQL EN EL ELSE
2026-06-21 13:57:03 -05:00 --- debug: SELECT c.id, c.parent_id, c.category_title, c.category_color, c.category_image, c.category_image_thumb FROM category c LEFT JOIN category c_parent ON (c.parent_id = c_parent.id) WHERE 1=1 ORDER BY c.category_position ASC
2026-06-21 13:57:03 -05:00 --- info: Missing i18n entry ui_main.web for language en_US
2026-06-21 13:57:03 -05:00 --- info: Missing i18n entry ui_main.keywords for language en_US
2026-06-21 13:57:03 -05:00 --- info: Missing i18n entry reports.documento for language en_US
2026-06-21 13:57:03 -05:00 --- debug: Regenerated CSRF token: 2aef24d618b0bd43559f42f94063c40f48f2637177992783d6cf13fbbb09d68f
2026-06-21 18:57:04 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 18:57:04 +00:00 --- debug: Database Library initialized
2026-06-21 18:57:04 +00:00 --- debug: Cache Library initialized
2026-06-21 18:57:04 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 18:57:04 +00:00 --- debug: Encrypt Library initialized
2026-06-21 18:57:04 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 18:57:04 +00:00 --- debug: Session Library initialized
2026-06-21 13:57:04 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 13:57:04 -05:00 --- debug: Database Library initialized
2026-06-21 13:57:04 -05:00 --- debug: Auth Library loaded
2026-06-21 13:57:04 -05:00 --- debug: Cache Library initialized
2026-06-21 13:57:04 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 13:57:04 -05:00 --- debug: Database Library initialized
2026-06-21 18:57:08 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 18:57:08 +00:00 --- debug: Database Library initialized
2026-06-21 18:57:08 +00:00 --- debug: Cache Library initialized
2026-06-21 18:57:08 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 18:57:08 +00:00 --- debug: Encrypt Library initialized
2026-06-21 18:57:08 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 18:57:08 +00:00 --- debug: Session Library initialized
2026-06-21 13:57:08 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 13:57:08 -05:00 --- debug: Database Library initialized
2026-06-21 13:57:08 -05:00 --- debug: Auth Library loaded
2026-06-21 13:57:08 -05:00 --- debug: Cache Library initialized
2026-06-21 13:57:08 -05:00 --- debug: Session Library initialized
2026-06-21 13:57:08 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 13:57:08 -05:00 --- debug: Database Library initialized
2026-06-21 13:57:08 -05:00 --- debug: Cache Library initialized
2026-06-21 13:57:08 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 13:57:08 -05:00 --- debug: Database Library initialized
2026-06-21 13:57:08 -05:00 --- debug: :::::MMM  get_number_reports_by_date (models incident)
2026-06-21 13:57:08 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 13:57:08 -05:00 --- debug: Database Library initialized
2026-06-21 13:57:08 -05:00 --- debug: ::::::::: MMMM MOSTRAR EL VALOR DEL USER_ID
2026-06-21 13:57:08 -05:00 --- debug: 
2026-06-21 13:57:08 -05:00 --- debug: ADMIN
2026-06-21 13:57:08 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:08 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:08 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:08 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:08 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:08 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 18:57:08 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 18:57:08 +00:00 --- debug: Database Library initialized
2026-06-21 18:57:08 +00:00 --- debug: Cache Library initialized
2026-06-21 18:57:08 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 18:57:08 +00:00 --- debug: Encrypt Library initialized
2026-06-21 18:57:08 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 18:57:08 +00:00 --- debug: Session Library initialized
2026-06-21 13:57:08 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 13:57:08 -05:00 --- debug: Database Library initialized
2026-06-21 13:57:08 -05:00 --- debug: Auth Library loaded
2026-06-21 18:57:12 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 18:57:12 +00:00 --- debug: Database Library initialized
2026-06-21 18:57:12 +00:00 --- debug: Cache Library initialized
2026-06-21 18:57:12 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 18:57:12 +00:00 --- debug: Encrypt Library initialized
2026-06-21 18:57:12 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 18:57:12 +00:00 --- debug: Session Library initialized
2026-06-21 13:57:12 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 13:57:12 -05:00 --- debug: Database Library initialized
2026-06-21 13:57:12 -05:00 --- debug: Auth Library loaded
2026-06-21 13:57:12 -05:00 --- debug: Cache Library initialized
2026-06-21 13:57:12 -05:00 --- debug: Cache Library initialized
2026-06-21 13:57:12 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 13:57:12 -05:00 --- debug: Database Library initialized
2026-06-21 13:57:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 18:57:13 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 18:57:13 +00:00 --- debug: Database Library initialized
2026-06-21 18:57:13 +00:00 --- debug: Cache Library initialized
2026-06-21 18:57:13 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 18:57:13 +00:00 --- debug: Encrypt Library initialized
2026-06-21 18:57:13 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 18:57:13 +00:00 --- debug: Session Library initialized
2026-06-21 13:57:13 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 13:57:13 -05:00 --- debug: Database Library initialized
2026-06-21 13:57:13 -05:00 --- debug: Auth Library loaded
2026-06-21 18:57:14 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 18:57:14 +00:00 --- debug: Database Library initialized
2026-06-21 18:57:14 +00:00 --- debug: Cache Library initialized
2026-06-21 18:57:14 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 18:57:14 +00:00 --- debug: Encrypt Library initialized
2026-06-21 18:57:14 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 18:57:14 +00:00 --- debug: Session Library initialized
2026-06-21 13:57:14 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 13:57:14 -05:00 --- debug: Database Library initialized
2026-06-21 13:57:14 -05:00 --- debug: Auth Library loaded
2026-06-21 13:57:14 -05:00 --- debug: Cache Library initialized
2026-06-21 13:57:14 -05:00 --- debug: Cache Library initialized
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE INDEX REPORTS ::
2026-06-21 13:57:14 -05:00 --- alert: admin::permissions() in deprecated and replaced by Auth::has_permission()
2026-06-21 13:57:14 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-21 13:57:14 -05:00 --- debug: :::::MMM   Count query   (models incident)
2026-06-21 13:57:14 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-21 13:57:14 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE i.incident_active = 1 ORDER BY i.incident_date DESC 
2026-06-21 13:57:14 -05:00 --- debug: Pagination Library initialized
2026-06-21 13:57:14 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-21 13:57:14 -05:00 --- debug: :::::MMM  Normal query       (models incident)
2026-06-21 13:57:14 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-21 13:57:14 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE i.incident_active = 1 ORDER BY i.incident_date DESC LIMIT 0, 5
2026-06-21 13:57:14 -05:00 --- debug: :::::MMM  get_total_reports (models incident)
2026-06-21 13:57:14 -05:00 --- debug: :::::MMM  get_oldest_report_timestamp (models incident)
2026-06-21 13:57:14 -05:00 --- debug: :::::MMM  get_latest_report_timestamp (models incident)
2026-06-21 13:57:14 -05:00 --- debug: :::::MMM  get_total_reports_by_verified (models incident)
2026-06-21 13:57:14 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 13:57:14 -05:00 --- debug: Database Library initialized
2026-06-21 13:57:14 -05:00 --- debug: :::::::::::::::: count
2026-06-21 13:57:14 -05:00 --- debug: 1
2026-06-21 13:57:14 -05:00 --- debug: *********** get_custom_form_fields line 146 ::
2026-06-21 13:57:14 -05:00 --- debug: :::::::::. HELPER (get_custom_form_fields) CUSTOMFORMS  ::
2026-06-21 13:57:14 -05:00 --- debug: :::::MMM  is_valid_incident (models incident)
2026-06-21 13:57:14 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:14 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:14 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:14 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:14 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:14 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:14 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 13:57:14 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 18:57:14 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 18:57:14 +00:00 --- debug: Database Library initialized
2026-06-21 18:57:14 +00:00 --- debug: Cache Library initialized
2026-06-21 18:57:14 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 18:57:14 +00:00 --- debug: Encrypt Library initialized
2026-06-21 18:57:14 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 18:57:14 +00:00 --- debug: Session Library initialized
2026-06-21 13:57:14 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 13:57:14 -05:00 --- debug: Database Library initialized
2026-06-21 13:57:14 -05:00 --- debug: Auth Library loaded
2026-06-21 18:57:08 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 18:57:08 +00:00 --- debug: Database Library initialized
2026-06-21 18:57:08 +00:00 --- debug: Cache Library initialized
2026-06-21 18:57:08 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 18:57:08 +00:00 --- debug: Encrypt Library initialized
2026-06-21 18:57:08 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 18:57:08 +00:00 --- debug: Session Library initialized
2026-06-21 13:57:08 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 13:57:08 -05:00 --- debug: Database Library initialized
2026-06-21 13:57:08 -05:00 --- debug: Auth Library loaded
2026-06-21 13:57:08 -05:00 --- debug: Cache Library initialized
2026-06-21 13:57:08 -05:00 --- debug: Session Library initialized
2026-06-21 13:57:08 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 13:57:08 -05:00 --- debug: Database Library initialized
2026-06-21 13:57:08 -05:00 --- debug: Cache Library initialized
2026-06-21 13:57:08 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 13:57:08 -05:00 --- debug: Database Library initialized
2026-06-21 19:33:47 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:33:47 +00:00 --- debug: Database Library initialized
2026-06-21 19:33:47 +00:00 --- debug: Cache Library initialized
2026-06-21 19:33:47 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:33:47 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:33:47 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:33:47 +00:00 --- debug: Session Library initialized
2026-06-21 14:33:47 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:33:47 -05:00 --- debug: Database Library initialized
2026-06-21 14:33:47 -05:00 --- debug: Auth Library loaded
2026-06-21 19:33:47 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:33:47 +00:00 --- debug: Database Library initialized
2026-06-21 19:33:47 +00:00 --- debug: Cache Library initialized
2026-06-21 19:33:47 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:33:47 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:33:47 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:33:47 +00:00 --- debug: Session Library initialized
2026-06-21 14:33:47 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:33:47 -05:00 --- debug: Database Library initialized
2026-06-21 14:33:47 -05:00 --- debug: Auth Library loaded
2026-06-21 14:33:47 -05:00 --- debug: Session Library initialized
2026-06-21 14:33:47 -05:00 --- debug: Regenerated CSRF token: 2fa8a3bf01810822b4c558bb28a23edd1e06195e68bdb01808571a38adba26cd
2026-06-21 19:36:35 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:36:35 +00:00 --- debug: Database Library initialized
2026-06-21 19:36:35 +00:00 --- debug: Cache Library initialized
2026-06-21 19:36:35 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:36:35 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:36:35 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:36:35 +00:00 --- debug: Session Library initialized
2026-06-21 14:36:35 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:36:35 -05:00 --- debug: Database Library initialized
2026-06-21 14:36:35 -05:00 --- debug: Auth Library loaded
2026-06-21 14:36:35 -05:00 --- debug: Cache Library initialized
2026-06-21 14:36:35 -05:00 --- debug: Cache Library initialized
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE INDEX REPORTS ::
2026-06-21 14:36:35 -05:00 --- alert: admin::permissions() in deprecated and replaced by Auth::has_permission()
2026-06-21 14:36:35 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-21 14:36:35 -05:00 --- debug: :::::MMM   Count query   (models incident)
2026-06-21 14:36:35 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-21 14:36:35 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE i.incident_active = 1 ORDER BY i.incident_date DESC 
2026-06-21 14:36:35 -05:00 --- debug: Pagination Library initialized
2026-06-21 14:36:35 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-21 14:36:35 -05:00 --- debug: :::::MMM  Normal query       (models incident)
2026-06-21 14:36:35 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-21 14:36:35 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE i.incident_active = 1 ORDER BY i.incident_date DESC LIMIT 0, 5
2026-06-21 14:36:35 -05:00 --- debug: :::::MMM  get_total_reports (models incident)
2026-06-21 14:36:35 -05:00 --- debug: :::::MMM  get_oldest_report_timestamp (models incident)
2026-06-21 14:36:35 -05:00 --- debug: :::::MMM  get_latest_report_timestamp (models incident)
2026-06-21 14:36:35 -05:00 --- debug: :::::MMM  get_total_reports_by_verified (models incident)
2026-06-21 14:36:35 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:36:35 -05:00 --- debug: Database Library initialized
2026-06-21 14:36:35 -05:00 --- debug: :::::::::::::::: count
2026-06-21 14:36:35 -05:00 --- debug: 1
2026-06-21 14:36:35 -05:00 --- debug: *********** get_custom_form_fields line 146 ::
2026-06-21 14:36:35 -05:00 --- debug: :::::::::. HELPER (get_custom_form_fields) CUSTOMFORMS  ::
2026-06-21 14:36:35 -05:00 --- debug: :::::MMM  is_valid_incident (models incident)
2026-06-21 14:36:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:36:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:36:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:36:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:36:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:36:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:36:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 14:36:35 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 19:36:35 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:36:35 +00:00 --- debug: Database Library initialized
2026-06-21 19:36:35 +00:00 --- debug: Cache Library initialized
2026-06-21 19:36:35 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:36:35 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:36:35 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:36:35 +00:00 --- debug: Session Library initialized
2026-06-21 14:36:35 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:36:35 -05:00 --- debug: Database Library initialized
2026-06-21 14:36:35 -05:00 --- debug: Auth Library loaded
2026-06-21 14:36:35 -05:00 --- debug: Cache Library initialized
2026-06-21 14:36:35 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:36:35 -05:00 --- debug: Database Library initialized
2026-06-21 19:36:41 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:36:41 +00:00 --- debug: Database Library initialized
2026-06-21 19:36:41 +00:00 --- debug: Cache Library initialized
2026-06-21 19:36:41 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:36:41 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:36:41 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:36:41 +00:00 --- debug: Session Library initialized
2026-06-21 14:36:41 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:36:41 -05:00 --- debug: Database Library initialized
2026-06-21 14:36:41 -05:00 --- debug: Auth Library loaded
2026-06-21 14:36:41 -05:00 --- debug: Cache Library initialized
2026-06-21 14:36:41 -05:00 --- debug: Cache Library initialized
2026-06-21 14:36:41 -05:00 --- debug: YA ENTRE Submits a new report ::
2026-06-21 14:36:41 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:36:41 -05:00 --- debug: Database Library initialized
2026-06-21 14:36:41 -05:00 --- debug: *********** get_custom_form_fields line 321 ::
2026-06-21 14:36:41 -05:00 --- debug: :::::::::. HELPER (get_custom_form_fields) CUSTOMFORMS  ::
2026-06-21 14:36:41 -05:00 --- debug: :::::MMM  is_valid_incident (models incident)
2026-06-21 14:36:41 -05:00 --- debug: *********** get_custom_form_fields line 421 ::
2026-06-21 14:36:41 -05:00 --- debug: :::::::::. HELPER (get_custom_form_fields) CUSTOMFORMS  ::
2026-06-21 14:36:41 -05:00 --- debug: :::::MMM  is_valid_incident (models incident)
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** Campo Departamento encontrado: ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:36:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:36:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:36:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:36:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:36:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:36:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:36:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:36:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:36:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:36:41 -05:00 --- info: Missing i18n entry ui_main.allowed_tags for language en_US
2026-06-21 14:36:41 -05:00 --- info: Missing i18n entry ui_main.allowed_iframes for language en_US
2026-06-21 14:36:41 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:36:41 -05:00 --- debug: Database Library initialized
2026-06-21 14:36:41 -05:00 --- debug: :::::::::::::::: count
2026-06-21 14:36:41 -05:00 --- debug: 
2026-06-21 14:36:41 -05:00 --- debug: :::::::::::::::: CONSULTA SQL EN EL ELSE
2026-06-21 14:36:41 -05:00 --- debug: SELECT c.id, c.parent_id, c.category_title, c.category_color, c.category_image, c.category_image_thumb FROM category c LEFT JOIN category c_parent ON (c.parent_id = c_parent.id) WHERE 1=1 AND c.category_visible = 1 AND (c_parent.category_visible = 1 OR c.parent_id = 0)ORDER BY c.category_position ASC
2026-06-21 14:36:41 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:41 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:41 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:41 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:41 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:41 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:41 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:41 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:41 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:41 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:41 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:41 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:41 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:41 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:36:41 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 14:36:41 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 14:36:41 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 14:36:41 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 19:36:42 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:36:42 +00:00 --- debug: Database Library initialized
2026-06-21 19:36:42 +00:00 --- debug: Cache Library initialized
2026-06-21 19:36:42 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:36:42 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:36:42 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:36:42 +00:00 --- debug: Session Library initialized
2026-06-21 14:36:42 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:36:42 -05:00 --- debug: Database Library initialized
2026-06-21 14:36:42 -05:00 --- debug: Auth Library loaded
2026-06-21 19:38:21 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:38:21 +00:00 --- debug: Database Library initialized
2026-06-21 19:38:21 +00:00 --- debug: Cache Library initialized
2026-06-21 19:38:21 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:38:21 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:38:21 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:38:21 +00:00 --- debug: Session Library initialized
2026-06-21 14:38:21 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:21 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:21 -05:00 --- debug: Auth Library loaded
2026-06-21 14:38:21 -05:00 --- debug: Cache Library initialized
2026-06-21 14:38:21 -05:00 --- debug: Cache Library initialized
2026-06-21 14:38:21 -05:00 --- debug: YA ENTRE Submits a new report ::
2026-06-21 14:38:21 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:21 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:21 -05:00 --- debug: *********** get_custom_form_fields line 321 ::
2026-06-21 14:38:21 -05:00 --- debug: :::::::::. HELPER (get_custom_form_fields) CUSTOMFORMS  ::
2026-06-21 14:38:21 -05:00 --- debug: :::::MMM  is_valid_incident (models incident)
2026-06-21 14:38:21 -05:00 --- debug: *********** get_custom_form_fields line 421 ::
2026-06-21 14:38:21 -05:00 --- debug: :::::::::. HELPER (get_custom_form_fields) CUSTOMFORMS  ::
2026-06-21 14:38:21 -05:00 --- debug: :::::MMM  is_valid_incident (models incident)
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** Campo Departamento encontrado: ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- debug:  *************** SE VA BUSCAR DPTO ::
2026-06-21 14:38:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:21 -05:00 --- info: Missing i18n entry ui_main.allowed_tags for language en_US
2026-06-21 14:38:21 -05:00 --- info: Missing i18n entry ui_main.allowed_iframes for language en_US
2026-06-21 14:38:21 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:21 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:21 -05:00 --- debug: :::::::::::::::: count
2026-06-21 14:38:21 -05:00 --- debug: 
2026-06-21 14:38:21 -05:00 --- debug: :::::::::::::::: CONSULTA SQL EN EL ELSE
2026-06-21 14:38:21 -05:00 --- debug: SELECT c.id, c.parent_id, c.category_title, c.category_color, c.category_image, c.category_image_thumb FROM category c LEFT JOIN category c_parent ON (c.parent_id = c_parent.id) WHERE 1=1 AND c.category_visible = 1 AND (c_parent.category_visible = 1 OR c.parent_id = 0)ORDER BY c.category_position ASC
2026-06-21 14:38:21 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:38:21 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:38:21 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:38:21 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:38:21 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:38:21 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:38:21 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:38:21 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:38:21 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:38:21 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:38:21 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:38:21 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:38:21 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:38:21 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:38:21 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 14:38:21 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 14:38:21 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 14:38:21 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 19:38:22 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:38:22 +00:00 --- debug: Database Library initialized
2026-06-21 19:38:22 +00:00 --- debug: Cache Library initialized
2026-06-21 19:38:22 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:38:22 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:38:22 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:38:22 +00:00 --- debug: Session Library initialized
2026-06-21 14:38:22 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:22 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:22 -05:00 --- debug: Auth Library loaded
2026-06-21 19:38:28 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:38:28 +00:00 --- debug: Database Library initialized
2026-06-21 19:38:28 +00:00 --- debug: Cache Library initialized
2026-06-21 19:38:28 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:38:28 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:38:28 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:38:28 +00:00 --- debug: Session Library initialized
2026-06-21 14:38:28 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:28 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:28 -05:00 --- debug: Auth Library loaded
2026-06-21 14:38:28 -05:00 --- debug: Cache Library initialized
2026-06-21 14:38:28 -05:00 --- debug: Cache Library initialized
2026-06-21 14:38:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:28 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:28 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:28 -05:00 --- debug: :::::::::::::::: count
2026-06-21 14:38:28 -05:00 --- debug: 
2026-06-21 14:38:28 -05:00 --- debug: :::::::::::::::: CONSULTA SQL EN EL ELSE
2026-06-21 14:38:28 -05:00 --- debug: SELECT c.id, c.parent_id, c.category_title, c.category_color, c.category_image, c.category_image_thumb FROM category c LEFT JOIN category c_parent ON (c.parent_id = c_parent.id) WHERE 1=1 AND c.category_visible = 1 AND (c_parent.category_visible = 1 OR c.parent_id = 0)ORDER BY c.category_position ASC
2026-06-21 19:38:28 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:38:28 +00:00 --- debug: Database Library initialized
2026-06-21 19:38:28 +00:00 --- debug: Cache Library initialized
2026-06-21 19:38:28 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:38:28 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:38:28 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:38:28 +00:00 --- debug: Session Library initialized
2026-06-21 14:38:28 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:28 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:28 -05:00 --- debug: Auth Library loaded
2026-06-21 19:38:31 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:38:31 +00:00 --- debug: Database Library initialized
2026-06-21 19:38:31 +00:00 --- debug: Cache Library initialized
2026-06-21 19:38:31 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:38:31 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:38:31 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:38:31 +00:00 --- debug: Session Library initialized
2026-06-21 14:38:31 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:31 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:31 -05:00 --- debug: Auth Library loaded
2026-06-21 14:38:31 -05:00 --- debug: Cache Library initialized
2026-06-21 14:38:31 -05:00 --- debug: Cache Library initialized
2026-06-21 14:38:31 -05:00 --- debug: Captcha Library initialized
2026-06-21 14:38:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:31 -05:00 --- info:  Captcha--> updateresponse= 18
2026-06-21 19:38:32 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:38:32 +00:00 --- debug: Database Library initialized
2026-06-21 19:38:32 +00:00 --- debug: Cache Library initialized
2026-06-21 19:38:32 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:38:32 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:38:32 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:38:32 +00:00 --- debug: Session Library initialized
2026-06-21 14:38:32 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:32 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:32 -05:00 --- debug: Auth Library loaded
2026-06-21 19:38:33 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:38:33 +00:00 --- debug: Database Library initialized
2026-06-21 19:38:33 +00:00 --- debug: Cache Library initialized
2026-06-21 19:38:33 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:38:33 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:38:33 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:38:33 +00:00 --- debug: Session Library initialized
2026-06-21 14:38:33 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:33 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:33 -05:00 --- debug: Auth Library loaded
2026-06-21 14:38:33 -05:00 --- debug: Cache Library initialized
2026-06-21 14:38:33 -05:00 --- debug: Cache Library initialized
2026-06-21 14:38:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 19:38:34 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:38:34 +00:00 --- debug: Database Library initialized
2026-06-21 19:38:34 +00:00 --- debug: Cache Library initialized
2026-06-21 19:38:34 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:38:34 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:38:34 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:38:34 +00:00 --- debug: Session Library initialized
2026-06-21 14:38:34 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:34 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:34 -05:00 --- debug: Auth Library loaded
2026-06-21 19:38:38 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:38:38 +00:00 --- debug: Database Library initialized
2026-06-21 19:38:38 +00:00 --- debug: Cache Library initialized
2026-06-21 19:38:38 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:38:38 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:38:38 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:38:38 +00:00 --- debug: Session Library initialized
2026-06-21 14:38:38 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:38 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:38 -05:00 --- debug: Auth Library loaded
2026-06-21 14:38:38 -05:00 --- debug: Cache Library initialized
2026-06-21 14:38:38 -05:00 --- debug: Cache Library initialized
2026-06-21 14:38:38 -05:00 --- debug: Cache Library initialized
2026-06-21 14:38:38 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:38 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:38 -05:00 --- alert: admin::permissions() in deprecated and replaced by Auth::has_permission()
2026-06-21 19:38:39 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:38:39 +00:00 --- debug: Database Library initialized
2026-06-21 19:38:39 +00:00 --- debug: Cache Library initialized
2026-06-21 19:38:39 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:38:39 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:38:39 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:38:39 +00:00 --- debug: Session Library initialized
2026-06-21 14:38:39 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:39 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:39 -05:00 --- debug: Auth Library loaded
2026-06-21 19:38:41 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:38:41 +00:00 --- debug: Database Library initialized
2026-06-21 19:38:41 +00:00 --- debug: Cache Library initialized
2026-06-21 19:38:41 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:38:41 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:38:41 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:38:41 +00:00 --- debug: Session Library initialized
2026-06-21 14:38:41 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:41 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:41 -05:00 --- debug: Auth Library loaded
2026-06-21 14:38:41 -05:00 --- debug: Cache Library initialized
2026-06-21 14:38:41 -05:00 --- debug: Cache Library initialized
2026-06-21 14:38:42 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:42 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:42 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:42 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:42 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:42 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:42 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:42 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:42 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:42 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:42 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 19:38:42 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:38:42 +00:00 --- debug: Database Library initialized
2026-06-21 19:38:42 +00:00 --- debug: Cache Library initialized
2026-06-21 19:38:42 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:38:42 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:38:42 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:38:42 +00:00 --- debug: Session Library initialized
2026-06-21 14:38:42 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:42 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:42 -05:00 --- debug: Auth Library loaded
2026-06-21 19:38:45 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:38:45 +00:00 --- debug: Database Library initialized
2026-06-21 19:38:45 +00:00 --- debug: Cache Library initialized
2026-06-21 19:38:45 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:38:45 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:38:45 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:38:45 +00:00 --- debug: Session Library initialized
2026-06-21 14:38:45 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:45 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:45 -05:00 --- debug: Auth Library loaded
2026-06-21 14:38:45 -05:00 --- debug: Cache Library initialized
2026-06-21 14:38:45 -05:00 --- debug: Session Library initialized
2026-06-21 14:38:45 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:45 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:45 -05:00 --- debug: Cache Library initialized
2026-06-21 14:38:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 19:38:51 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:38:51 +00:00 --- debug: Database Library initialized
2026-06-21 19:38:51 +00:00 --- debug: Cache Library initialized
2026-06-21 19:38:52 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:38:52 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:38:52 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:38:52 +00:00 --- debug: Session Library initialized
2026-06-21 14:38:52 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:52 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:52 -05:00 --- debug: Auth Library loaded
2026-06-21 14:38:52 -05:00 --- debug: Cache Library initialized
2026-06-21 14:38:52 -05:00 --- debug: Session Library initialized
2026-06-21 14:38:52 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:52 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:52 -05:00 --- debug: Cache Library initialized
2026-06-21 14:38:52 -05:00 --- debug: :::::MMM  get_number_reports_by_date (models incident)
2026-06-21 14:38:52 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:52 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:52 -05:00 --- debug: ::::::::: MMMM MOSTRAR EL VALOR DEL USER_ID
2026-06-21 14:38:52 -05:00 --- debug: 1
2026-06-21 14:38:52 -05:00 --- debug: ADMIN
2026-06-21 14:38:52 -05:00 --- debug: ::::::::: MMMM empty(user_id) USER_ID
2026-06-21 14:38:52 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:52 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:52 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:52 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:52 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:52 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:38:52 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 19:39:01 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:01 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:01 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:01 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:01 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:01 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:01 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:01 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:01 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:01 -05:00 --- debug: Auth Library loaded
2026-06-21 14:39:01 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:01 -05:00 --- debug: Session Library initialized
2026-06-21 14:39:01 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:01 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:01 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:01 -05:00 --- debug: :::::MMM  get_number_reports_by_date (models incident)
2026-06-21 14:39:01 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:01 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:01 -05:00 --- debug: ::::::::: MMMM MOSTRAR EL VALOR DEL USER_ID
2026-06-21 14:39:01 -05:00 --- debug: 1
2026-06-21 14:39:01 -05:00 --- debug: ADMIN
2026-06-21 14:39:01 -05:00 --- debug: ::::::::: MMMM empty(user_id) USER_ID
2026-06-21 14:39:01 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:01 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:01 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:01 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:01 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:01 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:01 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 19:39:05 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:05 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:05 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:05 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:05 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:05 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:05 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:05 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:05 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:05 -05:00 --- debug: Auth Library loaded
2026-06-21 14:39:05 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:05 -05:00 --- debug: Session Library initialized
2026-06-21 14:39:05 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:05 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:05 -05:00 --- debug: Cache Library initialized
2026-06-21 19:39:05 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:05 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:05 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:05 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:05 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:05 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:05 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:05 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:05 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:05 -05:00 --- debug: Auth Library loaded
2026-06-21 14:39:05 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:05 -05:00 --- debug: Session Library initialized
2026-06-21 14:39:05 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:05 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:05 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:05 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:05 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:05 -05:00 --- debug: :::::MMM  get_number_reports_by_date (models incident)
2026-06-21 14:39:05 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:05 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:05 -05:00 --- debug: ::::::::: MMMM MOSTRAR EL VALOR DEL USER_ID
2026-06-21 14:39:05 -05:00 --- debug: 
2026-06-21 14:39:05 -05:00 --- debug: ADMIN
2026-06-21 14:39:05 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:05 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:05 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:05 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:05 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:05 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 19:39:05 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:05 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:05 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:05 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:05 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:05 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:05 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:05 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:05 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:05 -05:00 --- debug: Auth Library loaded
2026-06-21 19:39:08 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:08 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:08 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:08 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:08 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:08 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:08 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:08 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:08 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:08 -05:00 --- debug: Auth Library loaded
2026-06-21 14:39:08 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:08 -05:00 --- debug: Session Library initialized
2026-06-21 14:39:08 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:08 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:08 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:08 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:08 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:08 -05:00 --- debug: :::::MMM  get_number_reports_by_date (models incident)
2026-06-21 14:39:08 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:08 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:08 -05:00 --- debug: ::::::::: MMMM MOSTRAR EL VALOR DEL USER_ID
2026-06-21 14:39:08 -05:00 --- debug: 
2026-06-21 14:39:08 -05:00 --- debug: ADMIN
2026-06-21 14:39:08 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:08 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:08 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:08 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:08 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:08 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 19:39:09 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:09 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:09 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:09 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:09 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:09 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:09 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:09 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:09 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:09 -05:00 --- debug: Auth Library loaded
2026-06-21 19:39:10 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:10 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:10 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:10 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:10 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:10 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:10 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:10 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:10 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:10 -05:00 --- debug: Auth Library loaded
2026-06-21 14:39:10 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:10 -05:00 --- debug: Session Library initialized
2026-06-21 14:39:10 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:10 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:10 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:10 -05:00 --- debug: :::::MMM  get_oldest_report_timestamp (models incident)
2026-06-21 14:39:10 -05:00 --- debug: :::::MMM  get_latest_report_timestamp (models incident)
2026-06-21 14:39:10 -05:00 --- alert: admin::permissions() in deprecated and replaced by Auth::has_permission()
2026-06-21 14:39:10 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-21 14:39:10 -05:00 --- debug: :::::MMM   Count query   (models incident)
2026-06-21 14:39:10 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-21 14:39:10 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE 1=1 ORDER BY i.incident_date DESC 
2026-06-21 14:39:10 -05:00 --- debug: Pagination Library initialized
2026-06-21 14:39:10 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-21 14:39:10 -05:00 --- debug: :::::MMM  Normal query       (models incident)
2026-06-21 14:39:10 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-21 14:39:10 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE 1=1 ORDER BY i.incident_date DESC LIMIT 0, 50
2026-06-21 14:39:10 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:10 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:10 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:10 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:10 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:10 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:10 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:10 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:10 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:10 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:10 -05:00 --- debug: :::::::::::::::: count
2026-06-21 14:39:10 -05:00 --- debug: 
2026-06-21 14:39:10 -05:00 --- debug: :::::::::::::::: CONSULTA SQL EN EL ELSE
2026-06-21 14:39:10 -05:00 --- debug: SELECT c.id, c.parent_id, c.category_title, c.category_color, c.category_image, c.category_image_thumb FROM category c LEFT JOIN category c_parent ON (c.parent_id = c_parent.id) WHERE 1=1 ORDER BY c.category_position ASC
2026-06-21 14:39:10 -05:00 --- info: Missing i18n entry ui_main.web for language en_US
2026-06-21 14:39:10 -05:00 --- info: Missing i18n entry ui_main.keywords for language en_US
2026-06-21 14:39:10 -05:00 --- info: Missing i18n entry reports.documento for language en_US
2026-06-21 19:39:11 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:11 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:11 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:11 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:11 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:11 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:11 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:11 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:11 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:11 -05:00 --- debug: Auth Library loaded
2026-06-21 19:39:12 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:12 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:12 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:12 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:12 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:12 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:12 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:12 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:12 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:12 -05:00 --- debug: Auth Library loaded
2026-06-21 14:39:12 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:12 -05:00 --- debug: Session Library initialized
2026-06-21 14:39:12 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:12 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:12 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:12 -05:00 --- debug: Pagination Library initialized
2026-06-21 14:39:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:12 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 19:39:13 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:13 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:13 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:13 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:13 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:13 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:13 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:13 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:13 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:13 -05:00 --- debug: Auth Library loaded
2026-06-21 19:39:14 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:14 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:14 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:14 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:14 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:14 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:14 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:14 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:14 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:14 -05:00 --- debug: Auth Library loaded
2026-06-21 14:39:14 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:14 -05:00 --- debug: Session Library initialized
2026-06-21 14:39:14 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:14 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:14 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:14 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:14 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:14 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:14 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:14 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:14 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:14 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 19:39:14 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:14 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:14 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:14 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:14 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:14 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:14 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:14 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:14 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:14 -05:00 --- debug: Auth Library loaded
2026-06-21 19:39:17 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:17 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:17 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:17 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:17 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:17 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:17 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:17 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:17 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:17 -05:00 --- debug: Auth Library loaded
2026-06-21 14:39:17 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:17 -05:00 --- debug: Session Library initialized
2026-06-21 14:39:17 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:17 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:17 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:17 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:17 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:17 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:17 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:17 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:17 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:17 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 19:39:17 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:17 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:17 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:17 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:17 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:17 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:17 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:17 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:17 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:17 -05:00 --- debug: Auth Library loaded
2026-06-21 19:39:18 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:18 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:18 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:18 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:18 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:18 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:18 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:18 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:18 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:18 -05:00 --- debug: Auth Library loaded
2026-06-21 14:39:18 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:18 -05:00 --- debug: Session Library initialized
2026-06-21 14:39:18 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:18 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:18 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:18 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:18 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:18 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:18 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:18 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:18 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 19:39:19 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:19 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:19 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:19 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:19 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:19 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:19 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:19 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:19 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:19 -05:00 --- debug: Auth Library loaded
2026-06-21 19:39:22 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:22 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:22 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:22 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:22 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:22 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:22 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:22 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:22 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:22 -05:00 --- debug: Auth Library loaded
2026-06-21 14:39:22 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:22 -05:00 --- debug: Session Library initialized
2026-06-21 14:39:22 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:22 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:22 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:22 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:22 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:22 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:22 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:22 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:22 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:22 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 19:39:23 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:23 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:23 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:23 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:23 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:23 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:23 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:23 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:23 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:23 -05:00 --- debug: Auth Library loaded
2026-06-21 19:39:24 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:24 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:24 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:24 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:24 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:24 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:24 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:24 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:24 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:24 -05:00 --- debug: Auth Library loaded
2026-06-21 14:39:24 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:24 -05:00 --- debug: Session Library initialized
2026-06-21 14:39:24 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:24 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:24 -05:00 --- debug: Cache Library initialized
2026-06-21 19:39:27 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:27 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:27 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:27 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:27 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:27 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:27 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:27 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:27 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:27 -05:00 --- debug: Auth Library loaded
2026-06-21 14:39:27 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:27 -05:00 --- debug: Session Library initialized
2026-06-21 14:39:27 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:27 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:27 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:27 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:27 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:27 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:27 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:27 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:27 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:27 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 19:39:27 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:27 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:27 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:27 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:27 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:27 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:27 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:27 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:27 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:27 -05:00 --- debug: Auth Library loaded
2026-06-21 19:39:31 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:31 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:31 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:31 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:31 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:31 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:31 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:31 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:31 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:31 -05:00 --- debug: Auth Library loaded
2026-06-21 14:39:31 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:31 -05:00 --- debug: Session Library initialized
2026-06-21 14:39:31 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:31 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:31 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:31 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 19:39:31 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:31 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:31 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:31 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:31 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:31 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:31 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:31 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:31 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:31 -05:00 --- debug: Auth Library loaded
2026-06-21 19:38:52 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:38:52 +00:00 --- debug: Database Library initialized
2026-06-21 19:38:52 +00:00 --- debug: Cache Library initialized
2026-06-21 19:38:52 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:38:52 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:38:52 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:38:52 +00:00 --- debug: Session Library initialized
2026-06-21 14:38:52 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:52 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:52 -05:00 --- debug: Auth Library loaded
2026-06-21 14:38:52 -05:00 --- debug: Cache Library initialized
2026-06-21 14:38:52 -05:00 --- debug: Session Library initialized
2026-06-21 14:38:52 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:52 -05:00 --- debug: Database Library initialized
2026-06-21 14:38:52 -05:00 --- debug: Cache Library initialized
2026-06-21 14:38:52 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:38:52 -05:00 --- debug: Database Library initialized
2026-06-21 19:39:32 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:32 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:32 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:32 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:32 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:32 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:32 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:32 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:32 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:32 -05:00 --- debug: Auth Library loaded
2026-06-21 14:39:32 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:32 -05:00 --- debug: Session Library initialized
2026-06-21 14:39:32 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:32 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:32 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:39:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 19:39:33 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:33 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:33 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:33 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:33 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:33 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:33 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:33 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:33 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:33 -05:00 --- debug: Auth Library loaded
2026-06-21 19:39:01 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:01 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:01 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:01 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:01 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:01 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:01 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:01 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:01 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:01 -05:00 --- debug: Auth Library loaded
2026-06-21 14:39:01 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:01 -05:00 --- debug: Session Library initialized
2026-06-21 14:39:01 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:01 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:01 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:01 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:01 -05:00 --- debug: Database Library initialized
2026-06-21 19:39:05 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:05 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:05 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:05 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:05 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:05 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:05 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:05 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:05 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:05 -05:00 --- debug: Auth Library loaded
2026-06-21 14:39:05 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:05 -05:00 --- debug: Session Library initialized
2026-06-21 14:39:05 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:05 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:05 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:05 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:05 -05:00 --- debug: Database Library initialized
2026-06-21 19:39:08 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:39:08 +00:00 --- debug: Database Library initialized
2026-06-21 19:39:08 +00:00 --- debug: Cache Library initialized
2026-06-21 19:39:08 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:39:09 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:39:09 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:39:09 +00:00 --- debug: Session Library initialized
2026-06-21 14:39:09 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:09 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:09 -05:00 --- debug: Auth Library loaded
2026-06-21 14:39:09 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:09 -05:00 --- debug: Session Library initialized
2026-06-21 14:39:09 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:09 -05:00 --- debug: Database Library initialized
2026-06-21 14:39:09 -05:00 --- debug: Cache Library initialized
2026-06-21 14:39:09 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:39:09 -05:00 --- debug: Database Library initialized
2026-06-21 19:40:12 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:40:12 +00:00 --- debug: Database Library initialized
2026-06-21 19:40:12 +00:00 --- debug: Cache Library initialized
2026-06-21 19:40:12 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:40:12 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:40:12 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:40:12 +00:00 --- debug: Session Library initialized
2026-06-21 14:40:12 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:12 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:12 -05:00 --- debug: Auth Library loaded
2026-06-21 14:40:12 -05:00 --- debug: Cache Library initialized
2026-06-21 14:40:12 -05:00 --- debug: Session Library initialized
2026-06-21 14:40:12 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:12 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:12 -05:00 --- debug: Cache Library initialized
2026-06-21 14:40:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:13 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 19:40:13 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:40:13 +00:00 --- debug: Database Library initialized
2026-06-21 19:40:13 +00:00 --- debug: Cache Library initialized
2026-06-21 19:40:13 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:40:13 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:40:13 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:40:13 +00:00 --- debug: Session Library initialized
2026-06-21 14:40:13 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:13 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:13 -05:00 --- debug: Auth Library loaded
2026-06-21 19:40:16 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:40:16 +00:00 --- debug: Database Library initialized
2026-06-21 19:40:16 +00:00 --- debug: Cache Library initialized
2026-06-21 19:40:16 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:40:16 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:40:16 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:40:16 +00:00 --- debug: Session Library initialized
2026-06-21 14:40:16 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:16 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:16 -05:00 --- debug: Auth Library loaded
2026-06-21 14:40:16 -05:00 --- debug: Cache Library initialized
2026-06-21 14:40:16 -05:00 --- debug: Session Library initialized
2026-06-21 14:40:16 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:16 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:16 -05:00 --- debug: Cache Library initialized
2026-06-21 14:40:16 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:16 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:16 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:16 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:16 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:16 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:16 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 19:40:17 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:40:17 +00:00 --- debug: Database Library initialized
2026-06-21 19:40:17 +00:00 --- debug: Cache Library initialized
2026-06-21 19:40:17 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:40:17 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:40:17 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:40:17 +00:00 --- debug: Session Library initialized
2026-06-21 14:40:17 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:17 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:17 -05:00 --- debug: Auth Library loaded
2026-06-21 19:40:18 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:40:18 +00:00 --- debug: Database Library initialized
2026-06-21 19:40:18 +00:00 --- debug: Cache Library initialized
2026-06-21 19:40:18 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:40:18 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:40:18 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:40:18 +00:00 --- debug: Session Library initialized
2026-06-21 14:40:18 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:18 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:18 -05:00 --- debug: Auth Library loaded
2026-06-21 14:40:18 -05:00 --- debug: Cache Library initialized
2026-06-21 14:40:18 -05:00 --- debug: Session Library initialized
2026-06-21 14:40:18 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:18 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:18 -05:00 --- debug: Cache Library initialized
2026-06-21 14:40:18 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:18 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:18 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:18 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:18 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:18 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 19:40:19 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:40:19 +00:00 --- debug: Database Library initialized
2026-06-21 19:40:19 +00:00 --- debug: Cache Library initialized
2026-06-21 19:40:19 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:40:19 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:40:19 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:40:19 +00:00 --- debug: Session Library initialized
2026-06-21 14:40:19 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:19 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:19 -05:00 --- debug: Auth Library loaded
2026-06-21 19:40:20 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:40:20 +00:00 --- debug: Database Library initialized
2026-06-21 19:40:20 +00:00 --- debug: Cache Library initialized
2026-06-21 19:40:20 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:40:20 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:40:20 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:40:21 +00:00 --- debug: Session Library initialized
2026-06-21 14:40:21 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:21 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:21 -05:00 --- debug: Auth Library loaded
2026-06-21 14:40:21 -05:00 --- debug: Cache Library initialized
2026-06-21 14:40:21 -05:00 --- debug: Session Library initialized
2026-06-21 14:40:21 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:21 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:21 -05:00 --- debug: Cache Library initialized
2026-06-21 14:40:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:21 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 19:40:21 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:40:21 +00:00 --- debug: Database Library initialized
2026-06-21 19:40:21 +00:00 --- debug: Cache Library initialized
2026-06-21 19:40:21 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:40:21 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:40:21 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:40:21 +00:00 --- debug: Session Library initialized
2026-06-21 14:40:21 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:21 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:21 -05:00 --- debug: Auth Library loaded
2026-06-21 19:40:23 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:40:23 +00:00 --- debug: Database Library initialized
2026-06-21 19:40:23 +00:00 --- debug: Cache Library initialized
2026-06-21 19:40:23 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:40:23 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:40:23 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:40:23 +00:00 --- debug: Session Library initialized
2026-06-21 14:40:23 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:23 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:23 -05:00 --- debug: Auth Library loaded
2026-06-21 14:40:23 -05:00 --- debug: Cache Library initialized
2026-06-21 14:40:23 -05:00 --- debug: Session Library initialized
2026-06-21 14:40:23 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:23 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:23 -05:00 --- debug: Cache Library initialized
2026-06-21 19:40:25 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:40:25 +00:00 --- debug: Database Library initialized
2026-06-21 19:40:25 +00:00 --- debug: Cache Library initialized
2026-06-21 19:40:25 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:40:25 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:40:25 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:40:25 +00:00 --- debug: Session Library initialized
2026-06-21 14:40:25 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:25 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:25 -05:00 --- debug: Auth Library loaded
2026-06-21 14:40:25 -05:00 --- debug: Cache Library initialized
2026-06-21 14:40:25 -05:00 --- debug: Session Library initialized
2026-06-21 14:40:25 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:25 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:25 -05:00 --- debug: Cache Library initialized
2026-06-21 14:40:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:25 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 19:40:26 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:40:26 +00:00 --- debug: Database Library initialized
2026-06-21 19:40:26 +00:00 --- debug: Cache Library initialized
2026-06-21 19:40:26 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:40:26 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:40:26 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:40:26 +00:00 --- debug: Session Library initialized
2026-06-21 14:40:26 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:26 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:26 -05:00 --- debug: Auth Library loaded
2026-06-21 19:40:28 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:40:28 +00:00 --- debug: Database Library initialized
2026-06-21 19:40:28 +00:00 --- debug: Cache Library initialized
2026-06-21 19:40:28 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:40:28 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:40:28 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:40:28 +00:00 --- debug: Session Library initialized
2026-06-21 14:40:28 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:28 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:28 -05:00 --- debug: Auth Library loaded
2026-06-21 14:40:28 -05:00 --- debug: Cache Library initialized
2026-06-21 14:40:28 -05:00 --- debug: Session Library initialized
2026-06-21 14:40:28 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:28 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:28 -05:00 --- debug: Cache Library initialized
2026-06-21 14:40:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:29 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 19:40:29 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:40:29 +00:00 --- debug: Database Library initialized
2026-06-21 19:40:29 +00:00 --- debug: Cache Library initialized
2026-06-21 19:40:29 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:40:29 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:40:29 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:40:29 +00:00 --- debug: Session Library initialized
2026-06-21 14:40:29 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:29 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:29 -05:00 --- debug: Auth Library loaded
2026-06-21 19:40:31 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:40:31 +00:00 --- debug: Database Library initialized
2026-06-21 19:40:31 +00:00 --- debug: Cache Library initialized
2026-06-21 19:40:31 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:40:31 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:40:31 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:40:31 +00:00 --- debug: Session Library initialized
2026-06-21 14:40:31 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:31 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:31 -05:00 --- debug: Auth Library loaded
2026-06-21 14:40:31 -05:00 --- debug: Cache Library initialized
2026-06-21 14:40:31 -05:00 --- debug: Session Library initialized
2026-06-21 14:40:31 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:31 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:31 -05:00 --- debug: Cache Library initialized
2026-06-21 14:40:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:40:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 19:40:32 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:40:32 +00:00 --- debug: Database Library initialized
2026-06-21 19:40:32 +00:00 --- debug: Cache Library initialized
2026-06-21 19:40:32 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:40:32 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:40:32 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:40:32 +00:00 --- debug: Session Library initialized
2026-06-21 14:40:32 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:40:32 -05:00 --- debug: Database Library initialized
2026-06-21 14:40:32 -05:00 --- debug: Auth Library loaded
2026-06-21 19:41:01 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:41:01 +00:00 --- debug: Database Library initialized
2026-06-21 19:41:01 +00:00 --- debug: Cache Library initialized
2026-06-21 19:41:01 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:41:01 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:41:01 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:41:02 +00:00 --- debug: Session garbage collected: 4 row(s) deleted.
2026-06-21 19:41:02 +00:00 --- debug: Session Library initialized
2026-06-21 14:41:02 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:02 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:02 -05:00 --- debug: Auth Library loaded
2026-06-21 14:41:02 -05:00 --- debug: Cache Library initialized
2026-06-21 14:41:02 -05:00 --- debug: Session Library initialized
2026-06-21 14:41:02 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:02 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:02 -05:00 --- debug: Cache Library initialized
2026-06-21 14:41:02 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:02 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:02 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:02 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:02 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:02 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:02 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 19:41:02 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:41:02 +00:00 --- debug: Database Library initialized
2026-06-21 19:41:02 +00:00 --- debug: Cache Library initialized
2026-06-21 19:41:02 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:41:02 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:41:02 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:41:02 +00:00 --- debug: Session Library initialized
2026-06-21 14:41:02 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:02 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:02 -05:00 --- debug: Auth Library loaded
2026-06-21 19:41:33 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:41:33 +00:00 --- debug: Database Library initialized
2026-06-21 19:41:33 +00:00 --- debug: Cache Library initialized
2026-06-21 19:41:33 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:41:33 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:41:33 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:41:33 +00:00 --- debug: Session Library initialized
2026-06-21 14:41:33 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:33 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:33 -05:00 --- debug: Auth Library loaded
2026-06-21 14:41:33 -05:00 --- debug: Cache Library initialized
2026-06-21 14:41:33 -05:00 --- debug: Session Library initialized
2026-06-21 14:41:33 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:33 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:33 -05:00 --- debug: Cache Library initialized
2026-06-21 14:41:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 19:41:34 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:41:34 +00:00 --- debug: Database Library initialized
2026-06-21 19:41:34 +00:00 --- debug: Cache Library initialized
2026-06-21 19:41:34 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:41:34 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:41:34 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:41:34 +00:00 --- debug: Session Library initialized
2026-06-21 14:41:34 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:34 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:34 -05:00 --- debug: Auth Library loaded
2026-06-21 19:41:35 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:41:35 +00:00 --- debug: Database Library initialized
2026-06-21 19:41:35 +00:00 --- debug: Cache Library initialized
2026-06-21 19:41:35 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:41:35 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:41:35 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:41:35 +00:00 --- debug: Session Library initialized
2026-06-21 14:41:35 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:35 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:35 -05:00 --- debug: Auth Library loaded
2026-06-21 14:41:35 -05:00 --- debug: Cache Library initialized
2026-06-21 14:41:35 -05:00 --- debug: Session Library initialized
2026-06-21 14:41:35 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:35 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:35 -05:00 --- debug: Cache Library initialized
2026-06-21 14:41:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:35 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 19:41:36 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:41:36 +00:00 --- debug: Database Library initialized
2026-06-21 19:41:36 +00:00 --- debug: Cache Library initialized
2026-06-21 19:41:36 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:41:36 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:41:36 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:41:36 +00:00 --- debug: Session Library initialized
2026-06-21 14:41:36 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:36 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:36 -05:00 --- debug: Auth Library loaded
2026-06-21 19:41:38 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:41:38 +00:00 --- debug: Database Library initialized
2026-06-21 19:41:38 +00:00 --- debug: Cache Library initialized
2026-06-21 19:41:38 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:41:38 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:41:38 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:41:38 +00:00 --- debug: Session Library initialized
2026-06-21 14:41:38 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:38 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:38 -05:00 --- debug: Auth Library loaded
2026-06-21 14:41:38 -05:00 --- debug: Cache Library initialized
2026-06-21 14:41:38 -05:00 --- debug: Session Library initialized
2026-06-21 14:41:38 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:38 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:38 -05:00 --- debug: Cache Library initialized
2026-06-21 14:41:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 19:41:38 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:41:38 +00:00 --- debug: Database Library initialized
2026-06-21 19:41:38 +00:00 --- debug: Cache Library initialized
2026-06-21 19:41:38 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:41:38 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:41:38 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:41:38 +00:00 --- debug: Session Library initialized
2026-06-21 14:41:38 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:38 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:38 -05:00 --- debug: Auth Library loaded
2026-06-21 19:41:41 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:41:41 +00:00 --- debug: Database Library initialized
2026-06-21 19:41:41 +00:00 --- debug: Cache Library initialized
2026-06-21 19:41:41 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:41:41 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:41:41 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:41:41 +00:00 --- debug: Session Library initialized
2026-06-21 14:41:41 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:41 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:41 -05:00 --- debug: Auth Library loaded
2026-06-21 14:41:41 -05:00 --- debug: Cache Library initialized
2026-06-21 14:41:41 -05:00 --- debug: Session Library initialized
2026-06-21 14:41:41 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:41 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:41 -05:00 --- debug: Cache Library initialized
2026-06-21 14:41:42 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:42 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:42 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:42 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:42 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:42 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:42 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 19:41:42 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:41:42 +00:00 --- debug: Database Library initialized
2026-06-21 19:41:42 +00:00 --- debug: Cache Library initialized
2026-06-21 19:41:42 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:41:42 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:41:42 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:41:42 +00:00 --- debug: Session Library initialized
2026-06-21 14:41:42 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:42 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:42 -05:00 --- debug: Auth Library loaded
2026-06-21 19:41:43 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:41:43 +00:00 --- debug: Database Library initialized
2026-06-21 19:41:43 +00:00 --- debug: Cache Library initialized
2026-06-21 19:41:43 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:41:43 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:41:43 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:41:43 +00:00 --- debug: Session Library initialized
2026-06-21 14:41:43 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:43 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:43 -05:00 --- debug: Auth Library loaded
2026-06-21 14:41:43 -05:00 --- debug: Cache Library initialized
2026-06-21 14:41:43 -05:00 --- debug: Session Library initialized
2026-06-21 14:41:43 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:43 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:43 -05:00 --- debug: Cache Library initialized
2026-06-21 19:41:45 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:41:45 +00:00 --- debug: Database Library initialized
2026-06-21 19:41:45 +00:00 --- debug: Cache Library initialized
2026-06-21 19:41:45 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:41:45 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:41:45 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:41:45 +00:00 --- debug: Session Library initialized
2026-06-21 14:41:45 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:45 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:45 -05:00 --- debug: Auth Library loaded
2026-06-21 14:41:45 -05:00 --- debug: Cache Library initialized
2026-06-21 14:41:45 -05:00 --- debug: Session Library initialized
2026-06-21 14:41:45 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:45 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:45 -05:00 --- debug: Cache Library initialized
2026-06-21 14:41:46 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:46 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:46 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:46 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:46 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:46 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:46 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 19:41:46 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:41:46 +00:00 --- debug: Database Library initialized
2026-06-21 19:41:46 +00:00 --- debug: Cache Library initialized
2026-06-21 19:41:46 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:41:46 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:41:46 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:41:46 +00:00 --- debug: Session Library initialized
2026-06-21 14:41:46 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:46 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:46 -05:00 --- debug: Auth Library loaded
2026-06-21 19:41:47 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:41:47 +00:00 --- debug: Database Library initialized
2026-06-21 19:41:47 +00:00 --- debug: Cache Library initialized
2026-06-21 19:41:47 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:41:47 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:41:47 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:41:47 +00:00 --- debug: Session Library initialized
2026-06-21 14:41:47 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:47 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:47 -05:00 --- debug: Auth Library loaded
2026-06-21 14:41:47 -05:00 --- debug: Cache Library initialized
2026-06-21 14:41:47 -05:00 --- debug: Session Library initialized
2026-06-21 14:41:47 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:47 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:47 -05:00 --- debug: Cache Library initialized
2026-06-21 14:41:47 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:47 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:47 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:47 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:47 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:47 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 19:41:48 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:41:48 +00:00 --- debug: Database Library initialized
2026-06-21 19:41:48 +00:00 --- debug: Cache Library initialized
2026-06-21 19:41:48 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:41:48 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:41:48 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:41:48 +00:00 --- debug: Session Library initialized
2026-06-21 14:41:48 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:48 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:48 -05:00 --- debug: Auth Library loaded
2026-06-21 19:41:48 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:41:48 +00:00 --- debug: Database Library initialized
2026-06-21 19:41:48 +00:00 --- debug: Cache Library initialized
2026-06-21 19:41:48 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:41:48 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:41:48 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:41:48 +00:00 --- debug: Session Library initialized
2026-06-21 14:41:48 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:48 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:48 -05:00 --- debug: Auth Library loaded
2026-06-21 14:41:48 -05:00 --- debug: Cache Library initialized
2026-06-21 14:41:48 -05:00 --- debug: Session Library initialized
2026-06-21 14:41:48 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:48 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:48 -05:00 --- debug: Cache Library initialized
2026-06-21 14:41:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:41:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 19:41:49 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:41:49 +00:00 --- debug: Database Library initialized
2026-06-21 19:41:49 +00:00 --- debug: Cache Library initialized
2026-06-21 19:41:49 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:41:49 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:41:49 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:41:49 +00:00 --- debug: Session Library initialized
2026-06-21 14:41:49 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:41:49 -05:00 --- debug: Database Library initialized
2026-06-21 14:41:49 -05:00 --- debug: Auth Library loaded
2026-06-21 19:47:47 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:47:47 +00:00 --- debug: Database Library initialized
2026-06-21 19:47:47 +00:00 --- debug: Cache Library initialized
2026-06-21 19:47:47 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:47:47 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:47:47 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:47:47 +00:00 --- debug: Session Library initialized
2026-06-21 14:47:47 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:47:47 -05:00 --- debug: Database Library initialized
2026-06-21 14:47:47 -05:00 --- debug: Auth Library loaded
2026-06-21 14:47:47 -05:00 --- debug: Cache Library initialized
2026-06-21 14:47:47 -05:00 --- debug: Session Library initialized
2026-06-21 14:47:47 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:47:47 -05:00 --- debug: Database Library initialized
2026-06-21 14:47:47 -05:00 --- debug: Cache Library initialized
2026-06-21 14:47:47 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:47:47 -05:00 --- debug: Database Library initialized
2026-06-21 14:47:47 -05:00 --- debug: :::::MMM  get_number_reports_by_date (models incident)
2026-06-21 14:47:47 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:47:47 -05:00 --- debug: Database Library initialized
2026-06-21 14:47:47 -05:00 --- debug: ::::::::: MMMM MOSTRAR EL VALOR DEL USER_ID
2026-06-21 14:47:47 -05:00 --- debug: 
2026-06-21 14:47:47 -05:00 --- debug: ADMIN
2026-06-21 14:47:47 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:47:47 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:47:47 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:47:47 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:47:47 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:47:47 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 19:47:47 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:47:47 +00:00 --- debug: Database Library initialized
2026-06-21 19:47:47 +00:00 --- debug: Cache Library initialized
2026-06-21 19:47:47 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:47:47 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:47:47 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:47:47 +00:00 --- debug: Session Library initialized
2026-06-21 14:47:47 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:47:47 -05:00 --- debug: Database Library initialized
2026-06-21 14:47:47 -05:00 --- debug: Auth Library loaded
2026-06-21 19:47:49 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:47:49 +00:00 --- debug: Database Library initialized
2026-06-21 19:47:49 +00:00 --- debug: Cache Library initialized
2026-06-21 19:47:49 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:47:49 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:47:49 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:47:49 +00:00 --- debug: Session Library initialized
2026-06-21 14:47:49 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:47:49 -05:00 --- debug: Database Library initialized
2026-06-21 14:47:49 -05:00 --- debug: Auth Library loaded
2026-06-21 14:47:49 -05:00 --- debug: Cache Library initialized
2026-06-21 14:47:49 -05:00 --- debug: Session Library initialized
2026-06-21 14:47:49 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:47:49 -05:00 --- debug: Database Library initialized
2026-06-21 14:47:49 -05:00 --- debug: Cache Library initialized
2026-06-21 14:47:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:47:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:47:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:47:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:47:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:47:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:47:49 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 19:47:49 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:47:49 +00:00 --- debug: Database Library initialized
2026-06-21 19:47:49 +00:00 --- debug: Cache Library initialized
2026-06-21 19:47:49 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:47:49 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:47:49 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:47:49 +00:00 --- debug: Session Library initialized
2026-06-21 14:47:49 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:47:49 -05:00 --- debug: Database Library initialized
2026-06-21 14:47:49 -05:00 --- debug: Auth Library loaded
2026-06-21 19:47:47 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:47:47 +00:00 --- debug: Database Library initialized
2026-06-21 19:47:47 +00:00 --- debug: Cache Library initialized
2026-06-21 19:47:47 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:47:47 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:47:47 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:47:47 +00:00 --- debug: Session Library initialized
2026-06-21 14:47:47 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:47:47 -05:00 --- debug: Database Library initialized
2026-06-21 14:47:47 -05:00 --- debug: Auth Library loaded
2026-06-21 14:47:47 -05:00 --- debug: Cache Library initialized
2026-06-21 14:47:47 -05:00 --- debug: Session Library initialized
2026-06-21 14:47:47 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:47:47 -05:00 --- debug: Database Library initialized
2026-06-21 14:47:47 -05:00 --- debug: Cache Library initialized
2026-06-21 14:47:47 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:47:47 -05:00 --- debug: Database Library initialized
2026-06-21 19:49:40 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:49:40 +00:00 --- debug: Database Library initialized
2026-06-21 19:49:40 +00:00 --- debug: Cache Library initialized
2026-06-21 19:49:40 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:49:40 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:49:40 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:49:40 +00:00 --- debug: Session Library initialized
2026-06-21 14:49:40 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:49:40 -05:00 --- debug: Database Library initialized
2026-06-21 14:49:40 -05:00 --- debug: Auth Library loaded
2026-06-21 14:49:40 -05:00 --- debug: Cache Library initialized
2026-06-21 14:49:40 -05:00 --- debug: Session Library initialized
2026-06-21 14:49:40 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:49:40 -05:00 --- debug: Database Library initialized
2026-06-21 14:49:40 -05:00 --- debug: Cache Library initialized
2026-06-21 14:49:40 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:49:40 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:49:40 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:49:40 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:49:40 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:49:40 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:49:40 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 19:49:41 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:49:41 +00:00 --- debug: Database Library initialized
2026-06-21 19:49:41 +00:00 --- debug: Cache Library initialized
2026-06-21 19:49:41 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:49:41 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:49:41 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:49:41 +00:00 --- debug: Session Library initialized
2026-06-21 14:49:41 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:49:41 -05:00 --- debug: Database Library initialized
2026-06-21 14:49:41 -05:00 --- debug: Auth Library loaded
2026-06-21 19:56:52 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:56:52 +00:00 --- debug: Database Library initialized
2026-06-21 19:56:52 +00:00 --- debug: Cache Library initialized
2026-06-21 19:56:52 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:56:52 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:56:52 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:56:52 +00:00 --- debug: Session Library initialized
2026-06-21 14:56:52 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:56:52 -05:00 --- debug: Database Library initialized
2026-06-21 14:56:52 -05:00 --- debug: Auth Library loaded
2026-06-21 14:56:52 -05:00 --- debug: Cache Library initialized
2026-06-21 14:56:52 -05:00 --- debug: Session Library initialized
2026-06-21 14:56:52 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:56:52 -05:00 --- debug: Database Library initialized
2026-06-21 14:56:52 -05:00 --- debug: Cache Library initialized
2026-06-21 14:56:52 -05:00 --- debug: :::::MMM  get_oldest_report_timestamp (models incident)
2026-06-21 14:56:52 -05:00 --- debug: :::::MMM  get_latest_report_timestamp (models incident)
2026-06-21 14:56:52 -05:00 --- alert: admin::permissions() in deprecated and replaced by Auth::has_permission()
2026-06-21 14:56:52 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-21 14:56:52 -05:00 --- debug: :::::MMM   Count query   (models incident)
2026-06-21 14:56:52 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-21 14:56:52 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE 1=1 ORDER BY i.incident_date DESC 
2026-06-21 14:56:52 -05:00 --- debug: Pagination Library initialized
2026-06-21 14:56:52 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-21 14:56:52 -05:00 --- debug: :::::MMM  Normal query       (models incident)
2026-06-21 14:56:52 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-21 14:56:52 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE 1=1 ORDER BY i.incident_date DESC LIMIT 0, 50
2026-06-21 14:56:52 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:56:52 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:56:52 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:56:52 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:56:52 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:56:52 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:56:52 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:56:52 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:56:52 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:56:52 -05:00 --- debug: Database Library initialized
2026-06-21 14:56:52 -05:00 --- debug: :::::::::::::::: count
2026-06-21 14:56:52 -05:00 --- debug: 
2026-06-21 14:56:52 -05:00 --- debug: :::::::::::::::: CONSULTA SQL EN EL ELSE
2026-06-21 14:56:52 -05:00 --- debug: SELECT c.id, c.parent_id, c.category_title, c.category_color, c.category_image, c.category_image_thumb FROM category c LEFT JOIN category c_parent ON (c.parent_id = c_parent.id) WHERE 1=1 ORDER BY c.category_position ASC
2026-06-21 14:56:52 -05:00 --- info: Missing i18n entry ui_main.web for language en_US
2026-06-21 14:56:52 -05:00 --- info: Missing i18n entry ui_main.keywords for language en_US
2026-06-21 14:56:52 -05:00 --- info: Missing i18n entry reports.documento for language en_US
2026-06-21 19:56:52 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:56:52 +00:00 --- debug: Database Library initialized
2026-06-21 19:56:52 +00:00 --- debug: Cache Library initialized
2026-06-21 19:56:52 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:56:52 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:56:52 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:56:52 +00:00 --- debug: Session Library initialized
2026-06-21 14:56:52 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:56:52 -05:00 --- debug: Database Library initialized
2026-06-21 14:56:52 -05:00 --- debug: Auth Library loaded
2026-06-21 19:56:58 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:56:58 +00:00 --- debug: Database Library initialized
2026-06-21 19:56:58 +00:00 --- debug: Cache Library initialized
2026-06-21 19:56:58 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:56:58 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:56:58 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:56:58 +00:00 --- debug: Session Library initialized
2026-06-21 14:56:58 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:56:58 -05:00 --- debug: Database Library initialized
2026-06-21 14:56:58 -05:00 --- debug: Auth Library loaded
2026-06-21 14:56:58 -05:00 --- debug: Cache Library initialized
2026-06-21 14:56:58 -05:00 --- debug: Session Library initialized
2026-06-21 14:56:58 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:56:58 -05:00 --- debug: Database Library initialized
2026-06-21 14:56:58 -05:00 --- debug: Cache Library initialized
2026-06-21 14:56:58 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:56:58 -05:00 --- debug: Database Library initialized
2026-06-21 14:56:58 -05:00 --- debug: :::::MMM  is_valid_incident (models incident)
2026-06-21 14:56:58 -05:00 --- debug: :::::::::. HELPER (get_custom_form_fields) CUSTOMFORMS  ::
2026-06-21 14:56:58 -05:00 --- debug: :::::MMM  is_valid_incident (models incident)
2026-06-21 14:56:58 -05:00 --- debug: :::::MMM  is_valid_incident (models incident)
2026-06-21 14:56:58 -05:00 --- debug: :::::MMM  is_valid_incident (models incident)
2026-06-21 14:56:58 -05:00 --- debug: :::::::::. HELPER (get_custom_form_fields) CUSTOMFORMS  ::
2026-06-21 14:56:58 -05:00 --- debug: :::::MMM  is_valid_incident (models incident)
2026-06-21 14:56:58 -05:00 --- debug: :::::::::. HELPER (get_custom_form_fields) CUSTOMFORMS  ::
2026-06-21 14:56:58 -05:00 --- debug: :::::MMM  is_valid_incident (models incident)
2026-06-21 14:56:58 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:56:58 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:56:58 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:56:58 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:56:58 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:56:58 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:56:58 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:56:58 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:56:58 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 14:56:58 -05:00 --- info: Missing i18n entry ui_main.allowed_tags for language en_US
2026-06-21 14:56:58 -05:00 --- info: Missing i18n entry ui_main.allowed_iframes for language en_US
2026-06-21 14:56:58 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:56:58 -05:00 --- debug: Database Library initialized
2026-06-21 14:56:58 -05:00 --- debug: :::::::::::::::: count
2026-06-21 14:56:58 -05:00 --- debug: 
2026-06-21 14:56:58 -05:00 --- debug: :::::::::::::::: CONSULTA SQL EN EL ELSE
2026-06-21 14:56:58 -05:00 --- debug: SELECT c.id, c.parent_id, c.category_title, c.category_color, c.category_image, c.category_image_thumb FROM category c LEFT JOIN category c_parent ON (c.parent_id = c_parent.id) WHERE 1=1 ORDER BY c.category_position ASC
2026-06-21 14:56:58 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:56:58 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:56:58 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:56:58 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:56:58 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:56:58 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:56:58 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:56:58 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:56:58 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:56:58 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:56:58 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:56:58 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:56:58 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:56:58 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 14:56:58 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 14:56:58 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 14:56:58 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 14:56:58 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 19:56:59 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 19:56:59 +00:00 --- debug: Database Library initialized
2026-06-21 19:56:59 +00:00 --- debug: Cache Library initialized
2026-06-21 19:56:59 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 19:56:59 +00:00 --- debug: Encrypt Library initialized
2026-06-21 19:56:59 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 19:56:59 +00:00 --- debug: Session Library initialized
2026-06-21 14:56:59 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 14:56:59 -05:00 --- debug: Database Library initialized
2026-06-21 14:56:59 -05:00 --- debug: Auth Library loaded
2026-06-21 20:14:13 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:14:13 +00:00 --- debug: Database Library initialized
2026-06-21 20:14:13 +00:00 --- debug: Cache Library initialized
2026-06-21 20:14:13 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:14:13 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:14:13 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:14:13 +00:00 --- debug: Session Library initialized
2026-06-21 15:14:13 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:14:13 -05:00 --- debug: Database Library initialized
2026-06-21 15:14:13 -05:00 --- debug: Auth Library loaded
2026-06-21 15:14:13 -05:00 --- debug: Cache Library initialized
2026-06-21 15:14:13 -05:00 --- debug: Session Library initialized
2026-06-21 15:14:13 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:14:13 -05:00 --- debug: Database Library initialized
2026-06-21 15:14:13 -05:00 --- debug: Cache Library initialized
2026-06-21 15:14:13 -05:00 --- debug: :::::MMM  get_oldest_report_timestamp (models incident)
2026-06-21 15:14:13 -05:00 --- debug: :::::MMM  get_latest_report_timestamp (models incident)
2026-06-21 15:14:13 -05:00 --- alert: admin::permissions() in deprecated and replaced by Auth::has_permission()
2026-06-21 15:14:13 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-21 15:14:13 -05:00 --- debug: :::::MMM   Count query   (models incident)
2026-06-21 15:14:13 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-21 15:14:13 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE 1=1 ORDER BY i.incident_date DESC 
2026-06-21 15:14:13 -05:00 --- debug: Pagination Library initialized
2026-06-21 15:14:13 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-21 15:14:13 -05:00 --- debug: :::::MMM  Normal query       (models incident)
2026-06-21 15:14:13 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-21 15:14:13 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE 1=1 ORDER BY i.incident_date DESC LIMIT 0, 50
2026-06-21 15:14:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:14:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:14:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:14:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:14:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:14:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:14:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:14:13 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:14:13 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:14:13 -05:00 --- debug: Database Library initialized
2026-06-21 15:14:13 -05:00 --- debug: :::::::::::::::: count
2026-06-21 15:14:13 -05:00 --- debug: 
2026-06-21 15:14:13 -05:00 --- debug: :::::::::::::::: CONSULTA SQL EN EL ELSE
2026-06-21 15:14:13 -05:00 --- debug: SELECT c.id, c.parent_id, c.category_title, c.category_color, c.category_image, c.category_image_thumb FROM category c LEFT JOIN category c_parent ON (c.parent_id = c_parent.id) WHERE 1=1 ORDER BY c.category_position ASC
2026-06-21 15:14:13 -05:00 --- info: Missing i18n entry ui_main.web for language en_US
2026-06-21 15:14:13 -05:00 --- info: Missing i18n entry ui_main.keywords for language en_US
2026-06-21 15:14:13 -05:00 --- info: Missing i18n entry reports.documento for language en_US
2026-06-21 20:14:15 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:14:15 +00:00 --- debug: Database Library initialized
2026-06-21 20:14:15 +00:00 --- debug: Cache Library initialized
2026-06-21 20:14:15 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:14:15 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:14:15 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:14:15 +00:00 --- debug: Session Library initialized
2026-06-21 15:14:15 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:14:15 -05:00 --- debug: Database Library initialized
2026-06-21 15:14:15 -05:00 --- debug: Auth Library loaded
2026-06-21 15:14:15 -05:00 --- debug: Cache Library initialized
2026-06-21 15:14:15 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:14:15 -05:00 --- debug: Database Library initialized
2026-06-21 20:24:03 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:24:03 +00:00 --- debug: Database Library initialized
2026-06-21 20:24:03 +00:00 --- debug: Cache Library initialized
2026-06-21 20:24:03 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:24:03 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:24:03 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:24:03 +00:00 --- debug: Session Library initialized
2026-06-21 15:24:03 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:24:03 -05:00 --- debug: Database Library initialized
2026-06-21 15:24:03 -05:00 --- debug: Auth Library loaded
2026-06-21 15:24:03 -05:00 --- debug: Cache Library initialized
2026-06-21 15:24:03 -05:00 --- debug: Session Library initialized
2026-06-21 15:24:03 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:24:03 -05:00 --- debug: Database Library initialized
2026-06-21 15:24:03 -05:00 --- debug: Cache Library initialized
2026-06-21 15:24:03 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:24:03 -05:00 --- debug: Database Library initialized
2026-06-21 15:24:03 -05:00 --- debug: :::::MMM  is_valid_incident (models incident)
2026-06-21 15:24:03 -05:00 --- debug: :::::::::. HELPER (get_custom_form_fields) CUSTOMFORMS  ::
2026-06-21 15:24:03 -05:00 --- debug: :::::MMM  is_valid_incident (models incident)
2026-06-21 15:24:03 -05:00 --- debug: :::::MMM  is_valid_incident (models incident)
2026-06-21 15:24:03 -05:00 --- debug: :::::MMM  is_valid_incident (models incident)
2026-06-21 15:24:03 -05:00 --- debug: :::::::::. HELPER (get_custom_form_fields) CUSTOMFORMS  ::
2026-06-21 15:24:03 -05:00 --- debug: :::::MMM  is_valid_incident (models incident)
2026-06-21 15:24:03 -05:00 --- debug: :::::::::. HELPER (get_custom_form_fields) CUSTOMFORMS  ::
2026-06-21 15:24:03 -05:00 --- debug: :::::MMM  is_valid_incident (models incident)
2026-06-21 15:24:03 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:24:03 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:24:03 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:24:03 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:24:03 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:24:03 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:24:03 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:24:03 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:24:03 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:24:03 -05:00 --- info: Missing i18n entry ui_main.allowed_tags for language en_US
2026-06-21 15:24:03 -05:00 --- info: Missing i18n entry ui_main.allowed_iframes for language en_US
2026-06-21 15:24:03 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:24:03 -05:00 --- debug: Database Library initialized
2026-06-21 15:24:03 -05:00 --- debug: :::::::::::::::: count
2026-06-21 15:24:03 -05:00 --- debug: 
2026-06-21 15:24:03 -05:00 --- debug: :::::::::::::::: CONSULTA SQL EN EL ELSE
2026-06-21 15:24:03 -05:00 --- debug: SELECT c.id, c.parent_id, c.category_title, c.category_color, c.category_image, c.category_image_thumb FROM category c LEFT JOIN category c_parent ON (c.parent_id = c_parent.id) WHERE 1=1 ORDER BY c.category_position ASC
2026-06-21 15:24:03 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 15:24:03 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 15:24:03 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 15:24:03 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 15:24:03 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 15:24:03 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 15:24:03 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 15:24:03 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 15:24:03 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 15:24:03 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 15:24:03 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 15:24:03 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 15:24:03 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 15:24:03 -05:00 --- debug: YA ENTRE EN EL TIPO 1 ::
2026-06-21 15:24:03 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 15:24:03 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 15:24:03 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 15:24:03 -05:00 --- debug: YA ENTRE EN EL TIPO 2 ::
2026-06-21 20:24:03 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:24:03 +00:00 --- debug: Database Library initialized
2026-06-21 20:24:03 +00:00 --- debug: Cache Library initialized
2026-06-21 20:24:03 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:24:03 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:24:03 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:24:03 +00:00 --- debug: Session Library initialized
2026-06-21 15:24:03 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:24:03 -05:00 --- debug: Database Library initialized
2026-06-21 15:24:03 -05:00 --- debug: Auth Library loaded
2026-06-21 20:30:27 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:30:27 +00:00 --- debug: Database Library initialized
2026-06-21 20:30:27 +00:00 --- debug: Cache Library initialized
2026-06-21 20:30:27 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:30:27 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:30:27 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:30:27 +00:00 --- debug: Session Library initialized
2026-06-21 15:30:27 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:30:27 -05:00 --- debug: Database Library initialized
2026-06-21 15:30:27 -05:00 --- debug: Auth Library loaded
2026-06-21 15:30:27 -05:00 --- debug: Cache Library initialized
2026-06-21 15:30:27 -05:00 --- debug: Session Library initialized
2026-06-21 15:30:27 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:30:27 -05:00 --- debug: Database Library initialized
2026-06-21 15:30:27 -05:00 --- debug: Cache Library initialized
2026-06-21 15:30:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:28 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 20:30:28 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:30:28 +00:00 --- debug: Database Library initialized
2026-06-21 20:30:28 +00:00 --- debug: Cache Library initialized
2026-06-21 20:30:28 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:30:28 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:30:28 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:30:28 +00:00 --- debug: Session Library initialized
2026-06-21 15:30:28 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:30:28 -05:00 --- debug: Database Library initialized
2026-06-21 15:30:28 -05:00 --- debug: Auth Library loaded
2026-06-21 15:30:28 -05:00 --- debug: Cache Library initialized
2026-06-21 15:30:28 -05:00 --- debug: Session Library initialized
2026-06-21 15:30:28 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:30:28 -05:00 --- debug: Database Library initialized
2026-06-21 15:30:28 -05:00 --- debug: Cache Library initialized
2026-06-21 15:30:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:30:29 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:30:29 +00:00 --- debug: Database Library initialized
2026-06-21 20:30:29 +00:00 --- debug: Cache Library initialized
2026-06-21 20:30:29 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:30:29 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:30:29 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:30:29 +00:00 --- debug: Session Library initialized
2026-06-21 15:30:29 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:30:29 -05:00 --- debug: Database Library initialized
2026-06-21 15:30:29 -05:00 --- debug: Auth Library loaded
2026-06-21 20:30:29 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:30:29 +00:00 --- debug: Database Library initialized
2026-06-21 20:30:29 +00:00 --- debug: Cache Library initialized
2026-06-21 20:30:29 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:30:29 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:30:29 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:30:29 +00:00 --- debug: Session Library initialized
2026-06-21 15:30:29 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:30:29 -05:00 --- debug: Database Library initialized
2026-06-21 15:30:29 -05:00 --- debug: Auth Library loaded
2026-06-21 15:30:29 -05:00 --- debug: Cache Library initialized
2026-06-21 15:30:29 -05:00 --- debug: Session Library initialized
2026-06-21 15:30:29 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:30:29 -05:00 --- debug: Database Library initialized
2026-06-21 15:30:29 -05:00 --- debug: Cache Library initialized
2026-06-21 15:30:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:29 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 20:30:30 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:30:30 +00:00 --- debug: Database Library initialized
2026-06-21 20:30:30 +00:00 --- debug: Cache Library initialized
2026-06-21 20:30:30 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:30:30 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:30:30 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:30:30 +00:00 --- debug: Session Library initialized
2026-06-21 15:30:30 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:30:30 -05:00 --- debug: Database Library initialized
2026-06-21 15:30:30 -05:00 --- debug: Auth Library loaded
2026-06-21 20:30:31 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:30:31 +00:00 --- debug: Database Library initialized
2026-06-21 20:30:31 +00:00 --- debug: Cache Library initialized
2026-06-21 20:30:31 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:30:31 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:30:31 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:30:31 +00:00 --- debug: Session Library initialized
2026-06-21 15:30:31 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:30:31 -05:00 --- debug: Database Library initialized
2026-06-21 15:30:31 -05:00 --- debug: Auth Library loaded
2026-06-21 20:30:31 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:30:31 +00:00 --- debug: Database Library initialized
2026-06-21 20:30:31 +00:00 --- debug: Cache Library initialized
2026-06-21 20:30:31 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:30:31 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:30:31 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:30:31 +00:00 --- debug: Session Library initialized
2026-06-21 15:30:31 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:30:31 -05:00 --- debug: Database Library initialized
2026-06-21 15:30:31 -05:00 --- debug: Auth Library loaded
2026-06-21 15:30:31 -05:00 --- debug: Cache Library initialized
2026-06-21 15:30:31 -05:00 --- debug: Session Library initialized
2026-06-21 15:30:31 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:30:31 -05:00 --- debug: Database Library initialized
2026-06-21 15:30:31 -05:00 --- debug: Cache Library initialized
2026-06-21 15:30:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:30:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:30:33 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:30:33 +00:00 --- debug: Database Library initialized
2026-06-21 20:30:33 +00:00 --- debug: Cache Library initialized
2026-06-21 20:30:33 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:30:33 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:30:33 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:30:33 +00:00 --- debug: Session Library initialized
2026-06-21 15:30:33 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:30:33 -05:00 --- debug: Database Library initialized
2026-06-21 15:30:33 -05:00 --- debug: Auth Library loaded
2026-06-21 20:31:31 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:31:31 +00:00 --- debug: Database Library initialized
2026-06-21 20:31:31 +00:00 --- debug: Cache Library initialized
2026-06-21 20:31:31 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:31:31 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:31:31 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:31:31 +00:00 --- debug: Session Library initialized
2026-06-21 15:31:31 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:31:31 -05:00 --- debug: Database Library initialized
2026-06-21 15:31:31 -05:00 --- debug: Auth Library loaded
2026-06-21 15:31:31 -05:00 --- debug: Cache Library initialized
2026-06-21 15:31:31 -05:00 --- debug: Session Library initialized
2026-06-21 15:31:31 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:31:31 -05:00 --- debug: Database Library initialized
2026-06-21 15:31:31 -05:00 --- debug: Cache Library initialized
2026-06-21 15:31:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:31:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:31:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:31:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:31:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:31:31 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:31:33 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:31:33 +00:00 --- debug: Database Library initialized
2026-06-21 20:31:33 +00:00 --- debug: Cache Library initialized
2026-06-21 20:31:33 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:31:33 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:31:33 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:31:33 +00:00 --- debug: Session Library initialized
2026-06-21 15:31:33 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:31:33 -05:00 --- debug: Database Library initialized
2026-06-21 15:31:33 -05:00 --- debug: Auth Library loaded
2026-06-21 20:32:44 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:32:44 +00:00 --- debug: Database Library initialized
2026-06-21 20:32:44 +00:00 --- debug: Cache Library initialized
2026-06-21 20:32:44 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:32:44 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:32:44 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:32:44 +00:00 --- debug: Session Library initialized
2026-06-21 15:32:44 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:32:44 -05:00 --- debug: Database Library initialized
2026-06-21 15:32:44 -05:00 --- debug: Auth Library loaded
2026-06-21 15:32:44 -05:00 --- debug: Cache Library initialized
2026-06-21 15:32:44 -05:00 --- debug: Session Library initialized
2026-06-21 15:32:44 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:32:44 -05:00 --- debug: Database Library initialized
2026-06-21 15:32:44 -05:00 --- debug: Cache Library initialized
2026-06-21 15:32:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:32:47 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:32:47 +00:00 --- debug: Database Library initialized
2026-06-21 20:32:47 +00:00 --- debug: Cache Library initialized
2026-06-21 20:32:47 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:32:47 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:32:47 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:32:47 +00:00 --- debug: Session Library initialized
2026-06-21 15:32:47 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:32:47 -05:00 --- debug: Database Library initialized
2026-06-21 15:32:47 -05:00 --- debug: Auth Library loaded
2026-06-21 20:32:48 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:32:48 +00:00 --- debug: Database Library initialized
2026-06-21 20:32:48 +00:00 --- debug: Cache Library initialized
2026-06-21 20:32:48 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:32:48 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:32:48 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:32:48 +00:00 --- debug: Session Library initialized
2026-06-21 15:32:48 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:32:48 -05:00 --- debug: Database Library initialized
2026-06-21 15:32:48 -05:00 --- debug: Auth Library loaded
2026-06-21 15:32:48 -05:00 --- debug: Cache Library initialized
2026-06-21 15:32:48 -05:00 --- debug: Session Library initialized
2026-06-21 15:32:48 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:32:48 -05:00 --- debug: Database Library initialized
2026-06-21 15:32:48 -05:00 --- debug: Cache Library initialized
2026-06-21 15:32:48 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:48 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:48 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:48 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:48 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:48 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:32:50 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:32:50 +00:00 --- debug: Database Library initialized
2026-06-21 20:32:50 +00:00 --- debug: Cache Library initialized
2026-06-21 20:32:50 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:32:50 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:32:50 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:32:50 +00:00 --- debug: Session Library initialized
2026-06-21 15:32:50 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:32:50 -05:00 --- debug: Database Library initialized
2026-06-21 15:32:50 -05:00 --- debug: Auth Library loaded
2026-06-21 20:32:56 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:32:56 +00:00 --- debug: Database Library initialized
2026-06-21 20:32:56 +00:00 --- debug: Cache Library initialized
2026-06-21 20:32:56 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:32:56 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:32:56 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:32:56 +00:00 --- debug: Session Library initialized
2026-06-21 15:32:56 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:32:56 -05:00 --- debug: Database Library initialized
2026-06-21 15:32:56 -05:00 --- debug: Auth Library loaded
2026-06-21 15:32:56 -05:00 --- debug: Cache Library initialized
2026-06-21 15:32:56 -05:00 --- debug: Session Library initialized
2026-06-21 15:32:56 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:32:56 -05:00 --- debug: Database Library initialized
2026-06-21 15:32:56 -05:00 --- debug: Cache Library initialized
2026-06-21 15:32:56 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:56 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:56 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:56 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:56 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:56 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:56 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 20:32:56 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:32:56 +00:00 --- debug: Database Library initialized
2026-06-21 20:32:56 +00:00 --- debug: Cache Library initialized
2026-06-21 20:32:56 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:32:56 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:32:56 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:32:56 +00:00 --- debug: Session Library initialized
2026-06-21 15:32:56 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:32:56 -05:00 --- debug: Database Library initialized
2026-06-21 15:32:56 -05:00 --- debug: Auth Library loaded
2026-06-21 20:32:57 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:32:57 +00:00 --- debug: Database Library initialized
2026-06-21 20:32:57 +00:00 --- debug: Cache Library initialized
2026-06-21 20:32:57 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:32:57 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:32:57 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:32:57 +00:00 --- debug: Session Library initialized
2026-06-21 15:32:57 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:32:57 -05:00 --- debug: Database Library initialized
2026-06-21 15:32:57 -05:00 --- debug: Auth Library loaded
2026-06-21 15:32:57 -05:00 --- debug: Cache Library initialized
2026-06-21 15:32:57 -05:00 --- debug: Session Library initialized
2026-06-21 15:32:57 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:32:57 -05:00 --- debug: Database Library initialized
2026-06-21 15:32:57 -05:00 --- debug: Cache Library initialized
2026-06-21 15:32:57 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:57 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:57 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:57 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:57 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:32:57 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:32:58 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:32:58 +00:00 --- debug: Database Library initialized
2026-06-21 20:32:58 +00:00 --- debug: Cache Library initialized
2026-06-21 20:32:58 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:32:58 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:32:58 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:32:58 +00:00 --- debug: Session Library initialized
2026-06-21 15:32:58 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:32:58 -05:00 --- debug: Database Library initialized
2026-06-21 15:32:58 -05:00 --- debug: Auth Library loaded
2026-06-21 20:33:01 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:01 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:01 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:01 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:01 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:01 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:01 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:01 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:01 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:01 -05:00 --- debug: Auth Library loaded
2026-06-21 15:33:01 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:01 -05:00 --- debug: Session Library initialized
2026-06-21 15:33:01 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:01 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:01 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:01 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:01 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:01 -05:00 --- debug: :::::MMM  get_number_reports_by_date (models incident)
2026-06-21 15:33:01 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:01 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:01 -05:00 --- debug: ::::::::: MMMM MOSTRAR EL VALOR DEL USER_ID
2026-06-21 15:33:01 -05:00 --- debug: 
2026-06-21 15:33:01 -05:00 --- debug: ADMIN
2026-06-21 15:33:01 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:01 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:01 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:01 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:01 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:01 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:33:02 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:02 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:02 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:02 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:02 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:02 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:02 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:02 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:02 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:02 -05:00 --- debug: Auth Library loaded
2026-06-21 20:33:04 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:04 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:04 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:04 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:04 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:04 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:04 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:04 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:04 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:04 -05:00 --- debug: Auth Library loaded
2026-06-21 15:33:04 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:04 -05:00 --- debug: Session Library initialized
2026-06-21 15:33:04 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:04 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:04 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:04 -05:00 --- debug: :::::MMM  get_oldest_report_timestamp (models incident)
2026-06-21 15:33:04 -05:00 --- debug: :::::MMM  get_latest_report_timestamp (models incident)
2026-06-21 15:33:04 -05:00 --- alert: admin::permissions() in deprecated and replaced by Auth::has_permission()
2026-06-21 15:33:04 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-21 15:33:04 -05:00 --- debug: :::::MMM   Count query   (models incident)
2026-06-21 15:33:04 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-21 15:33:04 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE 1=1 ORDER BY i.incident_date DESC 
2026-06-21 15:33:04 -05:00 --- debug: Pagination Library initialized
2026-06-21 15:33:04 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-21 15:33:04 -05:00 --- debug: :::::MMM  Normal query       (models incident)
2026-06-21 15:33:04 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-21 15:33:04 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE 1=1 ORDER BY i.incident_date DESC LIMIT 0, 50
2026-06-21 15:33:04 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:04 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:04 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:04 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:04 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:04 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:04 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:04 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:04 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:04 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:04 -05:00 --- debug: :::::::::::::::: count
2026-06-21 15:33:04 -05:00 --- debug: 
2026-06-21 15:33:04 -05:00 --- debug: :::::::::::::::: CONSULTA SQL EN EL ELSE
2026-06-21 15:33:04 -05:00 --- debug: SELECT c.id, c.parent_id, c.category_title, c.category_color, c.category_image, c.category_image_thumb FROM category c LEFT JOIN category c_parent ON (c.parent_id = c_parent.id) WHERE 1=1 ORDER BY c.category_position ASC
2026-06-21 15:33:04 -05:00 --- info: Missing i18n entry ui_main.web for language en_US
2026-06-21 15:33:04 -05:00 --- info: Missing i18n entry ui_main.keywords for language en_US
2026-06-21 15:33:04 -05:00 --- info: Missing i18n entry reports.documento for language en_US
2026-06-21 20:33:05 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:05 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:05 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:05 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:05 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:05 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:05 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:05 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:05 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:05 -05:00 --- debug: Auth Library loaded
2026-06-21 20:33:07 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:07 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:07 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:07 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:07 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:07 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:07 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:07 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:07 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:07 -05:00 --- debug: Auth Library loaded
2026-06-21 15:33:07 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:07 -05:00 --- debug: Session Library initialized
2026-06-21 15:33:07 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:07 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:07 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:07 -05:00 --- debug: Pagination Library initialized
2026-06-21 15:33:07 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:07 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:07 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:07 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:07 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:07 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:33:07 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:07 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:07 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:07 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:07 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:07 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:07 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:07 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:07 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:07 -05:00 --- debug: Auth Library loaded
2026-06-21 20:33:07 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:07 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:07 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:07 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:07 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:07 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:07 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:07 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:07 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:07 -05:00 --- debug: Auth Library loaded
2026-06-21 15:33:07 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:07 -05:00 --- debug: Session Library initialized
2026-06-21 15:33:07 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:07 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:07 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:08 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:08 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:08 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:08 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:08 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:08 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:08 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 20:33:08 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:08 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:08 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:08 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:08 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:08 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:08 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:08 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:08 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:08 -05:00 --- debug: Auth Library loaded
2026-06-21 20:33:09 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:09 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:09 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:09 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:09 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:09 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:09 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:09 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:09 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:09 -05:00 --- debug: Auth Library loaded
2026-06-21 15:33:09 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:09 -05:00 --- debug: Session Library initialized
2026-06-21 15:33:09 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:09 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:09 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:09 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:09 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:09 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:09 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:09 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:09 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:33:10 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:10 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:10 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:10 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:10 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:10 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:10 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:10 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:10 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:10 -05:00 --- debug: Auth Library loaded
2026-06-21 20:33:15 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:15 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:15 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:15 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:15 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:15 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:15 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:15 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:15 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:15 -05:00 --- debug: Auth Library loaded
2026-06-21 15:33:15 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:15 -05:00 --- debug: Session Library initialized
2026-06-21 15:33:15 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:15 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:15 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:15 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:15 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:15 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:15 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:15 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:15 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:15 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 20:33:15 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:15 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:15 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:15 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:15 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:15 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:15 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:15 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:15 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:15 -05:00 --- debug: Auth Library loaded
2026-06-21 20:33:17 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:17 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:17 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:17 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:17 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:17 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:17 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:17 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:17 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:17 -05:00 --- debug: Auth Library loaded
2026-06-21 15:33:17 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:17 -05:00 --- debug: Session Library initialized
2026-06-21 15:33:17 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:17 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:17 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:17 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:17 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:17 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:17 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:17 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:17 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:33:17 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:17 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:17 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:17 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:17 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:17 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:17 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:17 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:17 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:17 -05:00 --- debug: Auth Library loaded
2026-06-21 20:33:19 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:19 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:19 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:19 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:19 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:19 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:19 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:19 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:19 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:19 -05:00 --- debug: Auth Library loaded
2026-06-21 15:33:19 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:19 -05:00 --- debug: Session Library initialized
2026-06-21 15:33:19 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:19 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:19 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:19 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:19 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:19 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:19 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:19 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:19 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:19 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 20:33:20 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:20 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:20 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:20 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:20 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:20 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:20 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:20 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:20 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:20 -05:00 --- debug: Auth Library loaded
2026-06-21 20:33:21 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:21 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:21 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:21 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:21 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:21 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:21 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:21 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:21 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:21 -05:00 --- debug: Auth Library loaded
2026-06-21 15:33:21 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:21 -05:00 --- debug: Session Library initialized
2026-06-21 15:33:21 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:21 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:21 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:21 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 20:33:22 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:22 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:22 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:22 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:22 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:22 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:22 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:22 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:22 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:22 -05:00 --- debug: Auth Library loaded
2026-06-21 20:33:23 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:23 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:23 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:23 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:23 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:23 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:23 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:23 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:23 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:23 -05:00 --- debug: Auth Library loaded
2026-06-21 15:33:23 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:23 -05:00 --- debug: Session Library initialized
2026-06-21 15:33:23 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:23 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:23 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:33:23 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:23 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:23 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:23 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:23 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:23 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:23 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:23 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:23 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:23 -05:00 --- debug: Auth Library loaded
2026-06-21 20:33:25 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:25 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:25 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:25 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:25 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:25 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:25 +00:00 --- debug: Session garbage collected: 0 row(s) deleted.
2026-06-21 20:33:25 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:25 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:25 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:25 -05:00 --- debug: Auth Library loaded
2026-06-21 15:33:25 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:25 -05:00 --- debug: Session Library initialized
2026-06-21 15:33:25 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:25 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:25 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:25 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 20:33:26 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:26 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:26 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:26 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:26 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:26 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:26 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:26 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:26 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:26 -05:00 --- debug: Auth Library loaded
2026-06-21 20:33:26 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:26 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:26 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:26 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:26 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:26 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:26 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:26 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:26 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:26 -05:00 --- debug: Auth Library loaded
2026-06-21 15:33:26 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:26 -05:00 --- debug: Session Library initialized
2026-06-21 15:33:26 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:26 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:26 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:26 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:26 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:26 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:26 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:26 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:26 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:33:27 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:27 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:27 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:27 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:27 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:27 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:27 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:27 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:27 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:27 -05:00 --- debug: Auth Library loaded
2026-06-21 20:33:28 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:28 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:28 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:28 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:28 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:28 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:28 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:28 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:28 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:28 -05:00 --- debug: Auth Library loaded
2026-06-21 15:33:28 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:28 -05:00 --- debug: Session Library initialized
2026-06-21 15:33:28 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:28 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:28 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:33:29 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:29 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:29 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:29 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:29 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:29 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:29 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:29 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:29 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:29 -05:00 --- debug: Auth Library loaded
2026-06-21 20:33:33 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:33 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:33 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:33 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:33 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:33 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:33 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:33 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:33 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:33 -05:00 --- debug: Auth Library loaded
2026-06-21 15:33:33 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:33 -05:00 --- debug: Session Library initialized
2026-06-21 15:33:33 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:33 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:33 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:33 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:33 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 20:33:33 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:33 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:33 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:33 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:33 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:33 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:33 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:33 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:33 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:33 -05:00 --- debug: Auth Library loaded
2026-06-21 20:33:35 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:35 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:35 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:35 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:35 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:35 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:35 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:35 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:35 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:35 -05:00 --- debug: Auth Library loaded
2026-06-21 15:33:35 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:35 -05:00 --- debug: Session Library initialized
2026-06-21 15:33:35 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:35 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:35 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:35 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 20:33:35 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:35 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:35 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:35 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:35 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:35 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:35 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:35 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:35 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:36 -05:00 --- debug: Auth Library loaded
2026-06-21 20:33:37 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:37 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:37 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:37 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:37 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:37 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:37 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:37 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:37 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:37 -05:00 --- debug: Auth Library loaded
2026-06-21 15:33:37 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:37 -05:00 --- debug: Session Library initialized
2026-06-21 15:33:37 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:37 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:37 -05:00 --- debug: Cache Library initialized
2026-06-21 20:33:01 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:01 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:01 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:01 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:01 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:01 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:01 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:01 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:01 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:01 -05:00 --- debug: Auth Library loaded
2026-06-21 15:33:01 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:01 -05:00 --- debug: Session Library initialized
2026-06-21 15:33:01 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:01 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:01 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:01 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:01 -05:00 --- debug: Database Library initialized
2026-06-21 20:33:44 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:44 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:44 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:44 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:44 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:44 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:44 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:44 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:44 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:44 -05:00 --- debug: Auth Library loaded
2026-06-21 15:33:44 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:44 -05:00 --- debug: Session Library initialized
2026-06-21 15:33:44 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:44 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:44 -05:00 --- debug: Cache Library initialized
2026-06-21 15:33:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:45 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:33:45 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 20:33:45 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:33:45 +00:00 --- debug: Database Library initialized
2026-06-21 20:33:45 +00:00 --- debug: Cache Library initialized
2026-06-21 20:33:45 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:33:45 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:33:45 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:33:45 +00:00 --- debug: Session Library initialized
2026-06-21 15:33:45 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:33:45 -05:00 --- debug: Database Library initialized
2026-06-21 15:33:45 -05:00 --- debug: Auth Library loaded
2026-06-21 20:34:52 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:34:52 +00:00 --- debug: Database Library initialized
2026-06-21 20:34:52 +00:00 --- debug: Cache Library initialized
2026-06-21 20:34:52 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:34:52 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:34:52 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:34:52 +00:00 --- debug: Session Library initialized
2026-06-21 15:34:52 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:34:52 -05:00 --- debug: Database Library initialized
2026-06-21 15:34:52 -05:00 --- debug: Auth Library loaded
2026-06-21 15:34:52 -05:00 --- debug: Cache Library initialized
2026-06-21 15:34:52 -05:00 --- debug: Session Library initialized
2026-06-21 15:34:52 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:34:52 -05:00 --- debug: Database Library initialized
2026-06-21 15:34:52 -05:00 --- debug: Cache Library initialized
2026-06-21 15:34:52 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:34:52 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:34:52 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:34:52 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:34:52 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:34:52 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:34:52 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:34:52 +00:00 --- debug: Database Library initialized
2026-06-21 20:34:52 +00:00 --- debug: Cache Library initialized
2026-06-21 20:34:52 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:34:52 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:34:52 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:34:52 +00:00 --- debug: Session Library initialized
2026-06-21 15:34:52 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:34:52 -05:00 --- debug: Database Library initialized
2026-06-21 15:34:52 -05:00 --- debug: Auth Library loaded
2026-06-21 20:37:18 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:37:18 +00:00 --- debug: Database Library initialized
2026-06-21 20:37:18 +00:00 --- debug: Cache Library initialized
2026-06-21 20:37:18 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:37:18 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:37:18 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:37:18 +00:00 --- debug: Session Library initialized
2026-06-21 15:37:18 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:37:18 -05:00 --- debug: Database Library initialized
2026-06-21 15:37:18 -05:00 --- debug: Auth Library loaded
2026-06-21 15:37:18 -05:00 --- debug: Cache Library initialized
2026-06-21 15:37:18 -05:00 --- debug: Session Library initialized
2026-06-21 15:37:18 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:37:18 -05:00 --- debug: Database Library initialized
2026-06-21 15:37:18 -05:00 --- debug: Cache Library initialized
2026-06-21 15:37:18 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:18 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:18 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:18 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:18 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:18 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:37:18 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:37:18 +00:00 --- debug: Database Library initialized
2026-06-21 20:37:18 +00:00 --- debug: Cache Library initialized
2026-06-21 20:37:18 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:37:18 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:37:18 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:37:18 +00:00 --- debug: Session Library initialized
2026-06-21 15:37:18 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:37:18 -05:00 --- debug: Database Library initialized
2026-06-21 15:37:18 -05:00 --- debug: Auth Library loaded
2026-06-21 20:37:19 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:37:19 +00:00 --- debug: Database Library initialized
2026-06-21 20:37:19 +00:00 --- debug: Cache Library initialized
2026-06-21 20:37:19 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:37:19 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:37:19 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:37:19 +00:00 --- debug: Session Library initialized
2026-06-21 15:37:19 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:37:19 -05:00 --- debug: Database Library initialized
2026-06-21 15:37:19 -05:00 --- debug: Auth Library loaded
2026-06-21 15:37:19 -05:00 --- debug: Cache Library initialized
2026-06-21 15:37:19 -05:00 --- debug: Session Library initialized
2026-06-21 15:37:19 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:37:19 -05:00 --- debug: Database Library initialized
2026-06-21 15:37:19 -05:00 --- debug: Cache Library initialized
2026-06-21 15:37:19 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:19 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:19 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:19 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:19 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:19 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:37:19 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:37:19 +00:00 --- debug: Database Library initialized
2026-06-21 20:37:19 +00:00 --- debug: Cache Library initialized
2026-06-21 20:37:19 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:37:19 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:37:19 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:37:19 +00:00 --- debug: Session Library initialized
2026-06-21 15:37:19 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:37:19 -05:00 --- debug: Database Library initialized
2026-06-21 15:37:19 -05:00 --- debug: Auth Library loaded
2026-06-21 20:37:20 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:37:20 +00:00 --- debug: Database Library initialized
2026-06-21 20:37:20 +00:00 --- debug: Cache Library initialized
2026-06-21 20:37:20 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:37:20 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:37:20 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:37:20 +00:00 --- debug: Session Library initialized
2026-06-21 15:37:20 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:37:20 -05:00 --- debug: Database Library initialized
2026-06-21 15:37:20 -05:00 --- debug: Auth Library loaded
2026-06-21 15:37:20 -05:00 --- debug: Cache Library initialized
2026-06-21 15:37:20 -05:00 --- debug: Session Library initialized
2026-06-21 15:37:20 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:37:20 -05:00 --- debug: Database Library initialized
2026-06-21 15:37:20 -05:00 --- debug: Cache Library initialized
2026-06-21 15:37:20 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:20 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:20 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:20 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:20 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:20 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:20 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 20:37:21 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:37:21 +00:00 --- debug: Database Library initialized
2026-06-21 20:37:21 +00:00 --- debug: Cache Library initialized
2026-06-21 20:37:21 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:37:21 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:37:21 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:37:21 +00:00 --- debug: Session Library initialized
2026-06-21 15:37:21 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:37:21 -05:00 --- debug: Database Library initialized
2026-06-21 15:37:21 -05:00 --- debug: Auth Library loaded
2026-06-21 20:37:23 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:37:23 +00:00 --- debug: Database Library initialized
2026-06-21 20:37:23 +00:00 --- debug: Cache Library initialized
2026-06-21 20:37:23 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:37:23 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:37:23 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:37:23 +00:00 --- debug: Session Library initialized
2026-06-21 15:37:23 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:37:23 -05:00 --- debug: Database Library initialized
2026-06-21 15:37:23 -05:00 --- debug: Auth Library loaded
2026-06-21 15:37:23 -05:00 --- debug: Cache Library initialized
2026-06-21 15:37:23 -05:00 --- debug: Session Library initialized
2026-06-21 15:37:23 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:37:23 -05:00 --- debug: Database Library initialized
2026-06-21 15:37:23 -05:00 --- debug: Cache Library initialized
2026-06-21 15:37:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:37:23 -05:00 --- info: Missing i18n entry stats.catpdtompio for language en_US
2026-06-21 20:37:23 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:37:23 +00:00 --- debug: Database Library initialized
2026-06-21 20:37:23 +00:00 --- debug: Cache Library initialized
2026-06-21 20:37:23 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:37:23 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:37:23 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:37:23 +00:00 --- debug: Session Library initialized
2026-06-21 15:37:23 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:37:23 -05:00 --- debug: Database Library initialized
2026-06-21 15:37:23 -05:00 --- debug: Auth Library loaded
2026-06-21 20:38:00 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:38:00 +00:00 --- debug: Database Library initialized
2026-06-21 20:38:00 +00:00 --- debug: Cache Library initialized
2026-06-21 20:38:00 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:38:00 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:38:00 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:38:00 +00:00 --- debug: Session Library initialized
2026-06-21 15:38:00 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:38:00 -05:00 --- debug: Database Library initialized
2026-06-21 15:38:00 -05:00 --- debug: Auth Library loaded
2026-06-21 15:38:00 -05:00 --- debug: Cache Library initialized
2026-06-21 15:38:00 -05:00 --- debug: Session Library initialized
2026-06-21 15:38:00 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:38:00 -05:00 --- debug: Database Library initialized
2026-06-21 15:38:00 -05:00 --- debug: Cache Library initialized
2026-06-21 15:38:00 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:00 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:00 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:00 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:00 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:00 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:38:01 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:38:01 +00:00 --- debug: Database Library initialized
2026-06-21 20:38:01 +00:00 --- debug: Cache Library initialized
2026-06-21 20:38:01 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:38:01 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:38:01 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:38:01 +00:00 --- debug: Session Library initialized
2026-06-21 15:38:01 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:38:01 -05:00 --- debug: Database Library initialized
2026-06-21 15:38:01 -05:00 --- debug: Auth Library loaded
2026-06-21 20:38:23 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:38:23 +00:00 --- debug: Database Library initialized
2026-06-21 20:38:23 +00:00 --- debug: Cache Library initialized
2026-06-21 20:38:23 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:38:23 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:38:23 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:38:23 +00:00 --- debug: Session Library initialized
2026-06-21 15:38:23 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:38:23 -05:00 --- debug: Database Library initialized
2026-06-21 15:38:23 -05:00 --- debug: Auth Library loaded
2026-06-21 15:38:23 -05:00 --- debug: Cache Library initialized
2026-06-21 15:38:23 -05:00 --- debug: Session Library initialized
2026-06-21 15:38:23 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:38:23 -05:00 --- debug: Database Library initialized
2026-06-21 15:38:23 -05:00 --- debug: Cache Library initialized
2026-06-21 15:38:24 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:24 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:24 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:24 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:24 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:24 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:38:24 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:38:24 +00:00 --- debug: Database Library initialized
2026-06-21 20:38:24 +00:00 --- debug: Cache Library initialized
2026-06-21 20:38:24 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:38:24 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:38:24 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:38:24 +00:00 --- debug: Session Library initialized
2026-06-21 15:38:24 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:38:24 -05:00 --- debug: Database Library initialized
2026-06-21 15:38:24 -05:00 --- debug: Auth Library loaded
2026-06-21 20:38:25 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:38:25 +00:00 --- debug: Database Library initialized
2026-06-21 20:38:25 +00:00 --- debug: Cache Library initialized
2026-06-21 20:38:25 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:38:25 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:38:25 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:38:25 +00:00 --- debug: Session Library initialized
2026-06-21 15:38:25 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:38:25 -05:00 --- debug: Database Library initialized
2026-06-21 15:38:25 -05:00 --- debug: Auth Library loaded
2026-06-21 15:38:25 -05:00 --- debug: Cache Library initialized
2026-06-21 15:38:25 -05:00 --- debug: Session Library initialized
2026-06-21 15:38:25 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:38:25 -05:00 --- debug: Database Library initialized
2026-06-21 15:38:25 -05:00 --- debug: Cache Library initialized
2026-06-21 15:38:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:38:25 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:38:25 +00:00 --- debug: Database Library initialized
2026-06-21 20:38:25 +00:00 --- debug: Cache Library initialized
2026-06-21 20:38:25 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:38:25 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:38:25 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:38:25 +00:00 --- debug: Session Library initialized
2026-06-21 15:38:25 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:38:25 -05:00 --- debug: Database Library initialized
2026-06-21 15:38:25 -05:00 --- debug: Auth Library loaded
2026-06-21 20:38:26 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:38:26 +00:00 --- debug: Database Library initialized
2026-06-21 20:38:26 +00:00 --- debug: Cache Library initialized
2026-06-21 20:38:26 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:38:26 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:38:26 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:38:26 +00:00 --- debug: Session Library initialized
2026-06-21 15:38:26 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:38:26 -05:00 --- debug: Database Library initialized
2026-06-21 15:38:26 -05:00 --- debug: Auth Library loaded
2026-06-21 15:38:26 -05:00 --- debug: Cache Library initialized
2026-06-21 15:38:26 -05:00 --- debug: Session Library initialized
2026-06-21 15:38:26 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:38:26 -05:00 --- debug: Database Library initialized
2026-06-21 15:38:26 -05:00 --- debug: Cache Library initialized
2026-06-21 15:38:26 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:26 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:26 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:26 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:26 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:26 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:38:26 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:38:26 +00:00 --- debug: Database Library initialized
2026-06-21 20:38:26 +00:00 --- debug: Cache Library initialized
2026-06-21 20:38:26 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:38:26 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:38:26 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:38:26 +00:00 --- debug: Session Library initialized
2026-06-21 15:38:26 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:38:26 -05:00 --- debug: Database Library initialized
2026-06-21 15:38:26 -05:00 --- debug: Auth Library loaded
2026-06-21 20:38:27 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:38:27 +00:00 --- debug: Database Library initialized
2026-06-21 20:38:27 +00:00 --- debug: Cache Library initialized
2026-06-21 20:38:27 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:38:27 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:38:27 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:38:27 +00:00 --- debug: Session Library initialized
2026-06-21 15:38:27 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:38:27 -05:00 --- debug: Database Library initialized
2026-06-21 15:38:27 -05:00 --- debug: Auth Library loaded
2026-06-21 15:38:27 -05:00 --- debug: Cache Library initialized
2026-06-21 15:38:27 -05:00 --- debug: Session Library initialized
2026-06-21 15:38:27 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:38:27 -05:00 --- debug: Database Library initialized
2026-06-21 15:38:27 -05:00 --- debug: Cache Library initialized
2026-06-21 15:38:27 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:27 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:27 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:27 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:27 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:38:27 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:38:28 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:38:28 +00:00 --- debug: Database Library initialized
2026-06-21 20:38:28 +00:00 --- debug: Cache Library initialized
2026-06-21 20:38:28 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:38:28 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:38:28 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:38:28 +00:00 --- debug: Session Library initialized
2026-06-21 15:38:28 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:38:28 -05:00 --- debug: Database Library initialized
2026-06-21 15:38:28 -05:00 --- debug: Auth Library loaded
2026-06-21 20:39:41 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:39:41 +00:00 --- debug: Database Library initialized
2026-06-21 20:39:41 +00:00 --- debug: Cache Library initialized
2026-06-21 20:39:41 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:39:41 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:39:41 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:39:41 +00:00 --- debug: Session Library initialized
2026-06-21 15:39:41 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:39:41 -05:00 --- debug: Database Library initialized
2026-06-21 15:39:41 -05:00 --- debug: Auth Library loaded
2026-06-21 15:39:41 -05:00 --- debug: Cache Library initialized
2026-06-21 15:39:41 -05:00 --- debug: Session Library initialized
2026-06-21 15:39:41 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:39:41 -05:00 --- debug: Database Library initialized
2026-06-21 15:39:41 -05:00 --- debug: Cache Library initialized
2026-06-21 15:39:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:39:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:39:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:39:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:39:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:39:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:39:42 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:39:42 +00:00 --- debug: Database Library initialized
2026-06-21 20:39:42 +00:00 --- debug: Cache Library initialized
2026-06-21 20:39:42 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:39:42 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:39:42 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:39:42 +00:00 --- debug: Session Library initialized
2026-06-21 15:39:42 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:39:42 -05:00 --- debug: Database Library initialized
2026-06-21 15:39:42 -05:00 --- debug: Auth Library loaded
2026-06-21 20:39:46 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:39:46 +00:00 --- debug: Database Library initialized
2026-06-21 20:39:46 +00:00 --- debug: Cache Library initialized
2026-06-21 20:39:46 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:39:46 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:39:46 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:39:46 +00:00 --- debug: Session Library initialized
2026-06-21 15:39:46 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:39:46 -05:00 --- debug: Database Library initialized
2026-06-21 15:39:46 -05:00 --- debug: Auth Library loaded
2026-06-21 15:39:46 -05:00 --- debug: Cache Library initialized
2026-06-21 15:39:46 -05:00 --- debug: Session Library initialized
2026-06-21 15:39:46 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:39:46 -05:00 --- debug: Database Library initialized
2026-06-21 15:39:46 -05:00 --- debug: Cache Library initialized
2026-06-21 15:39:46 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:39:46 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:39:46 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:39:46 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:39:46 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:39:46 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:39:47 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:39:47 +00:00 --- debug: Database Library initialized
2026-06-21 20:39:47 +00:00 --- debug: Cache Library initialized
2026-06-21 20:39:47 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:39:47 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:39:47 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:39:47 +00:00 --- debug: Session Library initialized
2026-06-21 15:39:47 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:39:47 -05:00 --- debug: Database Library initialized
2026-06-21 15:39:47 -05:00 --- debug: Auth Library loaded
2026-06-21 20:39:49 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:39:49 +00:00 --- debug: Database Library initialized
2026-06-21 20:39:49 +00:00 --- debug: Cache Library initialized
2026-06-21 20:39:49 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:39:49 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:39:49 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:39:49 +00:00 --- debug: Session Library initialized
2026-06-21 15:39:49 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:39:49 -05:00 --- debug: Database Library initialized
2026-06-21 15:39:49 -05:00 --- debug: Auth Library loaded
2026-06-21 15:39:49 -05:00 --- debug: Cache Library initialized
2026-06-21 15:39:49 -05:00 --- debug: Session Library initialized
2026-06-21 15:39:49 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:39:49 -05:00 --- debug: Database Library initialized
2026-06-21 15:39:49 -05:00 --- debug: Cache Library initialized
2026-06-21 15:39:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:39:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:39:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:39:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:39:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:39:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:39:50 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:39:50 +00:00 --- debug: Database Library initialized
2026-06-21 20:39:50 +00:00 --- debug: Cache Library initialized
2026-06-21 20:39:50 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:39:50 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:39:50 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:39:50 +00:00 --- debug: Session Library initialized
2026-06-21 15:39:50 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:39:50 -05:00 --- debug: Database Library initialized
2026-06-21 15:39:50 -05:00 --- debug: Auth Library loaded
2026-06-21 20:40:23 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:40:23 +00:00 --- debug: Database Library initialized
2026-06-21 20:40:23 +00:00 --- debug: Cache Library initialized
2026-06-21 20:40:23 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:40:23 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:40:23 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:40:23 +00:00 --- debug: Session Library initialized
2026-06-21 15:40:23 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:23 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:23 -05:00 --- debug: Auth Library loaded
2026-06-21 15:40:23 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:23 -05:00 --- debug: Session Library initialized
2026-06-21 15:40:23 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:23 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:23 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:40:24 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:40:24 +00:00 --- debug: Database Library initialized
2026-06-21 20:40:24 +00:00 --- debug: Cache Library initialized
2026-06-21 20:40:24 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:40:24 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:40:24 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:40:24 +00:00 --- debug: Session Library initialized
2026-06-21 15:40:24 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:24 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:24 -05:00 --- debug: Auth Library loaded
2026-06-21 20:40:27 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:40:27 +00:00 --- debug: Database Library initialized
2026-06-21 20:40:27 +00:00 --- debug: Cache Library initialized
2026-06-21 20:40:27 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:40:27 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:40:27 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:40:27 +00:00 --- debug: Session Library initialized
2026-06-21 15:40:27 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:27 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:27 -05:00 --- debug: Auth Library loaded
2026-06-21 15:40:27 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:27 -05:00 --- debug: Session Library initialized
2026-06-21 15:40:27 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:27 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:27 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:27 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:27 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:27 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:27 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:27 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:27 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:40:27 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:40:27 +00:00 --- debug: Database Library initialized
2026-06-21 20:40:27 +00:00 --- debug: Cache Library initialized
2026-06-21 20:40:27 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:40:27 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:40:27 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:40:27 +00:00 --- debug: Session Library initialized
2026-06-21 15:40:27 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:27 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:27 -05:00 --- debug: Auth Library loaded
2026-06-21 20:40:28 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:40:28 +00:00 --- debug: Database Library initialized
2026-06-21 20:40:28 +00:00 --- debug: Cache Library initialized
2026-06-21 20:40:28 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:40:28 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:40:28 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:40:28 +00:00 --- debug: Session Library initialized
2026-06-21 15:40:28 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:28 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:28 -05:00 --- debug: Auth Library loaded
2026-06-21 15:40:28 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:28 -05:00 --- debug: Session Library initialized
2026-06-21 15:40:28 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:28 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:28 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:28 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:40:28 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:40:28 +00:00 --- debug: Database Library initialized
2026-06-21 20:40:28 +00:00 --- debug: Cache Library initialized
2026-06-21 20:40:28 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:40:28 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:40:28 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:40:28 +00:00 --- debug: Session Library initialized
2026-06-21 15:40:28 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:28 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:28 -05:00 --- debug: Auth Library loaded
2026-06-21 20:40:29 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:40:29 +00:00 --- debug: Database Library initialized
2026-06-21 20:40:29 +00:00 --- debug: Cache Library initialized
2026-06-21 20:40:29 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:40:29 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:40:29 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:40:29 +00:00 --- debug: Session Library initialized
2026-06-21 15:40:29 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:29 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:29 -05:00 --- debug: Auth Library loaded
2026-06-21 15:40:29 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:29 -05:00 --- debug: Session Library initialized
2026-06-21 15:40:29 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:29 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:29 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:40:30 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:40:30 +00:00 --- debug: Database Library initialized
2026-06-21 20:40:30 +00:00 --- debug: Cache Library initialized
2026-06-21 20:40:30 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:40:30 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:40:30 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:40:30 +00:00 --- debug: Session Library initialized
2026-06-21 15:40:30 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:30 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:30 -05:00 --- debug: Auth Library loaded
2026-06-21 20:40:30 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:40:30 +00:00 --- debug: Database Library initialized
2026-06-21 20:40:30 +00:00 --- debug: Cache Library initialized
2026-06-21 20:40:30 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:40:30 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:40:30 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:40:30 +00:00 --- debug: Session Library initialized
2026-06-21 15:40:30 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:30 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:30 -05:00 --- debug: Auth Library loaded
2026-06-21 15:40:30 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:30 -05:00 --- debug: Session Library initialized
2026-06-21 15:40:30 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:30 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:30 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:32 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:32 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:32 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:32 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:32 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:32 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:40:32 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:40:32 +00:00 --- debug: Database Library initialized
2026-06-21 20:40:32 +00:00 --- debug: Cache Library initialized
2026-06-21 20:40:32 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:40:32 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:40:32 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:40:32 +00:00 --- debug: Session Library initialized
2026-06-21 15:40:32 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:32 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:32 -05:00 --- debug: Auth Library loaded
2026-06-21 15:40:32 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:32 -05:00 --- debug: Session Library initialized
2026-06-21 15:40:32 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:32 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:32 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:35 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:40:36 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:40:36 +00:00 --- debug: Database Library initialized
2026-06-21 20:40:36 +00:00 --- debug: Cache Library initialized
2026-06-21 20:40:36 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:40:36 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:40:36 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:40:36 +00:00 --- debug: Session Library initialized
2026-06-21 15:40:36 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:36 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:36 -05:00 --- debug: Auth Library loaded
2026-06-21 15:40:36 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:36 -05:00 --- debug: Session Library initialized
2026-06-21 15:40:36 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:36 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:36 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:36 -05:00 --- debug: Pagination Library initialized
2026-06-21 15:40:36 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:36 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:36 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:36 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:36 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:36 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:40:36 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:40:36 +00:00 --- debug: Database Library initialized
2026-06-21 20:40:36 +00:00 --- debug: Cache Library initialized
2026-06-21 20:40:36 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:40:36 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:40:36 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:40:36 +00:00 --- debug: Session Library initialized
2026-06-21 15:40:36 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:36 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:36 -05:00 --- debug: Auth Library loaded
2026-06-21 20:40:34 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:40:34 +00:00 --- debug: Database Library initialized
2026-06-21 20:40:34 +00:00 --- debug: Cache Library initialized
2026-06-21 20:40:34 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:40:34 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:40:34 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:40:34 +00:00 --- debug: Session Library initialized
2026-06-21 15:40:34 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:34 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:34 -05:00 --- debug: Auth Library loaded
2026-06-21 15:40:34 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:34 -05:00 --- debug: Session Library initialized
2026-06-21 15:40:34 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:34 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:34 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:38 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:40:38 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:40:38 +00:00 --- debug: Database Library initialized
2026-06-21 20:40:38 +00:00 --- debug: Cache Library initialized
2026-06-21 20:40:38 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:40:38 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:40:38 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:40:38 +00:00 --- debug: Session Library initialized
2026-06-21 15:40:38 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:38 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:38 -05:00 --- debug: Auth Library loaded
2026-06-21 15:40:38 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:38 -05:00 --- debug: Session Library initialized
2026-06-21 15:40:38 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:38 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:38 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:41 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:40:42 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:40:42 +00:00 --- debug: Database Library initialized
2026-06-21 20:40:42 +00:00 --- debug: Cache Library initialized
2026-06-21 20:40:43 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:40:43 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:40:43 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:40:43 +00:00 --- debug: Session Library initialized
2026-06-21 15:40:43 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:43 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:43 -05:00 --- debug: Auth Library loaded
2026-06-21 20:40:45 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:40:45 +00:00 --- debug: Database Library initialized
2026-06-21 20:40:46 +00:00 --- debug: Cache Library initialized
2026-06-21 20:40:46 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:40:46 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:40:46 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:40:46 +00:00 --- debug: Session Library initialized
2026-06-21 15:40:46 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:46 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:46 -05:00 --- debug: Auth Library loaded
2026-06-21 15:40:46 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:46 -05:00 --- debug: Session Library initialized
2026-06-21 15:40:46 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:46 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:46 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:49 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:40:49 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:40:49 +00:00 --- debug: Database Library initialized
2026-06-21 20:40:49 +00:00 --- debug: Cache Library initialized
2026-06-21 20:40:50 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:40:50 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:40:50 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:40:50 +00:00 --- debug: Session Library initialized
2026-06-21 15:40:50 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:50 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:50 -05:00 --- debug: Auth Library loaded
2026-06-21 20:40:54 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:40:54 +00:00 --- debug: Database Library initialized
2026-06-21 20:40:54 +00:00 --- debug: Cache Library initialized
2026-06-21 20:40:54 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:40:54 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:40:54 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:40:54 +00:00 --- debug: Session Library initialized
2026-06-21 15:40:54 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:54 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:54 -05:00 --- debug: Auth Library loaded
2026-06-21 15:40:54 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:54 -05:00 --- debug: Session Library initialized
2026-06-21 15:40:54 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:54 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:54 -05:00 --- debug: Cache Library initialized
2026-06-21 15:40:54 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:54 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:54 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:54 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:54 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:40:54 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:40:55 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:40:55 +00:00 --- debug: Database Library initialized
2026-06-21 20:40:55 +00:00 --- debug: Cache Library initialized
2026-06-21 20:40:55 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:40:55 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:40:55 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:40:55 +00:00 --- debug: Session Library initialized
2026-06-21 15:40:55 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:40:55 -05:00 --- debug: Database Library initialized
2026-06-21 15:40:55 -05:00 --- debug: Auth Library loaded
2026-06-21 20:41:19 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:41:19 +00:00 --- debug: Database Library initialized
2026-06-21 20:41:19 +00:00 --- debug: Cache Library initialized
2026-06-21 20:41:19 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:41:19 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:41:19 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:41:19 +00:00 --- debug: Session Library initialized
2026-06-21 15:41:19 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:41:19 -05:00 --- debug: Database Library initialized
2026-06-21 15:41:19 -05:00 --- debug: Auth Library loaded
2026-06-21 15:41:19 -05:00 --- debug: Cache Library initialized
2026-06-21 15:41:19 -05:00 --- debug: Session Library initialized
2026-06-21 15:41:19 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:41:19 -05:00 --- debug: Database Library initialized
2026-06-21 15:41:19 -05:00 --- debug: Cache Library initialized
2026-06-21 15:41:19 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:19 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:19 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:19 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:19 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:19 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:41:19 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:41:19 +00:00 --- debug: Database Library initialized
2026-06-21 20:41:19 +00:00 --- debug: Cache Library initialized
2026-06-21 20:41:19 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:41:19 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:41:19 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:41:19 +00:00 --- debug: Session Library initialized
2026-06-21 15:41:19 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:41:19 -05:00 --- debug: Database Library initialized
2026-06-21 15:41:19 -05:00 --- debug: Auth Library loaded
2026-06-21 20:41:21 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:41:21 +00:00 --- debug: Database Library initialized
2026-06-21 20:41:21 +00:00 --- debug: Cache Library initialized
2026-06-21 20:41:21 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:41:21 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:41:21 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:41:21 +00:00 --- debug: Session Library initialized
2026-06-21 15:41:21 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:41:21 -05:00 --- debug: Database Library initialized
2026-06-21 15:41:21 -05:00 --- debug: Auth Library loaded
2026-06-21 15:41:21 -05:00 --- debug: Cache Library initialized
2026-06-21 15:41:21 -05:00 --- debug: Session Library initialized
2026-06-21 15:41:21 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:41:21 -05:00 --- debug: Database Library initialized
2026-06-21 15:41:21 -05:00 --- debug: Cache Library initialized
2026-06-21 15:41:21 -05:00 --- debug: :::::MMM  get_oldest_report_timestamp (models incident)
2026-06-21 15:41:21 -05:00 --- debug: :::::MMM  get_latest_report_timestamp (models incident)
2026-06-21 15:41:21 -05:00 --- alert: admin::permissions() in deprecated and replaced by Auth::has_permission()
2026-06-21 15:41:21 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-21 15:41:21 -05:00 --- debug: :::::MMM   Count query   (models incident)
2026-06-21 15:41:21 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-21 15:41:21 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE 1=1 ORDER BY i.incident_date DESC 
2026-06-21 15:41:21 -05:00 --- debug: Pagination Library initialized
2026-06-21 15:41:21 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-21 15:41:21 -05:00 --- debug: :::::MMM  Normal query       (models incident)
2026-06-21 15:41:21 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-21 15:41:21 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE 1=1 ORDER BY i.incident_date DESC LIMIT 0, 50
2026-06-21 15:41:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:21 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:21 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:41:21 -05:00 --- debug: Database Library initialized
2026-06-21 15:41:21 -05:00 --- debug: :::::::::::::::: count
2026-06-21 15:41:21 -05:00 --- debug: 
2026-06-21 15:41:21 -05:00 --- debug: :::::::::::::::: CONSULTA SQL EN EL ELSE
2026-06-21 15:41:21 -05:00 --- debug: SELECT c.id, c.parent_id, c.category_title, c.category_color, c.category_image, c.category_image_thumb FROM category c LEFT JOIN category c_parent ON (c.parent_id = c_parent.id) WHERE 1=1 ORDER BY c.category_position ASC
2026-06-21 15:41:21 -05:00 --- info: Missing i18n entry ui_main.web for language en_US
2026-06-21 15:41:21 -05:00 --- info: Missing i18n entry ui_main.keywords for language en_US
2026-06-21 15:41:21 -05:00 --- info: Missing i18n entry reports.documento for language en_US
2026-06-21 20:41:21 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:41:21 +00:00 --- debug: Database Library initialized
2026-06-21 20:41:21 +00:00 --- debug: Cache Library initialized
2026-06-21 20:41:21 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:41:21 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:41:21 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:41:21 +00:00 --- debug: Session Library initialized
2026-06-21 15:41:21 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:41:21 -05:00 --- debug: Database Library initialized
2026-06-21 15:41:21 -05:00 --- debug: Auth Library loaded
2026-06-21 20:41:23 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:41:23 +00:00 --- debug: Database Library initialized
2026-06-21 20:41:23 +00:00 --- debug: Cache Library initialized
2026-06-21 20:41:23 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:41:23 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:41:23 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:41:23 +00:00 --- debug: Session Library initialized
2026-06-21 15:41:23 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:41:23 -05:00 --- debug: Database Library initialized
2026-06-21 15:41:23 -05:00 --- debug: Auth Library loaded
2026-06-21 15:41:23 -05:00 --- debug: Cache Library initialized
2026-06-21 15:41:23 -05:00 --- debug: Session Library initialized
2026-06-21 15:41:23 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:41:23 -05:00 --- debug: Database Library initialized
2026-06-21 15:41:23 -05:00 --- debug: Cache Library initialized
2026-06-21 15:41:23 -05:00 --- debug: Pagination Library initialized
2026-06-21 15:41:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:23 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 20:41:24 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:41:24 +00:00 --- debug: Database Library initialized
2026-06-21 20:41:24 +00:00 --- debug: Cache Library initialized
2026-06-21 20:41:24 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:41:24 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:41:24 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:41:24 +00:00 --- debug: Session Library initialized
2026-06-21 15:41:24 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:41:24 -05:00 --- debug: Database Library initialized
2026-06-21 15:41:24 -05:00 --- debug: Auth Library loaded
2026-06-21 20:41:25 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:41:25 +00:00 --- debug: Database Library initialized
2026-06-21 20:41:25 +00:00 --- debug: Cache Library initialized
2026-06-21 20:41:25 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:41:25 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:41:25 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:41:25 +00:00 --- debug: Session Library initialized
2026-06-21 15:41:25 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:41:25 -05:00 --- debug: Database Library initialized
2026-06-21 15:41:25 -05:00 --- debug: Auth Library loaded
2026-06-21 15:41:25 -05:00 --- debug: Cache Library initialized
2026-06-21 15:41:25 -05:00 --- debug: Session Library initialized
2026-06-21 15:41:25 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:41:25 -05:00 --- debug: Database Library initialized
2026-06-21 15:41:25 -05:00 --- debug: Cache Library initialized
2026-06-21 15:41:25 -05:00 --- info: Missing i18n entry report.format.required for language en_US
2026-06-21 15:41:25 -05:00 --- info: Missing i18n entry report.data_accion.required for language en_US
2026-06-21 15:41:25 -05:00 --- info: Missing i18n entry report.data_accion.between for language en_US
2026-06-21 15:41:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:25 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:25 -05:00 --- info: Missing i18n entry ui_admin.select_download_format for language en_US
2026-06-21 20:41:25 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:41:25 +00:00 --- debug: Database Library initialized
2026-06-21 20:41:25 +00:00 --- debug: Cache Library initialized
2026-06-21 20:41:25 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:41:25 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:41:25 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:41:25 +00:00 --- debug: Session Library initialized
2026-06-21 15:41:25 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:41:25 -05:00 --- debug: Database Library initialized
2026-06-21 15:41:25 -05:00 --- debug: Auth Library loaded
2026-06-21 20:41:29 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:41:29 +00:00 --- debug: Database Library initialized
2026-06-21 20:41:29 +00:00 --- debug: Cache Library initialized
2026-06-21 20:41:29 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:41:29 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:41:29 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:41:29 +00:00 --- debug: Session Library initialized
2026-06-21 15:41:29 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:41:29 -05:00 --- debug: Database Library initialized
2026-06-21 15:41:29 -05:00 --- debug: Auth Library loaded
2026-06-21 15:41:29 -05:00 --- debug: Cache Library initialized
2026-06-21 15:41:29 -05:00 --- debug: Session Library initialized
2026-06-21 15:41:29 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:41:29 -05:00 --- debug: Database Library initialized
2026-06-21 15:41:29 -05:00 --- debug: Cache Library initialized
2026-06-21 15:41:29 -05:00 --- debug: :::::MMM  get_oldest_report_timestamp (models incident)
2026-06-21 15:41:29 -05:00 --- debug: :::::MMM  get_latest_report_timestamp (models incident)
2026-06-21 15:41:29 -05:00 --- alert: admin::permissions() in deprecated and replaced by Auth::has_permission()
2026-06-21 15:41:29 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-21 15:41:29 -05:00 --- debug: :::::MMM   Count query   (models incident)
2026-06-21 15:41:29 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-21 15:41:29 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT COUNT(DISTINCT i.id) as report_count FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE 1=1 ORDER BY i.incident_date DESC 
2026-06-21 15:41:29 -05:00 --- debug: Pagination Library initialized
2026-06-21 15:41:29 -05:00 --- debug: :::::MMM  get_incidents (models incident)
2026-06-21 15:41:29 -05:00 --- debug: :::::MMM  Normal query       (models incident)
2026-06-21 15:41:29 -05:00 --- debug: :::::MMM   Check if all the parameters exist   (models incident)SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) 
2026-06-21 15:41:29 -05:00 --- debug: :::::MMM  SQL  (models incident) SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude FROM incident i LEFT JOIN location l ON (i.location_id = l.id) LEFT JOIN incident_category ic ON (ic.incident_id = i.id) LEFT JOIN category c ON (ic.category_id = c.id) WHERE 1=1 ORDER BY i.incident_date DESC LIMIT 0, 50
2026-06-21 15:41:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:29 -05:00 --- info: Missing i18n entry core.text_direction for language en_US
2026-06-21 15:41:29 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:41:29 -05:00 --- debug: Database Library initialized
2026-06-21 15:41:29 -05:00 --- debug: :::::::::::::::: count
2026-06-21 15:41:29 -05:00 --- debug: 
2026-06-21 15:41:29 -05:00 --- debug: :::::::::::::::: CONSULTA SQL EN EL ELSE
2026-06-21 15:41:29 -05:00 --- debug: SELECT c.id, c.parent_id, c.category_title, c.category_color, c.category_image, c.category_image_thumb FROM category c LEFT JOIN category c_parent ON (c.parent_id = c_parent.id) WHERE 1=1 ORDER BY c.category_position ASC
2026-06-21 15:41:29 -05:00 --- info: Missing i18n entry ui_main.web for language en_US
2026-06-21 15:41:29 -05:00 --- info: Missing i18n entry ui_main.keywords for language en_US
2026-06-21 15:41:29 -05:00 --- info: Missing i18n entry reports.documento for language en_US
2026-06-21 20:41:30 +00:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 20:41:30 +00:00 --- debug: Database Library initialized
2026-06-21 20:41:30 +00:00 --- debug: Cache Library initialized
2026-06-21 20:41:30 +00:00 --- debug: Global GET, POST and COOKIE data sanitized
2026-06-21 20:41:30 +00:00 --- debug: Encrypt Library initialized
2026-06-21 20:41:30 +00:00 --- debug: Session Database Driver Initialized
2026-06-21 20:41:30 +00:00 --- debug: Session Library initialized
2026-06-21 15:41:30 -05:00 --- debug: MySQLi Database Driver Initialized
2026-06-21 15:41:30 -05:00 --- debug: Database Library initialized
2026-06-21 15:41:30 -05:00 --- debug: Auth Library loaded
