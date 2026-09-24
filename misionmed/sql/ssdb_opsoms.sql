# MySQL-Front 5.1  (Build 4.13)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;


# Host: 192.168.1.61    Database: ssdb_opsoms
# ------------------------------------------------------
# Server version 5.5.54-0ubuntu0.14.04.1

#
# Source for table actions
#

CREATE TABLE `actions` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(75) CHARACTER SET latin1 NOT NULL,
  `qualifiers` text CHARACTER SET latin1 NOT NULL,
  `response` varchar(75) CHARACTER SET latin1 NOT NULL,
  `response_vars` text CHARACTER SET latin1 NOT NULL,
  `active` tinyint(4) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores user defined actions triggered by certain events';

#
# Dumping data for table actions
#


#
# Source for table actions_log
#

CREATE TABLE `actions_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Stores a log of triggered actions';

#
# Dumping data for table actions_log
#


#
# Source for table alert
#

CREATE TABLE `alert` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `alert_type` tinyint(4) NOT NULL COMMENT '1 - MOBILE, 2 - EMAIL',
  `alert_recipient` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `alert_code` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `alert_confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `alert_lat` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `alert_lon` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `alert_radius` tinyint(4) NOT NULL DEFAULT '20',
  `alert_ip` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores alerts subscribers information';

#
# Dumping data for table alert
#

INSERT INTO `alert` VALUES (1,1,2,'cadic.tester@gmail.com','Mqmp1NoSuZEEv3wIlc7w',1,'4.673708972048877','-73.32161665475269',20,NULL);
INSERT INTO `alert` VALUES (2,1,2,'cadic.tester@gmail.com','7hsQQABjP1FhLwsZl2g1',1,'6.2790741','-75.5887669',20,NULL);

#
# Source for table alert_category
#

CREATE TABLE `alert_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alert_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Stores subscriber alert categories';

#
# Dumping data for table alert_category
#

INSERT INTO `alert_category` VALUES (1,1,7);
INSERT INTO `alert_category` VALUES (2,1,8);
INSERT INTO `alert_category` VALUES (3,1,3);
INSERT INTO `alert_category` VALUES (4,1,4);
INSERT INTO `alert_category` VALUES (5,1,5);
INSERT INTO `alert_category` VALUES (6,1,6);
INSERT INTO `alert_category` VALUES (7,2,7);
INSERT INTO `alert_category` VALUES (8,2,8);
INSERT INTO `alert_category` VALUES (9,2,3);
INSERT INTO `alert_category` VALUES (10,2,4);
INSERT INTO `alert_category` VALUES (11,2,5);
INSERT INTO `alert_category` VALUES (12,2,6);

#
# Source for table alert_sent
#

CREATE TABLE `alert_sent` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL,
  `alert_id` bigint(20) unsigned NOT NULL,
  `alert_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Stores a log of alerts sent out to subscribers';

#
# Dumping data for table alert_sent
#

INSERT INTO `alert_sent` VALUES (1,1,2,'2020-08-01 12:33:31');
INSERT INTO `alert_sent` VALUES (2,1,2,'2020-08-01 12:34:14');
INSERT INTO `alert_sent` VALUES (3,1,2,'2020-08-01 12:34:23');

#
# Source for table analysis
#

CREATE TABLE `analysis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` int(11) NOT NULL COMMENT 'incident_id of the new report that is created',
  `user_id` int(11) NOT NULL COMMENT 'user_id of the user that performed this assessment',
  `analysis_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table analysis
#


#
# Source for table analysis_incident
#

CREATE TABLE `analysis_incident` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `analysis_id` int(11) NOT NULL,
  `incident_id` int(11) NOT NULL COMMENT 'incident_id''s of the child reports that belong to this analysis',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table analysis_incident
#


#
# Source for table api_banned
#

CREATE TABLE `api_banned` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `banned_ipaddress` varchar(50) CHARACTER SET latin1 NOT NULL,
  `banned_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='For logging banned API IP addresses';

#
# Dumping data for table api_banned
#


#
# Source for table api_log
#

CREATE TABLE `api_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_task` varchar(10) CHARACTER SET latin1 NOT NULL,
  `api_parameters` varchar(100) CHARACTER SET latin1 NOT NULL,
  `api_records` tinyint(11) NOT NULL,
  `api_ipaddress` varchar(50) CHARACTER SET latin1 NOT NULL,
  `api_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='For logging API activities';

#
# Dumping data for table api_log
#

INSERT INTO `api_log` VALUES (19,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',0,'181.135.39.4','2020-06-11 21:16:38');
INSERT INTO `api_log` VALUES (20,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',0,'181.135.39.4','2020-06-11 21:18:12');
INSERT INTO `api_log` VALUES (21,'incidents','a:1:{i:0;s:4:\"task\";}',0,'181.135.39.4','2020-06-11 21:18:19');
INSERT INTO `api_log` VALUES (22,'incidents','a:1:{i:0;s:4:\"task\";}',0,'181.135.39.4','2020-06-11 21:22:17');
INSERT INTO `api_log` VALUES (23,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',0,'181.135.39.4','2020-06-11 21:22:32');
INSERT INTO `api_log` VALUES (24,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',1,'181.135.39.4','2020-06-11 21:28:50');
INSERT INTO `api_log` VALUES (25,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',1,'181.135.39.4','2020-06-11 21:35:44');
INSERT INTO `api_log` VALUES (26,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',1,'181.135.39.4','2020-06-11 21:35:52');
INSERT INTO `api_log` VALUES (27,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',0,'181.135.39.4','2020-06-11 21:38:17');
INSERT INTO `api_log` VALUES (28,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',0,'181.135.39.4','2020-06-11 21:40:11');
INSERT INTO `api_log` VALUES (29,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',1,'181.135.39.4','2020-06-11 21:40:54');
INSERT INTO `api_log` VALUES (30,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',1,'181.135.39.4','2020-06-11 21:43:10');
INSERT INTO `api_log` VALUES (31,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',0,'181.135.39.4','2020-06-11 22:08:51');
INSERT INTO `api_log` VALUES (32,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',1,'181.135.39.4','2020-06-11 22:09:26');
INSERT INTO `api_log` VALUES (33,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',1,'181.135.39.4','2020-06-11 22:14:37');
INSERT INTO `api_log` VALUES (34,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',1,'181.135.39.4','2020-06-11 22:15:48');
INSERT INTO `api_log` VALUES (35,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',0,'181.135.39.4','2020-06-11 22:15:53');
INSERT INTO `api_log` VALUES (36,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',1,'181.135.39.4','2020-06-11 22:15:59');
INSERT INTO `api_log` VALUES (37,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',1,'181.135.39.4','2020-06-11 22:17:05');
INSERT INTO `api_log` VALUES (38,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',0,'181.135.39.4','2020-06-11 22:17:10');
INSERT INTO `api_log` VALUES (39,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',0,'181.135.39.4','2020-06-11 22:23:29');
INSERT INTO `api_log` VALUES (40,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',0,'181.135.39.4','2020-06-11 22:23:56');
INSERT INTO `api_log` VALUES (41,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',20,'181.135.39.4','2020-06-12 22:30:03');
INSERT INTO `api_log` VALUES (42,'incidents','a:3:{i:0;s:4:\"task\";i:1;s:2:\"by\";i:2;s:4:\"resp\";}',20,'181.135.39.4','2020-06-12 22:32:40');
INSERT INTO `api_log` VALUES (43,'incidents','a:3:{i:0;s:4:\"task\";i:1;s:2:\"by\";i:2;s:4:\"resp\";}',20,'181.135.39.4','2020-06-12 22:32:44');
INSERT INTO `api_log` VALUES (44,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',20,'181.62.42.123','2020-06-13 06:41:01');
INSERT INTO `api_log` VALUES (45,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',20,'181.62.42.123','2020-06-13 06:55:18');
INSERT INTO `api_log` VALUES (46,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',20,'181.62.42.123','2020-06-13 06:59:29');
INSERT INTO `api_log` VALUES (47,'incidents','a:3:{i:0;s:4:\"task\";i:1;s:2:\"by\";i:2;s:2:\"id\";}',0,'181.62.42.123','2020-06-13 06:59:59');
INSERT INTO `api_log` VALUES (48,'incidents','a:3:{i:0;s:4:\"task\";i:1;s:2:\"by\";i:2;s:2:\"id\";}',0,'181.62.42.123','2020-06-13 07:00:11');
INSERT INTO `api_log` VALUES (49,'incidents','a:3:{i:0;s:4:\"task\";i:1;s:2:\"by\";i:2;s:2:\"id\";}',0,'181.62.42.123','2020-06-13 07:00:37');
INSERT INTO `api_log` VALUES (50,'incidents','a:3:{i:0;s:4:\"task\";i:1;s:2:\"by\";i:2;s:2:\"id\";}',20,'181.62.42.123','2020-06-13 07:01:16');
INSERT INTO `api_log` VALUES (51,'incidents','a:3:{i:0;s:4:\"task\";i:1;s:2:\"by\";i:2;s:2:\"id\";}',20,'181.62.42.123','2020-06-13 07:02:09');
INSERT INTO `api_log` VALUES (52,'incidents','a:3:{i:0;s:4:\"task\";i:1;s:2:\"by\";i:2;s:2:\"id\";}',20,'181.62.42.123','2020-06-13 07:02:38');
INSERT INTO `api_log` VALUES (53,'incidents','a:3:{i:0;s:4:\"task\";i:1;s:2:\"by\";i:2;s:2:\"id\";}',100,'181.62.42.123','2020-06-13 07:03:54');
INSERT INTO `api_log` VALUES (54,'incidents','a:2:{i:0;s:4:\"task\";i:1;s:2:\"by\";}',100,'181.62.42.123','2020-06-13 07:10:05');
INSERT INTO `api_log` VALUES (55,'incidents','a:3:{i:0;s:4:\"task\";i:1;s:2:\"by\";i:2;s:2:\"id\";}',100,'181.62.42.123','2020-06-13 07:11:51');
INSERT INTO `api_log` VALUES (56,'categories','a:1:{i:0;s:4:\"task\";}',4,'181.135.39.4','2020-07-03 19:28:33');
INSERT INTO `api_log` VALUES (57,'categories','a:1:{i:0;s:4:\"task\";}',4,'181.63.231.94','2020-07-03 20:47:47');
INSERT INTO `api_log` VALUES (58,'categories','a:1:{i:0;s:4:\"task\";}',4,'181.63.231.94','2020-07-03 20:47:57');
INSERT INTO `api_log` VALUES (59,'categories','a:1:{i:0;s:4:\"task\";}',4,'181.63.231.94','2020-07-03 20:52:11');
INSERT INTO `api_log` VALUES (60,'incidents','a:3:{i:0;s:4:\"task\";i:1;s:2:\"by\";i:2;s:2:\"id\";}',3,'181.62.42.123','2020-07-28 18:51:33');

#
# Source for table api_settings
#

CREATE TABLE `api_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_record_limit` int(11) NOT NULL DEFAULT '20',
  `max_record_limit` int(11) DEFAULT NULL,
  `max_requests_per_ip_address` int(11) DEFAULT NULL,
  `max_requests_quota_basis` int(11) DEFAULT NULL,
  `modification_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='For storing API logging settings';

#
# Dumping data for table api_settings
#

INSERT INTO `api_settings` VALUES (1,100,NULL,NULL,NULL,'2020-06-13 07:03:10');

#
# Source for table badge
#

CREATE TABLE `badge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET latin1 NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores description of badges to be assigned';

#
# Dumping data for table badge
#


#
# Source for table badge_users
#

CREATE TABLE `badge_users` (
  `user_id` int(11) unsigned NOT NULL,
  `badge_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Stores assigned badge information';

#
# Dumping data for table badge_users
#


#
# Source for table category
#

CREATE TABLE `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(10) NOT NULL DEFAULT 'en_US',
  `category_position` tinyint(4) NOT NULL DEFAULT '0',
  `category_title` varchar(255) DEFAULT NULL,
  `category_description` text,
  `category_color` varchar(20) DEFAULT NULL,
  `category_image` varchar(255) DEFAULT NULL,
  `category_image_thumb` varchar(255) DEFAULT NULL,
  `category_visible` tinyint(4) NOT NULL DEFAULT '1',
  `category_trusted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_visible` (`category_visible`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COMMENT='Holds information about categories defined for a deployment';

#
# Dumping data for table category
#

INSERT INTO `category` VALUES (7,0,'es_CO',0,'COVID-19','Coronavirus por SARS-CoV-2 _ CIE-10?: ?B97.2','db2323',NULL,NULL,1,0);
INSERT INTO `category` VALUES (9,0,'en_US',5,'Seguimiento COVID-19','Diagnóstico, toma de muestras para confirmación de casos por Coronavirus por SARS-CoV-2','3898ff',NULL,NULL,1,0);
INSERT INTO `category` VALUES (10,0,'en_US',10,'Ev. Transmisibles','Eventos en Salud','a1bd02',NULL,NULL,1,0);
INSERT INTO `category` VALUES (11,0,'en_US',34,'Ev. no transmisibles','Eventos en Salud','dbb004',NULL,NULL,1,0);
INSERT INTO `category` VALUES (15,10,'en_US',13,'Dengue','Enfermedades transmitidas por vectores','a17132',NULL,NULL,1,0);
INSERT INTO `category` VALUES (19,10,'en_US',11,'Agresión por APTR','Exposición rábica, accidente rábico por contacto con APTR (animal potencialmente transmisor de Rabia)','a17132',NULL,NULL,1,0);
INSERT INTO `category` VALUES (23,10,'en_US',31,'Tuberculosis','Enfermedad de transmisión aérea _ Enfermedad causada por Mycobacterium tuberculosis, una bacteria que casi siempre afecta a los pulmones','fc8960',NULL,NULL,1,0);
INSERT INTO `category` VALUES (24,10,'en_US',32,'Varicela','Infección causada por el virus varicela zóster (VVZ','fc8960',NULL,NULL,1,0);
INSERT INTO `category` VALUES (28,10,'en_US',22,'Leishmaniasis','Enfermedades transmitidas por vectores','a17132',NULL,NULL,1,0);
INSERT INTO `category` VALUES (30,10,'en_US',33,'VIH','Infección de transmisión sexual','fc8960',NULL,NULL,1,0);
INSERT INTO `category` VALUES (32,10,'en_US',20,'Hepatitis B','Enfermedades prevenibles por vacunación','a17132',NULL,NULL,1,0);
INSERT INTO `category` VALUES (33,10,'en_US',21,'IRAG','Infección Respiratoria Aguda Grave _ Enfermedades de transmisión aérea','a17132',NULL,NULL,1,0);
INSERT INTO `category` VALUES (36,7,'es_CO',1,'Hospitalizados','Pacientes hospitalizados con infección por SARS-CoV-2','00c9e3',NULL,NULL,1,0);
INSERT INTO `category` VALUES (37,7,'es_CO',2,'En casa','Pacientes que solo presentan una enfermedad leve por COVID-19 y pueden reuperarse en casa','038037',NULL,NULL,1,0);
INSERT INTO `category` VALUES (38,7,'es_CO',3,'Recuperados','Posterior al contagio se toma nueva prueba confirmando la recuperación por Coronavirus SARS-CoV-22','6ff038',NULL,NULL,1,0);
INSERT INTO `category` VALUES (39,7,'es_CO',4,'Fallecidos','Confirmación de muerte por Coronavirus SARS-CoV-2','c246c2',NULL,NULL,1,0);
INSERT INTO `category` VALUES (40,9,'es_CO',6,'Reportes','Seguimiento, toma de muestra con resultado POSITIVO para Coronavirus por SARS-CoV-2','fc3f3f',NULL,NULL,1,0);
INSERT INTO `category` VALUES (41,9,'es_CO',7,'Descartados','Seguimiento, toma de muestra con resultado NEGATIVO para Coronavirus por SARS-CoV-2','136ef7',NULL,NULL,1,0);
INSERT INTO `category` VALUES (42,9,'es_CO',8,'En estudio','Seguimiento, toma de muestra con resultado EN ESPERA para Coronavirus por SARS-CoV-2','ffa200',NULL,NULL,1,0);
INSERT INTO `category` VALUES (43,9,'es_CO',9,'No procesado','Seguimiento, toma de muestra para COVID-19 por SARS-CoV-2 con error  NO PROCESADO','64bdae',NULL,NULL,1,0);
INSERT INTO `category` VALUES (44,10,'es_CO',12,'Chikungunya','Enfermedades Transmitidas por Vectores','a17132',NULL,NULL,1,0);
INSERT INTO `category` VALUES (45,10,'es_CO',14,'Difteria','Enfermedades prevenibles por vacunación','a17132',NULL,NULL,1,0);
INSERT INTO `category` VALUES (46,10,'es_CO',15,'Encefalitis Equina','Evento transmisible','a17132',NULL,NULL,1,0);
INSERT INTO `category` VALUES (47,10,'es_CO',16,'EDA','Enfermedad Diarreica Aguda','a17132',NULL,NULL,1,0);
INSERT INTO `category` VALUES (48,10,'es_CO',17,'ETA','Enfermedades transmitidas por alimentos _ Enfermedades de origen hídrico','a17132',NULL,NULL,1,0);
INSERT INTO `category` VALUES (49,10,'es_CO',18,'Fiebre amarilla','Enfermedades Transmitidas por Vectores','a17132',NULL,NULL,1,0);
INSERT INTO `category` VALUES (50,10,'es_CO',19,'Hepatitis A','Enfermedades de origen hídrico','a17132',NULL,NULL,1,0);
INSERT INTO `category` VALUES (51,10,'es_CO',23,'Malaria complicada','Enfermedades transmitidas por vectores','613403',NULL,NULL,1,0);
INSERT INTO `category` VALUES (52,10,'es_CO',24,'Malaria falciparum','Enfermedades transmitidas por vectores','613403',NULL,NULL,1,0);
INSERT INTO `category` VALUES (53,10,'es_CO',25,'Malaria mixta','Enfermedades transmitidas por vectores','613403',NULL,NULL,1,0);
INSERT INTO `category` VALUES (54,10,'es_CO',26,'Malaria Vivax','Enfermedades transmitidas por vectores','613403',NULL,NULL,1,0);
INSERT INTO `category` VALUES (55,10,'es_CO',27,'Mortalidad por Malaria','Enfermedades transmitidas por vectores','613403',NULL,NULL,1,0);
INSERT INTO `category` VALUES (56,10,'es_CO',28,'Parotiditis','Eventos Inmunoprevenibles','fc8960',NULL,NULL,1,0);
INSERT INTO `category` VALUES (57,10,'es_CO',29,'Rubeola','Enfermedades prevenibles por vacunación','fc8960',NULL,NULL,1,0);
INSERT INTO `category` VALUES (58,10,'es_CO',30,'Sarampión','Enfermedades prevenibles por vacunación','fc8960',NULL,NULL,1,0);
INSERT INTO `category` VALUES (59,10,'es_CO',51,'Zika','Enfermedades Transmitidas por Vectores','fc8960',NULL,NULL,1,0);
INSERT INTO `category` VALUES (60,11,'es_CO',36,'Accidente ofídico','Mordedura de serpiente','ded309',NULL,NULL,1,0);
INSERT INTO `category` VALUES (61,11,'es_CO',37,'Accidente Rábico','Mordedura de perros, murciélagos o animal ponzoñoso','ded309',NULL,NULL,1,0);
INSERT INTO `category` VALUES (62,11,'es_CO',38,'Defectos congénitos','Un defecto congénito es un problema que ocurre mientras un bebé se desarrolla dentro del cuerpo de su madre','ded309',NULL,NULL,1,0);
INSERT INTO `category` VALUES (63,0,'es_CO',39,'Gestantes','Mortalidad, Morbilidad materna extrema, Sífilis, Hepatitis B, VIH, Malaria','a8007e',NULL,NULL,1,0);
INSERT INTO `category` VALUES (64,63,'es_CO',40,'Bajo peso gestacional','Esta afección se denomina restricción en el crecimiento intrauterino','ff24c5',NULL,NULL,1,0);
INSERT INTO `category` VALUES (65,63,'es_CO',41,'Captación precoz','Antes de la semana 10','ff24c5',NULL,NULL,1,0);
INSERT INTO `category` VALUES (66,63,'es_CO',42,'Mortalidad durante el embarazo','Mortalidad materna durante el embarazo','ff24c5',NULL,NULL,1,0);
INSERT INTO `category` VALUES (67,63,'es_CO',43,'Mortalidad durante el parto','Mortalidad materna durante el part','ff24c5',NULL,NULL,1,0);
INSERT INTO `category` VALUES (68,63,'es_CO',44,'Mortalidad en el puerperio','Mortalidad Materna en el puerperio','ff24c5',NULL,NULL,1,0);
INSERT INTO `category` VALUES (69,63,'es_CO',45,'Mortalidad Materna','Mortalidad materna en estudi','ff24c5',NULL,NULL,1,0);
INSERT INTO `category` VALUES (70,63,'es_CO',46,'Mortalidad Materna tardía','Mortalidad Materna tardía, entre los 42 días hasta 12 meses','ff24c5',NULL,NULL,1,0);
INSERT INTO `category` VALUES (71,63,'es_CO',47,'Mortalidad Perinatal','Mortalidad perinatal en estudio','ff24c5',NULL,NULL,1,0);
INSERT INTO `category` VALUES (72,63,'es_CO',48,'Mortalidad perinatal AP','Mortalidad perinatal Ante parto','ff24c5',NULL,NULL,1,0);
INSERT INTO `category` VALUES (73,63,'es_CO',49,'Mortalidad perinatal IP','Mortalidad perinatal Intra parto','ff24c5',NULL,NULL,1,0);
INSERT INTO `category` VALUES (74,63,'es_CO',50,'Morbilidad Materna Extrema','Una mujer que casi muere, pero sobrevivió a una complicación ocurrida durante el embarazo, el parto o dentro de los 42 días siguientes a la termina.','ff24c5',NULL,NULL,1,0);
INSERT INTO `category` VALUES (75,63,'es_CO',51,'Mortalidad por VIH','Mortalidad por VIH','ff24c5',NULL,NULL,1,0);
INSERT INTO `category` VALUES (76,63,'es_CO',52,'Sífilis Gestacional','Infección del recién nacido transmitida por su madre infectada con una bacteria llamada Treponema Pallidum','ff24c5',NULL,NULL,1,0);
INSERT INTO `category` VALUES (77,63,'es_CO',53,'Sífilis Congénita','La sífilis congénita es causada por la bacteria Treponema pallidum','ff24c5',NULL,NULL,1,0);
INSERT INTO `category` VALUES (78,63,'es_CO',54,'Hepatitis B ®','Hepatitis B en gestantes','ff24c5',NULL,NULL,1,0);
INSERT INTO `category` VALUES (79,63,'es_CO',55,'VIH ®','VIH en gestantes','ff24c5',NULL,NULL,1,0);
INSERT INTO `category` VALUES (80,63,'es_CO',56,'Malaria ®','Malaria en gestantes','ff24c5',NULL,NULL,1,0);
INSERT INTO `category` VALUES (81,63,'es_CO',57,'Zika ®','Zika en gestantes','ff24c5',NULL,NULL,1,0);
INSERT INTO `category` VALUES (82,0,'es_CO',58,'Salud Infantil','Mortalidad por EDA, IRAG, Desnutrición','2076f7',NULL,NULL,1,0);
INSERT INTO `category` VALUES (83,82,'es_CO',59,'Bajo peso al nacer','Pérdida intrauterina de peso','7aa9f0',NULL,NULL,1,0);
INSERT INTO `category` VALUES (84,82,'es_CO',60,'Desnutrición aguda','Afecta el peso o se acompaña de edemas','7aa9f0',NULL,NULL,1,0);
INSERT INTO `category` VALUES (85,82,'es_CO',61,'Difteria','Enfermedad infecciosa aguda, provocada por un bacilo, que afecta a la nariz, la garganta y la laringe y produce fiebre y dificultad para respirar.','7aa9f0',NULL,NULL,1,0);
INSERT INTO `category` VALUES (86,82,'es_CO',62,'Meningitis Bacteriana','Es una infección bacteriana grave de las membranas que rodean el cerebro y la médula espinal','7aa9f0',NULL,NULL,1,0);
INSERT INTO `category` VALUES (87,82,'es_CO',63,'Mortalidad por desnutrición','Mortalidad por desnutrición','7aa9f0',NULL,NULL,1,0);
INSERT INTO `category` VALUES (88,82,'es_CO',64,'Mortalidad por EDA','Mortalidad por Enfermedad Diarreica Aguda (EDA) en menores de 5 años','7aa9f0',NULL,NULL,1,0);
INSERT INTO `category` VALUES (89,82,'es_CO',65,'Mortalidad por IRA','Mortalidad por Infección Respiratoria Aguda (IRAG) en menores de 5 años','7aa9f0',NULL,NULL,1,0);
INSERT INTO `category` VALUES (90,82,'es_CO',66,'Mortalidad Neonatal Temprana','Desde el nacimiento hasta antes de los 7 días.','7aa9f0',NULL,NULL,1,0);
INSERT INTO `category` VALUES (91,82,'es_CO',67,'Mortalidad Neonatal Tardía','Desde los 7 días hasta antes de los 28 días','7aa9f0',NULL,NULL,1,0);
INSERT INTO `category` VALUES (92,82,'es_CO',68,'Polio','La poliomielitis (polio) es una enfermedad viral, sumamente contagiosa, que afecta principalmente a los niños pequeños.','7aa9f0',NULL,NULL,1,0);
INSERT INTO `category` VALUES (93,82,'es_CO',69,'Rubeola *','Rubeola en menores, Enfermedad infecciosa provocada por un virus que se caracteriza por la aparición de manchas rosadas en la piel, algo de fiebre y el aumento de tamaño de los ganglios del cuello','7aa9f0',NULL,NULL,1,0);
INSERT INTO `category` VALUES (94,82,'es_CO',70,'Sarampión *','Sarampión en menores, Infección viral contagiosa que se distingue por un sarpullido característico','7aa9f0',NULL,NULL,1,0);
INSERT INTO `category` VALUES (95,82,'es_CO',71,'Tos ferina','La tos ferina es una enfermedad de las vías respiratorias, también conocida como tos convulsiva o Pertussis','7aa9f0',NULL,NULL,1,0);
INSERT INTO `category` VALUES (96,0,'es_CO',72,'Salud Mental','Intento de Suicidio, Intoxicación y VBG','dfed15',NULL,NULL,1,0);
INSERT INTO `category` VALUES (97,96,'es_CO',73,'Intento de Suicidio','Comportamiento suicida o acto de quitarse deliberadamente la propia vida','dfed15',NULL,NULL,1,0);
INSERT INTO `category` VALUES (98,96,'es_CO',74,'Intoxicación','eacción fisiológica causada por un veneno, o por la acción de una sustancia tóxica o en mal estado','dfed15',NULL,NULL,1,0);
INSERT INTO `category` VALUES (99,96,'es_CO',75,'VBG','Violencia Basada en Género (Intrafamiliar, sexual, abuso)','dfed15',NULL,NULL,1,0);
INSERT INTO `category` VALUES (100,0,'es_CO',76,'CRUE','Centro Regulador de Urgencias y Emergencias','178a1b',NULL,NULL,1,0);
INSERT INTO `category` VALUES (101,100,'es_CO',77,'Accidente de tránsito','Accidente de tránsito','35c425',NULL,NULL,1,0);
INSERT INTO `category` VALUES (102,100,'es_CO',78,'Accidente fluvial','Accidentes en transporte fluvial','35c425',NULL,NULL,1,0);
INSERT INTO `category` VALUES (103,100,'es_CO',79,'Otro tipo de accidente','por tropezón, deslizamiento, quemaduras, efecto toxico','35c425',NULL,NULL,1,0);
INSERT INTO `category` VALUES (104,100,'es_CO',80,'Enfermedad General','Enfermedad General','35c425',NULL,NULL,1,0);
INSERT INTO `category` VALUES (105,100,'es_CO',81,'Lesión autoinflingida','Envenenamiento, lesión por ahorcamiento, disparo u objeto cortante.','35c425',NULL,NULL,1,0);
INSERT INTO `category` VALUES (106,100,'es_CO',82,'Lesión por agresión','Herido con arma de fuego, arma blanca, sustancia corrosiva, ahorcamiento','35c425',NULL,NULL,1,0);
INSERT INTO `category` VALUES (107,0,'es_CO',83,'Vigilancia comunitaria','Vigilancia epidemiológica sindrómica en el departament','e0b700','category_107_1599426872.png','category_107_1599426872_16x16.png',1,0);
INSERT INTO `category` VALUES (108,107,'es_CO',84,'Gestores comunitarios','Líderes capacitados para realizar vigilancia epidemiológica sindrómica en el departamento','ffc508',NULL,NULL,1,0);
INSERT INTO `category` VALUES (109,107,'es_CO',85,'Salud','Situaciones especiales en salud:Síndrome febril ictérico, Síndrome febril con manifestaciones hemorrágicas, Síndrome febril con manifestaciones neurológicas, Síndrome Respiratorio Agudo, Contaminación del ambiente','ffc508',NULL,NULL,1,0);
INSERT INTO `category` VALUES (110,107,'es_CO',86,'Entorno','Situaciones relacionadas con el entorno: Contaminación del ambiente, Mortandad de animales','ffc508',NULL,NULL,1,0);
INSERT INTO `category` VALUES (111,107,'es_CO',87,'Maternidad segura','Situaciones asociadas a maternidad segura: Mortalidad Materna.','ffc508',NULL,NULL,1,0);
INSERT INTO `category` VALUES (112,107,'es_CO',88,'Niñez y nutrición','Situaciones asociadas a niñez y nutrición: Nacimiento en comunidad Desnutrición aguda en menores de 5 años','ffc508',NULL,NULL,1,0);
INSERT INTO `category` VALUES (113,0,'es_CO',89,'Red Prestadora de servicios de salud','Hospitales, Centros y Puestos de Salud','00e8c9','category_113_1599427286.png','category_113_1599427286_16x16.png',1,0);
INSERT INTO `category` VALUES (114,113,'es_CO',90,'Puestos de Salud','Nivel primario de atención','28d4c9',NULL,NULL,1,0);
INSERT INTO `category` VALUES (115,113,'es_CO',91,'Centros de Salud','Nivel Básico de Atención','28d4c9',NULL,NULL,1,0);
INSERT INTO `category` VALUES (116,113,'es_CO',92,'IPS Públicas','Hospitales I, II y III Nivel de Atención','28d4c9',NULL,NULL,1,0);
INSERT INTO `category` VALUES (117,113,'es_CO',93,'IPS Privadas','Instituciones prestadoras de servicios de salud','28d4c9',NULL,NULL,1,0);
INSERT INTO `category` VALUES (118,0,'es_CO',94,'Emergencias y Desastres','Monitoreo de eventos de interés en salud','000dff','category_118_1599427453.png','category_118_1599427453_16x16.png',1,0);
INSERT INTO `category` VALUES (119,118,'es_CO',95,'Inundación','Fenómeno natural por el cual invade o cubre de agua las áreas que en condiciones normales se mantienen secas','20a9e0',NULL,NULL,1,0);
INSERT INTO `category` VALUES (120,118,'es_CO',96,'Vendaval','Viento extremadamente fuerte y violento','20a9e0',NULL,NULL,1,0);
INSERT INTO `category` VALUES (121,118,'es_CO',97,'Tormenta eléctrica','Fenómeno meteorológico caracterizado por la presencia de rayos y sus efectos sonoros en la atmósfera terrestre','20a9e0',NULL,NULL,1,0);
INSERT INTO `category` VALUES (122,118,'es_CO',98,'Incendio','Estructural o forestal','20a9e0',NULL,NULL,1,0);
INSERT INTO `category` VALUES (123,118,'es_CO',99,'Sismo','Serie de vibraciones de la superficie terrestre generadas por un movimiento brusco y repentino de las capas internas','20a9e0',NULL,NULL,1,0);
INSERT INTO `category` VALUES (124,118,'es_CO',100,'Albergues','Lugares de alojamiento a personas damnificadas','20a9e0','category_124_1599427635.png','category_124_1599427635_16x16.png',1,0);
INSERT INTO `category` VALUES (125,118,'es_CO',101,'Agua potable','Puntos de abastecimiento de agua potable.','20a9e0','category_125_1599427661.png','category_125_1599427661_16x16.png',1,0);
INSERT INTO `category` VALUES (126,118,'es_CO',102,'Necesidades','Agua, alimentos, medicamentos, kits de aseo, insumos, AT médica, AT psicosocial.','20a9e0','category_126_1599427692.png','category_126_1599427692_16x16.png',1,0);
INSERT INTO `category` VALUES (127,118,'es_CO',103,'Respuesta','Respuesta a las necesidades','20a9e0',NULL,NULL,1,0);
INSERT INTO `category` VALUES (128,0,'es_CO',104,'Ev. Población Migratoria','Monitoreo de eventos de interés en salud pública por entrada al país de personas procedentes de otros lugares','cc3d74',NULL,NULL,1,0);

#
# Source for table category_lang
#

CREATE TABLE `category_lang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL,
  `locale` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `category_title` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `category_description` text CHARACTER SET latin1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Holds translations for category titles and descriptions';

#
# Dumping data for table category_lang
#


#
# Source for table city
#

CREATE TABLE `city` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `city` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `city_lat` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `city_lon` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores cities of countries retrieved by user.';

#
# Dumping data for table city
#

INSERT INTO `city` VALUES (1,115,'Nairobi','-1.283253','36.817245');
INSERT INTO `city` VALUES (2,115,'Nakuru','-0.280272','36.071205');
INSERT INTO `city` VALUES (3,115,'Mombasa','-4.050520','39.667169');
INSERT INTO `city` VALUES (4,115,'Meru','0.049979','37.650006');
INSERT INTO `city` VALUES (5,115,'Malindi','-3.216599','40.116593');
INSERT INTO `city` VALUES (6,115,'Machakos','-1.521248','37.266088');
INSERT INTO `city` VALUES (7,115,'Kitui','-1.366600','38.016600');
INSERT INTO `city` VALUES (8,115,'Kisii','-0.669412','34.767794');
INSERT INTO `city` VALUES (9,115,'Kericho','-0.366600','35.283300');
INSERT INTO `city` VALUES (10,115,'Kakamega','0.283300','34.750000');
INSERT INTO `city` VALUES (11,115,'Garissa','-0.456710','39.640471');
INSERT INTO `city` VALUES (12,115,'Hola','-1.497681','40.034911');
INSERT INTO `city` VALUES (13,115,'Thika','-1.036648','37.077523');
INSERT INTO `city` VALUES (14,115,'Kisumu','-0.102911','34.754176');
INSERT INTO `city` VALUES (15,115,'Embu','-0.537670','37.458395');
INSERT INTO `city` VALUES (16,115,'Eldoret','0.519833','35.271548');
INSERT INTO `city` VALUES (17,49,'Cartagena','10.419584','-75.527122');
INSERT INTO `city` VALUES (18,49,'Ibagué','4.444660','-75.243001');
INSERT INTO `city` VALUES (19,49,'Santiago de Cali','3.451792','-76.532494');
INSERT INTO `city` VALUES (20,49,'Manizales','5.068110','-75.517320');
INSERT INTO `city` VALUES (21,49,'Sincelejo','9.297339','-75.392660');
INSERT INTO `city` VALUES (22,49,'Armenia','4.536307','-75.672375');
INSERT INTO `city` VALUES (23,49,'Santa Marta','11.242229','-74.205561');
INSERT INTO `city` VALUES (24,49,'Popayán','2.442018','-76.606274');
INSERT INTO `city` VALUES (25,49,'San Andrés','12.583010','-81.697568');
INSERT INTO `city` VALUES (26,49,'Pasto','1.214629','-77.278252');
INSERT INTO `city` VALUES (27,49,'Yopal','5.335666','-72.393693');
INSERT INTO `city` VALUES (28,49,'Arauca','7.082460','-70.757024');
INSERT INTO `city` VALUES (29,49,'Leticia','-4.206745','-69.938424');
INSERT INTO `city` VALUES (30,49,'Soacha','4.582128','-74.219720');
INSERT INTO `city` VALUES (31,49,'Medellín','6.244338','-75.573553');
INSERT INTO `city` VALUES (32,49,'Quibdó','5.684571','-76.654046');
INSERT INTO `city` VALUES (33,49,'Mitú','1.252327','-70.230888');
INSERT INTO `city` VALUES (34,49,'Inírida','3.865602','-67.925921');
INSERT INTO `city` VALUES (35,49,'San José del Guaviare','2.571614','-72.642651');
INSERT INTO `city` VALUES (36,49,'Duitama','5.827706','-73.033894');
INSERT INTO `city` VALUES (37,49,'Bogotá','4.598080','-74.076044');
INSERT INTO `city` VALUES (38,49,'Montería','8.755892','-75.887029');
INSERT INTO `city` VALUES (39,49,'Villavicencio','4.131511','-73.620667');
INSERT INTO `city` VALUES (40,49,'Florencia','1.615867','-75.614305');
INSERT INTO `city` VALUES (41,49,'Cúcuta','7.897146','-72.508039');
INSERT INTO `city` VALUES (42,49,'Ancuya','1.261528','-77.514748');
INSERT INTO `city` VALUES (43,49,'Buenaventura','3.889934','-77.078605');
INSERT INTO `city` VALUES (44,49,'Ocaña','8.235189','-73.353844');
INSERT INTO `city` VALUES (45,49,'El Carmen de Bolívar','9.717831','-75.123848');
INSERT INTO `city` VALUES (46,49,'Apartadó','7.884901','-76.622746');
INSERT INTO `city` VALUES (47,49,'Rionegro','6.153617','-75.374169');
INSERT INTO `city` VALUES (48,49,'Caucasia','7.987758','-75.198374');
INSERT INTO `city` VALUES (49,49,'Pereira','4.814291','-75.694645');
INSERT INTO `city` VALUES (50,49,'Bucaramanga','7.111461','-73.117287');
INSERT INTO `city` VALUES (51,49,'Riohacha','11.544634','-72.906978');
INSERT INTO `city` VALUES (52,49,'Girardot','4.306643','-74.801567');
INSERT INTO `city` VALUES (53,49,'Neiva','2.926313','-75.289173');
INSERT INTO `city` VALUES (54,49,'Sogamoso','5.714831','-72.927933');
INSERT INTO `city` VALUES (55,49,'Palmira','3.530837','-76.298805');
INSERT INTO `city` VALUES (56,49,'Barranquilla','10.979967','-74.801309');
INSERT INTO `city` VALUES (57,49,'Tunja','5.532363','-73.361362');
INSERT INTO `city` VALUES (58,49,'Villa de Leyva','5.633680','-73.523548');
INSERT INTO `city` VALUES (59,49,'Valledupar','10.477474','-73.244436');
INSERT INTO `city` VALUES (60,49,'Chiquinquirá','5.618273','-73.816748');

#
# Source for table cluster
#

CREATE TABLE `cluster` (
  `id` int(11) NOT NULL,
  `location_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `latitude_min` double NOT NULL,
  `longitude_min` double NOT NULL,
  `latitude_max` double NOT NULL,
  `longitude_max` double NOT NULL,
  `child_count` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `left_side` int(11) NOT NULL,
  `right_side` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `incident_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Stores information used for clustering of reports on the map.';

#
# Dumping data for table cluster
#


#
# Source for table comment
#

CREATE TABLE `comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT '0',
  `comment_author` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `comment_email` varchar(120) CHARACTER SET latin1 DEFAULT NULL,
  `comment_description` text CHARACTER SET latin1,
  `comment_ip` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `comment_spam` tinyint(4) NOT NULL DEFAULT '0',
  `comment_active` tinyint(4) NOT NULL DEFAULT '0',
  `comment_date` datetime DEFAULT NULL,
  `comment_date_gmt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores comments made on reports';

#
# Dumping data for table comment
#


#
# Source for table country
#

CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `country` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `capital` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `cities` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores a list of all countries and their capital cities';

#
# Dumping data for table country
#

INSERT INTO `country` VALUES (1,'AD','Andorra','Andorra la Vella',0);
INSERT INTO `country` VALUES (2,'AE','United Arab Emirates','Abu Dhabi',0);
INSERT INTO `country` VALUES (3,'AF','Afghanistan','Kabul',0);
INSERT INTO `country` VALUES (4,'AG','Antigua and Barbuda','St. John\'s',0);
INSERT INTO `country` VALUES (5,'AI','Anguilla','The Valley',0);
INSERT INTO `country` VALUES (6,'AL','Albania','Tirana',0);
INSERT INTO `country` VALUES (7,'AM','Armenia','Yerevan',0);
INSERT INTO `country` VALUES (8,'AN','Netherlands Antilles','Willemstad',0);
INSERT INTO `country` VALUES (9,'AO','Angola','Luanda',0);
INSERT INTO `country` VALUES (10,'AQ','Antarctica','',0);
INSERT INTO `country` VALUES (11,'AR','Argentina','Buenos Aires',0);
INSERT INTO `country` VALUES (12,'AS','American Samoa','Pago Pago',0);
INSERT INTO `country` VALUES (13,'AT','Austria','Vienna',0);
INSERT INTO `country` VALUES (14,'AU','Australia','Canberra',0);
INSERT INTO `country` VALUES (15,'AW','Aruba','Oranjestad',0);
INSERT INTO `country` VALUES (16,'AX','Aland Islands','Mariehamn',0);
INSERT INTO `country` VALUES (17,'AZ','Azerbaijan','Baku',0);
INSERT INTO `country` VALUES (18,'BA','Bosnia and Herzegovina','Sarajevo',0);
INSERT INTO `country` VALUES (19,'BB','Barbados','Bridgetown',0);
INSERT INTO `country` VALUES (20,'BD','Bangladesh','Dhaka',0);
INSERT INTO `country` VALUES (21,'BE','Belgium','Brussels',0);
INSERT INTO `country` VALUES (22,'BF','Burkina Faso','Ouagadougou',0);
INSERT INTO `country` VALUES (23,'BG','Bulgaria','Sofia',0);
INSERT INTO `country` VALUES (24,'BH','Bahrain','Manama',0);
INSERT INTO `country` VALUES (25,'BI','Burundi','Bujumbura',0);
INSERT INTO `country` VALUES (26,'BJ','Benin','Porto-Novo',0);
INSERT INTO `country` VALUES (27,'BL','Saint BarthÃ©lemy','Gustavia',0);
INSERT INTO `country` VALUES (28,'BM','Bermuda','Hamilton',0);
INSERT INTO `country` VALUES (29,'BN','Brunei','Bandar Seri Begawan',0);
INSERT INTO `country` VALUES (30,'BO','Bolivia','La Paz',0);
INSERT INTO `country` VALUES (31,'BR','Brazil','BrasÃ­lia',0);
INSERT INTO `country` VALUES (32,'BS','Bahamas','Nassau',0);
INSERT INTO `country` VALUES (33,'BT','Bhutan','Thimphu',0);
INSERT INTO `country` VALUES (34,'BV','Bouvet Island','',0);
INSERT INTO `country` VALUES (35,'BW','Botswana','Gaborone',0);
INSERT INTO `country` VALUES (36,'BY','Belarus','Minsk',0);
INSERT INTO `country` VALUES (37,'BZ','Belize','Belmopan',0);
INSERT INTO `country` VALUES (38,'CA','Canada','Ottawa',0);
INSERT INTO `country` VALUES (39,'CC','Cocos Islands','West Island',0);
INSERT INTO `country` VALUES (40,'CD','Democratic Republic of the Congo','Kinshasa',0);
INSERT INTO `country` VALUES (41,'CF','Central African Republic','Bangui',0);
INSERT INTO `country` VALUES (42,'CG','Congo Brazzavile','Brazzaville',0);
INSERT INTO `country` VALUES (43,'CH','Switzerland','Berne',0);
INSERT INTO `country` VALUES (44,'CI','Ivory Coast','Yamoussoukro',0);
INSERT INTO `country` VALUES (45,'CK','Cook Islands','Avarua',0);
INSERT INTO `country` VALUES (46,'CL','Chile','Santiago',0);
INSERT INTO `country` VALUES (47,'CM','Cameroon','YaoundÃ©',0);
INSERT INTO `country` VALUES (48,'CN','China','Beijing',0);
INSERT INTO `country` VALUES (49,'CO','Colombia','BogotÃ¡',44);
INSERT INTO `country` VALUES (50,'CR','Costa Rica','San JosÃ©',0);
INSERT INTO `country` VALUES (51,'CS','Serbia and Montenegro','Belgrade',0);
INSERT INTO `country` VALUES (52,'CU','Cuba','Havana',0);
INSERT INTO `country` VALUES (53,'CV','Cape Verde','Praia',0);
INSERT INTO `country` VALUES (54,'CX','Christmas Island','Flying Fish Cove',0);
INSERT INTO `country` VALUES (55,'CY','Cyprus','Nicosia',0);
INSERT INTO `country` VALUES (56,'CZ','Czech Republic','Prague',0);
INSERT INTO `country` VALUES (57,'DE','Germany','Berlin',0);
INSERT INTO `country` VALUES (58,'DJ','Djibouti','Djibouti',0);
INSERT INTO `country` VALUES (59,'DK','Denmark','Copenhagen',0);
INSERT INTO `country` VALUES (60,'DM','Dominica','Roseau',0);
INSERT INTO `country` VALUES (61,'DO','Dominican Republic','Santo Domingo',0);
INSERT INTO `country` VALUES (62,'DZ','Algeria','Algiers',0);
INSERT INTO `country` VALUES (63,'EC','Ecuador','Quito',0);
INSERT INTO `country` VALUES (64,'EE','Estonia','Tallinn',0);
INSERT INTO `country` VALUES (65,'EG','Egypt','Cairo',0);
INSERT INTO `country` VALUES (66,'EH','Western Sahara','El-Aaiun',0);
INSERT INTO `country` VALUES (67,'ER','Eritrea','Asmara',0);
INSERT INTO `country` VALUES (68,'ES','Spain','Madrid',0);
INSERT INTO `country` VALUES (69,'ET','Ethiopia','Addis Ababa',0);
INSERT INTO `country` VALUES (70,'FI','Finland','Helsinki',0);
INSERT INTO `country` VALUES (71,'FJ','Fiji','Suva',0);
INSERT INTO `country` VALUES (72,'FK','Falkland Islands','Stanley',0);
INSERT INTO `country` VALUES (73,'FM','Micronesia','Palikir',0);
INSERT INTO `country` VALUES (74,'FO','Faroe Islands','TÃ³rshavn',0);
INSERT INTO `country` VALUES (75,'FR','France','Paris',0);
INSERT INTO `country` VALUES (76,'GA','Gabon','Libreville',0);
INSERT INTO `country` VALUES (77,'GB','United Kingdom','London',0);
INSERT INTO `country` VALUES (78,'GD','Grenada','St. George\'s',0);
INSERT INTO `country` VALUES (79,'GE','Georgia','Tbilisi',0);
INSERT INTO `country` VALUES (80,'GF','French Guiana','Cayenne',0);
INSERT INTO `country` VALUES (81,'GG','Guernsey','St Peter Port',0);
INSERT INTO `country` VALUES (82,'GH','Ghana','Accra',0);
INSERT INTO `country` VALUES (83,'GI','Gibraltar','Gibraltar',0);
INSERT INTO `country` VALUES (84,'GL','Greenland','Nuuk',0);
INSERT INTO `country` VALUES (85,'GM','Gambia','Banjul',0);
INSERT INTO `country` VALUES (86,'GN','Guinea','Conakry',0);
INSERT INTO `country` VALUES (87,'GP','Guadeloupe','Basse-Terre',0);
INSERT INTO `country` VALUES (88,'GQ','Equatorial Guinea','Malabo',0);
INSERT INTO `country` VALUES (89,'GR','Greece','Athens',0);
INSERT INTO `country` VALUES (90,'GS','South Georgia and the South Sandwich Islands','Grytviken',0);
INSERT INTO `country` VALUES (91,'GT','Guatemala','Guatemala City',0);
INSERT INTO `country` VALUES (92,'GU','Guam','HagÃ¥tÃ±a',0);
INSERT INTO `country` VALUES (93,'GW','Guinea-Bissau','Bissau',0);
INSERT INTO `country` VALUES (94,'GY','Guyana','Georgetown',0);
INSERT INTO `country` VALUES (95,'HK','Hong Kong','Hong Kong',0);
INSERT INTO `country` VALUES (96,'HM','Heard Island and McDonald Islands','',0);
INSERT INTO `country` VALUES (97,'HN','Honduras','Tegucigalpa',0);
INSERT INTO `country` VALUES (98,'HR','Croatia','Zagreb',0);
INSERT INTO `country` VALUES (99,'HT','Haiti','Port-au-Prince',0);
INSERT INTO `country` VALUES (100,'HU','Hungary','Budapest',0);
INSERT INTO `country` VALUES (101,'ID','Indonesia','Jakarta',0);
INSERT INTO `country` VALUES (102,'IE','Ireland','Dublin',0);
INSERT INTO `country` VALUES (103,'IL','Israel','Jerusalem',0);
INSERT INTO `country` VALUES (104,'IM','Isle of Man','Douglas, Isle of Man',0);
INSERT INTO `country` VALUES (105,'IN','India','New Delhi',0);
INSERT INTO `country` VALUES (106,'IO','British Indian Ocean Territory','Diego Garcia',0);
INSERT INTO `country` VALUES (107,'IQ','Iraq','Baghdad',0);
INSERT INTO `country` VALUES (108,'IR','Iran','Tehran',0);
INSERT INTO `country` VALUES (109,'IS','Iceland','ReykjavÃ­k',0);
INSERT INTO `country` VALUES (110,'IT','Italy','Rome',0);
INSERT INTO `country` VALUES (111,'JE','Jersey','Saint Helier',0);
INSERT INTO `country` VALUES (112,'JM','Jamaica','Kingston',0);
INSERT INTO `country` VALUES (113,'JO','Jordan','Amman',0);
INSERT INTO `country` VALUES (114,'JP','Japan','Tokyo',0);
INSERT INTO `country` VALUES (115,'KE','Kenya','Nairobi',16);
INSERT INTO `country` VALUES (116,'KG','Kyrgyzstan','Bishkek',0);
INSERT INTO `country` VALUES (117,'KH','Cambodia','Phnom Penh',0);
INSERT INTO `country` VALUES (118,'KI','Kiribati','South Tarawa',0);
INSERT INTO `country` VALUES (119,'KM','Comoros','Moroni',0);
INSERT INTO `country` VALUES (120,'KN','Saint Kitts and Nevis','Basseterre',0);
INSERT INTO `country` VALUES (121,'KP','North Korea','Pyongyang',0);
INSERT INTO `country` VALUES (122,'KR','South Korea','Seoul',0);
INSERT INTO `country` VALUES (123,'KW','Kuwait','Kuwait City',0);
INSERT INTO `country` VALUES (124,'KY','Cayman Islands','George Town',0);
INSERT INTO `country` VALUES (125,'KZ','Kazakhstan','Astana',0);
INSERT INTO `country` VALUES (126,'LA','Laos','Vientiane',0);
INSERT INTO `country` VALUES (127,'LB','Lebanon','Beirut',0);
INSERT INTO `country` VALUES (128,'LC','Saint Lucia','Castries',0);
INSERT INTO `country` VALUES (129,'LI','Liechtenstein','Vaduz',0);
INSERT INTO `country` VALUES (130,'LK','Sri Lanka','Colombo',0);
INSERT INTO `country` VALUES (131,'LR','Liberia','Monrovia',0);
INSERT INTO `country` VALUES (132,'LS','Lesotho','Maseru',0);
INSERT INTO `country` VALUES (133,'LT','Lithuania','Vilnius',0);
INSERT INTO `country` VALUES (134,'LU','Luxembourg','Luxembourg',0);
INSERT INTO `country` VALUES (135,'LV','Latvia','Riga',0);
INSERT INTO `country` VALUES (136,'LY','Libya','Tripolis',0);
INSERT INTO `country` VALUES (137,'MA','Morocco','Rabat',0);
INSERT INTO `country` VALUES (138,'MC','Monaco','Monaco',0);
INSERT INTO `country` VALUES (139,'MD','Moldova','Chi_in_u',0);
INSERT INTO `country` VALUES (140,'ME','Montenegro','Podgorica',0);
INSERT INTO `country` VALUES (141,'MF','Saint Martin','Marigot',0);
INSERT INTO `country` VALUES (142,'MG','Madagascar','Antananarivo',0);
INSERT INTO `country` VALUES (143,'MH','Marshall Islands','Uliga',0);
INSERT INTO `country` VALUES (144,'MK','Macedonia','Skopje',0);
INSERT INTO `country` VALUES (145,'ML','Mali','Bamako',0);
INSERT INTO `country` VALUES (146,'MM','Myanmar','Yangon',0);
INSERT INTO `country` VALUES (147,'MN','Mongolia','Ulan Bator',0);
INSERT INTO `country` VALUES (148,'MO','Macao','Macao',0);
INSERT INTO `country` VALUES (149,'MP','Northern Mariana Islands','Saipan',0);
INSERT INTO `country` VALUES (150,'MQ','Martinique','Fort-de-France',0);
INSERT INTO `country` VALUES (151,'MR','Mauritania','Nouakchott',0);
INSERT INTO `country` VALUES (152,'MS','Montserrat','Plymouth',0);
INSERT INTO `country` VALUES (153,'MT','Malta','Valletta',0);
INSERT INTO `country` VALUES (154,'MU','Mauritius','Port Louis',0);
INSERT INTO `country` VALUES (155,'MV','Maldives','MalÃ©',0);
INSERT INTO `country` VALUES (156,'MW','Malawi','Lilongwe',0);
INSERT INTO `country` VALUES (157,'MX','Mexico','Mexico City',0);
INSERT INTO `country` VALUES (158,'MY','Malaysia','Kuala Lumpur',0);
INSERT INTO `country` VALUES (159,'MZ','Mozambique','Maputo',0);
INSERT INTO `country` VALUES (160,'NA','Namibia','Windhoek',0);
INSERT INTO `country` VALUES (161,'NC','New Caledonia','NoumÃ©a',0);
INSERT INTO `country` VALUES (162,'NE','Niger','Niamey',0);
INSERT INTO `country` VALUES (163,'NF','Norfolk Island','Kingston',0);
INSERT INTO `country` VALUES (164,'NG','Nigeria','Abuja',0);
INSERT INTO `country` VALUES (165,'NI','Nicaragua','Managua',0);
INSERT INTO `country` VALUES (166,'NL','Netherlands','Amsterdam',0);
INSERT INTO `country` VALUES (167,'NO','Norway','Oslo',0);
INSERT INTO `country` VALUES (168,'NP','Nepal','Kathmandu',0);
INSERT INTO `country` VALUES (169,'NR','Nauru','Yaren',0);
INSERT INTO `country` VALUES (170,'NU','Niue','Alofi',0);
INSERT INTO `country` VALUES (171,'NZ','New Zealand','Wellington',0);
INSERT INTO `country` VALUES (172,'OM','Oman','Muscat',0);
INSERT INTO `country` VALUES (173,'PA','Panama','Panama City',0);
INSERT INTO `country` VALUES (174,'PE','Peru','Lima',0);
INSERT INTO `country` VALUES (175,'PF','French Polynesia','Papeete',0);
INSERT INTO `country` VALUES (176,'PG','Papua New Guinea','Port Moresby',0);
INSERT INTO `country` VALUES (177,'PH','Philippines','Manila',0);
INSERT INTO `country` VALUES (178,'PK','Pakistan','Islamabad',0);
INSERT INTO `country` VALUES (179,'PL','Poland','Warsaw',0);
INSERT INTO `country` VALUES (180,'PM','Saint Pierre and Miquelon','Saint-Pierre',0);
INSERT INTO `country` VALUES (181,'PN','Pitcairn','Adamstown',0);
INSERT INTO `country` VALUES (182,'PR','Puerto Rico','San Juan',0);
INSERT INTO `country` VALUES (183,'PS','Palestinian Territory','East Jerusalem',0);
INSERT INTO `country` VALUES (184,'PT','Portugal','Lisbon',0);
INSERT INTO `country` VALUES (185,'PW','Palau','Koror',0);
INSERT INTO `country` VALUES (186,'PY','Paraguay','AsunciÃ³n',0);
INSERT INTO `country` VALUES (187,'QA','Qatar','Doha',0);
INSERT INTO `country` VALUES (188,'RE','Reunion','Saint-Denis',0);
INSERT INTO `country` VALUES (189,'RO','Romania','Bucharest',0);
INSERT INTO `country` VALUES (190,'RS','Serbia','Belgrade',0);
INSERT INTO `country` VALUES (191,'RU','Russia','Moscow',0);
INSERT INTO `country` VALUES (192,'RW','Rwanda','Kigali',0);
INSERT INTO `country` VALUES (193,'SA','Saudi Arabia','Riyadh',0);
INSERT INTO `country` VALUES (194,'SB','Solomon Islands','Honiara',0);
INSERT INTO `country` VALUES (195,'SC','Seychelles','Victoria',0);
INSERT INTO `country` VALUES (196,'SD','Sudan','Khartoum',0);
INSERT INTO `country` VALUES (197,'SE','Sweden','Stockholm',0);
INSERT INTO `country` VALUES (198,'SG','Singapore','Singapur',0);
INSERT INTO `country` VALUES (199,'SH','Saint Helena','Jamestown',0);
INSERT INTO `country` VALUES (200,'SI','Slovenia','Ljubljana',0);
INSERT INTO `country` VALUES (201,'SJ','Svalbard and Jan Mayen','Longyearbyen',0);
INSERT INTO `country` VALUES (202,'SK','Slovakia','Bratislava',0);
INSERT INTO `country` VALUES (203,'SL','Sierra Leone','Freetown',0);
INSERT INTO `country` VALUES (204,'SM','San Marino','San Marino',0);
INSERT INTO `country` VALUES (205,'SN','Senegal','Dakar',0);
INSERT INTO `country` VALUES (206,'SO','Somalia','Mogadishu',0);
INSERT INTO `country` VALUES (207,'SR','Suriname','Paramaribo',0);
INSERT INTO `country` VALUES (208,'ST','Sao Tome and Principe','SÃ£o TomÃ©',0);
INSERT INTO `country` VALUES (209,'SV','El Salvador','San Salvador',0);
INSERT INTO `country` VALUES (210,'SY','Syria','Damascus',0);
INSERT INTO `country` VALUES (211,'SZ','Swaziland','Mbabane',0);
INSERT INTO `country` VALUES (212,'TC','Turks and Caicos Islands','Cockburn Town',0);
INSERT INTO `country` VALUES (213,'TD','Chad','N\'Djamena',0);
INSERT INTO `country` VALUES (214,'TF','French Southern Territories','Martin-de-ViviÃ¨s',0);
INSERT INTO `country` VALUES (215,'TG','Togo','LomÃ©',0);
INSERT INTO `country` VALUES (216,'TH','Thailand','Bangkok',0);
INSERT INTO `country` VALUES (217,'TJ','Tajikistan','Dushanbe',0);
INSERT INTO `country` VALUES (218,'TK','Tokelau','',0);
INSERT INTO `country` VALUES (219,'TL','East Timor','Dili',0);
INSERT INTO `country` VALUES (220,'TM','Turkmenistan','Ashgabat',0);
INSERT INTO `country` VALUES (221,'TN','Tunisia','Tunis',0);
INSERT INTO `country` VALUES (222,'TO','Tonga','Nuku\'alofa',0);
INSERT INTO `country` VALUES (223,'TR','Turkey','Ankara',0);
INSERT INTO `country` VALUES (224,'TT','Trinidad and Tobago','Port of Spain',0);
INSERT INTO `country` VALUES (225,'TV','Tuvalu','Vaiaku',0);
INSERT INTO `country` VALUES (226,'TW','Taiwan','Taipei',0);
INSERT INTO `country` VALUES (227,'TZ','Tanzania','Dar es Salaam',0);
INSERT INTO `country` VALUES (228,'UA','Ukraine','Kiev',0);
INSERT INTO `country` VALUES (229,'UG','Uganda','Kampala',0);
INSERT INTO `country` VALUES (230,'UM','United States Minor Outlying Islands','',0);
INSERT INTO `country` VALUES (231,'US','United States','Washington',0);
INSERT INTO `country` VALUES (232,'UY','Uruguay','Montevideo',0);
INSERT INTO `country` VALUES (233,'UZ','Uzbekistan','Tashkent',0);
INSERT INTO `country` VALUES (234,'VA','Vatican','Vatican City',0);
INSERT INTO `country` VALUES (235,'VC','Saint Vincent and the Grenadines','Kingstown',0);
INSERT INTO `country` VALUES (236,'VE','Venezuela','Caracas',0);
INSERT INTO `country` VALUES (237,'VG','British Virgin Islands','Road Town',0);
INSERT INTO `country` VALUES (238,'VI','U.S. Virgin Islands','Charlotte Amalie',0);
INSERT INTO `country` VALUES (239,'VN','Vietnam','Hanoi',0);
INSERT INTO `country` VALUES (240,'VU','Vanuatu','Port Vila',0);
INSERT INTO `country` VALUES (241,'WF','Wallis and Futuna','MatÃ¢\'Utu',0);
INSERT INTO `country` VALUES (242,'WS','Samoa','Apia',0);
INSERT INTO `country` VALUES (243,'YE','Yemen','Sanâ€˜aâ€™',0);
INSERT INTO `country` VALUES (244,'YT','Mayotte','Mamoudzou',0);
INSERT INTO `country` VALUES (245,'ZA','South Africa','Pretoria',0);
INSERT INTO `country` VALUES (246,'ZM','Zambia','Lusaka',0);
INSERT INTO `country` VALUES (247,'ZW','Zimbabwe','Harare',0);
INSERT INTO `country` VALUES (248,'XK','Kosovo','Pristina',0);
INSERT INTO `country` VALUES (249,'SS','South Sudan','Juba',0);

#
# Source for table densitymap_geometry
#

CREATE TABLE `densitymap_geometry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `kml_file` varchar(200) DEFAULT NULL,
  `label_lat` double NOT NULL DEFAULT '0',
  `label_lon` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table densitymap_geometry
#


#
# Source for table enhancedmap_settings
#

CREATE TABLE `enhancedmap_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(100) NOT NULL,
  `value` char(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Dumping data for table enhancedmap_settings
#

INSERT INTO `enhancedmap_settings` VALUES (1,'enable_bigmap','true');
INSERT INTO `enhancedmap_settings` VALUES (2,'enable_printmap','false');
INSERT INTO `enhancedmap_settings` VALUES (3,'enable_iframemap','true');
INSERT INTO `enhancedmap_settings` VALUES (4,'enable_adminmap','true');
INSERT INTO `enhancedmap_settings` VALUES (5,'adminmap_height','other');
INSERT INTO `enhancedmap_settings` VALUES (6,'adminmap_width','other');
INSERT INTO `enhancedmap_settings` VALUES (7,'show_unapproved_backend','true');
INSERT INTO `enhancedmap_settings` VALUES (8,'show_unapproved_frontend','false');
INSERT INTO `enhancedmap_settings` VALUES (9,'show_hidden_categories_backend','true');
INSERT INTO `enhancedmap_settings` VALUES (10,'color_mode','merge_all');
INSERT INTO `enhancedmap_settings` VALUES (11,'dot_size','2');

#
# Source for table externalapp
#

CREATE TABLE `externalapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `url` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Info on external apps(mobile) that work with your deployment';

#
# Dumping data for table externalapp
#

INSERT INTO `externalapp` VALUES (1,'iPhone','http://download.ushahidi.com/track_download.php?download=ios');
INSERT INTO `externalapp` VALUES (2,'Android','http://download.ushahidi.com/track_download.php?download=android');

#
# Source for table feed
#

CREATE TABLE `feed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `feed_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `feed_url` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `feed_cache` text CHARACTER SET latin1,
  `feed_active` tinyint(4) DEFAULT '1',
  `feed_update` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Information about RSS Feeds a deployment subscribes to';

#
# Dumping data for table feed
#


#
# Source for table feed_item
#

CREATE TABLE `feed_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `feed_id` int(11) unsigned NOT NULL,
  `location_id` bigint(20) unsigned DEFAULT '0',
  `incident_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `item_title` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `item_description` text CHARACTER SET latin1,
  `item_link` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `item_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores feed items pulled from each RSS Feed';

#
# Dumping data for table feed_item
#


#
# Source for table feed_item_category
#

CREATE TABLE `feed_item_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_item_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Stores fetched feed items categories';

#
# Dumping data for table feed_item_category
#


#
# Source for table form
#

CREATE TABLE `form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_title` varchar(200) NOT NULL,
  `form_description` text,
  `form_active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `form_title` (`form_title`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Stores all report submission forms created(default+custom)';

#
# Dumping data for table form
#

INSERT INTO `form` VALUES (1,'TITULO DEL FORMULARIO','DESCRIPCION DEL FORMULARIO',1);

#
# Source for table form_field
#

CREATE TABLE `form_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '1',
  `field_name` varchar(200) DEFAULT NULL,
  `field_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - TEXTFIELD, 2 - TEXTAREA (FREETEXT), 3 - DATE, 4 - PASSWORD, 5 - RADIO, 6 - CHECKBOX',
  `field_required` tinyint(4) DEFAULT '0',
  `field_position` tinyint(4) NOT NULL DEFAULT '0',
  `field_default` text,
  `field_maxlength` int(11) NOT NULL DEFAULT '0',
  `field_width` smallint(6) NOT NULL DEFAULT '0',
  `field_height` tinyint(4) DEFAULT '5',
  `field_isdate` tinyint(4) NOT NULL DEFAULT '0',
  `field_ispublic_visible` tinyint(4) NOT NULL DEFAULT '0',
  `field_ispublic_submit` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_name` (`field_name`,`form_id`),
  KEY `fk_form_id` (`form_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Stores all custom form fields created by users';

#
# Dumping data for table form_field
#

INSERT INTO `form_field` VALUES (1,1,'Campo1',1,0,1,NULL,0,0,5,0,0,0);
INSERT INTO `form_field` VALUES (2,1,'CAMPO TEXTO LIBRE',2,0,2,NULL,0,0,5,0,0,0);

#
# Source for table form_field_option
#

CREATE TABLE `form_field_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_field_id` int(11) NOT NULL DEFAULT '0',
  `option_name` varchar(200) DEFAULT NULL,
  `option_value` text,
  PRIMARY KEY (`id`),
  KEY `form_field_id` (`form_field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Options related to custom form fields';

#
# Dumping data for table form_field_option
#

INSERT INTO `form_field_option` VALUES (1,1,'field_datatype','text');
INSERT INTO `form_field_option` VALUES (2,1,'field_hidden','0');
INSERT INTO `form_field_option` VALUES (3,2,'field_datatype','text');

#
# Source for table form_response
#

CREATE TABLE `form_response` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_field_id` int(11) NOT NULL,
  `incident_id` bigint(20) unsigned NOT NULL,
  `form_response` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_form_field_id` (`form_field_id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores responses to custom form fields';

#
# Dumping data for table form_response
#


#
# Source for table geometry
#

CREATE TABLE `geometry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL,
  `geometry` geometry NOT NULL,
  `geometry_label` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `geometry_comment` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `geometry_color` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `geometry_strokewidth` varchar(5) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores map geometries i.e polygons, lines etc';

#
# Dumping data for table geometry
#


#
# Source for table incident
#

CREATE TABLE `incident` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned NOT NULL,
  `form_id` int(11) NOT NULL DEFAULT '1',
  `locale` varchar(10) NOT NULL DEFAULT 'en_US',
  `user_id` int(11) unsigned DEFAULT NULL,
  `incident_title` varchar(255) DEFAULT NULL,
  `incident_description` longtext,
  `incident_date` datetime DEFAULT NULL,
  `incident_mode` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - WEB, 2 - SMS, 3 - EMAIL, 4 - TWITTER',
  `incident_active` tinyint(4) NOT NULL DEFAULT '0',
  `incident_verified` tinyint(4) NOT NULL DEFAULT '0',
  `incident_dateadd` datetime DEFAULT NULL,
  `incident_dateadd_gmt` datetime DEFAULT NULL,
  `incident_datemodify` datetime DEFAULT NULL,
  `incident_alert_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - Not Tagged for Sending, 1 - Tagged for Sending, 2 - Alerts Have Been Sent',
  `incident_zoom` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `incident_active` (`incident_active`),
  KEY `incident_date` (`incident_date`),
  KEY `form_id` (`form_id`),
  KEY `user_id` (`user_id`),
  KEY `incident_mode` (`incident_mode`),
  KEY `incident_verified` (`incident_verified`)
) ENGINE=MyISAM AUTO_INCREMENT=6524 DEFAULT CHARSET=utf8 COMMENT='Stores reports submitted';

#
# Dumping data for table incident
#

INSERT INTO `incident` VALUES (6016,1,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:4 Meses _ procedente del municipio Cumaribo Localidad Comunidad Holanda Resguardo Santa Teresita','2019-12-30 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6017,2,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:5 Meses _ procedente del municipio Cumaribo _ Localidad Comunidad Holanda Resguardo Santa Teresita','2019-12-30 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6018,3,1,'en_US',0,'Bajo peso al nacer','Se reporta un caso de Bajo peso al nacer en paciente de género Femenino _ Edad:28 Años _ procedente del municipio Puerto Carreño Localidad El Progreso','2019-12-30 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6019,4,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Femenino _ Edad:32 Años _ procedente del municipio Cumaribo Localidad Barrio Alcaraban Donde El Pescador','2019-12-30 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6020,5,1,'en_US',0,'Mortalidad por IRA','Se reporta un caso de Mortalidad por IRA en paciente de género Femenino _ Edad:4 Meses _ procedente del municipio Cumaribo Localidad Comunidad Holanda Resguardo Santa Teresita','2019-12-30 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6021,6,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Masculino _ Edad:41 Años _ procedente del municipio La Primavera Localidad Nueva antioquia','2019-12-31 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6022,7,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:30 Años _ procedente del municipio Cumaribo _ Localidad Sin Informacion','2019-12-31 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6023,8,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:17 Años _ procedente del municipio Santa Rosalia _ Localidad Santa Rosalia','2019-12-31 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6024,9,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:11 Años _ procedente del municipio Puerto Carreño Localidad Esperanza','2020-01-01 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6025,10,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Meses _ procedente del municipio Cumaribo Localidad Comunidad Amuetsenebo Resguardo Bajo Rio Vichada S','2020-01-02 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6026,11,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Años _ procedente del municipio Cumaribo Localidad Comunidad Indigena Villanueva','2020-01-02 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6027,12,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:38 Años _ procedente del municipio Puerto Carreño Localidad Calarca','2020-01-02 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6028,13,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:24 Años _ procedente del municipio Cumaribo _ Localidad Resguardo Santa Teresita Comunidad Holanda','2020-01-02 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6029,14,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Masculino _ Edad:13 Años _ procedente del municipio Cumaribo Localidad Resguardo Tomobeberi Comunidad Belen','2020-01-04 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6030,15,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Masculino _ Edad:12 Años _ procedente del municipio Cumaribo Localidad Comunidad Nuevo Angelito Resguardo Bajo Rio Vichad','2020-01-04 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6031,16,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:19 Años _ procedente del municipio Cumaribo _ Localidad Resguardo Bajo Rio','2020-01-05 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6032,17,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Masculino _ Edad:13 Años _ procedente del municipio Cumaribo Localidad Vereda Agua Bonita','2020-01-05 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6033,18,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Masculino _ Edad:12 Años _ procedente del municipio Cumaribo Localidad Sin Informacion','2020-01-05 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6034,19,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Masculino _ Edad:20 Años _ procedente del municipio La Primavera Localidad Vereda Pueblo Nuevo','2020-01-05 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6035,20,1,'en_US',0,'Bajo peso al nacer','Se reporta un caso de Bajo peso al nacer en paciente de género Femenino _ Edad:19 Años _ procedente del municipio Cumaribo Localidad Comunidad Indigena Sucuara-Resguardo Bajo Rio Vich','2020-01-06 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6036,21,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Meses _ procedente del municipio Cumaribo Localidad Resguardoamuhenebo Bajo El Rio Vichada','2020-01-06 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6037,22,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:7 Meses _ procedente del municipio Cumaribo Localidad Comunidad Esmeralda Resguardo La Esmeralda','2020-01-06 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6038,23,1,'en_US',0,'Enfermedades Huérfanas','Se reporta un caso de Enfermedades Huérfanas en paciente de género Masculino _ Edad:4 Años _ procedente del municipio Puerto Carreño Localidad Resguardo Bajo El Rio Vichada','2020-01-06 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6039,24,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:14 Años _ procedente del municipio La Primavera Localidad Vereda La Soledad','2020-01-07 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6040,25,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Femenino _ Edad:56 Años _ procedente del municipio La Primavera Localidad Barrio Jardin','2020-01-07 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6041,26,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:41 Años _ procedente del municipio Cumaribo _ Localidad Barrio Alcaraban','2020-01-07 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6042,27,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Años _ procedente del municipio Cumaribo Localidad Comunidad Cumariana Resguardo Aiwakuna','2020-01-10 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6043,28,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:7 Meses _ procedente del municipio Cumaribo Localidad Vereda Setor 2','2020-01-11 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6044,29,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Masculino _ Edad:12 Años _ procedente del municipio Cumaribo Localidad Resguardo Tomobeiriri','2020-01-11 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6045,30,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:30 Años _ procedente del municipio Cumaribo _ Localidad Comunidad Patinel Resguardo Saracure','2020-01-13 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6046,31,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Femenino _ Edad:30 Años _ procedente del municipio Cumaribo Localidad Comunidad Patene - Resguardo Saracure','2020-01-13 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6047,32,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Puerto Carreño Localidad Asentamiento Ciner','2020-01-13 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6048,33,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Femenino _ Edad:13 Años _ procedente del municipio Cumaribo Localidad Barrio Alcaraban Cumaribo','2020-01-13 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6049,34,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:13 Años _ procedente del municipio Puerto Carreño Localidad Villa Del Carmen','2020-01-13 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6050,35,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Masculino _ Edad:30 Años _ procedente del municipio Cumaribo _ Localidad Sabana Grande','2020-01-14 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6051,36,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:7 Años _ procedente del municipio Cumaribo _ Localidad Comunidad De Sabana Grande','2020-01-14 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6052,37,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:11 Meses _ procedente del municipio Puerto Carreño Localidad Asentamiento Ciner','2020-01-14 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6053,38,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Masculino _ Edad:10 Años _ procedente del municipio Cumaribo Localidad Comunidad Diamante Resguardo Punta Bandera','2020-01-15 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6054,39,1,'en_US',0,'Sífilis Gestacional','Se reporta un caso de Sífilis Gestacional en paciente de género Femenino _ Edad:21 Años _ procedente del municipio Puerto Carreño El Progreso','2020-01-16 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6055,40,1,'en_US',0,'Sífilis Gestacional','Se reporta un caso de Sífilis Gestacional en paciente de género Femenino _ Edad:21 Años _ procedente del municipio Puerto Carreño Las Granjas','2020-01-16 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6056,41,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:11 Años _ procedente del municipio Puerto Carreño _ Localidad Santa Teresita','2020-01-17 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6057,42,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:8 Años _ procedente del municipio Puerto Carreño _ Localidad Santa Teresita','2020-01-17 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6058,43,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Femenino _ Edad:10 Años _ procedente del municipio Puerto Carreño Localidad Sin Informacion','2020-01-18 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6059,44,1,'en_US',0,'Tuberculosis','Se reporta un caso de Tuberculosis en paciente de género Femenino _ Edad:22 Años _ procedente del municipio Cumaribo Localidad Resguardo Saracure Comunidad Deva','2020-01-18 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6060,45,1,'en_US',0,'Tuberculosis','Se reporta un caso de Tuberculosis en paciente de género Masculino _ Edad:71 Años _ procedente del municipio La Primavera Localidad Vereda La Balsa','2020-01-18 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6061,46,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:23 Años _ procedente del municipio Cumaribo _ Localidad Comunidad Indigena Capturama-Resguardo Aiwacuna Ch','2020-01-19 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6062,47,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:50 Años _ procedente del municipio Puerto Carreño Localidad Recreo','2020-01-20 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6063,48,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:12 Años _ procedente del municipio La Primavera Localidad Barrio Centro','2020-01-20 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6064,49,1,'en_US',0,'Varicela','Se reporta un caso de Varicela en paciente de género Masculino _ Edad:10 Años _ procedente del municipio Santa Rosalia Localidad Resguardo Santa Rosalia','2020-01-20 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6065,50,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Masculino _ Edad:25 Años _ procedente del municipio Cumaribo Localidad Comunidad La Estancia','2020-01-20 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6066,51,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:23 Años _ procedente del municipio Cumaribo _ Localidad Comunidad Capturama Resguardo Aiwacuna Chepajibo','2020-01-20 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6067,52,1,'en_US',0,'Tuberculosis','Se reporta un caso de Tuberculosis en paciente de género Femenino _ Edad:56 Años _ procedente del municipio Santa Rosalia Localidad Calle 5 10 35 Centro','2020-01-22 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6068,53,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Masculino _ Edad:25 Años _ procedente del municipio La Primavera Localidad Finca Miralejo','2020-01-22 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6069,54,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Meses _ procedente del municipio Cumaribo Localidad Comunidad Limoncito Resguardo Aiwakuna','2020-01-22 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6070,55,1,'en_US',0,'Cancer en menores de 18 años','Se reporta un caso de Cancer en menores de 18 años en paciente de género Masculino _ Edad:2 Años _ procedente del municipio Santa Rosalia Localidad Santa Rosalia','2020-01-24 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6071,56,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Masculino _ Edad:37 Años _ procedente del municipio La Primavera Localidad Inspeccion Santa Cecilia','2020-01-24 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6072,57,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Masculino _ Edad:33 Años _ procedente del municipio Puerto Carreño Localidad Casuarito','2020-01-24 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6073,58,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:48 Años _ procedente del municipio Puerto Carreño Localidad Santa Elenita','2020-01-25 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6074,59,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:42 Años _ procedente del municipio Puerto Carreño Localidad Santa Monica','2020-01-27 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6075,60,1,'en_US',0,'Mortalidad por IRA','Se reporta un caso de Mortalidad por IRA en paciente de género Masculino _ Edad:2 Meses _ procedente del municipio Puerto Carreño Localidad Acentamiento Pavoni Paraiso','2020-01-27 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6076,61,1,'en_US',0,'Intento de Suicidio','Se reporta un caso de Intento de Suicidio en paciente de género Femenino _ Edad:17 Años _ procedente del municipio Cumaribo Localidad Nuevo Horizonte','2020-01-27 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6077,62,1,'en_US',0,'Varicela','Se reporta un caso de Varicela en paciente de género Masculino _ Edad:22 Años _ procedente del municipio Puerto Carreño Localidad Barrio Alcaravan','2020-01-28 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6078,63,1,'en_US',0,'Bajo peso al nacer','Se reporta un caso de Bajo peso al nacer en paciente de género Femenino _ Edad:38 Años _ procedente del municipio Cumaribo Localidad Comunidad La Urbana','2020-01-29 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6079,64,1,'en_US',0,'Intoxicación','Se reporta un caso de Intoxicación en paciente de género Masculino _ Edad:3 Años _ procedente del municipio La Primavera Localidad Primavera Vichada','2020-01-29 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6080,65,1,'en_US',0,'Tuberculosis','Se reporta un caso de Tuberculosis en paciente de género Masculino _ Edad:64 Años _ procedente del municipio La Primavera Localidad Barrio Alcaraban','2020-01-29 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6081,66,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Masculino _ Edad:60 Años _ procedente del municipio Cumaribo Localidad Mapisiare','2020-01-30 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6082,67,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:18 Años _ procedente del municipio Puerto Carreño Localidad Mateo','2020-01-30 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6083,68,1,'en_US',0,'Enfermedades Huérfanas','Se reporta un caso de Enfermedades Huérfanas en paciente de género Masculino _ Edad:28 Años _ procedente del municipio Cumaribo Localidad Comunicad Pupac Puerto Lindo Segua','2020-01-30 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6084,69,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:9 Meses _ procedente del municipio Puerto Carreño Localidad Barrio Calarca','2020-01-30 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6085,70,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:25 Años _ procedente del municipio Cumaribo _ Localidad Comunidad Cumariana Resguardo Aiwakuna Tsepajibo','2020-01-30 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6086,71,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:3 Años _ procedente del municipio Puerto Carreño Localidad Barrio Simonbolivar','2020-01-31 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6087,72,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:38 Años _ procedente del municipio Cumaribo _ Localidad Resguardo Sector 1 Bajo Rio Vichada Comunidad La U','2020-01-31 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6088,73,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:22 Años _ procedente del municipio Cumaribo Localidad Barrio Ciudadela','2020-01-31 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6089,74,1,'en_US',0,'Intento de Suicidio','Se reporta un caso de Intento de Suicidio en paciente de género Masculino _ Edad:19 Años _ procedente del municipio Puerto Carreño Localidad Casuarito','2020-01-31 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6090,75,1,'en_US',0,'Intoxicación','Se reporta un caso de Intoxicación en paciente de género Masculino _ Edad:19 Años _ procedente del municipio Puerto Carreño Localidad Casuarito','2020-01-31 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6091,76,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:24 Años _ procedente del municipio Cumaribo _ Localidad Barrio Palmar','2020-01-31 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6092,77,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Masculino _ Edad:24 Años _ procedente del municipio Cumaribo _ Localidad Palmar','2020-01-31 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6093,78,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Meses _ procedente del municipio Cumaribo Localidad Resgaurdo Bajo El Rios Vichada','2020-02-01 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6094,79,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Femenino _ Edad:7 Años _ procedente del municipio Cumaribo Localidad Cra 17c #30-38 San Carlos','2020-02-01 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6095,80,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:9 Años _ procedente del municipio Puerto Carreño Localidad Villa Orinoco','2020-02-01 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6096,81,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:18 Años _ procedente del municipio Cumaribo Localidad Batallon De Infanteria Biroj43','2020-02-01 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6097,82,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:2 Meses _ procedente del municipio Cumaribo _ Localidad Resguardo Esquinas Lejania','2020-02-03 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6098,83,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:2 Meses _ procedente del municipio Cumaribo Localidad Resguardo Esquinas Lejania','2020-02-03 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6099,84,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:18 Años _ procedente del municipio La Primavera _ Localidad Barrio El Jardin','2020-02-03 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6100,85,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:6 Años _ procedente del municipio Santa Rosalia _ Localidad Barrio Pueblo Viejo','2020-02-03 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6101,86,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Masculino _ Edad:1 Meses _ procedente del municipio Cumaribo _ Localidad Comunidad Indigena Limoncito-Resguardo Rio Bajo Vi','2020-02-04 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6102,87,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Años _ procedente del municipio Puerto Carreño Localidad Comunidad Caño Bachaco','2020-02-04 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6103,88,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:50 Años _ procedente del municipio La Primavera _ Localidad Barrio El Jardin','2020-02-06 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6104,89,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:28 Años _ procedente del municipio La Primavera _ Localidad Barrio Divino Niño','2020-02-06 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6105,90,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:7 Meses _ procedente del municipio La Primavera Localidad Inspección De Santa Barbara','2020-02-06 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6106,91,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Meses _ procedente del municipio La Primavera Localidad El Trompillo','2020-02-06 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6107,92,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:17 Dias _ procedente del municipio La Primavera Localidad Barrio El Trompillo','2020-02-06 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6108,93,1,'en_US',0,'Intoxicación','Se reporta un caso de Intoxicación en paciente de género Masculino _ Edad:22 Años _ procedente del municipio Puerto Carreño Localidad Barrio La Primavera','2020-02-06 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6109,94,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:35 Años _ procedente del municipio La Primavera _ Localidad Barrio Veracruz','2020-02-06 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6110,95,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:5 Años _ procedente del municipio Santa Rosalia _ Localidad Guacacias','2020-02-06 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6111,96,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:14 Años _ procedente del municipio Puerto Carreño _ Localidad Barrio El Centro','2020-02-06 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6112,97,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:44 Años _ procedente del municipio Puerto Carreño Localidad Barrio Simon Bolivar','2020-02-07 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6113,98,1,'en_US',0,'Tuberculosis','Se reporta un caso de Tuberculosis en paciente de género Femenino _ Edad:24 Años _ procedente del municipio Cumaribo Localidad Albergue Sukurame Finca San Nicolas Frente A La Ar','2020-02-07 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6114,99,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:9 Años _ procedente del municipio Puerto Carreño _ Localidad Barrio La Florida','2020-02-07 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6115,100,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:30 Años _ procedente del municipio Cumaribo _ Localidad Comunidad Guatapuri Resguardo San Luis Del Tomo','2020-02-08 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6116,101,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:6 Años _ procedente del municipio Cumaribo _ Localidad Barrio Alcarabn','2020-02-08 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6117,102,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Femenino _ Edad:28 Años _ procedente del municipio Cumaribo Localidad Cra 20 # 7-04 Bario Yariguies 1','2020-02-10 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6118,103,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Años _ procedente del municipio Cumaribo Localidad Comunidad Nueva Zelanda Reg San Luis Del Tomo','2020-02-10 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6119,104,1,'en_US',0,'Intoxicación','Se reporta un caso de Intoxicación en paciente de género Masculino _ Edad:32 Años _ procedente del municipio Puerto Carreño Localidad Barrio Acacias','2020-02-10 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6120,105,1,'en_US',0,'Sífilis Gestacional','Se reporta un caso de Sífilis Gestacional en paciente de género Femenino _ Edad:18 Años _ procedente del municipio Puerto Carreño La Florida','2020-02-10 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6121,106,1,'en_US',0,'Defectos Congénitos','Se reporta un caso de Defectos Congénitos en paciente de género Femenino _ Edad:7 Dias _ procedente del municipio Cumaribo Localidad Bajo Rio Vichada 2','2020-02-11 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6122,107,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:23 Años _ procedente del municipio Cumaribo _ Localidad Comunidad Cenobia - Bajo Rio Vichada 2','2020-02-11 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6123,108,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:21 Años _ procedente del municipio Puerto Carreño _ Localidad Reguardo Indigena El Consejo','2020-02-12 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6124,109,1,'en_US',0,'Cancer en menores de 18 años','Se reporta un caso de Cancer en menores de 18 años en paciente de género Femenino _ Edad:3 Años _ procedente del municipio La Primavera Localidad Sin Informacion','2020-02-13 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6125,110,1,'en_US',0,'Varicela','Se reporta un caso de Varicela en paciente de género Masculino _ Edad:25 Años _ procedente del municipio Puerto Carreño Localidad Mateo','2020-02-13 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6126,111,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:26 Años _ procedente del municipio La Primavera _ Localidad Trompillo','2020-02-13 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6127,112,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:19 Años _ procedente del municipio Santa Rosalia _ Localidad Barrio Centro','2020-02-13 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6128,113,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:40 Años _ procedente del municipio Cumaribo _ Localidad No Aporta','2020-02-14 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6129,114,1,'en_US',0,'Intento de Suicidio','Se reporta un caso de Intento de Suicidio en paciente de género Femenino _ Edad:19 Años _ procedente del municipio Puerto Berrio Localidad La Primavera','2020-02-15 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6130,115,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Masculino _ Edad:21 Años _ procedente del municipio Cumaribo Localidad Comunidad Valla Y Vuelva Santa Teresita','2020-02-16 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6131,116,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Femenino _ Edad:21 Años _ procedente del municipio La Primavera Localidad Vereda Aguas Claras-Finca Villamaluni','2020-02-16 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6132,117,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:19 Años _ procedente del municipio Cumaribo Localidad Barrio 11 De Noviembre','2020-02-17 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6133,118,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Puerto Carreño Localidad La Profunda','2020-02-17 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6134,119,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:40 Años _ procedente del municipio Cumaribo _ Localidad Sin Informacion','2020-02-17 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6135,120,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:33 Años _ procedente del municipio Santa Rosalia _ Localidad Barrio Centro','2020-02-17 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6136,121,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Masculino _ Edad:43 Años _ procedente del municipio La Primavera Localidad Cra 8 #3-43 Centro','2020-02-18 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6137,122,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:22 Años _ procedente del municipio Puerto Carreño Localidad Barrio Laprimavera','2020-02-18 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6138,123,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Masculino _ Edad:87 Años _ procedente del municipio Cumaribo Localidad Hogar Centro De Vida','2020-02-18 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6139,124,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Masculino _ Edad:42 Años _ procedente del municipio Cumaribo Localidad Vereda El Placer','2020-02-18 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6140,125,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Puerto Carreño Localidad Piedra Custodio','2020-02-18 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6141,126,1,'en_US',0,'Mortalidad por IRA','Se reporta un caso de Mortalidad por IRA en paciente de género Masculino _ Edad:8 Meses _ procedente del municipio Cumaribo Localidad Resguardo Indigena Matebueno','2020-02-18 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6142,127,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:30 Años _ procedente del municipio Puerto Carreño Localidad Barrio Santa Teresita','2020-02-19 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6143,128,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:21 Años _ procedente del municipio Puerto Carreño Localidad Barrio Camilo Cortes','2020-02-19 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6144,129,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:7 Años _ procedente del municipio Puerto Carreño Localidad Desconocido','2020-02-19 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6145,130,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:15 Años _ procedente del municipio Puerto Carreño Localidad Punta De Laja','2020-02-19 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6146,131,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Meses _ procedente del municipio Cumaribo Localidad Amanaven','2020-02-19 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6147,132,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:35 Años _ procedente del municipio Cumaribo _ Localidad Comunidad Puerto Guacome','2020-02-19 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6148,133,1,'en_US',0,'Bajo peso al nacer','Se reporta un caso de Bajo peso al nacer en paciente de género Femenino _ Edad:19 Años _ procedente del municipio Cumaribo Localidad Nuevo Horizonte','2020-02-21 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6149,134,1,'en_US',0,'Tuberculosis','Se reporta un caso de Tuberculosis en paciente de género Femenino _ Edad:40 Años _ procedente del municipio Puerto Carreño Localidad Mateo','2020-02-21 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6150,135,1,'en_US',0,'VIH','Se reporta un caso de VIH en paciente de género Masculino _ Edad:44 Años _ procedente del municipio Puerto Carreño Localidad Las Grajas','2020-02-21 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6151,136,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:66 Años _ procedente del municipio La Primavera Localidad Barrio Raymundo Cruz','2020-02-22 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6152,137,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Meses _ procedente del municipio Cumaribo Localidad Comunidad Puerto Rico- Resguardo Bajo Rio Vichada','2020-02-22 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6153,138,1,'en_US',0,'Intento de Suicidio','Se reporta un caso de Intento de Suicidio en paciente de género Femenino _ Edad:14 Años _ procedente del municipio La Primavera Localidad Vereda La Esperanza','2020-02-22 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6154,139,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:12 Años _ procedente del municipio Puerto Carreño _ Localidad Vereda Morichalito Bajo','2020-02-23 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6155,140,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:11 Meses _ procedente del municipio Cumaribo Localidad Resguardo Dewariacana Comunidad Ewa','2020-02-23 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6156,141,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:44 Años _ procedente del municipio Cumaribo _ Localidad Detras Del Acueducto','2020-02-23 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6157,142,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:2 Años _ procedente del municipio La Primavera Localidad Barrio Santander','2020-02-24 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6158,143,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:34 Años _ procedente del municipio Cumaribo Localidad Batallon Cumaribo','2020-02-24 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6159,144,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:18 Años _ procedente del municipio La Primavera _ Localidad Calle 14 Cr3 Y 4 Barrio San Fernando','2020-02-24 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6160,145,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:11 Meses _ procedente del municipio Cumaribo Localidad Sin Informacion','2020-02-25 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6161,146,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:16 Años _ procedente del municipio La Primavera _ Localidad Barrio Veracruz','2020-02-25 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6162,147,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:10 Años _ procedente del municipio La Primavera _ Localidad Barrio Veracruz','2020-02-25 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6163,148,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Cumaribo Localidad Comunidad De Morocoto','2020-02-26 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6164,149,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:11 Meses _ procedente del municipio Cumaribo _ Localidad Resguardo Indigena Waria','2020-02-26 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6165,150,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:48 Años _ procedente del municipio Cumaribo Localidad San Jose De Opune - Finca El Danubio','2020-02-27 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6166,151,1,'en_US',0,'Bajo peso al nacer','Se reporta un caso de Bajo peso al nacer en paciente de género Femenino _ Edad:17 Años _ procedente del municipio Cumaribo Localidad Comunidad Bopone','2020-02-27 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6167,152,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:4 Años _ procedente del municipio Puerto Carreño Localidad Comunidad Chaparral','2020-02-27 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6168,153,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:71 Años _ procedente del municipio Cumaribo Localidad Barrio Nuevo Hiorizonte','2020-02-27 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6169,154,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:19 Años _ procedente del municipio Puerto Carreño Localidad Barrio Las Acacias','2020-02-28 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6170,155,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Años _ procedente del municipio Cumaribo Localidad Resguardo San Luis Del Tomo - Comunidad Nueva Zela','2020-02-28 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6171,156,1,'en_US',0,'Lesiones de Causa Externa','Se reporta un caso de Lesiones de Causa Externa en paciente de género Masculino _ Edad:57 Años _ procedente del municipio Cumaribo Localidad Barrio Bombonera','2020-02-28 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6172,157,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:19 Años _ procedente del municipio La Primavera _ Localidad Centro','2020-02-28 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6173,158,1,'en_US',0,'Sífilis Gestacional','Se reporta un caso de Sífilis Gestacional en paciente de género Femenino _ Edad:37 Años _ procedente del municipio Cumaribo Bajo Rio Vichada 2 - Compuesto','2020-02-28 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6174,159,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:10 Años _ procedente del municipio La Primavera Localidad Llano Alto','2020-02-29 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6175,160,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:25 Años _ procedente del municipio Cumaribo Localidad Barrio Contigo Bloque 9 Torre 3 Apart 104','2020-02-29 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6176,161,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:30 Años _ procedente del municipio Cumaribo Localidad Batallon De Cumaribo','2020-02-29 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6177,162,1,'en_US',0,'Hepatitis B','Se reporta un caso de Hepatitis B en paciente de género Masculino _ Edad:20 Años _ procedente del municipio Puerto Carreño Localidad Brigada De Selva  Barrio Mateo','2020-02-29 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6178,163,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:33 Años _ procedente del municipio La Primavera _ Localidad Barrio Veracruz-La Primavera','2020-02-29 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6179,164,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:8 Años _ procedente del municipio Puerto Carreño Localidad Barrio Villa Gladys','2020-03-01 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6180,165,1,'en_US',0,'Bajo peso al nacer','Se reporta un caso de Bajo peso al nacer en paciente de género Femenino _ Edad:22 Años _ procedente del municipio Cumaribo Localidad Resguardo Bajo Rio Vichada','2020-03-01 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6181,166,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:37 Años _ procedente del municipio Puerto Carreño Localidad Barrio Samper','2020-03-02 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6182,167,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Masculino _ Edad:65 Años _ procedente del municipio Puerto Carreño Localidad Villa Del Carmen','2020-03-02 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6183,168,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:6 Años _ procedente del municipio Santa Rosalia Localidad Escuela Bartolome Alvi Guzman','2020-03-03 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6184,169,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Femenino _ Edad:48 Años _ procedente del municipio La Primavera Localidad Lechemiele-Matiyure','2020-03-03 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6185,170,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Femenino _ Edad:11 Meses _ procedente del municipio Cumaribo Localidad Comuidad Santa Elena','2020-03-03 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6186,171,1,'en_US',0,'Intento de Suicidio','Se reporta un caso de Intento de Suicidio en paciente de género Femenino _ Edad:15 Años _ procedente del municipio La Primavera Localidad Centro Primavera','2020-03-03 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6187,172,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:14 Años _ procedente del municipio Puerto Carreño _ Localidad Gabriel Robledo','2020-03-03 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6188,173,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:43 Años _ procedente del municipio La Primavera _ Localidad Barrio El Caudal','2020-03-03 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6189,174,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:34 Años _ procedente del municipio Cumaribo _ Localidad Resguardo Santa Teresita Tuparro Comunidad La Torm','2020-03-05 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6190,175,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Meses _ procedente del municipio Cumaribo Localidad Sin Informacion','2020-03-05 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6191,176,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Cumaribo Localidad Comunidad Matsuldany Resguardo Aiwakuna','2020-03-05 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6192,177,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Cumaribo Localidad Comunidad Matsuldany Resguardo Aiwa Kuna Tsepajibo','2020-03-05 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6193,178,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:2 Años _ procedente del municipio Puerto Carreño Localidad Barrio Samper','2020-03-05 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6194,179,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:25 Años _ procedente del municipio Puerto Carreño Localidad Barrio La Primavera','2020-03-07 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6195,180,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:21 Años _ procedente del municipio Cumaribo _ Localidad Centro','2020-03-07 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6196,181,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:24 Años _ procedente del municipio Puerto Carreño Localidad Barrio Tamarindo','2020-03-08 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6197,182,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Femenino _ Edad:15 Años _ procedente del municipio Cumaribo Localidad Ciomunidad Camuniana - Resguardo Aiwakuna','2020-03-08 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6198,183,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:19 Años _ procedente del municipio La Primavera Localidad El Trompillo','2020-03-09 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6199,184,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:36 Años _ procedente del municipio La Primavera _ Localidad Barrio Veracruz','2020-03-09 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6200,185,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:36 Años _ procedente del municipio Puerto Carreño Localidad Mateo','2020-03-10 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6201,186,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:3 Años _ procedente del municipio Cumaribo Localidad Comunidad Pilon-Resguardo Bajo Rio Vichada Sector','2020-03-10 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6202,187,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Femenino _ Edad:33 Años _ procedente del municipio Cumaribo Localidad Barrio Horizonte De Tras De La Soga','2020-03-10 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6203,188,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:4 Meses _ procedente del municipio La Primavera Localidad Resguardo La Pascua','2020-03-11 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6204,189,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Años _ procedente del municipio Puerto Carreño Localidad El Progreso','2020-03-11 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6205,190,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:25 Años _ procedente del municipio Cumaribo Localidad Barrio Yarumal','2020-03-11 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6206,191,1,'en_US',0,'Defectos Congénitos','Se reporta un caso de Defectos Congénitos en paciente de género Masculino _ Edad:1 Meses _ procedente del municipio Cumaribo Localidad Laguna Cacao','2020-03-12 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6207,192,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:19 Años _ procedente del municipio Cumaribo _ Localidad Laguna Cacao','2020-03-12 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6208,193,1,'en_US',0,'Sífilis Gestacional','Se reporta un caso de Sífilis Gestacional en paciente de género Femenino _ Edad:26 Años _ procedente del municipio La Primavera Barrio Manga Vieja','2020-03-12 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6209,194,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Femenino _ Edad:51 Años _ procedente del municipio La Primavera Localidad Vereda Matiyure','2020-03-13 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6210,195,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:2 Años _ procedente del municipio Puerto Carreño Localidad Barrio La Primavera','2020-03-13 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6211,196,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:11 Años _ procedente del municipio Puerto Carreño _ Localidad Barrio Calarca','2020-03-13 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6212,197,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:12 Años _ procedente del municipio Puerto Carreño _ Localidad Villa Gladys Manzaba B','2020-03-13 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6213,198,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:13 Años _ procedente del municipio Puerto Carreño _ Localidad Barrio Calarca','2020-03-13 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6214,199,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:33 Años _ procedente del municipio Puerto Carreño Localidad Barrio Mateo','2020-03-14 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6215,200,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Femenino _ Edad:37 Años _ procedente del municipio Cumaribo Localidad Cumaribo - Vichada','2020-03-14 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6216,201,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:63 Años _ procedente del municipio Santa Rosalia Localidad Centro','2020-03-15 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6217,202,1,'en_US',0,'Varicela','Se reporta un caso de Varicela en paciente de género Femenino _ Edad:14 Años _ procedente del municipio Cumaribo Localidad Barrio Centro Cumaribo','2020-03-15 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6218,203,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Masculino _ Edad:40 Años _ procedente del municipio Cumaribo Localidad Buena Vista - Reg Santa Teresita','2020-03-15 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6219,204,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:6 Meses _ procedente del municipio Puerto Carreño Localidad Ci Canalitojo','2020-03-15 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6220,205,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:59 Años _ procedente del municipio Puerto Carreño Localidad Barrio Camilo Cortes Calle24n10a02','2020-03-16 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6221,206,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:18 Años _ procedente del municipio Puerto Carreño _ Localidad Chaparral','2020-03-16 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6222,207,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:27 Años _ procedente del municipio Puerto Carreño _ Localidad Barrio Santa Elenita','2020-03-16 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6223,208,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:39 Años _ procedente del municipio La Primavera Localidad Barrio Veracruz','2020-03-17 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6224,209,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:7 Años _ procedente del municipio Cumaribo Localidad Barrio Alcaraban','2020-03-17 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6225,210,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:21 Años _ procedente del municipio Cumaribo _ Localidad Resguardo Guacamayas Mamiyare','2020-03-17 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6226,211,1,'en_US',0,'Tuberculosis','Se reporta un caso de Tuberculosis en paciente de género Femenino _ Edad:64 Años _ procedente del municipio Puerto Carreño Localidad Barrio Calarca','2020-03-17 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6227,212,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:2 Años _ procedente del municipio Cumaribo Localidad Barranquito','2020-03-17 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6228,213,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Años _ procedente del municipio Puerto Carreño Localidad Mateo Frente Al Gallinero','2020-03-17 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6229,214,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:31 Años _ procedente del municipio Puerto Carreño Localidad Barrio La Primavera','2020-03-17 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6230,215,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Masculino _ Edad:20 Años _ procedente del municipio Puerto Carreño _ Localidad Mateo Brigada De Selva 28','2020-03-17 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6231,216,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:22 Años _ procedente del municipio Puerto Carreño _ Localidad Barrio La Esperanza','2020-03-18 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6232,217,1,'en_US',0,'Varicela','Se reporta un caso de Varicela en paciente de género Masculino _ Edad:8 Años _ procedente del municipio Puerto Carreño Localidad Barrio Santa Teresita','2020-03-18 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6233,218,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:18 Años _ procedente del municipio Cumaribo _ Localidad Comunidad Monterrey Resguardo Santa Teresita','2020-03-19 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6234,219,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:53 Años _ procedente del municipio Puerto Carreño Localidad Alcaravan','2020-03-19 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6235,220,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:38 Años _ procedente del municipio Puerto Carreño Localidad Barrio Villa Orinoco','2020-03-19 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6236,221,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Masculino _ Edad:2 Años _ procedente del municipio Cumaribo _ Localidad Barranquito','2020-03-19 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6237,222,1,'en_US',0,'Varicela','Se reporta un caso de Varicela en paciente de género Femenino _ Edad:21 Años _ procedente del municipio Puerto Carreño Localidad Centro','2020-03-19 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6238,223,1,'en_US',0,'Defectos Congénitos','Se reporta un caso de Defectos Congénitos en paciente de género Masculino _ Edad:2 Meses _ procedente del municipio Puerto Carreño Localidad Puerto Colombia','2020-03-20 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6239,224,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Cumaribo Localidad Santo Domingo','2020-03-20 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6240,225,1,'en_US',0,'Intento de Suicidio','Se reporta un caso de Intento de Suicidio en paciente de género Masculino _ Edad:34 Años _ procedente del municipio Cumaribo Localidad Dicolino Matu','2020-03-20 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6241,226,1,'en_US',0,'Intoxicación','Se reporta un caso de Intoxicación en paciente de género Masculino _ Edad:34 Años _ procedente del municipio Cumaribo Localidad Dicolino Matu','2020-03-20 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6242,227,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:2 Años _ procedente del municipio Cumaribo Localidad Sarrapia','2020-03-21 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6243,228,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:2 Años _ procedente del municipio Cumaribo Localidad Sarrapia','2020-03-21 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6244,229,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:38 Años _ procedente del municipio Puerto Carreño Localidad Mateo','2020-03-21 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6245,230,1,'en_US',0,'Sífilis Gestacional','Se reporta un caso de Sífilis Gestacional en paciente de género Femenino _ Edad:26 Años _ procedente del municipio Cumaribo _ Localidad Comunidad Paloma - Reg Caño Cabare','2020-03-22 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6246,231,1,'en_US',0,'Sífilis Gestacional','Se reporta un caso de Sífilis Gestacional en paciente de género Femenino _ Edad:27 Años _ procedente del municipio Cumaribo _ Localidad Inspeccion Palmarito','2020-03-23 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6247,232,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:25 Años _ procedente del municipio Puerto Carreño Localidad Callle 14a Numero 4-63 Barrio Laguna','2020-03-24 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6248,233,1,'en_US',0,'Bajo peso al nacer','Se reporta un caso de Bajo peso al nacer en paciente de género Femenino _ Edad:24 Años _ procedente del municipio Cumaribo Localidad Comunidad Palmar Resguardo Bajo Rio Vichada Sector','2020-03-24 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6249,234,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:18 Años _ procedente del municipio Cumaribo _ Localidad Comunidad Monterrey Resguardo Santa Teresita','2020-03-27 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6250,235,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:18 Años _ procedente del municipio Puerto Carreño Localidad Sin Informacion','2020-03-28 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6251,236,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Cumaribo Localidad Piedra Pintada','2020-03-28 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6252,237,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:2 Años _ procedente del municipio Cumaribo Localidad Caño Mure','2020-03-28 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6253,238,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Cumaribo Localidad Sarrapia  Comunidad De San Jose','2020-03-28 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6254,239,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:4 Años _ procedente del municipio Cumaribo Localidad Sarrapia  Laguna Marano','2020-03-28 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6255,240,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:4 Años _ procedente del municipio Cumaribo Localidad Sarrapia   Laguna Marano','2020-03-28 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6256,241,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:14 Años _ procedente del municipio Cumaribo _ Localidad Sarrapia  San Pedro','2020-03-28 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6257,242,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Femenino _ Edad:18 Años _ procedente del municipio Cumaribo Localidad Barrio Centro','2020-03-29 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6258,243,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:10 Meses _ procedente del municipio Puerto Carreño Localidad La Venturosa','2020-03-29 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6259,244,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:14 Años _ procedente del municipio Puerto Carreño Localidad Barrio Santa Teresita','2020-03-29 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6260,245,1,'en_US',0,'Bajo peso al nacer','Se reporta un caso de Bajo peso al nacer en paciente de género Femenino _ Edad:23 Años _ procedente del municipio La Primavera Localidad El Trompillo','2020-03-30 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6261,246,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:21 Años _ procedente del municipio Santa Rosalia _ Localidad Ese Hospital San Juan De Dios Santa Rosalia','2020-03-30 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6262,247,1,'en_US',0,'Varicela','Se reporta un caso de Varicela en paciente de género Femenino _ Edad:29 Años _ procedente del municipio Puerto Carreño Localidad Barrio Villa Gladys','2020-03-30 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6263,248,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:29 Años _ procedente del municipio Puerto Carreño Localidad Barrio Calarca','2020-03-31 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6264,249,1,'en_US',0,'VIH','Se reporta un caso de VIH en paciente de género Femenino _ Edad:22 Años _ procedente del municipio Puerto Carreño Localidad Kr 36 37 167 Soacha','2020-03-31 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6265,250,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Femenino _ Edad:59 Años _ procedente del municipio San Luis De Palenque Localidad Ese Hospital San Juan De Dios Santa Rosalia','2020-04-01 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6266,251,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Masculino _ Edad:46 Años _ procedente del municipio Trinidad Localidad Ese San Juan De Dios Santa Rosalia','2020-04-01 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6267,252,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:20 Años _ procedente del municipio Santa Rosalia Localidad Vereda San Marcos Finca Villa Erika','2020-04-01 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6268,253,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Meses _ procedente del municipio Cumaribo Localidad Comunidad Dante Resguardo Aikawuna','2020-04-02 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6269,254,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:58 Años _ procedente del municipio Puerto Carreño Localidad Villa Orinoco','2020-04-03 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6270,255,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Femenino _ Edad:5 Años _ procedente del municipio Cumaribo Localidad Comunidad Villamonfor Resg San Luis Del Tomo','2020-04-03 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6271,256,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:10 Años _ procedente del municipio La Primavera Localidad Barrio El Triunfo-Detras Del Matadero','2020-04-03 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6272,257,1,'en_US',0,'Enfermedades Huérfanas','Se reporta un caso de Enfermedades Huérfanas en paciente de género Femenino _ Edad:12 Años _ procedente del municipio La Primavera Localidad Barrio El Jardin Carrera 20','2020-04-03 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6273,258,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:1 Meses _ procedente del municipio Cumaribo _ Localidad Comunidad Santa Rosario Resguardo Aiwakuna','2020-04-03 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6274,259,1,'en_US',0,'Tuberculosis','Se reporta un caso de Tuberculosis en paciente de género Masculino _ Edad:58 Años _ procedente del municipio Puerto Carreño Localidad Piedra De Custodio','2020-04-04 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6275,260,1,'en_US',0,'Intoxicación','Se reporta un caso de Intoxicación en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Puerto Carreño Localidad Las Granjas','2020-04-04 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6276,261,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Masculino _ Edad:22 Años _ procedente del municipio La Primavera Localidad Sin Informacion','2020-04-05 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6277,262,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:1 Años _ procedente del municipio La Primavera Localidad Bello Horizonte','2020-04-08 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6278,263,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:14 Años _ procedente del municipio Cumaribo Localidad Barrio Centro','2020-04-08 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6279,264,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Femenino _ Edad:37 Años _ procedente del municipio Santa Rosalia Localidad Calle 6# 15- 156','2020-04-08 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6280,265,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:15 Años _ procedente del municipio Puerto Carreño _ Localidad Barrio Villa Gladys','2020-04-08 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6281,266,1,'en_US',0,'IRAG','Se reporta un caso de IRAG en paciente de género Femenino _ Edad:51 Años _ procedente del municipio Puerto Carreño Localidad Barrio Santa Teresita','2020-04-09 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6282,267,1,'en_US',0,'Varicela','Se reporta un caso de Varicela en paciente de género Masculino _ Edad:11 Años _ procedente del municipio Cumaribo Localidad Barrio Nuevo Horizonte','2020-04-09 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6283,268,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:42 Años _ procedente del municipio Cumaribo _ Localidad Barrio Centro','2020-04-10 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6284,269,1,'en_US',0,'Mortalidad por IRA','Se reporta un caso de Mortalidad por IRA en paciente de género Femenino _ Edad:10 Meses _ procedente del municipio Cumaribo Localidad Sin Informacion','2020-04-11 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6285,270,1,'en_US',0,'Sífilis Gestacional','Se reporta un caso de Sífilis Gestacional en paciente de género Femenino _ Edad:27 Años _ procedente del municipio Cumaribo _ Localidad Barrio Centro','2020-04-11 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6286,271,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:2 Años _ procedente del municipio Santa Rosalia Localidad Cra18 #17-149','2020-04-13 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6287,272,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:2 Años _ procedente del municipio Puerto Carreño Localidad Vereda Gavilan Pollero','2020-04-13 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6288,273,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:20 Años _ procedente del municipio La Primavera _ Localidad Bello Horizonte','2020-04-14 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6289,274,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:20 Años _ procedente del municipio Cumaribo Localidad Inspeccion Las Matas','2020-04-15 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6290,275,1,'en_US',0,'Tuberculosis','Se reporta un caso de Tuberculosis en paciente de género Femenino _ Edad:56 Años _ procedente del municipio Santa Rosalia Localidad Vichada - Barrio Santa Rosalia','2020-04-15 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6291,276,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:36 Años _ procedente del municipio Cumaribo Localidad Kr 50  18  06','2020-04-15 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6292,277,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:2 Meses _ procedente del municipio Puerto Carreño Localidad La Primavera','2020-04-15 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6293,278,1,'en_US',0,'Intento de Suicidio','Se reporta un caso de Intento de Suicidio en paciente de género Femenino _ Edad:12 Años _ procedente del municipio Santa Rosalia Localidad Pueblo Nuevo','2020-04-16 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6294,279,1,'en_US',0,'Sífilis Congénita','Se reporta un caso de Sífilis Congénita en paciente de género Femenino _ Edad:3 Dias _ procedente del municipio Puerto Carreño _ Localidad El Puerto','2020-04-16 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6295,280,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Femenino _ Edad:2 Años _ procedente del municipio Cumaribo Localidad Comunidad De Carlos Lata','2020-04-17 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6296,281,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:24 Años _ procedente del municipio Cumaribo Localidad Batallon De Infanteria Biroj43','2020-04-18 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6297,282,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:29 Años _ procedente del municipio Cumaribo Localidad Batallon De Infanteria Biroj43','2020-04-18 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6298,283,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:24 Años _ procedente del municipio Cumaribo Localidad Batallon De Infanteria Biroj43','2020-04-18 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6299,284,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:51 Años _ procedente del municipio Cumaribo _ Localidad Barrio Alcaraban Cll 8 Casa 8 - 09','2020-04-18 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6300,285,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:38 Años _ procedente del municipio La Primavera _ Localidad Finca Al Pie De Amparo Mora','2020-04-18 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6301,286,1,'en_US',0,'Varicela','Se reporta un caso de Varicela en paciente de género Femenino _ Edad:26 Años _ procedente del municipio Puerto Carreño Localidad Barrio Arturo Bueno','2020-04-19 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6302,287,1,'en_US',0,'Intoxicación','Se reporta un caso de Intoxicación en paciente de género Masculino _ Edad:37 Años _ procedente del municipio La Primavera Localidad Bello Horizonte','2020-04-19 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6303,288,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:51 Años _ procedente del municipio Cumaribo Localidad Sejalito','2020-04-20 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6304,289,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:17 Años _ procedente del municipio Cumaribo _ Localidad Cabecera Municipal Al Frente De La Policia','2020-04-20 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6305,290,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Masculino _ Edad:1 Años _ procedente del municipio Cumaribo _ Localidad Inspeccion Palmarito','2020-04-20 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6306,291,1,'en_US',0,'IRAG','Se reporta un caso de IRAG en paciente de género Femenino _ Edad:77 Años _ procedente del municipio Cumaribo Localidad Cumaribo Vichada  El Triunfo','2020-04-21 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6307,292,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:31 Años _ procedente del municipio Cumaribo _ Localidad Sin Informacion','2020-04-21 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6308,293,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:34 Años _ procedente del municipio Santa Rosalia Localidad Finca La Tardanza Vereda Pavanay','2020-04-21 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6309,294,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:6 Años _ procedente del municipio Cumaribo _ Localidad Comunidad Puerto Paloma - Resguardo Santa Teresita','2020-04-21 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6310,295,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:15 Años _ procedente del municipio Puerto Carreño _ Localidad B Alcaravan Al Lado Del Sr Israel Manchola','2020-04-21 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6311,296,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Masculino _ Edad:64 Años _ procedente del municipio La Primavera Localidad Sin Informacion','2020-04-22 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6312,297,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:38 Años _ procedente del municipio Puerto Carreño Localidad Barrio Villa Gladys','2020-04-22 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6313,298,1,'en_US',0,'Defectos Congénitos','Se reporta un caso de Defectos Congénitos en paciente de género Masculino _ Edad:0 0 _ procedente del municipio Puerto Carreño Localidad Puerto Nuevo','2020-04-22 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6314,299,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Femenino _ Edad:9 Meses _ procedente del municipio La Primavera Localidad Sin Informacion','2020-04-23 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6315,300,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:19 Años _ procedente del municipio La Primavera Localidad Batallon','2020-04-23 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6316,301,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Femenino _ Edad:9 Meses _ procedente del municipio La Primavera Localidad Barrio Jardin 1','2020-04-23 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6317,302,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Masculino _ Edad:37 Años _ procedente del municipio Cumaribo Localidad Comunidad Querey - Resguardo Aiwakuna','2020-04-23 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6318,303,1,'en_US',0,'Enfermedades Huérfanas','Se reporta un caso de Enfermedades Huérfanas en paciente de género Femenino _ Edad:52 Años _ procedente del municipio Puerto Carreño Localidad Carrera 14 30 10 Barrio La Esperanza','2020-04-23 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6319,304,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:20 Años _ procedente del municipio La Primavera Localidad Centro Primavera','2020-04-24 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6320,305,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:15 Años _ procedente del municipio Santa Rosalia _ Localidad Barrio Ciencia','2020-04-24 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6321,306,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:31 Años _ procedente del municipio Cumaribo Localidad Batallon De Infanteria Biroj43','2020-04-25 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6322,307,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:21 Años _ procedente del municipio Cumaribo _ Localidad Resguardo Saracure','2020-04-25 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6323,308,1,'en_US',0,'Varicela','Se reporta un caso de Varicela en paciente de género Femenino _ Edad:2 Años _ procedente del municipio Cumaribo Localidad Comunidad Buenavista','2020-04-25 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6324,309,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Femenino _ Edad:21 Años _ procedente del municipio La Primavera Localidad Inspección Matiyure','2020-04-26 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6325,310,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:19 Años _ procedente del municipio Puerto Carreño Localidad B Alcaravan  Diagonal Cancha La Perrera','2020-04-28 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6326,311,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:70 Años _ procedente del municipio Puerto Carreño Localidad Barrio La Primavera Cra 12#12-69','2020-04-28 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6327,312,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:40 Años _ procedente del municipio Cumaribo _ Localidad San Rafael','2020-04-29 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6328,313,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Años _ procedente del municipio Cumaribo Localidad Resguardo Via Tuparro','2020-04-30 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6329,314,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:2 Años _ procedente del municipio Puerto Carreño Localidad Calarca','2020-04-30 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6330,315,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Masculino _ Edad:6 Años _ procedente del municipio Cumaribo Localidad Nuevo Horizonte','2020-05-01 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6331,316,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:34 Años _ procedente del municipio Puerto Carreño Localidad Barrio Las Granjas','2020-05-01 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6332,317,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:3 Meses _ procedente del municipio La Primavera Localidad Resguardo La Pascua-Comunidad El Progreso','2020-05-01 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6333,318,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:27 Años _ procedente del municipio Cumaribo _ Localidad Comunidad Chaparral - Resguarod Merey','2020-05-01 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6334,319,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:40 Años _ procedente del municipio Cumaribo _ Localidad San Rafael','2020-05-01 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6335,320,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:43 Años _ procedente del municipio Cumaribo _ Localidad Resguardo Santa Teresita','2020-05-01 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6336,321,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Masculino _ Edad:16 Años _ procedente del municipio La Primavera Localidad Vereda Agua Verde','2020-05-02 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6337,322,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:9 Años _ procedente del municipio Puerto Carreño Localidad Barrio Centro','2020-05-03 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6338,323,1,'en_US',0,'VIH','Se reporta un caso de VIH en paciente de género Masculino _ Edad:42 Años _ procedente del municipio Cumaribo Localidad Resguardo Ariguana','2020-05-03 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6339,324,1,'en_US',0,'IRAG','Se reporta un caso de IRAG en paciente de género Masculino _ Edad:8 Meses _ procedente del municipio Cumaribo Localidad Resguardo Indigena Bajo Rio Vichada Sector 1','2020-05-04 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6340,325,1,'en_US',0,'Bajo peso al nacer','Se reporta un caso de Bajo peso al nacer en paciente de género Femenino _ Edad:27 Años _ procedente del municipio La Primavera Localidad Resguardo La Pascua-Comunidad El Progreso','2020-05-04 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6341,326,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Puerto Carreño Localidad Comunidad Chaparral','2020-05-04 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6342,327,1,'en_US',0,'Intento de Suicidio','Se reporta un caso de Intento de Suicidio en paciente de género Masculino _ Edad:21 Años _ procedente del municipio La Primavera Localidad Diivino Niño Cra 11 # 450','2020-05-04 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6343,328,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:11 Años _ procedente del municipio Puerto Carreño _ Localidad Barrio Calarca','2020-05-04 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6344,329,1,'en_US',0,'Meningitis Bacteriana','Se reporta un caso de Meningitis Bacteriana en paciente de género Masculino _ Edad:8 Meses _ procedente del municipio Cumaribo Localidad Comunidad Plataniyas-Resguardo Indigena Sector 1 B','2020-05-05 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6345,330,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Meses _ procedente del municipio Cumaribo Localidad Barrio Alcaraban','2020-05-05 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6346,331,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Cumaribo Localidad Mapisiare','2020-05-05 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6347,332,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:8 Meses _ procedente del municipio Puerto Carreño Localidad Simon Bolivar A Tres Casa De La Panaderia De Dos P','2020-05-05 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6348,333,1,'en_US',0,'Intento de Suicidio','Se reporta un caso de Intento de Suicidio en paciente de género Femenino _ Edad:52 Años _ procedente del municipio La Primavera Localidad Barrio Centro','2020-05-05 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6349,334,1,'en_US',0,'Sífilis Gestacional','Se reporta un caso de Sífilis Gestacional en paciente de género Femenino _ Edad:17 Años _ procedente del municipio La Primavera _ Localidad Barrio Centro','2020-05-05 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6350,335,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:24 Años _ procedente del municipio Cumaribo Localidad Calle18 Carrera 1 # 18ab - Barrio Nueva Frontera','2020-05-06 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6351,336,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Femenino _ Edad:17 Años _ procedente del municipio Cumaribo Localidad Comunidad Mirador Resg Aiwakuna','2020-05-06 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6352,337,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:29 Años _ procedente del municipio Puerto Carreño Localidad Barrio Santa Monica','2020-05-06 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6353,338,1,'en_US',0,'Sífilis Gestacional','Se reporta un caso de Sífilis Gestacional en paciente de género Femenino _ Edad:20 Años _ procedente del municipio La Primavera _ Localidad Barrio Centro','2020-05-06 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6354,339,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Masculino _ Edad:6 Años _ procedente del municipio Puerto Carreño _ Localidad Barrio Santa Teresita','2020-05-06 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6355,340,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:24 Años _ procedente del municipio Cumaribo Localidad Carrera 12 Calle 29 Barrio Chupundun','2020-05-07 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6356,341,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Masculino _ Edad:33 Años _ procedente del municipio Cumaribo Localidad Comunidad Matsuldani - Resg Aiwakuna','2020-05-07 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6357,342,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Años _ procedente del municipio Puerto Carreño Localidad Asentamiento Ciner','2020-05-07 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6358,343,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:37 Años _ procedente del municipio Cumaribo _ Localidad Comunidad Corocora - Resguardo Rio Tomo Webery','2020-05-08 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6359,344,1,'en_US',0,'Sífilis Congénita','Se reporta un caso de Sífilis Congénita en paciente de género Masculino _ Edad:7 Dias _ procedente del municipio La Primavera _ Localidad Santa Barbara','2020-05-09 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6360,345,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:1 Meses _ procedente del municipio Cumaribo _ Localidad Barrio Centro','2020-05-09 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6361,346,1,'en_US',0,'Bajo peso al nacer','Se reporta un caso de Bajo peso al nacer en paciente de género Femenino _ Edad:21 Años _ procedente del municipio La Primavera Localidad Cabecera Muniicipal','2020-05-10 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6362,347,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Meses _ procedente del municipio Puerto Carreño Localidad Resguardo Bajo Rio Comunidad Kuraze','2020-05-10 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6363,348,1,'en_US',0,'IRAG','Se reporta un caso de IRAG en paciente de género Femenino _ Edad:58 Años _ procedente del municipio La Primavera Localidad La Primavera','2020-05-11 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6364,349,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:27 Años _ procedente del municipio Puerto Carreño _ Localidad Barrio Simon Boivar','2020-05-11 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6365,350,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:46 Años _ procedente del municipio Puerto Carreño Localidad Barrio Mateo','2020-05-11 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6366,351,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:24 Años _ procedente del municipio Cumaribo Localidad Comunidad Puerto Colombia','2020-05-12 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6367,352,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:9 Meses _ procedente del municipio Puerto Carreño Localidad Barrio Simon Bolivar','2020-05-12 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6368,353,1,'en_US',0,'Varicela','Se reporta un caso de Varicela en paciente de género Masculino _ Edad:7 Años _ procedente del municipio Cumaribo Localidad Comunidad San Pedro- Resguardo Bajo Rio Vichada Se','2020-05-13 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6369,354,1,'en_US',0,'Varicela','Se reporta un caso de Varicela en paciente de género Masculino _ Edad:12 Años _ procedente del municipio Cumaribo Localidad Comunidad San Redro- Resguardo Bajo Rio Vichada Se','2020-05-13 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6370,355,1,'en_US',0,'Varicela','Se reporta un caso de Varicela en paciente de género Femenino _ Edad:9 Años _ procedente del municipio Cumaribo Localidad Comunidad San Pedro- Resguardo Bajo Rio Vichada Se','2020-05-13 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6371,356,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:22 Años _ procedente del municipio Santa Rosalia _ Localidad Pueblo Nuevo','2020-05-13 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6372,357,1,'en_US',0,'IRAG','Se reporta un caso de IRAG en paciente de género Femenino _ Edad:4 Meses _ procedente del municipio Cumaribo Localidad Comunidad Tsawaliwalii Del Resguardo Auwakuna Tsep','2020-05-14 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6373,358,1,'en_US',0,'Mortalidad por IRA','Se reporta un caso de Mortalidad por IRA en paciente de género Femenino _ Edad:4 Meses _ procedente del municipio Cumaribo Localidad Comunidad Tsawaliwali Del Resguardo Auwakuna Tsepa','2020-05-14 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6374,359,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:25 Años _ procedente del municipio Puerto Carreño Localidad Barrio El Centro Comando','2020-05-14 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6375,360,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Cumaribo Localidad Comunidad Sucuara Brv Sector  2','2020-05-15 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6376,361,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Puerto Carreño Localidad Guaripa Yapacana','2020-05-15 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6377,362,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Femenino _ Edad:22 Años _ procedente del municipio Puerto Carreño Localidad Barrio Samper','2020-05-15 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6378,363,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:36 Años _ procedente del municipio Puerto Carreño Localidad Jabali Rojo','2020-05-15 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6379,364,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Masculino _ Edad:38 Años _ procedente del municipio Puerto Carreño _ Localidad Barrio El Recreo','2020-05-15 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6380,365,1,'en_US',0,'IRAG','Se reporta un caso de IRAG en paciente de género Femenino _ Edad:78 Años _ procedente del municipio Cumaribo Localidad El Viento Vichada','2020-05-16 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6381,366,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:2 Años _ procedente del municipio Cumaribo Localidad La Carretera - Amanaven - San Fernando De Atabapo','2020-05-16 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6382,367,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:10 Meses _ procedente del municipio Cumaribo Localidad Amanaven - Atabapo Centro 1','2020-05-16 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6383,368,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Años _ procedente del municipio Puerto Carreño Localidad Sin Informacion','2020-05-16 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6384,369,1,'en_US',0,'Bajo peso al nacer','Se reporta un caso de Bajo peso al nacer en paciente de género Femenino _ Edad:21 Años _ procedente del municipio Cumaribo Localidad Comunidad Macarena Resguardo Indigena Saracure','2020-05-18 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6385,370,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Masculino _ Edad:4 Meses _ procedente del municipio Cumaribo Localidad Comunidad Matsuldani Resguardo  Aiwuakuna','2020-05-18 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6386,371,1,'en_US',0,'Enfermedades Huérfanas','Se reporta un caso de Enfermedades Huérfanas en paciente de género Masculino _ Edad:48 Años _ procedente del municipio Puerto Carreño Localidad Vereda Mateo','2020-05-18 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6387,372,1,'en_US',0,'IRAG','Se reporta un caso de IRAG en paciente de género Masculino _ Edad:62 Años _ procedente del municipio Puerto Carreño Localidad Kr 9 21 09','2020-05-19 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6388,373,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:4 Años _ procedente del municipio Cumaribo Localidad Comunidad Piñalito Morichal Brvs2','2020-05-19 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6389,374,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:27 Años _ procedente del municipio Santa Rosalia Localidad Calle 6  15-48 Pueblo Nuevo','2020-05-19 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6390,375,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Masculino _ Edad:4 Años _ procedente del municipio Cumaribo _ Localidad Comunidadpiñalito  Morichal  Brvs2','2020-05-19 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6391,376,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:12 Años _ procedente del municipio Cumaribo _ Localidad Comunidad Las Pavas- Resguardo Ori','2020-05-19 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6392,377,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Femenino _ Edad:52 Años _ procedente del municipio Cumaribo Localidad Matagrande','2020-05-20 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6393,378,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Meses _ procedente del municipio Puerto Carreño Localidad Barrio Piedra Custodio 3','2020-05-21 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6394,379,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:23 Años _ procedente del municipio Puerto Carreño Localidad Km 3 Via Usme','2020-05-21 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6395,380,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:28 Años _ procedente del municipio Puerto Carreño Localidad Km3 Via Usme','2020-05-22 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6396,381,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:32 Años _ procedente del municipio Puerto Carreño Localidad Km 3 Via Usme','2020-05-22 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6397,382,1,'en_US',0,'Bajo peso al nacer','Se reporta un caso de Bajo peso al nacer en paciente de género Femenino _ Edad:25 Años _ procedente del municipio Puerto Carreño Localidad Barrio Camilo Cortes','2020-05-22 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6398,383,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:15 Años _ procedente del municipio Puerto Carreño Localidad Barrio San Jose','2020-05-22 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6399,384,1,'en_US',0,'Intoxicación','Se reporta un caso de Intoxicación en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Puerto Carreño Localidad Barrio Simon Bolivar','2020-05-22 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6400,385,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:33 Años _ procedente del municipio Puerto Carreño _ Localidad Barrio Santa Teresita','2020-05-22 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6401,386,1,'en_US',0,'IRAG','Se reporta un caso de IRAG en paciente de género Masculino _ Edad:4 Años _ procedente del municipio Cumaribo Localidad Comunidad Indigena Piñalito-Morichalito Sector 2','2020-05-23 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6402,387,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:4 Años _ procedente del municipio Cumaribo Localidad Comunidadmacion','2020-05-23 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6403,388,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:26 Años _ procedente del municipio Puerto Carreño Localidad Barrio Villa Orinoco','2020-05-23 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6404,389,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Masculino _ Edad:4 Años _ procedente del municipio Cumaribo _ Localidad Comunidad San Piñalito','2020-05-23 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6405,390,1,'en_US',0,'Mortalidad por IRA','Se reporta un caso de Mortalidad por IRA en paciente de género Masculino _ Edad:6 Meses _ procedente del municipio Cumaribo Localidad Comunidad Amuechenevo - Resguardo Bajo Rio Vichada','2020-05-24 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6406,391,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Masculino _ Edad:6 Meses _ procedente del municipio Cumaribo _ Localidad Comunidad Amuechenebo Brvs1','2020-05-24 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6407,392,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:43 Años _ procedente del municipio Puerto Carreño Localidad Barrio Mateo','2020-05-25 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6408,393,1,'en_US',0,'Mortalidad por IRA','Se reporta un caso de Mortalidad por IRA en paciente de género Masculino _ Edad:4 Años _ procedente del municipio Cumaribo Localidad Comunidad Indigena Piñalito-Morichalito Sector 2','2020-05-25 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6409,394,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Femenino _ Edad:52 Años _ procedente del municipio Santa Rosalia Localidad Pueblo Nuevo','2020-05-26 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6410,395,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Femenino _ Edad:33 Años _ procedente del municipio Cumaribo Localidad Barrio Nuevo Horizonte','2020-05-27 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6411,396,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Femenino _ Edad:45 Años _ procedente del municipio Cumaribo Localidad Comunidad Bopone - Resguardo Aiwakuna','2020-05-27 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6412,397,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Puerto Carreño Localidad Sin Informacion','2020-05-28 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6413,398,1,'en_US',0,'Sífilis Gestacional','Se reporta un caso de Sífilis Gestacional en paciente de género Femenino _ Edad:32 Años _ procedente del municipio La Primavera _ Localidad Finca Villa Sofia Via A La Defensa Civil','2020-05-28 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6414,399,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Femenino _ Edad:16 Años _ procedente del municipio Puerto Carreño Localidad Barrio Santa Teresita','2020-05-29 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6415,400,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Años _ procedente del municipio Puerto Carreño Localidad Relleno Sanitario','2020-05-29 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6416,401,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:18 Años _ procedente del municipio Cumaribo _ Localidad Zarrapia - Mataven - Rio Orinoco','2020-05-29 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6417,402,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:18 Años _ procedente del municipio Cumaribo _ Localidad Zarrapia - Mataven - Rio Orinoco','2020-05-29 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6418,403,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Masculino _ Edad:3 Años _ procedente del municipio La Primavera _ Localidad Vereda Agua Verde','2020-05-29 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6419,404,1,'en_US',0,'Bajo peso al nacer','Se reporta un caso de Bajo peso al nacer en paciente de género Femenino _ Edad:25 Años _ procedente del municipio Santa Rosalia Localidad Centro Sector Pueblo Viejo','2020-06-01 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6420,405,1,'en_US',0,'Varicela','Se reporta un caso de Varicela en paciente de género Masculino _ Edad:10 Meses _ procedente del municipio Cumaribo Localidad Comunidad Wuaturiba','2020-06-01 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6421,406,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:5 Meses _ procedente del municipio Cumaribo Localidad Las Palmas','2020-06-01 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6422,407,1,'en_US',0,'Defectos Congénitos','Se reporta un caso de Defectos Congénitos en paciente de género Femenino _ Edad:4 Dias _ procedente del municipio Santa Rosalia Localidad Barrio Centro Sector Pueblo Viejo','2020-06-01 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6423,408,1,'en_US',0,'Sífilis Gestacional','Se reporta un caso de Sífilis Gestacional en paciente de género Femenino _ Edad:36 Años _ procedente del municipio Puerto Carreño _ Localidad Barrio La Esperanza','2020-06-01 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6424,409,1,'en_US',0,'VIH','Se reporta un caso de VIH en paciente de género Masculino _ Edad:44 Años _ procedente del municipio Puerto Carreño Localidad Kr 7 Barrio La Granja','2020-06-01 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6425,410,1,'en_US',0,'Intoxicación','Se reporta un caso de Intoxicación en paciente de género Masculino _ Edad:5 Meses _ procedente del municipio Cumaribo Localidad Las Palmas','2020-06-02 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6426,411,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Masculino _ Edad:6 Años _ procedente del municipio Cumaribo Localidad Barrio Alcaraban','2020-06-02 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6427,412,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Masculino _ Edad:5 Meses _ procedente del municipio Cumaribo _ Localidad Las Palmas','2020-06-02 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6428,413,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Masculino _ Edad:4 Años _ procedente del municipio Cumaribo Localidad Barrio Centro','2020-06-03 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6429,414,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:28 Años _ procedente del municipio Puerto Carreño _ Localidad Puerto Carreño','2020-06-04 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6430,415,1,'en_US',0,'IRAG','Se reporta un caso de IRAG en paciente de género Femenino _ Edad:2 Meses _ procedente del municipio Cumaribo Localidad Resguardo Bajo Rio Sector Ii-Comunidad Kuraze','2020-06-05 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6431,416,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:12 Años _ procedente del municipio Puerto Carreño Localidad Barrio La Florida  Frente A La Concha Acustica','2020-06-05 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6432,417,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Masculino _ Edad:1 Años _ procedente del municipio Cumaribo _ Localidad Vereda Guerima','2020-06-05 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6433,418,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Masculino _ Edad:3 Años _ procedente del municipio Puerto Carreño _ Localidad Mz 5 Casa 18 Perla Del Sur','2020-06-06 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6434,419,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:28 Años _ procedente del municipio Puerto Carreño Localidad Barrio Calarca','2020-06-06 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6435,420,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:25 Años _ procedente del municipio Puerto Carreño Localidad Barrio La Florida','2020-06-06 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6436,421,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:11 Años _ procedente del municipio Puerto Carreño Localidad Barrio Villa Del Carmen Etapa 2','2020-06-06 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6437,422,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Masculino _ Edad:49 Años _ procedente del municipio La Primavera _ Localidad Sin Informacion','2020-06-06 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6438,423,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:12 Años _ procedente del municipio Cumaribo Localidad Barrio Nicolino - Cumaribo','2020-06-07 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6439,424,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:40 Años _ procedente del municipio Cumaribo Localidad Cumaribo Vichada','2020-06-08 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6440,425,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:3 Años _ procedente del municipio Santa Rosalia Localidad Santa Rosalia','2020-06-09 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6441,426,1,'en_US',0,'Hepatitis B','Se reporta un caso de Hepatitis B en paciente de género Femenino _ Edad:27 Años _ procedente del municipio Cumaribo Localidad Comunidad Kalerba Cubay Resguardo Asentamientos Lo','2020-06-09 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6442,427,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:38 Años _ procedente del municipio Cumaribo Localidad Comunidad De Venecia - Resguardo Aiwakuna','2020-06-09 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6443,428,1,'en_US',0,'IRAG','Se reporta un caso de IRAG en paciente de género Femenino _ Edad:23 Años _ procedente del municipio La Primavera Localidad Vereda Santa Cecilia','2020-06-10 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6444,429,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Masculino _ Edad:2 Años _ procedente del municipio Cumaribo Localidad Inspeccion De Chaparral','2020-06-10 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6445,430,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:17 Años _ procedente del municipio Puerto Carreño Localidad Barrio Tamarindo Calle 13 # 30-33','2020-06-10 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6446,431,1,'en_US',0,'Defectos Congénitos','Se reporta un caso de Defectos Congénitos en paciente de género Femenino _ Edad:1 Dias _ procedente del municipio Cumaribo Localidad Sin Informacion','2020-06-11 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6447,432,1,'en_US',0,'Mortalidad por IRA','Se reporta un caso de Mortalidad por IRA en paciente de género Femenino _ Edad:4 Meses _ procedente del municipio La Primavera Localidad Comunidad El Progreso Resguardo La Pascua','2020-06-11 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6448,433,1,'en_US',0,'IRAG','Se reporta un caso de IRAG en paciente de género Masculino _ Edad:78 Años _ procedente del municipio Cumaribo Localidad Monterrey - Rio Uva','2020-06-12 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6449,434,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:17 Años _ procedente del municipio Puerto Carreño Localidad Barrio La Esperanza','2020-06-13 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6450,435,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:36 Años _ procedente del municipio Puerto Carreño Localidad Barrio Camilo Cortes','2020-06-13 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6451,436,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:35 Años _ procedente del municipio La Primavera Localidad Tiyaba Vichada','2020-06-13 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6452,437,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:34 Años _ procedente del municipio Cumaribo Localidad Batallon De Infanteria Biroj43','2020-06-13 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6453,438,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:2 Meses _ procedente del municipio Cumaribo Localidad Comunidad Nzareth - Resguardo Bajo Rio Vichada Sec','2020-06-13 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6454,439,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:2 Años _ procedente del municipio Puerto Carreño Localidad Caalarca','2020-06-14 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6455,440,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Cumaribo Localidad Resg Bajo Rio Vichada Sector Uno - Comunidads Urba','2020-06-14 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6456,441,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Puerto Carreño Localidad Piedra Viva','2020-06-14 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6457,442,1,'en_US',0,'Tuberculosis','Se reporta un caso de Tuberculosis en paciente de género Femenino _ Edad:23 Años _ procedente del municipio Puerto Carreño Localidad Vereda Santa Cecilia','2020-06-15 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6458,443,1,'en_US',0,'Sífilis Congénita','Se reporta un caso de Sífilis Congénita en paciente de género Femenino _ Edad:13 Dias _ procedente del municipio Puerto Carreño _ Localidad Barrio La Esperanza','2020-06-16 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6459,444,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:2 Meses _ procedente del municipio Cumaribo Localidad Resguardo Bajo Rio Vichada  Sector Uno-Comunidad N','2020-06-16 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6460,445,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Años _ procedente del municipio Puerto Carreño Localidad Piedra Custodio','2020-06-16 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6461,446,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Meses _ procedente del municipio Cumaribo Localidad Resg Tuparro - Comunidad Merey - Inspecion Santa R','2020-06-16 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6462,447,1,'en_US',0,'Defectos Congénitos','Se reporta un caso de Defectos Congénitos en paciente de género Masculino _ Edad:7 Dias _ procedente del municipio Cumaribo Localidad Vereda Palmarito','2020-06-17 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6463,448,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:34 Años _ procedente del municipio Cumaribo Localidad Batallon De Operaciones No 28','2020-06-17 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6464,449,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:2 Años _ procedente del municipio Cumaribo Localidad Comunidad San Antonio- Resg Aiwakuna','2020-06-17 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6465,450,1,'en_US',0,'Sífilis Gestacional','Se reporta un caso de Sífilis Gestacional en paciente de género Femenino _ Edad:21 Años _ procedente del municipio Puerto Carreño _ Localidad Barrio Las Escudillas','2020-06-17 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6466,451,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Puerto Carreño Localidad Barrio Las Escudillas','2020-06-18 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6467,452,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:30 Años _ procedente del municipio Puerto Carreño Localidad Km 3 Via Usme','2020-06-18 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6468,453,1,'en_US',0,'IRAG','Se reporta un caso de IRAG en paciente de género Femenino _ Edad:8 Meses _ procedente del municipio Puerto Carreño Localidad Centro Poblado De Pti Carreño','2020-06-19 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6469,454,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:2 Años _ procedente del municipio Puerto Carreño Localidad Comunidad Chaparral','2020-06-19 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6470,455,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:22 Años _ procedente del municipio Cumaribo _ Localidad Comunidad Indigena Arevol-Resguardo Selva Matadent','2020-06-19 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6471,456,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:31 Años _ procedente del municipio Cumaribo Localidad Cumaribo - Barrio Alcarabn','2020-06-20 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6472,457,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:22 Años _ procedente del municipio Puerto Carreño Localidad Barrio Santa Elenita','2020-06-21 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6473,458,1,'en_US',0,'Accidente ofídico','Se reporta un caso de Accidente ofídico en paciente de género Masculino _ Edad:60 Años _ procedente del municipio Cumaribo Localidad La Rompida','2020-06-21 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6474,459,1,'en_US',0,'Intoxicación','Se reporta un caso de Intoxicación en paciente de género Femenino _ Edad:9 Años _ procedente del municipio La Primavera Localidad Barrio La Florida Calle 12-13','2020-06-21 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6475,460,1,'en_US',0,'Sífilis Congénita','Se reporta un caso de Sífilis Congénita en paciente de género Femenino _ Edad:2 Dias _ procedente del municipio Puerto Carreño _ Localidad _','2020-06-22 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6476,461,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:8 Meses _ procedente del municipio Cumaribo Localidad Comunidad Sukuara Brvs2','2020-06-22 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6477,462,1,'en_US',0,'IRAG','Se reporta un caso de IRAG en paciente de género Femenino _ Edad:34 Años _ procedente del municipio Puerto Carreño Localidad Barrio Villa Gladis','2020-06-22 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6478,463,1,'en_US',0,'Sífilis Gestacional','Se reporta un caso de Sífilis Gestacional en paciente de género Femenino _ Edad:19 Años _ procedente del municipio Cumaribo _ Localidad Amanaven','2020-06-22 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6479,464,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:8 Meses _ procedente del municipio Cumaribo _ Localidad Comunidad Sukuare Brvs2sin Informacion','2020-06-22 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6480,465,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Masculino _ Edad:46 Años _ procedente del municipio Cumaribo Localidad Barrio Centro','2020-06-23 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6481,466,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:2 Años _ procedente del municipio Puerto Carreño Localidad Comunidad Chaparral','2020-06-23 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6482,467,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:7 Meses _ procedente del municipio Puerto Carreño Localidad Relleno Sanitario','2020-06-23 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6483,468,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:8 Meses _ procedente del municipio Cumaribo Localidad Comunidad Indigena Sucuararesguardo Bajo Rio Vicha','2020-06-23 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6484,469,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:19 Años _ procedente del municipio Cumaribo _ Localidad Amanaven','2020-06-23 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6485,470,1,'en_US',0,'Mortalidad por IRA','Se reporta un caso de Mortalidad por IRA en paciente de género Femenino _ Edad:8 Meses _ procedente del municipio Cumaribo Localidad Comunidad Indigena Sucuara-Resguardo Bajo Rio Vich','2020-06-23 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6486,471,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:2 Meses _ procedente del municipio Puerto Carreño Localidad Sin Informacion','2020-06-24 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6487,472,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:1 Años _ procedente del municipio Puerto Carreño Localidad Piedra Custodia Sector Granjas','2020-06-25 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6488,473,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:24 Años _ procedente del municipio Cumaribo Localidad Al Lado Del Colegio- Cumaribo','2020-06-25 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6489,474,1,'en_US',0,'Sífilis Gestacional','Se reporta un caso de Sífilis Gestacional en paciente de género Femenino _ Edad:26 Años _ procedente del municipio Cumaribo _ Localidad Comunidad Puerto Paloma Resguardo Kawasi','2020-06-25 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6490,475,1,'en_US',0,'Tuberculosis','Se reporta un caso de Tuberculosis en paciente de género Masculino _ Edad:56 Años _ procedente del municipio La Primavera Localidad Barrio Centro','2020-06-25 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6491,476,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:9 Meses _ procedente del municipio Cumaribo Localidad Comunidad Dume Brvs1','2020-06-26 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6492,477,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:76 Años _ procedente del municipio Cumaribo Localidad Barrio Centro Cumaribo Vichada','2020-06-26 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6493,478,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:4 Meses _ procedente del municipio Cumaribo Localidad Comunidad San Juan De Dios- Kawasi','2020-06-30 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6494,479,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:3 Años _ procedente del municipio Puerto Carreño Localidad Barrio Calarca','2020-06-30 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6495,480,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:3 Años _ procedente del municipio Puerto Carreño Localidad Barrio Pavoni','2020-06-30 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6496,481,1,'en_US',0,'Dengue','Se reporta un caso de Dengue en paciente de género Masculino _ Edad:5 Años _ procedente del municipio Cumaribo Localidad Barrio Centro','2020-07-01 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6497,482,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:5 Años _ procedente del municipio Cumaribo _ Localidad Comunidad Morichalito Resguardo Sarakure','2020-07-01 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6498,483,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:4 Meses _ procedente del municipio Cumaribo Localidad Resguardo Santa Teresitacomuniodad Rio Cunaima','2020-07-02 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6499,484,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:4 Meses _ procedente del municipio Cumaribo _ Localidad Comunidad San Juan Dios- Kawasi','2020-07-02 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6500,485,1,'en_US',0,'Morbilidad Materna Extrema','Se reporta un caso de Morbilidad Materna Extrema _ Edad de la madre:36 Años _ procedente del municipio Cumaribo _ Localidad Resguardo Santa Teresita-Comunidad La Portuguesa','2020-07-03 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6501,486,1,'en_US',0,'IRAG','Se reporta un caso de IRAG en paciente de género Femenino _ Edad:4 Meses _ procedente del municipio Cumaribo Localidad Comunidad San Juan De Dios','2020-07-03 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6502,487,1,'en_US',0,'IRAG','Se reporta un caso de IRAG en paciente de género Masculino _ Edad:3 Meses _ procedente del municipio Puerto Carreño Localidad Vichada Puerto Careño','2020-07-03 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6503,488,1,'en_US',0,'Intento de Suicidio','Se reporta un caso de Intento de Suicidio en paciente de género Femenino _ Edad:13 Años _ procedente del municipio La Primavera Localidad El Trompillo','2020-07-03 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6504,489,1,'en_US',0,'Intoxicación','Se reporta un caso de Intoxicación en paciente de género Femenino _ Edad:37 Años _ procedente del municipio La Primavera Localidad Barrio Centro','2020-07-03 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6505,490,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:23 Años _ procedente del municipio Cumaribo Localidad Batallon De Infanteria Biroj 43','2020-07-04 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6506,491,1,'en_US',0,'IRAG','Se reporta un caso de IRAG en paciente de género Masculino _ Edad:39 Años _ procedente del municipio La Primavera Localidad Kr 5 9 83','2020-07-04 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6507,492,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:2 Meses _ procedente del municipio Cumaribo Localidad Albergue Sukurame','2020-07-06 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6508,493,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Masculino _ Edad:2 Años _ procedente del municipio Puerto Carreño Localidad Piedra Custodio','2020-07-06 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6509,494,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:2 Años _ procedente del municipio Santa Rosalia Localidad Urbanizacion Consuelo 2','2020-07-07 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6510,495,1,'en_US',0,'Mortalidad Neonatal Tardía','Se reporta un caso de Mortalidad Neonatal Tardía _ Edad de la madre:31 Años _ procedente del municipio Santa Rosalia _ Localidad Santa Rosalia -Vichada','2020-07-07 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6511,496,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:2 Años _ procedente del municipio Cumaribo Localidad Comunidad Gavilan - Resguardo Cawaneruba','2020-07-09 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6512,497,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:2 Años _ procedente del municipio Cumaribo _ Localidad Comunidad Gavilan - Resguardo Cawarenuba','2020-07-09 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6513,498,1,'en_US',0,'Leishmaniasis','Se reporta un caso de Leishmaniasis en paciente de género Masculino _ Edad:22 Años _ procedente del municipio Cumaribo Localidad Batallon De Infanteria Biroj43','2020-07-10 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6514,499,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Meses _ procedente del municipio Cumaribo Localidad Comunidad Villanueva Brvs1','2020-07-10 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6515,500,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Femenino _ Edad:34 Años _ procedente del municipio Puerto Carreño Localidad Barrio El Puerto','2020-07-10 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6516,501,1,'en_US',0,'Agresión por APTR','Se reporta un caso de Agresión por APTR en paciente de género Masculino _ Edad:8 Años _ procedente del municipio Puerto Carreño Localidad Barrio Mateo Cra 28#16-24','2020-07-10 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6517,502,1,'en_US',0,'VIH','Se reporta un caso de VIH en paciente de género Femenino _ Edad:28 Años _ procedente del municipio Cumaribo Localidad Comunidad Nuevo Horizonte Brvs2','2020-07-10 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6518,503,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:1 Meses _ procedente del municipio Cumaribo _ Localidad Comunidad Villanueva Brvs1','2020-07-10 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6519,504,1,'en_US',0,'VBG','Se reporta un caso de violencia basada en género  en paciente de género Femenino _ Edad:6 Años _ procedente del municipio Puerto Carreño _ Localidad Barrio Gaitan Cerca De La Piedraen Una Casa Azul','2020-07-10 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6520,505,1,'en_US',0,'Hepatitis B','Se reporta un caso de Hepatitis B en paciente de género Femenino _ Edad:31 Años _ procedente del municipio Cumaribo Localidad Comunidad Venecia Resguardo Aiwuakuna','2020-07-11 11:50:00',1,1,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6521,506,1,'en_US',0,'Intoxicación','Se reporta un caso de Intoxicación en paciente de género Femenino _ Edad:39 Años _ procedente del municipio Puerto Carreño Localidad Barrio Arturo Bueno','2020-07-11 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6522,507,1,'en_US',0,'Intento de Suicidio','Se reporta un caso de Intento de Suicidio en paciente de género Masculino _ Edad:23 Años _ procedente del municipio Puerto Carreño Localidad Barrio La Florida Cra22#24-07','2020-07-12 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);
INSERT INTO `incident` VALUES (6523,508,1,'en_US',0,'Desnutrición aguda','Se reporta un caso de Desnutrición aguda en paciente de género Femenino _ Edad:1 Años _ procedente del municipio Puerto Carreño Localidad Asentamiento Ciner 2','2020-07-13 11:50:00',1,0,1,'2020-08-26 10:06:06',NULL,NULL,0,NULL);

#
# Source for table incident_category
#

CREATE TABLE `incident_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `incident_category_ids` (`incident_id`,`category_id`),
  KEY `incident_id` (`incident_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=509 DEFAULT CHARSET=utf8 COMMENT='Stores submitted reports categories';

#
# Dumping data for table incident_category
#

INSERT INTO `incident_category` VALUES (4,6019,15);
INSERT INTO `incident_category` VALUES (6,6021,15);
INSERT INTO `incident_category` VALUES (9,6024,19);
INSERT INTO `incident_category` VALUES (12,6027,19);
INSERT INTO `incident_category` VALUES (19,6034,15);
INSERT INTO `incident_category` VALUES (24,6039,19);
INSERT INTO `incident_category` VALUES (29,6044,15);
INSERT INTO `incident_category` VALUES (31,6046,15);
INSERT INTO `incident_category` VALUES (33,6048,15);
INSERT INTO `incident_category` VALUES (34,6049,19);
INSERT INTO `incident_category` VALUES (43,6058,15);
INSERT INTO `incident_category` VALUES (44,6059,23);
INSERT INTO `incident_category` VALUES (45,6060,23);
INSERT INTO `incident_category` VALUES (47,6062,19);
INSERT INTO `incident_category` VALUES (48,6063,19);
INSERT INTO `incident_category` VALUES (49,6064,24);
INSERT INTO `incident_category` VALUES (52,6067,23);
INSERT INTO `incident_category` VALUES (56,6071,15);
INSERT INTO `incident_category` VALUES (58,6073,19);
INSERT INTO `incident_category` VALUES (59,6074,19);
INSERT INTO `incident_category` VALUES (62,6077,24);
INSERT INTO `incident_category` VALUES (65,6080,23);
INSERT INTO `incident_category` VALUES (66,6081,15);
INSERT INTO `incident_category` VALUES (67,6082,19);
INSERT INTO `incident_category` VALUES (71,6086,19);
INSERT INTO `incident_category` VALUES (73,6088,28);
INSERT INTO `incident_category` VALUES (79,6094,15);
INSERT INTO `incident_category` VALUES (80,6095,19);
INSERT INTO `incident_category` VALUES (81,6096,28);
INSERT INTO `incident_category` VALUES (97,6112,19);
INSERT INTO `incident_category` VALUES (98,6113,23);
INSERT INTO `incident_category` VALUES (102,6117,28);
INSERT INTO `incident_category` VALUES (110,6125,24);
INSERT INTO `incident_category` VALUES (117,6132,28);
INSERT INTO `incident_category` VALUES (121,6136,15);
INSERT INTO `incident_category` VALUES (122,6137,19);
INSERT INTO `incident_category` VALUES (123,6138,15);
INSERT INTO `incident_category` VALUES (127,6142,19);
INSERT INTO `incident_category` VALUES (128,6143,19);
INSERT INTO `incident_category` VALUES (129,6144,19);
INSERT INTO `incident_category` VALUES (130,6145,19);
INSERT INTO `incident_category` VALUES (134,6149,23);
INSERT INTO `incident_category` VALUES (135,6150,30);
INSERT INTO `incident_category` VALUES (136,6151,19);
INSERT INTO `incident_category` VALUES (142,6157,19);
INSERT INTO `incident_category` VALUES (143,6158,19);
INSERT INTO `incident_category` VALUES (150,6165,28);
INSERT INTO `incident_category` VALUES (153,6168,19);
INSERT INTO `incident_category` VALUES (154,6169,19);
INSERT INTO `incident_category` VALUES (159,6174,19);
INSERT INTO `incident_category` VALUES (160,6175,28);
INSERT INTO `incident_category` VALUES (161,6176,19);
INSERT INTO `incident_category` VALUES (162,6177,32);
INSERT INTO `incident_category` VALUES (164,6179,19);
INSERT INTO `incident_category` VALUES (166,6181,19);
INSERT INTO `incident_category` VALUES (168,6183,19);
INSERT INTO `incident_category` VALUES (170,6185,15);
INSERT INTO `incident_category` VALUES (179,6194,19);
INSERT INTO `incident_category` VALUES (181,6196,19);
INSERT INTO `incident_category` VALUES (182,6197,15);
INSERT INTO `incident_category` VALUES (183,6198,19);
INSERT INTO `incident_category` VALUES (185,6200,19);
INSERT INTO `incident_category` VALUES (187,6202,15);
INSERT INTO `incident_category` VALUES (190,6205,28);
INSERT INTO `incident_category` VALUES (199,6214,19);
INSERT INTO `incident_category` VALUES (201,6216,19);
INSERT INTO `incident_category` VALUES (202,6217,24);
INSERT INTO `incident_category` VALUES (205,6220,19);
INSERT INTO `incident_category` VALUES (208,6223,19);
INSERT INTO `incident_category` VALUES (209,6224,19);
INSERT INTO `incident_category` VALUES (211,6226,23);
INSERT INTO `incident_category` VALUES (214,6229,19);
INSERT INTO `incident_category` VALUES (217,6232,24);
INSERT INTO `incident_category` VALUES (219,6234,19);
INSERT INTO `incident_category` VALUES (220,6235,19);
INSERT INTO `incident_category` VALUES (222,6237,24);
INSERT INTO `incident_category` VALUES (229,6244,19);
INSERT INTO `incident_category` VALUES (232,6247,28);
INSERT INTO `incident_category` VALUES (235,6250,19);
INSERT INTO `incident_category` VALUES (242,6257,15);
INSERT INTO `incident_category` VALUES (244,6259,19);
INSERT INTO `incident_category` VALUES (247,6262,24);
INSERT INTO `incident_category` VALUES (248,6263,19);
INSERT INTO `incident_category` VALUES (249,6264,30);
INSERT INTO `incident_category` VALUES (252,6267,19);
INSERT INTO `incident_category` VALUES (254,6269,19);
INSERT INTO `incident_category` VALUES (256,6271,19);
INSERT INTO `incident_category` VALUES (259,6274,23);
INSERT INTO `incident_category` VALUES (262,6277,19);
INSERT INTO `incident_category` VALUES (263,6278,19);
INSERT INTO `incident_category` VALUES (266,6281,33);
INSERT INTO `incident_category` VALUES (267,6282,24);
INSERT INTO `incident_category` VALUES (274,6289,19);
INSERT INTO `incident_category` VALUES (275,6290,23);
INSERT INTO `incident_category` VALUES (276,6291,28);
INSERT INTO `incident_category` VALUES (281,6296,28);
INSERT INTO `incident_category` VALUES (282,6297,28);
INSERT INTO `incident_category` VALUES (283,6298,28);
INSERT INTO `incident_category` VALUES (286,6301,24);
INSERT INTO `incident_category` VALUES (288,6303,19);
INSERT INTO `incident_category` VALUES (291,6306,33);
INSERT INTO `incident_category` VALUES (293,6308,19);
INSERT INTO `incident_category` VALUES (296,6311,15);
INSERT INTO `incident_category` VALUES (297,6312,19);
INSERT INTO `incident_category` VALUES (299,6314,15);
INSERT INTO `incident_category` VALUES (300,6315,19);
INSERT INTO `incident_category` VALUES (301,6316,15);
INSERT INTO `incident_category` VALUES (304,6319,19);
INSERT INTO `incident_category` VALUES (306,6321,28);
INSERT INTO `incident_category` VALUES (308,6323,24);
INSERT INTO `incident_category` VALUES (310,6325,19);
INSERT INTO `incident_category` VALUES (311,6326,19);
INSERT INTO `incident_category` VALUES (315,6330,15);
INSERT INTO `incident_category` VALUES (316,6331,19);
INSERT INTO `incident_category` VALUES (322,6337,19);
INSERT INTO `incident_category` VALUES (323,6338,30);
INSERT INTO `incident_category` VALUES (324,6339,33);
INSERT INTO `incident_category` VALUES (335,6350,28);
INSERT INTO `incident_category` VALUES (336,6351,15);
INSERT INTO `incident_category` VALUES (337,6352,19);
INSERT INTO `incident_category` VALUES (340,6355,28);
INSERT INTO `incident_category` VALUES (341,6356,15);
INSERT INTO `incident_category` VALUES (348,6363,33);
INSERT INTO `incident_category` VALUES (350,6365,19);
INSERT INTO `incident_category` VALUES (351,6366,19);
INSERT INTO `incident_category` VALUES (353,6368,24);
INSERT INTO `incident_category` VALUES (354,6369,24);
INSERT INTO `incident_category` VALUES (355,6370,24);
INSERT INTO `incident_category` VALUES (357,6372,33);
INSERT INTO `incident_category` VALUES (359,6374,19);
INSERT INTO `incident_category` VALUES (362,6377,15);
INSERT INTO `incident_category` VALUES (363,6378,19);
INSERT INTO `incident_category` VALUES (365,6380,33);
INSERT INTO `incident_category` VALUES (370,6385,15);
INSERT INTO `incident_category` VALUES (372,6387,33);
INSERT INTO `incident_category` VALUES (374,6389,19);
INSERT INTO `incident_category` VALUES (377,6392,28);
INSERT INTO `incident_category` VALUES (379,6394,28);
INSERT INTO `incident_category` VALUES (380,6395,28);
INSERT INTO `incident_category` VALUES (381,6396,28);
INSERT INTO `incident_category` VALUES (383,6398,19);
INSERT INTO `incident_category` VALUES (386,6401,33);
INSERT INTO `incident_category` VALUES (388,6403,19);
INSERT INTO `incident_category` VALUES (392,6407,19);
INSERT INTO `incident_category` VALUES (395,6410,15);
INSERT INTO `incident_category` VALUES (396,6411,15);
INSERT INTO `incident_category` VALUES (405,6420,24);
INSERT INTO `incident_category` VALUES (409,6424,30);
INSERT INTO `incident_category` VALUES (411,6426,15);
INSERT INTO `incident_category` VALUES (415,6430,33);
INSERT INTO `incident_category` VALUES (416,6431,19);
INSERT INTO `incident_category` VALUES (419,6434,19);
INSERT INTO `incident_category` VALUES (420,6435,19);
INSERT INTO `incident_category` VALUES (421,6436,19);
INSERT INTO `incident_category` VALUES (423,6438,19);
INSERT INTO `incident_category` VALUES (424,6439,19);
INSERT INTO `incident_category` VALUES (426,6441,32);
INSERT INTO `incident_category` VALUES (427,6442,28);
INSERT INTO `incident_category` VALUES (428,6443,33);
INSERT INTO `incident_category` VALUES (429,6444,15);
INSERT INTO `incident_category` VALUES (430,6445,19);
INSERT INTO `incident_category` VALUES (433,6448,33);
INSERT INTO `incident_category` VALUES (434,6449,19);
INSERT INTO `incident_category` VALUES (435,6450,19);
INSERT INTO `incident_category` VALUES (436,6451,28);
INSERT INTO `incident_category` VALUES (437,6452,28);
INSERT INTO `incident_category` VALUES (442,6457,23);
INSERT INTO `incident_category` VALUES (448,6463,28);
INSERT INTO `incident_category` VALUES (452,6467,28);
INSERT INTO `incident_category` VALUES (453,6468,33);
INSERT INTO `incident_category` VALUES (456,6471,19);
INSERT INTO `incident_category` VALUES (457,6472,19);
INSERT INTO `incident_category` VALUES (462,6477,33);
INSERT INTO `incident_category` VALUES (465,6480,15);
INSERT INTO `incident_category` VALUES (473,6488,19);
INSERT INTO `incident_category` VALUES (475,6490,23);
INSERT INTO `incident_category` VALUES (477,6492,19);
INSERT INTO `incident_category` VALUES (481,6496,15);
INSERT INTO `incident_category` VALUES (486,6501,33);
INSERT INTO `incident_category` VALUES (487,6502,33);
INSERT INTO `incident_category` VALUES (490,6505,28);
INSERT INTO `incident_category` VALUES (491,6506,33);
INSERT INTO `incident_category` VALUES (494,6509,19);
INSERT INTO `incident_category` VALUES (498,6513,28);
INSERT INTO `incident_category` VALUES (500,6515,19);
INSERT INTO `incident_category` VALUES (501,6516,19);
INSERT INTO `incident_category` VALUES (502,6517,30);
INSERT INTO `incident_category` VALUES (505,6520,32);

#
# Source for table incident_lang
#

CREATE TABLE `incident_lang` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `incident_title` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `incident_description` longtext CHARACTER SET latin1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Holds translations for report titles and descriptions';

#
# Dumping data for table incident_lang
#


#
# Source for table incident_person
#

CREATE TABLE `incident_person` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `person_first` varchar(200) DEFAULT NULL,
  `person_last` varchar(200) DEFAULT NULL,
  `person_email` varchar(120) DEFAULT NULL,
  `person_phone` varchar(60) DEFAULT NULL,
  `person_ip` varchar(50) DEFAULT NULL,
  `person_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds information provided by people who submit reports';

#
# Dumping data for table incident_person
#


#
# Source for table incident_quality
#

CREATE TABLE `incident_quality` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` int(11) NOT NULL COMMENT 'incident_id of the new report that is created',
  `incident_source` int(11) NOT NULL COMMENT 'incident_source of the new report that is created',
  `incident_information` int(11) NOT NULL COMMENT 'incident_information of the new report that is created',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Dumping data for table incident_quality
#

INSERT INTO `incident_quality` VALUES (1,61,1,0);
INSERT INTO `incident_quality` VALUES (2,64,4,3);

#
# Source for table layer
#

CREATE TABLE `layer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layer_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `layer_url` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `layer_file` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `layer_color` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `layer_visible` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Holds static layer information';

#
# Dumping data for table layer
#


#
# Source for table level
#

CREATE TABLE `level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level_title` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `level_description` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `level_weight` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores level of trust assigned to reporters of the platform';

#
# Dumping data for table level
#

INSERT INTO `level` VALUES (1,'SPAM + Delete','SPAM + Delete',-2);
INSERT INTO `level` VALUES (2,'SPAM','SPAM',-1);
INSERT INTO `level` VALUES (3,'Untrusted','Untrusted',0);
INSERT INTO `level` VALUES (4,'Trusted','Trusted',1);
INSERT INTO `level` VALUES (5,'Trusted + Verify','Trusted + Verify',2);

#
# Source for table location
#

CREATE TABLE `location` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `latitude` double NOT NULL DEFAULT '0',
  `longitude` double NOT NULL DEFAULT '0',
  `location_visible` tinyint(4) NOT NULL DEFAULT '1',
  `location_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=509 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores location information';

#
# Dumping data for table location
#

INSERT INTO `location` VALUES (1,'Cumaribo Vichada',0,4.563239,-69.81006,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (2,'Cumaribo Vichada',0,4.563239,-69.81006,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (3,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (4,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (5,'Cumaribo Vichada',0,4.563239,-69.81006,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (6,'La Primavera Vichada',0,6.094771,-69.400635,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (7,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (8,'Santa Rosalia Vichada',0,5.135392,-70.868089,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (9,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (10,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (11,'Cumaribo Vichada',0,4.228557,-70.241605,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (12,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (13,'Cumaribo Vichada',0,4.563239,-69.81006,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (14,'Cumaribo Vichada',0,5.068686,-70.052942,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (15,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (16,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (17,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (18,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (19,'La Primavera Vichada',0,3.43411,-69.862862,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (20,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (21,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (22,'Cumaribo Vichada',0,4.902314,-70.665399,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (23,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (24,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (25,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (26,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (27,'Cumaribo Vichada',0,4.312262,-69.892497,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (28,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (29,'Cumaribo Vichada',0,5.068686,-70.052942,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (30,'Cumaribo Vichada',0,4.175033,-70.451869,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (31,'Cumaribo Vichada',0,4.175033,-70.451869,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (32,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (33,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (34,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (35,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (36,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (37,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (38,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (39,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (40,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (41,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (42,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (43,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (44,'Cumaribo Vichada',0,4.175033,-70.451869,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (45,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (46,'Cumaribo Vichada',0,4.312262,-69.892497,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (47,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (48,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (49,'Santa Rosalia Vichada',0,5.089241,-70.931465,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (50,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (51,'Cumaribo Vichada',0,4.312262,-69.892497,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (52,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (53,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (54,'Cumaribo Vichada',0,4.312262,-69.892497,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (55,'Santa Rosalia Vichada',0,5.135392,-70.868089,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (56,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (57,'Puerto Carreño Vichada',0,5.681716,-67.644505,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (58,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (59,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (60,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (61,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (62,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (63,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (64,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (65,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (66,'Cumaribo Vichada',0,3.956211,-68.468559,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (67,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (68,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (69,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (70,'Cumaribo Vichada',0,4.312262,-69.892497,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (71,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (72,'Cumaribo Vichada',0,4.198497,-69.341914,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (73,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (74,'Puerto Carreño Vichada',0,5.681716,-67.644505,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (75,'Puerto Carreño Vichada',0,5.681716,-67.644505,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (76,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (77,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (78,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (79,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (80,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (81,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (82,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (83,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (84,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (85,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (86,'Cumaribo Vichada',0,4.371522,-69.760742,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (87,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (88,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (89,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (90,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (91,'La Primavera Vichada',0,5.476067,-70.402459,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (92,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (93,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (94,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (95,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (96,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (97,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (98,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (99,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (100,'Cumaribo Vichada',0,4.706692,-70.44405,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (101,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (102,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (103,'Cumaribo Vichada',0,4.706692,-70.44405,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (104,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (105,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (106,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (107,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (108,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (109,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (110,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (111,'La Primavera Vichada',0,5.476067,-70.402459,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (112,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (113,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (114,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (115,'Cumaribo Vichada',0,4.563239,-69.81006,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (116,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (117,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (118,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (119,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (120,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (121,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (122,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (123,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (124,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (125,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (126,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (127,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (128,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (129,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (130,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (131,'Cumaribo Vichada',0,4.095601,-67.746505,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (132,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (133,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (134,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (135,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (136,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (137,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (138,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (139,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (140,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (141,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (142,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (143,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (144,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (145,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (146,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (147,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (148,'Cumaribo Vichada',0,3.841762,-69.180356,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (149,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (150,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (151,'Cumaribo Vichada',0,4.369439,-69.780924,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (152,'Puerto Carreño Vichada',0,5.757168,-67.734008,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (153,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (154,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (155,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (156,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (157,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (158,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (159,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (160,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (161,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (162,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (163,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (164,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (165,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (166,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (167,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (168,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (169,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (170,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (171,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (172,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (173,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (174,'Cumaribo Vichada',0,4.488586,-69.825694,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (175,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (176,'Cumaribo Vichada',0,4.312262,-69.892497,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (177,'Cumaribo Vichada',0,4.312262,-69.892497,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (178,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (179,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (180,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (181,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (182,'Cumaribo Vichada',0,4.312262,-69.892497,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (183,'La Primavera Vichada',0,5.476067,-70.402459,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (184,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (185,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (186,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (187,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (188,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (189,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (190,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (191,'Cumaribo Vichada',0,4.024464,-68.195292,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (192,'Cumaribo Vichada',0,4.024464,-68.195292,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (193,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (194,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (195,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (196,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (197,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (198,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (199,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (200,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (201,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (202,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (203,'Cumaribo Vichada',0,4.419992,-69.395221,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (204,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (205,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (206,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (207,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (208,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (209,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (210,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (211,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (212,'Cumaribo Vichada',0,3.881705,-68.369286,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (213,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (214,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (215,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (216,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (217,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (218,'Cumaribo Vichada',0,4.563239,-69.81006,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (219,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (220,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (221,'Cumaribo Vichada',0,3.881705,-68.369286,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (222,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (223,'Puerto Carreño Vichada',0,6.292979,-67.673047,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (224,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (225,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (226,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (227,'Cumaribo Vichada',0,4.501229,-67.862274,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (228,'Cumaribo Vichada',0,4.501229,-67.862274,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (229,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (230,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (231,'Cumaribo Vichada',0,4.618885,-69.289004,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (232,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (233,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (234,'Cumaribo Vichada',0,4.563239,-69.81006,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (235,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (236,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (237,'Cumaribo Vichada',0,3.816832,-69.300887,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (238,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (239,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (240,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (241,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (242,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (243,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (244,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (245,'La Primavera Vichada',0,5.476067,-70.402459,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (246,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (247,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (248,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (249,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (250,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (251,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (252,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (253,'Cumaribo Vichada',0,4.312262,-69.892497,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (254,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (255,'Cumaribo Vichada',0,4.706692,-70.44405,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (256,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (257,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (258,'Cumaribo Vichada',0,4.312262,-69.892497,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (259,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (260,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (261,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (262,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (263,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (264,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (265,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (266,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (267,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (268,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (269,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (270,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (271,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (272,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (273,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (274,'Cumaribo Vichada',0,5.371786,-70.228274,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (275,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (276,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (277,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (278,'Santa Rosalia Vichada',0,3.43411,-69.862862,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (279,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (280,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (281,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (282,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (283,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (284,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (285,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (286,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (287,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (288,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (289,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (290,'Cumaribo Vichada',0,4.618885,-69.289004,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (291,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (292,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (293,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (294,'Cumaribo Vichada',0,4.255863,-70.319086,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (295,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (296,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (297,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (298,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (299,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (300,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (301,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (302,'Cumaribo Vichada',0,4.312262,-69.892497,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (303,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (304,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (305,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (306,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (307,'Cumaribo Vichada',0,4.175033,-70.451869,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (308,'Cumaribo Vichada',0,3.821078,-69.249014,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (309,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (310,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (311,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (312,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (313,'Cumaribo Vichada',0,4.488586,-69.825694,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (314,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (315,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (316,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (317,'La Primavera Vichada',0,5.207933,-69.916441,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (318,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (319,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (320,'Cumaribo Vichada',0,4.563239,-69.81006,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (321,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (322,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (323,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (324,'Cumaribo Vichada',0,4.198497,-69.341914,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (325,'La Primavera Vichada',0,5.207933,-69.916441,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (326,'Puerto Carreño Vichada',0,5.757168,-67.734008,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (327,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (328,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (329,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (330,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (331,'Cumaribo Vichada',0,3.956211,-68.468559,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (332,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (333,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (334,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (335,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (336,'Cumaribo Vichada',0,4.312262,-69.892497,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (337,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (338,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (339,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (340,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (341,'Cumaribo Vichada',0,4.312262,-69.892497,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (342,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (343,'Cumaribo Vichada',0,5.068686,-70.052942,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (344,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (345,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (346,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (347,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (348,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (349,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (350,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (351,'Cumaribo Vichada',0,6.292979,-67.673047,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (352,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (353,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (354,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (355,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (356,'Santa Rosalia Vichada',0,3.43411,-69.862862,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (357,'Cumaribo Vichada',0,4.312262,-69.892497,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (358,'Cumaribo Vichada',0,4.312262,-69.892497,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (359,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (360,'Cumaribo Vichada',0,4.559144,-68.791013,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (361,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (362,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (363,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (364,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (365,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (366,'Cumaribo Vichada',0,4.095601,-67.746505,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (367,'Cumaribo Vichada',0,4.095601,-67.746505,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (368,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (369,'Cumaribo Vichada',0,4.175033,-70.451869,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (370,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (371,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (372,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (373,'Cumaribo Vichada',0,4.933087,-67.854748,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (374,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (375,'Cumaribo Vichada',0,4.933087,-67.854748,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (376,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (377,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (378,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (379,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (380,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (381,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (382,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (383,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (384,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (385,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (386,'Cumaribo Vichada',0,4.933087,-67.854748,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (387,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (388,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (389,'Cumaribo Vichada',0,4.933087,-67.854748,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (390,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (391,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (392,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (393,'Cumaribo Vichada',0,4.933087,-67.854748,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (394,'Santa Rosalia Vichada',0,3.43411,-69.862862,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (395,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (396,'Cumaribo Vichada',0,4.312262,-69.892497,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (397,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (398,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (399,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (400,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (401,'Cumaribo Vichada',0,4.754564,-67.843389,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (402,'Cumaribo Vichada',0,4.754564,-67.843389,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (403,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (404,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (405,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (406,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (407,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (408,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (409,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (410,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (411,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (412,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (413,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (414,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (415,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (416,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (417,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (418,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (419,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (420,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (421,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (422,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (423,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (424,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (425,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (426,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (427,'Cumaribo Vichada',0,4.312262,-69.892497,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (428,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (429,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (430,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (431,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (432,'La Primavera Vichada',0,5.207933,-69.916441,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (433,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (434,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (435,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (436,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (437,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (438,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (439,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (440,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (441,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (442,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (443,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (444,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (445,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (446,'Cumaribo Vichada',0,4.273107,-67.80431,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (447,'Cumaribo Vichada',0,4.618885,-69.289004,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (448,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (449,'Cumaribo Vichada',0,4.312262,-69.892497,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (450,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (451,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (452,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (453,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (454,'Puerto Carreño Vichada',0,5.757168,-67.734008,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (455,'Cumaribo Vichada',0,4.754564,-67.843389,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (456,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (457,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (458,'Cumaribo Vichada',0,4.041143,-70.863616,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (459,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (460,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (461,'Cumaribo Vichada',0,4.500347,-68.866617,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (462,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (463,'Cumaribo Vichada',0,4.095601,-67.746505,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (464,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (465,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (466,'Puerto Carreño Vichada',0,5.757168,-67.734008,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (467,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (468,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (469,'Cumaribo Vichada',0,4.095601,-67.746505,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (470,'Cumaribo Vichada',0,4.738129,-68.426462,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (471,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (472,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (473,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (474,'Cumaribo Vichada',0,4.255863,-70.319086,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (475,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (476,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (477,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (478,'Cumaribo Vichada',0,4.811204,-6.837076,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (479,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (480,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (481,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (482,'Cumaribo Vichada',0,3.840277,-69.129217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (483,'Cumaribo Vichada',0,4.563239,-69.81006,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (484,'Cumaribo Vichada',0,4.811204,-6.837076,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (485,'Cumaribo Vichada',0,4.563239,-69.81006,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (486,'Cumaribo Vichada',0,4.811204,-6.837076,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (487,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (488,'La Primavera Vichada',0,5.476067,-70.402459,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (489,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (490,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (491,'La Primavera Vichada',0,5.49176,-70.414772,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (492,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (493,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (494,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (495,'Santa Rosalia Vichada',0,5.135745,-70.862928,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (496,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (497,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (498,'Cumaribo Vichada',0,4.4445,-69.799779,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (499,'Cumaribo Vichada',0,4.228557,-70.241605,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (500,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (501,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (502,'Cumaribo Vichada',0,4.44715,-69.797584,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (503,'Cumaribo Vichada',0,4.228557,-70.241605,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (504,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (505,'Cumaribo Vichada',0,4.312262,-69.892497,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (506,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (507,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');
INSERT INTO `location` VALUES (508,'Puerto Carreño Vichada',0,6.184787,-67.497217,1,'2020-08-26 10:06:06');

#
# Source for table maintenance
#

CREATE TABLE `maintenance` (
  `allowed_ip` varchar(15) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Puts a site in maintenance mode if data exists in this table';

#
# Dumping data for table maintenance
#


#
# Source for table media
#

CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `message_id` bigint(20) unsigned DEFAULT NULL,
  `badge_id` int(11) DEFAULT NULL,
  `media_type` tinyint(4) DEFAULT NULL COMMENT '1 - IMAGES, 2 - VIDEO, 3 - AUDIO, 4 - NEWS, 5 - PODCAST',
  `media_title` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `media_description` longtext CHARACTER SET latin1,
  `media_link` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `media_medium` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `media_thumb` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `media_date` datetime DEFAULT NULL,
  `media_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores any media submitted along with a report';

#
# Dumping data for table media
#

INSERT INTO `media` VALUES (1,NULL,NULL,NULL,NULL,1,NULL,NULL,'banner_1598454299.jpg','banner_1598454299_m.jpg','banner_1598454299_t.jpg','2020-08-26 10:04:59',1);

#
# Source for table message
#

CREATE TABLE `message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT '0',
  `incident_id` bigint(20) unsigned DEFAULT '0',
  `user_id` int(11) unsigned DEFAULT '0',
  `reporter_id` bigint(20) unsigned DEFAULT NULL,
  `service_messageid` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `message_from` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `message_to` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `message` text CHARACTER SET latin1,
  `message_detail` text CHARACTER SET latin1,
  `message_type` tinyint(4) DEFAULT '1' COMMENT '1 - INBOX, 2 - OUTBOX (From Admin), 3 - DELETED',
  `message_date` datetime DEFAULT NULL,
  `message_level` tinyint(4) DEFAULT '0' COMMENT '0 - UNREAD, 1 - READ, 99 - SPAM',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=273 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores tweets, emails and SMS messages';

#
# Dumping data for table message
#

INSERT INTO `message` VALUES (1,0,0,0,1,'<CAF+FGTkcquQXXAOt62P1=xPyRVTWGxdJQM6-wDh=2Zee=2_YPA@mail.gmail.com>','Mohit Daswani',NULL,'Need Help with Key features?','Hi cadic,\r\n\r\nThe most successful teams on BrowserStack use the following key features on\r\nAutomate:\r\n\r\n\r\n   - CI Plugins\r\n   &lt;https://hello.browserstack.com/api/mailings/click/PMRGSZBCHIZDCNZWHA2SYITVOJWCEORCNB2HI4DTHIXS653XO4XGE4TPO5ZWK4TTORQWG2ZOMNXW2L3BOV2G63LBORSS6Y3PNZ2GS3TVN52XGLLJNZ2GKZ3SMF2GS33OEIWCE33SM4RDUITDGJSTSNDFMQZC2YRUMU3C2NBTGRRS2OJQGY4C2MJWHA4DMMZTGY3WEYTGEIWCE5TFOJZWS33OEI5CENBCFQRHG2LHEI5CEN2RJNLTG2CCIZWU62ZNM42UE2C7PFLXI4LWMNYHG5LIJJZU2N2KGJBGWUTTJJWXKM2DJU6SE7I=&gt;:\r\n   Integrate with Jenkins, Travis CI, TeamCity, Bamboo, Azure Pipelines,\r\n   CircleCI or Bitbucket.\r\n   - Parallel Testing\r\n   &lt;https://hello.browserstack.com/api/mailings/click/PMRGSZBCHIZDCNZWHA2SYITVOJWCEORCNB2HI4DTHIXS653XO4XGE4TPO5ZWK4TTORQWG2ZOMNXW2L3BOBYC2YLVORXW2YLUMUXWC4DQNF2W2LLKMF3GCI3TOBSWKZBNOVYC25DFON2GS3THEIWCE33SM4RDUITDGJSTSNDFMQZC2YRUMU3C2NBTGRRS2OJQGY4C2MJWHA4DMMZTGY3WEYTGEIWCE5TFOJZWS33OEI5CENBCFQRHG2LHEI5CE5BZK5FTE33DONFFUTD2KFFWYWDSHBTHQ3TJGM2WMYRSJJRVC5LXPJ5DQNKKGBTVQXZVLE6SE7I=&gt;:\r\n   Speed up your builds by running hundreds of tests concurrently.\r\n   - Local Testing\r\n   &lt;https://hello.browserstack.com/api/mailings/click/PMRGSZBCHIZDCNZWHA2SYITVOJWCEORCNB2HI4DTHIXS653XO4XGE4TPO5ZWK4TTORQWG2ZOMNXW2L3MN5RWC3BNORSXG5DJNZTSELBCN5ZGOIR2EJRTEZJZGRSWIMRNMI2GKNRNGQZTIYZNHEYDMOBNGE3DQOBWGMZTMN3CMJTCELBCOZSXE43JN5XCEORCGQRCYITTNFTSEORCMF4W22TDJZ5G22RWMRJV62CWGNUUYX2XKJRFAWTJJVTTSWKBLBWVGVSNN5ZEE3DONFFWGPJCPU======&gt;:\r\n   Test websites hosted on dev environments or behind firewalls.\r\n   - Real Mobile Devices\r\n   &lt;https://hello.browserstack.com/api/mailings/click/PMRGSZBCHIZDCNZWHA2SYITVOJWCEORCNB2HI4DTHIXS653XO4XGE4TPO5ZWK4TTORQWG2ZOMNXW2L3MNFZXILLPMYWWE4TPO5ZWK4TTFVQW4ZBNOBWGC5DGN5ZG24ZPMF2XI33NMF2GKIRMEJXXEZZCHIRGGMTFHE2GKZBSFVRDIZJWFU2DGNDDFU4TANRYFUYTMOBYGYZTGNRXMJRGMIRMEJ3GK4TTNFXW4IR2EI2CELBCONUWOIR2EJEWERCKM5MEMNLRINZGSQSUPJZDOT22GNKWUUTCIVMFC4JWOVSE4UKMOVKVCUSQIVNGGRJ5EJ6Q====&gt;:\r\n   Grow your iOS and Android device coverage.\r\n\r\n\r\nDid you make the most of your free trial or would you like a technical demo\r\n&lt;https://hello.browserstack.com/api/mailings/click/PMRGSZBCHIZDCNZWHA2SYITVOJWCEORCNB2HI4DTHIXS62DFNRWG6LTCOJXXO43FOJZXIYLDNMXGG33NF5RS63LPNBUXILLEMJZG653TMVZHG5DBMNVS2Y3PNURCYITPOJTSEORCMMZGKOJUMVSDELLCGRSTMLJUGM2GGLJZGA3DQLJRGY4DQNRTGM3DOYTCMYRCYITWMVZHG2LPNYRDUIRUEIWCE43JM4RDUISSON3UCOCLHA4FMLKXL4YDA4DKOJZWI3DYJFVWG6JUMRXWEY2YMRBTI6TLGVYHIY2YGBTT2IT5&gt;to\r\nget started?\r\n\r\nBest,\r\nMohit Daswani\r\n\r\n\r\n\r\n\r\n*Mohit Daswani*\r\nCustomer Success Specialist | BrowserStack\r\n&lt;https://hello.browserstack.com/api/mailings/click/PMRGSZBCHIZDCNZWHA2SYITVOJWCEORCNB2HI4DTHIXS653XO4XGE4TPO5ZWK4TTORQWG2ZOMNXW2LZCFQRG64THEI5CEYZSMU4TIZLEGIWWENDFGYWTIMZUMMWTSMBWHAWTCNRYHA3DGMZWG5RGEZRCFQRHMZLSONUW63RCHIRDIIRMEJZWSZZCHIRDKZTLLBEFEV3IJVBFO43ZPBTHMN2TJBAUI22DI5XUU4LGJJJHOULIM5TU6UKWOZ2WMNJUHURH2===&gt;\r\nmohit.d@browserstack.com |\r\nIf you&#039;d like me to stop sending you emails, please click here\r\n&lt;https://hello.browserstack.com/api/mailings/unsubscribe/PMRGSZBCHIZDCNZWHA2SYITPOJTSEORCMMZGKOJUMVSDELLCGRSTMLJUGM2GGLJZGA3DQLJRGY4DQNRTGM3DOYTCMYRCYITWMVZHG2LPNYRDUIRUEIWCE43JM4RDUITNNJEVM4SNKVYXKZSNMVSW4WC2OZEGG52UNN2GUMDZJVXW2RDFIRHHEX3BNMZU6Q2UNB3T2IT5&gt;\n\n',1,'2019-11-18 12:19:15',0,NULL,NULL);
INSERT INTO `message` VALUES (2,0,0,0,2,'<5dd2c084bd1d1_1d475e9624058127@rake-web-001-ec2-use1a-prod.browserstack.com.mail>','Noah from BrowserStack',NULL,'Your App Automate Free Trial is still active',' \n\n \t\t\n[http://email.browserstack.com/c/eJx9UMtqwzAQ_Br7ZmO944MPgSanQqH0biTt1hGxLCPJ-Pcrh9BDSwt72d2Z2Z3ZEsbRwcBOknCmahiEEaBq9NrN41Y253U9bzl4nXG8LPCO3i1QSEQo3vW0Z7R2gwCgtjtxAwTISIArgb2kvBMnQlXFu6jv2Oxomq4jDVrabAmJbtYYoDUx7OWNlLW9tzb49rhd3wamP5klSlCpSC85MsWlEgZ6ImVpTD0Pt5zXVLFzRa-l9n3_JXZs2HXLfrTar9pNS8VerhHxIzo9j2-LCTqCW6aKygcqLBmXXEB_GH_iPILbfIFdjm-fwxS2aPHHMGM8cK9hCs9YM_p1PmT_ybeOg9XgbJsxFYUS4XRwD0t1_pOUh_BtaHwcS1-0QaUB]\n\n \t\t [Header right ribbon] \n\nHi Cadic, \n\n100 minutes of free testing on App Automate awaits you.\n\n Start Testing Now\n[http://email.browserstack.com/c/eJx9ULtugzAU_RrYQH4GGBgSNRlbqc2ObN-rxArGljHi92si1KFVKnk6Ps-7zBgHCz1vD1TwpoReaglNiU7ZcVjyzzGE45K8UwmH8wSf6OwEWURlI0jHOs5K20sAZkgrNFCgAwXRSOwOTBDZUtYUgkT1wGpFXRFCKzSsWmakqgrRQ62jX3ONOSnzqI139ZZd3nujWy47otpWCABQjHJCQWpFONPZuhz7e0phLvixYJf81nX9Y5ZhFUKl9gkFvyzJDUa5oOxtKvjbJSJeo1Xj8DFpryLY6Vaww5Plp4RTyqQXR9h5DsEuLtPOW_MdnP0SDf4CE8aN95VUTAU7XXFOz7jTu1_3myd0Ydxy_jl-GXujwJo6ZYNcQ5Dbpt32lumlKPX-Z-HwDJu_AZ_rr_U]\n\n\nApp Automate gives you instant access to test on 2,000+ real iOS and\nAndroid devices. Explore power features like:\n\n&bull; Parallel testing\n&bull; Testing on dev environments\n&bull; Comprehensive debugging tools\n&bull; Integration with CI tools, like Jenkins, Travis CI, TeamCity,\nBamboo, Azure Pipelines and CircleCI\n&bull; Instant bug filing through Jira, Trello, Slack and GitHub. \n\nHope to see you on BrowserStack! \nNoah\n\nQUESTIONS? We are always here to help! Visit our documentation\n[http://email.browserstack.com/c/eJx9UMtuwyAQ_Br7ZgswGOfgQ6ok10pV7xZmtwmKAYuH_PvFUdRDq1Ta0-zMzs7kiGEyMHZDT3knaxjFLEDWaJVZplw2x3U95uStSjidHXygNQ6KiArJyYEdOlabUQAwTQY-AwU6UeBS4KFnnIiBMllxEtQdmw3nhhDaoGZNjkhVswYP7Rz8Vt6ISel7q71td-_6Ng6ScyA9Y4oIVF9yVpzLgfWC9djpmdfLeEtpjVV3rNilzLZtf44VGLwunEtOdtLKrspcXdWdLgHxMxi1TO9u9iqAcdeK9Q-WdwldKqQX4Z88i2CyLbTz_vETjD4Hjb_AhGHnnbzOtlxWyXhXsbcv78vmWXZCuy670T-t12HUCoxuE8aiLMVed-0etE4vRWn0PxGnh1n8BuG-rec]\npage or get in touch\n[http://email.browserstack.com/c/eJx9UMtuwyAQ_Br7Zgvwg_jgQ6okPVaqerfw7sZBMWBhkH-_OIp6aJVKCMTuzM7OxJX8oLGvDi2vK5lj34wNypyM0vMQU-e4LMcYnFGBhrPFTzLaYiLxRtasE10lct03iALYoR6RIx841rKhrhU1aw5cyKxmXt2p2GgsGOMFgSjiSlwVi3dYjt5taY01KLiX4Ey5a-e3viOhQDIhhFQIsktqLYN6VHAFecUxn_tbCMuaVcdMXNLZtu3PsFQGZ9MvZNUlBjOAMovSk82q08UTfXmt5uHDjk551HbKRPtAJQ7ZxDm98P_EGUIdTYKd96WfxdVFD_SrGMjvuHcKmXjTNl3BRbil9-pcaj4jD2SWedf6J_vc96BQQxloTcwU77Rzd7t5eEkKvftxOTzE1m-4AbAI]\nwith our support team.\n\n \t\t To unsubscribe please click here\n[http://email.browserstack.com/c/eJx9kUtrwzAQhH-NfXPQw_Lj4ENKk2uhtGcjadeJSGQZPfDfr1zcUlpS0Gn0jVazkwL60cDAu4bWvC1hEEpAW6KV5j6mfHNclmOKzsqI42mGV7Rmhmyioq1Jz3rOSjMIAKZJVyugQEcKdSuwb1hNREdZW9TEyxtWK6qKEFqhZlUKSGW1eAcH5d2avxGi1LeDdvawzS6vg5444VJQxXop2k5y2fecKN2oiXeqwfI-XGNcQsGPBTvns67rn8eynOaQVNDeKCz42UDBn_e4BWuiu-GcFdJNnSYaqCANItMd9shUoxoQVGqmMpqiHbW0izSXzXH2iG_eyPv4MisnPZj58kW5OeIcM_RgeztnEUyyGTttkXcxuOQ1_hIj-o17_xGFPU3OZX3vKqJd7tuYf0or_aAlGH2IGLIz93LZvNueyvjQFAf3HXD8HBY-AGzxwJc]\n\n\n \t\t &copy; 2019 BrowserStack Inc., 444 De Haro Street, Suite 212, San\nFrancisco, CA 94107 \n\n',1,'2019-11-18 16:02:20',0,NULL,NULL);
INSERT INTO `message` VALUES (3,0,0,0,3,'<A3ZY_r6DQ_16ZfxwQ9O0Bg.0@notifications.google.com>','Firebase',NULL,'[Firebase] La ejecuci&oacute;n #matrix-1tz6dgjxcieaq de Test Lab se complet&oacute; \ncorrectamente','Proyecto testeureka-cadic\r\n\r\nLa ejecuci&oacute;n de Test Lab se complet&oacute; correctamente.\r\n\r\n\r\nAbrir consola\r\n\r\n\r\nLa prueba reciente se complet&oacute; sin errores. Para ver los resultados  \r\ncompletos, visita la p&aacute;gina de pruebas.\r\n\r\n\r\n\r\n\r\n19 Nov 2019 16:07:12 UTC\r\n\r\n\r\n\r\nMatriz #matrix-1tz6dgjxcieaq\r\n\r\n\r\nNOMBRE DE LA APP\r\n\r\n\r\neureka\r\n\r\n\r\n\r\n\r\nVer resultados\r\n\r\n\r\nSi tienes alguna pregunta o piensas que recibiste este mensaje por error,  \r\ncomun&iacute;cate con el equipo de Asistencia de Firebase.\r\n\r\n&iexcl;Gracias por usar Firebase!\r\n\r\n\r\nRecibiste este aviso de servicio opcional por correo electr&oacute;nico en  \r\nrelaci&oacute;n con tu proyecto de Firebase\r\nAdministra tu configuraci&oacute;n de alertas\r\n\r\n\r\nGoogle Inc.\r\n1600 Amphitheatre Pkwy\r\nMountain View, CA, 94043 EE.UU.\n\n',1,'2019-11-19 16:07:16',0,NULL,NULL);
INSERT INTO `message` VALUES (4,0,0,0,4,'<611fa4b9-3bdc-de9a-2171-7d47e96c6d22@monday.com>','monday.com',NULL,'una semana m&aacute;s, gratis','[https://s3.amazonaws.com/monday-activemail/shared/monday-logo-top-100.png] Log\r\nin&rarr;\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tIiwibSI6ImY0YjExM2QzOWY3YWI1NWE2MTk2MmE4ZmNjZTAwYjRlIiwiaWF0IjoxNTc0MTgwODc5fQ.NBuklNsLHnNm-XrmOPIty_7v3GFX3NjPxXigHZNi_lk] pixel [https://amcdn.monday.com/images/0/f4b113d39f7ab55a61962a8fcce00b4e.png] \r\nNo te hemos visto en mucho tiempo ???? Tu cuenta te est&aacute; esperando y, a diferencia\r\nde muchas cosas en la vida, monday.com [href] te dar&aacute; una segunda oportunidad\r\npara que puedas mostrarle el panorama completo a tu equipo :) Agrega 7 d&iacute;as de\r\nprueba\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRjME1qWTNNamM1TENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFOelF4T0RBNE56bDkud3ZsWW1kNWZYVkhIdkhZZUhfdXdmWnBqWVlGREhaY2lOQUhUOG1lYm5aVSZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9cmVzdXJyZWN0MyZwYXRoPWJvYXJkcy9uZXdlc3RfcHVibGljX2JvYXJkIiwibSI6ImY0YjExM2QzOWY3YWI1NWE2MTk2MmE4ZmNjZTAwYjRlIiwiaWF0IjoxNTc0MTgwODc5fQ.tMTaL296RuK4cgPPwcGaLS2fTZzF_YJyQGHdlB0fE2k] \r\nconc&eacute;ntrate en tu trabajo\r\n[https://monday-activemail.s3.amazonaws.com/shared/Resurrectfunnel/day10/Views_001.gif]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRjME1qWTNNamM1TENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFOelF4T0RBNE56bDkud3ZsWW1kNWZYVkhIdkhZZUhfdXdmWnBqWVlGREhaY2lOQUhUOG1lYm5aVSZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9cmVzdXJyZWN0MyZwYXRoPWJvYXJkcy9uZXdlc3RfcHVibGljX2JvYXJkIiwibSI6ImY0YjExM2QzOWY3YWI1NWE2MTk2MmE4ZmNjZTAwYjRlIiwicCI6MiwiaWF0IjoxNTc0MTgwODc5fQ.me-6DrvdokmWEBioAAVxT3t_enQOuAQ8PiQl1tgiw8A] \r\nLogin\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tIiwibSI6ImY0YjExM2QzOWY3YWI1NWE2MTk2MmE4ZmNjZTAwYjRlIiwicCI6MiwiaWF0IjoxNTc0MTgwODc5fQ.-GJmyGWE-b3J_K38iXdRj1BiaWSbaCtbWWpiIMzJxOY] \r\n&bull; Webinars\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibW9uZGF5LmNvbS93ZWJpbmFycy8iLCJtIjoiZjRiMTEzZDM5ZjdhYjU1YTYxOTYyYThmY2NlMDBiNGUiLCJpYXQiOjE1NzQxODA4Nzl9.OKlbldiTqQrsFxzQvQ9o4Ojl6MAZulvTtnxZaXvGxSw] \r\n&bull; FAQ\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoic3VwcG9ydC5tb25kYXkuY29tIiwibSI6ImY0YjExM2QzOWY3YWI1NWE2MTk2MmE4ZmNjZTAwYjRlIiwiaWF0IjoxNTc0MTgwODc5fQ.t9Zvfx_qURZP6sGFD0OWS-4UD3DW4D3N5Gm2JIIVWk4] \r\n&bull; Community\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoiY29tbXVuaXR5Lm1vbmRheS5jb20iLCJtIjoiZjRiMTEzZDM5ZjdhYjU1YTYxOTYyYThmY2NlMDBiNGUiLCJpYXQiOjE1NzQxODA4Nzl9.VM4GZt6mhGpOxROl861hqEW2E1EN4yq0IWF_vOPc45M]  \r\n\r\nFollow us: \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138361/email_marketing/footer/Facebook.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LmZhY2Vib29rLmNvbS9tb25kYXlkb3Rjb20iLCJtIjoiZjRiMTEzZDM5ZjdhYjU1YTYxOTYyYThmY2NlMDBiNGUiLCJpYXQiOjE1NzQxODA4Nzl9.L2VHQC2UOgz2Zb3iY2LiGPzPR3lhU59ypBYHl49q9kk] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138361/email_marketing/footer/Youtube.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LnlvdXR1YmUuY29tL2NoYW5uZWwvVUNBOVV2QmlLSGx5MTVyTjh1X0ttM0JRIiwibSI6ImY0YjExM2QzOWY3YWI1NWE2MTk2MmE4ZmNjZTAwYjRlIiwiaWF0IjoxNTc0MTgwODc5fQ.Bttd1Qz7_5AHiiMbT2wm-o2gyljIaIhaSyVW4b6zSJM] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138359/email_marketing/footer/LinkedIN.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LmxpbmtlZGluLmNvbS9jb21wYW55LzI1MjUxNjkvIiwibSI6ImY0YjExM2QzOWY3YWI1NWE2MTk2MmE4ZmNjZTAwYjRlIiwiaWF0IjoxNTc0MTgwODc5fQ.qshKDw5PMSi9kjTcJoE8Tl4GmpnaydbD8HXPo8iCSXY] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138358/email_marketing/footer/Twitter.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidHdpdHRlci5jb20vbW9uZGF5ZG90Y29tIiwibSI6ImY0YjExM2QzOWY3YWI1NWE2MTk2MmE4ZmNjZTAwYjRlIiwiaWF0IjoxNTc0MTgwODc5fQ.qLLVo5uK2P8B538tN_0l54aD3J51Lfno-LU-Ci0HMGI]  \r\n\r\nmonday.com logo [https://amcdn.monday.com/images/1/f4b113d39f7ab55a61962a8fcce00b4e.png] monday.com [https://dapulse-res.cloudinary.com/image/upload/v1569157981/email_marketing/footer/monday-200x200.png] \r\n\r\n+1 (201) 778-4567 \r\n\r\nTel Aviv \r\n52 Menachem Begin Road \r\nTel Aviv 6713701 Israel \r\n\r\nNew York \r\n26 West 17th Street \r\nNew York, NY, 10011 United States Take monday.?com [href] everywhere with you \r\n[https://s3.amazonaws.com/monday-activemail/shared/download_android_app.png ] [\r\nhttps://go.onelink.me/wwJQ?pid=referral_install&amp;c=email_marketing&amp;email_source=trial&amp;type=android&amp;c=footer\r\n] [https://s3.amazonaws.com/monday-activemail/shared/download_ios_app.png ]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoiZ28ub25lbGluay5tZS93d0pRP3BpZD1yZWZlcnJhbF9pbnN0YWxsJmM9ZW1haWxfbWFya2V0aW5nJmVtYWlsX3NvdXJjZT10cmlhbCZ0eXBlPWlwaG9uZSZjPWZvb3RlciAiLCJtIjoiZjRiMTEzZDM5ZjdhYjU1YTYxOTYyYThmY2NlMDBiNGUiLCJpYXQiOjE1NzQxODA4Nzl9.RVGb1WHU1FVIWlwaaKFb_YXKcyoabcvusQ1ATxGem7s]  \r\n\r\nThis email was sent to you regarding your test514623.monday.?com [href] account.\r\nIf you wish to no longer receive emails from us you can unsubscribe\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibGlua3MubW9uZGF5LmNvbS91bnN1YnNjcmliZT91PWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUp0SWpvaVpqUmlNVEV6WkRNNVpqZGhZalUxWVRZeE9UWXlZVGhtWTJObE1EQmlOR1VpTENKcFlYUWlPakUxTnpReE9EQTROemw5LlVXNkE1Z3ZvRVgydUVFa20wQldkbWpTRGc3VWtuUFlJSVVFaEhKREFtcUUiLCJtIjoiZjRiMTEzZDM5ZjdhYjU1YTYxOTYyYThmY2NlMDBiNGUiLCJpYXQiOjE1NzQxODA4Nzl9.r6_pC3S8MKuvQWsudSalHAn42TZ6rZxemrQ0s_rMbsU]\r\n. \r\n\r\nWhy did I receive this email?\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibW9uZGF5LmNvbS90ZXJtcy9lbWFpbHMiLCJtIjoiZjRiMTEzZDM5ZjdhYjU1YTYxOTYyYThmY2NlMDBiNGUiLCJpYXQiOjE1NzQxODA4Nzl9.aYBnOr_Gvp4oEY8xbQOUcNu1z15qh0zZIe8LbmnPr2I]\n\n',1,'2019-11-19 16:28:02',0,NULL,NULL);
INSERT INTO `message` VALUES (5,0,0,0,5,'<c0g37QQMbV9ldV85RKy0jg.0@notifications.google.com>','Google',NULL,'Alerta de seguridad','[image: Google]\r\nAlguien accedi&oacute; a tu cuenta en un nuevo dispositivo\r\n\r\n\r\ncadic.tester@gmail.com\r\nAlguien acaba de acceder a tu cuenta de Google desde un nuevo dispositivo\r\nWindows. Te enviamos este correo electr&oacute;nico para asegurarnos de que hayas\r\nsido t&uacute;.\r\nVer actividad\r\n&lt;https://accounts.google.com/AccountChooser?Email=cadic.tester@gmail.com&amp;continue=https://myaccount.google.com/alert/nt/1575643060000?rfn%3D31%26rfnc%3D1%26eid%3D-2749835097910927846%26et%3D0%26anexp%3Dhsc-control_b&gt;\r\nTe enviamos este correo electr&oacute;nico para notificarte acerca de cambios\r\nimportantes en tu cuenta y en los servicios de Google.\r\n&copy; 2019 Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA\n\n',1,'2019-12-06 14:37:42',0,NULL,NULL);
INSERT INTO `message` VALUES (6,0,0,0,5,'<1JdhMlx43NZS-6VcNksSWg.0@notifications.google.com>','Google',NULL,'Alerta de seguridad','[image: Google]\r\nAlguien accedi&oacute; a tu cuenta en un nuevo dispositivo\r\n\r\n\r\ncadic.tester@gmail.com\r\nAlguien acaba de acceder a tu cuenta de Google desde un nuevo dispositivo\r\nWindows. Te enviamos este correo electr&oacute;nico para asegurarnos de que hayas\r\nsido t&uacute;.\r\nVer actividad\r\n&lt;https://accounts.google.com/AccountChooser?Email=cadic.tester@gmail.com&amp;continue=https://myaccount.google.com/alert/nt/1576179437000?rfn%3D31%26rfnc%3D1%26eid%3D-8088919433411947428%26et%3D0%26anexp%3Dhsc-control_b&gt;\r\nTe enviamos este correo electr&oacute;nico para notificarte acerca de cambios\r\nimportantes en tu cuenta y en los servicios de Google.\r\n&copy; 2019 Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA\n\n',1,'2019-12-12 19:37:19',0,NULL,NULL);
INSERT INTO `message` VALUES (7,0,0,0,6,'<000000000000d5e49205998d9edb@google.com>','cadic tester (mediante Google Drive)',NULL,'CASOS_DE_PRUEBA - Invitaci&oacute;n para colaborar','He compartido un elemento contigo:\r\n\r\nCASOS_DE_PRUEBA\r\nhttps://drive.google.com/drive/folders/1pQQPEM5cxYJJ0mZmGd3XPiJaL8lp4oKK?usp=sharing&amp;ts=5df30821\r\n\r\nNo es un archivo adjunto; est&aacute; almacenado en l&iacute;nea. Para abrir este  \r\nelemento, haz clic en el v&iacute;nculo de arriba.\r\n\r\nHola andres\r\nen esta carpeta para que subamos los casos de prueba que le vamos a  \r\ncompartir a la celula...  y me compartes porfa un caso de prueba de los  \r\ntuyos para acomodarle a los que tengo .. parte de la narrativa que le  \r\npusistes. y dejamos las variables tecnicas para nosotros cuando vallamos a  \r\nautomatizar..  me cuentas que piensas para uqe lo definamos ma&ntilde;na.\r\n\r\n\r\nEsta es una copia de cortes&iacute;a de un correo electr&oacute;nico para tus registros  \r\n&uacute;nicamente. No es el mismo correo electr&oacute;nico que recibieron tus  \r\ncolaboradores. Para obtener m&aacute;s informaci&oacute;n, visita  \r\nhttps://support.google.com/drive/?p=courtesy_copy.\n\n',1,'2019-12-13 03:40:18',0,NULL,NULL);
INSERT INTO `message` VALUES (8,0,0,0,6,'<0000000000001528f505998dd95a@google.com>','cadic tester (mediante Google Drive)',NULL,'DOCUMENTACION_FUNCIONAL_TRANSACCIONES - Invitaci&oacute;n para colaborar','He compartido un elemento contigo:\r\n\r\nDOCUMENTACION_FUNCIONAL_TRANSACCIONES\r\nhttps://drive.google.com/drive/folders/1TQRSHMPrrmxmoFfuv2Dd0RzBwmJosIAe?usp=sharing&amp;ts=5df30bf3\r\n\r\nNo es un archivo adjunto; est&aacute; almacenado en l&iacute;nea. Para abrir este  \r\nelemento, haz clic en el v&iacute;nculo de arriba.\r\n\r\nandres esta nos servira para guardar de una vez los manuales funcionales de  \r\nlas criticas... que a me dida que hacemos las pruebas creamos los manuales  \r\nde las mismas ma&ntilde;ana pensamos que estrategia o procedmiento nos inventamos  \r\nque lo hagamos dentro de la misma prueba. y asi generamos 2 productos en 1  \r\npaso.\r\nse me ocurre algo como  add unas columnas de mas donde tomemos ciertos  \r\ndatos  cortos pero expecifios ..que nos ayuden a construir el manual  \r\nfuncional de una vez.  piensalo y me cuentas ma&ntilde;ana.\r\n\r\nEsta es una copia de cortes&iacute;a de un correo electr&oacute;nico para tus registros  \r\n&uacute;nicamente. No es el mismo correo electr&oacute;nico que recibieron tus  \r\ncolaboradores. Para obtener m&aacute;s informaci&oacute;n, visita  \r\nhttps://support.google.com/drive/?p=courtesy_copy.\n\n',1,'2019-12-13 03:56:35',0,NULL,NULL);
INSERT INTO `message` VALUES (9,0,0,0,5,'<rnmLOAwo2k8y8LrxjdwzPA.0@notifications.google.com>','Google',NULL,'Alerta de seguridad','[image: Google]\r\n@Voice Add to List tiene acceso a tu cuenta de Google\r\n\r\n\r\ncadic.tester@gmail.com\r\n\r\nSi no otorgaste este acceso, revisa tu actividad y protege tu cuenta.\r\nVer actividad\r\n&lt;https://accounts.google.com/AccountChooser?Email=cadic.tester@gmail.com&amp;continue=https://myaccount.google.com/alert/nt/1576631965000?rfn%3D127%26rfnc%3D1%26eid%3D-6771950260461568849%26et%3D0&gt;\r\nTe enviamos este correo electr&oacute;nico para notificarte acerca de cambios\r\nimportantes en tu cuenta y en los servicios de Google.\r\n&copy; 2019 Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA\n\n',1,'2019-12-18 01:19:26',0,NULL,NULL);
INSERT INTO `message` VALUES (10,0,0,0,7,'<0100016f900a8059-47798e82-7a4b-4fd7-be10-baeeb9b5d055-000000@email.amazonses.com>','BrowserStack',NULL,'We&#039;re updating our Terms of Service and Privacy Policy','Hello,\r\n\r\nBrowserStack is committed to making developers&rsquo; lives easier. As part of our growth and in support of compliance laws around the world, we&#039;re updating our Privacy Policy (https://www.browserstack.com/privacy?ref=&amp;utm_campaign=newsletter-ofac-ccpa-announcement-202001&amp;utm_content=Generic_OFAC_CCPA&amp;utm_medium=Email&amp;utm_source=Other_Notification&amp;utm_term=PrivacyPolicy) &amp; Terms of Service (https://www.browserstack.com/terms?ref=&amp;utm_campaign=newsletter-ofac-ccpa-announcement-202001&amp;utm_content=Generic_OFAC_CCPA&amp;utm_medium=Email&amp;utm_source=Other_Notification&amp;utm_term=TermsOfService), and we encourage you to review the new version.\r\n\r\nHere is a quick summary of the changes:\r\n\r\nImproved clarity &amp; transparency: We&#039;ve re-organized our Privacy Policy to make it clearer and more understandable, defined key terms, and described our data processing practices.\r\n\r\nOFAC Updates: We have updated our Terms of Service as per the Office of Foreign Assets Control (&quot;OFAC&quot;) of the US Department of the Treasury and made it clearer.\r\n\r\nCCPA Updates: As part of our preparation for California&#039;s privacy law, we wanted to let you know that we&#039;ve updated our Privacy Policy. Which now includes specific information and details for our customers who are residents of California.\r\n\r\nNeed assistance? Please drop us a note at compliance@browserstack.com. As always, thank you for using BrowserStack.\r\n\r\nHappy Testing!\r\nThe BrowserStack Team\n\n',1,'2020-01-10 15:20:05',0,NULL,NULL);
INSERT INTO `message` VALUES (11,0,0,0,8,'<AqrRAdNu3BONJ9ZQWyX27g.0@notifications.google.com>','=?UTF-8?Q?Andres_Laverde_(Hojas_de_c=C3=A1lculo_de_Google)?=',NULL,'Solucion_de_la_do... - Se requieren parametros validos que p...','Andres Laverde respondi&oacute; a un comentario en el siguiente documento\r\nSolucion_de_la_documentacion10122019.xlsx  \r\n(https://docs.google.com/spreadsheets/d/1eYRLkxaaAlw_5TlLOCJmtx5zJ349gPSG/edit?disco=AAAAI4XBR9w&amp;ts=5e2873f9&amp;usp=comment_email_document&amp;usp_dm=false)\r\n\r\nDesconocido\r\nSe requieren parametros validos que permitan la prueba de tx\r\n----\r\nSe requiere capacitaci&oacute;n para ejecutar la prueba\r\n\t-Andres Laverde\r\n\r\nAndres Laverde\r\nSe creo el infotipo pero hay que actualizar el infogrupo.\r\n\r\n\r\nGoogle LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA\r\n\r\nRecibiste este correo electr&oacute;nico porque est&aacute;s suscrito a todos los  \r\ncomentarios de Solucion_de_la_documentacion10122019.xlsx.\r\nCambiar lo que Documentos de Google te env&iacute;a  \r\n(https://docs.google.com/comments/u/114482263868680180479/docos/notify?id=AAHRpnXv-DmUP3TebZtWL1o9gJTZUuylraxhiYFbnKCk8lklJRIfcDGP_nrp_zp0BQO-W113CB2Vk85O87UFYVb4hbInk3LhZDg&amp;title=Solucion_de_la_documentacion10122019.xlsx)\r\nNo puedes responder a este mensaje. Ver  \r\nSolucion_de_la_documentacion10122019.xlsx  \r\n(https://docs.google.com/spreadsheets/d/1eYRLkxaaAlw_5TlLOCJmtx5zJ349gPSG/edit?disco=AAAAI4XBR9w&amp;usp=comment_email_discussion&amp;usp_dm=false&amp;ts=5e2873f9)  \r\npara responder.\n\n',1,'2020-01-22 16:10:34',0,NULL,NULL);
INSERT INTO `message` VALUES (12,0,0,0,8,'<EzwIOxhXLyxE3RZVbxJ4UQ.0@notifications.google.com>','=?UTF-8?Q?Andres_Laverde_(Hojas_de_c=C3=A1lculo_de_Google)?=',NULL,'Solucion_de_la_do... - Falta informaci&oacute;n para poder probar','Andres Laverde agreg&oacute; un comentario al siguiente documento\r\nSolucion_de_la_documentacion10122019.xlsx  \r\n(https://docs.google.com/spreadsheets/d/1eYRLkxaaAlw_5TlLOCJmtx5zJ349gPSG/edit?disco=AAAAI4rwLME&amp;ts=5e289dd1&amp;usp=comment_email_document&amp;usp_dm=false)\r\n\r\nAndres Laverde\r\n| Pdte hacer prueba\r\nFalta informaci&oacute;n para poder probar\r\n\r\n\r\nGoogle LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA\r\n\r\nRecibiste este correo electr&oacute;nico porque est&aacute;s suscrito a todos los  \r\ncomentarios de Solucion_de_la_documentacion10122019.xlsx.\r\nCambiar lo que Documentos de Google te env&iacute;a  \r\n(https://docs.google.com/comments/u/114482263868680180479/docos/notify?id=AAHRpnXv-DmUP3TebZtWL1o9gJTZUuylraxhiYFbnKCk8lklJRIfcDGP_nrp_zp0BQO-W113CB2Vk85O87UFYVb4hbInk3LhZDg&amp;title=Solucion_de_la_documentacion10122019.xlsx)\r\nNo puedes responder a este mensaje. Ver  \r\nSolucion_de_la_documentacion10122019.xlsx  \r\n(https://docs.google.com/spreadsheets/d/1eYRLkxaaAlw_5TlLOCJmtx5zJ349gPSG/edit?disco=AAAAI4rwLME&amp;usp=comment_email_discussion&amp;usp_dm=false&amp;ts=5e289dd1)  \r\npara responder.\n\n',1,'2020-01-22 14:09:06',0,NULL,NULL);
INSERT INTO `message` VALUES (13,0,0,0,8,'<ErcJWQ7pW3sxnG-X2bxmfw.0@notifications.google.com>','=?UTF-8?Q?Andres_Laverde_(Hojas_de_c=C3=A1lculo_de_Google)?=',NULL,'Solucion_de_la_do... - Solicitar archivo plano','Andres Laverde agreg&oacute; un comentario al siguiente documento\r\nSolucion_de_la_documentacion10122019.xlsx  \r\n(https://docs.google.com/spreadsheets/d/1eYRLkxaaAlw_5TlLOCJmtx5zJ349gPSG/edit?disco=AAAAI4rwLHE&amp;ts=5e289c2e&amp;usp=comment_email_document&amp;usp_dm=false)\r\n\r\nAndres Laverde\r\n| Pdte hacer prueba\r\nSolicitar archivo plano\r\n\r\n\r\nGoogle LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA\r\n\r\nRecibiste este correo electr&oacute;nico porque est&aacute;s suscrito a todos los  \r\ncomentarios de Solucion_de_la_documentacion10122019.xlsx.\r\nCambiar lo que Documentos de Google te env&iacute;a  \r\n(https://docs.google.com/comments/u/114482263868680180479/docos/notify?id=AAHRpnXv-DmUP3TebZtWL1o9gJTZUuylraxhiYFbnKCk8lklJRIfcDGP_nrp_zp0BQO-W113CB2Vk85O87UFYVb4hbInk3LhZDg&amp;title=Solucion_de_la_documentacion10122019.xlsx)\r\nNo puedes responder a este mensaje. Ver  \r\nSolucion_de_la_documentacion10122019.xlsx  \r\n(https://docs.google.com/spreadsheets/d/1eYRLkxaaAlw_5TlLOCJmtx5zJ349gPSG/edit?disco=AAAAI4rwLHE&amp;usp=comment_email_discussion&amp;usp_dm=false&amp;ts=5e289c2e)  \r\npara responder.\n\n',1,'2020-01-22 14:10:12',0,NULL,NULL);
INSERT INTO `message` VALUES (14,0,0,0,4,'<daaf69e6-7d9c-a483-5f75-976dead5ac32@monday.com>','monday.com',NULL,'Test Municipio + monday.com','[https://s3.amazonaws.com/monday-activemail/shared/monday-logo-top-100.png] Log\r\nin&rarr;\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tIiwibSI6ImRmYWUxNzM0NDA1ZGZjMTMzOWQzYTlmNmFlNzEzN2MxIiwiaWF0IjoxNTc5ODA3Njg2fQ.UgbRdpBr32s82IDqvSsRkDwm2oge07og5qSTMAjnzWs] pixel [https://amcdn.monday.com/images/0/dfae1734405dfc1339d3a9f6ae7137c1.png] \r\nEase your way back to work (?) 2019 is over, and the first weeks of January can\r\nbe quite hectic. Start by organizing everything&mdash;create a roadmap, map out the\r\nsteps for each one of your projects, list out all of your tasks. And you know\r\nwhat? Planning is work, too! test514623.monday.com\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRjNU9EazBNRGczTENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFOems0TURjMk9EWjkuMWtQTU9iUXJKYUNvWWVGNUUtNldBRmJaNjBnZ1hnTVk4UnMxS1RFN0k3VSZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9amFuMjAyMHRlbXBsYXRlcyZwYXRoPWJvYXJkcy9uZXdlc3RfcHVibGljX2JvYXJkIiwibSI6ImRmYWUxNzM0NDA1ZGZjMTMzOWQzYTlmNmFlNzEzN2MxIiwiaWF0IjoxNTc5ODA3Njg2fQ.1470WKJoKfbCC0xRi-u1Vi9R9VpBqlH2UNe-ZBSQS6A] \r\nStart with these 4 templates \r\n[https://dapulse-res.cloudinary.com/image/upload/v1567601973/email_marketing/Group_22.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRjNU9EazBNRGczTENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFOems0TURjMk9EWjkuMWtQTU9iUXJKYUNvWWVGNUUtNldBRmJaNjBnZ1hnTVk4UnMxS1RFN0k3VSZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9amFuMjAyMHRlbXBsYXRlcyZwYXRoPWFjY291bnRzL2FkZF9ib2FyZF90ZW1wbGF0ZT9pZD1wcm9qZWN0X21hbmFnbWVudF90ZWFtX3Rhc2tzIiwibSI6ImRmYWUxNzM0NDA1ZGZjMTMzOWQzYTlmNmFlNzEzN2MxIiwiaWF0IjoxNTc5ODA3Njg2fQ.nkBGzKdF6DpFNTRVlGbWcKHW8YhykvDsyvarlttaTdo] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1567601973/email_marketing/Group_23.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRjNU9EazBNRGczTENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFOems0TURjMk9EWjkuMWtQTU9iUXJKYUNvWWVGNUUtNldBRmJaNjBnZ1hnTVk4UnMxS1RFN0k3VSZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9amFuMjAyMHRlbXBsYXRlcyZwYXRoPWFjY291bnRzL2FkZF9ib2FyZF90ZW1wbGF0ZT9pZD1wcm9qZWN0X21hbmFnbWVudF9zaW5nbGVfcHJvamVjdF90cmFja2luZyIsIm0iOiJkZmFlMTczNDQwNWRmYzEzMzlkM2E5ZjZhZTcxMzdjMSIsImlhdCI6MTU3OTgwNzY4Nn0.Q34rtUx9Fj-NQjY0wlgxg29CjvvT9MVTfQKfHmxB9bo] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1567601973/email_marketing/Group_24.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRjNU9EazBNRGczTENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFOems0TURjMk9EWjkuMWtQTU9iUXJKYUNvWWVGNUUtNldBRmJaNjBnZ1hnTVk4UnMxS1RFN0k3VSZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9amFuMjAyMHRlbXBsYXRlcyZwYXRoPWFjY291bnRzL2FkZF9ib2FyZF90ZW1wbGF0ZT9pZD1zaGFyZV9wcm9qZWN0c193aXRoX3lvdXJfY2xpZW50cyIsIm0iOiJkZmFlMTczNDQwNWRmYzEzMzlkM2E5ZjZhZTcxMzdjMSIsImlhdCI6MTU3OTgwNzY4Nn0.xQN174qQRFHWsvA39_EcIORpZ8CVzefxD_s3t6l2_jU] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1567601973/email_marketing/Group_25.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRjNU9EazBNRGczTENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFOems0TURjMk9EWjkuMWtQTU9iUXJKYUNvWWVGNUUtNldBRmJaNjBnZ1hnTVk4UnMxS1RFN0k3VSZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9amFuMjAyMHRlbXBsYXRlcyZwYXRoPWFjY291bnRzL2FkZF9ib2FyZF90ZW1wbGF0ZT9pZD1wcm9qZWN0X21hbmFnbWVudF9wcm9jZXNzX21hbmFnbWVudCIsIm0iOiJkZmFlMTczNDQwNWRmYzEzMzlkM2E5ZjZhZTcxMzdjMSIsImlhdCI6MTU3OTgwNzY4Nn0.-qX_ZxtqWTb6FJX1xJnCgbobvi3lp8xXOP8FRRYWLpg] \r\nLogin\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tIiwibSI6ImRmYWUxNzM0NDA1ZGZjMTMzOWQzYTlmNmFlNzEzN2MxIiwicCI6MiwiaWF0IjoxNTc5ODA3Njg2fQ.MBr-mPtGmtMyT8JY-O1pJbGhYIeuvqGsXUj-TWgjr0k] \r\n&bull; Webinars\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibW9uZGF5LmNvbS93ZWJpbmFycy8iLCJtIjoiZGZhZTE3MzQ0MDVkZmMxMzM5ZDNhOWY2YWU3MTM3YzEiLCJpYXQiOjE1Nzk4MDc2ODZ9.g9-zQ6o7sdewbAEvjgTWbxvM9I7cxsWe1HNQ9z94o8E] \r\n&bull; FAQ\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoic3VwcG9ydC5tb25kYXkuY29tIiwibSI6ImRmYWUxNzM0NDA1ZGZjMTMzOWQzYTlmNmFlNzEzN2MxIiwiaWF0IjoxNTc5ODA3Njg2fQ.1-drvuaJDM4G9KyL7e0xUcvfFYFlE4D5vb-1RWLCAtE] \r\n&bull; Community\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoiY29tbXVuaXR5Lm1vbmRheS5jb20iLCJtIjoiZGZhZTE3MzQ0MDVkZmMxMzM5ZDNhOWY2YWU3MTM3YzEiLCJpYXQiOjE1Nzk4MDc2ODZ9.uMOUSM9CDbqyQp99j04DHY_1v4slKzTrnteroEcnOls]  \r\n\r\nFollow us: \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138361/email_marketing/footer/Facebook.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LmZhY2Vib29rLmNvbS9tb25kYXlkb3Rjb20iLCJtIjoiZGZhZTE3MzQ0MDVkZmMxMzM5ZDNhOWY2YWU3MTM3YzEiLCJpYXQiOjE1Nzk4MDc2ODZ9.Tc77X15RXYgvZ87DiR7BrorKlVdUGrl4GIw-5ok9dK0] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138361/email_marketing/footer/Youtube.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LnlvdXR1YmUuY29tL2NoYW5uZWwvVUNBOVV2QmlLSGx5MTVyTjh1X0ttM0JRIiwibSI6ImRmYWUxNzM0NDA1ZGZjMTMzOWQzYTlmNmFlNzEzN2MxIiwiaWF0IjoxNTc5ODA3Njg2fQ.kUAoc92oM-SihBuqoGMclwWGurQQzo1WbRsTPozgyU4] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138359/email_marketing/footer/LinkedIN.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LmxpbmtlZGluLmNvbS9jb21wYW55LzI1MjUxNjkvIiwibSI6ImRmYWUxNzM0NDA1ZGZjMTMzOWQzYTlmNmFlNzEzN2MxIiwiaWF0IjoxNTc5ODA3Njg2fQ.vVnzto4aZDDglzMDJ11UmHhn4Q9h80-1wZ65Dxw4MCU] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138358/email_marketing/footer/Twitter.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidHdpdHRlci5jb20vbW9uZGF5ZG90Y29tIiwibSI6ImRmYWUxNzM0NDA1ZGZjMTMzOWQzYTlmNmFlNzEzN2MxIiwiaWF0IjoxNTc5ODA3Njg2fQ.qn63Gloc8ysRRJLvzkBxuDiGYJcFqdjgB3j4clpCAhE]  \r\n\r\nmonday.com logo [https://amcdn.monday.com/images/1/dfae1734405dfc1339d3a9f6ae7137c1.png] monday.com [https://dapulse-res.cloudinary.com/image/upload/v1569157981/email_marketing/footer/monday-200x200.png] \r\n\r\n+1 (201) 778-4567 \r\n\r\nTel Aviv \r\n52 Menachem Begin Road \r\nTel Aviv 6713701 Israel \r\n\r\nNew York \r\n26 West 17th Street \r\nNew York, NY, 10011 United States Take monday.?com [href] everywhere with you \r\n[https://s3.amazonaws.com/monday-activemail/shared/download_android_app.png ] [\r\nhttps://go.onelink.me/wwJQ?pid=referral_install&amp;c=email_marketing&amp;email_source=trial&amp;type=android&amp;c=footer\r\n] [https://s3.amazonaws.com/monday-activemail/shared/download_ios_app.png ]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoiZ28ub25lbGluay5tZS93d0pRP3BpZD1yZWZlcnJhbF9pbnN0YWxsJmM9ZW1haWxfbWFya2V0aW5nJmVtYWlsX3NvdXJjZT10cmlhbCZ0eXBlPWlwaG9uZSZjPWZvb3RlciAiLCJtIjoiZGZhZTE3MzQ0MDVkZmMxMzM5ZDNhOWY2YWU3MTM3YzEiLCJpYXQiOjE1Nzk4MDc2ODZ9.yWePZYGGmRjMvcQyQSC03z1XHQQFtJdClCx13Rj9lPo]  \r\n\r\nThis email was sent to you regarding your test514623.monday.?com [href] account.\r\nIf you wish to no longer receive emails from us you can unsubscribe\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibGlua3MubW9uZGF5LmNvbS91bnN1YnNjcmliZT91PWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUp0SWpvaVpHWmhaVEUzTXpRME1EVmtabU14TXpNNVpETmhPV1kyWVdVM01UTTNZekVpTENKcFlYUWlPakUxTnprNE1EYzJPRFo5LmJ5ekVvOGQwM3B6NzNwRzl4MWotVlM3bGVLc3lCZVhEVW1Xc25IcHhtZGciLCJtIjoiZGZhZTE3MzQ0MDVkZmMxMzM5ZDNhOWY2YWU3MTM3YzEiLCJpYXQiOjE1Nzk4MDc2ODZ9.K89km-SZlA565Its3B-lQePo4nIfH5642Cylq3fH7qQ]\r\n. \r\n\r\nWhy did I receive this email?\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibW9uZGF5LmNvbS90ZXJtcy9lbWFpbHMiLCJtIjoiZGZhZTE3MzQ0MDVkZmMxMzM5ZDNhOWY2YWU3MTM3YzEiLCJpYXQiOjE1Nzk4MDc2ODZ9.CswQgG3a7h9eyYhuhlW-Bztas9DpBdNofh_Z9orEeVk]\n\n',1,'2020-01-23 14:28:10',0,NULL,NULL);
INSERT INTO `message` VALUES (15,0,0,0,4,'<166b30eb-4299-8a16-ee2f-b9ad85f618dc@monday.com>','monday.com',NULL,'Introducing monday 2.0','[https://s3.amazonaws.com/monday-activemail/shared/monday-logo-top-100.png] Log\r\nin&rarr;\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tIiwibSI6ImZmMTA0NzE0NjcyOTFlZWY3MjFhYTA4ZmMyM2U3ZGRlIiwiaWF0IjoxNTgwODQ4MTMzfQ.-hJZsOJAxmmZNFkRyNbw4cZjTb1EHY6RIoBbn9RkrTo] pixel [https://amcdn.monday.com/images/0/ff10471467291eef721aa08fc23e7dde.png] \r\nMeet monday.?com [href] Work OS Try monday 2.0, the visual Work OS that powers\r\nteams to run projects and workflows with confidence. Try monday 2.0\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRnd09UTTBOVE0wTENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFPREE0TkRneE16TjkuaVpjaEVYVXBZNzZLTkg1TFI3SEhod3kya1BybWdWdWJmMmR3RVRucDVNYyZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9bW9uZGF5dHdvemVybyZwYXRoPWJvYXJkcy9uZXdlc3RfcHVibGljX2JvYXJkIiwibSI6ImZmMTA0NzE0NjcyOTFlZWY3MjFhYTA4ZmMyM2U3ZGRlIiwiaWF0IjoxNTgwODQ4MTMzfQ.t_vAl2s1Y-UlqNN9RLIYoxSbWotCpoabggSH21NTcTk] \r\nVideo about what you can achieve with monday.com\r\n[https://monday-activemail.s3.amazonaws.com/shared/Campaigns/monday20/Video+image+(1).png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LnlvdXR1YmUuY29tL3dhdGNoP3Y9bC03YXdWcGVjdlUiLCJtIjoiZmYxMDQ3MTQ2NzI5MWVlZjcyMWFhMDhmYzIzZTdkZGUiLCJpYXQiOjE1ODA4NDgxMzN9.K5db4loj6VL4bMinsWNFR56Q3pUdsOPabNL7-209NFM] \r\nLogin\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tIiwibSI6ImZmMTA0NzE0NjcyOTFlZWY3MjFhYTA4ZmMyM2U3ZGRlIiwicCI6MiwiaWF0IjoxNTgwODQ4MTMzfQ.fq_0exBdVDQBwaTBSAS1FF6oIMp446WE8qx3PRmPTEo] \r\n&bull; Webinars\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibW9uZGF5LmNvbS93ZWJpbmFycy8iLCJtIjoiZmYxMDQ3MTQ2NzI5MWVlZjcyMWFhMDhmYzIzZTdkZGUiLCJpYXQiOjE1ODA4NDgxMzN9.2SMpyrRt1LZVxjBAeOMbMu7MzHugrgwIt-viYFzW5co] \r\n&bull; FAQ\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoic3VwcG9ydC5tb25kYXkuY29tIiwibSI6ImZmMTA0NzE0NjcyOTFlZWY3MjFhYTA4ZmMyM2U3ZGRlIiwiaWF0IjoxNTgwODQ4MTMzfQ.gwxjOKrzH1RuagvNTOynxshZCrws1u0qpiEFQ2Kilv4] \r\n&bull; Community\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoiY29tbXVuaXR5Lm1vbmRheS5jb20iLCJtIjoiZmYxMDQ3MTQ2NzI5MWVlZjcyMWFhMDhmYzIzZTdkZGUiLCJpYXQiOjE1ODA4NDgxMzN9.JG4rtb5OqysYJpKDV8Gz746w2wd-5YqVbX9cd60Bh7U]  \r\n\r\nFollow us: \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138361/email_marketing/footer/Facebook.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LmZhY2Vib29rLmNvbS9tb25kYXlkb3Rjb20iLCJtIjoiZmYxMDQ3MTQ2NzI5MWVlZjcyMWFhMDhmYzIzZTdkZGUiLCJpYXQiOjE1ODA4NDgxMzN9.fRHfISQ8FIva83P1gCv2rEchCRiY8AN2GSCGU9XKVhs] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138361/email_marketing/footer/Youtube.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LnlvdXR1YmUuY29tL2NoYW5uZWwvVUNBOVV2QmlLSGx5MTVyTjh1X0ttM0JRIiwibSI6ImZmMTA0NzE0NjcyOTFlZWY3MjFhYTA4ZmMyM2U3ZGRlIiwiaWF0IjoxNTgwODQ4MTMzfQ.DTBSMXKdu2qRSJnMBxR1jQoG1NzOT1aABoKkNWjtw-I] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138359/email_marketing/footer/LinkedIN.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LmxpbmtlZGluLmNvbS9jb21wYW55LzI1MjUxNjkvIiwibSI6ImZmMTA0NzE0NjcyOTFlZWY3MjFhYTA4ZmMyM2U3ZGRlIiwiaWF0IjoxNTgwODQ4MTMzfQ.O-VdLDZhv8-QutdAsYdBPTkNhS5FLnywP4ehvSCZZR0] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138358/email_marketing/footer/Twitter.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidHdpdHRlci5jb20vbW9uZGF5ZG90Y29tIiwibSI6ImZmMTA0NzE0NjcyOTFlZWY3MjFhYTA4ZmMyM2U3ZGRlIiwiaWF0IjoxNTgwODQ4MTMzfQ.k4RpOjlTLWw2uFjUHFZWAgiQHjjr0AXNIfMX2HIa2Ik]  \r\n\r\nmonday.com logo [https://amcdn.monday.com/images/1/ff10471467291eef721aa08fc23e7dde.png] monday.com [https://dapulse-res.cloudinary.com/image/upload/v1569157981/email_marketing/footer/monday-200x200.png] \r\n\r\n+1 (201) 778-4567 \r\n\r\nTel Aviv \r\n52 Menachem Begin Road \r\nTel Aviv 6713701 Israel \r\n\r\nNew York \r\n26 West 17th Street \r\nNew York, NY, 10011 United States Take monday.?com [href] everywhere with you \r\n[https://s3.amazonaws.com/monday-activemail/shared/download_android_app.png ] [\r\nhttps://go.onelink.me/wwJQ?pid=referral_install&amp;c=email_marketing&amp;email_source=trial&amp;type=android&amp;c=footer\r\n] [https://s3.amazonaws.com/monday-activemail/shared/download_ios_app.png ]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoiZ28ub25lbGluay5tZS93d0pRP3BpZD1yZWZlcnJhbF9pbnN0YWxsJmM9ZW1haWxfbWFya2V0aW5nJmVtYWlsX3NvdXJjZT10cmlhbCZ0eXBlPWlwaG9uZSZjPWZvb3RlciAiLCJtIjoiZmYxMDQ3MTQ2NzI5MWVlZjcyMWFhMDhmYzIzZTdkZGUiLCJpYXQiOjE1ODA4NDgxMzN9.qn2mbeFTsgKpOon9f__2413vDZxiWGQdGF4B2juKkv8]  \r\n\r\nThis email was sent to you regarding your test514623.monday.?com [href] account.\r\nIf you wish to no longer receive emails from us you can unsubscribe\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibGlua3MubW9uZGF5LmNvbS91bnN1YnNjcmliZT91PWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUp0SWpvaVptWXhNRFEzTVRRMk56STVNV1ZsWmpjeU1XRmhNRGhtWXpJelpUZGtaR1VpTENKcFlYUWlPakUxT0RBNE5EZ3hNek45LmQxWW5ubDlVZlBpdF95dkFKRTNvVUVnUmk5WXRZdFdEdXl2MHY3OWh4WGsiLCJtIjoiZmYxMDQ3MTQ2NzI5MWVlZjcyMWFhMDhmYzIzZTdkZGUiLCJpYXQiOjE1ODA4NDgxMzN9.Oj_ZQpYKlKT8S-5O7mlxu1J7AeeepKzhi30M8sr9bQA]\r\n. \r\n\r\nWhy did I receive this email?\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibW9uZGF5LmNvbS90ZXJtcy9lbWFpbHMiLCJtIjoiZmYxMDQ3MTQ2NzI5MWVlZjcyMWFhMDhmYzIzZTdkZGUiLCJpYXQiOjE1ODA4NDgxMzN9.wQYyougzLUM_4e5catoW8zxfCn3sFzD7hZxBe8619Vk]\n\n',1,'2020-02-04 15:28:56',0,NULL,NULL);
INSERT INTO `message` VALUES (16,0,0,0,9,'<0100017032541e8a-4ecd5896-a104-4599-bc93-de7b8dc0da33-000000@email.amazonses.com>','Academia.edu',NULL,'Here&#039;s your download','Hi cadic,\r\n\r\nThank you for joining the Academia.edu community.\r\n\r\nYour download, &quot;A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System on Windows 7 by Ladislav Rydzyk from ABAP Academy&quot; by tanish gupta, is attached.\r\n\r\nIf you would like to upload your own work so others can read it, you can do so from your Academia.edu profile:\r\nhttps://independent.academia.edu/keypass/dUZEL3A5ZEVYa3BIQjhEeTg5eExvVFBvZmRZUGZ1enZ0aU1HRzZuc08yOD0tLW1GU2lUTUQ5MVhLcDNmbTZ4UDBDU3c9PQ==--a6fbf8e4c57d3b164a119f6c35d31017604c9d30/t/m9ZxJ-ND8uKLQ-koJkL/cadictester\r\n\r\nThanks,\r\nThe Academia.edu Team\r\n\r\n-----\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-10 22:39:01',0,NULL,NULL);
INSERT INTO `message` VALUES (17,0,0,0,10,'<0100017033999398-917d472a-9cec-430d-8bef-8f9e563b8881-000000@email.amazonses.com>','Academia.edu',NULL,'50% Off, 2 days only: &ldquo;C. Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in La Grande, United States','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C. Tester&rdquo; mentioned in a paper uploaded by someone in La Grande, United States. View your mentions with 50% off Academia Premium when you upgrade in the next 2 days.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/bWdyeG1GaVdTdWJkVHNDUVRpa2RNdjZnWnBIVysxVVZKRXJlQVJHK0JxUT0tLXpsNmcwZ0EvZjZybThrMnJNcGdTa2c9PQ==--81214e9aa7645159c835add4f43b51642d7e7245/t/m9ZxJ-NEafBm1-bjJbXV/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/bWdyeG1GaVdTdWJkVHNDUVRpa2RNdjZnWnBIVysxVVZKRXJlQVJHK0JxUT0tLXpsNmcwZ0EvZjZybThrMnJNcGdTa2c9PQ==--81214e9aa7645159c835add4f43b51642d7e7245/t/m9ZxJ-NEafBm1-bjJbXV/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-11 04:34:28',0,NULL,NULL);
INSERT INTO `message` VALUES (18,0,0,0,9,'<0100017038a67701-d4dcb3e6-65fb-464f-9811-e2879164d762-000000@email.amazonses.com>','Academia',NULL,'???? &quot;Comparison of different search engines using validated MS/MS test datasets&quot;','Dear Cadic,\r\nWelcome to your Academia Research Brief! We found 1 papers you might be interested in.\r\n\r\n  Related to &quot;&lt;a href=&quot;https://www.academia.edu/keypass/QWkvOTl6bi9RemZ5eG11ZDBZMSt3ZlpNeXl5dkRVZm00NmtLWHg5dER5MD0tLTNLNDhBZXg4aStpYlR3Rmk5QnNBN0E9PQ==--90a8d3ee1983861b5d59e817cf3c8ae5652d3fda/t/m9ZxJ-NEhfadq-mWip/resource/work/28736832/A_Complete_Step-by-Step_Guide_How_to_Install_Local_SAP_ABAP_Development_System_on_Windows_7_by_Ladislav_Rydzyk_from_ABAP_Academy?email_work_card=interaction_paper&quot;&gt;A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System...&lt;/a&gt;&quot;:\r\n\r\n  Comparison of different search engines using validated MS/MS test datasets\r\n  by: ROD PAUL\r\n  view: https://www.academia.edu/keypass/QWkvOTl6bi9RemZ5eG11ZDBZMSt3ZlpNeXl5dkRVZm00NmtLWHg5dER5MD0tLTNLNDhBZXg4aStpYlR3Rmk5QnNBN0E9PQ==--90a8d3ee1983861b5d59e817cf3c8ae5652d3fda/t/m9ZxJ-NEhfadq-mWip/6179808/Comparison_of_different_search_engines_using_validated_MS_MS_test_datasets\r\n\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/QWkvOTl6bi9RemZ5eG11ZDBZMSt3ZlpNeXl5dkRVZm00NmtLWHg5dER5MD0tLTNLNDhBZXg4aStpYlR3Rmk5QnNBN0E9PQ==--90a8d3ee1983861b5d59e817cf3c8ae5652d3fda/t/m9ZxJ-NEhfadq-mWip/unsubscribe/related_work_suggestions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-12 04:06:39',0,NULL,NULL);
INSERT INTO `message` VALUES (19,0,0,0,10,'<0100017038ed4455-cfac78a3-7cce-4dc1-975c-a024cf67559b-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Galway, Ireland','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Galway, Ireland.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/WG9lbEluSnNVQ3kyZTB1Y1h2ZHVVMlBrQUk0ZmFtQ1I5R3VBWWtkOUVVWT0tLURLNlJ1WUgwVUFNa2kzek9DdFArSUE9PQ==--d4856f62d4b30c370e934ae9b6571552d2a43e35/t/m9ZxJ-NEhCLfC-bsbxUT/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/WG9lbEluSnNVQ3kyZTB1Y1h2ZHVVMlBrQUk0ZmFtQ1I5R3VBWWtkOUVVWT0tLURLNlJ1WUgwVUFNa2kzek9DdFArSUE9PQ==--d4856f62d4b30c370e934ae9b6571552d2a43e35/t/m9ZxJ-NEhCLfC-bsbxUT/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-12 05:23:59',0,NULL,NULL);
INSERT INTO `message` VALUES (20,0,0,0,10,'<010001703e38180b-1802f172-1019-41df-bd98-e14a960deeed-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Agadir, Morocco','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Agadir, Morocco.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/TGcvbzF5b0l5cDBPWmZLZWNxSGdBakp4dzlNVUNQYm40MnBLektNRTUwYz0tLUtPbEt4NjRFOWxnYW8vckdvN09ERlE9PQ==--41eeb047b7b5ac59f4fe6bd8cb65e9c32106a108/t/m9ZxJ-NEpX5gF-0zeRR/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/TGcvbzF5b0l5cDBPWmZLZWNxSGdBakp4dzlNVUNQYm40MnBLektNRTUwYz0tLUtPbEt4NjRFOWxnYW8vckdvN09ERlE9PQ==--41eeb047b7b5ac59f4fe6bd8cb65e9c32106a108/t/m9ZxJ-NEpX5gF-0zeRR/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-13 06:03:49',0,NULL,NULL);
INSERT INTO `message` VALUES (21,0,0,0,10,'<0100017042fdb1e1-2040faaa-d4d4-48e6-9486-a8a7a03a0ae8-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Krakow, Poland','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Krakow, Poland.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ckN2MGJLeWJlWDZZRjcrYmRmL01oUVZRUERUTStydDAzWUR4aUE0d2I3OD0tLWd5V1YrNndDOXdRQ3lITUNwZFpyWWc9PQ==--d77bb189f75aa047d0e6964e321e5069f0a4dd01/t/m9ZxJ-NEwyT5r-hcjDi/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ckN2MGJLeWJlWDZZRjcrYmRmL01oUVZRUERUTStydDAzWUR4aUE0d2I3OD0tLWd5V1YrNndDOXdRQ3lITUNwZFpyWWc9PQ==--d77bb189f75aa047d0e6964e321e5069f0a4dd01/t/m9ZxJ-NEwyT5r-hcjDi/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-14 04:18:08',0,NULL,NULL);
INSERT INTO `message` VALUES (22,0,0,0,10,'<0100017047e8584f-42b0bad6-94fa-4b28-a03e-e908583d894c-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Los Alamitos, United States','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Los Alamitos, United States.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/NzlEUk1jOHR4V3M0UFA2R2hUeFFiYVFGVFNXQlA3VjVGMVFwQkloV1YyWT0tLUhWL2hvMmtlWW81YXA3QitxNGF1WGc9PQ==--fb36fd92bfa621ceaf970a57bbb6ede3773ccebe/t/m9ZxJ-NEDnwpj-bpiTon/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/NzlEUk1jOHR4V3M0UFA2R2hUeFFiYVFGVFNXQlA3VjVGMVFwQkloV1YyWT0tLUhWL2hvMmtlWW81YXA3QitxNGF1WGc9PQ==--fb36fd92bfa621ceaf970a57bbb6ede3773ccebe/t/m9ZxJ-NEDnwpj-bpiTon/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-15 03:12:55',0,NULL,NULL);
INSERT INTO `message` VALUES (23,0,0,0,10,'<010001704d0eb4ce-06810bea-b276-4293-8243-2bde5f4f92ca-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Semarang, Indonesia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Semarang, Indonesia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/enJTV3k0V254b2plcUEvcHNTdysvVnZMV1k5U0RsbHExM1FKZStoUEgxaz0tLU1MTnBrcTV3M0FwcHpDdEo3M1VENnc9PQ==--08ca4ec95b5121ba32a2d6cdfcd0fbe531b4e345/t/m9ZxJ-NELvcUm-YBvuZ/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/enJTV3k0V254b2plcUEvcHNTdysvVnZMV1k5U0RsbHExM1FKZStoUEgxaz0tLU1MTnBrcTV3M0FwcHpDdEo3M1VENnc9PQ==--08ca4ec95b5121ba32a2d6cdfcd0fbe531b4e345/t/m9ZxJ-NELvcUm-YBvuZ/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-16 03:12:55',0,NULL,NULL);
INSERT INTO `message` VALUES (24,0,0,0,10,'<0100017052351899-2bfed757-673e-43dd-88fa-093cec2191ee-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Colombia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C. Tester&rdquo; mentioned in a paper uploaded by someone in Colombia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/QmdtNm5jT0VMSUpmZG1QTjR2cndka01MOTMrU281QTRteWswaUx6ZFhSWT0tLVNyeXNHUGx2REtONnpjWHcvNjRsbVE9PQ==--cd0ea32361ddcaf0b1c12a043dfbac6d5d929b29/t/m9ZxJ-NETCUVM-doZ4r/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/QmdtNm5jT0VMSUpmZG1QTjR2cndka01MOTMrU281QTRteWswaUx6ZFhSWT0tLVNyeXNHUGx2REtONnpjWHcvNjRsbVE9PQ==--cd0ea32361ddcaf0b1c12a043dfbac6d5d929b29/t/m9ZxJ-NETCUVM-doZ4r/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-17 03:12:57',0,NULL,NULL);
INSERT INTO `message` VALUES (25,0,0,0,9,'<01000170565c0de3-172888db-fae5-4667-a275-d9af53acd7ad-000000@email.amazonses.com>','Academia.edu',NULL,'Academics that you may want to follow','Hi Cadic,\r\r\n\r\r\nWe found some academics that you might be interested in following. Following more people helps you build your network and see more content you&rsquo;re interested in.\r\r\n\r\r\n    * Albert  Mills, https://smu-ca.academia.edu/t/m9ZxJ-NEZn5X0-bnDZ56/AlbertMills\r\r\n    * Javier  D&iacute;az Noci, https://upf.academia.edu/t/m9ZxJ-NEZn5X0-bnDZ56/JavierD%C3%ADazNoci\r\r\n    * Ioanna Sapfo  Pepelasis, https://aueb.academia.edu/t/m9ZxJ-NEZn5X0-bnDZ56/IoannaSapfoPepelasis\r\r\n    * Jessica  Ringrose, https://ucl.academia.edu/t/m9ZxJ-NEZn5X0-bnDZ56/JessicaRingrose\r\r\n    * Elchin  Suleymanov, https://science.academia.edu/t/m9ZxJ-NEZn5X0-bnDZ56/Elchin\r\r\n\r\r\nFollow all of them:\r\r\nhttps://www.academia.edu/keypass/ZHFZVzdtTGtjWm43MVdFb3kyTWtnOUdRQzYrN2FmWDRlT1hRNG5lWVcxVT0tLXJMV09ZNGRiYU5JQ0FlK1BTOEtXNWc9PQ==--66f9c099429457cca1126042cf001e7f4baa0253/t/m9ZxJ-NEZn5X0-bnDZ56/followings/follow_multiple?followee_ids=12306%7C35664%7C232320%7C249761%7C1146779&amp;source=followee_suggestion_email\r\r\n\r\r\nThanks,\r\r\nThe Academia.edu Team\r\r\n\r\r\n-----\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-17 22:33:59',0,NULL,NULL);
INSERT INTO `message` VALUES (26,0,0,0,10,'<01000170575b7637-83e5d208-37b9-4613-b8e7-7ce9abebecc7-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Harrisonburg, United States','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Harrisonburg, United States.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/OVhNdTZIUUd6UGxiUWIyOEpmN2hOVUFJUVhCVldrZ2ZDdzNiaFF1Q3pzMD0tLUYxODR0dXBqVTNraUNRNFBjMGtlRHc9PQ==--0fc5e62780fef055fb5a92bc385f2378cbe2b612/t/m9ZxJ-NE0LAuJ-5qiZ1/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/OVhNdTZIUUd6UGxiUWIyOEpmN2hOVUFJUVhCVldrZ2ZDdzNiaFF1Q3pzMD0tLUYxODR0dXBqVTNraUNRNFBjMGtlRHc9PQ==--0fc5e62780fef055fb5a92bc385f2378cbe2b612/t/m9ZxJ-NE0LAuJ-5qiZ1/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-18 03:12:57',0,NULL,NULL);
INSERT INTO `message` VALUES (27,0,0,0,10,'<010001705c821436-459608fd-3147-4595-9451-fecc63f2bdcd-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Melaka, Malaysia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Melaka, Malaysia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/amZiQ3dVNis0c1BUcmNGM3l1R2F4OVY5bFVwUjdCMVBZZXR2Q1BYT0hkMD0tLXRtdU1uaDVlY0ltVGduSXV2U0F1K2c9PQ==--0157b04e9be5add881d0acaf2272e6588544c197/t/m9ZxJ-NE7UmPk-rhERj/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/amZiQ3dVNis0c1BUcmNGM3l1R2F4OVY5bFVwUjdCMVBZZXR2Q1BYT0hkMD0tLXRtdU1uaDVlY0ltVGduSXV2U0F1K2c9PQ==--0157b04e9be5add881d0acaf2272e6588544c197/t/m9ZxJ-NE7UmPk-rhERj/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-19 03:13:14',0,NULL,NULL);
INSERT INTO `message` VALUES (28,0,0,0,5,'<D1gJ8FwcvWYe-giJ6XQb-Q.0@notifications.google.com>','Google',NULL,'Alerta de seguridad cr&iacute;tica','[image: Google]\r\nSe bloque&oacute; un intento de acceso a tu cuenta\r\n\r\n\r\ncadic.tester@gmail.com\r\nOtra persona us&oacute; tu contrase&ntilde;a recientemente para intentar acceder a tu\r\ncuenta desde una app que no es de Google. Evitamos el acceso, pero debes\r\nver qu&eacute; sucedi&oacute;. Revisa la actividad de tu cuenta para asegurarte de que\r\nnadie m&aacute;s tenga acceso.\r\nVer actividad\r\n&lt;https://accounts.google.com/AccountChooser?Email=cadic.tester@gmail.com&amp;continue=https://myaccount.google.com/alert/nt/1582145076000?rfn%3D27%26rfnc%3D1%26eid%3D-7126769064908575767%26et%3D0&gt;\r\nTe enviamos este correo electr&oacute;nico para notificarte acerca de cambios\r\nimportantes en tu cuenta y en los servicios de Google.\r\n&copy; 2020 Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA\n\n',1,'2020-02-19 15:44:37',0,NULL,NULL);
INSERT INTO `message` VALUES (29,0,0,0,10,'<0100017061a84298-876bfaec-3d77-4767-88ca-1b6194bf1045-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Jakarta, Indonesia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Jakarta, Indonesia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/aGdUallEMEdkN2JnZlM5ZWZyNUNSUTdwNkxHbGdKREFIbUR6T0NiM2g5Zz0tLU8vZUpNMzlzaUlKZzJGSDNNaVJOenc9PQ==--0fc9a60e5e6f1dc95bd40aff37e63e761d0a5476/t/m9ZxJ-NFe1ZUE-qLsYM/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/aGdUallEMEdkN2JnZlM5ZWZyNUNSUTdwNkxHbGdKREFIbUR6T0NiM2g5Zz0tLU8vZUpNMzlzaUlKZzJGSDNNaVJOenc9PQ==--0fc9a60e5e6f1dc95bd40aff37e63e761d0a5476/t/m9ZxJ-NFe1ZUE-qLsYM/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-20 03:13:02',0,NULL,NULL);
INSERT INTO `message` VALUES (30,0,0,0,10,'<0100017066d285d4-c8ea7a56-9a63-4447-a74d-bd504f5b899f-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Ho Chi Minh City, Vietnam','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Ho Chi Minh City, Vietnam.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/dVRnUFBiZlplQXhaV1l4eUxKMUh4VWQxUTVBek5TU1FkakVaeVBxaXcvVT0tLVdzVm9BcGFzd044M1pEcEtzOVcrMlE9PQ==--c62298a6008cf47baeb38f98787028834d2d982e/t/m9ZxJ-NFnaVQY-ENA1o/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/dVRnUFBiZlplQXhaV1l4eUxKMUh4VWQxUTVBek5TU1FkakVaeVBxaXcvVT0tLVdzVm9BcGFzd044M1pEcEtzOVcrMlE9PQ==--c62298a6008cf47baeb38f98787028834d2d982e/t/m9ZxJ-NFnaVQY-ENA1o/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-21 03:17:18',0,NULL,NULL);
INSERT INTO `message` VALUES (31,0,0,0,11,'<ce7a53b899c1880dae69d7f255f3c7dd65d61588-20109816-110698726@google.com>','Google',NULL,'M&aacute;s informaci&oacute;n sobre nuestras Condiciones del Servicio actualizadas','Estamos mejorando las Condiciones del Servicio y buscamos facilitar tu  \r\ncomprensi&oacute;n de las mismas. Los cambios entrar&aacute;n en vigor el 31 de marzo del  \r\n2020 y no afectar&aacute;n la forma en que usas los servicios de Google.\r\n\r\nSi deseas obtener m&aacute;s detalles, te proporcionamos un resumen de los cambios  \r\nclave  \r\n&lt;https://accounts.google.com/AccountChooser?Email=cadic.tester@gmail.com&amp;continue=https%3A%2F%2Fpolicies.google.com%2Fterms%2Fchanges%3Futm_source%3Dtos-email%26utm_medium%3Demail&gt;  \r\ny las preguntas frecuentes  \r\n&lt;https://accounts.google.com/AccountChooser?Email=cadic.tester@gmail.com&amp;continue=https%3A%2F%2Fpolicies.google.com%2Fterms%2Fchanges%3Futm_source%3Dtos-email%26utm_medium%3Demail%23faq&gt;.  \r\nA continuaci&oacute;n, te ofrecemos un resumen de lo que implica esta  \r\nactualizaci&oacute;n para ti:\r\n\r\n- Se mejor&oacute; la visibilidad: Nuestras Condiciones siguen siendo un documento  \r\nlegal, pero nos esforzamos para facilitar tu comprensi&oacute;n con el uso de  \r\ndefiniciones y v&iacute;nculos a informaci&oacute;n &uacute;til.\r\n\r\n- Se mejor&oacute; la comunicaci&oacute;n: Explicamos con claridad cu&aacute;ndo realizamos  \r\ncambios en nuestros servicios (como agregar o quitar una funci&oacute;n) y cu&aacute;ndo  \r\nrestringimos o cancelamos el acceso de un usuario. Adem&aacute;s, seguiremos  \r\ntrabajando para notificarte cuando un cambio afecte tu experiencia con  \r\nnuestros servicios.\r\n\r\n- Agregamos Google Chrome, el Sistema operativo Google Chrome y Google  \r\nDrive en las Condiciones: Nuestras Condiciones mejoradas ahora contemplan  \r\nGoogle Chrome, el Sistema operativo Google Chrome y Google Drive, que  \r\ntambi&eacute;n tienen condiciones y pol&iacute;ticas espec&iacute;ficas de cada servicio, por lo  \r\nque podr&aacute;s comprender sus aspectos particulares.\r\n\r\n- No se modific&oacute; nuestra Pol&iacute;tica de Privacidad: No modificamos la Pol&iacute;tica  \r\nde Privacidad de Google  \r\n&lt;https://accounts.google.com/AccountChooser?Email=cadic.tester@gmail.com&amp;continue=https%3A%2F%2Fpolicies.google.com%2Fprivacy%3Futm_source%3Dtos-email%26utm_medium%3Demail&gt;  \r\nni la manera en que tratamos tu informaci&oacute;n. Recuerda que, en tu Cuenta de  \r\nGoogle &lt;https://myaccount.google.com&gt; puedes revisar la configuraci&oacute;n de  \r\nprivacidad y administrar la manera en la que se usan los datos, en  \r\ncualquier momento.\r\n\r\nSi eres tutor de un ni&ntilde;o con una edad inferior a la requerida para  \r\nadministrar su propia Cuenta de Google  \r\n&lt;https://support.google.com/accounts/answer/1350409&gt; y usas Family Link  \r\n&lt;https://families.google.com/familylink/&gt; para administrar su uso de los  \r\nservicios de Google, dedica un momento para hablar sobre estos cambios con  \r\nel ni&ntilde;o.\r\n\r\nPor supuesto, si no aceptas nuestras nuevas Condiciones y lo que esperamos  \r\nde ambas partes cuando usas nuestros servicios, obt&eacute;n m&agrave;s informaci&oacute;n sobre  \r\ntus opciones en nuestras Preguntas frecuentes  \r\n&lt;https://accounts.google.com/AccountChooser?Email=cadic.tester@gmail.com&amp;continue=https%3A%2F%2Fpolicies.google.com%2Fterms%2Fchanges%3Futm_source%3Dtos-email%26utm_medium%3Demail%23faq&gt;.\r\n\r\nGracias por usar los servicios de Google.\r\n\r\nTu equipo de Google\r\n\r\n(c) 2020 Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA, 94043\r\n\r\nTe enviamos este correo electr&oacute;nico para comunicarte los cambios  \r\nimportantes que implementamos en las Condiciones del Servicio de Google.\n\n',1,'2020-02-21 08:33:19',0,NULL,NULL);
INSERT INTO `message` VALUES (32,0,0,0,10,'<010001706991efc0-a282d5c9-374b-4799-9164-5915fa5d423c-000000@email.amazonses.com>','Academia.edu',NULL,'A paper published by a member of the Computer Science department at Universidade Federal de Uberl&acirc;ndia mentions the name &quot;C. Tester&quot;','Dear Cadic,\r\r\n\r\r\nA paper published by a member of the Computer Science department at Universidade Federal de Uberl&acirc;ndia mentions the name &quot;C. Tester&quot;.\r\r\n\r\r\nFollow the link below to see your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/K0ZSVVdpTzZ0bWNCeGN4MzRYVjJxLzhVRHp4SkhqYm9sbW56ejc3RDdlWT0tLUs5SWIvUlBFRUIxbk85a1pJZWdQVWc9PQ==--55260a749170e11778305a0f167db6252ee93fa4/t/m9ZxJ-NFqZnPo-31LsV/upgrade?feature=searchm&amp;trigger=mentions_drip_dept_univ\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/K0ZSVVdpTzZ0bWNCeGN4MzRYVjJxLzhVRHp4SkhqYm9sbW56ejc3RDdlWT0tLUs5SWIvUlBFRUIxbk85a1pJZWdQVWc9PQ==--55260a749170e11778305a0f167db6252ee93fa4/t/m9ZxJ-NFqZnPo-31LsV/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-21 16:05:37',0,NULL,NULL);
INSERT INTO `message` VALUES (33,0,0,0,10,'<010001706c0524de-b382e7d7-0985-47a3-8e9d-36e0b4c83f32-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Research, Australia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Research, Australia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/b2M5azlDdWFFSXN0Q0lndmcrcGZtYmJnZDBSdUtKdFVXV0VYbGxOZkFhRT0tLVdtUGZpcTdxcHVUM1hIQVA1Wlc1V3c9PQ==--130944a75383acf03a2662a93ff01b6e6b27fbc8/t/m9ZxJ-NFunv6m-bevs0J/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/b2M5azlDdWFFSXN0Q0lndmcrcGZtYmJnZDBSdUtKdFVXV0VYbGxOZkFhRT0tLVdtUGZpcTdxcHVUM1hIQVA1Wlc1V3c9PQ==--130944a75383acf03a2662a93ff01b6e6b27fbc8/t/m9ZxJ-NFunv6m-bevs0J/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-22 03:30:42',0,NULL,NULL);
INSERT INTO `message` VALUES (34,0,0,0,9,'<010001706c15fbf7-ac66ed32-844c-4825-b5c2-089a61373fd1-000000@email.amazonses.com>','Academia',NULL,'Try Again - &quot;A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System...&quot; is waiting for you to finish it','Dear Cadic,\r\nWelcome to your Academia Research Brief! We found 1 papers you might be interested in.\r\n\r\n  You started reading the paper &lt;a href=&quot;http://www.academia.edu/keypass/SXNORnJmMW9URHU3Qm5BdHhZWXB3R0RLZEk4N3BSYjE2NHZXTmlUZWt5dz0tLUpoNWptYUdTc3VjUW5tOU4yck9JWWc9PQ==--35cd57671f519acedb686287d867714177095e8b/t//resource/work/28736832?email_work_card=interaction_paper&quot;&gt;A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System...&lt;/a&gt;. Want to continue it?\r\n\r\n  A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System on Windows 7 by Ladislav Rydzyk from ABAP Academy\r\n  by: TANISH GUPTA\r\n  view: https://www.academia.edu/keypass/aTVLN1J2NSt4aUVobUFJLysvTGtwMEcvbmN6ekFzcnQ3eU5RWENiWXdLST0tLXNwblRPRmNsVmtOU0xicEpmUTVoUWc9PQ==--b312dea8bc6fea6250a998c59fbb1fdddc5489e4/t/m9ZxJ-NFusT7j-r8xFb/28736832/A_Complete_Step-by-Step_Guide_How_to_Install_Local_SAP_ABAP_Development_System_on_Windows_7_by_Ladislav_Rydzyk_from_ABAP_Academy\r\n\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/aTVLN1J2NSt4aUVobUFJLysvTGtwMEcvbmN6ekFzcnQ3eU5RWENiWXdLST0tLXNwblRPRmNsVmtOU0xicEpmUTVoUWc9PQ==--b312dea8bc6fea6250a998c59fbb1fdddc5489e4/t/m9ZxJ-NFusT7j-r8xFb/unsubscribe/related_work_suggestions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-22 03:49:06',0,NULL,NULL);
INSERT INTO `message` VALUES (35,0,0,0,10,'<01000170712da1f5-3360619c-0969-4837-9c68-e994959d8f33-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Tunisia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Tunisia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/WDhJbHpIMFliS29lR21DRitKTURTNUJBRHJqQUJuUDNVZ0V4ZkphNWJtbz0tLUR5R3NWRitidFdYUHRWNzRWZjY3VVE9PQ==--38e4aaffbc8be25b01daed3e7dd90a3e1a5fc55e/t/m9ZxJ-NFBvTDc-yrf0g/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/WDhJbHpIMFliS29lR21DRitKTURTNUJBRHJqQUJuUDNVZ0V4ZkphNWJtbz0tLUR5R3NWRitidFdYUHRWNzRWZjY3VVE9PQ==--38e4aaffbc8be25b01daed3e7dd90a3e1a5fc55e/t/m9ZxJ-NFBvTDc-yrf0g/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-23 03:33:01',0,NULL,NULL);
INSERT INTO `message` VALUES (36,0,0,0,10,'<010001707656dafb-cbba4015-ca7c-4c36-976a-dbec43f10026-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Ethiopia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Ethiopia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/bm5SZFBqM0t4djQvOEs5Q3A3RjZKdTREVGZkZ2ZkazdaZENRN3hVajJ4ND0tLVRhNzh3K0s2cGV2cXh5QUplSG5OS2c9PQ==--0ce94ef1d7d1af0dfbfcdbb018cf8c8ad2aed6cc/t/m9ZxJ-NFJEt2R-Yqtaz/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/bm5SZFBqM0t4djQvOEs5Q3A3RjZKdTREVGZkZ2ZkazdaZENRN3hVajJ4ND0tLVRhNzh3K0s2cGV2cXh5QUplSG5OS2c9PQ==--0ce94ef1d7d1af0dfbfcdbb018cf8c8ad2aed6cc/t/m9ZxJ-NFJEt2R-Yqtaz/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-24 03:36:09',0,NULL,NULL);
INSERT INTO `message` VALUES (37,0,0,0,10,'<010001707b7ac06e-0f7f5b1b-a83e-43cb-8695-32f2d267403f-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Djelfa, Algeria','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Djelfa, Algeria.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VGNsYk1YUGZGbktCaTVXQ2ZCbERRU2dmUHo5bE5wbko4Rk9GdVFReVNyRT0tLWtzOUkxTnJhOG50ZythaXpDQjQ0K0E9PQ==--3503f5506b69332e08e1f9d854ce7f68047f5b89/t/m9ZxJ-NFRMnFa-DKNAn/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VGNsYk1YUGZGbktCaTVXQ2ZCbERRU2dmUHo5bE5wbko4Rk9GdVFReVNyRT0tLWtzOUkxTnJhOG50ZythaXpDQjQ0K0E9PQ==--3503f5506b69332e08e1f9d854ce7f68047f5b89/t/m9ZxJ-NFRMnFa-DKNAn/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-25 03:33:27',0,NULL,NULL);
INSERT INTO `message` VALUES (38,0,0,0,9,'<010001707b895a04-cee4ebdf-1cd5-4951-9531-cb20353f5336-000000@email.amazonses.com>','Academia',NULL,'Try Again - &quot;A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System...&quot; is waiting for you to finish it','Dear Cadic,\r\nWelcome to your Academia Research Brief! We found 1 papers you might be interested in.\r\n\r\n  You started reading the paper &lt;a href=&quot;http://www.academia.edu/keypass/bSsyQmpoY1JIcVdQelY2Wk9qamxjSU50TVZ0dW1GdU1CWkk4Nm5VR1Nlcz0tLTlNS0VVOTk5SzMzS045Ym9PWFE0MWc9PQ==--bc1d68464900c99529b9a16c384146b27e50d469/t//resource/work/28736832?email_work_card=interaction_paper&quot;&gt;A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System...&lt;/a&gt;. Want to continue it?\r\n\r\n  A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System on Windows 7 by Ladislav Rydzyk from ABAP Academy\r\n  by: TANISH GUPTA\r\n  view: https://www.academia.edu/keypass/bXBqRVZTbEdYRXRMRVBmeHRNdkszdEZMR2tlcDRVajhSZWN5cGI5Y1JtYz0tLWlzVFg5U0R2U2pESExPdjhGWUdnT0E9PQ==--65bf86d0d1a9076636b20932cc41b77ce6614f24/t/m9ZxJ-NFRR2U0-bdMugA/28736832/A_Complete_Step-by-Step_Guide_How_to_Install_Local_SAP_ABAP_Development_System_on_Windows_7_by_Ladislav_Rydzyk_from_ABAP_Academy\r\n\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/bXBqRVZTbEdYRXRMRVBmeHRNdkszdEZMR2tlcDRVajhSZWN5cGI5Y1JtYz0tLWlzVFg5U0R2U2pESExPdjhGWUdnT0E9PQ==--65bf86d0d1a9076636b20932cc41b77ce6614f24/t/m9ZxJ-NFRR2U0-bdMugA/unsubscribe/related_work_suggestions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-25 03:49:25',0,NULL,NULL);
INSERT INTO `message` VALUES (39,0,0,0,10,'<010001707e44a83a-e78e0972-1fed-4366-9ca4-00ec670fd469-000000@email.amazonses.com>','Academia.edu',NULL,'Download the 15 Most Cited Computer Science PDFs','Dear Cadic Tester,\r\n\r\nYou read the paper &quot;A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System on Windows 7 by Ladislav Rydzyk from ABAP Academy.&quot; Get 15 Papers, including 4 Papers uploaded by Faculty at Top 50 Universitie in the related topic Computer Science.\r\n\r\nView list: https://www.academia.edu/keypass/OGRNaHo5ZWxSaEpaa3ByWFNxc3RSSDdTL1BCQW8vaStpTWdqMXpobmxOMD0tLVpyOFRpb0RNdEhpTkJScjBGS0d3NWc9PQ==--95db05a06fa5af4482911a175d9eeed5417b5442/t/m9ZxJ-NFVDbAY-cUSV1/upgrade?feature=curated_lists&amp;list_title=The+Most+Cited+Papers+on+Computer+Science&amp;trigger=curated-lists-reading-drip&amp;upgrade_redirect=https%3A%2F%2Fwww.academia.edu%2Ft%2Fm9ZxJ-NFVDbAY-cUSV1%2Flists%2F3484\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/OGRNaHo5ZWxSaEpaa3ByWFNxc3RSSDdTL1BCQW8vaStpTWdqMXpobmxOMD0tLVpyOFRpb0RNdEhpTkJScjBGS0d3NWc9PQ==--95db05a06fa5af4482911a175d9eeed5417b5442/t/m9ZxJ-NFVDbAY-cUSV1/unsubscribe/premium_content\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-25 16:33:14',0,NULL,NULL);
INSERT INTO `message` VALUES (40,0,0,0,9,'<0100017080a8d0ee-d817bf2a-6ed3-45e9-8dfa-760511a44d56-000000@email.amazonses.com>','Academia',NULL,'Try Again - &quot;A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System...&quot; is waiting for you to finish it','Dear Cadic,\r\nWelcome to your Academia Research Brief! We found 1 papers you might be interested in.\r\n\r\n  You started reading the paper &lt;a href=&quot;http://www.academia.edu/keypass/c0xOeldpN2RyemlkREx0WmVEcHdvK3d2Sk9vMEFDMDR2VG9TSmhRR1h5cz0tLXZ3cEZiUzQ3L2VQQVQwWmdMSEdYeHc9PQ==--0e9b30cc3b9e08cb62f70cd6c1a0977170e0fa6f/t//resource/work/28736832?email_work_card=interaction_paper&quot;&gt;A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System...&lt;/a&gt;. Want to continue it?\r\n\r\n  A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System on Windows 7 by Ladislav Rydzyk from ABAP Academy\r\n  by: TANISH GUPTA\r\n  view: https://www.academia.edu/keypass/QW5wV3JQR2E3MStKN0Y3WUxSRVdma1RCb0xacjRIWXJONW9mU2lVUWZHST0tLW5Kdm9oRThnMlBjR3lWa01PU2o5MFE9PQ==--783a2cfec655a389c6a0afff4350d7951d9b4614/t/m9ZxJ-NFYXwB2-THDYF/28736832/A_Complete_Step-by-Step_Guide_How_to_Install_Local_SAP_ABAP_Development_System_on_Windows_7_by_Ladislav_Rydzyk_from_ABAP_Academy\r\n\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/QW5wV3JQR2E3MStKN0Y3WUxSRVdma1RCb0xacjRIWXJONW9mU2lVUWZHST0tLW5Kdm9oRThnMlBjR3lWa01PU2o5MFE9PQ==--783a2cfec655a389c6a0afff4350d7951d9b4614/t/m9ZxJ-NFYXwB2-THDYF/unsubscribe/related_work_suggestions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-26 03:41:52',0,NULL,NULL);
INSERT INTO `message` VALUES (41,0,0,0,10,'<0100017080a9c6f5-7d6a3068-de72-4e45-b36c-587e636b0030-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Bursa, Turkey','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Bursa, Turkey.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/UUd5eS90b240dHE2WmswRDJkZGpsRzV5K25NR09td281Tmh4T1NXTVR1MD0tLWNmTThhTFl3TEM1bFFxUkpjQ3BQZlE9PQ==--d622f015c8424d9e2f9afefc22483cdbe1a16534/t/m9ZxJ-NFYXQrm-bjpvof/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/UUd5eS90b240dHE2WmswRDJkZGpsRzV5K25NR09td281Tmh4T1NXTVR1MD0tLWNmTThhTFl3TEM1bFFxUkpjQ3BQZlE9PQ==--d622f015c8424d9e2f9afefc22483cdbe1a16534/t/m9ZxJ-NFYXQrm-bjpvof/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-26 03:42:55',0,NULL,NULL);
INSERT INTO `message` VALUES (42,0,0,0,9,'<0100017085cfe720-5ec73ad1-88d3-431c-9ab0-875b98585019-000000@email.amazonses.com>','Academia',NULL,'Try Again - &quot;A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System...&quot; is waiting for you to finish it','Dear Cadic,\r\nWelcome to your Academia Research Brief! We found 1 papers you might be interested in.\r\n\r\n  You started reading the paper &lt;a href=&quot;http://www.academia.edu/keypass/aGV0SGttZU05enFwQ1RjWUJYN3Y1WlJ5cGk5ZEllREJ4V0I4TVVyblBtRT0tLVFyRjZiSXRSQ0tJbE5WczNJdW9oSlE9PQ==--52af5c1221369fe0dad492fc9266a3b302ce35ce/t/m9ZxJ-NF55rFr-bjw03i/resource/work/28736832?email_work_card=interaction_paper&quot;&gt;A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System...&lt;/a&gt;. Want to continue it?\r\n\r\n  A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System on Windows 7 by Ladislav Rydzyk from ABAP Academy\r\n  by: TANISH GUPTA\r\n  view: https://www.academia.edu/keypass/Z1NIV2c4ZlRUR29QMDdqZXd0TWh1NVgyWWhOUUdFVG96YVhhbUpibWp1Zz0tLVRTUm5oWmk3SCtpdWFMeFA0alB3UEE9PQ==--1afa18a0ae71debf02dd9280aa7f17d55b9c50f5/t/m9ZxJ-NF55rFr-bjw03i/28736832/A_Complete_Step-by-Step_Guide_How_to_Install_Local_SAP_ABAP_Development_System_on_Windows_7_by_Ladislav_Rydzyk_from_ABAP_Academy\r\n\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/Z1NIV2c4ZlRUR29QMDdqZXd0TWh1NVgyWWhOUUdFVG96YVhhbUpibWp1Zz0tLVRTUm5oWmk3SCtpdWFMeFA0alB3UEE9PQ==--1afa18a0ae71debf02dd9280aa7f17d55b9c50f5/t/m9ZxJ-NF55rFr-bjw03i/unsubscribe/related_work_suggestions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-27 03:42:40',0,NULL,NULL);
INSERT INTO `message` VALUES (43,0,0,0,10,'<010001708863eddb-992c4eaf-54cc-4c63-b2d2-ce1b39a10e6d-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Casablanca, Morocco','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Casablanca, Morocco.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/czVyNW9wODlVRTRUYVBkMTF0VHBvR0lCbjdJT3h3RTV3OUtldlYrU2MyVT0tLTFxZjR3aEo2WTg4RUhVWFE4Y01wNHc9PQ==--293faa3bc513081b6bf6c30d8ab6cfac7ad9a4ab/t/m9ZxJ-NF9D3Uh-JLcpK/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/czVyNW9wODlVRTRUYVBkMTF0VHBvR0lCbjdJT3h3RTV3OUtldlYrU2MyVT0tLTFxZjR3aEo2WTg4RUhVWFE4Y01wNHc9PQ==--293faa3bc513081b6bf6c30d8ab6cfac7ad9a4ab/t/m9ZxJ-NF9D3Uh-JLcpK/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-27 15:43:36',0,NULL,NULL);
INSERT INTO `message` VALUES (44,0,0,0,10,'<010001708af38ac1-e6e48e4c-6b8a-4c36-8061-a6c97a2cad04-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Sydney, Australia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C. Tester&rdquo; mentioned in a paper uploaded by someone in Sydney, Australia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/T3h6OCswRGJ3K21WdnpCOHhKZmxSb2pmVmo1eU5LNlZ4b3BtdUMwZUFHMD0tLW5YUzJEdzJMeXluRXViQkErY0x1K0E9PQ==--b10288cb1d1ffdd3b5edd0ae0e19a701c1e4571f/t/m9ZxJ-NGdcfQb-G7oKH/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/T3h6OCswRGJ3K21WdnpCOHhKZmxSb2pmVmo1eU5LNlZ4b3BtdUMwZUFHMD0tLW5YUzJEdzJMeXluRXViQkErY0x1K0E9PQ==--b10288cb1d1ffdd3b5edd0ae0e19a701c1e4571f/t/m9ZxJ-NGdcfQb-G7oKH/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-28 03:39:42',0,NULL,NULL);
INSERT INTO `message` VALUES (45,0,0,0,9,'<010001708aff5bce-6f9c7bff-ac0d-4e83-b560-38db57b401cb-000000@email.amazonses.com>','Academia',NULL,'Try Again - &quot;A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System...&quot; is waiting for you to finish it','Dear Cadic,\r\nWelcome to your Academia Research Brief! We found 1 papers you might be interested in.\r\n\r\n  You started reading the paper &lt;a href=&quot;http://www.academia.edu/keypass/L1lHVDlBa21RRDdIUVE4STJWSmpRWTJOUGliL3EvM05ocDJBdnRZb3N0RT0tLWRuNlVHTUpoVVIwWkY5TWI2djlhc0E9PQ==--67b292147424dfb5a166b5c3498559bf2cbc5fc7/t/m9ZxJ-NGdf2sJ-ijvNB/resource/work/28736832?email_work_card=interaction_paper&quot;&gt;A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System...&lt;/a&gt;. Want to continue it?\r\n\r\n  A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System on Windows 7 by Ladislav Rydzyk from ABAP Academy\r\n  by: TANISH GUPTA\r\n  view: https://www.academia.edu/keypass/WlVpSDkvRmpSLzJGdXB2akY3QzZyMkJSeXpjUjJWTFZiT2xwTE43SFI5RT0tLTd2ZWlPV0xTRmlPNjZoeitNeDFhRXc9PQ==--cd98c6ef83205e751feebfd4e39a934849ad2f2c/t/m9ZxJ-NGdf2sJ-ijvNB/28736832/A_Complete_Step-by-Step_Guide_How_to_Install_Local_SAP_ABAP_Development_System_on_Windows_7_by_Ladislav_Rydzyk_from_ABAP_Academy\r\n\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/WlVpSDkvRmpSLzJGdXB2akY3QzZyMkJSeXpjUjJWTFZiT2xwTE43SFI5RT0tLTd2ZWlPV0xTRmlPNjZoeitNeDFhRXc9PQ==--cd98c6ef83205e751feebfd4e39a934849ad2f2c/t/m9ZxJ-NGdf2sJ-ijvNB/unsubscribe/related_work_suggestions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-28 03:52:36',0,NULL,NULL);
INSERT INTO `message` VALUES (46,0,0,0,9,'<01000170901cf745-2cb5f626-f66c-4f27-b373-5673f6b0be5d-000000@email.amazonses.com>','Academia',NULL,'Try Again - &quot;A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System...&quot; is waiting for you to finish it','Dear Cadic,\r\nWelcome to your Academia Research Brief! We found 1 papers you might be interested in.\r\n\r\n  You started reading the paper &lt;a href=&quot;http://www.academia.edu/keypass/bDNmMEQ2bUFEc294UTI3dTZybFlZbXZraVJ2S0p4ajNDMmoyTlZJMjYxND0tLTZUU1dwb0tkNHVhYUYwNHlIRk5UQUE9PQ==--56fdbc072f02ef9712d596b3ffef9a32ffcfbca5/t/m9ZxJ-NGkkVUm-yr94o/resource/work/28736832?email_work_card=interaction_paper&quot;&gt;A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System...&lt;/a&gt;. Want to continue it?\r\n\r\n  A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System on Windows 7 by Ladislav Rydzyk from ABAP Academy\r\n  by: TANISH GUPTA\r\n  view: https://www.academia.edu/keypass/Q0hPR0VkZ0dkM3hNeHhHTzdYMGJSQ281VDB2RWhqbFF3ZjBOYi85c2RDUT0tLUlYUVM4cmE5Z2QrVndta0xTclZaQUE9PQ==--48113871e187af1a4f9f2f2d96fb0fa1d008458d/t/m9ZxJ-NGkkVUm-yr94o/28736832/A_Complete_Step-by-Step_Guide_How_to_Install_Local_SAP_ABAP_Development_System_on_Windows_7_by_Ladislav_Rydzyk_from_ABAP_Academy\r\n\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/Q0hPR0VkZ0dkM3hNeHhHTzdYMGJSQ281VDB2RWhqbFF3ZjBOYi85c2RDUT0tLUlYUVM4cmE5Z2QrVndta0xTclZaQUE9PQ==--48113871e187af1a4f9f2f2d96fb0fa1d008458d/t/m9ZxJ-NGkkVUm-yr94o/unsubscribe/related_work_suggestions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-29 03:43:03',0,NULL,NULL);
INSERT INTO `message` VALUES (47,0,0,0,10,'<01000170901d13f4-90b354ec-6a0c-46d1-8a9b-7aaadc2fbc7d-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Ho Chi Minh City, Vietnam','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C. Tester&rdquo; mentioned in a paper uploaded by someone in Ho Chi Minh City, Vietnam.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/dXloUnZ1N2xTamwrNnh6aXd2R3N5WWhKblhvaTdyMnN5Ty9OWW5ZWWJnYz0tLVhudmNyNmlYMkJMcktmbHBNYXZ1UGc9PQ==--ea4c29535b12e06318f326ceebfaf08fe8fe46b9/t/m9ZxJ-NGkkXZz-m3v6G/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/dXloUnZ1N2xTamwrNnh6aXd2R3N5WWhKblhvaTdyMnN5Ty9OWW5ZWWJnYz0tLVhudmNyNmlYMkJMcktmbHBNYXZ1UGc9PQ==--ea4c29535b12e06318f326ceebfaf08fe8fe46b9/t/m9ZxJ-NGkkXZz-m3v6G/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-02-29 03:43:10',0,NULL,NULL);
INSERT INTO `message` VALUES (48,0,0,0,9,'<01000170954245eb-370530cd-ad14-4328-b539-c5a485d2a47c-000000@email.amazonses.com>','Academia',NULL,'Try Again - &quot;A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System...&quot; is waiting for you to finish it','Dear Cadic,\r\nWelcome to your Academia Research Brief! We found 1 papers you might be interested in.\r\n\r\n  You started reading the paper &lt;a href=&quot;http://www.academia.edu/keypass/MTcrck5OSkFjb3Zqb1c1VkxkTUtsTHFPS21SOGhXSGI2RnhwSDQvOWNLUT0tLVBPRVdkM3Q5K2hYSk5MVEhzbExSNlE9PQ==--a0c5a8085905c5130ee02a515e802cad15af2243/t/m9ZxJ-NGstgKy-bgW6vZ/resource/work/28736832?email_work_card=interaction_paper&quot;&gt;A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System...&lt;/a&gt;. Want to continue it?\r\n\r\n  A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System on Windows 7 by Ladislav Rydzyk from ABAP Academy\r\n  by: TANISH GUPTA\r\n  view: https://www.academia.edu/keypass/VnhGelI4YzA4UXIwOFkrcU91Y2dWQXBYMFVqQ1lQYm8zVG1LMms3cmRLVT0tLXJqZ0ViYkU4b3g4SU96V1h0SFVHMlE9PQ==--595987181ee555e2a1002be78949ccb151d39a08/t/m9ZxJ-NGstgKy-bgW6vZ/28736832/A_Complete_Step-by-Step_Guide_How_to_Install_Local_SAP_ABAP_Development_System_on_Windows_7_by_Ladislav_Rydzyk_from_ABAP_Academy\r\n\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/VnhGelI4YzA4UXIwOFkrcU91Y2dWQXBYMFVqQ1lQYm8zVG1LMms3cmRLVT0tLXJqZ0ViYkU4b3g4SU96V1h0SFVHMlE9PQ==--595987181ee555e2a1002be78949ccb151d39a08/t/m9ZxJ-NGstgKy-bgW6vZ/unsubscribe/related_work_suggestions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-01 03:41:54',0,NULL,NULL);
INSERT INTO `message` VALUES (49,0,0,0,10,'<0100017095431f34-2502d4c2-8de2-4b2a-8617-c5c7b3f4524a-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Savski Venac, Serbia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Savski Venac, Serbia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/V1dueU9VK1NONVlheFBVZGlsZUtabmhxZ0xveDE0aDBFK2l3UHJSajV5MD0tLWFYNHpXY1J4TFVHVVlkRTV2RTlXNVE9PQ==--2332cddb78a150942a4b477915a17bd3d40395c6/t/m9ZxJ-NGstxDR-UWrBA/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/V1dueU9VK1NONVlheFBVZGlsZUtabmhxZ0xveDE0aDBFK2l3UHJSajV5MD0tLWFYNHpXY1J4TFVHVVlkRTV2RTlXNVE9PQ==--2332cddb78a150942a4b477915a17bd3d40395c6/t/m9ZxJ-NGstxDR-UWrBA/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-01 03:42:49',0,NULL,NULL);
INSERT INTO `message` VALUES (50,0,0,0,10,'<010001709a6cd0d6-a7d1bf2d-398c-4ada-aec5-25f813090b2c-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Turin, Italy','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Turin, Italy.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/d0xOcG5aYWJlcGt6Y1RLczJubFVkb04xS3pQTWgrZjcyakJud1BUeUpHcz0tLTBaWHBIOUxNNFRLQVJiRVpQVHByakE9PQ==--d27b73216095098aba036acb702ea295417046ce/t/m9ZxJ-NGzChLc-bh5bhw/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/d0xOcG5aYWJlcGt6Y1RLczJubFVkb04xS3pQTWgrZjcyakJud1BUeUpHcz0tLTBaWHBIOUxNNFRLQVJiRVpQVHByakE9PQ==--d27b73216095098aba036acb702ea295417046ce/t/m9ZxJ-NGzChLc-bh5bhw/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-02 03:46:27',0,NULL,NULL);
INSERT INTO `message` VALUES (51,0,0,0,10,'<010001709d7fdd7c-a65d6ea7-9c04-45c3-8211-e5f84c0e566a-000000@email.amazonses.com>','Academia.edu',NULL,'The name &quot;C. Tester&quot; is mentioned by a well-known author on Academia','Dear cadic,\r\n\r\nThe name &quot;C. Tester&quot; is mentioned by a well-known author on Academia.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/aGtYWHJPa1kvczUxUk9KN0s5dkNRdXJ0NEV0SmVUR0hkZkpoenFNVFVxWT0tLUNoRWl1SEpLUzVWL2pHVTlOcmM5dkE9PQ==--77b2b3615e0c9d206e900f81fa6b4129ed57e0da/t/m9ZxJ-NGDTrmY-LrYh7/upgrade?feature=name_mentions&amp;trigger=well-known-author\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/aGtYWHJPa1kvczUxUk9KN0s5dkNRdXJ0NEV0SmVUR0hkZkpoenFNVFVxWT0tLUNoRWl1SEpLUzVWL2pHVTlOcmM5dkE9PQ==--77b2b3615e0c9d206e900f81fa6b4129ed57e0da/t/m9ZxJ-NGDTrmY-LrYh7/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-02 18:06:08',0,NULL,NULL);
INSERT INTO `message` VALUES (52,0,0,0,10,'<010001709f8fdc0b-2d2ef7a4-f607-490d-820b-bdf07cb7c9b6-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Colombia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Colombia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/WTVpZzdQNm5PTTh5bVpFZkZNL05QcmRNQzNhWTFJY3FyQ2tPT1VvNHlrYz0tLUptb01NUHlPdGF3OXhVNSt6bEVjWVE9PQ==--e3d833529be353e2912e1a248061f02ac4545145/t/m9ZxJ-NGGJVZ3-borZfJ/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/WTVpZzdQNm5PTTh5bVpFZkZNL05QcmRNQzNhWTFJY3FyQ2tPT1VvNHlrYz0tLUptb01NUHlPdGF3OXhVNSt6bEVjWVE9PQ==--e3d833529be353e2912e1a248061f02ac4545145/t/m9ZxJ-NGGJVZ3-borZfJ/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-03 03:42:51',0,NULL,NULL);
INSERT INTO `message` VALUES (53,0,0,0,10,'<01000170a4bd59e3-90b81597-eda2-4269-8404-1686ed2d6317-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Chennai, India','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C. Tester&rdquo; mentioned in a paper uploaded by someone in Chennai, India.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VDJ2SDRreUNseTAraE1aYXo1bXdhMkxOWVo0bFJRbEtTSUpScTVOSTFRUT0tLVhGRUwyM2hQWHVrRHRjTzRPOHY0SEE9PQ==--6882d27ba8f0d0ac56b4e2e158ee74bbf6c73e1a/t/m9ZxJ-NGPUTuf-7r8Ph/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VDJ2SDRreUNseTAraE1aYXo1bXdhMkxOWVo0bFJRbEtTSUpScTVOSTFRUT0tLVhGRUwyM2hQWHVrRHRjTzRPOHY0SEE9PQ==--6882d27ba8f0d0ac56b4e2e158ee74bbf6c73e1a/t/m9ZxJ-NGPUTuf-7r8Ph/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-04 03:50:38',0,NULL,NULL);
INSERT INTO `message` VALUES (54,0,0,0,10,'<01000170a9edc3b8-ec97a9e8-ed6b-4b30-a8bb-2ab193dd3bc8-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Hawthorndene, Australia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Hawthorndene, Australia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ZS9nLzN0eTlzK2FiRTdyU0t4d2xGNG1UaWZrY29DaHRiUFZxS203cHdNbz0tLVJUUjZ5MFpkYktOK2VSTFltMkJuVmc9PQ==--d4a1451110d708245147c06850337276eae45e85/t/m9ZxJ-NGW5Mj1-cSShW/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ZS9nLzN0eTlzK2FiRTdyU0t4d2xGNG1UaWZrY29DaHRiUFZxS203cHdNbz0tLVJUUjZ5MFpkYktOK2VSTFltMkJuVmc9PQ==--d4a1451110d708245147c06850337276eae45e85/t/m9ZxJ-NGW5Mj1-cSShW/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-05 04:01:37',0,NULL,NULL);
INSERT INTO `message` VALUES (55,0,0,0,10,'<01000170af1c12ea-d80ddac5-b52c-48ab-9169-d66c295b647c-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Italy','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C. Tester&rdquo; mentioned in a paper uploaded by someone in Italy.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/MU1rNjBpVnNnWUdmZ0hEZ1A3TmY1aERWbFZDVElFMDhqMnFIWVo2NGF5ND0tLWFFYk14MFBDQkJxNGpFMzRFSVpaRnc9PQ==--07da0b776874962c1048a9c7566c79fc8186e5f7/t/m9ZxJ-NG4f0xN-KVKmv/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/MU1rNjBpVnNnWUdmZ0hEZ1A3TmY1aERWbFZDVElFMDhqMnFIWVo2NGF5ND0tLWFFYk14MFBDQkJxNGpFMzRFSVpaRnc9PQ==--07da0b776874962c1048a9c7566c79fc8186e5f7/t/m9ZxJ-NG4f0xN-KVKmv/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-06 04:10:18',0,NULL,NULL);
INSERT INTO `message` VALUES (56,0,0,0,10,'<01000170b4405356-70f859b2-25e3-49f7-8293-c679edd7cb64-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Tunisia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Tunisia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/TGUvR2pWb1JtRTR5L3BEOWpQZDhscHg2NThuMlppUTRST0xvRndVYmRBMD0tLU1TY3MzRFdKZFpHZXlNR2hHRVY4Snc9PQ==--cb70a8c2ed1bb3ae19114b0eda65ab68ac9dfdcf/t/m9ZxJ-NHbn1fi-8HyZa/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/TGUvR2pWb1JtRTR5L3BEOWpQZDhscHg2NThuMlppUTRST0xvRndVYmRBMD0tLU1TY3MzRFdKZFpHZXlNR2hHRVY4Snc9PQ==--cb70a8c2ed1bb3ae19114b0eda65ab68ac9dfdcf/t/m9ZxJ-NHbn1fi-8HyZa/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-07 04:08:00',0,NULL,NULL);
INSERT INTO `message` VALUES (57,0,0,0,10,'<01000170b9676607-08d3505a-bb42-49d8-bddb-7861176983b6-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Yogyakarta, Indonesia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Yogyakarta, Indonesia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/enhHVnNKZ3dsOHNyMkhmSThiWkl5QXVQbUovVEcrZndvbDRibmpUam1kND0tLUNOSzVyc0FMb3B2UEFLUk80QlJ5akE9PQ==--cc00936e1e998b18a80de64a186ddb56f70a34d4/t/m9ZxJ-NHivWhj-d1UrV/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/enhHVnNKZ3dsOHNyMkhmSThiWkl5QXVQbUovVEcrZndvbDRibmpUam1kND0tLUNOSzVyc0FMb3B2UEFLUk80QlJ5akE9PQ==--cc00936e1e998b18a80de64a186ddb56f70a34d4/t/m9ZxJ-NHivWhj-d1UrV/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-08 04:08:46',0,NULL,NULL);
INSERT INTO `message` VALUES (58,0,0,0,10,'<01000170be5c786d-c9896ad6-4247-438d-94e8-8e367c481d9e-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Rabat, Morocco','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Rabat, Morocco.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/OFF0WHI5T0tIWHp0UFBjVTlPOVNLTFpUU1ExWDJ6clpXbkQzU0UyTzBXWT0tLTF0MjREKy9GRDBFT3l5bUU2WkkyM2c9PQ==--3e9409511e179afc5523b868d93424c5ca8ccc07/t/m9ZxJ-NHqnTDU-CrEXB/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/OFF0WHI5T0tIWHp0UFBjVTlPOVNLTFpUU1ExWDJ6clpXbkQzU0UyTzBXWT0tLTF0MjREKy9GRDBFT3l5bUU2WkkyM2c9PQ==--3e9409511e179afc5523b868d93424c5ca8ccc07/t/m9ZxJ-NHqnTDU-CrEXB/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-09 03:14:57',0,NULL,NULL);
INSERT INTO `message` VALUES (59,0,0,0,10,'<01000170c0380228-4284a41c-ce46-4387-9dbf-b272f57fe29f-000000@email.amazonses.com>','Academia.edu',NULL,'The name &quot;C. Tester&quot; is mentioned in a paper published in American Journal of Orthodontics and Dentofacial Orthopedics','Dear Cadic,\r\n\r\nThe name &quot;C. Tester&quot; is mentioned in a paper published in American Journal of Orthodontics and Dentofacial Orthopedics.\r\n\r\nFollow the link below to see your mentions:\r\n\r\nhttps://www.academia.edu/keypass/Z0JGdFBTU25CdGluWDBsTjU3clhuckloaFp0YjIvUlNGWThRazk1WEttZz0tLVh3a3NIUW1adERabGt1anlwdlpmNUE9PQ==--715b76449637774d6b5730504810f9272bb6d00a/t/m9ZxJ-NHsXCpW-gVKmu/upgrade?feature=searchm&amp;trigger=mentions_drip_journal\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/Z0JGdFBTU25CdGluWDBsTjU3clhuckloaFp0YjIvUlNGWThRazk1WEttZz0tLVh3a3NIUW1adERabGt1anlwdlpmNUE9PQ==--715b76449637774d6b5730504810f9272bb6d00a/t/m9ZxJ-NHsXCpW-gVKmu/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-09 11:54:21',0,NULL,NULL);
INSERT INTO `message` VALUES (60,0,0,0,10,'<01000170c3879f8e-c038d1d4-a54f-42df-87f6-9e394c58d394-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Villeparisis, France','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Villeparisis, France.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/QWZiZkZwOVNVaGU4cXhvY3Z1cHhnYnNVenp2R0JxSngzVDU2NlROTGxMdz0tLUEvR2NYU1BiMGQxVEt6dWZpNjZRYmc9PQ==--a4446f9950d5d097c2d27e265f6b50e48bc3981e/t/m9ZxJ-NHxw6rj-iEzL5/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/QWZiZkZwOVNVaGU4cXhvY3Z1cHhnYnNVenp2R0JxSngzVDU2NlROTGxMdz0tLUEvR2NYU1BiMGQxVEt6dWZpNjZRYmc9PQ==--a4446f9950d5d097c2d27e265f6b50e48bc3981e/t/m9ZxJ-NHxw6rj-iEzL5/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-10 03:20:11',0,NULL,NULL);
INSERT INTO `message` VALUES (61,0,0,0,10,'<01000170c8b0d5a2-72de3a8d-bd5a-4ca2-950e-ae3cf7fbf567-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Adelaide, Australia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Adelaide, Australia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/UDRSaFNMcXpaTVp6TncrNldhV0pSQ0ZpK1VJSXYzVCtyL1dYOGhmVDFCZz0tLWpzbUlWK2U0M2pQM0JaZnRhSVNCd2c9PQ==--3c3c8f90a2a23de6cde003301f1b6933c3a0ae8b/t/m9ZxJ-NHEFGFy-bkuC9s/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/UDRSaFNMcXpaTVp6TncrNldhV0pSQ0ZpK1VJSXYzVCtyL1dYOGhmVDFCZz0tLWpzbUlWK2U0M2pQM0JaZnRhSVNCd2c9PQ==--3c3c8f90a2a23de6cde003301f1b6933c3a0ae8b/t/m9ZxJ-NHEFGFy-bkuC9s/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-11 03:23:18',0,NULL,NULL);
INSERT INTO `message` VALUES (62,0,0,0,10,'<01000170cddcf175-666d086f-95f1-4cbf-8f2e-8837cac1e5c3-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Me&iuml;ganga, Cameroon','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Me&iuml;ganga, Cameroon.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/RFRvbFZBcU94cXRrNFN3dzVUbVBkdTVlbjRNaG4zbDJITlRiUE1xRWdCUT0tLWo5a2Z1U1A5a0pRMmg2ZWlpK0Ywb0E9PQ==--4ba58076773345bd77b2ee4ddea483e810ef491f/t/m9ZxJ-NHMRc3P-pCcD8/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/RFRvbFZBcU94cXRrNFN3dzVUbVBkdTVlbjRNaG4zbDJITlRiUE1xRWdCUT0tLWo5a2Z1U1A5a0pRMmg2ZWlpK0Ywb0E9PQ==--4ba58076773345bd77b2ee4ddea483e810ef491f/t/m9ZxJ-NHMRc3P-pCcD8/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-12 03:29:35',0,NULL,NULL);
INSERT INTO `message` VALUES (63,0,0,0,10,'<01000170d3044800-17977880-ea54-4429-90cd-20d848e39d3f-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Keauhou, United States','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Keauhou, United States.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/clc5Q1V3M05rZ2dvZmUrNC9hZ1NnUU9XdjgxdGV1WllndmFpKzh0V1NtND0tLUNUOXN6T21xdmRsNW01MDk2YXJQQ2c9PQ==--136a6b90cd5b1dd94427711dde68735edd4eb15a/t/m9ZxJ-NHUZcXw-zo7ev/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/clc5Q1V3M05rZ2dvZmUrNC9hZ1NnUU9XdjgxdGV1WllndmFpKzh0V1NtND0tLUNUOXN6T21xdmRsNW01MDk2YXJQQ2c9PQ==--136a6b90cd5b1dd94427711dde68735edd4eb15a/t/m9ZxJ-NHUZcXw-zo7ev/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-13 03:30:39',0,NULL,NULL);
INSERT INTO `message` VALUES (64,0,0,0,10,'<01000170d4b08a52-5216ac82-dcea-4dbd-a2cf-c4630a48dd26-000000@email.amazonses.com>','Academia.edu',NULL,'624 humanities and social science grants and fellowships have upcoming deadlines','Dear Cadic Tester,\r\n\r\nWe found 624 humanities and social science grants worth $25,079,848 with deadlines in the next 3 months.\r\n\r\nView Grants and Fellowships: https://www.academia.edu/keypass/dGFDMlAxYUlRdWV0cjA0YTFveXl6REluQ3o3RzA0REh3cG4vNXhucDZ3Yz0tLVpqV0svcUgzV3BSTDhYZGQyd0tkdHc9PQ==--d1920da27e32aa38b54e164cdc878f39c459eb79/t/m9ZxJ-NHXhSRS-Z2W4k/upgrade?feature=grants&amp;trigger=history-grants-email\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/dGFDMlAxYUlRdWV0cjA0YTFveXl6REluQ3o3RzA0REh3cG4vNXhucDZ3Yz0tLVpqV0svcUgzV3BSTDhYZGQyd0tkdHc9PQ==--d1920da27e32aa38b54e164cdc878f39c459eb79/t/m9ZxJ-NHXhSRS-Z2W4k/unsubscribe/grants_upsell\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-13 11:18:25',0,NULL,NULL);
INSERT INTO `message` VALUES (65,0,0,0,10,'<01000170d831eac5-703d0ea6-435f-4d37-a509-680101c378de-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Ahmedabad, India','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Ahmedabad, India.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VVR4ckg2OUN4V3Q5MkNtMVk1aDFMQUlnRjBCY3l3c24xR0VDRTlVRStHND0tLTNVV1VneGJhV2lCZlk1RmdDMGk5bWc9PQ==--70b0794f01414819e0311a5a500e2dbcbe4bf680/t/m9ZxJ-NH19duz-SckR3/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VVR4ckg2OUN4V3Q5MkNtMVk1aDFMQUlnRjBCY3l3c24xR0VDRTlVRStHND0tLTNVV1VneGJhV2lCZlk1RmdDMGk5bWc9PQ==--70b0794f01414819e0311a5a500e2dbcbe4bf680/t/m9ZxJ-NH19duz-SckR3/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-14 03:38:35',0,NULL,NULL);
INSERT INTO `message` VALUES (66,0,0,0,10,'<01000170dd623dbc-d4f75936-e2a8-46aa-929d-d134194e9182-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Boulder, United States','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Boulder, United States.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Yng1NFpjR3N0ZVpJL0dHazVqa3V4NndGNStSVHAwSlU0OXlLZzVsTGNrUT0tLTBHMXJkQlU1QVpxRnJsaHhIa0J2TVE9PQ==--d84c4cdece75e708f3256d49ecd63bcf7662da91/t/m9ZxJ-NH9j5po-nzcPw/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Yng1NFpjR3N0ZVpJL0dHazVqa3V4NndGNStSVHAwSlU0OXlLZzVsTGNrUT0tLTBHMXJkQlU1QVpxRnJsaHhIa0J2TVE9PQ==--d84c4cdece75e708f3256d49ecd63bcf7662da91/t/m9ZxJ-NH9j5po-nzcPw/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-15 03:49:28',0,NULL,NULL);
INSERT INTO `message` VALUES (67,0,0,0,10,'<01000170e29085ac-0a11378a-2674-4651-9864-efcb4580a0a4-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Fortaleza, Brazil','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Fortaleza, Brazil.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/a1BVS1BMOTVrUDExdGp3aDdNTXBNN2xWWE9ieW52b0ZoL294UE84NmpiND0tLUwza2xIcjJUSWtRWk01dk5WN1VLZmc9PQ==--c24b3e3974db55ffef5f749427ebaea676f43dc0/t/m9ZxJ-NJgvigj-w9KBi/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/a1BVS1BMOTVrUDExdGp3aDdNTXBNN2xWWE9ieW52b0ZoL294UE84NmpiND0tLUwza2xIcjJUSWtRWk01dk5WN1VLZmc9PQ==--c24b3e3974db55ffef5f749427ebaea676f43dc0/t/m9ZxJ-NJgvigj-w9KBi/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-16 03:58:08',0,NULL,NULL);
INSERT INTO `message` VALUES (68,0,0,0,10,'<01000170e7274328-cab2a81b-a2b7-4c8e-9c40-379fa84e99a9-000000@email.amazonses.com>','Academia.edu',NULL,'The name &quot;C. Tester&quot; is mentioned in a book on Academia.edu','Dear Cadic,\r\n\r\nA book uploaded to Academia mentions the name &quot;C. Tester&quot;.\r\n\r\nFollow the link below to see your mentions:\r\n\r\nhttps://www.academia.edu/keypass/RVVNSTZrQ3RKMlhqS1lPeVUwY0tYVVVHQXU1MUtlaGNUTllLUWwyYkNSZz0tLXkyVXNZUGE5L1F0M3FnMENYajhiSUE9PQ==--a3c2cc0bfba3355f580ecaa7cbe6530586a4ce4d/t/m9ZxJ-NJnR9MK-KXK5/upgrade?feature=searchm&amp;stm_copy=a+book&amp;trigger=stm\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/RVVNSTZrQ3RKMlhqS1lPeVUwY0tYVVVHQXU1MUtlaGNUTllLUWwyYkNSZz0tLXkyVXNZUGE5L1F0M3FnMENYajhiSUE9PQ==--a3c2cc0bfba3355f580ecaa7cbe6530586a4ce4d/t/m9ZxJ-NJnR9MK-KXK5/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-17 01:21:15',0,NULL,NULL);
INSERT INTO `message` VALUES (69,0,0,0,10,'<01000170e7b97928-5a527644-4ca1-42c5-bb6a-cfb4fafacf2d-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Riyadh, Saudi Arabia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Riyadh, Saudi Arabia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Nm5KaGdZRDBuMEZ4cENzNWtjWEVLcm1qSTdKMEd4NllsMUZ5NjNuUXBRYz0tLXVmNkcwQUhXY0hJb2liMVBnUDBiNFE9PQ==--6babf0036279ae19f33df2ec84e48a2d7a304b26/t/m9ZxJ-NJoDPBQ-bdMwY1/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Nm5KaGdZRDBuMEZ4cENzNWtjWEVLcm1qSTdKMEd4NllsMUZ5NjNuUXBRYz0tLXVmNkcwQUhXY0hJb2liMVBnUDBiNFE9PQ==--6babf0036279ae19f33df2ec84e48a2d7a304b26/t/m9ZxJ-NJoDPBQ-bdMwY1/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-17 04:00:58',0,NULL,NULL);
INSERT INTO `message` VALUES (70,0,0,0,10,'<01000170ece326d3-7447b998-6ef1-40e2-a1cd-5cad22e9a4f5-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Malang, Indonesia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Malang, Indonesia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/L2hERnZHWGxBY3ltaVVJeDNUWHVtcjBSOWdxMFZnOU9NU2hqZmdyYU80ND0tLVVFOVNIa0pkQnBIVVhGWFlxV1lObFE9PQ==--bfd0afcbeefe6b5d1ceaf98f2be6236c81c0def7/t/m9ZxJ-NJvNyvV-9YWUG/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/L2hERnZHWGxBY3ltaVVJeDNUWHVtcjBSOWdxMFZnOU9NU2hqZmdyYU80ND0tLVVFOVNIa0pkQnBIVVhGWFlxV1lObFE9PQ==--bfd0afcbeefe6b5d1ceaf98f2be6236c81c0def7/t/m9ZxJ-NJvNyvV-9YWUG/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-18 04:04:35',0,NULL,NULL);
INSERT INTO `message` VALUES (71,0,0,0,10,'<01000170f20d3e03-63025788-1250-4cdf-bf0c-b1cc4ebf57aa-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Surrey, Canada','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Surrey, Canada.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ZkVqNmdmK2xQVFdOa0JqTXVJZ0lnWlFVcW03MUMwVFR1QlVRUDltdTU5TT0tLWJRaVZ2S0tBN0t5bFUveUlnY3BLVkE9PQ==--acf94b27bfee008cc388a203005d400f3a3ffc69/t/m9ZxJ-NJCXrcE-qWptJ/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ZkVqNmdmK2xQVFdOa0JqTXVJZ0lnWlFVcW03MUMwVFR1QlVRUDltdTU5TT0tLWJRaVZ2S0tBN0t5bFUveUlnY3BLVkE9PQ==--acf94b27bfee008cc388a203005d400f3a3ffc69/t/m9ZxJ-NJCXrcE-qWptJ/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-19 04:08:41',0,NULL,NULL);
INSERT INTO `message` VALUES (72,0,0,0,10,'<01000170f753fa46-8357beed-17a5-4833-813d-76da412b7a56-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Leeds, United Kingdom','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Leeds, United Kingdom.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/c0RTU1JOeit2em9lMzNvY25TS3BiN2dvYVVDUnE3a0Z5YS90cDRPbHUwTT0tLWwyZzVSeU56MDdiL21rUjRlUm9rclE9PQ==--58bbe3760e3fddc8b7d0deef531d11b6bdfd949f/t/m9ZxJ-NJLfr6h-7gWfL/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/c0RTU1JOeit2em9lMzNvY25TS3BiN2dvYVVDUnE3a0Z5YS90cDRPbHUwTT0tLWwyZzVSeU56MDdiL21rUjRlUm9rclE9PQ==--58bbe3760e3fddc8b7d0deef531d11b6bdfd949f/t/m9ZxJ-NJLfr6h-7gWfL/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-20 04:44:01',0,NULL,NULL);
INSERT INTO `message` VALUES (73,0,0,0,10,'<010001710d729430-6c89443f-2f8d-490a-aa3c-51152ab81edf-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Turin, Italy','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Turin, Italy.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/V01CQ3FlS2RRL2FWaEdmUHY4RVFSRUhPQ2dZbnZJMVdUczBoMEpCNjNJND0tLU9KZ3ZWcU56QmI2TW5oV3Jka2NrMFE9PQ==--86da67a86945d2eda1fed2a12f95b4d68dc6c145/t/m9ZxJ-NKgTm9G-1j0Lx/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/V01CQ3FlS2RRL2FWaEdmUHY4RVFSRUhPQ2dZbnZJMVdUczBoMEpCNjNJND0tLU9KZ3ZWcU56QmI2TW5oV3Jka2NrMFE9PQ==--86da67a86945d2eda1fed2a12f95b4d68dc6c145/t/m9ZxJ-NKgTm9G-1j0Lx/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-24 11:49:06',0,NULL,NULL);
INSERT INTO `message` VALUES (74,0,0,0,10,'<01000171127a17b6-4d77087c-bb78-4b9c-a3d6-4f687fe6b795-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Bucheon, Korea, Republic of','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Bucheon, Korea, Republic of.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/QVpvR21UQzhtNitWdklVSXNUT0NwUFhnUHNqRHNwcmJ6SGZ1aFBIZVJ0az0tLW44RU96M0ViRXU1bHdnRWZYY0lKNUE9PQ==--e627235349ea30505340a3f8cd782f10b6e4a960/t/m9ZxJ-NKoRdme-Ej0m2/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/QVpvR21UQzhtNitWdklVSXNUT0NwUFhnUHNqRHNwcmJ6SGZ1aFBIZVJ0az0tLW44RU96M0ViRXU1bHdnRWZYY0lKNUE9PQ==--e627235349ea30505340a3f8cd782f10b6e4a960/t/m9ZxJ-NKoRdme-Ej0m2/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-25 11:15:24',0,NULL,NULL);
INSERT INTO `message` VALUES (75,0,0,0,10,'<0100017113962cf8-145fb995-6d3a-4b6b-bb5c-b5477a99b47b-000000@email.amazonses.com>','Academia.edu',NULL,'&quot;C. Tester&quot;: mentioned in an influential paper by Angel Guevara','Dear cadic,\r\n\r\nAn influential paper by Angel Guevara mentions the name &quot;C. Tester&quot;.\r\n\r\nFollow the link below to see your highly cited mentions:\r\n\r\nhttps://www.academia.edu/keypass/eGFNdzY5NEZ0OC9EbVpZSDhvWERpdVgxWW5IZHJMaXlVeXd6OGw3eTBmQT0tLTZSSUE4dFNSci84Vk5PRk1tVjllZHc9PQ==--2836cdb963948088dbeeccd813b2122899e5c86e/t/m9ZxJ-NKqnSwe-boYCcT/upgrade?feature=highly_cited_mentions&amp;trigger=hcm_drip_author\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/eGFNdzY5NEZ0OC9EbVpZSDhvWERpdVgxWW5IZHJMaXlVeXd6OGw3eTBmQT0tLTZSSUE4dFNSci84Vk5PRk1tVjllZHc9PQ==--2836cdb963948088dbeeccd813b2122899e5c86e/t/m9ZxJ-NKqnSwe-boYCcT/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-25 16:25:42',0,NULL,NULL);
INSERT INTO `message` VALUES (76,0,0,0,10,'<0100017117a58e5d-78d74401-9724-43fc-94cc-ced86a027b5e-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Mojokerto, Indonesia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Mojokerto, Indonesia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VFd6TW9TV3RTUUk2SHN5eEVDYTNrR1kzbGZPVkMvWm5FQ25wYWxYNnlaTT0tLTFRK2R5b2VJQUszc2N4dEtZK2NVWmc9PQ==--f980ab34aaa1f532e01bc64b65b79d3a13b99c5a/t/m9ZxJ-NKv0wme-fNxG3/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VFd6TW9TV3RTUUk2SHN5eEVDYTNrR1kzbGZPVkMvWm5FQ25wYWxYNnlaTT0tLTFRK2R5b2VJQUszc2N4dEtZK2NVWmc9PQ==--f980ab34aaa1f532e01bc64b65b79d3a13b99c5a/t/m9ZxJ-NKv0wme-fNxG3/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-26 11:20:59',0,NULL,NULL);
INSERT INTO `message` VALUES (77,0,0,0,10,'<010001711ccaaf25-8e09b7fd-466e-405c-9fff-f121226b50ea-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Ramsgate, United Kingdom','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Ramsgate, United Kingdom.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/SEtlMmZGRjJGWnY3dE5YRXVNRUxPRWJMRjUxd1V5MmxtVWVHRnh5MUp3dz0tLXhwejlRdXQvMThnS1N3ZkR6YVlrUVE9PQ==--94339f53f7386dbe5b29afdf26531364fb26bcb1/t/m9ZxJ-NKC7Qgm-bggB9h/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/SEtlMmZGRjJGWnY3dE5YRXVNRUxPRWJMRjUxd1V5MmxtVWVHRnh5MUp3dz0tLXhwejlRdXQvMThnS1N3ZkR6YVlrUVE9PQ==--94339f53f7386dbe5b29afdf26531364fb26bcb1/t/m9ZxJ-NKC7Qgm-bggB9h/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-27 11:19:38',0,NULL,NULL);
INSERT INTO `message` VALUES (78,0,0,0,10,'<0100017121f1aef3-47d0ebfe-fcfe-4354-8f4d-583fb73dab48-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Voorthuizen, Netherlands','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C. Tester&rdquo; mentioned in a paper uploaded by someone in Voorthuizen, Netherlands.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/cXZjVFA0c3IrZS9sM0pBOXF0N1A0bVBQS1RkbUtjTXMyYnhNbHFXNkFsOD0tLXdNVEd3RnUyRXBnWHJxaENLc00yMEE9PQ==--278956fc815242abff0a987a3bd4b1699db9a40f/t/m9ZxJ-NKLfHie-bseBUc/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/cXZjVFA0c3IrZS9sM0pBOXF0N1A0bVBQS1RkbUtjTXMyYnhNbHFXNkFsOD0tLXdNVEd3RnUyRXBnWHJxaENLc00yMEE9PQ==--278956fc815242abff0a987a3bd4b1699db9a40f/t/m9ZxJ-NKLfHie-bseBUc/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-28 11:20:20',0,NULL,NULL);
INSERT INTO `message` VALUES (79,0,0,0,10,'<01000171271877a6-d69a5883-3d07-4285-8bb8-6c59400b66ea-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a Business paper','Dear cadic,\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in a Business paper recently discovered by Academia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Ny9oWlRtLytEYWJyaDJVVXVDQnl2T1JQY2VudGlzZTVOU2d5VThjdFpsTT0tLWpyZjQ5MTF0TnVtY3N2aVV1S1B5Nnc9PQ==--bf5f42becc99471ffd6be180f70d36affe8ca4ff/t/m9ZxJ-NKToxdZ-Bmf9F/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Ny9oWlRtLytEYWJyaDJVVXVDQnl2T1JQY2VudGlzZTVOU2d5VThjdFpsTT0tLWpyZjQ5MTF0TnVtY3N2aVV1S1B5Nnc9PQ==--bf5f42becc99471ffd6be180f70d36affe8ca4ff/t/m9ZxJ-NKToxdZ-Bmf9F/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-29 11:20:48',0,NULL,NULL);
INSERT INTO `message` VALUES (80,0,0,0,10,'<010001712c3ee7c6-2f02fa62-f852-45ba-88e0-fe751fc5117a-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in El Macero, United States','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in El Macero, United States.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/aXZTbUtQRHZrN2Q2dmhrZXR4T0FyZzdzL2d3MUpnenc0MmxzNTdwaGRNND0tLXUyamtVSTAxM3NMUmVpKzQrUU5yMFE9PQ==--94e1af554de55d3f51ca963f39fe251333ec1b2d/t/m9ZxJ-NK0we24-bwSBzQ/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/aXZTbUtQRHZrN2Q2dmhrZXR4T0FyZzdzL2d3MUpnenc0MmxzNTdwaGRNND0tLXUyamtVSTAxM3NMUmVpKzQrUU5yMFE9PQ==--94e1af554de55d3f51ca963f39fe251333ec1b2d/t/m9ZxJ-NK0we24-bwSBzQ/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-30 11:20:53',0,NULL,NULL);
INSERT INTO `message` VALUES (81,0,0,0,10,'<010001712d4bc737-71cda09d-c08f-4e0a-8e0e-f5c97f3fec81-000000@email.amazonses.com>','Academia.edu',NULL,'Get the 15 Top Downloaded PDFs in Information Systems','Dear Cadic Tester,\r\n\r\nYou read the paper &quot;A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System on Windows 7 by Ladislav Rydzyk from ABAP Academy.&quot; Get 15 Papers, including 8 Papers with more than 5 citation in the related topic Information Systems.\r\n\r\nView list: https://www.academia.edu/keypass/YVFac2ZXQXIwdks4cGtiZkdudXFTQ1dkZGxyLzVYUmZIR3RVV0poVytRVT0tLXUyQStkdVBTNjRCR1lHL2htbE1UR2c9PQ==--e29cbb97328e165b763dbb9e8e99e2c515b86794/t/m9ZxJ-NK1Y211-bi54Y0/upgrade?feature=curated_lists&amp;list_title=Top+Downloaded+Papers+in+Information+Systems&amp;trigger=curated-lists-reading-drip&amp;upgrade_redirect=https%3A%2F%2Fwww.academia.edu%2Ft%2Fm9ZxJ-NK1Y211-bi54Y0%2Flists%2F5855\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/YVFac2ZXQXIwdks4cGtiZkdudXFTQ1dkZGxyLzVYUmZIR3RVV0poVytRVT0tLXUyQStkdVBTNjRCR1lHL2htbE1UR2c9PQ==--e29cbb97328e165b763dbb9e8e99e2c515b86794/t/m9ZxJ-NK1Y211-bi54Y0/unsubscribe/premium_content\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-30 16:14:34',0,NULL,NULL);
INSERT INTO `message` VALUES (82,0,0,0,10,'<0100017131ba9ecd-25f6a8ec-19c6-47e8-b294-5905d6e51b9c-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Gandhinagar, India','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C. Tester&rdquo; mentioned in a paper uploaded by someone in Gandhinagar, India.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VVFDT0Yxa01wVGg3Nm5nenhXSjN1WWJMdnhKNkVIVHovcW9wREZyS1VCUT0tLStLK2FucTUybGRtRXk5QW5Bdnp1RGc9PQ==--1426ad0b04a2c86787078ace7aa5029a647fead3/t/m9ZxJ-NK769vR-CZebk/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VVFDT0Yxa01wVGg3Nm5nenhXSjN1WWJMdnhKNkVIVHovcW9wREZyS1VCUT0tLStLK2FucTUybGRtRXk5QW5Bdnp1RGc9PQ==--1426ad0b04a2c86787078ace7aa5029a647fead3/t/m9ZxJ-NK769vR-CZebk/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-03-31 12:54:07',0,NULL,NULL);
INSERT INTO `message` VALUES (83,0,0,0,10,'<01000171368f51d5-2eaa18b2-ed41-4e51-a9bb-a0508fe03bb6-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Indonesia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Indonesia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/TXUxOGFuYVY1UjJIVEtxSkdOaHNTQWJuZlRKalZDbVpyZkkxaEcreWtSMD0tLTF5SWQyK0J3WFROcVJMQkVmZXhINnc9PQ==--667589b054041ab66d93807883562dc674e57123/t/m9ZxJ-NLeNNAp-d6zEn/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/TXUxOGFuYVY1UjJIVEtxSkdOaHNTQWJuZlRKalZDbVpyZkkxaEcreWtSMD0tLTF5SWQyK0J3WFROcVJMQkVmZXhINnc9PQ==--667589b054041ab66d93807883562dc674e57123/t/m9ZxJ-NLeNNAp-d6zEn/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-01 11:24:55',0,NULL,NULL);
INSERT INTO `message` VALUES (84,0,0,0,10,'<010001714039e694-a84864b7-de2d-4d84-a260-909e6cf5be6d-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Ensenada, Mexico','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Ensenada, Mexico.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ZVJyRWhxMlg5VEZ1STduUS9YeUdmWmZ0S01DdVhyWExNUGQ5a3NQRTdJdz0tLTNiTVFUUHgrdGtNM2FIV2JZVWZqZ3c9PQ==--cfea43203ab0752f54d8b0624629aa079adbade8/t/m9ZxJ-NLtbqCG-bv7LRK/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ZVJyRWhxMlg5VEZ1STduUS9YeUdmWmZ0S01DdVhyWExNUGQ5a3NQRTdJdz0tLTNiTVFUUHgrdGtNM2FIV2JZVWZqZ3c9PQ==--cfea43203ab0752f54d8b0624629aa079adbade8/t/m9ZxJ-NLtbqCG-bv7LRK/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-03 08:27:49',0,NULL,NULL);
INSERT INTO `message` VALUES (85,0,0,0,10,'<0100017142cd9059-b610588b-edae-41a1-9659-81535351568a-000000@email.amazonses.com>','Academia.edu',NULL,'2 Days Only: Get 50% Off Academia Premium','Stay on track this semester with 50% off Academia Premium\r\n\r\nGet 50% Off Premium: https://www.academia.edu/keypass/WllkQjArZzRlL1dtcUpXdkJGUWJObXBHSDlJcURsSHZuUW1LNENzTjN1az0tLTRVNW9wYU9WMk1JUzc1cDhoWCtDU2c9PQ==--bc9f306416f61869eb03ae65fe95938015ce8e44/t/m9ZxJ-NLwKVDL-wZP9R/upgrade?premium_discount_coupon=MFZEPM&amp;trigger=seasonal_discount_first_email\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/WllkQjArZzRlL1dtcUpXdkJGUWJObXBHSDlJcURsSHZuUW1LNENzTjN1az0tLTRVNW9wYU9WMk1JUzc1cDhoWCtDU2c9PQ==--bc9f306416f61869eb03ae65fe95938015ce8e44/t/m9ZxJ-NLwKVDL-wZP9R/unsubscribe/premium_upsell\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-03 20:28:21',0,NULL,NULL);
INSERT INTO `message` VALUES (86,0,0,0,10,'<01000171463e5e53-128667e0-4124-49cb-9f2a-c23123256bc7-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in To Kwa Wan, Hong Kong','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in To Kwa Wan, Hong Kong.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Z1BlcFlBNS9nUEYzbTFUSXhhOXdkSzhIT3VVTUlvMGI3dzNVclpYL041RT0tLUdxSFRidkpOcytwcUN6Nk9ncTJWSXc9PQ==--f58e05cc47a27c9b6c5b9b8c58ca9d74e9a2281a/t/m9ZxJ-NLBvZtX-bb6dxs/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Z1BlcFlBNS9nUEYzbTFUSXhhOXdkSzhIT3VVTUlvMGI3dzNVclpYL041RT0tLUdxSFRidkpOcytwcUN6Nk9ncTJWSXc9PQ==--f58e05cc47a27c9b6c5b9b8c58ca9d74e9a2281a/t/m9ZxJ-NLBvZtX-bb6dxs/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-04 12:30:25',0,NULL,NULL);
INSERT INTO `message` VALUES (87,0,0,0,10,'<010001714c219807-389377b2-4513-4ee4-a1c3-630084ee5a89-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Porto Seguro, Brazil','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Porto Seguro, Brazil.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/TE9QRmx0OGlGN1htOXdjRGhPTms5NFVudDZWREt5YkFLQ0JtZHFSR3BMVT0tLTNyT041UWZ0MFplQ2xJVFU5ZGlHSnc9PQ==--069462d5b4616ad0567c8824b6650d2bb6c52de0/t/m9ZxJ-NLKEWP7-QnyVm/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/TE9QRmx0OGlGN1htOXdjRGhPTms5NFVudDZWREt5YkFLQ0JtZHFSR3BMVT0tLTNyT041UWZ0MFplQ2xJVFU5ZGlHSnc9PQ==--069462d5b4616ad0567c8824b6650d2bb6c52de0/t/m9ZxJ-NLKEWP7-QnyVm/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-05 15:56:43',0,NULL,NULL);
INSERT INTO `message` VALUES (88,0,0,0,10,'<010001714f029df9-5a38d7db-9c3e-4f1b-9d3f-16318620c9c0-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Vadodara, India','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Vadodara, India.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/TFBZMHFJeW0vSUo0Z2VuQmJaTG05ZzdVMUJvWENqdUpDekFKdHk1Zll4bz0tLXhCUVZJRGpqendnQ24rTlpoY08rQWc9PQ==--e5b1c0dd9e9133621cb11a0386150daaeed7db25/t/m9ZxJ-NLPD7oL-GgjZx/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/TFBZMHFJeW0vSUo0Z2VuQmJaTG05ZzdVMUJvWENqdUpDekFKdHk1Zll4bz0tLXhCUVZJRGpqendnQ24rTlpoY08rQWc9PQ==--e5b1c0dd9e9133621cb11a0386150daaeed7db25/t/m9ZxJ-NLPD7oL-GgjZx/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-06 05:21:44',0,NULL,NULL);
INSERT INTO `message` VALUES (89,0,0,0,10,'<0100017153de8046-4056e503-d1b8-498e-8b21-00d3cbc1a62c-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 200th Mention! &ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Ribeirao Das Neves, Brazil','Dear cadic,\r\r\n\r\r\nCongratulations on your 200th Mention!\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Ribeirao Das Neves, Brazil.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/NFVEZmhpZGRxeWZqZExLTndlRy9VUENnV1FYd3VydjRvaFl1cEVOVCtkZz0tLWM1am1ZOWtPTzZ6d0xrSHRDbWo5U1E9PQ==--71dbba3fa4a6f0689dbf1f8d858cc3da9022c50c/t/m9ZxJ-NLWn2tg-bkxRhW/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-milestone-discounted\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/NFVEZmhpZGRxeWZqZExLTndlRy9VUENnV1FYd3VydjRvaFl1cEVOVCtkZz0tLWM1am1ZOWtPTzZ6d0xrSHRDbWo5U1E9PQ==--71dbba3fa4a6f0689dbf1f8d858cc3da9022c50c/t/m9ZxJ-NLWn2tg-bkxRhW/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-07 04:00:23',0,NULL,NULL);
INSERT INTO `message` VALUES (90,0,0,0,10,'<01000171580fa7a2-d6877271-f6d9-404d-b509-a6eb6c98d909-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Tomsk, Russian Federation','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Tomsk, Russian Federation.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VHFaVWVZZEk4QXpKaVJlazhmR2FLbVVXcC9Kdm11bzQ4d3prd1VGYmIzRT0tLUtWZjdGYXpSd3lRZk4vVHBtbGJiL1E9PQ==--08fda8acd74f318f068112da884dfc0cf3037600/t/m9ZxJ-NL2btBK-bkVtas/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VHFaVWVZZEk4QXpKaVJlazhmR2FLbVVXcC9Kdm11bzQ4d3prd1VGYmIzRT0tLUtWZjdGYXpSd3lRZk4vVHBtbGJiL1E9PQ==--08fda8acd74f318f068112da884dfc0cf3037600/t/m9ZxJ-NL2btBK-bkVtas/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-07 23:32:34',0,NULL,NULL);
INSERT INTO `message` VALUES (91,0,0,0,10,'<010001715d477c42-fed6af65-74d9-4b3e-8ed8-9849db5debef-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Lyon, France','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Lyon, France.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/RUNoRXFRa0FKdm1wR3hOK2wvSnZqYWJoYkpqZ0s5cmtOR1lMTEFMTGl2WT0tLXROTUozWk44ZVRVVisydkNkZDZONXc9PQ==--61ec4d6ddb2a107bcd4d34ca9afdd717915743ca/t/m9ZxJ-NL9pJnU-UfFck/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/RUNoRXFRa0FKdm1wR3hOK2wvSnZqYWJoYkpqZ0s5cmtOR1lMTEFMTGl2WT0tLXROTUozWk44ZVRVVisydkNkZDZONXc9PQ==--61ec4d6ddb2a107bcd4d34ca9afdd717915743ca/t/m9ZxJ-NL9pJnU-UfFck/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-08 23:51:38',0,NULL,NULL);
INSERT INTO `message` VALUES (92,0,0,0,10,'<010001715ebbc131-570d6bde-6476-494f-8aca-8cffae1f12c6-000000@email.amazonses.com>','Academia.edu',NULL,'Final Day: Get 50% Off Academia Premium','Get the most out of Academia with 50% off Academia Premium\r\n\r\nGet 50% Off Premium: https://www.academia.edu/keypass/YmhkclgrckErNzV5NldJdnVwUXBsZHRhbVo4eFJQVmNaUjlqUXd2VXdOMD0tLXZ6aXNzNngyYVRUZWxXR1JMSFd3b3c9PQ==--71c11ad7ec0db973fc8cb42576b254ac3915aa0e/t/m9ZxJ-NMbqwmC-mrN6B/upgrade?premium_discount_coupon=MFZEPM&amp;trigger=seasonal_discount_second_email\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/YmhkclgrckErNzV5NldJdnVwUXBsZHRhbVo4eFJQVmNaUjlqUXd2VXdOMD0tLXZ6aXNzNngyYVRUZWxXR1JMSFd3b3c9PQ==--71c11ad7ec0db973fc8cb42576b254ac3915aa0e/t/m9ZxJ-NMbqwmC-mrN6B/unsubscribe/premium_upsell\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-09 06:38:15',0,NULL,NULL);
INSERT INTO `message` VALUES (93,0,0,0,10,'<010001716291391a-6d249755-d4d0-40a7-8257-faa923618009-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Kuala Lumpur, Malaysia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Kuala Lumpur, Malaysia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VERDUDFOZVpJNXZscyt5cERNRG5ObG02VkI0MG5qS1hhWnc4QUlvOTlOYz0tLS8zTER1RmNNTE5XOTcvUDRZZWZzb2c9PQ==--650e56523e0b4c16d2dfc7bbdea440fc0ca19e35/t/m9ZxJ-NMgJHRC-bdHcS5/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VERDUDFOZVpJNXZscyt5cERNRG5ObG02VkI0MG5qS1hhWnc4QUlvOTlOYz0tLS8zTER1RmNNTE5XOTcvUDRZZWZzb2c9PQ==--650e56523e0b4c16d2dfc7bbdea440fc0ca19e35/t/m9ZxJ-NMgJHRC-bdHcS5/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-10 00:30:17',0,NULL,NULL);
INSERT INTO `message` VALUES (94,0,0,0,10,'<0100017167cb811a-1a7e0e04-a448-409d-a2be-0541b5a7a681-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Bremerhaven, Germany','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Bremerhaven, Germany.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/dzcyaUdISzlTRFBBYXB5U3lUM1JKNlZMWm9MeDZ3KzdWM2Rici9UMnJqUT0tLVp0M3c4VGkyL2tIOU8rTDduakVRdXc9PQ==--346e985f3fcbce6dbebbea0b4c55979c0c508ac8/t/m9ZxJ-NMoYKZU-MTViu/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/dzcyaUdISzlTRFBBYXB5U3lUM1JKNlZMWm9MeDZ3KzdWM2Rici9UMnJqUT0tLVp0M3c4VGkyL2tIOU8rTDduakVRdXc9PQ==--346e985f3fcbce6dbebbea0b4c55979c0c508ac8/t/m9ZxJ-NMoYKZU-MTViu/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-11 00:52:03',0,NULL,NULL);
INSERT INTO `message` VALUES (95,0,0,0,10,'<010001716d4e2e24-c3693e7d-205d-411d-8cef-a53e9b94c3de-000000@email.amazonses.com>','Academia.edu',NULL,'50% Off, 2 days only: &ldquo;Tester, C&rdquo;: 9 new mentions, including one in a paper uploaded to Academia by someone in Morocco','Dear cadic,\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 9 papers recently discovered by Academia, including one by someone in Morocco. View your mentions with 50% off Academia Premium when you upgrade in the next 2 days.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/RU1LMFd2R3JGTTF3MGZSV1d4elRVMEFoMmxiaWwrUEh5UGxqYTBWcEFuST0tLURzVlRUU0NYT0JZOFN0MVlWdU9VZ3c9PQ==--0e08f2ba9d4ee0a6a045112d6e5056a078d72164/t/m9ZxJ-NMwAUEG-cg0jZ/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/RU1LMFd2R3JGTTF3MGZSV1d4elRVMEFoMmxiaWwrUEh5UGxqYTBWcEFuST0tLURzVlRUU0NYT0JZOFN0MVlWdU9VZ3c9PQ==--0e08f2ba9d4ee0a6a045112d6e5056a078d72164/t/m9ZxJ-NMwAUEG-cg0jZ/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-12 02:32:53',0,NULL,NULL);
INSERT INTO `message` VALUES (96,0,0,0,10,'<0100017172dc095a-4b14645e-c637-41cb-8501-46fef2602d41-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Egypt','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Egypt.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/NEp5bytReTdLMlQ5N0NQUjlpTDZQRHhVVmYzMyt4NW01RU53T2l2enBPYz0tLVdpVVZvaGFWdWZuTStmL3owRDBrSGc9PQ==--272ded701989af41f1ba1f5273e4677c99abb847/t/m9ZxJ-NMEhA5o-uY3yw/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/NEp5bytReTdLMlQ5N0NQUjlpTDZQRHhVVmYzMyt4NW01RU53T2l2enBPYz0tLVdpVVZvaGFWdWZuTStmL3owRDBrSGc9PQ==--272ded701989af41f1ba1f5273e4677c99abb847/t/m9ZxJ-NMEhA5o-uY3yw/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-13 04:25:56',0,NULL,NULL);
INSERT INTO `message` VALUES (97,0,0,0,10,'<0100017174c04c42-8ab0fc4c-983a-41b7-b564-0d82dd2eb449-000000@email.amazonses.com>','Academia.edu',NULL,'12 Hours Left: Get 50% Off Academia Premium','Get the most out of Academia with 50% off Academia Premium\r\n\r\nGet 50% Off Premium: https://www.academia.edu/keypass/d0JrMllxY1c5YndaNEFIZG1mYWNyckFTTDcxQ2RTMzl0VWM5SlFRWDl1ND0tLVdnVSszdCtSTEJ3eWxoazNvUFZ3R1E9PQ==--b631aeff2fb5f18c45e27cb76ec69f54735e0a70/t/m9ZxJ-NMGU8yN-z61CX/upgrade?premium_discount_coupon=MFZEPM&amp;trigger=seasonal_discount_third_email\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/d0JrMllxY1c5YndaNEFIZG1mYWNyckFTTDcxQ2RTMzl0VWM5SlFRWDl1ND0tLVdnVSszdCtSTEJ3eWxoazNvUFZ3R1E9PQ==--b631aeff2fb5f18c45e27cb76ec69f54735e0a70/t/m9ZxJ-NMGU8yN-z61CX/unsubscribe/premium_upsell\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-13 13:14:53',0,NULL,NULL);
INSERT INTO `message` VALUES (98,0,0,0,10,'<0100017178253009-cff30839-5fe0-48eb-850d-ed97951a62f0-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 235th Mention! &ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Tel Aviv, Israel','Dear cadic,\r\r\n\r\r\nCongratulations on your 235th Mention!\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Tel Aviv, Israel.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/OHFFSjNGZG1zQVlBTG5QUXdZVXZVL1hoaHM3ZDArQ3huUnF6cmgvcWFicz0tLUdVMXczZVNaQU1yd05GSWhESGxlT2c9PQ==--1a5dae85de7efd0a056169eb19faf50320458bb4/t/m9ZxJ-NMMBoPQ-RYy5d/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/OHFFSjNGZG1zQVlBTG5QUXdZVXZVL1hoaHM3ZDArQ3huUnF6cmgvcWFicz0tLUdVMXczZVNaQU1yd05GSWhESGxlT2c9PQ==--1a5dae85de7efd0a056169eb19faf50320458bb4/t/m9ZxJ-NMMBoPQ-RYy5d/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-14 05:03:56',0,NULL,NULL);
INSERT INTO `message` VALUES (99,0,0,0,10,'<010001717da19eff-28cb1702-2bd4-4d3e-b175-b0cba99beac4-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 240th Mention! &ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Jerusalem, Israel','Dear cadic,\r\r\n\r\r\nCongratulations on your 240th Mention!\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Jerusalem, Israel.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/YWNjeFIvd1VBTE5uTXZQd1NCdDFmWUV5ejczV3RXUnBNa1NiTW1odWZPaz0tLW84KzdNUWU4MEJjNWlFMHY2ZVpMVWc9PQ==--54ae18d81de6973178b20b92f03d97efc763e434/t/m9ZxJ-NMVcxKG-raGDb/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/YWNjeFIvd1VBTE5uTXZQd1NCdDFmWUV5ejczV3RXUnBNa1NiTW1odWZPaz0tLW84KzdNUWU4MEJjNWlFMHY2ZVpMVWc9PQ==--54ae18d81de6973178b20b92f03d97efc763e434/t/m9ZxJ-NMVcxKG-raGDb/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-15 06:37:57',0,NULL,NULL);
INSERT INTO `message` VALUES (100,0,0,0,10,'<0100017183019924-9ca3dd07-3cc8-43b1-be9b-420b30bcba15-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Jakarta, Indonesia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Jakarta, Indonesia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/V3hQUFgxR2xoQXBsb2tRR1N2ZTBZOUdUcEM4NFpzZmdUYzJDaVRYbTM1cz0tLWozYzdzeWl1NFRDTnkrc3ZOOXF2RkE9PQ==--0e2fcdae79d7998c0a442427bf249ee5d3ed0e0e/t/m9ZxJ-NM2DB28-bvPcbs/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/V3hQUFgxR2xoQXBsb2tRR1N2ZTBZOUdUcEM4NFpzZmdUYzJDaVRYbTM1cz0tLWozYzdzeWl1NFRDTnkrc3ZOOXF2RkE9PQ==--0e2fcdae79d7998c0a442427bf249ee5d3ed0e0e/t/m9ZxJ-NM2DB28-bvPcbs/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-16 07:40:53',0,NULL,NULL);
INSERT INTO `message` VALUES (101,0,0,0,10,'<0100017184c9da0b-c90e6bf0-3e5b-4d89-8e27-4b6f7d1b91ee-000000@email.amazonses.com>','Academia.edu',NULL,'The name &quot;C. Tester&quot; is mentioned in a high-impact paper published in Advanced Functional Materials','Dear cadic,\r\n\r\nThe name &quot;C. Tester&quot; is mentioned in a high-impact paper published in Advanced Functional Materials.\r\n\r\nFollow the link below to see your highly cited mentions:\r\n\r\nhttps://www.academia.edu/keypass/d25vWVF1ZSs0Q3lpTGVVcTY5cjcwSzl6SWZaVCtQeEZHWVB5bHVGeFFvST0tLVFKUXFodVlSSTFBTG1HbjhpaTJtR1E9PQ==--669919ef4c1d44c336b4cb96cd971abb3375bf43/t/m9ZxJ-NM47c8C-bnpwFc/upgrade?feature=highly_cited_mentions&amp;trigger=hcm_drip_journal\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/d25vWVF1ZSs0Q3lpTGVVcTY5cjcwSzl6SWZaVCtQeEZHWVB5bHVGeFFvST0tLVFKUXFodVlSSTFBTG1HbjhpaTJtR1E9PQ==--669919ef4c1d44c336b4cb96cd971abb3375bf43/t/m9ZxJ-NM47c8C-bnpwFc/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-16 15:59:14',0,NULL,NULL);
INSERT INTO `message` VALUES (102,0,0,0,10,'<01000171887046a4-fe948bf2-f884-4242-a729-985ef0c0ee64-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 250th Mention! &ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Dublin, Ireland','Dear cadic,\r\r\n\r\r\nCongratulations on your 250th Mention!\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Dublin, Ireland.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/TVV0UzRySEJLZTZ1NVAvK3VSQmJFZTJsZGZ0R2tBblBmd3pwK2V0ZE5RQT0tLWl0L0tqZUpqbk9lbGZ4a3k5TVp5QXc9PQ==--1ff1bcfbe253c2fa4d50e6a861386211b64546aa/t/m9ZxJ-NNaanie-AoDGH/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/TVV0UzRySEJLZTZ1NVAvK3VSQmJFZTJsZGZ0R2tBblBmd3pwK2V0ZE5RQT0tLWl0L0tqZUpqbk9lbGZ4a3k5TVp5QXc9PQ==--1ff1bcfbe253c2fa4d50e6a861386211b64546aa/t/m9ZxJ-NNaanie-AoDGH/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-17 08:59:52',0,NULL,NULL);
INSERT INTO `message` VALUES (103,0,0,0,10,'<0100017188f09e33-9da3acc5-7a8c-4970-a9c6-b61a71e93ce8-000000@email.amazonses.com>','Academia.edu',NULL,'Last Chance: Get 50% Off Academia Premium','Last chance to get 50% off Academia Premium\r\n\r\nGet 50% Off Premium: https://www.academia.edu/keypass/UXZnb0Q2VnU4dkFPc0JZWXZINkNJbFZQZ3BEbk1YRXdQaWtEbUgwNDd3UT0tLUdIRmpjRTBkWWw2Y1BFblc5UUY3N2c9PQ==--9402fd8ea0cd1a07a1ecd7ebdcd8139c3f2520a8/t/m9ZxJ-NNaSkLW-vgi3K/upgrade?premium_discount_coupon=MFZEPM&amp;trigger=seasonal_discount_fourth_email\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/UXZnb0Q2VnU4dkFPc0JZWXZINkNJbFZQZ3BEbk1YRXdQaWtEbUgwNDd3UT0tLUdIRmpjRTBkWWw2Y1BFblc5UUY3N2c9PQ==--9402fd8ea0cd1a07a1ecd7ebdcd8139c3f2520a8/t/m9ZxJ-NNaSkLW-vgi3K/unsubscribe/premium_upsell\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-17 11:20:03',0,NULL,NULL);
INSERT INTO `message` VALUES (104,0,0,0,10,'<010001718dd0c1e6-ee49f9d0-397b-48a8-b595-08201db7b1c0-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Azerbaijan','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Azerbaijan.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/SHMzbHVJQVM1ZktJcFNPTUgxQUlBeXVVSGhxa2h1S1JIRFBrOHRkMVFZaz0tLUQ4aWZPdnhVMzlWcEtGUkhVRkMzemc9PQ==--fc26196643de2f52063b52eed24ab3b14484307a/t/m9ZxJ-NNhBB4N-Va2G7/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/SHMzbHVJQVM1ZktJcFNPTUgxQUlBeXVVSGhxa2h1S1JIRFBrOHRkMVFZaz0tLUQ4aWZPdnhVMzlWcEtGUkhVRkMzemc9PQ==--fc26196643de2f52063b52eed24ab3b14484307a/t/m9ZxJ-NNhBB4N-Va2G7/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-18 10:03:21',0,NULL,NULL);
INSERT INTO `message` VALUES (105,0,0,0,10,'<010001719321e015-6e59e726-f200-4993-958b-7ef97ad690bd-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 260th Mention! &ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Chicoutimi, Canada','Dear cadic,\r\r\n\r\r\nCongratulations on your 260th Mention!\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Chicoutimi, Canada.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/NXB5YzdqZkNFRnByZXpIdzFnOU1aWlZ3amNPTXVCVDlrODJWSVZjNGp2TT0tLVlJWTU1c0V4VU1oV3o5dG52SVNaZmc9PQ==--36871dd1ea056738da3f9f08f9ae2de0e8c0f4fb/t/m9ZxJ-NNpYWYb-q1Sac/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/NXB5YzdqZkNFRnByZXpIdzFnOU1aWlZ3amNPTXVCVDlrODJWSVZjNGp2TT0tLVlJWTU1c0V4VU1oV3o5dG52SVNaZmc9PQ==--36871dd1ea056738da3f9f08f9ae2de0e8c0f4fb/t/m9ZxJ-NNpYWYb-q1Sac/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-19 10:50:04',0,NULL,NULL);
INSERT INTO `message` VALUES (106,0,0,0,10,'<0100017198586fb8-7aa07863-0af3-46e7-823c-c4fb38acf26b-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Tallinn, Estonia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Tallinn, Estonia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Y0wxL3J0OEltMU1oUVZVeFpkV3NZVmxKajZoaTdMNmUrbFRXc3JSc09lTT0tLVYwTExGUlo0elFEczRsd3NIdndZV1E9PQ==--ca8be37b8b685df50fda7b7c6ddc477e37fda2b2/t/m9ZxJ-NNxbN4c-Xy8a/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Y0wxL3J0OEltMU1oUVZVeFpkV3NZVmxKajZoaTdMNmUrbFRXc3JSc09lTT0tLVYwTExGUlo0elFEczRsd3NIdndZV1E9PQ==--ca8be37b8b685df50fda7b7c6ddc477e37fda2b2/t/m9ZxJ-NNxbN4c-Xy8a/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-20 11:07:45',0,NULL,NULL);
INSERT INTO `message` VALUES (107,0,0,0,10,'<010001719dca035b-924e4d2b-253a-4897-b487-f01837f60726-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 265th Mention! &ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Rochester, United States','Dear cadic,\r\r\n\r\r\nCongratulations on your 265th Mention!\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Rochester, United States.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/S3RiK0lXcThnU0x6QzcyMzJDYjU0MHpueHpGRkozeVV5aDV6eW5oOFhLZz0tLXd2LzVQbDErMW5OSXZuTWI3NFRwUVE9PQ==--960725ad3e7001ed9c2b754a9f44607afab95207/t/m9ZxJ-NNEJt8V-rdQE2/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/S3RiK0lXcThnU0x6QzcyMzJDYjU0MHpueHpGRkozeVV5aDV6eW5oOFhLZz0tLXd2LzVQbDErMW5OSXZuTWI3NFRwUVE9PQ==--960725ad3e7001ed9c2b754a9f44607afab95207/t/m9ZxJ-NNEJt8V-rdQE2/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-21 12:29:55',0,NULL,NULL);
INSERT INTO `message` VALUES (108,0,0,0,10,'<01000171a3437844-f434e3a4-6772-4ed9-beae-476ee416fd84-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 270th Mention! &ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Houston, United States','Dear cadic,\r\r\n\r\r\nCongratulations on your 270th Mention!\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Houston, United States.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/M01Hbm9JdElWaEl6RUpNMnVNbTYyTlFabGtrRHZSUTN2U285cFBLVTdWUT0tLVJJQzhwZllPSDdlSFNNQytLREtReEE9PQ==--20c0ef5d0cf0114c16c7e781d60d8a84887d4025/t/m9ZxJ-NNNiENV-EvUv2/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/M01Hbm9JdElWaEl6RUpNMnVNbTYyTlFabGtrRHZSUTN2U285cFBLVTdWUT0tLVJJQzhwZllPSDdlSFNNQytLREtReEE9PQ==--20c0ef5d0cf0114c16c7e781d60d8a84887d4025/t/m9ZxJ-NNNiENV-EvUv2/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-22 14:00:42',0,NULL,NULL);
INSERT INTO `message` VALUES (109,0,0,0,10,'<01000171a3fa8a3a-c4362190-d0f8-41f6-b07e-3d478b15b7e2-000000@email.amazonses.com>','Academia.edu',NULL,'Supporting Researchers During Challenging Economic Times','Dear Cadic,\r\n\r\nAcademia Premium is 50% off this week.\r\n\r\nWe recognize many researchers are trying to make the best of difficult times.\r\nGet access to Academia&#039;s full Premium suite of productivity and analytics tools at 50% off.\r\n\r\nWe are extending this offer for the entire week.\r\n\r\nFollow the link below to get 50% off Premium:\r\n\r\nhttps://www.academia.edu/keypass/MldaamIrVlBXK1dOa3BDbXN4djRtcXI2dDcybENiRjVHdU4rdysvQTdqOD0tLUp5YllpRU9TS0xpL2NjUEo1a21LeGc9PQ==--590328712f9feaa39ab1afd675f1ec7b3530d3c1/t/m9ZxJ-NNPh7m6-zTiAm/upgrade?premium_discount_coupon=DVSZHB&amp;trigger=challenging-times-email\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/MldaamIrVlBXK1dOa3BDbXN4djRtcXI2dDcybENiRjVHdU4rdysvQTdqOD0tLUp5YllpRU9TS0xpL2NjUEo1a21LeGc9PQ==--590328712f9feaa39ab1afd675f1ec7b3530d3c1/t/m9ZxJ-NNPh7m6-zTiAm/unsubscribe/premium_upsell\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-22 17:20:39',0,NULL,NULL);
INSERT INTO `message` VALUES (110,0,0,0,10,'<01000171a88d50a8-9382f920-3688-424a-81a4-2ee67051caab-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Bridgetown, Canada','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Bridgetown, Canada.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/KzE5RHdHSytiOGNveUUvbjRnL0MzbDBnR1BOMDZVNDJDVmp3aGdWeWZsWT0tLW1ub0NjaTFqcGRtT2hJRkp6OUtRTFE9PQ==--c52765b616067be936080fc3408335252a974831/t/m9ZxJ-NNVCFPm-buuyN/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/KzE5RHdHSytiOGNveUUvbjRnL0MzbDBnR1BOMDZVNDJDVmp3aGdWeWZsWT0tLW1ub0NjaTFqcGRtT2hJRkp6OUtRTFE9PQ==--c52765b616067be936080fc3408335252a974831/t/m9ZxJ-NNVCFPm-buuyN/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-23 14:39:26',0,NULL,NULL);
INSERT INTO `message` VALUES (111,0,0,0,10,'<01000171adbf2298-3653f216-cb1c-4bdf-80cb-692cea51c218-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 275th Mention! Get 50% off now. &ldquo;C. Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Penang, Malaysia','Dear cadic,\r\r\n\r\r\nCongratulations on your 275th Mention!\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C. Tester&rdquo; mentioned in a paper uploaded by someone in Penang, Malaysia. View your mentions with 50% off Academia Premium when you upgrade in the next 2 days.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/S3ZYSmh4ZE9tb29IbkhnVGJUQ0k5WEhPc3VzeUxpYXlDa3BTcUUwdEhZVT0tLVA4cFc5aHZCeitYYUNMandwdUVaYXc9PQ==--8abc5a50e982a38b29bb1c682b2647e459614d5b/t/m9ZxJ-NN2P2LU-grPSd/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions-milestone-discounted\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/S3ZYSmh4ZE9tb29IbkhnVGJUQ0k5WEhPc3VzeUxpYXlDa3BTcUUwdEhZVT0tLVA4cFc5aHZCeitYYUNMandwdUVaYXc9PQ==--8abc5a50e982a38b29bb1c682b2647e459614d5b/t/m9ZxJ-NN2P2LU-grPSd/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-24 14:51:57',0,NULL,NULL);
INSERT INTO `message` VALUES (112,0,0,0,10,'<01000171b464bad8-67fdf462-69fd-46f5-9a65-6a79ad73b25f-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Little Rock, United States','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Little Rock, United States.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VHd5Z1FTZE90RDIvcGExU21qcXNLeGFpaFJIUmluOVJzQzBna0NpcENIZz0tLXVvbmZzeVZqSzhsb254WVd1c0hMdVE9PQ==--c42427410aeb874927b7060f2ebde903ba9ec7f5/t/m9ZxJ-NPb11Qm-6PkNg/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VHd5Z1FTZE90RDIvcGExU21qcXNLeGFpaFJIUmluOVJzQzBna0NpcENIZz0tLXVvbmZzeVZqSzhsb254WVd1c0hMdVE9PQ==--c42427410aeb874927b7060f2ebde903ba9ec7f5/t/m9ZxJ-NPb11Qm-6PkNg/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-25 21:50:33',0,NULL,NULL);
INSERT INTO `message` VALUES (113,0,0,0,10,'<01000171bcea00c7-f05322c6-79b0-414b-9b1d-661d184413b0-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 290th Mention! &ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Lahore, Pakistan','Dear cadic,\r\r\n\r\r\nCongratulations on your 290th Mention!\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Lahore, Pakistan.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/OHA5WVgrN0p4M2d2TE5BYXVqUjd5eW4ybGN0cUxOUHcwTnV3S2xwbFUyaz0tLVJ4OFQ5TUZ3eXdhaW05YUwzVmdNTFE9PQ==--9b929444c904da45b0374bf836159730c090eebc/t/m9ZxJ-NPoP3Vh-punL9/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/OHA5WVgrN0p4M2d2TE5BYXVqUjd5eW4ybGN0cUxOUHcwTnV3S2xwbFUyaz0tLVJ4OFQ5TUZ3eXdhaW05YUwzVmdNTFE9PQ==--9b929444c904da45b0374bf836159730c090eebc/t/m9ZxJ-NPoP3Vh-punL9/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-27 13:33:05',0,NULL,NULL);
INSERT INTO `message` VALUES (114,0,0,0,10,'<01000171c17805f9-65ce5adc-63ee-4a4a-a236-3fa46fe7cc55-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Brussels, Belgium','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Brussels, Belgium.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/WXFmY3FLMngyejZQMkFNemVyVjEvenZ0VzcvN3R0Rmh2T2gxaUpZNmpBUT0tLURrVkEyOHV0WnkydGFvUVlKZjdKa1E9PQ==--7a69f87b709018f8406d602bf4d459d089c53985/t/m9ZxJ-NPu777L-8cKGN/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/WXFmY3FLMngyejZQMkFNemVyVjEvenZ0VzcvN3R0Rmh2T2gxaUpZNmpBUT0tLURrVkEyOHV0WnkydGFvUVlKZjdKa1E9PQ==--7a69f87b709018f8406d602bf4d459d089c53985/t/m9ZxJ-NPu777L-8cKGN/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-28 10:46:41',0,NULL,NULL);
INSERT INTO `message` VALUES (115,0,0,0,4,'<5e805c65-59cc-be97-bc3c-7a52c3fae032@monday.com>','monday.com',NULL,'(remote) team management @Test Municipio','[https://s3.amazonaws.com/monday-activemail/shared/monday-logo-top-100.png] pixel [https://amcdn.monday.com/images/0/6db2728de0ef5d6a982112a58080a86f.png] \r\nKeep working together.\r\nEven when apart. What a strange time to work as a team! You started managing\r\nprojects with monday.?com [href] a little while back, and we believe this is a\r\ngood time to give it another try, for free. We added 7 days trial to your\r\naccount: test514623.monday.com &rarr;\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRnNE1UZzROalUzTENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFPRGd4TURJeU5UZDkuaG8yVTBHekhSV3M0TFFqRlg5Rm9ubWEyY0VTUkp4SWQ0b3RIRWo0RWVnZyZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9d2ZobWFkZWVhc3kmcGF0aD1ib2FyZHMvbmV3ZXN0X3B1YmxpY19ib2FyZCIsIm0iOiI2ZGIyNzI4ZGUwZWY1ZDZhOTgyMTEyYTU4MDgwYTg2ZiIsImlhdCI6MTU4ODEwMjI1N30.CBa3VcvdNRlUqhKKiW3364v6pul9ZciW_l38j-4XjNE] \r\n[https://monday-activemail.s3.amazonaws.com/shared/Campaigns/corona/resurrect/Group+1991.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRnNE1UZzROalUzTENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFPRGd4TURJeU5UZDkuaG8yVTBHekhSV3M0TFFqRlg5Rm9ubWEyY0VTUkp4SWQ0b3RIRWo0RWVnZyZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9d2ZobWFkZWVhc3kmcGF0aD1ib2FyZHMvbmV3ZXN0X3B1YmxpY19ib2FyZCIsIm0iOiI2ZGIyNzI4ZGUwZWY1ZDZhOTgyMTEyYTU4MDgwYTg2ZiIsInAiOjIsImlhdCI6MTU4ODEwMjI1N30.pe5IFztGQwks9ot0m5nNSzS5BLf-0BszmWJuDI__Obs] \r\nP.S. Have a look at this video\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LnlvdXR1YmUuY29tL3dhdGNoP3Y9bC03YXdWcGVjdlUiLCJtIjoiNmRiMjcyOGRlMGVmNWQ2YTk4MjExMmE1ODA4MGE4NmYiLCJpYXQiOjE1ODgxMDIyNTd9.XCRTOeS8xbZBKJtx4Uzgbhv2aHkM5LPKKdbYnCwuCFU] \r\nto see everything you can do with monday.?com [href] Login\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tIiwibSI6IjZkYjI3MjhkZTBlZjVkNmE5ODIxMTJhNTgwODBhODZmIiwiaWF0IjoxNTg4MTAyMjU3fQ.GHn1tXeljvyfgQIyOgPts-91jw_ZPyoqZccmhTt6BMA] \r\n&bull; Webinars\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibW9uZGF5LmNvbS93ZWJpbmFycy8iLCJtIjoiNmRiMjcyOGRlMGVmNWQ2YTk4MjExMmE1ODA4MGE4NmYiLCJpYXQiOjE1ODgxMDIyNTd9.PBq1wvy_FpENAmyU1Rwbjz2Ac49Lfw4DsUFhgiQ2hb0] \r\n&bull; FAQ\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoic3VwcG9ydC5tb25kYXkuY29tIiwibSI6IjZkYjI3MjhkZTBlZjVkNmE5ODIxMTJhNTgwODBhODZmIiwiaWF0IjoxNTg4MTAyMjU3fQ.f4Gr-uZ-VtDV4w5cURoReOimyGnsGbAPyLL5D3_DONE] \r\n&bull; Community\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoiY29tbXVuaXR5Lm1vbmRheS5jb20iLCJtIjoiNmRiMjcyOGRlMGVmNWQ2YTk4MjExMmE1ODA4MGE4NmYiLCJpYXQiOjE1ODgxMDIyNTd9.eZgRF_W-6hRhyceYgng2zScwbae8Ab6b9xHOrx9dXXw]  \r\n\r\nFollow us: \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138361/email_marketing/footer/Facebook.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LmZhY2Vib29rLmNvbS9tb25kYXlkb3Rjb20iLCJtIjoiNmRiMjcyOGRlMGVmNWQ2YTk4MjExMmE1ODA4MGE4NmYiLCJpYXQiOjE1ODgxMDIyNTd9.JZLtHCU4-ISizRQKUoVt2kPGbfOatV-0P8Kz-dC0450] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138361/email_marketing/footer/Youtube.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LnlvdXR1YmUuY29tL2NoYW5uZWwvVUNBOVV2QmlLSGx5MTVyTjh1X0ttM0JRIiwibSI6IjZkYjI3MjhkZTBlZjVkNmE5ODIxMTJhNTgwODBhODZmIiwiaWF0IjoxNTg4MTAyMjU3fQ.M0ALnQNKI4K_6qPOqz9dTazUi7Cg8i2bX_li6ICmt4s] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138359/email_marketing/footer/LinkedIN.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LmxpbmtlZGluLmNvbS9jb21wYW55LzI1MjUxNjkvIiwibSI6IjZkYjI3MjhkZTBlZjVkNmE5ODIxMTJhNTgwODBhODZmIiwiaWF0IjoxNTg4MTAyMjU3fQ.ocFZfeVZmSc2whB2XBBwaycyuXXiMC7EoWvIZdt0kq8] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138358/email_marketing/footer/Twitter.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidHdpdHRlci5jb20vbW9uZGF5ZG90Y29tIiwibSI6IjZkYjI3MjhkZTBlZjVkNmE5ODIxMTJhNTgwODBhODZmIiwiaWF0IjoxNTg4MTAyMjU3fQ.6RppLa1Iq0lOoNszP-7T0kx1by5K4ujqUhamj5vHs2g]  \r\n\r\nmonday.com logo [https://amcdn.monday.com/images/1/6db2728de0ef5d6a982112a58080a86f.png] monday.com [https://dapulse-res.cloudinary.com/image/upload/v1569157981/email_marketing/footer/monday-200x200.png] \r\n\r\n+1 (201) 778-4567 \r\n\r\nTel Aviv \r\n52 Menachem Begin Road \r\nTel Aviv 6713701 Israel \r\n\r\nNew York \r\n26 West 17th Street \r\nNew York, NY, 10011 United States Take monday.?com [href] everywhere with you \r\n[https://s3.amazonaws.com/monday-activemail/shared/download_android_app.png ] [\r\nhttps://go.onelink.me/wwJQ?pid=referral_install&amp;c=email_marketing&amp;email_source=trial&amp;type=android&amp;c=footer\r\n] [https://s3.amazonaws.com/monday-activemail/shared/download_ios_app.png ]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoiZ28ub25lbGluay5tZS93d0pRP3BpZD1yZWZlcnJhbF9pbnN0YWxsJmM9ZW1haWxfbWFya2V0aW5nJmVtYWlsX3NvdXJjZT10cmlhbCZ0eXBlPWlwaG9uZSZjPWZvb3RlciAiLCJtIjoiNmRiMjcyOGRlMGVmNWQ2YTk4MjExMmE1ODA4MGE4NmYiLCJpYXQiOjE1ODgxMDIyNTd9.2fj0FMHIVklCrKiTIlaPe8uXWNEP35yBj_QSx8ryMHY]  \r\n\r\nThis email was sent to you regarding your test514623.monday.?com [href] account.\r\nIf you wish to no longer receive emails from us you can unsubscribe\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibGlua3MubW9uZGF5LmNvbS91bnN1YnNjcmliZT91PWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUp0SWpvaU5tUmlNamN5T0dSbE1HVm1OV1EyWVRrNE1qRXhNbUUxT0RBNE1HRTRObVlpTENKcFlYUWlPakUxT0RneE1ESXlOVGQ5LmNLa3p0bllXNlVwMUNzajNYNTJRWGlSakg4a25JYmotc0x0U2JmNWlOY0EiLCJtIjoiNmRiMjcyOGRlMGVmNWQ2YTk4MjExMmE1ODA4MGE4NmYiLCJpYXQiOjE1ODgxMDIyNTd9.tgnZbNCjEUVNLvIGUVyqu6Z3bEhU9gwTatPyvo2MewQ]\r\n. \r\n\r\nWhy did I receive this email?\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibW9uZGF5LmNvbS90ZXJtcy9lbWFpbHMiLCJtIjoiNmRiMjcyOGRlMGVmNWQ2YTk4MjExMmE1ODA4MGE4NmYiLCJpYXQiOjE1ODgxMDIyNTd9.ueZQQBiz6vKXp9qioitY9UbXCVHuis1ml-icBAvNJls]\n\n',1,'2020-04-28 14:31:35',0,NULL,NULL);
INSERT INTO `message` VALUES (116,0,0,0,10,'<01000171c5b8280c-32fda602-d44c-40d4-8bdd-73582a988dd3-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Serang, Indonesia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Serang, Indonesia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/cWF4K0puWVhLRVhKUHh6UGFFekYxd2U5MDk1UUZQK3duejhjbWJ6dU8xUT0tLVFKdHp6OTNScHlaUHRJeE9xYVMrVVE9PQ==--9e62afa6b020a5a70fe4c0b7718e2119ed424b4d/t/m9ZxJ-NPA1k2P-bcUscv/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/cWF4K0puWVhLRVhKUHh6UGFFekYxd2U5MDk1UUZQK3duejhjbWJ6dU8xUT0tLVFKdHp6OTNScHlaUHRJeE9xYVMrVVE9PQ==--9e62afa6b020a5a70fe4c0b7718e2119ed424b4d/t/m9ZxJ-NPA1k2P-bcUscv/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-29 06:35:13',0,NULL,NULL);
INSERT INTO `message` VALUES (117,0,0,0,10,'<01000171c6b13fb9-d56695a9-4d72-496d-8ceb-da16ec6abb8d-000000@email.amazonses.com>','Academia.edu',NULL,'The name &quot;C. Tester&quot; is mentioned in a PDF uploaded to Academia by someone interested in Education','Dear Cadic,\r\n\r\nSomeone interested in Education mentioned the name &quot;C. Tester&quot; in a PDF uploaded to Academia.\r\n\r\nFollow the link below to finish your upgrade:\r\n\r\nhttps://www.academia.edu/keypass/THJLeEtScURYS0pIMlJOSDVZd1VvTEUrN2hLbERRVFgzYTZPc0tBd2Vyaz0tLXFnMGc4dTBlSXBTWSs4NTRpWTBGTEE9PQ==--37d03398a03ba2399979c6becf06d212d3153e27/t/m9ZxJ-NPCmQAG-pyZhc/upgrade?feature=searchm&amp;trigger=author_ri\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/THJLeEtScURYS0pIMlJOSDVZd1VvTEUrN2hLbERRVFgzYTZPc0tBd2Vyaz0tLXFnMGc4dTBlSXBTWSs4NTRpWTBGTEE9PQ==--37d03398a03ba2399979c6becf06d212d3153e27/t/m9ZxJ-NPCmQAG-pyZhc/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-04-29 11:07:18',0,NULL,NULL);
INSERT INTO `message` VALUES (118,0,0,0,10,'<01000171d496bd2e-87e2a23c-2847-46a9-9513-a3c110dd86f7-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 290th Mention! Get 50% off now. &ldquo;C. Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Hanoi, Vietnam','Dear cadic,\r\r\n\r\r\nCongratulations on your 290th Mention!\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C. Tester&rdquo; mentioned in a paper uploaded by someone in Hanoi, Vietnam. View your mentions with 50% off Academia Premium when you upgrade in the next 2 days.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/cW5ON3B0WG5saThiQmdVMTlPYVZkY1JhTzNGeTB2RERRR0VreE9zTm5FTT0tLTZ4MmJldytMMTd3SW4yelVHMHhUUWc9PQ==--19f46069794894e3be338e67fb402db252fc3243/t/m9ZxJ-NPXA1x8-bcrYBX/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions-milestone-discounted\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/cW5ON3B0WG5saThiQmdVMTlPYVZkY1JhTzNGeTB2RERRR0VreE9zTm5FTT0tLTZ4MmJldytMMTd3SW4yelVHMHhUUWc9PQ==--19f46069794894e3be338e67fb402db252fc3243/t/m9ZxJ-NPXA1x8-bcrYBX/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-02 03:53:01',0,NULL,NULL);
INSERT INTO `message` VALUES (119,0,0,0,10,'<01000171d93f2039-cb6b643f-e109-465f-b1fb-095fba6fe5c8-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Medan, Indonesia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in Medan, Indonesia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/a0x4TnZFWXZIcFFqeWZYNjl0dDVud0xucWxVcFZNTFV4RTlZOEhJTFcwYz0tLXdIN1JFNzYvaUJ0ajJsbTFEMVkzMlE9PQ==--48e7f683881312e0844018a40a88ec085bec5576/t/m9ZxJ-NP33vQ3-EEwhr/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/a0x4TnZFWXZIcFFqeWZYNjl0dDVud0xucWxVcFZNTFV4RTlZOEhJTFcwYz0tLXdIN1JFNzYvaUJ0ajJsbTFEMVkzMlE9PQ==--48e7f683881312e0844018a40a88ec085bec5576/t/m9ZxJ-NP33vQ3-EEwhr/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-03 01:35:26',0,NULL,NULL);
INSERT INTO `message` VALUES (120,0,0,0,10,'<01000171de59939c-22fff3a3-dbe8-48b1-9760-141850fe7911-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Twickenham, United Kingdom','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C Tester&rdquo; mentioned in a paper uploaded by someone in Twickenham, United Kingdom.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/clh1d2l3WHJvN2t0SjB0UTNQc3pFVXluNW5rNlVlSG43NmtsR2xtWEI4cz0tLUd4UnRMak9zelRMRUI0ckRweTByQWc9PQ==--03edbdaf7ec1c77b020a2ea44b521c3adcda4609/t/m9ZxJ-NQa7pjf-st2f/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/clh1d2l3WHJvN2t0SjB0UTNQc3pFVXluNW5rNlVlSG43NmtsR2xtWEI4cz0tLUd4UnRMak9zelRMRUI0ckRweTByQWc9PQ==--03edbdaf7ec1c77b020a2ea44b521c3adcda4609/t/m9ZxJ-NQa7pjf-st2f/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-04 01:22:25',0,NULL,NULL);
INSERT INTO `message` VALUES (121,0,0,0,10,'<01000171e10611ed-e3a83cf2-5746-4626-b36e-1702d95894db-000000@email.amazonses.com>','Academia.edu',NULL,'Download the 15 Most Cited Information Systems PDFs','Dear Cadic Tester,\r\n\r\nYou read the paper &quot;A Complete Step-by-Step Guide How to Install Local SAP ABAP Development System on Windows 7 by Ladislav Rydzyk from ABAP Academy.&quot; Get 15 Papers, including 10 Papers with more than 725.0 citation in the related topic Information Systems.\r\n\r\nView list: https://www.academia.edu/keypass/RGt2cDJvTkQ5emFTWkNwRkdjSTVZdUZZQkF0Ui9yNzU3b0d4SG5hRFZ4Yz0tLWdrZlRZQ2x5T3B1V1hxTThaMUwzcFE9PQ==--2e705d21af50f13dea2d277eb8f8ebb3cf090c3b/t/m9ZxJ-NQePQua-pWcGy/upgrade?feature=curated_lists&amp;list_title=The+Most+Cited+Papers+on+Information+Systems&amp;trigger=curated-lists-reading-drip&amp;upgrade_redirect=https%3A%2F%2Fwww.academia.edu%2Ft%2Fm9ZxJ-NQePQua-pWcGy%2Flists%2F3951\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/RGt2cDJvTkQ5emFTWkNwRkdjSTVZdUZZQkF0Ui9yNzU3b0d4SG5hRFZ4Yz0tLWdrZlRZQ2x5T3B1V1hxTThaMUwzcFE9PQ==--2e705d21af50f13dea2d277eb8f8ebb3cf090c3b/t/m9ZxJ-NQePQua-pWcGy/unsubscribe/premium_content\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-04 13:50:04',0,NULL,NULL);
INSERT INTO `message` VALUES (122,0,0,0,10,'<01000171e3600c52-b5d29703-4b67-45a8-9daf-ae99650aae87-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 300th Mention! &ldquo;Tester, C&rdquo;: 1 new mention in a paper uploaded to Academia by someone in T&acirc;n Ph&uacute;, Vietnam','Dear cadic,\r\r\n\r\r\nCongratulations on your 300th Mention!\r\r\n\r\r\nAcademia recently discovered the name &ldquo;Tester, C&rdquo; mentioned in a paper uploaded by someone in T&acirc;n Ph&uacute;, Vietnam.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Z01yMnBTWGliZlA1SlM5L2cxbW5pSXovVDN0c2FkTzdQWENmcW9LZlZtdz0tLTAzMXVISjBqa0NEUGZRMlVOdXNzUnc9PQ==--c4974364911b7e9f0ffca24a5db00945b09188e0/t/m9ZxJ-NQh4VaG-XMipt/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Z01yMnBTWGliZlA1SlM5L2cxbW5pSXovVDN0c2FkTzdQWENmcW9LZlZtdz0tLTAzMXVISjBqa0NEUGZRMlVOdXNzUnc9PQ==--c4974364911b7e9f0ffca24a5db00945b09188e0/t/m9ZxJ-NQh4VaG-XMipt/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-05 00:47:35',0,NULL,NULL);
INSERT INTO `message` VALUES (123,0,0,0,10,'<01000171e8535b54-90f2c15b-d274-4a8c-be82-828d9b278cc3-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Surabaya, Indonesia','Dear cadic,\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C. Tester&rdquo; mentioned in a paper uploaded by someone in Surabaya, Indonesia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/QXh2WHB5T0QzbllWWWRYREd3eVJycGFnUm9LTDgzalFZd2ZTaVJWSjA5QT0tLTRuWCtocnR2b0tHalVOSTkrT0Jha2c9PQ==--5db8ec51fcc1da8e784223f7187b65511cc73873/t/m9ZxJ-NQpWiyC-WUAGw/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/QXh2WHB5T0QzbllWWWRYREd3eVJycGFnUm9LTDgzalFZd2ZTaVJWSjA5QT0tLTRuWCtocnR2b0tHalVOSTkrT0Jha2c9PQ==--5db8ec51fcc1da8e784223f7187b65511cc73873/t/m9ZxJ-NQpWiyC-WUAGw/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-05 23:51:50',0,NULL,NULL);
INSERT INTO `message` VALUES (124,0,0,0,10,'<01000171f052294a-1794da35-0624-4695-9f2b-516c536ce121-000000@email.amazonses.com>','Academia.edu',NULL,'&quot;C. Tester&quot;: 3 new mentions, including one in a Cardiology and Cardiovascular Medicine paper','Dear Cadic,\r\n\r\nThe name &quot;C. Tester&quot; was mentioned in 3 PDFs recently found by Academia, including a Cardiology and Cardiovascular Medicine paper.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/OVZqNFpSQUZCNmc3ZWpNQ2Y0cEdESkVGL1hzMmZqRnY3YTVNRFNXUkhWST0tLWZmT05PRVpHN0RXaXFYeWdUcVdzWGc9PQ==--25c94381e16bf482b8bc2a1ab269e09d460b0647/t/m9ZxJ-NQA0rM8-y8eNN/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/OVZqNFpSQUZCNmc3ZWpNQ2Y0cEdESkVGL1hzMmZqRnY3YTVNRFNXUkhWST0tLWZmT05PRVpHN0RXaXFYeWdUcVdzWGc9PQ==--25c94381e16bf482b8bc2a1ab269e09d460b0647/t/m9ZxJ-NQA0rM8-y8eNN/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-07 13:07:29',0,NULL,NULL);
INSERT INTO `message` VALUES (125,0,0,0,10,'<01000171f3848c6d-b7fd4f5e-8c7d-490e-b02d-571437e8b0d6-000000@email.amazonses.com>','Academia.edu',NULL,'&quot;C. Tester&quot;: 11 new mentions, including one in a Multidisciplinary paper','Dear Cadic,\r\n\r\nThe name &quot;C. Tester&quot; was mentioned in 11 PDFs recently found by Academia, including a Multidisciplinary paper.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/RXdKMGdHRmNITUVjRWxDRmJzUnU5dHhsbExNNmtxeThqVGZISVBIRURZND0tLVNKT2V1akJyQnE5T3E5MElielpRNXc9PQ==--417cfcbe3d3dea19713f315f1069f3482677d1a5/t/m9ZxJ-NQFqAd3-oMStQ/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/RXdKMGdHRmNITUVjRWxDRmJzUnU5dHhsbExNNmtxeThqVGZISVBIRURZND0tLVNKT2V1akJyQnE5T3E5MElielpRNXc9PQ==--417cfcbe3d3dea19713f315f1069f3482677d1a5/t/m9ZxJ-NQFqAd3-oMStQ/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-08 04:01:23',0,NULL,NULL);
INSERT INTO `message` VALUES (126,0,0,0,10,'<01000171f7ae63c1-3a27e04c-27f6-4976-9a39-d6d6571960a7-000000@email.amazonses.com>','Academia.edu',NULL,'&quot;C. Tester&quot;: 5 new mentions, including one in an Electrical and Electronic Engineering paper','Dear Cadic,\r\n\r\nThe name &quot;C. Tester&quot; was mentioned in 5 PDFs recently found by Academia, including an Electrical and Electronic Engineering paper.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/dVRwa3hkbDBKNFNhYlBKSE1mQkltektVUEdiU3NlR25rMlZ4UXdWd3lmYz0tLUUzOG13cmppNHNoWWNhaU1QUFhEcmc9PQ==--076913ccadfaf4453bf5f3df83d6519124dee6a0/t/m9ZxJ-NQMbGGo-8HAu1/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/dVRwa3hkbDBKNFNhYlBKSE1mQkltektVUEdiU3NlR25rMlZ4UXdWd3lmYz0tLUUzOG13cmppNHNoWWNhaU1QUFhEcmc9PQ==--076913ccadfaf4453bf5f3df83d6519124dee6a0/t/m9ZxJ-NQMbGGo-8HAu1/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-08 23:25:34',0,NULL,NULL);
INSERT INTO `message` VALUES (127,0,0,0,10,'<01000171fcd986e4-1891f282-6a2f-4b89-841c-100dbeeda926-000000@email.amazonses.com>','Academia.edu',NULL,'&quot;C. Tester&quot;: 4 new mentions, including one in a General Medicine paper','Dear Cadic,\r\n\r\nThe name &quot;C. Tester&quot; was mentioned in 4 PDFs recently found by Academia, including a General Medicine paper.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/T2JFRWVpeDdOdXpQV0I5cVBFRnMybWI1UkZBMnEwWS9qbW9qc1A1NGJJUT0tLUZVY29Uc1RZd2VjbVV0Q2NUNWpzQlE9PQ==--d49c6ff50f467948d5fbf2dc7ed26917d8a4c9c6/t/m9ZxJ-NQUkVeW-0Wgsd/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/T2JFRWVpeDdOdXpQV0I5cVBFRnMybWI1UkZBMnEwWS9qbW9qc1A1NGJJUT0tLUZVY29Uc1RZd2VjbVV0Q2NUNWpzQlE9PQ==--d49c6ff50f467948d5fbf2dc7ed26917d8a4c9c6/t/m9ZxJ-NQUkVeW-0Wgsd/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-09 23:30:47',0,NULL,NULL);
INSERT INTO `message` VALUES (128,0,0,0,10,'<0100017201fa43ba-d116d0a8-258e-43e5-8249-b42353010134-000000@email.amazonses.com>','Academia.edu',NULL,'&quot;C. Tester&quot;: 5 new mentions, including one in an Ecology paper','Dear Cadic,\r\n\r\nThe name &quot;C. Tester&quot; was mentioned in 5 PDFs recently found by Academia, including an Ecology paper.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/bDB4S2V6MU5iV3owY0gycnNHMmlqdVR0NmhoR1pPcVViMWdmNXREcVl6bz0tLXJESDZFSWR0LzZxZHJWTXQzcHJxeGc9PQ==--2819fb4a4262f518679af145d0b1fb3800686258/t/m9ZxJ-NQ1rNJ3-zY5h2/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/bDB4S2V6MU5iV3owY0gycnNHMmlqdVR0NmhoR1pPcVViMWdmNXREcVl6bz0tLXJESDZFSWR0LzZxZHJWTXQzcHJxeGc9PQ==--2819fb4a4262f518679af145d0b1fb3800686258/t/m9ZxJ-NQ1rNJ3-zY5h2/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-10 23:24:38',0,NULL,NULL);
INSERT INTO `message` VALUES (129,0,0,0,10,'<01000172057349bc-34e9ed48-338d-4d9b-bdbd-190cdaee2986-000000@email.amazonses.com>','Academia.edu',NULL,'The name &quot;C. Tester&quot; is mentioned in a PDF uploaded to Academia by Jack Howard','Dear cadic,\r\n\r\nJack Howard uploaded a PDF that mentions the name &quot;C. Tester&quot;.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/WWNYZUFTTTFlUTFiRkdndTNrMU9XQU4wMjN2V1Q5azFtTXgwdnllaDZPaz0tLVp4WUt2YmJGUnkvWC9tMzdBeHVXRlE9PQ==--eec9ce7b1d9a132a4f0fa5c4a98a2f9ee3c2512a/t/m9ZxJ-NQ6fuiZ-boZF6s/upgrade?feature=name_mentions&amp;trigger=author-name\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/WWNYZUFTTTFlUTFiRkdndTNrMU9XQU4wMjN2V1Q5azFtTXgwdnllaDZPaz0tLVp4WUt2YmJGUnkvWC9tMzdBeHVXRlE9PQ==--eec9ce7b1d9a132a4f0fa5c4a98a2f9ee3c2512a/t/m9ZxJ-NQ6fuiZ-boZF6s/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-11 15:35:42',0,NULL,NULL);
INSERT INTO `message` VALUES (130,0,0,0,10,'<0100017207232d5b-a7e601e6-7abf-4663-9255-2588adaec90e-000000@email.amazonses.com>','Academia.edu',NULL,'&quot;C. Tester&quot;: 4 new mentions, including one in a Plant Science paper','Dear Cadic,\r\n\r\nThe name &quot;C. Tester&quot; was mentioned in 4 PDFs recently found by Academia, including a Plant Science paper.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/bzJ0ck5kNFE0TGJwQXI3U3JjS3ZsNmY0U2NLbUc4UzdHQXpCWjVHOXgrRT0tLUN5VFppL2Y0MlR3Z0RPYmFDSDFpRVE9PQ==--8023f66d3a7c2dd9200449ab5753a6240c49d2de/t/m9ZxJ-NQ8Aikw-Rdc34/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/bzJ0ck5kNFE0TGJwQXI3U3JjS3ZsNmY0U2NLbUc4UzdHQXpCWjVHOXgrRT0tLUN5VFppL2Y0MlR3Z0RPYmFDSDFpRVE9PQ==--8023f66d3a7c2dd9200449ab5753a6240c49d2de/t/m9ZxJ-NQ8Aikw-Rdc34/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-11 23:27:26',0,NULL,NULL);
INSERT INTO `message` VALUES (131,0,0,0,10,'<010001720d20a073-cf9f69f1-0f92-4d02-89c5-8efe19708df2-000000@email.amazonses.com>','Academia.edu',NULL,'&quot;C. Tester&quot;: 7 new mentions, including one in a Genetics paper','Dear Cadic,\r\n\r\nThe name &quot;C. Tester&quot; was mentioned in 7 PDFs recently found by Academia, including a Genetics paper.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/bS9rYzd0bWZNK2JTT3FQb1NFMzNJcFVIVG9BaGN4bENkNHVVWkNhUGR3bz0tLWRMcnE2cHd4bVhOSGM4K0JRTmVveFE9PQ==--c5920d2ca0e87218ecf847de84160c16b3b228c6/t/m9ZxJ-NRgTB8z-4TxMq/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/bS9rYzd0bWZNK2JTT3FQb1NFMzNJcFVIVG9BaGN4bENkNHVVWkNhUGR3bz0tLWRMcnE2cHd4bVhOSGM4K0JRTmVveFE9PQ==--c5920d2ca0e87218ecf847de84160c16b3b228c6/t/m9ZxJ-NRgTB8z-4TxMq/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-13 03:22:23',0,NULL,NULL);
INSERT INTO `message` VALUES (132,0,0,0,10,'<010001721239c992-b853bed2-71d9-4068-a166-0b75efecda9b-000000@email.amazonses.com>','Academia.edu',NULL,'&quot;C. Tester&quot;: 2 new mentions, including one in an Ecology paper','Dear Cadic,\r\n\r\nCongratulations on your 2nd Mention!\r\n\r\nThe name &quot;C. Tester&quot; was mentioned in 2 PDFs recently found by Academia, including an Ecology paper.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/Um1leXc3OHFLYUpWUTBES0ZrM2YxeHV2U09EUXpBMXQzU0N4Y24vaHVVWT0tLXJtdlVJRjlsdzF2MWVZdWF0SkJKZlE9PQ==--1f3828004d173543187f08b7752368d826e08576/t/m9ZxJ-NRoW58i-UmbqA/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/Um1leXc3OHFLYUpWUTBES0ZrM2YxeHV2U09EUXpBMXQzU0N4Y24vaHVVWT0tLXJtdlVJRjlsdzF2MWVZdWF0SkJKZlE9PQ==--1f3828004d173543187f08b7752368d826e08576/t/m9ZxJ-NRoW58i-UmbqA/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-14 03:07:57',0,NULL,NULL);
INSERT INTO `message` VALUES (133,0,0,0,10,'<01000172169bdc86-8481fc00-5eab-4b61-9942-697112f6b2e6-000000@email.amazonses.com>','Academia.edu',NULL,'The name &quot;C. Tester&quot; has 4 new mentions','Dear Cadic,\r\n\r\nCongratulations on your 4th Mention!\r\n\r\nWe recently found 4 papers that mention &quot;C. Tester&quot;, including one written by Abeer S. Alhendi.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/K2htcE9nSGxiTTQvQzJDRkxTV1RxR2JFNmJuYUlFQ09mQ1F5QUdMU0UwWT0tLS9zY3E4T3JsSmhwbUsrMlBhVXk3bXc9PQ==--a4c40f600a9e9fee7cbd36cd524d3f3a27a93b8d/t/m9ZxJ-NRu085e-We0rg/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/K2htcE9nSGxiTTQvQzJDRkxTV1RxR2JFNmJuYUlFQ09mQ1F5QUdMU0UwWT0tLS9zY3E4T3JsSmhwbUsrMlBhVXk3bXc9PQ==--a4c40f600a9e9fee7cbd36cd524d3f3a27a93b8d/t/m9ZxJ-NRu085e-We0rg/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-14 23:33:33',0,NULL,NULL);
INSERT INTO `message` VALUES (134,0,0,0,10,'<010001721daa0061-4bf3a1f4-4132-427a-b442-009f8fe0ba09-000000@email.amazonses.com>','Academia.edu',NULL,'&quot;C. Tester&quot;: your name was mentioned in 4 papers, including one published in [s.n.]','Dear Cadic,\r\n\r\nCongratulations on your 350th Mention!\r\n\r\n&quot;C. Tester&quot;: your name was mentioned in 4 papers, including one published in [s.n.]\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/Sk5RSnFuTzZSeVlTWTlnOHNFT0JmYXBlaWhNcHVDWTBFeEx1U3krcU0vaz0tLXRIcFQyUEZHbW9JN3BUWENBVWxEWHc9PQ==--fff1c3359111c7cde2ebd63500e55716f3909238/t/m9ZxJ-NREMtEH-zvpxr/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/Sk5RSnFuTzZSeVlTWTlnOHNFT0JmYXBlaWhNcHVDWTBFeEx1U3krcU0vaz0tLXRIcFQyUEZHbW9JN3BUWENBVWxEWHc9PQ==--fff1c3359111c7cde2ebd63500e55716f3909238/t/m9ZxJ-NREMtEH-zvpxr/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-16 08:26:21',0,NULL,NULL);
INSERT INTO `message` VALUES (135,0,0,0,10,'<0100017228e26437-a7d2657a-9850-4c52-9cb7-d46eb308014e-000000@email.amazonses.com>','Academia.edu',NULL,'&quot;C. Tester&quot;: 4 new mentions, including one in a General Engineering paper','Dear Cadic,\r\n\r\nCongratulations on your 360th Mention!\r\n\r\nThe name &quot;C. Tester&quot; was mentioned in 4 PDFs recently found by Academia, including a General Engineering paper.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/QW5yY0J3NldGeVlRUWt6S3JWNlZXdFBxRmZxbFB0U2hTcHlxaklnYUZBdz0tLUsvd3FJVG5jdGFhK01QOGdpdjRvVmc9PQ==--9868590e9e470d848e104060a4394d14cb0c0ab5/t/m9ZxJ-NRWi2Bw-cb3gG/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/QW5yY0J3NldGeVlRUWt6S3JWNlZXdFBxRmZxbFB0U2hTcHlxaklnYUZBdz0tLUsvd3FJVG5jdGFhK01QOGdpdjRvVmc9PQ==--9868590e9e470d848e104060a4394d14cb0c0ab5/t/m9ZxJ-NRWi2Bw-cb3gG/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-18 12:43:46',0,NULL,NULL);
INSERT INTO `message` VALUES (136,0,0,0,10,'<010001722b393779-f6c49104-b50c-4500-a45f-c6bf0a863a66-000000@email.amazonses.com>','Academia.edu',NULL,'2 Days Only, Get 50% Off Premium: Make the Best of Uncertain Times','Dear Cadic,\r\r\n\r\r\nResearchers around the world are trying to make the best of unprecedented and uncertain times. Take advantage of Academia&rsquo;s full suite of Premium productivity and analytics tools.\r\r\n\r\r\nGet 50% Off Premium: https://www.academia.edu/keypass/NlpoSi9jQTZvRjY5ZFQweFhzeDJrMHdBdW01TnNYTGtrKytJM0p0cVo5Zz0tLS9zR21rY25BRldvSi9uR0ZsT2NqRUE9PQ==--cc54015b51dbaaae7fffe08dc6d7ad8a96a30693/t/m9ZxJ-NRZx7P2-MN3m/upgrade?premium_discount_coupon=MFZEPM&amp;trigger=seasonal_discount_first_email\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/NlpoSi9jQTZvRjY5ZFQweFhzeDJrMHdBdW01TnNYTGtrKytJM0p0cVo5Zz0tLS9zR21rY25BRldvSi9uR0ZsT2NqRUE9PQ==--cc54015b51dbaaae7fffe08dc6d7ad8a96a30693/t/m9ZxJ-NRZx7P2-MN3m/unsubscribe/premium_upsell\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-18 23:37:50',0,NULL,NULL);
INSERT INTO `message` VALUES (137,0,0,0,10,'<010001722c9f88e7-9932f2f4-8182-4626-aff7-73289ffa2105-000000@email.amazonses.com>','Academia.edu',NULL,'&quot;C. Tester&quot;: 6 new mentions, including one in a Biotechnology paper','Dear Cadic,\r\n\r\nThe name &quot;C. Tester&quot; was mentioned in 6 PDFs recently found by Academia, including a Biotechnology paper.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/Sk9LWlVTdkdJN1ZPY3VOaUJDS04rL0tNSkhxL2pnMkI4LzhDZE16YTg0WT0tLWJqMnRpN01kbUMwd09heWRCcnlMR2c9PQ==--1cfc94cfbd53d8b2c58c86c9450a19696ab2d07b/t/m9ZxJ-NR1utC5-qwxZ2/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/Sk9LWlVTdkdJN1ZPY3VOaUJDS04rL0tNSkhxL2pnMkI4LzhDZE16YTg0WT0tLWJqMnRpN01kbUMwd09heWRCcnlMR2c9PQ==--1cfc94cfbd53d8b2c58c86c9450a19696ab2d07b/t/m9ZxJ-NR1utC5-qwxZ2/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-19 06:09:13',0,NULL,NULL);
INSERT INTO `message` VALUES (138,0,0,0,4,'<229f9496-da76-06c7-3bfe-f39a22b25fea@monday.com>','monday.com',NULL,'motivated + productive = your team @Test Municipio','[https://s3.amazonaws.com/monday-activemail/shared/monday-logo-top-100.png] pixel [https://amcdn.monday.com/images/0/00aa62c5bf58061a620230ea3cd6ab05.png] \r\nThe key to great (remote) teamwork ???? Without the ability to tap your teammate\r\non the shoulder, ask the status of a project, or know who&#039;s doing what, keeping\r\nin sync can be hard. We built monday.?com [href] with all this in mind&mdash;add 7\r\ndays to your free trial and reunite your team! test514623.monday.com &rarr;\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRnNU9UZzROVEl5TENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFPRGs1TURJeE1qSjkudVNpWWVXb3NaOGE5a25zNFljZ0FBNUxvRS1IaHBMNkt6Q3QyNXZKUldRTSZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9a2V5bWF5MSZwYXRoPWJvYXJkcy9uZXdlc3RfcHVibGljX2JvYXJkIiwibSI6IjAwYWE2MmM1YmY1ODA2MWE2MjAyMzBlYTNjZDZhYjA1IiwiaWF0IjoxNTg5OTAyMTIyfQ.TCztU9b1SmyWWCVqX_9BixnM0BqTU_eMl3Kiqjk3et8] \r\n[https://monday-activemail.s3.amazonaws.com/shared/Campaigns/Resurrect_blasts/july/Group+9+(1).png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRnNU9UZzROVEl5TENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFPRGs1TURJeE1qSjkudVNpWWVXb3NaOGE5a25zNFljZ0FBNUxvRS1IaHBMNkt6Q3QyNXZKUldRTSZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9a2V5bWF5MSZwYXRoPWJvYXJkcy9uZXdlc3RfcHVibGljX2JvYXJkIiwibSI6IjAwYWE2MmM1YmY1ODA2MWE2MjAyMzBlYTNjZDZhYjA1IiwicCI6MiwiaWF0IjoxNTg5OTAyMTIyfQ.-LyD3z2jyhWcK-AknJ2dgPIlwATV7K23P9HNualkjSk] \r\nWork by week\r\nPlan a detailed list of all the things you&rsquo;ll complete this week, and next week.\r\nUse the timeline column to manage by time. Your team can relax (in pyjamas) and\r\nget to work. \r\n[https://monday-activemail.s3.amazonaws.com/shared/Students_funnel/Group+17.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRnNU9UZzROVEl5TENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFPRGs1TURJeE1qSjkudVNpWWVXb3NaOGE5a25zNFljZ0FBNUxvRS1IaHBMNkt6Q3QyNXZKUldRTSZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9a2V5bWF5MSZwYXRoPWJvYXJkcy9uZXdlc3RfcHVibGljX2JvYXJkIiwibSI6IjAwYWE2MmM1YmY1ODA2MWE2MjAyMzBlYTNjZDZhYjA1IiwicCI6MywiaWF0IjoxNTg5OTAyMTIyfQ.oCbREaDS3NXs9wyyqBsleL4R2x0zCCh0VOmfsC_mWug] \r\nKnow what&rsquo;s on your plate\r\nAssign your team to each item on your boards. That way, everyone always knows\r\nwho&rsquo;s working on what. You can better divide the workload, and see how much\r\nyou&rsquo;ll accomplish together. \r\n[https://monday-activemail.s3.amazonaws.com/shared/Campaigns/Resurrect_blasts/july/Group+2+(2).png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRnNU9UZzROVEl5TENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFPRGs1TURJeE1qSjkudVNpWWVXb3NaOGE5a25zNFljZ0FBNUxvRS1IaHBMNkt6Q3QyNXZKUldRTSZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9a2V5bWF5MSZwYXRoPWJvYXJkcy9uZXdlc3RfcHVibGljX2JvYXJkIiwibSI6IjAwYWE2MmM1YmY1ODA2MWE2MjAyMzBlYTNjZDZhYjA1IiwicCI6NCwiaWF0IjoxNTg5OTAyMTIyfQ.OfYALErxmc54F0LylZAlkN6waXcQw3vMHIRHKoD7ha4] \r\nStay motivated\r\nFinished something? Mark it done! See how things progress, and what you\r\naccomplish together. It builds motivation&mdash;you work and collaborate as a team,\r\nand everyone gets excited to get things done. test514623.monday.com &rarr;\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRnNU9UZzROVEl5TENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFPRGs1TURJeE1qSjkudVNpWWVXb3NaOGE5a25zNFljZ0FBNUxvRS1IaHBMNkt6Q3QyNXZKUldRTSZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9a2V5bWF5MSZwYXRoPWJvYXJkcy9uZXdlc3RfcHVibGljX2JvYXJkIiwibSI6IjAwYWE2MmM1YmY1ODA2MWE2MjAyMzBlYTNjZDZhYjA1IiwicCI6NSwiaWF0IjoxNTg5OTAyMTIyfQ.k9i1mRIh3ShcGkn2a46swqkuDFUOp6gpjbgy47KaY4w] \r\nLogin\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tIiwibSI6IjAwYWE2MmM1YmY1ODA2MWE2MjAyMzBlYTNjZDZhYjA1IiwiaWF0IjoxNTg5OTAyMTIyfQ.jO41br_v4fBaq8G9yew1MKwN9SOA7oO6U7fg4VH4Dec] \r\n&bull; Webinars\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibW9uZGF5LmNvbS93ZWJpbmFycy8iLCJtIjoiMDBhYTYyYzViZjU4MDYxYTYyMDIzMGVhM2NkNmFiMDUiLCJpYXQiOjE1ODk5MDIxMjJ9.S6H4iQr_rqU0qYIKDtjqV-DXaboWnjCIVybbmYeXgEQ] \r\n&bull; FAQ\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoic3VwcG9ydC5tb25kYXkuY29tIiwibSI6IjAwYWE2MmM1YmY1ODA2MWE2MjAyMzBlYTNjZDZhYjA1IiwiaWF0IjoxNTg5OTAyMTIyfQ.VlUX4GPBzOG0NXy6vuClmzWY0MfsdO0xw-mtQYEw2KQ] \r\n&bull; Community\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoiY29tbXVuaXR5Lm1vbmRheS5jb20iLCJtIjoiMDBhYTYyYzViZjU4MDYxYTYyMDIzMGVhM2NkNmFiMDUiLCJpYXQiOjE1ODk5MDIxMjJ9.b2gTkiMcvhonO54JVatyBlnJ6JJshrgh-ZJYBjOOqWE]  \r\n\r\nFollow us: \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138361/email_marketing/footer/Facebook.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LmZhY2Vib29rLmNvbS9tb25kYXlkb3Rjb20iLCJtIjoiMDBhYTYyYzViZjU4MDYxYTYyMDIzMGVhM2NkNmFiMDUiLCJpYXQiOjE1ODk5MDIxMjJ9.uQbUXpuQl0zgv0Vkzw-5sflucUS-NVNNQDwf9EjWALQ] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138361/email_marketing/footer/Youtube.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LnlvdXR1YmUuY29tL2NoYW5uZWwvVUNBOVV2QmlLSGx5MTVyTjh1X0ttM0JRIiwibSI6IjAwYWE2MmM1YmY1ODA2MWE2MjAyMzBlYTNjZDZhYjA1IiwiaWF0IjoxNTg5OTAyMTIyfQ.Cq1KZy-PvwPWsgFgvIqpaAdTkcDfuSGwqVIRVVohPfM] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138359/email_marketing/footer/LinkedIN.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LmxpbmtlZGluLmNvbS9jb21wYW55LzI1MjUxNjkvIiwibSI6IjAwYWE2MmM1YmY1ODA2MWE2MjAyMzBlYTNjZDZhYjA1IiwiaWF0IjoxNTg5OTAyMTIyfQ.2fm_x_n8pS0PWp-9vJcOHqjkY31I3DvAOi7-2sMpxTQ] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138358/email_marketing/footer/Twitter.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidHdpdHRlci5jb20vbW9uZGF5ZG90Y29tIiwibSI6IjAwYWE2MmM1YmY1ODA2MWE2MjAyMzBlYTNjZDZhYjA1IiwiaWF0IjoxNTg5OTAyMTIyfQ.UV5BQ_EVg5KKgesJJ_P6JVUXAmH3_o1aAaNH_n1Td58]  \r\n\r\nmonday.com logo [https://amcdn.monday.com/images/1/00aa62c5bf58061a620230ea3cd6ab05.png] monday.com [https://dapulse-res.cloudinary.com/image/upload/v1569157981/email_marketing/footer/monday-200x200.png] \r\n\r\n+1 (201) 778-4567 \r\n\r\nTel Aviv \r\n52 Menachem Begin Road \r\nTel Aviv 6713701 Israel \r\n\r\nNew York \r\n26 West 17th Street \r\nNew York, NY, 10011 United States Take monday.?com [href] everywhere with you \r\n[https://s3.amazonaws.com/monday-activemail/shared/download_android_app.png ] [\r\nhttps://go.onelink.me/wwJQ?pid=referral_install&amp;c=email_marketing&amp;email_source=trial&amp;type=android&amp;c=footer\r\n] [https://s3.amazonaws.com/monday-activemail/shared/download_ios_app.png ]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoiZ28ub25lbGluay5tZS93d0pRP3BpZD1yZWZlcnJhbF9pbnN0YWxsJmM9ZW1haWxfbWFya2V0aW5nJmVtYWlsX3NvdXJjZT10cmlhbCZ0eXBlPWlwaG9uZSZjPWZvb3RlciAiLCJtIjoiMDBhYTYyYzViZjU4MDYxYTYyMDIzMGVhM2NkNmFiMDUiLCJpYXQiOjE1ODk5MDIxMjJ9.KesaBiVCAhSdtCLGTiuGrABLQ8olfKtREqPqtTG4Diw]  \r\n\r\nThis email was sent to you regarding your test514623.monday.?com [href] account.\r\nIf you wish to no longer receive emails from us you can unsubscribe\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibGlua3MubW9uZGF5LmNvbS91bnN1YnNjcmliZT91PWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUp0SWpvaU1EQmhZVFl5WXpWaVpqVTRNRFl4WVRZeU1ESXpNR1ZoTTJOa05tRmlNRFVpTENKcFlYUWlPakUxT0RrNU1ESXhNako5LjI2Rm1pNjNwYl8tLW13N2pNdjRhVF9ENFIzdnpubUV1QlYxbjdIcWNxb2MiLCJtIjoiMDBhYTYyYzViZjU4MDYxYTYyMDIzMGVhM2NkNmFiMDUiLCJpYXQiOjE1ODk5MDIxMjJ9.U7lBpHaoAiTSEGx2HtI0VDfoqqaiGRP4UEiBJRGBOL0]\r\n. \r\n\r\nWhy did I receive this email?\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibW9uZGF5LmNvbS90ZXJtcy9lbWFpbHMiLCJtIjoiMDBhYTYyYzViZjU4MDYxYTYyMDIzMGVhM2NkNmFiMDUiLCJpYXQiOjE1ODk5MDIxMjJ9.c-bSvLaIDTsJT-yyLDZy7jluzqkFkURHJFde36DD2AU]\n\n',1,'2020-05-19 10:28:44',0,NULL,NULL);
INSERT INTO `message` VALUES (139,0,0,0,10,'<010001722e7e006a-9affa0ef-8c0a-40eb-9ffe-2f55e1f943b7-000000@email.amazonses.com>','Academia.edu',NULL,'&quot;C. Tester&quot;: 2 new mentions, including one in a Geochemistry and Petrology paper','Dear Cadic,\r\n\r\nThe name &quot;C. Tester&quot; was mentioned in 2 PDFs recently found by Academia, including a Geochemistry and Petrology paper.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/cXB3b0lCTW0xU2tQS3ZmWElzYlVEZW1IN0E3NEpUNmNrbk9WZ3QzbUNMZz0tLVJlOHRWT2JsUklKQitZM3BIZlJJT0E9PQ==--4344c45b20125089351867f839ce13c671a6eaa8/t/m9ZxJ-NR349zR-qeAUs/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/cXB3b0lCTW0xU2tQS3ZmWElzYlVEZW1IN0E3NEpUNmNrbk9WZ3QzbUNMZz0tLVJlOHRWT2JsUklKQitZM3BIZlJJT0E9PQ==--4344c45b20125089351867f839ce13c671a6eaa8/t/m9ZxJ-NR349zR-qeAUs/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-19 14:51:50',0,NULL,NULL);
INSERT INTO `message` VALUES (140,0,0,0,10,'<01000172337c06c4-bad6d79e-3bd1-4adf-aaf5-6ad3081376b4-000000@email.amazonses.com>','Academia.edu',NULL,'&quot;C. Tester&quot;: your name was mentioned in 3 papers, including one published in Office of Scientific and Technical Information  (OSTI)','Dear Cadic,\r\n\r\n&quot;C. Tester&quot;: your name was mentioned in 3 papers, including one published in Office of Scientific and Technical Information  (OSTI)\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/R3pMYWRFWmprd2l4ODNNYVFvUkJyQnY3VGQ0a1BvT2pQWmpRb2FlVVhTRT0tLVRoYTV2bjA0YjZ5RnJQTU1rd1UvaWc9PQ==--ab43cd7dcb159305e2da98dd16bb513dda9c3036/t/m9ZxJ-NSaZYD5-5iDnd/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/R3pMYWRFWmprd2l4ODNNYVFvUkJyQnY3VGQ0a1BvT2pQWmpRb2FlVVhTRT0tLVRoYTV2bjA0YjZ5RnJQTU1rd1UvaWc9PQ==--ab43cd7dcb159305e2da98dd16bb513dda9c3036/t/m9ZxJ-NSaZYD5-5iDnd/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-20 14:07:46',0,NULL,NULL);
INSERT INTO `message` VALUES (141,0,0,0,10,'<01000172370f725b-b17a8649-3ff9-4760-8704-389f9a353f4c-000000@email.amazonses.com>','Academia.edu',NULL,'&quot;C. Tester&quot;: 2 new mentions, including one in an Agronomy and Crop Science paper','Dear Cadic,\r\n\r\nThe name &quot;C. Tester&quot; was mentioned in 2 PDFs recently found by Academia, including an Agronomy and Crop Science paper.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/UkZBUlZzUm9KOW10VEh0Y3JKTFJua3pvelRmbC9ROGk4U29oYkJXWXNNST0tLXdwWld6eGxyTGZtOExKNUZlVEp2ZHc9PQ==--35ec1087df34f940e8bdaeba94ef0a82cc1d386d/t/m9ZxJ-NSfW5gr-bw2yjn/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/UkZBUlZzUm9KOW10VEh0Y3JKTFJua3pvelRmbC9ROGk4U29oYkJXWXNNST0tLXdwWld6eGxyTGZtOExKNUZlVEp2ZHc9PQ==--35ec1087df34f940e8bdaeba94ef0a82cc1d386d/t/m9ZxJ-NSfW5gr-bw2yjn/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-21 06:47:39',0,NULL,NULL);
INSERT INTO `message` VALUES (142,0,0,0,10,'<010001723bd2f4f5-f63e53b4-cd1d-4aa2-af96-1cb3c19d3e1e-000000@email.amazonses.com>','Academia.edu',NULL,'&quot;C. Tester&quot;: Academia has found a Physical and Theoretical Chemistry paper mentioning the name &quot;C. Tester&quot;','Dear Cadic,\r\n\r\nCongratulations on your 365th Mention!\r\n\r\nAcademia has found a Physical and Theoretical Chemistry paper mentioning the name &quot;C. Tester&quot;\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/N0s5Wk9HS0hlc1QwcDRQVVE3bDA5K2dtYnkrUkQ1aGsyQksyZUdSdmdPYz0tLWlLYnR3eUxRcmlHMzRpOUt1YjVVUUE9PQ==--cc31ee74d363584f38e931145995b0550299c00d/t/m9ZxJ-NSnxdxa-cg1RV/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/N0s5Wk9HS0hlc1QwcDRQVVE3bDA5K2dtYnkrUkQ1aGsyQksyZUdSdmdPYz0tLWlLYnR3eUxRcmlHMzRpOUt1YjVVUUE9PQ==--cc31ee74d363584f38e931145995b0550299c00d/t/m9ZxJ-NSnxdxa-cg1RV/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-22 04:59:41',0,NULL,NULL);
INSERT INTO `message` VALUES (143,0,0,0,10,'<010001723dd78142-58edb533-044c-493c-be83-a96c6f753511-000000@email.amazonses.com>','Academia.edu',NULL,'The name &quot;C. Tester&quot; is mentioned in an Information Systems paper uploaded to Academia','Dear Cadic,\r\n\r\nThe name &quot;C. Tester&quot; is mentioned in an Information Systems paper uploaded to Academia.\r\n\r\nFollow the link below to see your mentions:\r\n\r\nhttps://www.academia.edu/keypass/d2RrTCtOWDBEdE9tWlNtWXVNd2F6NGMxeGdLS2QyMjRiNmdjYWx2S3Ayaz0tLXVyUDk4RWdEQnpkZS9LM1dtSWhNM3c9PQ==--28e960ccf1935cb26262cf2c59828fef70dd7abe/t/m9ZxJ-NSqj205-bahATM/upgrade?feature=searchm&amp;trigger=view_download_ri\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/d2RrTCtOWDBEdE9tWlNtWXVNd2F6NGMxeGdLS2QyMjRiNmdjYWx2S3Ayaz0tLXVyUDk4RWdEQnpkZS9LM1dtSWhNM3c9PQ==--28e960ccf1935cb26262cf2c59828fef70dd7abe/t/m9ZxJ-NSqj205-bahATM/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-22 14:23:53',0,NULL,NULL);
INSERT INTO `message` VALUES (144,0,0,0,10,'<01000172443c5677-52e2e42c-2b6b-4874-a98e-fd1a8de598a3-000000@email.amazonses.com>','Academia.edu',NULL,'The name &quot;C. Tester&quot; is mentioned in a PDF by P.P. Dessau','Dear Cadic,\r\n\r\nThe name &quot;C. Tester&quot; is mentioned in a PDF by P.P. Dessau\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/OGRtMElPbXhhamZ1VnRLOXE5RnVSZE00ajExVlFST3JybS91OENXVVBoQT0tLWhPMDdsWXVFaHVITVlzNWxHSVBVNHc9PQ==--7d9247ea09cf6bd557b4bc44808f49011739cbad/t/m9ZxJ-NSzbmSh-N36ps/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/OGRtMElPbXhhamZ1VnRLOXE5RnVSZE00ajExVlFST3JybS91OENXVVBoQT0tLWhPMDdsWXVFaHVITVlzNWxHSVBVNHc9PQ==--7d9247ea09cf6bd557b4bc44808f49011739cbad/t/m9ZxJ-NSzbmSh-N36ps/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-23 20:11:45',0,NULL,NULL);
INSERT INTO `message` VALUES (145,0,0,0,10,'<010001724d4bdebd-51b94ba6-f765-4a23-8ca1-3f790c50eb63-000000@email.amazonses.com>','Academia.edu',NULL,'Final Day, Get 50% Off Premium: Make the Best of Uncertain Times','Dear Cadic,\r\r\n\r\r\nResearchers around the world are trying to make the best of unprecedented and uncertain times. Take advantage of Academia&rsquo;s full suite of Premium productivity and analytics tools.\r\r\n\r\r\nGet 50% Off Premium: https://www.academia.edu/keypass/K1Q3RHFqdmFmSUZwL3Jtb3VFZGxaUnQyRTY5SHlSM1EyT2VLdzcrMnJoWT0tLVkvYlFmQ2hTNUQ3bDdIRGVvRm90SkE9PQ==--b9ea97f91974492a017930e4797151781510ae8b/t/m9ZxJ-NSMJvFU-4wDj2/upgrade?premium_discount_coupon=MFZEPM&amp;trigger=seasonal_discount_second_email\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/K1Q3RHFqdmFmSUZwL3Jtb3VFZGxaUnQyRTY5SHlSM1EyT2VLdzcrMnJoWT0tLVkvYlFmQ2hTNUQ3bDdIRGVvRm90SkE9PQ==--b9ea97f91974492a017930e4797151781510ae8b/t/m9ZxJ-NSMJvFU-4wDj2/unsubscribe/premium_upsell\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-25 14:25:18',0,NULL,NULL);
INSERT INTO `message` VALUES (146,0,0,0,10,'<0100017250fa770f-d920ba3c-0929-46d7-bbc0-5bb8af8f44c4-000000@email.amazonses.com>','Academia.edu',NULL,'The name &quot;C. Tester&quot; is mentioned in a PDF by Michael Whittaker','Dear Cadic,\r\n\r\nThe name &quot;C. Tester&quot; is mentioned in a PDF by Michael Whittaker\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/RVVERnV2dmxqWEd6ektEcWwycDhEdnJuOHZEYUhVeDAxNHZ6ZkNNZ2IzST0tLWNlL2RiZFpENUVoODMxdXlmTlJYU3c9PQ==--298d45944097be5ca03a317796f3d11bd07f7374/t/m9ZxJ-NSSQh5s-qHUm8/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/RVVERnV2dmxqWEd6ektEcWwycDhEdnJuOHZEYUhVeDAxNHZ6ZkNNZ2IzST0tLWNlL2RiZFpENUVoODMxdXlmTlJYU3c9PQ==--298d45944097be5ca03a317796f3d11bd07f7374/t/m9ZxJ-NSSQh5s-qHUm8/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-26 07:34:52',0,NULL,NULL);
INSERT INTO `message` VALUES (147,0,0,0,10,'<010001725d0fb3c3-42b4b050-8aae-4ab6-9489-e41a45a1a76a-000000@email.amazonses.com>','Academia.edu',NULL,'A paper published by a member of the Computer Science and Informatics department at University College Dublin mentions the name &quot;C. Tester&quot;','Dear Cadic,\r\n\r\nA paper published by a member of the Computer Science and Informatics department at University College Dublin mentions the name &quot;C. Tester&quot;.\r\n\r\nFollow the link below to see your mentions:\r\n\r\nhttps://www.academia.edu/keypass/OEhodEw5YkZ0VHpKL0VMODZqOHBTRGs1RDd3dVlyL3ZXbGUvTFd6STlKcz0tLXJxaTcxV2YvM0tsV0ozazlSUWt6cUE9PQ==--e119c4f7fc35d2bb59233c1ef846f16dc9410d56/t/m9ZxJ-NS9ykqj-bgPWpr/upgrade?feature=searchm&amp;trigger=mentions_drip_dept_univ\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/OEhodEw5YkZ0VHpKL0VMODZqOHBTRGs1RDd3dVlyL3ZXbGUvTFd6STlKcz0tLXJxaTcxV2YvM0tsV0ozazlSUWt6cUE9PQ==--e119c4f7fc35d2bb59233c1ef846f16dc9410d56/t/m9ZxJ-NS9ykqj-bgPWpr/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-28 15:53:30',0,NULL,NULL);
INSERT INTO `message` VALUES (148,0,0,0,10,'<010001725d7b6d74-6d04c250-0f6c-4a80-b77a-2888c5cdb556-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 370th Mention! Get 50% off now. &ldquo;C. Tester&rdquo;: 1 new mention in a paper uploaded to Academia by someone in Pereira, Colombia','Dear cadic,\r\r\n\r\r\nCongratulations on your 370th Mention!\r\r\n\r\r\nAcademia recently discovered the name &ldquo;C. Tester&rdquo; mentioned in a paper uploaded by someone in Pereira, Colombia. View your mentions with 50% off Academia Premium when you upgrade in the next 2 days.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/bmhKQzNOM29PQm5uY2lMc3BibHlGeUszd0hMTys5cEZDc3UycW1wMk5vMD0tLThSYnBoeVIyT1R0bDdTOFlRV3gwdnc9PQ==--42cf003eaca9eeb9d4d4a2bbe31cf5982fd073ec/t/m9ZxJ-NS98H4P-bkA4My/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions-milestone-discounted\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/bmhKQzNOM29PQm5uY2lMc3BibHlGeUszd0hMTys5cEZDc3UycW1wMk5vMD0tLThSYnBoeVIyT1R0bDdTOFlRV3gwdnc9PQ==--42cf003eaca9eeb9d4d4a2bbe31cf5982fd073ec/t/m9ZxJ-NS98H4P-bkA4My/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-28 17:51:10',0,NULL,NULL);
INSERT INTO `message` VALUES (149,0,0,0,10,'<0100017262ee8b6b-84df969f-0a0b-4978-95cb-2c4fea469524-000000@email.amazonses.com>','Academia.edu',NULL,'&quot;C. Tester&quot;: Academia has found a Multidisciplinary paper mentioning the name &quot;C. Tester&quot;','Dear Cadic,\r\n\r\nAcademia has found a Multidisciplinary paper mentioning the name &quot;C. Tester&quot;\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/aStEOGdreUFZajRQMUFXZTlTc3BZcmhvcitIZnJWbE5YN2lyZm05Y2RIdz0tLXAvR2ExZ1dWOFV0ZjJ3WEtTK1Jrc0E9PQ==--d8852b8f1cc4d1a7a9084c2d3fe0687427bd6781/t/m9ZxJ-NThFUwc-boUFQ1/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/aStEOGdreUFZajRQMUFXZTlTc3BZcmhvcitIZnJWbE5YN2lyZm05Y2RIdz0tLXAvR2ExZ1dWOFV0ZjJ3WEtTK1Jrc0E9PQ==--d8852b8f1cc4d1a7a9084c2d3fe0687427bd6781/t/m9ZxJ-NThFUwc-boUFQ1/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-29 19:15:01',0,NULL,NULL);
INSERT INTO `message` VALUES (150,0,0,0,10,'<0100017267ee2a3e-ad30a909-bbc1-4e12-a4ab-8462c3dc6d02-000000@email.amazonses.com>','Academia.edu',NULL,'&quot;C. Tester&quot;: 2 new mentions, including one in an Agronomy and Crop Science paper','Dear Cadic,\r\n\r\nThe name &quot;C. Tester&quot; was mentioned in 2 PDFs recently found by Academia, including an Agronomy and Crop Science paper.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/ZEFkUW1LdHlaWUQzOGV6T0FJKzdvTDJrWUM2Yzd0V2RkdTlTZEhlUitZTT0tLU42bnNaanowa1VBME1BZGxTS2FJRFE9PQ==--6080c0dde4af56925499241b63209f9924a0be89/t/m9ZxJ-NTpBduz-begye7/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/ZEFkUW1LdHlaWUQzOGV6T0FJKzdvTDJrWUM2Yzd0V2RkdTlTZEhlUitZTT0tLU42bnNaanowa1VBME1BZGxTS2FJRFE9PQ==--6080c0dde4af56925499241b63209f9924a0be89/t/m9ZxJ-NTpBduz-begye7/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-30 18:32:42',0,NULL,NULL);
INSERT INTO `message` VALUES (151,0,0,0,10,'<010001726d0093b3-d29fe2ec-4790-461c-ac8c-f89a54204725-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 375th Mention! The name &quot;C. Tester&quot; has 2 new mentions','Dear Cadic,\r\n\r\nCongratulations on your 375th Mention!\r\n\r\nWe recently found 2 papers that mention &quot;C. Tester&quot;, including one written by Charles Darkoh.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/K3FmNktJMXkvNWtaS3RrMjczeStaaWZBODZERG50QnpDdzg1SEhEUnlLST0tLVZVQ2lvS2wyMXNocGx5b0Ric01Idmc9PQ==--aa961e8b6ac9f201a0d403f515c6a07f725c432e/t/m9ZxJ-NTwCxxY-5PSEj/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/K3FmNktJMXkvNWtaS3RrMjczeStaaWZBODZERG50QnpDdzg1SEhEUnlLST0tLVZVQ2lvS2wyMXNocGx5b0Ric01Idmc9PQ==--aa961e8b6ac9f201a0d403f515c6a07f725c432e/t/m9ZxJ-NTwCxxY-5PSEj/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-05-31 18:10:54',0,NULL,NULL);
INSERT INTO `message` VALUES (152,0,0,0,10,'<01000172721cbc2c-357873ee-5aa0-4ece-8fc0-966d67ab9ecd-000000@email.amazonses.com>','Academia.edu',NULL,'The name &quot;C. Tester&quot; is mentioned in a PDF by X. Wang','Dear Cadic,\r\n\r\nThe name &quot;C. Tester&quot; is mentioned in a PDF by X. Wang\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/V0dUWU5DTWZhek5IL2NFdXhtazJweGtzdmw0RFkzZDdaSGg4SzBYd2dEdz0tLUhEZ2F4b0wwZnVCVXdDNFFybkU3cVE9PQ==--2113cbfe49baf4d29a574052d1a37592bfa53c95/t/m9ZxJ-NTDGY50-k32TW/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/V0dUWU5DTWZhek5IL2NFdXhtazJweGtzdmw0RFkzZDdaSGg4SzBYd2dEdz0tLUhEZ2F4b0wwZnVCVXdDNFFybkU3cVE9PQ==--2113cbfe49baf4d29a574052d1a37592bfa53c95/t/m9ZxJ-NTDGY50-k32TW/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-01 17:59:45',0,NULL,NULL);
INSERT INTO `message` VALUES (153,0,0,0,10,'<010001727279d029-2e41b37a-3207-4ede-a789-bb2d264e707d-000000@email.amazonses.com>','Academia.edu',NULL,'12 Hours Left, Get 50% Off Premium: Make the Best of Uncertain Times','Dear Cadic,\r\r\n\r\r\nGet 50% off Academia Premium, this week only.\r\r\n\r\r\nResearchers around the world are trying to make the best of unprecedented and uncertain times. Take advantage of Academia&rsquo;s full suite of Premium productivity and analytics tools.\r\r\n\r\r\nCadic&#039;s Personal 50% Off Discount Link: https://www.academia.edu/keypass/Y1FsY1dqdkNSby9PTmdGbGJKTkJENzgwdlNZaTAvMFp4T3NkcU1XL2s1MD0tLUpob2VpczZES0RCTXFKRXpJbUl5V2c9PQ==--871ea4d42dc320fa74980306d97445cc76ced612/t/m9ZxJ-NTEcERg-Jf2s7/upgrade?premium_discount_coupon=MFZEPM&amp;trigger=seasonal_discount_third_email\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Y1FsY1dqdkNSby9PTmdGbGJKTkJENzgwdlNZaTAvMFp4T3NkcU1XL2s1MD0tLUpob2VpczZES0RCTXFKRXpJbUl5V2c9PQ==--871ea4d42dc320fa74980306d97445cc76ced612/t/m9ZxJ-NTEcERg-Jf2s7/unsubscribe/premium_upsell\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-01 19:41:26',0,NULL,NULL);
INSERT INTO `message` VALUES (154,0,0,0,10,'<01000172774f90de-559751bd-4685-4c58-9387-b9221680f431-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 380th Mention! &quot;C. Tester&quot;: 5 new mentions, including one in a General Medicine paper','Dear Cadic,\r\n\r\nCongratulations on your 380th Mention!\r\n\r\nThe name &quot;C. Tester&quot; was mentioned in 5 PDFs recently found by Academia, including a General Medicine paper.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/bVdJdkExMERzMHdhSGN6d0tyM0hlVnhRRkx3ZUE3VzN6OWJ4NWlWUGZQOD0tLVRkM2RwL2x0Y25QV294S3JDSmlid2c9PQ==--390e0cafe4678dd1d39db4618053b3ca9a4fb861/t/m9ZxJ-NTLUDgh-bqAdhN/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/bVdJdkExMERzMHdhSGN6d0tyM0hlVnhRRkx3ZUE3VzN6OWJ4NWlWUGZQOD0tLVRkM2RwL2x0Y25QV294S3JDSmlid2c9PQ==--390e0cafe4678dd1d39db4618053b3ca9a4fb861/t/m9ZxJ-NTLUDgh-bqAdhN/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-02 18:13:23',0,NULL,NULL);
INSERT INTO `message` VALUES (155,0,0,0,12,'<0f306c7384f9012c8a301e9e2cf38cd7d956ee55dd10a6605d86a06b3f13c8da@m.meistertask.com>','MeisterTask',NULL,'Welcome to MeisterTask',' \n\n \t\t [MeisterTask Logo ] \n\n WELCOME CADIC, GREAT TO HAVE YOU! \n\n KANBAN BOARDS, SOFTWARE SPRINTS, FUNNELS OR SIMPLE TO-DO\nLISTS&mdash;MEISTERTASK LETS YOU CREATE THE PERFECT WORKFLOW FOR YOUR TEAM\nAND GET MORE DONE, TOGETHER. \n\nCreate My First Project\n[https://email.m.meistertask.com/c/eJxljTFuwzAMRU9jjwYlSjI1aMjSaxQUSSVCbTSIVfj6dbsGeNN7wP9aqs9BZO4FGkKSFSm0DM4LMYKzbF4akuiqOSazGFUdcEoQlRJDqtgcCilPAfZlt34Mew0-vhb53udHwbD6FkJNBMoaDFuWCEi1eqfJu3krjzGex4S3yX9cnOf5NvMqwtplGfanr6f7zn37Tz8lUAICWOdRTtsuZ5-Vjy6_8TJD8g]\n\n GET ORGANIZED \n\nCreate your perfect workflow by adding and naming sections in your\nprojects. Create tags for tasks to bring even more order into your\nprojects.\nLearn more\n[https://email.m.meistertask.com/c/eJwdjbtug0AQRb8GSjTL7Itii8iRmzT-A2t2ZjYggxyZJch_H4h0m3uKcyTlfrDM7ZSgIHgOGG0ZwPQcCcHooD0XjCxBBudVnRMxQN6Dk-gJfMZikKNQY2HpFp3Wqq9K66Pj59KOCTn7SOyKBHRSgiHoo1prYhZ_3HZOY60_a4MfTX89tu97935udct6Kk5ClccGr78Nfs63u9VA49fl0b4Sk0zcVT2bR_97oWn-727JRg8RILQ17TofTO-Z1on_ABJVStA]\n\n\n WORK TOGETHER \n\nInvite colleagues, clients and externals to collaborate in real-time.\nMeisterTask ensures perfect transparency and efficient communication.\nLearn more\n[https://email.m.meistertask.com/c/eJxdTkFuxCAQe83mRjRAQsiBw16q9hUVGSYNbRIQTLrq78v2WMmyLVuacXCLmgfELjpYNRictB3WGaRC6zVImknhqi2GKcyjIRrHECR4Y2AM1ngwi16lRhv8bYCjPyhWpsK-fvWYjm5zEsDOaiWcrbejNjiQCbgoWtBrmlS3u40515u-39RLQ71yToX_n2rNho3oFFdt6gtH3OlpFSirpZmkeE0Pgf4UbyKe35FJJN6oiEwp7yQ4ieNH5JI-CVl0xaEPEXum5582_-Pwcf-bfbnBGrAAU8fuQXvL6H3xNeIvejtg8Q]\n\n\n AUTOMATE &amp; CONNECT \n\nIntegrate MeisterTask with the tools you already use and love, such as\nSlack, Zendesk, GitHub, MindMeister and many others.\nLearn more\n[https://email.m.meistertask.com/c/eJxdjTtuwzAQRE8jlsLyvyxYpMk1gtVyaROR7EBkoOubThlgqoeZeSVvJjlm1TJUC4GjRVcTaMNIFrQkMVwtcokl-SDifSkaKATwBQNB2GzVlrHQ4uBYD2l9yDmof6_8PNQ9exdKJb-h1nMVIjLpxAmsqRwdotrzfYyfvtiPxXzOXNf1_2bS9hhyO2m056OrMzOVxuuQd2uKbwe1_U_4mx0GQICoRr5kn0y-NuqNXzBpSY0]\n\n\n IMPORT FROM TRELLO OR ASANA \n\nBy the way, if you&rsquo;ve been using Trello or Asana before, you can\nimport all your existing projects and tasks automatically!\n\nImport project\n[https://email.m.meistertask.com/c/eJxdjr1uxSAMRp8m2YgMhL-B4S5Vu3eviDENanITAdF9_ZKOlSz702fp6ES_CDcjjtlDkqDRSDsnB1ygDRI4ORKYpMVoolOaSKkYOQStQUWrA-hFJi7RxjDMsE875dqotFB_Jjz2cfWRrNNKdjjxWXEyzklnHETDTQKjxs2vrZ11kI9BvPWp13kepf1H9c-KfdGTXbXfUFrGje4oQIJ0chbs_XgxDE_2wfJ-Q9hyhBIrS-XY2WehbTvYWDyGmHFqdPO79vce8vane_nZarAAZmz-RVvv6GsJNeMvlflcpg]\n\n CHEERS, \n\n&copy; 2020 MeisterLabs GmbH\nZugspitzstrasse 2\n85591 Vaterstetten \nGermany\n\nImprint\n[https://email.m.meistertask.com/c/eJxdjTsOwjAQBU8Tl9H6m03hgoZrIHt3DRYxoMQo1ydQIr1q9DTDMZvZEakaoVgINFl0ZQZtCJMFLbMYKhaJJ559EPGeWUMKATxjSBCyLdoSchoctLFJ3bqsPW33kZ5N3SIhARrOUgplzUVnE4ydnBCjRl_UEm-9vwZ7Gsz52L7v_5aD1vZa66OrNVLiSmOX7-FIXluqyy_1jg4DIMCketxlOZhcctoqfQDcpkgY]\n| Unsubscribe\n[https://email.m.meistertask.com/c/eJw1j9tqxDAMRL8meQzy3X7IQ6Hsbyy2JHfNbi7EXkL_vk5pQSA4w4w0NCcZNOJYZsgKLDrldQ4gJPqoQHBgiVl5JEfBWGZjiAREa8GQtxFsUlko9BQHDcu0cKmNjxbrc8JtGR-z8N3KUvoAjntYci4zO-MMZdIujK_50dpeB_UxyFuf8zynpaz0F3XFdPqufNRrr_WdKh4l8X3dWskFYyvb2iXtLXgAN6hb-955UJ_7sS3bpXanbduT1w6j9RKMzpmE90lzEAmNTyZYDkZGIpt0coDjMWOkglPj649e72uJ5fVb6z3_HxvbfPKrM76nWAv-ACCaafM]\n\n',1,'2020-06-03 04:27:50',0,NULL,NULL);
INSERT INTO `message` VALUES (156,0,0,0,10,'<010001727c7feb9b-a5b2d6fc-66e3-418f-8dad-4435d7c5db74-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 385th Mention! &quot;C. Tester&quot;: 5 new mentions, including one in a General Business, Management and Accounting paper','Dear Cadic,\r\n\r\nCongratulations on your 385th Mention!\r\n\r\nThe name &quot;C. Tester&quot; was mentioned in 5 PDFs recently found by Academia, including a General Business, Management and Accounting paper.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/UEJOczVzOE1OYmxXMkdNZGtZd0g3UmlaZGNhZzMydllrNTRneDU2UmNrbz0tLUhKYlU5V3FHY1JCR29vZHFCT0J5Q1E9PQ==--3ab3b772ab2370ca25f60a6fe986277a414f0d23/t/m9ZxJ-NTT5vST-bbJXWs/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/UEJOczVzOE1OYmxXMkdNZGtZd0g3UmlaZGNhZzMydllrNTRneDU2UmNrbz0tLUhKYlU5V3FHY1JCR29vZHFCT0J5Q1E9PQ==--3ab3b772ab2370ca25f60a6fe986277a414f0d23/t/m9ZxJ-NTT5vST-bbJXWs/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-03 18:24:19',0,NULL,NULL);
INSERT INTO `message` VALUES (157,0,0,0,10,'<0100017281bce234-563ba53f-4c02-4192-b215-3c17401895ad-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 395th Mention! &quot;C. Tester&quot;: 10 new mentions, including one in a General Business, Management and Accounting paper','Dear Cadic,\r\n\r\nCongratulations on your 395th Mention!\r\n\r\nThe name &quot;C. Tester&quot; was mentioned in 10 PDFs recently found by Academia, including a General Business, Management and Accounting paper.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/eEl4UEhBVXBtVS9RRkhVTUVwTnNocTJsQlF6cFpOMHdpRXVweUlIMnNyZz0tLU56MllTcEkxM2dsUFJDYlBITU45Y0E9PQ==--9bfe7c06a64a0689233d1cfa9c5224edfa9d2ba8/t/m9ZxJ-NT1kpPP-xNP2b/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/eEl4UEhBVXBtVS9RRkhVTUVwTnNocTJsQlF6cFpOMHdpRXVweUlIMnNyZz0tLU56MllTcEkxM2dsUFJDYlBITU45Y0E9PQ==--9bfe7c06a64a0689233d1cfa9c5224edfa9d2ba8/t/m9ZxJ-NT1kpPP-xNP2b/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-04 18:49:00',0,NULL,NULL);
INSERT INTO `message` VALUES (158,0,0,0,10,'<0100017286e77105-258e755a-e2c4-436c-aa3f-b1fbda352063-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 400th Mention! &ldquo;C. Tester&rdquo;: The name &ldquo;C. Tester&rdquo; was mentioned in 6 PDFs recently found by Academia, including one written by L. Elia.','Dear Cadic,\r\r\n\r\r\nCongratulations on your 400th Mention!\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 6 PDFs recently found by Academia, including one written by L. Elia.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/M0xkNWUyZkovdVJPUkVEaHJHTFRUN3JnS1dRUG9qRmZoazhlT0NJSFM2cz0tLWxkZEdBRklneDMrSkpLYnNHQm0ySnc9PQ==--fbd80abf8d96a18b9cffda2e7c536daa18fcabe8/t/m9ZxJ-NT8urq2-26pUG/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/M0xkNWUyZkovdVJPUkVEaHJHTFRUN3JnS1dRUG9qRmZoazhlT0NJSFM2cz0tLWxkZEdBRklneDMrSkpLYnNHQm0ySnc9PQ==--fbd80abf8d96a18b9cffda2e7c536daa18fcabe8/t/m9ZxJ-NT8urq2-26pUG/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-05 18:53:35',0,NULL,NULL);
INSERT INTO `message` VALUES (159,0,0,0,10,'<010001728c11443e-a4f5abfe-c958-47a9-ab3a-825deeb10a81-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 405th Mention! &ldquo;C. Tester&rdquo;: The name &ldquo;C. Tester&rdquo; was mentioned in 3 PDFs recently found by Academia, including one written by Borsali Amine Habib.','Dear Cadic,\r\r\n\r\r\nCongratulations on your 405th Mention!\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 3 PDFs recently found by Academia, including one written by Borsali Amine Habib.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ejl4TTdhSDFVWlR2Z1NSeWJSU3poWGVTSE9MQ3UwK0xWVDVuMEVVOWF0RT0tLU9jQTJGRUZJaytaQjZIU2owWmdvT3c9PQ==--3067b34bcdc272b7c836d8170ccafddf73438047/t/m9ZxJ-NUfDd5D-QgAjW/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ejl4TTdhSDFVWlR2Z1NSeWJSU3poWGVTSE9MQ3UwK0xWVDVuMEVVOWF0RT0tLU9jQTJGRUZJaytaQjZIU2owWmdvT3c9PQ==--3067b34bcdc272b7c836d8170ccafddf73438047/t/m9ZxJ-NUfDd5D-QgAjW/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-06 18:57:22',0,NULL,NULL);
INSERT INTO `message` VALUES (160,0,0,0,10,'<01000172913ceeb9-5d854bf1-8c07-495f-a0de-2efc1694f87f-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: The name &ldquo;C. Tester&rdquo; was mentioned in 1 PDF recently found by Academia, including one written by Aditya Sharma.','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 1 PDF recently found by Academia, including one written by Aditya Sharma.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/WE1weTZhK3hqbTV6Mi9zZTRFaEEzWGw4WDVWbk9XTnRVekpXZks3RnJYOD0tLUYvV0oyQ0RiblFxTFp6b3h3RFlUaHc9PQ==--8c32f231b3385e7d10bc8868abd3aef57672bd72/t/m9ZxJ-NUnNBnQ-M6Tuo/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/WE1weTZhK3hqbTV6Mi9zZTRFaEEzWGw4WDVWbk9XTnRVekpXZks3RnJYOD0tLUYvV0oyQ0RiblFxTFp6b3h3RFlUaHc9PQ==--8c32f231b3385e7d10bc8868abd3aef57672bd72/t/m9ZxJ-NUnNBnQ-M6Tuo/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-07 19:03:10',0,NULL,NULL);
INSERT INTO `message` VALUES (161,0,0,0,10,'<01000172966c3e46-7061080d-caa7-4743-84a2-4dd2e068f22c-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: 2 new mentions, including one in a Physiology (medical) paper','The name &ldquo;C. Tester&rdquo; was mentioned in 2 PDFs recently found by Academia, including a Physiology (medical) paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/b0JsT2FrUDkxcmpubE9KMG0wMU9wRDVQbFpXNGI5TEdIYm5VVWFPNmcyRT0tLUlhTnplUmJyZjRxWllpRFlCMHR2aGc9PQ==--8f23234ca1604fd66bb609fdfc2103bff975c340/t/m9ZxJ-NUuY9ty-bw0pu4/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/b0JsT2FrUDkxcmpubE9KMG0wMU9wRDVQbFpXNGI5TEdIYm5VVWFPNmcyRT0tLUlhTnplUmJyZjRxWllpRFlCMHR2aGc9PQ==--8f23234ca1604fd66bb609fdfc2103bff975c340/t/m9ZxJ-NUuY9ty-bw0pu4/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-08 19:12:56',0,NULL,NULL);
INSERT INTO `message` VALUES (162,0,0,0,13,'<5edf2b808547_2022afbc2bea710145401b.sidekiq-frequent-fd-poduseast1-main2-green-5b568f4c87-zz9pf@ema','DbVis Software - Sales',NULL,'Re: [#39225] Extend evaluation: cadic.tester@gmail.com','Hi Cadic,       Thanks for your interest in DbVisualizer!     Please share some details about your evaluation and the reason you need to extend your testing.    What do&nbsp;you plan to achieve with the extended evaluation period?   What is the primary intended usage?   How many user licenses are you considering to purchase?   Your real name and company affiliation, if applicable?    Once we have established your evaluation needs, we will be able to grant an extended evaluation period.     If you, on the other hand, are already using DbVisualizer in a production setting, you will need to get your commercial DbVisualizer Pro license(s) at http://www.dbvis.com/purchase/.             Kind Regards,&nbsp;     Sandra     ---  Sandra Bj&auml;revall  DbVis Software AB  Stockholm, Sweden  http://www.dbvis.com     Our products help over 20,500 customers in 129 countries   \r\n             \r\n              On\r\n              Tue, 9 Jun at  8:24 AM\r\n              ,  Cadic.tester &lt;cadic.tester@gmail.com&gt;  wrote:\r\n                Who --------------------------------------------------------\r\n   First Name:   andres\r\n   Last Name:    diez\r\n   Email:        cadic.tester@gmail.com\r\n\r\nDescription ------------------------------------------------\r\n\r\nme encanta la aplicacion y la utilizo para uso personal\r\n\r\nApplication Properties -------------------------------------\r\n\r\nProduct: DbVisualizer Free 9.5.8 [Build #2751]\r\nOS: Linux\r\nOS Version: 4.15.0-101-generic\r\nOS Arch: amd64\r\nJava Version: 1.8.0_252\r\nJava VM: OpenJDK 64-Bit Server VM\r\nJava Vendor: Private Build\r\nJava Home: /usr/lib/jvm/java-8-openjdk-amd64/jre\r\nDbVis Home: /media/koyote/disko/SINERGIA/programas/DbVisualizer9\r\nUser Home: /home/koyote\r\nPrefsDir: /home/koyote/.dbvis\r\nSessionId: 824\r\nBindDir: null\r\nFLI: 2020-05-05 / #1 [2020-05-28, expired] [&quot;Evaluation&quot;]\r\nJava Properties: -Dinstall4j.jvmDir=/usr/lib/jvm/java-8-openjdk-amd64/jre -Dexe4j.moduleName=/media/koyote/disko/SINERGIA/programas/DbVisualizer9/dbvis -Ddbvis.home=/media/koyote/disko/SINERGIA/programas/DbVisualizer9/ -Dinstall4j.launcherId=2 -Dinstall4j.swt=false -Di4jv=0 -Di4jv=0 -Di4jv=0 -Di4jv=0 -Di4jv=0 -Xmx512m -XX:StringTableSize=1000003 -XX:CompileCommand=exclude,javax/swing/text/GlyphView,getBreakSpot -Dsun.locale.formatasdefault=true -Dsun.java2d.xrender=false -Di4j.vpt=true\r\nLook and Feel: SyntheticaStandardLookAndFeel\r\nScreen 1: size: 1366 x 768, refresh rate: 60, bit depth: -1\r\nScreen 2: size: 1366 x 768, refresh rate: unknown, bit depth: -1\r\nMonitor Running: No\n\n',1,'2020-06-09 01:26:10',0,NULL,NULL);
INSERT INTO `message` VALUES (163,0,0,0,10,'<010001729ba4ca4d-9dfd1566-f999-4dc1-8ec7-e068598526c5-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: You just hit your 410th Mention!','Congratulations on your 410th Mention!\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 4 PDFs recently found by Academia, including one written by University of the State of New York,.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VlFwKzhoTmVKME9EVHdxb0lJUmttK3FwTEQxODBPcEcwWHl5R3RaQlgzUT0tLXFZbytrRHVYOTVhMmsyK1U3Z21XUEE9PQ==--fe26675113088217541573e22d297216154d5a67/t/m9ZxJ-NUCcC35-8TTkj/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VlFwKzhoTmVKME9EVHdxb0lJUmttK3FwTEQxODBPcEcwWHl5R3RaQlgzUT0tLXFZbytrRHVYOTVhMmsyK1U3Z21XUEE9PQ==--fe26675113088217541573e22d297216154d5a67/t/m9ZxJ-NUCcC35-8TTkj/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-09 19:32:48',0,NULL,NULL);
INSERT INTO `message` VALUES (164,0,0,0,10,'<01000172a00a087d-560b4d27-69a4-4e9c-9387-04c74ec6437f-000000@email.amazonses.com>','Academia.edu',NULL,'Last Chance, Get 50% Off Premium','Dear Cadic,\r\r\n\r\r\nThis is your last chance to get 50% off Academia Premium.\r\r\n\r\r\n\r\r\nCadic&#039;s Personal 50% Off Discount Link ?: https://www.academia.edu/keypass/VE9aakx3QnlCbmpIUkhaOTByU3RmdUFzaWE5NmxHV2xDaFdiOTJQSDJaTT0tLW11Q21iRkc4MmMyeU9FeStlZEFoanc9PQ==--1b6a5f90af0cab3fa36f2e897ed1f4fdbec0415a/t/m9ZxJ-NUJhGgg-bp1tYj/upgrade?premium_discount_coupon=MFZEPM&amp;trigger=seasonal_discount_fourth_email\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VE9aakx3QnlCbmpIUkhaOTByU3RmdUFzaWE5NmxHV2xDaFdiOTJQSDJaTT0tLW11Q21iRkc4MmMyeU9FeStlZEFoanc9PQ==--1b6a5f90af0cab3fa36f2e897ed1f4fdbec0415a/t/m9ZxJ-NUJhGgg-bp1tYj/unsubscribe/premium_upsell\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-10 16:01:52',0,NULL,NULL);
INSERT INTO `message` VALUES (165,0,0,0,10,'<01000172a10a4a33-ddeaa7bd-125b-4cae-be68-44ca0928dc15-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: You just hit your 415th Mention!','Congratulations on your 415th Mention!\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 5 PDFs recently found by Academia, including a General Biochemistry, Genetics and Molecular Biology paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/OEU5S3gveTliNTUyQWVLZ2VMSlFmRmpZZVNtVUFuRnVrYktOT21ldTg4QT0tLVgxRys0eDNHOHF4WTA3UnBPTnhqcVE9PQ==--587dc7149ebe0e0414c6012a33a230aa21c62df6/t/m9ZxJ-NUKFtoU-HaEyF/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/OEU5S3gveTliNTUyQWVLZ2VMSlFmRmpZZVNtVUFuRnVrYktOT21ldTg4QT0tLVgxRys0eDNHOHF4WTA3UnBPTnhqcVE9PQ==--587dc7149ebe0e0414c6012a33a230aa21c62df6/t/m9ZxJ-NUKFtoU-HaEyF/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-10 20:41:47',0,NULL,NULL);
INSERT INTO `message` VALUES (166,0,0,0,14,'<4bf073f3a13c8d1967979c85ce512078ae03ad7a-20124285-110775979@google.com>','Google Analytics',NULL,'Important updates about the attribution window in Google Analytics App + Web properties','Dear Partner,\r\nWe are currently making changes to the infrastructure that powers  \r\nattribution reporting in Google Analytics App + Web properties. This new  \r\ninfrastructure will support more robust attribution features and services  \r\nincluding more diversified data sources, models and identity methods.\r\nCurrently the attribution window for all re-engagement conversions (all  \r\nconversions except first open) in App + Web properties is set to 180 days.  \r\nAs part of the infrastructure migration, starting June 29th, we will be  \r\nchanging this attribution window for all re-engagement conversions from 180  \r\ndays to 90 days. This change is automatic and requires no action on your  \r\npart. Changing the attribution window from 180 days to 90 days in App + Web  \r\nproperties will create consistency with the maximum attribution window in  \r\nGoogle Ads.\r\nThis change could result in more conversions being attributed to a &ldquo;direct&rdquo;  \r\nsource in reporting for some advertisers but we expect the impact to be  \r\nminimal for most. We hope that these improvements to attribution and  \r\nconsistency across Google products means you will get the best use of your  \r\nApp + Web property and Google Ads integration via better campaign  \r\nperformance analysis and improved optimization.\r\nThanks,\r\nThe Google Team\r\nGoogle LLC 1600 Amphitheatre Parkway, Mountain View, CA 94043\r\nYou have received this mandatory email service announcement to update you  \r\nabout important changes to your Google product or account.\n\n',1,'2020-06-10 22:21:34',0,NULL,NULL);
INSERT INTO `message` VALUES (167,0,0,0,10,'<01000172a65fc491-bc3ded62-3bfe-4627-b8b5-c4337eb36617-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 420th Mention! &ldquo;C. Tester&rdquo;: 6 new mentions, including one in an Ecology, Evolution, Behavior and Systematics paper','Dear Cadic,\r\r\n\r\r\nCongratulations on your 420th Mention!\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 6 PDFs recently found by Academia, including an Ecology, Evolution, Behavior and Systematics paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Q3ZkZlhMREJtYk04MGtVRVR4WWpoM0VRa2loT2oyWlNQcml2Y2d4SjIxdz0tLXMxa0kzVjgyM1FMbWtyZVo3OHloVmc9PQ==--62e3c97a4bd702d70d26ae760a7ee616a16e69ad/t/m9ZxJ-NUS4bSz-8LXk2/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Q3ZkZlhMREJtYk04MGtVRVR4WWpoM0VRa2loT2oyWlNQcml2Y2d4SjIxdz0tLXMxa0kzVjgyM1FMbWtyZVo3OHloVmc9PQ==--62e3c97a4bd702d70d26ae760a7ee616a16e69ad/t/m9ZxJ-NUS4bSz-8LXk2/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-11 21:33:14',0,NULL,NULL);
INSERT INTO `message` VALUES (168,0,0,0,10,'<01000172ab72a737-c82492f0-0599-405e-a823-8ada55d47aba-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: You just hit your 425th Mention!','Congratulations on your 425th Mention!\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 5 PDFs recently found by Academia, including a Public Health, Environmental and Occupational Health paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ZE4xOFhxU2JQSGhVQ1FIV2JKUmNDYVNHekg3ZVJYWWx3dVhDcWhoa1JFbz0tLUgraVh1dHN0QTFTNVphTlBMQlZvbkE9PQ==--15cb05eeaa0ecc7a6d6f4cc5777e33b76bb92e96/t/m9ZxJ-NUZ5EEX-QHtPt/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ZE4xOFhxU2JQSGhVQ1FIV2JKUmNDYVNHekg3ZVJYWWx3dVhDcWhoa1JFbz0tLUgraVh1dHN0QTFTNVphTlBMQlZvbkE9PQ==--15cb05eeaa0ecc7a6d6f4cc5777e33b76bb92e96/t/m9ZxJ-NUZ5EEX-QHtPt/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-12 21:11:58',0,NULL,NULL);
INSERT INTO `message` VALUES (169,0,0,0,12,'<bf61a209613da50cc494a667add18401e67a459562648202572eec3e3608e3c5@m.meistertask.com>','MeisterTask',NULL,'Tip: Create tasks directly from your inbox!',' \n\n \t\t [MeisterTask Logo ] \n\nTurn emails into tasks in seconds with this handy trick...\n\n MEISTERTIP:TURN EMAILS INTO TASKS \n\n WITH THIS HANDY TRICK, YOU CAN FINALLY GET ON TOP OF YOUR INBOX AND\nENSURE THAT IMPORTANT TO-DOS WON&#039;T GET LOST AMONG THE SPAM! \n\nLearn more\n[https://email.m.meistertask.com/c/eJxdUEGOwyAMfE1yS0UMOOTAYaVVvxE5QFO0IakCUb-_QHvoroTwaOyZsWz1DKMwpvV6vmFPwEbsuSXJjBGjIMSBrO2VYL3LUMhRIqBQwEAO4JzhjiNTjhvZCBYuwfmY3JEo_lzMHtq7Bkk0SqUA-WAtuyFKZBb7OeMBlGhXfU_pERv-1cA1v-fz-d8ms_O6L7kA64dcGFScP9HlwUfs0t6l89j8tnQukF9j57fMkUl-32heXVfMYong1zOFKe7nYVzDvz-yGsDSCs76M-RWdXqThsKD_LJlugQ1IIG9kiosaRW8Y_D4VHxkvNary_7ZtOraQxuy3lySK_P5pEsZqac8tVD51IwNbdJVOaV9KrJpo2Vxxy_iNZX5]\n\n\nHello cadic,\n\nDid you know that each section in a MeisterTask project has its very\nown email address? If you save such an address in your contacts, you\ncan quickly forward any email you receive to the corresponding\nsection, turning it into a fully-fledged task with a description,\ntags, attachments and more.\n\nMany emails are tasks in disguise. With this trick, you&rsquo;ll ensure\nthat these tasks are added to your workflow and dealt with\nefficiently. Learn more\n[https://email.m.meistertask.com/c/eJxdUEGOwyAMfE1yS0UMOOTAYaVVvxE5QFO0IakCUb-_QHvoroTwaOyZsWz1DKMwpvV6vmFPwEbsuSXJjBGjIMSBrO2VYL3LUMhRIqBQwEAO4JzhjiNTjhvZCBYuwfmY3JEo_lzMHtq7Bkk0SqUA-WAtuyFKZBb7OeMBlGhXfU_pERv-1cA1v-fz-d8ms_O6L7kA64dcGFScP9HlwUfs0t6l89j8tnQukF9j57fMkUl-32heXVfMYong1zOFKe7nYVzDvz-yGsDSCs76M-RWdXqThsKD_LJlugQ1IIG9kiosaRW8Y_D4VHxkvNary_7ZtOraQxuy3lySK_P5pEsZqac8tVD51IwNbdJVOaV9KrJpo2Vxxy_iNZX5]\n\n CHEERS, \n\n&copy; 2020 MeisterLabs GmbH\nZugspitzstrasse 2\n85591 Vaterstetten \nGermany\n\nImprint\n[https://email.m.meistertask.com/c/eJxdjr1uwzAQg5_GGg39nM7WoKFLXsOQ7k6O0CgJHBV-_codC3AgCOIjOWYbgEjVmAuaZHVA4zh5TQQBEuKSmM0K2siw4INHi7Babf1iRciJQ72KIz-BbnOT-uly9PT5nunV1D1mQQY2ueRCDtlZToEEiZ0pA1fUI957f0_ua7K3ofM8_1NGWtv7qM-ujkiJK81drsKY3Fuqj7-pnwjruKL1onqUK976a7sY2zPtuxy_a_tKaQ]\n| Unsubscribe\n[https://email.m.meistertask.com/c/eJw1j9uKwzAMRL8meQyOL4r94IeF0t8Itiy3ps2FWKHs36-z7IJAYgQzc5KP0mnEvviYYQxSOBhVCkYgaqcDwBRSGq0WI7VTG2dAgrZSSDNJIlSkQFhSaDotlmGhUpkODvU14Lb0T69iSjJO6GKgjNjsYguUOWtAC2nq3_7JvNdOfXXy3ubz-QxLWdOf1WXT1LPSUa-91jNWPEqked245IKBy7a2l7atiRBTp-78vVOnbvuxpRN55tL8JfD2orXJAVp_o3NuYDZqcmNEY6NxQM7IxgtRx0lgf3gMqeDAdDVpgI8llPcv2On_43r2dMkzb_PFPa_h8aDjB-aPbbA]\n\n',1,'2020-06-13 10:45:39',0,NULL,NULL);
INSERT INTO `message` VALUES (170,0,0,0,10,'<01000172b079c922-979ae66b-3071-4b75-a785-871cebe7c16a-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: You just hit your 430th Mention!','Congratulations on your 430th Mention!\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 4 PDFs recently found by Academia, including one written by Office of Scientific and Technical Information  (OSTI).\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VFNONDhycEFtY0dzcmNYQVYzUUdZeUZQR0traGRqVFJ5V00zbTRZSUdmOD0tLUNPb0ZvaDF6TERLdDZXdVB4WVFPbVE9PQ==--6dfa0f959447b4074187a6928916db44ba916dd4/t/m9ZxJ-NU63opb-fqY9u/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VFNONDhycEFtY0dzcmNYQVYzUUdZeUZQR0traGRqVFJ5V00zbTRZSUdmOD0tLUNPb0ZvaDF6TERLdDZXdVB4WVFPbVE9PQ==--6dfa0f959447b4074187a6928916db44ba916dd4/t/m9ZxJ-NU63opb-fqY9u/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-13 20:37:51',0,NULL,NULL);
INSERT INTO `message` VALUES (171,0,0,0,10,'<01000172b5a67473-22311844-99f1-4e4e-9f32-86bffddc90e8-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: You just hit your 435th Mention!','Congratulations on your 435th Mention!\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 4 PDFs recently found by Academia, including one written by Rafael Gustavo Ferreira Morales.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/SXppSGVaS3BNSXBTOXFWdnloUXBFdjhwSjZnSWpJQXBVeXlQWnAvOHpjND0tLUcva01hV3FiTGNuWW9VSFpzNHZKV2c9PQ==--ed71c5911c413d61e32c3b8ef96121f34b88a304/t/m9ZxJ-NVec5CP-qHeUB/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/SXppSGVaS3BNSXBTOXFWdnloUXBFdjhwSjZnSWpJQXBVeXlQWnAvOHpjND0tLUcva01hV3FiTGNuWW9VSFpzNHZKV2c9PQ==--ed71c5911c413d61e32c3b8ef96121f34b88a304/t/m9ZxJ-NVec5CP-qHeUB/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-14 20:44:45',0,NULL,NULL);
INSERT INTO `message` VALUES (172,0,0,0,10,'<01000172b932e950-da07a0b6-2da0-489b-86c9-f2c6be239f21-000000@email.amazonses.com>','Academia.edu',NULL,'The name &quot;C. Tester&quot; is mentioned by a well-known author on Academia','Dear cadic,\r\n\r\nThe name &quot;C. Tester&quot; is mentioned by a well-known author on Academia.\r\n\r\nFollow the link below to see all of your mentions:\r\n\r\nhttps://www.academia.edu/keypass/VHhtT21DYWFMTXR2dm45K25VU1BYaVJZMTk4WEVWd3VBaDFnYlI2dEpqbz0tLVhXRUNaWjk2Ykgra3BrajNvYTZzcnc9PQ==--492e0ac79ece04ea3078552d38f1263518bca464/t/m9ZxJ-NVi7Y3o-JWeXy/upgrade?feature=name_mentions&amp;trigger=well-known-author\r\n\r\n-----\r\n\r\nFollow the link below to disable these notifications:\r\n\r\nhttps://www.academia.edu/keypass/VHhtT21DYWFMTXR2dm45K25VU1BYaVJZMTk4WEVWd3VBaDFnYlI2dEpqbz0tLVhXRUNaWjk2Ykgra3BrajNvYTZzcnc9PQ==--492e0ac79ece04ea3078552d38f1263518bca464/t/m9ZxJ-NVi7Y3o-JWeXy/unsubscribe/new_mentions\r\n\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-15 13:17:02',0,NULL,NULL);
INSERT INTO `message` VALUES (173,0,0,0,10,'<01000172badd410b-95b453a5-0855-4f9d-a505-b3578bbb09b4-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: The name &ldquo;C. Tester&rdquo; was mentioned in 2 PDFs recently found by Academia, including one written by US Geological Survey.','The name &ldquo;C. Tester&rdquo; was mentioned in 2 PDFs recently found by Academia, including one written by US Geological Survey.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Q25aYloySHRkMm80c0lDUFI2bi9vRjBkRi81T2FqSlZLcmpKTW1LaUprUT0tLXhXV1VTMDRwc1dKMTRxL043RDdPcVE9PQ==--bb5f259358c77214ccb3c26e288990811ea2beff/t/m9ZxJ-NVmq1AP-cTk6n/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Q25aYloySHRkMm80c0lDUFI2bi9vRjBkRi81T2FqSlZLcmpKTW1LaUprUT0tLXhXV1VTMDRwc1dKMTRxL043RDdPcVE9PQ==--bb5f259358c77214ccb3c26e288990811ea2beff/t/m9ZxJ-NVmq1AP-cTk6n/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-15 21:02:42',0,NULL,NULL);
INSERT INTO `message` VALUES (174,0,0,0,10,'<01000172c01dc27f-c5e57d6e-f89f-4489-a68d-f0c32610da1b-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: You just hit your 445th Mention!','Congratulations on your 445th Mention!\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 7 PDFs recently found by Academia, including an Ecology paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/R2NteXhXaE13SHh3bGdmTUJreVlucm8xdkxJSUJBei9zdlR4UXZmdWE3az0tLVIzcHYrRWt2M3pqUkVsTHJVdExrMHc9PQ==--f03efb98adee07945b018d250fcc1b331bacaa70/t/m9ZxJ-NVtG24R-biPApt/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/R2NteXhXaE13SHh3bGdmTUJreVlucm8xdkxJSUJBei9zdlR4UXZmdWE3az0tLVIzcHYrRWt2M3pqUkVsTHJVdExrMHc9PQ==--f03efb98adee07945b018d250fcc1b331bacaa70/t/m9ZxJ-NVtG24R-biPApt/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-16 21:31:16',0,NULL,NULL);
INSERT INTO `message` VALUES (175,0,0,0,10,'<01000172c4cf6a4a-b5743274-8f6a-4e92-b9b1-d4941a60ea68-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: You just hit your 450th Mention!','Congratulations on your 450th Mention!\r\r\n\r\r\nWe recently found 6 papers mentioning &ldquo;C. Tester&rdquo;.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/dlRHTTN6bGNIZm9QY0I0Q25sY1EvYkt0ZWtjYVRaTCtZQ3MzVWtGYlJJRT0tLXFPNm5ZWGZWVjRaVXJrWXR4MVc3Q3c9PQ==--0411a6024fcc1170f6dfd487c1ede25f5fc681eb/t/m9ZxJ-NVAcuxr-bmc7C4/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/dlRHTTN6bGNIZm9QY0I0Q25sY1EvYkt0ZWtjYVRaTCtZQ3MzVWtGYlJJRT0tLXFPNm5ZWGZWVjRaVXJrWXR4MVc3Q3c9PQ==--0411a6024fcc1170f6dfd487c1ede25f5fc681eb/t/m9ZxJ-NVAcuxr-bmc7C4/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-17 19:23:47',0,NULL,NULL);
INSERT INTO `message` VALUES (176,0,0,0,10,'<01000172c9fec181-fe2ac969-881e-4bf6-b83e-521b6da562bd-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: You just hit your 455th Mention!','Congratulations on your 455th Mention!\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 6 PDFs recently found by Academia, including an Immunology paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Y1RENnhubDUvdWhad3hFWWszQmovZis2WWRMd0hnaGg0Z1hVUlkrb0FWZz0tLUhldlBkVTQ0aEdOYWpCbGdSRXhVTGc9PQ==--2be74d7ed2b33e1adc78cce26c46748a27e21aea/t/m9ZxJ-NVHn2Zq-rbTyk/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Y1RENnhubDUvdWhad3hFWWszQmovZis2WWRMd0hnaGg0Z1hVUlkrb0FWZz0tLUhldlBkVTQ0aEdOYWpCbGdSRXhVTGc9PQ==--2be74d7ed2b33e1adc78cce26c46748a27e21aea/t/m9ZxJ-NVHn2Zq-rbTyk/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-18 19:33:36',0,NULL,NULL);
INSERT INTO `message` VALUES (177,0,0,0,15,'<1571921009.14788769.1592579231830@Insideapple.apple.com>','Apple Music',NULL,'S&oacute;lo para ti: tres meses de Apple Music gratis','Apple Music\r\n\r\n60 millones de canciones. Te regalamos tres meses.\r\n\r\nEscucha tu m&uacute;sica favorita en todos tus dispositivos, con o sin conexi&oacute;n. Comienza a escuchar Apple&nbsp;Music sin anuncios con una prueba gratuita de tres meses. Y sin compromiso: puedes cancelar tu suscripci&oacute;n cuando quieras.\r\n\r\n\r\nPru&eacute;balo gratis por tres meses*\r\nhttps://new.applemusic.com/r?v=2&amp;la=es&amp;lc=rola&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab3W9u8T9h\r\n\r\n*S&oacute;lo para nuevos usuarios. Requiere suscripci&oacute;n inicial. La suscripci&oacute;n se renovar&aacute; autom&aacute;ticamente de forma mensual al finalizar el periodo de prueba.\r\n\r\nEs necesaria una conexi&oacute;n a internet y se aplicar&aacute;n las tarifas de datos correspondientes. El precio y la disponibilidad de los contenidos est&aacute;n sujetos a cambios. Apple Music requiere suscripci&oacute;n y no est&aacute; disponible en todos los pa&iacute;ses.\r\n\r\nCopyright &copy; 2020 Apple Inc. One Apple Park Way, Cupertino, CA 95014\r\n\r\nPol&iacute;tica de privacidad\r\nhttps://new.applemusic.com/r?v=2&amp;la=es&amp;lc=rola&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab3U8n8R9T\r\n\r\nT&eacute;rminos y condiciones\r\nhttps://new.applemusic.com/r?v=2&amp;la=es&amp;lc=rola&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab3U3w1V9C\r\n\r\nSoporte\r\nhttps://new.applemusic.com/r?v=2&amp;la=es&amp;lc=rola&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab3U9u7C9h\r\n\r\nTu cuenta\r\nhttps://new.applemusic.com/r?v=2&amp;la=es&amp;lc=rola&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab3D3i2y0M\r\n\r\nSuscribir\r\nhttps://new.applemusic.com/r?v=2&amp;la=es&amp;lc=rola&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab3U9w6W2p\r\n\r\nCancelar suscripci&oacute;n\r\nhttps://mynews.apple.com/subscriptions?v=2&amp;la=es_la&amp;a=TE%2Bd2XHZdeOIZmz1Ydk%2FhwTbWFa5eIkSuzLXNwFlFoxqjHZMiCFdRDBKZcV7ilPezXXWpB9XMyh%2BN9BXMnIeuKJ%2F6KUElTjymBuIopNg%2B%2B54K74o0WM34q5In4566g%2BOyvaBApnYamkRBZ8ZoJiPDLcij6thC%2Fhs9TvMosV5ugs6yvI4oGgCIBoDAvPyemRSy7dEejI0S3LSaXBBf3Wly%2FffamnYPEK%2BehB5%2FjNyi1g%3D\r\n\r\nFacebook\r\nhttps://new.applemusic.com/r?v=2&amp;la=es&amp;lc=rola&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab3W3i8q1p\r\n\r\nTwitter\r\nhttps://new.applemusic.com/r?v=2&amp;la=es&amp;lc=rola&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab3Q4G2L3Y\r\n\r\nInstagram\r\nhttps://new.applemusic.com/r?v=2&amp;la=es&amp;lc=rola&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab3W3l6t8N\r\n\r\nTumblr\r\nhttps://new.applemusic.com/r?v=2&amp;la=es&amp;lc=rola&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab3D0d8l2T\n\n',1,'2020-06-19 10:07:12',0,NULL,NULL);
INSERT INTO `message` VALUES (178,0,0,0,10,'<01000172cf1a716d-361864e7-3494-4e2b-92fd-c560373f5c78-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 460th Mention! &ldquo;C. Tester&rdquo;: The name &ldquo;C. Tester&rdquo; was mentioned in 5 PDFs recently found by Academia, including one written by Roscoe Hart. Shaw.','Dear Cadic,\r\r\n\r\r\nCongratulations on your 460th Mention!\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 5 PDFs recently found by Academia, including one written by Roscoe Hart. Shaw.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/NDdUN3RBcjY1NDh2d0czeTJwS0JSa2d0TEpxU2drUXdFS2JrRFdlWmxzdz0tLTltemI3N0dRSENCR1BzOUZuZlY0bHc9PQ==--db6db8dd144fd69dca437a03a24ab8e4bbafd5da/t/m9ZxJ-NVQsjEt-bsZ7rd/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/NDdUN3RBcjY1NDh2d0czeTJwS0JSa2d0TEpxU2drUXdFS2JrRFdlWmxzdz0tLTltemI3N0dRSENCR1BzOUZuZlY0bHc9PQ==--db6db8dd144fd69dca437a03a24ab8e4bbafd5da/t/m9ZxJ-NVQsjEt-bsZ7rd/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-19 19:21:57',0,NULL,NULL);
INSERT INTO `message` VALUES (179,0,0,0,10,'<01000172d43d78a7-b27809c9-f3b5-4ecf-b54d-d34c74a411e3-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: You just hit your 465th Mention!','Congratulations on your 465th Mention!\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 6 PDFs recently found by Academia, including one written by L. V. Kalatsei.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/M0dPVUYvSVU0WDVQdEtWL3hZeU94cFNyVlkvTEdXNE9rMG1ibUZ6aHFLRT0tLWhuRlRIdWlXTC9oaFhySHZyazkyU0E9PQ==--128b147e10dc821839043ddd4942511ea55f4cc0/t/m9ZxJ-NVXyXfK-U1C7W/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/M0dPVUYvSVU0WDVQdEtWL3hZeU94cFNyVlkvTEdXNE9rMG1ibUZ6aHFLRT0tLWhuRlRIdWlXTC9oaFhySHZyazkyU0E9PQ==--128b147e10dc821839043ddd4942511ea55f4cc0/t/m9ZxJ-NVXyXfK-U1C7W/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-20 19:18:19',0,NULL,NULL);
INSERT INTO `message` VALUES (180,0,0,0,10,'<01000172d9655c9d-d3b2c0d3-1486-4811-936c-40430aec0fcb-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: You just hit your 470th Mention!','Congratulations on your 470th Mention!\r\r\n\r\r\nWe recently found 4 papers mentioning &ldquo;C. Tester&rdquo;.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ZFlWUUY1Z2llU1YzL2VUcHJkNUxUSC9kSHNqbHlIemdUT3drMnRCWmVlZz0tLWJvYmdVSzRlakcxQU0xbGZmUXRiUlE9PQ==--f512bffbf531ef3147de45a305b26c7b409373cb/t/m9ZxJ-NV4G7Fi-bhpFm2/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ZFlWUUY1Z2llU1YzL2VUcHJkNUxUSC9kSHNqbHlIemdUT3drMnRCWmVlZz0tLWJvYmdVSzRlakcxQU0xbGZmUXRiUlE9PQ==--f512bffbf531ef3147de45a305b26c7b409373cb/t/m9ZxJ-NV4G7Fi-bhpFm2/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-21 19:19:59',0,NULL,NULL);
INSERT INTO `message` VALUES (181,0,0,0,10,'<01000172de8a09cd-721898ce-25e0-4d96-ba5f-730c857bbeac-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: You just hit your 480th Mention!','Congratulations on your 480th Mention!\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 8 PDFs recently found by Academia, including one written by R.N. Anderson.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/NitjNlg4YXJCTWZTTVRzY2duZkIzSXBsOEt4bHFicjNSNlJVOWlxWjFEST0tLWZpaGh1TzBxUllyUEhyV3JZY3R5RUE9PQ==--17f0563dec800761abf3f5287ee00d8c513985f3/t/m9ZxJ-NWbQgvX-YgWQT/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/NitjNlg4YXJCTWZTTVRzY2duZkIzSXBsOEt4bHFicjNSNlJVOWlxWjFEST0tLWZpaGh1TzBxUllyUEhyV3JZY3R5RUE9PQ==--17f0563dec800761abf3f5287ee00d8c513985f3/t/m9ZxJ-NWbQgvX-YgWQT/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-22 19:18:09',0,NULL,NULL);
INSERT INTO `message` VALUES (182,0,0,0,10,'<01000172e3b4767a-e4e80a4a-b071-4111-96d2-13bc9660b9e5-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: 4 new mentions, including one in a Microbiology paper','The name &ldquo;C. Tester&rdquo; was mentioned in 4 PDFs recently found by Academia, including a Microbiology paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/UDVkRlFUTy9XYTl5WG12RW5LVEh2SGFISEJkS3o5Qzg1WVBlQlF3N3pSND0tLS9QaWxJbTA5eWlyd2dURCtsUjl0clE9PQ==--7922d8b4c21dd2301c4825063bec5a92604999c4/t/m9ZxJ-NWiZfyn-0dGUA/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/UDVkRlFUTy9XYTl5WG12RW5LVEh2SGFISEJkS3o5Qzg1WVBlQlF3N3pSND0tLS9QaWxJbTA5eWlyd2dURCtsUjl0clE9PQ==--7922d8b4c21dd2301c4825063bec5a92604999c4/t/m9ZxJ-NWiZfyn-0dGUA/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-23 19:22:35',0,NULL,NULL);
INSERT INTO `message` VALUES (183,0,0,0,10,'<01000172e8d8da9f-7b99f093-1858-403c-8a29-00a7e52b747d-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: You just hit your 485th Mention!','Congratulations on your 485th Mention!\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 6 PDFs recently found by Academia, including one written by Sangki Park.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Y3UzbzROY1hranRQR1FCZWtQL3Q0YkhSRkFYQ3RZUC8rWFN4bDhhSm9uWT0tLUlGMS9ZWGw4bkJMLzZ0QmZUeW9YL2c9PQ==--63681e3a29773f5c25e050565454bfcd0982f415/t/m9ZxJ-NWq6iHZ-yfKQH/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Y3UzbzROY1hranRQR1FCZWtQL3Q0YkhSRkFYQ3RZUC8rWFN4bDhhSm9uWT0tLUlGMS9ZWGw4bkJMLzZ0QmZUeW9YL2c9PQ==--63681e3a29773f5c25e050565454bfcd0982f415/t/m9ZxJ-NWq6iHZ-yfKQH/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-24 19:20:26',0,NULL,NULL);
INSERT INTO `message` VALUES (184,0,0,0,12,'<4632ec8631031b3d77f2ef6b6e776248537f828a88af2748ffa6160bbddaa4a3@m.meistertask.com>','MeisterTask',NULL,'Unlimited projects and so much more','Full Plate? Get Unlimited Projects\r\nSo, you&rsquo;ve reached your maximum of 3 projects on MeisterTask Basic Plan. But you still have plenty more on your plate that needs organizing and doing? Upgrade to MeisterTask Pro and you&rsquo;ll get so much more than just unlimited projects.\r\n\r\nUpgrade to Pro: https://email.m.meistertask.com/c/eJxdUMFuwyAM_ZrktogAAXrgMGnqb1QGTIoWkoiAus-f0_ayCQtZfs_v2Q7W8Yv0vk9WKsHRGyVGJkYngtaRY1ROodaKSzMJHQ03YAxErqWJEdSomHMhAEgQnWR5yJiOiqXC8T34Lfd3qx3XF-mc03oCM7kLUpPRMDp6YWT9Yu-17kcnPjt-pXg8HkNOa3hLnTJUzZW-I81r2ykhGH86cY2d-ALvt7bW277A2nHVar4dWyseCfs3zhvOGFLLBGOGtLyLHvIOpH92kdfEWd5cWvCZrjDPWIhZ_vI-XpyPF94X6yEkP1Q8Xekg82nwPESz0tDejOm-2rbPBQLe9rL9Amv0fSY\r\n\r\nWhat does &ldquo;so much more&rdquo; mean?Besides unlimited projects, MeisterTask&rsquo;s Pro Plan includes:\r\nAutomations\r\nMultiple checklists\r\nRecurring tasks\r\nCustom backgrounds\r\n\r\nSee the %{link_start}full list of features%{link_end}.: https://email.m.meistertask.com/c/eJxdUMFuwyAM_ZrktogAAXrgMGnqb1QGTIoWkoiAus-f0_ayCQtZfs_v2Q7W8Yv0vk9WKsHRGyVGJkYngtaRY1ROodaKSzMJHQ03YAxErqWJEdSomHMhAEgQnWR5yJiOiqXC8T34Lfd3qx3XF-mc03oCM7kLUpPRMDp6YWT9Yu-17kcnPjt-pXg8HkNOa3hLnTJUzZW-I81r2ykhGH86cY2d-ALvt7bW277A2nHVar4dWyseCfs3zhvOGFLLBGOGtLyLHvIOpH92kdfEWd5cWvCZrjDPWIhZ_vI-XpyPF94X6yEkP1Q8Xekg82nwPESz0tDejOm-2rbPBQLe9rL9Amv0fSY\r\n\r\nDo I really need that?Probably! Stay on top of things by organizing your work properly into as many projects as you need. Then save yourself loads of time with automations and recurring tasks. If some things can be done by a machine, why not let them be?\r\n\r\nHow much does it cost?About the same as your basic Netflix subscription. MeisterTask Pro is 8.25&euro; per month/user, and certainly a more productive choice.\r\n\r\nTell me more https://email.m.meistertask.com/c/eJxdjrFuxSAMRb8m2YgIEHAGhi7dKnWo1LEyxiTRS5oIyP-X126VLNuSfa5O9EHNhqjfvLFaMYHVo9Rj0NG5pDjZYNk5qwxM2iVQgACYlDOQEtrRyhBiRDSoOyOP4eCtVM4Vy2Og8-hXP6UQpaTJuclI6QJbnAmYlGwhdk797tdar9Lpl069tir3dZ25_o9ql5Va429xlzYx1412fq5KNjkF4yQ-V6winuLtj_1orHjPZyM4F7FwFX32hHGjofLzo0kvB277r-ztDVgJzbKv_r6WjJG_rnz-AHkUW-I\r\n\r\nWatch video: https://email.m.meistertask.com/c/eJwdzUFugzAQheHT4CUyHjM2Cy-Qotyh3VTj8ThYDQKBKc3tGyq91b94XwrRDJZZlWARjLBH6DR0EZJz2UjGiOIcGut7cNkbT95TNs76nAk71DGmRGQJGqvndpayV9kq7d8tL7OaQrYigsJ9FEeDsb11DIM2PZuESKKeYap13RsYG3N_7zzP9rUc9YhyXVyFKk8N3H8auPn4-h07XT7HD7UFplS4rXKZb_8xU3n-u0ewHrXX2qkajvWxUZKvdVv-AG-mSg4\n\n',1,'2020-06-25 15:13:11',0,NULL,NULL);
INSERT INTO `message` VALUES (185,0,0,0,10,'<01000172ee04c35a-09f15027-b78e-419f-a125-690072c9598f-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: You just hit your 495th Mention!','Congratulations on your 495th Mention!\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 6 PDFs recently found by Academia, including a Physiology (medical) paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/anVheHJDRE9CK0t1SnZwMjRWY2RZTUhHRTR2WC9MYjVkTGwyM1l3bVExOD0tLWEvdkh6N1V3RDIwV2srL2VycCtIdnc9PQ==--d521895f4a37d5860b3b7940abd5766039295e7a/t/m9ZxJ-NWyfLKS-bj4dNa/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/anVheHJDRE9CK0t1SnZwMjRWY2RZTUhHRTR2WC9MYjVkTGwyM1l3bVExOD0tLWEvdkh6N1V3RDIwV2srL2VycCtIdnc9PQ==--d521895f4a37d5860b3b7940abd5766039295e7a/t/m9ZxJ-NWyfLKS-bj4dNa/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-25 19:26:29',0,NULL,NULL);
INSERT INTO `message` VALUES (186,0,0,0,16,'<170022371.6121.1593203626641.JavaMail.epqadm@nepqas>','atencion.ciudadana@medellin.gov.co',NULL,'Solicitud RECHAZADA','SU SOLICITUD HA SIDO REVISADA\n\n\t\tCordial saludo TTT RRRR.\n\nSu solicitud ha sido revisada y fue: RECHAZADA.\n\nGracias.\n\nAlcald?a de Medell?n.\n\nAlcald?&shy;a de Medell?&shy;nDirecci?&sup3;n: Calle 44 N 52 - 165 Centro\nAdministrativo la Alpujarra - Palacio Municipal.\nL?&shy;nea ??nica de Atenci?&sup3;n a la Ciudadan?&shy;a: 44 44 144 o en la L?&shy;nea\nGratuita Nacional 01 8000 411 144.\natencion.ciudadana@medellin.gov.co\n\n',1,'2020-06-26 15:34:12',0,NULL,NULL);
INSERT INTO `message` VALUES (187,0,0,0,16,'<1988105514.6131.1593203688107.JavaMail.epqadm@nepqas>','atencion.ciudadana@medellin.gov.co',NULL,'Solicitud RECHAZADA','SU SOLICITUD HA SIDO REVISADA\n\n\t\tCordial saludo LA BRUJ ()&#039;???.\n\nSu solicitud ha sido revisada y fue: RECHAZADA.\n\nGracias.\n\nAlcald?a de Medell?n.\n\nAlcald?&shy;a de Medell?&shy;nDirecci?&sup3;n: Calle 44 N 52 - 165 Centro\nAdministrativo la Alpujarra - Palacio Municipal.\nL?&shy;nea ??nica de Atenci?&sup3;n a la Ciudadan?&shy;a: 44 44 144 o en la L?&shy;nea\nGratuita Nacional 01 8000 411 144.\natencion.ciudadana@medellin.gov.co\n\n',1,'2020-06-26 15:34:48',0,NULL,NULL);
INSERT INTO `message` VALUES (188,0,0,0,16,'<354752375.6159.1593203790672.JavaMail.epqadm@nepqas>','atencion.ciudadana@medellin.gov.co',NULL,'Solicitud RECHAZADA','SU SOLICITUD HA SIDO REVISADA\n\n\t\tCordial saludo RRRRR UUUU.\n\nSu solicitud ha sido revisada y fue: RECHAZADA.\n\nGracias.\n\nAlcald?a de Medell?n.\n\nAlcald?&shy;a de Medell?&shy;nDirecci?&sup3;n: Calle 44 N 52 - 165 Centro\nAdministrativo la Alpujarra - Palacio Municipal.\nL?&shy;nea ??nica de Atenci?&sup3;n a la Ciudadan?&shy;a: 44 44 144 o en la L?&shy;nea\nGratuita Nacional 01 8000 411 144.\natencion.ciudadana@medellin.gov.co\n\n',1,'2020-06-26 15:36:31',0,NULL,NULL);
INSERT INTO `message` VALUES (189,0,0,0,16,'<864391512.6163.1593203799070.JavaMail.epqadm@nepqas>','atencion.ciudadana@medellin.gov.co',NULL,'Solicitud RECHAZADA','SU SOLICITUD HA SIDO REVISADA\n\n\t\tCordial saludo RRRRR UUUU.\n\nSu solicitud ha sido revisada y fue: RECHAZADA.\n\nGracias.\n\nAlcald?a de Medell?n.\n\nAlcald?&shy;a de Medell?&shy;nDirecci?&sup3;n: Calle 44 N 52 - 165 Centro\nAdministrativo la Alpujarra - Palacio Municipal.\nL?&shy;nea ??nica de Atenci?&sup3;n a la Ciudadan?&shy;a: 44 44 144 o en la L?&shy;nea\nGratuita Nacional 01 8000 411 144.\natencion.ciudadana@medellin.gov.co\n\n',1,'2020-06-26 15:36:39',0,NULL,NULL);
INSERT INTO `message` VALUES (190,0,0,0,16,'<333217616.6165.1593203801498.JavaMail.epqadm@nepqas>','atencion.ciudadana@medellin.gov.co',NULL,'Solicitud RECHAZADA','SU SOLICITUD HA SIDO REVISADA\n\n\t\tCordial saludo RRRRR UUUU.\n\nSu solicitud ha sido revisada y fue: RECHAZADA.\n\nGracias.\n\nAlcald?a de Medell?n.\n\nAlcald?&shy;a de Medell?&shy;nDirecci?&sup3;n: Calle 44 N 52 - 165 Centro\nAdministrativo la Alpujarra - Palacio Municipal.\nL?&shy;nea ??nica de Atenci?&sup3;n a la Ciudadan?&shy;a: 44 44 144 o en la L?&shy;nea\nGratuita Nacional 01 8000 411 144.\natencion.ciudadana@medellin.gov.co\n\n',1,'2020-06-26 15:36:42',0,NULL,NULL);
INSERT INTO `message` VALUES (191,0,0,0,10,'<01000172f326e48e-ee92bb80-6506-4cb2-874f-d14048daac65-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: 2 new mentions, including one in a General Energy paper','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 2 PDFs recently found by Academia, including a General Energy paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/aHpBSXRnNlRRK3ZMOWdNamQ5aDF6dTk5MTRaZEZSMk5pcUxhNlZQd2lkQT0tLVJ0VmV1WmU2SDBtWDdTS255QUszT3c9PQ==--1709aebdd81465f8a7d19bcbaa8a82ac2a13d051/t/m9ZxJ-NWFm6Hv-brSwPy/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/aHpBSXRnNlRRK3ZMOWdNamQ5aDF6dTk5MTRaZEZSMk5pcUxhNlZQd2lkQT0tLVJ0VmV1WmU2SDBtWDdTS255QUszT3c9PQ==--1709aebdd81465f8a7d19bcbaa8a82ac2a13d051/t/m9ZxJ-NWFm6Hv-brSwPy/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-26 19:21:52',0,NULL,NULL);
INSERT INTO `message` VALUES (192,0,0,0,10,'<01000172f84e344c-6af3bf90-30c8-4867-8731-19f17b85483a-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 500th Mention! &ldquo;C. Tester&rdquo;: The name &ldquo;C. Tester&rdquo; was mentioned in 5 PDFs recently found by Academia, including one written by Curran Kenji Gehring.','Dear Cadic,\r\r\n\r\r\nCongratulations on your 500th Mention!\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 5 PDFs recently found by Academia, including one written by Curran Kenji Gehring.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/KzJ6YTZXZzNUNGxHT3Q2dnBOKzVrWTE1U1lFR2tLRmVaclFqWUY3a29sUT0tLThWb3RySkh1cWdTL2dGa0M1cTY2cVE9PQ==--d182ed4f0892870c19f62dec92a2a51a71ea993a/t/m9ZxJ-NWNu5ZZ-bsJt6g/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions-offsite-discounted-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/KzJ6YTZXZzNUNGxHT3Q2dnBOKzVrWTE1U1lFR2tLRmVaclFqWUY3a29sUT0tLThWb3RySkh1cWdTL2dGa0M1cTY2cVE9PQ==--d182ed4f0892870c19f62dec92a2a51a71ea993a/t/m9ZxJ-NWNu5ZZ-bsJt6g/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-27 19:22:55',0,NULL,NULL);
INSERT INTO `message` VALUES (193,0,0,0,10,'<01000172fd79de99-05d68a87-895e-4663-894e-ee7a793dcb9b-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: You just hit your 505th Mention!','Dear Cadic,\r\r\n\r\r\nCongratulations on your 505th Mention!\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 4 PDFs recently found by Academia, including an Electrical and Electronic Engineering paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/NGw1Q2M0RTVmNHNGTWdTTlJvMVJrOEZqOHAybkhRUG1RcUxydWdHV29SUT0tLXJmdGtVejNHdHRWUTdtVTlLb0VSSVE9PQ==--3dc34faef1cfe8f9f5ef6a47a40e7aa1f7f63313/t/m9ZxJ-NWVEteM-bbF3wZ/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/NGw1Q2M0RTVmNHNGTWdTTlJvMVJrOEZqOHAybkhRUG1RcUxydWdHV29SUT0tLXJmdGtVejNHdHRWUTdtVTlLb0VSSVE9PQ==--3dc34faef1cfe8f9f5ef6a47a40e7aa1f7f63313/t/m9ZxJ-NWVEteM-bbF3wZ/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-28 19:28:43',0,NULL,NULL);
INSERT INTO `message` VALUES (194,0,0,0,10,'<0100017302b90843-1ad929c4-6784-4ad3-ac54-b4f17759de9b-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C. Tester&rdquo;: You just hit your 510th Mention!','Dear Cadic,\r\r\n\r\r\nCongratulations on your 510th Mention!\r\r\n\r\r\nThe name &ldquo;C. Tester&rdquo; was mentioned in 6 PDFs recently found by Academia, including a General Chemistry paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/YzE5RnlyRm5KYzY2MzJkVE1UNnVxY2ttblVSVmYyVVdHcitaYWxkNzV4cz0tLVI2RzVSU01CSTZhaEUwY2ZZcDc0VFE9PQ==--2761fef690c3809a57fad9e63acb1d6da35cf3d2/t/m9ZxJ-NW2V4L4-Q7G97/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/YzE5RnlyRm5KYzY2MzJkVE1UNnVxY2ttblVSVmYyVVdHcitaYWxkNzV4cz0tLVI2RzVSU01CSTZhaEUwY2ZZcDc0VFE9PQ==--2761fef690c3809a57fad9e63acb1d6da35cf3d2/t/m9ZxJ-NW2V4L4-Q7G97/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-29 19:55:48',0,NULL,NULL);
INSERT INTO `message` VALUES (195,0,0,0,10,'<0100017307c8ff60-1e22297c-6350-479a-ab8f-919831a385b3-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: You just hit your 515th Mention!','Dear Cadic,\r\r\n\r\r\nCongratulations on your 515th Mention!\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 4 PDFs recently found by Academia, including one written by Xu Hong Gao.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/LzRnSU9LdzNFcnBFVDhqT0s3TGNINThON2cwdG1LREhFR3RXVjRaOUFqcz0tLWhnZmtPT2gzQ2l6R1RlTTh3RFFRb0E9PQ==--229f41fa8c9980b716f4ad542cf293766216ec07/t/m9ZxJ-NW9WBAs-1aBQ1/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-onsite-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/LzRnSU9LdzNFcnBFVDhqT0s3TGNINThON2cwdG1LREhFR3RXVjRaOUFqcz0tLWhnZmtPT2gzQ2l6R1RlTTh3RFFRb0E9PQ==--229f41fa8c9980b716f4ad542cf293766216ec07/t/m9ZxJ-NW9WBAs-1aBQ1/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-06-30 19:31:20',0,NULL,NULL);
INSERT INTO `message` VALUES (196,0,0,0,17,'<fe52fcd5902732031149bbcb7.d43735ca48.20200701173815.a17dd38d5a.2f399537@mail57.suw151.rsgsv.net>','BrowserStack Team',NULL,'You&rsquo;re invited to Breakpoint 2020, a virtual summit on testing','Learn how the world&rsquo;s biggest QA teams deliver quality&nbsp;software at speed from Breakpoint 2020\r\n\r\nVIRTUAL SUMMIT\r\nhttps://www.browserstack.com/events/breakpoint?utm_source=email&amp;utm_medium=Unattributed&amp;utm_campaign=breakpoint&amp;utm_source=Browserstack&amp;utm_campaign=a17dd38d5a-EMAIL_CAMPAIGN_2020_01_17_08_58_COPY_01&amp;utm_medium=email&amp;utm_term=0_d86a9922bd-a17dd38d5a-343078102\r\n\r\nHi,\r\n\r\nWe&rsquo;re excited to announce Breakpoint 2020, a 4-day virtual summit on everything testing. We&rsquo;ve got an inspiring lineup of speakers from Selenium, Twitter, Optimizely, The Weather Channel, Robot Framework, and more to talk about:\r\n* Setting up a QA process, from writing test scripts to making the shift to automation\r\n* Stories from QA leaders about engineering teams winning with test automation at scale\r\n* Best practices for success with tools and frameworks&mdash;from creators and maintainers\r\n\r\nJoin us for the live sessions on July 20-23, 2020. We begin at 8 AM PT / 3 PM UTC each day. Can&rsquo;t make it? Register and we&rsquo;ll notify you when you can watch on-demand.\r\nRegister Now (https://www.browserstack.com/events/breakpoint?utm_source=email&amp;utm_medium=Unattributed&amp;utm_campaign=breakpoint&amp;utm_source=Browserstack&amp;utm_campaign=a17dd38d5a-EMAIL_CAMPAIGN_2020_01_17_08_58_COPY_01&amp;utm_medium=email&amp;utm_term=0_d86a9922bd-a17dd38d5a-343078102)\r\n\r\nCheers,\r\nTeam BrowserStack\r\n\r\n\r\n\r\nTo unsubscribe from this type of email, please click here (https://browserstack.us4.list-manage.com/unsubscribe?u=fe52fcd5902732031149bbcb7&amp;id=d86a9922bd&amp;e=d43735ca48&amp;c=a17dd38d5a) .\r\nhttps://www.twitter.com/BrowserStack?utm_source=Browserstack&amp;utm_campaign=a17dd38d5a-EMAIL_CAMPAIGN_2020_01_17_08_58_COPY_01&amp;utm_medium=email&amp;utm_term=0_d86a9922bd-a17dd38d5a-343078102 https://facebook.com/browserstack?utm_source=Browserstack&amp;utm_campaign=a17dd38d5a-EMAIL_CAMPAIGN_2020_01_17_08_58_COPY_01&amp;utm_medium=email&amp;utm_term=0_d86a9922bd-a17dd38d5a-343078102 https://www.linkedin.com/company/browserstack/?utm_source=Browserstack&amp;utm_campaign=a17dd38d5a-EMAIL_CAMPAIGN_2020_01_17_08_58_COPY_01&amp;utm_medium=email&amp;utm_term=0_d86a9922bd-a17dd38d5a-343078102\r\n\r\n\r\n\r\n&copy; 2020 BrowserStack Inc., 444 De Haro Street, Suite 212, San Francisco, CA 94107\r\n\r\n============================================================\n\n',1,'2020-07-01 12:42:53',0,NULL,NULL);
INSERT INTO `message` VALUES (197,0,0,0,10,'<010001730cef2dae-6ea3ee05-8a17-4d99-b9b8-9ed4dc4b5da9-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: You just hit your 520th Mention!','Dear Cadic,\r\r\n\r\r\nCongratulations on your 520th Mention!\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 7 PDFs recently found by Academia, including one written by Abdullah M. Thannoun.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/M0l1Y0hJaTk3cHJZTnl4WEtKbFFBZHdES1dHYUh2d2Vka0pjQjNuNStkWT0tLTFwV0lEaU5ZeGg2SkZHUEJlUGlzZXc9PQ==--1944a6959f3bb93f86a3599a0d1efb806620d2f7/t/m9ZxJ-NXg4eKi-RjjzP/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/M0l1Y0hJaTk3cHJZTnl4WEtKbFFBZHdES1dHYUh2d2Vka0pjQjNuNStkWT0tLTFwV0lEaU5ZeGg2SkZHUEJlUGlzZXc9PQ==--1944a6959f3bb93f86a3599a0d1efb806620d2f7/t/m9ZxJ-NXg4eKi-RjjzP/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-01 19:31:09',0,NULL,NULL);
INSERT INTO `message` VALUES (198,0,0,0,10,'<010001731216e0aa-20986cf0-2374-4eb9-9f4e-108e789cf9c2-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: You just hit your 525th Mention!','Dear Cadic,\r\r\n\r\r\nCongratulations on your 525th Mention!\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 4 PDFs recently found by Academia, including a General Computer Science paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/dzJBQ2dQOXE5a3NzWDBZK3hZaVQxK1ZINmxQd1FuNTh6RzlySHJHbWZkST0tLUozVjdQVVVUTmhTM0xYcnFkMGpVTmc9PQ==--f5491060a0662864a79e8266472ccb577ddddd81/t/m9ZxJ-NXpcmqR-bmKw34/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/dzJBQ2dQOXE5a3NzWDBZK3hZaVQxK1ZINmxQd1FuNTh6RzlySHJHbWZkST0tLUozVjdQVVVUTmhTM0xYcnFkMGpVTmc9PQ==--f5491060a0662864a79e8266472ccb577ddddd81/t/m9ZxJ-NXpcmqR-bmKw34/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-02 19:32:37',0,NULL,NULL);
INSERT INTO `message` VALUES (199,0,0,0,12,'<799a769173a8db5ea475dfe7e83b79d72865b1cbce96ce14c9463a71f8bf8942@m.meistertask.com>','MeisterTask',NULL,'5 Time-Saving Features You Didn&rsquo;t Know Existed',' \n\n \t\t&nbsp;\n\n[MeisterTask]\n\n 5 TIME-SAVING FEATURESYOU DIDN&rsquo;T KNOW ALREADY EXIST \n\nThese features are easily overlooked, but they can save you tons of\ntime&hellip;\n\n FIND OUT HOW TO WORK FASTER WITH KEY SHORTCUTS, JUMP QUICKLY BETWEEN\nTASKS WITH OUR HANDY QUICK SWITCHER, AND MORE! \n\n KEY SHORTCUTS \n\nYou can use Q to show only tasks assigned to yourself. A simple N\ncreates a new task. Pressing C completes a task. And use Shift+/ to\nview all all shortcuts.\n\n \t\t &nbsp;&nbsp;Learn more&nbsp;&nbsp;\n[https://email.m.meistertask.com/c/eJxdkMtqxDAMRb8m2WXw-7HIolBm02U_IDiyMjGNk-DYlP59nbSFoWBkoXt1JOT7kVkB0IZeW-u0slRzZ_wo0Qkt_YQaDR-19ZoZJUcKI6BVgFSAFYo7TSczTsYK1ggSbxHDkTFld3zcYIvt3HNNJEPBHVdcaeuAUyHFyJTxwlvl26Wfc96Phr807F7fUfZ9S_k_qioz1IBrV476u5QDLHimlEpCCJVSKdG94Vf3PlcAlFyh95LjcGwlATb89YnZMHVKEX0osUoYXVh-i-Di7sJjreUl5LxgwyQjH-v2uV7ZhC6XdM5W6dkcc3dhup-u7uro_txt6sH5ALeM5xL1Xo_TfN2p9MIoYgjRbe5nl_yQt2EKqx9W93hg-garP4qQ]\n\n\n QUICK SWITCHER \n\nQuickly jump to recent tasks or recent projects with this neat little\ntrick: CMD + K or CTRL + K. Choose from the list of your most recent\nprojects or tasks or use the search bar.\n\n \t\t &nbsp;&nbsp;Learn more&nbsp;&nbsp;\n[https://email.m.meistertask.com/c/eJxdTsuKhTAU-xrdVVpb-1h0cTezH_wAOT091XJ9USvz--Od5UBIAgkh0YfeKcQ2e-McGO2EkWBjGAiUGWIiQ1YG46LprR6CwIDkNJJQ6JSWYESyIVmn-kbxrdsoX5VKhevd4bG1iyeQILm2XAku0FDSSQwixD6hs8h1u_ql1vNq5Kvpvx5c93kepf6fepIFH6Kd3dejUGrGlT6251a5QYqBfd8Z32z8yRUXKuxYIxu3p8lGgoILa4tHiBm7Sp_t5_K8QV7_rt5eWc0t56atfoESp3pMKe9x2mGeqfwCKINetw]\n\n\n WATCH PROJECT \n\nThis feature ensures you get notified about all goings-on in a\nproject, making it ideal for team leaders (and helicopter founders).\nJust click the Watch button in the project settings to enable it\n\n \t\t &nbsp;&nbsp;Learn more&nbsp;&nbsp;\n[https://email.m.meistertask.com/c/eJxdjktuhjAMhE8DuyBC3ossuqnaUyDHcSAtL4WgXr_5u6xk2WON9M1EHyYnEfvsjXNgtONGgI1BEUijYiJDVgTjopmsVoFjQHIaiUt0UgswPNmQrJNTJ8d92CnflUqF-3vAc-9XD1Hz1BKsGEko67hIxC0ljEEqw2W_-bXW6-7EWze9t7mf6zpL_Y9qzopt0cGeu10oNeNGLzmNWirJrWQf5w9DONgnS-e2tQfYVc4vwsr64hFixqHSC9vaLjvk7a_l46XVox1H01e_QolzPeeUjzgfsCxUfgFhplzV]\n\n\n SORT PROJECTS \n\nDon&rsquo;t like the alphabetical order of your dashboard&rsquo;s project\nlist? Just use drag &amp; drop to quickly rearrange projects, e.g.\nchronologically or by importance.\n\n \t\t &nbsp;&nbsp;Learn more&nbsp;&nbsp;\n[https://email.m.meistertask.com/c/eJxdjsFuhSAQRb9GdxgEFFiw6KZpv8IMw6C2KgYw_f3yumwymbnJTc6c4LywCrHfnbYW9GxHLcEEPxEoPYVImoz02gYtzDz5ET2SnZFGhVbNEvQYjY_GKtEpfg4n7aVSrlC-B0xnvzm0MMoZjSBSQnHgAoVs6Cg9BR95f7it1rt08q0T723Kc98p1_-o1mzYFl3sKe1Crjse9IqCSzVJrkb2kX4YwsU-WaaUA2VWN2JHA7EU2Z3TF2EtrM8OIew4VHq9aObrCfvxZ_w4ZWZuONd9dRvksNS0xP0KywXrSvkX3JdhUA]\n\n\n BLUR OLD TASKS \n\nEnable this feature in your account settings to access an overview of\nwhich tasks haven&rsquo;t received attention in a while. All old and\ninactive tasks will appear dark and blurry.\n\n \t\t &nbsp;&nbsp;Learn more&nbsp;&nbsp;\n[https://email.m.meistertask.com/c/eJxdUN1uhSAMfhq94wQQQS682LKc1zAVioccQYOwvf7QbcnJkqZt-v20qR1nroUxrR-V1qCkZqqDwc49glC9dahw6GalreKD7GdmZoNaGmTCaCE7UMwNsxu04I2g4RbQHxlThuN5M1toH2OPTlWznrJuFm7mlnHQGgVqqh0Xol3HR8770XRvDb_XOMq-byn_t6rIw9SEkZSjVkjZmxXPlrGeUsqEkoqS97Uksq2WQLTERzDZfyI5XeqKe8lhOraSDDbdx8uGhssTCmh9CRXCAH79HRoIO_gl1vHqc16x4T2nz7h9xatzCLmk8xKZXskhk8uG_KjIpSB_7DaNBqw3t4znEfV7y0m-vlZGMUg6UKraPD4g2Slvk_PRThGWBdM3b4GQXA]\n\n\nCheers,\n\n &copy; 2020 MEISTER\nZugspitzstrasse 2, 85591 Vaterstetten , Germany \nImprint\n[https://email.m.meistertask.com/c/eJxdjUtuxCAQBU9jlhaGhqYXLLLJNazmZ6MMnhEm8vXHk2WkWj2VXiUfFEGMonokYrS0oGaXgskMaFLJmJ0OSAmVsyYsMcRMNuYFIoHVjEtxoTgCNYFsc8v1HLkPPn_m-Gxi97FACVwYiw1AoMlIl50sNilDYKx4-H2M1znpr0l931zX9f_mXmt79XoM0X3kVOM88ke4m1vj-vhr_XpwVjopUQy_c0_reK6lHmk9eNtyfwPW3UqA]\n&middot; Unsubscribe\n[https://email.m.meistertask.com/c/eJw1j81qwzAQhJ_GPhrrXzroUAh5DbO7WiUisR0smdC3r1JaGFiYhW9mUkQZNNFYogsBnA3CKfAJDYN2JmV27BW6kJz01qAgJA6WWGgK2ipwInvMPmg56HmdVi618dGgPiba1_EeLSrlBRnKwpJHkg7AZWmzEqiNEuMz3lt71UF9DfLa9X6_p7Vs6Q_1wXT3rHzUz93qiZWOgrxseyu5ELSyb_2lvZ39PLtBXdv3iwd1eR17OqktrXS-tG1_8NZtsF7ORuechPeoOQgk49EEy8FISMmiRjfTeESCVGhq_GnSB95WKM_fYWf8jxtbvMORlrYvuddeNrjd-PgBjlhs_g]\n\n\n',1,'2020-07-03 13:31:51',0,NULL,NULL);
INSERT INTO `message` VALUES (200,0,0,0,10,'<01000173173b139b-f30e6d23-2a75-4e36-8dda-d637bd0f21ef-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: You just hit your 535th Mention!','Dear Cadic,\r\r\n\r\r\nCongratulations on your 535th Mention!\r\r\n\r\r\nWe recently found 8 papers mentioning &ldquo;C Tester&rdquo;.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/WUJmZVBGUHQ2ZGVXRXVvNDhyd2VPZWZ5Skwyd0pRbjdyY3J5ZWtLQWM4TT0tLXdMWHVoTHFlVC9vbVVkNjBIZGNyQlE9PQ==--c14b6b26612dc489743e3218e9c9c2c60bb68d34/t/m9ZxJ-NXwjk1e-QDSf3/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/WUJmZVBGUHQ2ZGVXRXVvNDhyd2VPZWZ5Skwyd0pRbjdyY3J5ZWtLQWM4TT0tLXdMWHVoTHFlVC9vbVVkNjBIZGNyQlE9PQ==--c14b6b26612dc489743e3218e9c9c2c60bb68d34/t/m9ZxJ-NXwjk1e-QDSf3/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-03 19:30:15',0,NULL,NULL);
INSERT INTO `message` VALUES (201,0,0,0,10,'<010001731c61f3da-6399f798-1b97-4ad7-9f40-65b72e53d8e3-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 540th Mention! Get 50% off now. &ldquo;Tester, C&rdquo;: The name &ldquo;Tester, C&rdquo; was mentioned in 7 PDFs recently found by Academia, including one written by Alfons Geser.','Dear Cadic,\r\r\n\r\r\nCongratulations on your 540th Mention!\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 7 PDFs recently found by Academia, including one written by Alfons Geser.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VXZIWmRNUVFLd3J4YS95QjBiTElNNlBrMU1qWk5ZWUZKaHYzcE8rQVBtQT0tLWRucUIzYnZBMjl2N3VaTFp0d2ZEaWc9PQ==--90572db52d49f4772219b53d368470028c9ac462/t/m9ZxJ-NXDscor-UzPPz/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions-onsite-offsite-discounted-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VXZIWmRNUVFLd3J4YS95QjBiTElNNlBrMU1qWk5ZWUZKaHYzcE8rQVBtQT0tLWRucUIzYnZBMjl2N3VaTFp0d2ZEaWc9PQ==--90572db52d49f4772219b53d368470028c9ac462/t/m9ZxJ-NXDscor-UzPPz/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-04 19:30:49',0,NULL,NULL);
INSERT INTO `message` VALUES (202,0,0,0,10,'<010001732193373c-7c1a0386-9f43-494b-965f-4432beeb3c71-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 550th Mention! Get 50% off now. &ldquo;Tester, C&rdquo;: The name &ldquo;Tester, C&rdquo; was mentioned in 9 PDFs recently found by Academia, including one written by Saifalden Y. Alssafar.','Dear Cadic,\r\r\n\r\r\nCongratulations on your 550th Mention!\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 9 PDFs recently found by Academia, including one written by Saifalden Y. Alssafar.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/S1psZXVEV0RwKytDTzY5dVllRWRIeHg1VFdaY25ZS3NnOCtyOXN5OE9ETT0tLWY2bHp3VmdpclRlWDYrdnk5MEt0SlE9PQ==--ea5e04d411c3d2871b929c55b0aa59ac34f1a570/t/m9ZxJ-NXLDm9u-NAsFm/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions-offsite-discounted-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/S1psZXVEV0RwKytDTzY5dVllRWRIeHg1VFdaY25ZS3NnOCtyOXN5OE9ETT0tLWY2bHp3VmdpclRlWDYrdnk5MEt0SlE9PQ==--ea5e04d411c3d2871b929c55b0aa59ac34f1a570/t/m9ZxJ-NXLDm9u-NAsFm/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-05 19:42:43',0,NULL,NULL);
INSERT INTO `message` VALUES (203,0,0,0,10,'<0100017326ae1fde-eb87c841-2d02-4864-81a1-16b251e42b87-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 3 new mentions, including one in a Mechanical Engineering paper','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 3 PDFs recently found by Academia, including a Mechanical Engineering paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VWNsalJHV0E3d2tyK2cxU2tScEdLR3JCTkNwL2dhdkRKREpGTEZsdDNBWT0tLW1vc3ZtSEtzWDJyNUN0azFnemJJamc9PQ==--df71d24306eaaf2383801e997afc8198adb22aa9/t/m9ZxJ-NXTHo1P-Ty9Bn/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VWNsalJHV0E3d2tyK2cxU2tScEdLR3JCTkNwL2dhdkRKREpGTEZsdDNBWT0tLW1vc3ZtSEtzWDJyNUN0azFnemJJamc9PQ==--df71d24306eaaf2383801e997afc8198adb22aa9/t/m9ZxJ-NXTHo1P-Ty9Bn/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-06 19:30:13',0,NULL,NULL);
INSERT INTO `message` VALUES (204,0,0,0,10,'<010001732be8dab2-d1734adc-f142-468f-a8c2-7c2f951e04a3-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: You just hit your 555th Mention!','Dear Cadic,\r\r\n\r\r\nCongratulations on your 555th Mention!\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 3 PDFs recently found by Academia, including an Aquatic Science paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/V2EyVjhrSVI2aXpmd3o3eVV4TnhBTitOMmdQOUR6NWJiSFc4cVBLK1NPZz0tLW5tbmRtQ0trb3J1SDVOMmlGNWtHaHc9PQ==--79832e0319f47a9879b7b07c103850d753b1bc80/t/m9ZxJ-NX0XzGi-n43hk/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/V2EyVjhrSVI2aXpmd3o3eVV4TnhBTitOMmdQOUR6NWJiSFc4cVBLK1NPZz0tLW5tbmRtQ0trb3J1SDVOMmlGNWtHaHc9PQ==--79832e0319f47a9879b7b07c103850d753b1bc80/t/m9ZxJ-NX0XzGi-n43hk/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-07 19:52:28',0,NULL,NULL);
INSERT INTO `message` VALUES (205,0,0,0,10,'<0100017331072a82-dea87192-ba34-41fb-829f-bf798d6d28b5-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: You just hit your 560th Mention!','Dear Cadic,\r\r\n\r\r\nCongratulations on your 560th Mention!\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 4 PDFs recently found by Academia, including one written by Not Given Author.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ek9wc0plOUNxOWFqcGVqUHd3K09nNmNScDNpbXArTVJTbVhYdGRYMjV3OD0tLXpzZlpyeHVNZEJLWG93ZHZrSndLTWc9PQ==--8ad0b5e388a1f2d921fbf4de02db59ef8f33ccef/t/m9ZxJ-NX72GAV-k92aq/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ek9wc0plOUNxOWFqcGVqUHd3K09nNmNScDNpbXArTVJTbVhYdGRYMjV3OD0tLXpzZlpyeHVNZEJLWG93ZHZrSndLTWc9PQ==--8ad0b5e388a1f2d921fbf4de02db59ef8f33ccef/t/m9ZxJ-NX72GAV-k92aq/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-08 19:43:40',0,NULL,NULL);
INSERT INTO `message` VALUES (206,0,0,0,18,'<1986673725.174500248.1594298784499@Insideapple.apple.com>','Apple',NULL,'Grandes novedades. M&aacute;s grandes que nunca.','Apple WWDC20\r\n\r\nAqu&iacute; est&aacute;n nuestras &uacute;ltimas novedades.\r\n\r\nVer la presentaci&oacute;n\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=col&amp;a=z2%2Bnb8HWCoHziyJtbRYNxEJqOcwA12xbGoofYjHA7%2ForWDv0thLjgqyoZfbc4%2FVLvX%2F4%2FvHnx5l7sF5tSkyxfBDpEcBwaIk7sE9sHFlx9hp9Makv40%2B9kLA9Vr8JibtDNBWsFyrho5XiKuiXEzfkVehguCFhgtGOvvoHeuLn%2Bxi0v0t9dDSJWOc2JHGpo%2BkXhylhyBXl3ZMI8nn41tJjrQ%3D%3D&amp;ct=ab8K6L5d9C\r\n\r\n-------------------\r\n\r\niOS\r\n\r\niOS 14 simplifica lo que haces todos los d&iacute;as: la pantalla de inicio tiene widgets redise&ntilde;ados que te muestran m&aacute;s informaci&oacute;n, los App Clips te ayudan a resolver cosas r&aacute;pidamente y la nueva Biblioteca de Apps organiza de manera autom&aacute;tica todas tus apps para que las encuentres enseguida.\r\n\r\nVer el avance\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=col&amp;a=z2%2Bnb8HWCoHziyJtbRYNxEJqOcwA12xbGoofYjHA7%2ForWDv0thLjgqyoZfbc4%2FVLvX%2F4%2FvHnx5l7sF5tSkyxfBDpEcBwaIk7sE9sHFlx9hp9Makv40%2B9kLA9Vr8JibtDNBWsFyrho5XiKuiXEzfkVehguCFhgtGOvvoHeuLn%2Bxi0v0t9dDSJWOc2JHGpo%2BkXhylhyBXl3ZMI8nn41tJjrQ%3D%3D&amp;ct=ab8t7d6V8M\r\n\r\n-------------------\r\n\r\niPadOS\r\n\r\niPadOS 14 te permite aprovechar como nunca las posibilidades &uacute;nicas del iPad. Ahora podr&aacute;s ver m&aacute;s funcionalidades de cada app gracias a un dise&ntilde;o mejorado y escribir a mano f&aacute;cilmente en Notas o en cualquier campo de texto gracias a la funcionalidad Escribir.(*)\r\n\r\nVer el avance\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=col&amp;a=z2%2Bnb8HWCoHziyJtbRYNxEJqOcwA12xbGoofYjHA7%2ForWDv0thLjgqyoZfbc4%2FVLvX%2F4%2FvHnx5l7sF5tSkyxfBDpEcBwaIk7sE9sHFlx9hp9Makv40%2B9kLA9Vr8JibtDNBWsFyrho5XiKuiXEzfkVehguCFhgtGOvvoHeuLn%2Bxi0v0t9dDSJWOc2JHGpo%2BkXhylhyBXl3ZMI8nn41tJjrQ%3D%3D&amp;ct=ab8K6b2M6N\r\n\r\n-------------------\r\n\r\nmacOS\r\n\r\nmacOS Big Sur tiene un nuevo e incre&iacute;ble dise&ntilde;o que hace al Mac a&uacute;n m&aacute;s poderoso. Safari se actualiza para que navegues de una forma m&aacute;s personal y con mayor privacidad. Y las novedades en Mensajes y Mapas te permitir&aacute;n comunicarte y descubrir lugares como nunca antes.\r\n\r\nVer el avance\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=col&amp;a=z2%2Bnb8HWCoHziyJtbRYNxEJqOcwA12xbGoofYjHA7%2ForWDv0thLjgqyoZfbc4%2FVLvX%2F4%2FvHnx5l7sF5tSkyxfBDpEcBwaIk7sE9sHFlx9hp9Makv40%2B9kLA9Vr8JibtDNBWsFyrho5XiKuiXEzfkVehguCFhgtGOvvoHeuLn%2Bxi0v0t9dDSJWOc2JHGpo%2BkXhylhyBXl3ZMI8nn41tJjrQ%3D%3D&amp;ct=ab8t0E7m8M\r\n\r\n-------------------\r\n\r\nwatchOS\r\n\r\nCon watchOS 7, podr&aacute;s encontrar nuevas car&aacute;tulas personalizadas en Internet y en redes sociales, y compartirlas con amigos. Descubrir&aacute;s Sue&ntilde;o, la app con la que siempre so&ntilde;aste. Podr&aacute;s registrar datos con cuatro nuevos entrenamientos. Y crear&aacute;s h&aacute;bitos m&aacute;s saludables con la nueva funcionalidad Lavado de Manos.\r\n\r\nVer el avance\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=col&amp;a=z2%2Bnb8HWCoHziyJtbRYNxEJqOcwA12xbGoofYjHA7%2ForWDv0thLjgqyoZfbc4%2FVLvX%2F4%2FvHnx5l7sF5tSkyxfBDpEcBwaIk7sE9sHFlx9hp9Makv40%2B9kLA9Vr8JibtDNBWsFyrho5XiKuiXEzfkVehguCFhgtGOvvoHeuLn%2Bxi0v0t9dDSJWOc2JHGpo%2BkXhylhyBXl3ZMI8nn41tJjrQ%3D%3D&amp;ct=ab8t2G1x2T\r\n\r\n-------------------\r\n\r\nBuscar una tienda\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=col&amp;a=z2%2Bnb8HWCoHziyJtbRYNxEJqOcwA12xbGoofYjHA7%2ForWDv0thLjgqyoZfbc4%2FVLvX%2F4%2FvHnx5l7sF5tSkyxfBDpEcBwaIk7sE9sHFlx9hp9Makv40%2B9kLA9Vr8JibtDNBWsFyrho5XiKuiXEzfkVehguCFhgtGOvvoHeuLn%2Bxi0v0t9dDSJWOc2JHGpo%2BkXhylhyBXl3ZMI8nn41tJjrQ%3D%3D&amp;ct=ab8H2V4p0M\r\n\r\n-------------------\r\n\r\n* Funciona con dispositivos que tengan el teclado configurado en los siguientes idiomas: chino (simplificado), chino (tradicional) o ingl&eacute;s.\r\n\r\nLas funcionalidades est&aacute;n sujetas a cambios. Algunas funcionalidades, aplicaciones y servicios podr&iacute;an no estar disponibles en todas las regiones o en todos los idiomas.\r\n\r\nTM y (c) 2020 Apple Inc. One Apple Park Way, MS 96-DM, Cupertino, CA 95014.\r\n\r\n-------------------\r\n\r\nTodos los derechos reservados\r\nhttps://www.apple.com/co/legal/\r\n\r\nPol&iacute;tica de privacidad\r\nhttps://www.apple.com/legal/privacy/es-la/\r\n\r\nMi Apple ID\r\nhttps://appleid.apple.com/co/\r\n\r\n-------------------\r\n\r\nSi prefieres no recibir correos electr&oacute;nicos comerciales de Apple o si cambiaste tu direcci&oacute;n de email, haz clic aqu&iacute;.\r\nhttps://mynews.apple.com/subscriptions?v=2&amp;la=es_co&amp;a=F%2FeqLtCy04tHyH46UcZc4ZX3eH7SZuFoj7TQymcNQunlj9kYVxRIckYA4dX%2B5oIcTCVdBAl5BGiCDWQMKRTHxjAMEOTy0w0c8fYq%2BmS2aq8oiQNgbud1mz%2F%2B7%2BuSeO3N9BwF6KGLB0gUBO0OBy3z8H4U294JokG%2F57Acl0LL6CsIKQny3cxlXBKbq9S1efvnf%2FzRGpyK3b83EMT34SiZKZ0lh37puYC3NNRTdIGJYRg%3D\n\n',1,'2020-07-09 07:46:26',0,NULL,NULL);
INSERT INTO `message` VALUES (207,0,0,0,10,'<010001733623cfa5-1ccbfe50-e727-4de1-846b-fc947c59ee1f-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: Congratulations on your 565th Mention! The name &ldquo;C Tester&rdquo; was mentioned in 8 PDFs recently found by Academia, including one written by Ning Ren.','Dear Cadic,\r\r\n\r\r\nCongratulations on your 565th Mention!\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 8 PDFs recently found by Academia, including one written by Ning Ren.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Wm5VVWRWWHI5NmFuTEJ3UUk0aTBhdDNaS1M5VlBBL1VQVTNDZnNaTklHQT0tLUV0YmJnM0VkNG5FR2RCSjFtSmpJOVE9PQ==--45028748ae2e854f545c29b9064c4f016ba37ac6/t/m9ZxJ-NYe7htY-bkCCfT/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-onsite-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Wm5VVWRWWHI5NmFuTEJ3UUk0aTBhdDNaS1M5VlBBL1VQVTNDZnNaTklHQT0tLUV0YmJnM0VkNG5FR2RCSjFtSmpJOVE9PQ==--45028748ae2e854f545c29b9064c4f016ba37ac6/t/m9ZxJ-NYe7htY-bkCCfT/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-09 19:33:04',0,NULL,NULL);
INSERT INTO `message` VALUES (208,0,0,0,19,'<20200710102347.1.71F2584347B7B7AA@m.meistertask.com>','MeisterTask News',NULL,'7 New MeisterTask Features &mdash; Out Now!','From collapsible sections to reactions!\r\nhttps://email.m.meistertask.com/c/eJxlTUEOhCAQe40eyTDAogcO7sFvGBhRyYIYIfH7q3vdtD20TdrZOOwlURsMAgJoDhxQSM0403xE1cnbvG8MQyMhseRDqf6stnwY5dRuBi23QgvslFpmJAf0crRwrqAXj9potlqP0oihwfHmdV1_M6chOwdi1T_x_bQmG-KvqoZyjPYowUU_FU815L1MKZ9-8vsaQ9m-B9w--w\r\n\r\n\r\n\r\n** Collapsible Sections &amp; More\r\nThe Feature Round-up You&rsquo;ve Been Waiting for!\r\n\r\n------------------------------------------------------------\r\n\r\n\r\nWe haven&rsquo;t updated you in a while, but that doesn&rsquo;t mean we weren&rsquo;t busy! We&rsquo;ve developed a couple of great features that we&rsquo;d like to introduce you to. Here&rsquo;s a quick overview of what&rsquo;s new:\r\n\r\n2f017448-543a-4200-afc0-8f55a6e1581e.png\r\n\r\n\r\n** Collapsible sections\r\n------------------------------------------------------------\r\n\r\n\r\nMeisterTask now offers its own version of show/hide functionality. Collapse and expand sections in your project and give yourself a more focused overview.\r\n\r\n\r\n\r\nLearn More (https://email.m.meistertask.com/c/eJxlTUEOhCAQe40eyTDAogcO7sFvGBhRyYIYIfH7q3vdtD20TdrZOOwlURsMAgJoDhxQSM0403xE1cnbvG8MQyMhseRDqf6stnwY5dRuBi23QgvslFpmJAf0crRwrqAXj9potlqP0oihwfHmdV1_M6chOwdi1T_x_bQmG-KvqoZyjPYowUU_FU815L1MKZ9-8vsaQ9m-B9w--w)\r\n\r\n2f017448-543a-4200-afc0-8f55a6e1581e.png\r\nReact and quote-reply to comments\r\n\r\n\r\nYou can now do more than just &ldquo;like&rdquo; comments; you can react to them too! Also, keep communication in context by including the comment you&rsquo;re answering as a quote in your reply.\r\n\r\n\r\n\r\nLearn More (https://email.m.meistertask.com/c/eJxlTUEOhCAQe40eyTDAogcO7sFvGBhRyYIYIfH7q3vdtD20TdrZOOwlURsMAgJoDhxQSM0403xE1cnbvG8MQyMhseRDqf6stnwY5dRuBi23QgvslFpmJAf0crRwrqAXj9potlqP0oihwfHmdV1_M6chOwdi1T_x_bQmG-KvqoZyjPYowUU_FU815L1MKZ9-8vsaQ9m-B9w--w)\r\n\r\n\r\nd93aaa68-c712-4728-ab99-8ec8bde907a8.png\r\n\r\n\r\n\r\n** And so much more!\r\n------------------------------------------------------------\r\n\r\n\r\nWe&rsquo;ve also released Task IDs and the option to mention non-project members in projects. And, let us not forget an overhaul of our GitHub and Zendesk integrations.\r\n\r\n\r\n\r\nLearn More (https://email.m.meistertask.com/c/eJxlTUEOhCAQe40eyTDAogcO7sFvGBhRyYIYIfH7q3vdtD20TdrZOOwlURsMAgJoDhxQSM0403xE1cnbvG8MQyMhseRDqf6stnwY5dRuBi23QgvslFpmJAf0crRwrqAXj9potlqP0oihwfHmdV1_M6chOwdi1T_x_bQmG-KvqoZyjPYowUU_FU815L1MKZ9-8vsaQ9m-B9w--w)\r\n\r\n\r\n============================================================\r\n\r\n&copy; 2020 MeisterLabs   &bull;   ** Imprint (https://email.m.meistertask.com/c/eJwtjs0OgyAQhJ9GjwSQqhw42DS-hkFYdVN-DND4-sWmmU1mdpOdfFatXApjWlScckoHRhnlnRgIIwOb-WMUdXlWTVMjqCceMBdIRec3MdG3h4K175m0zFK5adCbFRTAjlp0ILncROvUUcqZm25q-Fznui7iMdh_1V1Tr0f0UA39mTCUppvPFO3H1PTibVJGWzSkwP1RQXav0f0AijLROX1mXB0sGUzBGPLiY4IFwu4wH1-b40p_)\r\n&bull;   ** Unsubscribe (https://email.m.meistertask.com/c/eJyFjzFvhDAMhX9NGKMQUghDhmsrlnbp0KETyhkfpJcQRIz4-_VV3Ss_yfKnp6fnyV11bwCq4LTSSnW1qpVuTCdr2dWDfrKGj2eey0UYlWTCUAh38uUuIadqcTevVWuN6jsWQG8bbaz3Gns0oMytim4h2opoLkIPrPM8ZQrr9Bf1iGG65IS8VjxLRGI-5o3GfBBDY1tluZxoBsp3XEXz-r4d8eP78-XtwPwFQrfkZ8aQY_RbCdeIY0GgkNcyprzjiOscQ1nYue15OoDYravdgZ8CSMJHFf5wTj7E38_I_Rv2A05IaOs)\n\n',1,'2020-07-10 05:23:54',0,NULL,NULL);
INSERT INTO `message` VALUES (209,0,0,0,10,'<010001733b4a8181-76f2ea26-c93f-48cb-8e12-4b1f8ad38f87-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: Congratulations on your 575th Mention! 10 new mentions, including one in a Public Health, Environmental and Occupational Health paper','Dear Cadic,\r\r\n\r\r\nCongratulations on your 575th Mention!\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 10 PDFs recently found by Academia, including a Public Health, Environmental and Occupational Health paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/QzZlRHVYZ0p1NzlNRFppZFFQOWcyVzdvNk1MUTU3dlpBVHZoVU5pdGUrUT0tLXpWcTdtWG12NFNxQ1ZvTmlWMFNVSWc9PQ==--65d99c224f16bfb1106ccaa6dda51c8401d254f3/t/m9ZxJ-NYne5eg-bxGxRw/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/QzZlRHVYZ0p1NzlNRFppZFFQOWcyVzdvNk1MUTU3dlpBVHZoVU5pdGUrUT0tLXpWcTdtWG12NFNxQ1ZvTmlWMFNVSWc9PQ==--65d99c224f16bfb1106ccaa6dda51c8401d254f3/t/m9ZxJ-NYne5eg-bxGxRw/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-10 19:33:26',0,NULL,NULL);
INSERT INTO `message` VALUES (210,0,0,0,10,'<01000173407053a9-114de238-1594-4ac0-8d34-b172c480719a-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: Congratulations on your 580th Mention! The name &ldquo;Tester, C&rdquo; was mentioned in 2 PDFs recently found by Academia, including one written by Office of Scientific and Technical Information  (OSTI).','Dear Cadic,\r\r\n\r\r\nCongratulations on your 580th Mention!\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 2 PDFs recently found by Academia, including one written by Office of Scientific and Technical Information  (OSTI).\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VlVEbEZRZHpWUVhwWmpRY09TblNWZUwxaEZZQnpaaWFoa2pFNlJqSEkxVT0tLTExQlM4QTJNbWdYQlNBa25KdjYwWFE9PQ==--93d2be07ec99afc7e26e739b639aa808e1acd95d/t/m9ZxJ-NYunAoQ-sKS1f/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VlVEbEZRZHpWUVhwWmpRY09TblNWZUwxaEZZQnpaaWFoa2pFNlJqSEkxVT0tLTExQlM4QTJNbWdYQlNBa25KdjYwWFE9PQ==--93d2be07ec99afc7e26e739b639aa808e1acd95d/t/m9ZxJ-NYunAoQ-sKS1f/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-11 19:32:50',0,NULL,NULL);
INSERT INTO `message` VALUES (211,0,0,0,10,'<0100017345997367-883c1a5d-6974-46b8-ad92-c64e201a0d05-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: The name &ldquo;C Tester&rdquo; was mentioned in 3 PDFs recently found by Academia, including one written by D.B. Amerine.','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 3 PDFs recently found by Academia, including one written by D.B. Amerine.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/STVCS1EzcktZWWkyU283TFVDdjQyWUszYStZU2Qydis1OFh2cWloeHZGUT0tLVAzeFNSRWdrWmljcXAxQmpIeXZ6L2c9PQ==--ede285dda5268375416ea23ce04e4f01af8b37cb/t/m9ZxJ-NYBv94A-A9o81/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/STVCS1EzcktZWWkyU283TFVDdjQyWUszYStZU2Qydis1OFh2cWloeHZGUT0tLVAzeFNSRWdrWmljcXAxQmpIeXZ6L2c9PQ==--ede285dda5268375416ea23ce04e4f01af8b37cb/t/m9ZxJ-NYBv94A-A9o81/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-12 19:35:52',0,NULL,NULL);
INSERT INTO `message` VALUES (212,0,0,0,12,'<e91596f2a8db5a83738d8b2de076372e43977e125986c0665f9dd3a61be5359f@m.meistertask.com>','MeisterTask',NULL,'4 MeisterTask Integrations to Boost Your Output','Connect MeisterTask withYour Favorite Productivity Tools\r\nWhether you&rsquo;re mapping out a grand project plan, championing support tickets, or communicating a team update, with MeisterTask integrations, we&rsquo;ve got you covered!\r\n\r\nMindMeister\r\nMap out your project plans in MindMeister, then turn them into actionable tasks in MeisterTask.\r\nhttps://email.m.meistertask.com/c/eJxNjklqxDAQRU9j7WwklaZaaJFN7lGaukU8NJZMrh85JNBQ1MT_n5d8kKhiZNVnFBpNkeRS0OTAgksuyJS5NWBlVoDWZiE1OhO5MbpgSkBGhKxBY5kU35Yt19bz2al9LfHY2NNDTIQFgo6loA1FIKlsgVAa0E4BW_2z91eb4GOSn6PKEa_2H7RSaHfQ-L_OI12xz3v-buOUXNgxBL93NdpW9_Tnmt8w5rr3_Dip12Of5dCx00dKNS4935qB_diorr-4l1fOcMe5Zd2_GdsPinFdIg\r\n\r\nZendesk\r\nCreate tasks in MeisterTask from incoming tickets and update Zendesk automatically as they progress.\r\nhttps://email.m.meistertask.com/c/eJxdTstqxDAQ-5rkluBH_JiDD3vpf9jjcdZsHovtNNCvr9tTKQwSkgah6IKABXHMjoAr0El4G4PyVhppow0iEjNaGkGLBGOICwVWI9NaJYhRes0DKakgDQvb551ybVSar68Zz318OpYYmoBgrfHWE9cIYWFWIEeRNMhxc8_W3nWQj0F89Lvv-39Nd8N2rp3e5YwXtumgu3YpGNedmOrAoQNetZ07lalS-cxI05-m6YuOSPXV38bi0MeMc6OftE9fd5-338mXW6xmljEzNpePRmvxLZ9H_QbSW15m\r\n\r\nSlack\r\nKeep your chat channels and MeisterTask projects in sync, via automatic Slack updates and section automations.\r\nhttps://email.m.meistertask.com/c/eJxdjs2KwzAMhJ8muSXY8v_Bh172PWxLTk3zU2KXvP66hcKyIDSjEXwM-ghOpjQWT44rpzMEi1EFK4ywaCMgMaOFAZLCGUMclLM6Ma1VdogiaB5JCeXyINk2b1Rqo7OF-pjTsY13nyOjgFob46KQEBInZ00G6ZBnQDuu_t7asw7iNsBPn-u6_mN6Gtdj6fI8D3ylNu101X4C47oL428PfZW90XKGRlNdQ3pMf0D9O54-BSxpbvROe-NlC2X9NH15aTWzjJmx-S-mHHv9BYf9WuE\r\n\r\nZapier\r\nSave precious time by automating your workflows between MeisterTask and 1,000+ apps using Zapier.\r\nhttps://email.m.meistertask.com/c/eJxdj8tuhiAQhZ9GdxgEuS1YdNP3GGBQUhUDWNM-fem_appM5swl50tOsI6ZxfsxWTSzMDIy0MEJ0FxxHbRjAamSXDFcuFEKZyaMlp5KKaIJgYOcHQouTBwWekwHptqwNKgfk8_HuFnJgc-RReboYmSIeobQYYvgCnwIetzt1tpVB_42sPdez_P8x_Sr2_Pa5So53L6RE5_aV0Zn2YXy3l6Tz-eJ_f8HQJ7UNvKV70IifOaSGhK4rkrums6VfMOVsHTrWKyHkPzU8Nfa46wHpP0V47aLllRTqsZm09lwLdBSPusPxIhmHQ\r\n\r\nhttps://email.m.meistertask.com/c/eJxdTjuuwjAQPE1cRvb6ty5cvIZ7bHZtsCDJU2KU6xOoENIUo9H8JE-QHLNquSTjU6hAKJMntNGi4ARSdAw2QnE2xVgM-ISBdQi-JhFLwUzFW5_q4PQ8zqXtvWyd9vvI66xuOQp6aygJgDbCxjIQYNWAUchxVY986_1_H-zfAJcTx3H81pwqMa_PpZ-sLb1cN-ptXXa1ZSZpPPby9p8XrjO1x2f6mR0GjVpH1fN36AWPJkyT\n\n',1,'2020-07-13 14:12:11',0,NULL,NULL);
INSERT INTO `message` VALUES (213,0,0,0,10,'<010001734adb039c-52f1d1e4-bc75-49e0-8b93-82108d18e624-000000@email.amazonses.com>','Academia.edu',NULL,'Congratulations on your 585th Mention! Get 50% off now. &ldquo;Tester, C&rdquo;: The name &ldquo;Tester, C&rdquo; was mentioned in 2 PDFs recently found by Academia, including one written by Quinn Hartman.','Dear Cadic,\r\r\n\r\r\nCongratulations on your 585th Mention!\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 2 PDFs recently found by Academia, including one written by Quinn Hartman.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/T2hzczZiUVBmaUdYYjJUclkwWXhtYjVMaFFKemEzdU12Q1R2YkZMeCt0TT0tLUJGeXNSTExmY1c3ZUpqYk10d1VpS1E9PQ==--1cb981a681e72403f8d28ab5875688b9ee834e10/t/m9ZxJ-NYJNwA3-AWHGq/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions-offsite-discounted-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/T2hzczZiUVBmaUdYYjJUclkwWXhtYjVMaFFKemEzdU12Q1R2YkZMeCt0TT0tLUJGeXNSTExmY1c3ZUpqYk10d1VpS1E9PQ==--1cb981a681e72403f8d28ab5875688b9ee834e10/t/m9ZxJ-NYJNwA3-AWHGq/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-13 20:05:35',0,NULL,NULL);
INSERT INTO `message` VALUES (214,0,0,0,10,'<010001734fe33b10-784f365c-decc-445d-87cc-9ad69f6b2d51-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: The name &ldquo;C Tester&rdquo; was mentioned in 2 PDFs recently found by Academia, including one written by Manish Nandanwar.','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 2 PDFs recently found by Academia, including one written by Manish Nandanwar.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/UlFYWCtRMHZXb0xWdWNIaVlIVWZJRWtjUEdUZlV1MXdGRTJXTkV4RWZnQT0tLThJS00ra1crd1RuVmtwMzM2aGFTVmc9PQ==--02b8571382133f665a5e36a51ee63c04e20bdd2b/t/m9ZxJ-NYRLABv-xsLmh/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-onsite-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/UlFYWCtRMHZXb0xWdWNIaVlIVWZJRWtjUEdUZlV1MXdGRTJXTkV4RWZnQT0tLThJS00ra1crd1RuVmtwMzM2aGFTVmc9PQ==--02b8571382133f665a5e36a51ee63c04e20bdd2b/t/m9ZxJ-NYRLABv-xsLmh/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-14 19:32:39',0,NULL,NULL);
INSERT INTO `message` VALUES (215,0,0,0,10,'<01000173550951aa-f9d1e51e-94eb-4027-bb0e-95bcc53c717c-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: Congratulations on your 590th Mention! 7 new mentions, including one in a Plant Science paper','Dear Cadic,\r\r\n\r\r\nCongratulations on your 590th Mention!\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 7 PDFs recently found by Academia, including a Plant Science paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Q0V2RGNkSlNrZktxMHNrdmMzVjN2SWFkRDRnZGZsRzZoYXEyZ0VwSDQzND0tLTFOa1Y3OFFadWhHTHRwWXBvMEVvM2c9PQ==--efb8386732ecf2d754c5f0206faae4b5cada8e7b/t/m9ZxJ-NYYUb0z-79vnN/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Q0V2RGNkSlNrZktxMHNrdmMzVjN2SWFkRDRnZGZsRzZoYXEyZ0VwSDQzND0tLTFOa1Y3OFFadWhHTHRwWXBvMEVvM2c9PQ==--efb8386732ecf2d754c5f0206faae4b5cada8e7b/t/m9ZxJ-NYYUb0z-79vnN/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-15 19:32:22',0,NULL,NULL);
INSERT INTO `message` VALUES (216,0,0,0,10,'<010001735a2fa9c0-8da6ec01-3785-412d-adcb-b7dbd21c6413-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: Congratulations on your 595th Mention! The name &ldquo;Tester, C&rdquo; was mentioned in 2 PDFs recently found by Academia, including one written by R Rai.','Dear Cadic,\r\r\n\r\r\nCongratulations on your 595th Mention!\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 2 PDFs recently found by Academia, including one written by R Rai.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Qi9sTnRZWFAzQUU1MDYxOVE0VmgxK1h5NDVFcHVERDExY21WZXB0Z29Tcz0tLUdMWWFKdk5TKzFjVWtJZmE0T3gwZmc9PQ==--e0e32a416089b9d651d55db3d13171b715b6e02c/t/m9ZxJ-NY51S1m-biHyqN/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-onsite-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Qi9sTnRZWFAzQUU1MDYxOVE0VmgxK1h5NDVFcHVERDExY21WZXB0Z29Tcz0tLUdMWWFKdk5TKzFjVWtJZmE0T3gwZmc9PQ==--e0e32a416089b9d651d55db3d13171b715b6e02c/t/m9ZxJ-NY51S1m-biHyqN/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-16 19:32:20',0,NULL,NULL);
INSERT INTO `message` VALUES (217,0,0,0,10,'<010001735f75c344-7c6055f0-6cb6-47a8-afd3-cdc9b7e2b5a9-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: Congratulations on your 600th Mention! The name &ldquo;C Tester&rdquo; was mentioned in 7 PDFs recently found by Academia, including one written by Mili Mandal.','Dear Cadic,\r\r\n\r\r\nCongratulations on your 600th Mention!\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 7 PDFs recently found by Academia, including one written by Mili Mandal.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/cDdQQVF5V29NNWJ6dFZncFlFc2FGYjRES1liUlJVRFQ5b09kS1NlenR4TT0tLUVycGxNQWpHSUxLbTRWNFdBUzBVaWc9PQ==--c8de7af80ee3c9676d2dc601568be61646e54335/t/m9ZxJ-NZdjF7K-bp2pmb/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/cDdQQVF5V29NNWJ6dFZncFlFc2FGYjRES1liUlJVRFQ5b09kS1NlenR4TT0tLUVycGxNQWpHSUxLbTRWNFdBUzBVaWc9PQ==--c8de7af80ee3c9676d2dc601568be61646e54335/t/m9ZxJ-NZdjF7K-bp2pmb/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-17 20:07:01',0,NULL,NULL);
INSERT INTO `message` VALUES (218,0,0,0,10,'<010001736492d25b-f576a867-c5e8-4415-a49f-892f3a2632d1-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: Congratulations on your 605th Mention! The name &ldquo;C Tester&rdquo; was mentioned in 6 PDFs recently found by Academia, including one written by Marvin Bruce Martin.','Dear Cadic,\r\r\n\r\r\nCongratulations on your 605th Mention!\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 6 PDFs recently found by Academia, including one written by Marvin Bruce Martin.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VnNtYmhEMHhMNXhxSWdOVCs5WUpOeTQ3b3NPWVRDRlNISEZjZUFDUnFIVT0tLUxkemFuUVZyVzRWSXBPV3E1OVdrTnc9PQ==--87d88fa452992e2dc84138e53e207ac911527503/t/m9ZxJ-NZkppvq-bttgQx/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VnNtYmhEMHhMNXhxSWdOVCs5WUpOeTQ3b3NPWVRDRlNISEZjZUFDUnFIVT0tLUxkemFuUVZyVzRWSXBPV3E1OVdrTnc9PQ==--87d88fa452992e2dc84138e53e207ac911527503/t/m9ZxJ-NZkppvq-bttgQx/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-18 19:56:51',0,NULL,NULL);
INSERT INTO `message` VALUES (219,0,0,0,10,'<0100017369b9ad78-6ad56427-505a-481e-bb4b-7f6cc0f9aa7c-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: Congratulations on your 610th Mention! The name &ldquo;Tester, C&rdquo; was mentioned in 1 PDF recently found by Academia, including one written by Ratarstvo i povrtarstvo.','Dear Cadic,\r\r\n\r\r\nCongratulations on your 610th Mention!\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 1 PDF recently found by Academia, including one written by Ratarstvo i povrtarstvo.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Q1B0MVRHQ0RROW82cVIyeW9GSUdMcWJqczFwN1RTaFFoOTBqWkpDcTV1UT0tLXhOWHVoc2wvRFZhczJnbjF2eHQrbXc9PQ==--884444335e97f566833863814f69719c12a30235/t/m9ZxJ-NZsxfeW-tMSxR/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Q1B0MVRHQ0RROW82cVIyeW9GSUdMcWJqczFwN1RTaFFoOTBqWkpDcTV1UT0tLXhOWHVoc2wvRFZhczJnbjF2eHQrbXc9PQ==--884444335e97f566833863814f69719c12a30235/t/m9ZxJ-NZsxfeW-tMSxR/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-19 19:57:24',0,NULL,NULL);
INSERT INTO `message` VALUES (220,0,0,0,10,'<010001736ed2d21a-18633248-460a-4a2b-bdc7-ead8dd2a516a-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 2 new mentions, including one in a Genetics paper','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 2 PDFs recently found by Academia, including a Genetics paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/K2phUFdDSVpmR1pWQlYydmY5eDhVNURCYlRldnk3RzR0d3VGWHNUUUNoYz0tLWJ0M1V6VW51VnZySmRiVnBOSHMyaUE9PQ==--f899c89b4b8ded5446f69d28189429f77e52a762/t/m9ZxJ-NZzAHTd-owhrF/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/K2phUFdDSVpmR1pWQlYydmY5eDhVNURCYlRldnk3RzR0d3VGWHNUUUNoYz0tLWJ0M1V6VW51VnZySmRiVnBOSHMyaUE9PQ==--f899c89b4b8ded5446f69d28189429f77e52a762/t/m9ZxJ-NZzAHTd-owhrF/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-20 19:42:57',0,NULL,NULL);
INSERT INTO `message` VALUES (221,0,0,0,10,'<01000173740df982-1af78ee8-5c79-41bc-a94a-5784c05a7490-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: Congratulations on your 615th Mention! Get 50% off now. The name &ldquo;Tester, C&rdquo; was mentioned in 5 PDFs recently found by Academia, including one written by Making EHS an Integral Part of Process Design.','Dear Cadic,\r\r\n\r\r\nCongratulations on your 615th Mention!\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 5 PDFs recently found by Academia, including one written by Making EHS an Integral Part of Process Design.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Y0E5QXNrRlFUdkdZaDJNN0JYcXZkZkV2THBjeFlNN1RaSTZyQ0tDVG9saz0tLVRIY1VEeHk3RHNLQzU3V2pVUWdsbEE9PQ==--05facfe5165d53b022db35919b74d0a3cc69ba50/t/m9ZxJ-NZGQ2Wz-vnzFx/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions-offsite-discounted-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/Y0E5QXNrRlFUdkdZaDJNN0JYcXZkZkV2THBjeFlNN1RaSTZyQ0tDVG9saz0tLVRIY1VEeHk3RHNLQzU3V2pVUWdsbEE9PQ==--05facfe5165d53b022db35919b74d0a3cc69ba50/t/m9ZxJ-NZGQ2Wz-vnzFx/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-21 20:05:41',0,NULL,NULL);
INSERT INTO `message` VALUES (222,0,0,0,10,'<01000173792413d6-d703b93a-07af-486d-8d91-46b8f1b253f2-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 1 new mention, including one in an Acoustics and Ultrasonics paper','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 1 PDF recently found by Academia, including an Acoustics and Ultrasonics paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/M1NqMStTNWNVUU9UNHZOYjRvbjJBVi83cWdFTkROMU5veERUSVB3R2Evbz0tLUxWa0tJRkNPMmlzRTQvV0wzVVM1eHc9PQ==--432139a091adc7cf80ed9f004ebe56720d0dfb5b/t/m9ZxJ-NZPTw9R-YrjfM/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/M1NqMStTNWNVUU9UNHZOYjRvbjJBVi83cWdFTkROMU5veERUSVB3R2Evbz0tLUxWa0tJRkNPMmlzRTQvV0wzVVM1eHc9PQ==--432139a091adc7cf80ed9f004ebe56720d0dfb5b/t/m9ZxJ-NZPTw9R-YrjfM/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-22 19:47:55',0,NULL,NULL);
INSERT INTO `message` VALUES (223,0,0,0,10,'<010001737e58d6e5-6115978b-ff23-40f4-a73d-df57945c24e9-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: Congratulations on your 620th Mention! 5 new mentions, including one in a Mechanical Engineering paper','Dear Cadic,\r\r\n\r\r\nCongratulations on your 620th Mention!\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 5 PDFs recently found by Academia, including a Mechanical Engineering paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/UkhSWSt0Y2REYXRWLzArYWNrWHg0QzZrRkhxVkN1eHNNS2NtUWFpUWhkND0tLUlXZEJQdndmeVE3UUxNMEo3Tk5BQUE9PQ==--a392b4459b9db62e9426fd752e0feeb091b7c64b/t/m9ZxJ-NZW5PXt-r9gvy/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/UkhSWSt0Y2REYXRWLzArYWNrWHg0QzZrRkhxVkN1eHNNS2NtUWFpUWhkND0tLUlXZEJQdndmeVE3UUxNMEo3Tk5BQUE9PQ==--a392b4459b9db62e9426fd752e0feeb091b7c64b/t/m9ZxJ-NZW5PXt-r9gvy/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-23 20:03:38',0,NULL,NULL);
INSERT INTO `message` VALUES (224,0,0,0,10,'<01000173837718e4-f17b22db-b558-4e70-a71d-111206bead12-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: Congratulations on your 625th Mention! 4 new mentions, including one in a Gastroenterology paper','Dear Cadic,\r\r\n\r\r\nCongratulations on your 625th Mention!\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 4 PDFs recently found by Academia, including a Gastroenterology paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/TE1RV0FyTVk4RXZ5TWFnYnJrVUhGLzNuaEd2aVZwZHJ6MkxPL2VmZ0JtZz0tLXBsOEZwNjFOSTY2cnVtSVhiUWM4RHc9PQ==--4bab088d0813a1ef5e29ca168d9e04b6ffcba79d/t/m9ZxJ-NZ4aVT3-w9iE3/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/TE1RV0FyTVk4RXZ5TWFnYnJrVUhGLzNuaEd2aVZwZHJ6MkxPL2VmZ0JtZz0tLXBsOEZwNjFOSTY2cnVtSVhiUWM4RHc9PQ==--4bab088d0813a1ef5e29ca168d9e04b6ffcba79d/t/m9ZxJ-NZ4aVT3-w9iE3/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-24 19:54:48',0,NULL,NULL);
INSERT INTO `message` VALUES (225,0,0,0,10,'<0100017388941eca-3bf69a4b-55fe-46d8-858f-d44c66dc3c28-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: Congratulations on your 635th Mention! The name &ldquo;C Tester&rdquo; was mentioned in 9 PDFs recently found by Academia, including one written by Erhardt R. Hehn.','Dear Cadic,\r\r\n\r\r\nCongratulations on your 635th Mention!\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 9 PDFs recently found by Academia, including one written by Erhardt R. Hehn.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VUV1bFlJWjAvK0NGSHNIbERsbXZCWWZUUldodE51ZFRzVDhxcFk0dGhKRT0tLWZoM1V5cWZKdTZmeVRIcmdQMjhkK1E9PQ==--aea4b4fe335b2b491e416fbfd8e44bb45444d7b2/t/m9ZxJ-N0bfCy1-BP3z9/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VUV1bFlJWjAvK0NGSHNIbERsbXZCWWZUUldodE51ZFRzVDhxcFk0dGhKRT0tLWZoM1V5cWZKdTZmeVRIcmdQMjhkK1E9PQ==--aea4b4fe335b2b491e416fbfd8e44bb45444d7b2/t/m9ZxJ-N0bfCy1-BP3z9/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-25 19:44:36',0,NULL,NULL);
INSERT INTO `message` VALUES (226,0,0,0,7,'<010101738a1d5e99-32a773a6-7857-41f4-9802-83de20b0fef4-000000@us-west-2.amazonses.com>','BrowserStack',NULL,'Terms of Service and Privacy Policy update','Hello,\r\n\r\nWe&#039;re updating our Privacy Policy (https://www.browserstack.com/privacy?ref=&amp;utm_campaign=newsletter-percy-tos-announcement-202007&amp;utm_content=Generic_Percy_ToS&amp;utm_medium=Email&amp;utm_source=Other_Notification&amp;utm_term=PrivacyPolicy) &amp; Terms of Service (https://www.browserstack.com/terms?ref=&amp;utm_campaign=newsletter-percy-tos-announcement-202007&amp;utm_content=Generic_Percy_ToS&amp;utm_medium=Email&amp;utm_source=Other_Notification&amp;utm_term=TermsOfService), and we encourage you to review the new version. Here is a quick summary of the changes:\r\n\r\n1. Updates due to the acquisition of Percy: We have made some basic changes to our Terms of Service and the Data Production Addendum therein to fulfill some specific requirements post our recent acquisition of Percy.\r\n\r\n2. Auto-Renewal &amp; Price Increase Cap: We have added an auto-renewal clause with a cap on the increase in the price at the time of renewal in our Terms of Service to ensure continued service to our customers without delays of renewing the subscription.\r\n\r\n3. Prior Notification of New Sub-processor: We have updated the sub-processor clause in our Data Protection Addendum to reflect a process change on how we notify our customers of new sub-processors.\r\n\r\n4. Brexit Update: We have updated our Privacy Policy to ensure compliance with the Brexit norms.\r\n\r\n5. Other Changes: We have made a few other changes in our Privacy Policy and Terms of Service to make the language clearer and helpful for our customers.\r\n\r\nNeed assistance? Please drop us a note at compliance@browserstack.com. As always, thank you for using BrowserStack.\r\n\r\nHappy Testing!\r\nThe BrowserStack Team\n\n',1,'2020-07-26 02:54:07',0,NULL,NULL);
INSERT INTO `message` VALUES (227,0,0,0,10,'<010001738dba95e0-2076093b-27f1-46d1-8b7b-d042e06cb0c5-000000@us-east-1.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: Congratulations on your 640th Mention! The name &ldquo;C Tester&rdquo; was mentioned in 6 PDFs recently found by Academia, including one written by Yunling Wang.','Dear Cadic,\r\r\n\r\r\nCongratulations on your 640th Mention!\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 6 PDFs recently found by Academia, including one written by Yunling Wang.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/a0tNcDdqd3pNaEZXaFF0UlN0bTFMVlp2ckh6K2ZMaVBCZVhEK2ZDZSs2OD0tLXoyTVFkR0ZSZjVNaEJReEgwc0Z6Z1E9PQ==--2fb63b0fbbaa996d026c20cb9288c1e2ed5e71d1/t/m9ZxJ-N0iokWZ-bkdVa9/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/a0tNcDdqd3pNaEZXaFF0UlN0bTFMVlp2ckh6K2ZMaVBCZVhEK2ZDZSs2OD0tLXoyTVFkR0ZSZjVNaEJReEgwc0Z6Z1E9PQ==--2fb63b0fbbaa996d026c20cb9288c1e2ed5e71d1/t/m9ZxJ-N0iokWZ-bkdVa9/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-26 19:44:43',0,NULL,NULL);
INSERT INTO `message` VALUES (228,0,0,0,10,'<0100017393248d29-7b6b7e4f-3591-45c8-a115-c90dfce955ff-000000@us-east-1.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: The name &ldquo;Tester, C&rdquo; was mentioned in 2 PDFs recently found by Academia, including one written by Dong In Jang.','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 2 PDFs recently found by Academia, including one written by Dong In Jang.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/UVpOUXFNeGZTaVF2S0R1Z0V1UjR6SVpBYTR0RHdzcEFNYm5scjlVSk0wbz0tLTZsUTVPZ1hwN3B6dVpKQytnRjZYVUE9PQ==--d8070a45d44310773e00f4982e7c4397cff67357/t/m9ZxJ-N0qTBeK-bpNWz3/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/UVpOUXFNeGZTaVF2S0R1Z0V1UjR6SVpBYTR0RHdzcEFNYm5scjlVSk0wbz0tLTZsUTVPZ1hwN3B6dVpKQytnRjZYVUE9PQ==--d8070a45d44310773e00f4982e7c4397cff67357/t/m9ZxJ-N0qTBeK-bpNWz3/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-27 20:58:34',0,NULL,NULL);
INSERT INTO `message` VALUES (229,0,0,0,10,'<0100017398210838-4bf63719-5bc8-488c-9a14-b9530fa904dd-000000@us-east-1.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: Congratulations on your 645th Mention! 5 new mentions, including one in an Orthodontics paper','Dear Cadic,\r\r\n\r\r\nCongratulations on your 645th Mention!\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 5 PDFs recently found by Academia, including an Orthodontics paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/NCttVGZ0bENtMW5WRHpVWDdSc05GSGRmZ0p3RmFCampqZEV6ZzFickVvZz0tLU9JUlJ4THZnUnJKdkw1STFDNlJoTXc9PQ==--30555161d539d678125a3fb5a642c46899978dcd/t/m9ZxJ-N0xMVZ2-DSD97/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/NCttVGZ0bENtMW5WRHpVWDdSc05GSGRmZ0p3RmFCampqZEV6ZzFickVvZz0tLU9JUlJ4THZnUnJKdkw1STFDNlJoTXc9PQ==--30555161d539d678125a3fb5a642c46899978dcd/t/m9ZxJ-N0xMVZ2-DSD97/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-28 20:12:49',0,NULL,NULL);
INSERT INTO `message` VALUES (230,0,0,0,10,'<010001739d3c1ad0-d2dc5322-66ca-4f71-b86c-4a61b6a55a50-000000@us-east-1.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: Congratulations on your 650th Mention! Get 50% off now. 2 new mentions, including one in an Immunology paper','Dear Cadic,\r\r\n\r\r\nCongratulations on your 650th Mention!\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 2 PDFs recently found by Academia, including an Immunology paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/eCtqaHBaU1BDK0JqeDFSWFkzWkozVGluMTBZV2wyU1grZXRUQkJOOUpNcz0tLWRxRmRqOFJMMTExVmhZM2l1NEJjU0E9PQ==--f028af41391bcaefc972ed97ac67b6919470a03f/t/m9ZxJ-N0ER1d1-0c1L/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions-offsite-discounted-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/eCtqaHBaU1BDK0JqeDFSWFkzWkozVGluMTBZV2wyU1grZXRUQkJOOUpNcz0tLWRxRmRqOFJMMTExVmhZM2l1NEJjU0E9PQ==--f028af41391bcaefc972ed97ac67b6919470a03f/t/m9ZxJ-N0ER1d1-0c1L/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-29 20:00:29',0,NULL,NULL);
INSERT INTO `message` VALUES (231,0,0,0,10,'<01000173a2559a8d-8bb7a340-6e48-4c5a-9faa-a4822fec9cc5-000000@us-east-1.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: Congratulations on your 660th Mention! 10 new mentions, including one in an Agronomy and Crop Science paper','Dear Cadic,\r\r\n\r\r\nCongratulations on your 660th Mention!\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 10 PDFs recently found by Academia, including an Agronomy and Crop Science paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ZkNnWWNkWXFWS2taQnNicjNtT1p0Y3pzWFRMOTB1bk5VcHJ2dkRnWkZpdz0tLWpJbmRBWkRNT3cyYU4yMmhTeGNXQmc9PQ==--492d1d5b2c6d426eee4344696ddc55985efb1279/t/m9ZxJ-N0MVArE-MMmus/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ZkNnWWNkWXFWS2taQnNicjNtT1p0Y3pzWFRMOTB1bk5VcHJ2dkRnWkZpdz0tLWpJbmRBWkRNT3cyYU4yMmhTeGNXQmc9PQ==--492d1d5b2c6d426eee4344696ddc55985efb1279/t/m9ZxJ-N0MVArE-MMmus/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-30 19:46:27',0,NULL,NULL);
INSERT INTO `message` VALUES (232,0,0,0,10,'<01000173a7732b4f-2e025ad4-0d64-47f4-8fa7-399da0f80556-000000@us-east-1.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: Congratulations on your 665th Mention! 6 new mentions, including one in a Physiology (medical) paper','Dear Cadic,\r\r\n\r\r\nCongratulations on your 665th Mention!\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 6 PDFs recently found by Academia, including a Physiology (medical) paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/SHd3UGhZU3VJTVBRUkpCRGordDcvdG9uZ3R1SnVXUWRYTWtXa2VGSjg5MD0tLWhCVVNFVVVBd3c5eHlxMkVRVnhoa2c9PQ==--d5d2f3d96fc8d725f5d1a1d9a003f0d50655ba50/t/m9ZxJ-N0U0tnM-btE8kH/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/SHd3UGhZU3VJTVBRUkpCRGordDcvdG9uZ3R1SnVXUWRYTWtXa2VGSjg5MD0tLWhCVVNFVVVBd3c5eHlxMkVRVnhoa2c9PQ==--d5d2f3d96fc8d725f5d1a1d9a003f0d50655ba50/t/m9ZxJ-N0U0tnM-btE8kH/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-07-31 19:36:50',0,NULL,NULL);
INSERT INTO `message` VALUES (233,0,0,0,10,'<01000173ac9904c3-8d256c14-1c38-4ed8-8903-9aaaaa0f97ad-000000@us-east-1.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: Congratulations on your 670th Mention! The name &ldquo;Tester, C&rdquo; was mentioned in 5 PDFs recently found by Academia, including one written by Joaquin V Martinez De Pinillos.','Dear Cadic,\r\r\n\r\r\nCongratulations on your 670th Mention!\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 5 PDFs recently found by Academia, including one written by Joaquin V Martinez De Pinillos.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ZEVuUnRYOGw0UEVUM3djTHlSZmlrTzVZK0NzRnQwRTU3TS9idG50UXh5Yz0tLTNlZmZMcGtzaGxxdmdRQXJZRW05dXc9PQ==--a62c546453950ea28d8c40c3cd02d75d22c138b9/t/m9ZxJ-N0170iW-y7SwC/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/ZEVuUnRYOGw0UEVUM3djTHlSZmlrTzVZK0NzRnQwRTU3TS9idG50UXh5Yz0tLTNlZmZMcGtzaGxxdmdRQXJZRW05dXc9PQ==--a62c546453950ea28d8c40c3cd02d75d22c138b9/t/m9ZxJ-N0170iW-y7SwC/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-01 19:36:16',0,NULL,NULL);
INSERT INTO `message` VALUES (234,0,0,0,12,'<26fe13500fb2709f8d139a5168487d21a0515b15ad5ca8eda1379764603789af@m.meistertask.com>','MeisterTask',NULL,'5 Little-Known Ways to Use MeisterTask','5 Little-Known WaysTo Use MeisterTask\r\nWhy use dozens of different tools when your versatile task manager can do it all? We&rsquo;ve put together five fantastic uses of MeisterTask you might not have thought of before.\r\n\r\nContent CreationLearn how the inspiring writer Belle B. Cooper uses MeisterTask to collect article ideas and related research for 3 content articles per week.\r\nhttps://email.m.meistertask.com/c/eJx1UMuKhDAQ_Bq9RfIyj4OHhWV-Y2iTVsMYHZK4sn-_cZnDsLDQVEEXXdWUH0ZupXNtGLiakIme0mnkmtrJeCYs9EwZabTnDGjP-pH14HsHBj0woa1WUlGhjYWpkTR2EUMumArkR-f22C6DBq215VJKpSftPFXOKOWhn6qnsrZdh6WUZ27ER8Nvdc7z_GtTt-O6z5U4ZaoSNRUYq7DsJwkkYUZIbiFlSYjE7VvBrZAI6YElbDOBVIJbMRP8wvRNTsTHlSZuR4n3vB_JYSM-32Ibri4pog9HrBJGCOtr6SA-IczbdVHurzBexfSP1KbBgQ-uK3j516bmy-63oWOQRlFDqW7L8PbA_cgwY_4B4AOILg\r\n\r\nEditorial CalendarCreate an editorial calendar to plan and display which of your articles are currently in the pipeline, in progress or in review.\r\nhttps://email.m.meistertask.com/c/eJx1kMtqxDAMRb8m2SX4_Vh4USjzG4NiKxnTOAm2Q36_TuliKBSEBPdKR0LBTcwK7_vomJqRcknIPDFN7GwC5RYkVUYYHRgFIqmcqIQgPRgMQLm2WglFuDYW5k6QNCaMpWKuUL5Gv6f-5bgRQUCDaYWWk4BBgZHS6mA0M5L1q3vVepSOf3Ts0eK6rr-Ypk7rvrTCCFWtEHsn05IYWuNRhroPPiPUuC0DbAOGWPccYR08rLgFyDecP86anmU_s8eOf75t6Zi6rdTmztQsTBDXX9FDOiAu2z1Rn37fKm6VNTP_Y_XZeQjRjxVvfnvMcuN-HnI6YRQxhOi-urcDnmeBBcs3XlaBKQ\r\n\r\nOutreach &amp; PR FunnelImprove your outreach with a simple PR funnel to organize, filter and categorize your press and blogger contacts.\r\nhttps://email.m.meistertask.com/c/eJx1UMtqxDAM_JrkluBH7NgHHwplf2ORX4lpnAQ_CP37OksPS6EgJDEjjcRYpYmcjOmDItw7TBlCXpMZSS8sphIY5mISsyUYEMNMYwaWGRDOAqaznPnEEZ2FBN9NKI7RhVxcKpC_RnPEflXSSS0RJ8wwb-xEhPbcMvDWcCmxZv2m1lLO3NGPjjxaXNf1V6ahejuWVgjCvBUkX31LSzqu4fuoaThqSQ7MOlyhrAMMOcRzc8OZBl_33W23On3UEp-5jRvX0c-3Mx3hNxWdDTU2ykUI2y9oIJ4Qlv3eKE9z7MXthTQy_UP1SRmwwYzF3frNmeWWezlS1SQ4EgjNfVFvDzxrhsXlHzuEgts\r\n\r\nGrowth Experiment TrackerTrack how your growth hacks develop, sometimes fail but hopefully mostly succeed, with a growth experiment project board.\r\nhttps://email.m.meistertask.com/c/eJx1kN2KhDAMhZ9G75S0tX8XvRhY5jWG9EctY61oxdffuuzFsLAQcsI55CPEG0v14FwbDRVjIIwDjJZK0KPyhGnkRKhBSU8JAifcEo6eO1TBI2FSSzEIYFJpHJsBUp9CPErYCx7v3uXUzkZWxOC4pOAUeiUZApBR2dEGbUGIdjFzKdvRsEdDn7Wu6_qLqa5d8lSFAhFVQN-zqm3OV1dyF9O2hBTW0mE37fkqczeje99E9jxLeh353F1o2NcHuqHijlLw8Uw1Cgnj8ms6TBvGab03ysvltVQ4reH-T9TuxqGPri_h5tdvTDfu5wunGZQABSDbYj4OeJ0HTuH4BlYqfaI\r\n\r\nSchool Team ManagerRead how Government education consultant, James Hannam uses MeisterTask to streamline schools by managing teams, tasks, training and budgets.\r\nhttps://email.m.meistertask.com/c/eJx1UF1rxCAQ_DXJm4cf0eiDD4Vyf-PY6JqzjTFEQ7h_X1P6UAqFZRdm2JlhvJ24GZzro-UqIBOS0jDxkZqgPRMGJFN60KPnDKhkcmISvHSg0QMToxnVoKgYtYHQDTTdEsZSca9QPm8up_5pjTfCMY6C4xRkME3VB889NdSbQE2_2GetW-nEW8fvbc7z_CvT0GnJczucMtUONddibUlywquQmgls2_Ii254_0FWSYIUZE66VRI9QSFzJKx87Ke6Z83JZiftR06M00GEn3n95dlxdVEIfj9QoTBCXH9BB2iDO6_VRHy6vtXnwRu7_UP1uHfjobhUv_VbTfMl913PYQSuqKR37an8FeBylpS9f6cKHeA\n\n',1,'2020-08-02 14:10:02',0,NULL,NULL);
INSERT INTO `message` VALUES (235,0,0,0,10,'<01000173b1bf35fd-d82a26b1-30bd-4c33-923a-7759e6e2b121-000000@us-east-1.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: Congratulations on your 675th Mention! 5 new mentions, including one in a Genetics(clinical) paper','Dear Cadic,\r\r\n\r\r\nCongratulations on your 675th Mention!\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 5 PDFs recently found by Academia, including a Genetics(clinical) paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/MWoyVDByVk9lbGVjcUNaWTBoSk51L0VqbEV5aE1YVko3Sm9HNzhZRi9OWT0tLVJjR1gvdGFJYmppUElPZVd1RG1vbEE9PQ==--a26fcccfd6c2fca25dfa46c9c12d2af999191d0d/t/m9ZxJ-N09fCwi-wsyMy/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/MWoyVDByVk9lbGVjcUNaWTBoSk51L0VqbEV5aE1YVko3Sm9HNzhZRi9OWT0tLVJjR1gvdGFJYmppUElPZVd1RG1vbEE9PQ==--a26fcccfd6c2fca25dfa46c9c12d2af999191d0d/t/m9ZxJ-N09fCwi-wsyMy/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-02 19:36:06',0,NULL,NULL);
INSERT INTO `message` VALUES (236,0,0,0,4,'<4960444a-6fe5-3bab-5379-0af0946c4f7a@monday.com>','monday.com',NULL,'4 templates to organize projects at Test Municipio','[https://s3.amazonaws.com/monday-activemail/shared/monday-logo-top-100.png] pixel [https://amcdn.monday.com/images/0/b07f8169cf1e51471a0aa71338a19cdc.png] \r\nOrganize Q3 and take some time for yourself (?) New quarter, new goals. Start by\r\norganizing everything&mdash;create a roadmap, map out the steps for each one of your\r\nprojects, list out all of your tasks. And you know what? Planning is work, too! \r\ntest514623.monday.com\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRrMk5UVXhNek0xTENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFPVFkwTmpRNU16UjkuMTVuQl9WS3RLRV9WSjhkMDFqbUNyQmh1a3BraXJjNjNtZlVTSmdmX0NWcyZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9anVseTIwMjB0ZW1wbGF0ZXMmcGF0aD1ib2FyZHMvbmV3ZXN0X3B1YmxpY19ib2FyZCIsIm0iOiJiMDdmODE2OWNmMWU1MTQ3MWEwYWE3MTMzOGExOWNkYyIsImlhdCI6MTU5NjQ2NDkzNH0.UqIbLatnTLCBmRmJdxSpgyvZB5Uo4AlUKCNRGM5iG3I] \r\nStart with these 4 templates \r\n[https://dapulse-res.cloudinary.com/image/upload/v1567601973/email_marketing/Group_22.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRrMk5UVXhNek0xTENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFPVFkwTmpRNU16UjkuMTVuQl9WS3RLRV9WSjhkMDFqbUNyQmh1a3BraXJjNjNtZlVTSmdmX0NWcyZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9anVseTIwMjB0ZW1wbGF0ZXMmcGF0aD1hY2NvdW50cy9hZGRfYm9hcmRfdGVtcGxhdGU_aWQ9cHJvamVjdF9tYW5hZ21lbnRfdGVhbV90YXNrcyIsIm0iOiJiMDdmODE2OWNmMWU1MTQ3MWEwYWE3MTMzOGExOWNkYyIsImlhdCI6MTU5NjQ2NDkzNH0.LtRsSFs_AIbLnSIpojUan2CJjXWzB_4ndwHJZc_6u5g] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1567601973/email_marketing/Group_23.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRrMk5UVXhNek0xTENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFPVFkwTmpRNU16UjkuMTVuQl9WS3RLRV9WSjhkMDFqbUNyQmh1a3BraXJjNjNtZlVTSmdmX0NWcyZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9anVseTIwMjB0ZW1wbGF0ZXMmcGF0aD1hY2NvdW50cy9hZGRfYm9hcmRfdGVtcGxhdGU_aWQ9cHJvamVjdF9tYW5hZ21lbnRfc2luZ2xlX3Byb2plY3RfdHJhY2tpbmciLCJtIjoiYjA3ZjgxNjljZjFlNTE0NzFhMGFhNzEzMzhhMTljZGMiLCJpYXQiOjE1OTY0NjQ5MzR9.UC6uTfVib-tpLTKG9pPhtuKPo23pQereI8Ro0Eg1OY4] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1567601973/email_marketing/Group_24.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRrMk5UVXhNek0xTENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFPVFkwTmpRNU16UjkuMTVuQl9WS3RLRV9WSjhkMDFqbUNyQmh1a3BraXJjNjNtZlVTSmdmX0NWcyZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9anVseTIwMjB0ZW1wbGF0ZXMmcGF0aD1hY2NvdW50cy9hZGRfYm9hcmRfdGVtcGxhdGU_aWQ9c2hhcmVfcHJvamVjdHNfd2l0aF95b3VyX2NsaWVudHMiLCJtIjoiYjA3ZjgxNjljZjFlNTE0NzFhMGFhNzEzMzhhMTljZGMiLCJpYXQiOjE1OTY0NjQ5MzR9.COl1vY3HlG6lbxuAmnf1UHMWu-Wv2wThPxLpid1ZMmc] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1567601973/email_marketing/Group_25.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRrMk5UVXhNek0xTENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFPVFkwTmpRNU16UjkuMTVuQl9WS3RLRV9WSjhkMDFqbUNyQmh1a3BraXJjNjNtZlVTSmdmX0NWcyZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9anVseTIwMjB0ZW1wbGF0ZXMmcGF0aD1hY2NvdW50cy9hZGRfYm9hcmRfdGVtcGxhdGU_aWQ9cHJvamVjdF9tYW5hZ21lbnRfcHJvY2Vzc19tYW5hZ21lbnQiLCJtIjoiYjA3ZjgxNjljZjFlNTE0NzFhMGFhNzEzMzhhMTljZGMiLCJpYXQiOjE1OTY0NjQ5MzR9.w9XgGbJeHCTYKrLAFVgL9p-yAp1v0cL3wBQSSlQLf1o] \r\nLogin\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tIiwibSI6ImIwN2Y4MTY5Y2YxZTUxNDcxYTBhYTcxMzM4YTE5Y2RjIiwiaWF0IjoxNTk2NDY0OTM0fQ.YAXxYQs7KHZKPjGhLoqV2A1gabKN2d23wr01rdD6zIE] \r\n&bull; Webinars\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibW9uZGF5LmNvbS93ZWJpbmFycy8iLCJtIjoiYjA3ZjgxNjljZjFlNTE0NzFhMGFhNzEzMzhhMTljZGMiLCJpYXQiOjE1OTY0NjQ5MzR9.jrVxG_S8wA0moJX3-F81tHx_rUFcJ1Wg28BgUgG4-8c] \r\n&bull; FAQ\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoic3VwcG9ydC5tb25kYXkuY29tIiwibSI6ImIwN2Y4MTY5Y2YxZTUxNDcxYTBhYTcxMzM4YTE5Y2RjIiwiaWF0IjoxNTk2NDY0OTM0fQ.Lq88fT1nv00Y7ofJI09mf6slvCP1_GGrt0DFeb-EdQU] \r\n&bull; Community\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoiY29tbXVuaXR5Lm1vbmRheS5jb20iLCJtIjoiYjA3ZjgxNjljZjFlNTE0NzFhMGFhNzEzMzhhMTljZGMiLCJpYXQiOjE1OTY0NjQ5MzR9.7lYCyZxIszKTG6DfN-aGtHdXlXiro5018cZ8Upnzbrg]  \r\n\r\nFollow us: \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138361/email_marketing/footer/Facebook.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LmZhY2Vib29rLmNvbS9tb25kYXlkb3Rjb20iLCJtIjoiYjA3ZjgxNjljZjFlNTE0NzFhMGFhNzEzMzhhMTljZGMiLCJpYXQiOjE1OTY0NjQ5MzR9.OptTlTidKSiLNVhfWI_-n6HN-v7P8oN4v8avNgZFMaI] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138361/email_marketing/footer/Youtube.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LnlvdXR1YmUuY29tL2NoYW5uZWwvVUNBOVV2QmlLSGx5MTVyTjh1X0ttM0JRIiwibSI6ImIwN2Y4MTY5Y2YxZTUxNDcxYTBhYTcxMzM4YTE5Y2RjIiwiaWF0IjoxNTk2NDY0OTM0fQ.jh9lsVkDMLv3CBU8XAcRRMOUY3Qqs0erJBpgtJO5xNY] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138359/email_marketing/footer/LinkedIN.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LmxpbmtlZGluLmNvbS9jb21wYW55LzI1MjUxNjkvIiwibSI6ImIwN2Y4MTY5Y2YxZTUxNDcxYTBhYTcxMzM4YTE5Y2RjIiwiaWF0IjoxNTk2NDY0OTM0fQ.C2RwAD6n-YJKhdfvlmvPVj2w6RNcOEQZ-ssFtN3uAhk] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138358/email_marketing/footer/Twitter.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidHdpdHRlci5jb20vbW9uZGF5ZG90Y29tIiwibSI6ImIwN2Y4MTY5Y2YxZTUxNDcxYTBhYTcxMzM4YTE5Y2RjIiwiaWF0IjoxNTk2NDY0OTM0fQ.ygYZiqMc69woBzveKsclcuwee9ZqmH22xxEVujVkd28]  \r\n\r\nmonday.com logo [https://amcdn.monday.com/images/1/b07f8169cf1e51471a0aa71338a19cdc.png] monday.com [https://dapulse-res.cloudinary.com/image/upload/v1569157981/email_marketing/footer/monday-200x200.png] \r\n\r\nTel Aviv \r\n52 Menachem Begin Road \r\nTel Aviv 6713701 Israel \r\n\r\nNew York \r\n34 W 14th St. \r\nNew York, NY, 10011 United States Take monday.?com [href] everywhere with you \r\n[https://s3.amazonaws.com/monday-activemail/shared/download_android_app.png ] [\r\nhttps://go.onelink.me/wwJQ?pid=referral_install&amp;c=email_marketing&amp;email_source=trial&amp;type=android&amp;c=footer\r\n] [https://s3.amazonaws.com/monday-activemail/shared/download_ios_app.png ]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoiZ28ub25lbGluay5tZS93d0pRP3BpZD1yZWZlcnJhbF9pbnN0YWxsJmM9ZW1haWxfbWFya2V0aW5nJmVtYWlsX3NvdXJjZT10cmlhbCZ0eXBlPWlwaG9uZSZjPWZvb3RlciAiLCJtIjoiYjA3ZjgxNjljZjFlNTE0NzFhMGFhNzEzMzhhMTljZGMiLCJpYXQiOjE1OTY0NjQ5MzR9.uiR99KSgrT2BzrfBwk_5a3d-YKHzzDxmvcTm8tU83Po]  \r\n\r\nThis email was sent to you regarding your test514623.monday.?com [href] account.\r\nIf you wish to no longer receive emails from us you can unsubscribe\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibGlua3MubW9uZGF5LmNvbS91bnN1YnNjcmliZT91PWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUp0SWpvaVlqQTNaamd4TmpsalpqRmxOVEUwTnpGaE1HRmhOekV6TXpoaE1UbGpaR01pTENKcFlYUWlPakUxT1RZME5qUTVNelI5LkpjSEV3X0dSYkVTRFlmc1ZkamVGS3FPX01lMUVScGpUeF9MMHZDSnNUZDgiLCJtIjoiYjA3ZjgxNjljZjFlNTE0NzFhMGFhNzEzMzhhMTljZGMiLCJpYXQiOjE1OTY0NjQ5MzR9.nANf_-wvxttcXrw8zVabhlCoTD9kQ_somYt3yk6Yvbo]\r\n. \r\n\r\nWhy did I receive this email?\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibW9uZGF5LmNvbS90ZXJtcy9lbWFpbHMiLCJtIjoiYjA3ZjgxNjljZjFlNTE0NzFhMGFhNzEzMzhhMTljZGMiLCJpYXQiOjE1OTY0NjQ5MzR9.N5SFrpkhMpYZ8OuWyMF5Ngmfw8OhIMK9Rmlb-b8TH-E]\n\n',1,'2020-08-03 09:29:00',0,NULL,NULL);
INSERT INTO `message` VALUES (237,0,0,0,20,'<46888044a17f694e50edbb77a772936aaeeec8e4-20129539-110799789@google.com>','Google Ads',NULL,'Important updates about GDPR compliance','Google Ads\r\n\r\nImportant updates about GDPR compliance\r\n\r\nDear Partner,\r\n\r\n\r\nAs a result of the recent  Court of Justice of the European Union ruling on  \r\ndata  \r\ntransfers&lt;https://www.google.com/appserve/mkt/p/AD-FnEyItT7EhHAW0_jwccssVCO1XDzB2yLArpe1pfj_tArVVL9SHlr_NBH9Td_WwKxrxRUTykYldA_iKHNcunkcuFvmGUC2IZcu7zw_CsbLI3HltvPTVnUYtOoYdCJCulRavroqHbxHmXkGZqZazutEEK5jr0J1r85dm5A&gt;,  \r\ninvalidating the Privacy Shield, Google will be moving to Standard  \r\nContractual Clauses (SCCs) for transfers of online advertising and  \r\nmeasurement personal data out of the Europe Economic Area, Switzerland and  \r\nthe UK.\r\n\r\n\r\nWe will therefore be updating our existing  Google Ads Data Processing  \r\nTerms&lt;https://www.google.com/appserve/mkt/p/AD-FnEwrwX-Acv5QptddpdzwO44pWKEG09-bhCJRog5oqnJtjYgYrRVgocgnaF0TZueXcuhya7nV94LrFyMDH5PaUJNab5IdItBSaZ2nBJhTra_4JwmPThe0-rwmz5EquJkmSMHGDUw&gt;,   \r\nGoogle Ads Controller-Controller Data Protection  \r\nTerms&lt;https://www.google.com/appserve/mkt/p/AD-FnEynTsoHIZt-bTjfyizgFFDSwOWKCTqsU2i9QLpOl2cl0oVygGTM8swCu4iQa9woRLukgrj9zJcJ5-RnCQqszze5E9wbpyrrQOvfSy64hpmC1oh81hDsgEL-XaoarIf2nctaAFXv&gt;  \r\nand  Google Measurement Controller-Controller Data Protection  \r\nTerms&lt;https://www.google.com/appserve/mkt/p/AD-FnEw-zo0dRghBNKiHRjxdfx6rZRzv3M9PNc6psL9nc4LkGjLr1ELgnWqD3Y7i4xE087H_zFm7Xg0K9AiX6EJv3MtRtMmmT_psQEAxN6QHlQZSUhdU8Uk7Ad58BLy1iflFNRdI2w&gt;  \r\nto add the relevant SCCs as adopted by the European Commission.\r\n\r\n\r\nWe are making these updates solely to address GDPR compliance. The updates  \r\ndo not give Google additional rights over data. If the Google Ads Data  \r\nProcessing Terms or Google Ads Controller-Controller Data Protection Terms  \r\nare already part of your contract (or if you have separately accepted the  \r\nGoogle Measurement Controller-Controller Data Protection Terms where  \r\navailable), the updates will apply from August 12, 2020.\r\n\r\n\r\nFor more information,  please see this article that we will continue to  \r\nupdate&lt;https://www.google.com/appserve/mkt/p/AD-FnEyldhGW5hsrEKcDo4CGg6UnDd2bdj0jzmPsOcn5YBwQJNy7de4mgVYDQuQSqnFfp4ZeyeMZS3DREPc6Jq2-Dug4fqBTXbAmYi9b_bqT9v4Jwwqef4IDlcRqcHtipQJ9hVLc-Q&gt;  \r\nor (if applicable) speak to your Google representative.\r\n\r\n\r\n\r\nThe Google Team\r\n\r\nYou have received this mandatory email service announcement to update you  \r\nabout important changes to your Google product or account.\r\n\r\nGoogle\r\n\r\n&copy; 2020 Google LLC 1600 Amphitheatre Parkway, Mountain View, CA 94043\n\n',1,'2020-08-03 13:28:36',0,NULL,NULL);
INSERT INTO `message` VALUES (238,0,0,0,10,'<01000173b6e71b5c-47831c47-f944-4f69-ba37-011f3f8ecbc6-000000@us-east-1.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: Congratulations on your 680th Mention! 5 new mentions, including one in a Cardiology and Cardiovascular Medicine paper','Dear Cadic,\r\r\n\r\r\nCongratulations on your 680th Mention!\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 5 PDFs recently found by Academia, including a Cardiology and Cardiovascular Medicine paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/S1N5VVNCaExDbkdQemNHTm1xRmo1QlU0NUk2aTF0ZWJETUVpeW95cTN1QT0tLWF6QUtkeEtFN2h4aWQ2SkFoYWhaMmc9PQ==--6f9a45d3b121912af46fda73650f66d91ce0e805/t/m9ZxJ-N1goNU1-bh5XjH/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/S1N5VVNCaExDbkdQemNHTm1xRmo1QlU0NUk2aTF0ZWJETUVpeW95cTN1QT0tLWF6QUtkeEtFN2h4aWQ2SkFoYWhaMmc9PQ==--6f9a45d3b121912af46fda73650f66d91ce0e805/t/m9ZxJ-N1goNU1-bh5XjH/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-03 19:37:47',0,NULL,NULL);
INSERT INTO `message` VALUES (239,0,0,0,10,'<01000173bc0d128d-b445fbad-41f7-4a9d-8415-01118e49533b-000000@us-east-1.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 2 new mentions, including one in a Genetics(clinical) paper','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 2 PDFs recently found by Academia, including a Genetics(clinical) paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/RGhLRlFVakFBWUJEbEFZWUtCTk1tWjJ6eFpPelBZbDJNZmZFU0d0M1BVND0tLVRoMHFCQllkaFNOOVdBVm51eXBtT0E9PQ==--8adc5fc03fc679fecd59b4fbcc3521171d1b5733/t/m9ZxJ-N1owmW1-bjf0Zw/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/RGhLRlFVakFBWUJEbEFZWUtCTk1tWjJ6eFpPelBZbDJNZmZFU0d0M1BVND0tLVRoMHFCQllkaFNOOVdBVm51eXBtT0E9PQ==--8adc5fc03fc679fecd59b4fbcc3521171d1b5733/t/m9ZxJ-N1owmW1-bjf0Zw/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-04 19:37:21',0,NULL,NULL);
INSERT INTO `message` VALUES (240,0,0,0,10,'<01000173c132e23c-1f16a8eb-ee0d-4e4f-81ae-6b2bef5e727b-000000@us-east-1.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: Congratulations on your 690th Mention! 7 new mentions, including one in a Genetics paper','Dear Cadic,\r\r\n\r\r\nCongratulations on your 690th Mention!\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 7 PDFs recently found by Academia, including a Genetics paper.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/dHhsK3p2eW9EbTJjY1pNMkwzVzBZaWQ5amNqaE1vd3c2RTRNN0dmM0R1VT0tLWN3Y1YvMG5rMFRLYXFDT09MdFkySnc9PQ==--d079bdd5085af9ed16c6a4e9f6532c6462debc2e/t/m9ZxJ-N1vDTai-bndVpJ/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/dHhsK3p2eW9EbTJjY1pNMkwzVzBZaWQ5amNqaE1vd3c2RTRNN0dmM0R1VT0tLWN3Y1YvMG5rMFRLYXFDT09MdFkySnc9PQ==--d079bdd5085af9ed16c6a4e9f6532c6462debc2e/t/m9ZxJ-N1vDTai-bndVpJ/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-05 19:36:45',0,NULL,NULL);
INSERT INTO `message` VALUES (241,0,0,0,10,'<01000173c66045a8-732226f9-a569-4f85-9137-d2a7f9f817dd-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: Congratulations on your 695th Mention! Get 50% off now. The name &ldquo;C Tester&rdquo; was mentioned in 7 papers discovered by Academia, including one published last year','Dear Cadic,\r\r\n\r\r\nCongratulations on your 695th Mention!\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 7 papers discovered by Academia, including one published last year\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/U0NsNW04MndhSElOUDVYck84UUp3ZjBOREx6SVJVRHJyazFOSlhNK3pERT0tLVowV1BrUzliVDRNZk8wNEJvWVFSbUE9PQ==--ed82aa49033f6eea7332b3c846bc7e635fe11d85/t/m9ZxJ-N1CPNwe-FCKzK/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions-offsite-discounted-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/U0NsNW04MndhSElOUDVYck84UUp3ZjBOREx6SVJVRHJyazFOSlhNK3pERT0tLVowV1BrUzliVDRNZk8wNEJvWVFSbUE9PQ==--ed82aa49033f6eea7332b3c846bc7e635fe11d85/t/m9ZxJ-N1CPNwe-FCKzK/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-06 19:44:25',0,NULL,NULL);
INSERT INTO `message` VALUES (242,0,0,0,10,'<01000173cb82387d-e996b2e4-8624-4b17-8fc7-b922fe75dda9-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: Congratulations on your 700th Mention! The name &ldquo;Tester, C&rdquo; was mentioned in 4 papers discovered by Academia, including one published last year','Dear Cadic,\r\r\n\r\r\nCongratulations on your 700th Mention!\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 4 papers discovered by Academia, including one published last year\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/K0JiN2pqZkpiN2p4QkNqamdyZ2xldlhvc293czNueTNBdXEvRlZqN2liRT0tLTJyZysyT3hialNPenBkT1hzMXgxeXc9PQ==--50c544dff378ed9e0283b6c84f67bf8682658b7c/t/m9ZxJ-N1KV5kt-oAaZb/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/K0JiN2pqZkpiN2p4QkNqamdyZ2xldlhvc293czNueTNBdXEvRlZqN2liRT0tLTJyZysyT3hialNPenBkT1hzMXgxeXc9PQ==--50c544dff378ed9e0283b6c84f67bf8682658b7c/t/m9ZxJ-N1KV5kt-oAaZb/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-07 19:39:37',0,NULL,NULL);
INSERT INTO `message` VALUES (243,0,0,0,10,'<01000173d0a6933e-f5de2c91-2486-4123-a850-947a59ec6c00-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: Congratulations on your 705th Mention! The name &ldquo;C Tester&rdquo; was mentioned in 3 papers discovered by Academia, including one published last year','Dear Cadic,\r\r\n\r\r\nCongratulations on your 705th Mention!\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 3 papers discovered by Academia, including one published last year\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/U3hZTlZVRnZrVHhjNXcyME84NkZYUmZpWmtFQWdYWHorOCtINUd1YXJ2VT0tLXJKMzZQVzlUQlc1TXhicjF1eUV0N2c9PQ==--a60d901000e468e2bed6d1b25ece2527a7e6da69/t/m9ZxJ-N1S27Yc-maTaK/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/U3hZTlZVRnZrVHhjNXcyME84NkZYUmZpWmtFQWdYWHorOCtINUd1YXJ2VT0tLXJKMzZQVzlUQlc1TXhicjF1eUV0N2c9PQ==--a60d901000e468e2bed6d1b25ece2527a7e6da69/t/m9ZxJ-N1S27Yc-maTaK/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-08 19:37:25',0,NULL,NULL);
INSERT INTO `message` VALUES (244,0,0,0,10,'<01000173d5cc95f2-4dd053b5-5e9a-4522-9e3b-cc300a3194a1-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: The name &ldquo;C Tester&rdquo; is mentioned in a paper published in Iowa Geological Survey Annual Report','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; is mentioned in a paper published in Iowa Geological Survey Annual Report\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/WTI1QkEvbVhLejZMWVlqV3IwRk9WS1k0QncxTnZ5TnRZUzZzWWZ1VHJUWT0tLStoUHBIa1RnemxEbHRXSFpGeG4za3c9PQ==--89eacbce298efdc0eeb81790d1a01ea2f0fbba34/t/m9ZxJ-N10aGM4-bwN5L5/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/WTI1QkEvbVhLejZMWVlqV3IwRk9WS1k0QncxTnZ5TnRZUzZzWWZ1VHJUWT0tLStoUHBIa1RnemxEbHRXSFpGeG4za3c9PQ==--89eacbce298efdc0eeb81790d1a01ea2f0fbba34/t/m9ZxJ-N10aGM4-bwN5L5/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-09 19:37:03',0,NULL,NULL);
INSERT INTO `message` VALUES (245,0,0,0,10,'<01000173daf2712a-afdecf5e-2fd8-4887-b900-18ef01a2fbc0-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: 2 new mentions, including one in a paper uploaded to Academia by someone in Caracas, Venezuela','Dear cadic,\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 2 papers recently discovered by Academia, including one by someone in Caracas, Venezuela.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/SDRFK2VzOVJoeFZFOXVlOHBmTHJwMWxTWmFnTW5rR2dvQjV1OElTOVFwRT0tLXpEclpjME0vTzFCRzh2WmFEMm4vS2c9PQ==--a0a0337bbfc856659ec7a197b28509108b5f0910/t/m9ZxJ-N17idMK-bhGy6m/upgrade?feature=name_mentions&amp;trigger=new-name-mentions\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/SDRFK2VzOVJoeFZFOXVlOHBmTHJwMWxTWmFnTW5rR2dvQjV1OElTOVFwRT0tLXpEclpjME0vTzFCRzh2WmFEMm4vS2c9PQ==--a0a0337bbfc856659ec7a197b28509108b5f0910/t/m9ZxJ-N17idMK-bhGy6m/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-10 19:36:29',0,NULL,NULL);
INSERT INTO `message` VALUES (246,0,0,0,3,'<fefd0de7a2584495ec01708dc8fd36b3bed2d74c-20129528-110804029@google.com>','Firebase',NULL,'[Legal Notice] Data Processing and Security Terms update to address the invalidation of EU-US Privacy Shield','Firebase\r\n\r\n\r\n\r\nInformation regarding Firebase and EU-US Privacy Shield.\r\n\r\n\r\n\r\nHi cadic,\r\n\r\nWe are writing to let you know that we are updating the Firebase Data  \r\nProcessing and Security Terms and Crashlytics and App Distribution Data  \r\nProcessing and Security Terms.\r\n\r\nWhat happened?\r\n\r\nA recent ruling by the Court of Justice of the European Union invalidated  \r\nthe EU-US Privacy Shield Framework, but did not invalidate Standard  \r\nContractual Clauses (SCCs) as a lawful transfer mechanism for personal data  \r\ntransferred outside of the EU, Switzerland or the UK.\r\n\r\nWe are updating the Firebase Data Processing and Security Terms and  \r\nCrashlytics and App Distribution Data Processing and Security Terms to add  \r\nthe relevant SCCs as adopted by the European Commission, which, as per the  \r\nruling, can continue to be a valid legal mechanism to transfer data outside  \r\nof the EU, Switzerland or the UK.\r\n\r\nIf the EU&#039;s General Data Protection Regulation or equivalent legislation in  \r\nSwitzerland or the UK (collectively, the GDPR) applies to your use of  \r\nFirebase, the updated Data Processing and Security Terms will deem the SCCs  \r\nto apply automatically. If the GDPR does not apply to your use of Firebase,  \r\nthese updates have no practical impact.\r\n\r\nWhat do you need to do?\r\n\r\nNo action is required on your part to accept these updates, which apply  \r\nfrom August 12, 2020.\r\n\r\nIf you are not the right person to review the updated Data Processing and  \r\nSecurity Terms or this notice, please forward this notice to the  \r\nappropriate contact for your organization, such as your legal or compliance  \r\nteam.\r\n\r\nIf you have any questions or need any assistance, feel free to reach out to  \r\nus.\r\n\r\nThanks,\r\n\r\nMike, on behalf of the Firebase team\r\n\r\n\r\n\r\nYou have received this mandatory service announcement to update you about  \r\nimportant changes to Firebase or your account.\r\n\r\n\r\n\r\n\r\nGoogle &copy; 2020 Google LLC\r\n1600 Amphitheatre Parkway\r\nMountain View, CA 94043 USA\n\n',1,'2020-08-10 20:05:51',0,NULL,NULL);
INSERT INTO `message` VALUES (247,0,0,0,10,'<01000173e018d1ef-b2f91b65-ed41-42e7-8cd2-3657c7ed888f-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: The name &ldquo;Tester, C&rdquo; was mentioned in 2 papers discovered by Academia, including one published last year','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 2 papers discovered by Academia, including one published last year\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/SzBXMHVTNDNEZDQ3S0hBenFJRTh1cUpjcUJTS1dOaUpGSlh3elB1MTdWMD0tLWJFODBFV09iVVpzUGdKenJnTzRUTXc9PQ==--e95cc64e241132b1a59d1ad9f2ac05df78329c94/t/m9ZxJ-N2eqVk3-81BhB/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/SzBXMHVTNDNEZDQ3S0hBenFJRTh1cUpjcUJTS1dOaUpGSlh3elB1MTdWMD0tLWJFODBFV09iVVpzUGdKenJnTzRUTXc9PQ==--e95cc64e241132b1a59d1ad9f2ac05df78329c94/t/m9ZxJ-N2eqVk3-81BhB/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-11 19:36:30',0,NULL,NULL);
INSERT INTO `message` VALUES (248,0,0,0,10,'<01000173e53f2871-033344d4-e944-4849-ac23-8f9352bd55a9-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: The name &ldquo;Tester, C&rdquo; was mentioned in 4 papers discovered by Academia, including one published in Dalton Transactions','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 4 papers discovered by Academia, including one published in Dalton Transactions\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VHhJTDkyRnoxZWQ0UUlnOFIxc3ZaRzFiYkcyZ1hGNUFVbS91allDU1dhdz0tLWdURy9hb0ZqSlEyQnhlMFF4Y2Z4SVE9PQ==--73b5b8ae6303919f4849f12b3b4e432fa7740237/t/m9ZxJ-N2myAMj-7acGb/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-onsite-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VHhJTDkyRnoxZWQ0UUlnOFIxc3ZaRzFiYkcyZ1hGNUFVbS91allDU1dhdz0tLWdURy9hb0ZqSlEyQnhlMFF4Y2Z4SVE9PQ==--73b5b8ae6303919f4849f12b3b4e432fa7740237/t/m9ZxJ-N2myAMj-7acGb/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-12 19:36:29',0,NULL,NULL);
INSERT INTO `message` VALUES (249,0,0,0,10,'<01000173ea658ce7-13a32270-69e5-4f95-9368-82118d5788b7-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: The name &ldquo;Tester, C&rdquo; is mentioned in a paper published in Proceedings of the International Conference on Imaging Theory and Applications and International Conference on Information Visualization Theory and Applications IMAGAPP','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; is mentioned in a paper published in Proceedings of the International Conference on Imaging Theory and Applications and International Conference on Information Visualization Theory and Applications IMAGAPP\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/dlRiVTk5TVR6TGlDZUkxdlo0LzQ2T3BrM3JlNElxaWd2SFNhcEtHbU4wRT0tLXpNaFpJUjcwU0NWcU1jYm05dExoY2c9PQ==--e04604c090f553a7f8845931fc5a30ad9b8eae6d/t/m9ZxJ-N2tGhLz-rHNtz/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/dlRiVTk5TVR6TGlDZUkxdlo0LzQ2T3BrM3JlNElxaWd2SFNhcEtHbU4wRT0tLXpNaFpJUjcwU0NWcU1jYm05dExoY2c9PQ==--e04604c090f553a7f8845931fc5a30ad9b8eae6d/t/m9ZxJ-N2tGhLz-rHNtz/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-13 19:36:31',0,NULL,NULL);
INSERT INTO `message` VALUES (250,0,0,0,10,'<01000173ef8bf460-14dda39c-baf1-44a6-aa5b-e23336e39d58-000000@email.amazonses.com>','Academia.edu',NULL,'50% Off, 2 days only: &ldquo;Tester, C&rdquo;: The name &ldquo;Tester, C&rdquo; was mentioned in 3 papers discovered by Academia, including one published in Journal of the Magnetics Society of Japan','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 3 papers discovered by Academia, including one published in Journal of the Magnetics Society of Japan\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/cHdCaGwvOU5EUFZaVExuaWRYWmxuZFZhTXpHaTFEUmZQRmdiVVI4MVpxVT0tLVFJNVczUXA5ZUhVa1ludHdpYVZjTUE9PQ==--044d915219e6618cdff9e1c43319e51a6527e2ed/t/m9ZxJ-N2APZBo-f1CdQ/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions-offsite-discounted\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/cHdCaGwvOU5EUFZaVExuaWRYWmxuZFZhTXpHaTFEUmZQRmdiVVI4MVpxVT0tLVFJNVczUXA5ZUhVa1ludHdpYVZjTUE9PQ==--044d915219e6618cdff9e1c43319e51a6527e2ed/t/m9ZxJ-N2APZBo-f1CdQ/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-14 19:36:34',0,NULL,NULL);
INSERT INTO `message` VALUES (251,0,0,0,10,'<01000173f4b25675-924ed594-0670-4710-b8dc-f51b11f8e490-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: The name &ldquo;C Tester&rdquo; was mentioned in 2 papers discovered by Academia, including one published in Crystal Growth &amp; Design','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 2 papers discovered by Academia, including one published in Crystal Growth &amp; Design\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/TnM4SDlMNUpVQ01kUkhGUHJpM215MVl6a3MrSTdPMTB0TmtENGpoZWdJUT0tLU40amVkbXNLZTMySGd6bFdLOWowZGc9PQ==--05c63549fb2591c2422cd0e71514c0a37086265f/t/m9ZxJ-N2HXF5L-AvTe6/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/TnM4SDlMNUpVQ01kUkhGUHJpM215MVl6a3MrSTdPMTB0TmtENGpoZWdJUT0tLU40amVkbXNLZTMySGd6bFdLOWowZGc9PQ==--05c63549fb2591c2422cd0e71514c0a37086265f/t/m9ZxJ-N2HXF5L-AvTe6/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-15 19:36:36',0,NULL,NULL);
INSERT INTO `message` VALUES (252,0,0,0,10,'<01000173f9d8b89c-aee281c3-8e4b-43f4-8229-c29fa608e519-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: The name &ldquo;C Tester&rdquo; is mentioned in a paper published in Agent Engineering','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; is mentioned in a paper published in Agent Engineering\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VFE2emdBL2l5aUpabTVLamxMcC9RcG9pY3Ria3J5R29Nb1hqRS9GN0ZDND0tLTVnTFh5UXlZRjFUU1VNTzVGYnhXU1E9PQ==--f12b7423cb94cf9e54201cf2a99c77aea71be505/t/m9ZxJ-N2Q5nYy-SqMP4/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VFE2emdBL2l5aUpabTVLamxMcC9RcG9pY3Ria3J5R29Nb1hqRS9GN0ZDND0tLTVnTFh5UXlZRjFUU1VNTzVGYnhXU1E9PQ==--f12b7423cb94cf9e54201cf2a99c77aea71be505/t/m9ZxJ-N2Q5nYy-SqMP4/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-16 19:36:37',0,NULL,NULL);
INSERT INTO `message` VALUES (253,0,0,0,10,'<01000173ff12a2d1-0b12bc2a-0639-43ae-a2e9-26b540c09605-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: The name &ldquo;Tester, C&rdquo; was mentioned in 2 papers discovered by Academia, including one published in Minerals','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 2 papers discovered by Academia, including one published in Minerals\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/dDVTM29IcmMyNzNQVEhaeUhUTE5oUzlueUxtc2JIMFpnTEVlR0FRRGJDOD0tLWFBS1NqeVcyM25yR243RGVzVXJpTmc9PQ==--c43b6ae0e11bb8a4860f32b3c9cfef9b318793c9/t/m9ZxJ-N2YjhWx-qCsAQ/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/dDVTM29IcmMyNzNQVEhaeUhUTE5oUzlueUxtc2JIMFpnTEVlR0FRRGJDOD0tLWFBS1NqeVcyM25yR243RGVzVXJpTmc9PQ==--c43b6ae0e11bb8a4860f32b3c9cfef9b318793c9/t/m9ZxJ-N2YjhWx-qCsAQ/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-17 19:57:59',0,NULL,NULL);
INSERT INTO `message` VALUES (254,0,0,0,21,'<1550361003.172886811.1597965452824@Insideapple.apple.com>','App Store',NULL,'&iexcl;Act&iacute;vate! Aprende algo nuevo desde donde est&eacute;s','App Store\r\nQue nada te detenga, contin&uacute;a aprendiendo y creando con estas apps.\r\n\r\n\r\n\r\nCursos y&nbsp;clases\r\n\r\nPlatzi\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=mex&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab1H6x1m5T\r\nActual&iacute;zate con cursos de UX, UI, marketing&nbsp;y&nbsp;negocios.\r\n\r\nUdemy\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=mex&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab1H2b0P9Y\r\nM&aacute;s de 100 mil cursos para aprender y mejorar tus&nbsp;habilidades.\r\n\r\nDomestika\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=mex&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab1H5x5I0p\r\nDeja que los expertos te gu&iacute;en en tu camino&nbsp;creativo.\r\n\r\n\r\n\r\nCrea y guarda tus&nbsp;ideas\r\n\r\nDropbox\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=mex&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab1H6u5L2v\r\nCrea, almacena y accede desde todos tus&nbsp;dispositivos.\r\n\r\nMicrosoft Word\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=mex&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab1H4a7j0P\r\nUn b&aacute;sico para tener todos tus apuntes en&nbsp;orden.\r\n\r\nPaper\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=mex&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab1H3d7T0Y\r\nEscribe, garabatea y crea con esta incre&iacute;ble&nbsp;herramienta.\r\n\r\n\r\n\r\nPrueba algo&nbsp;nuevo\r\n\r\nSimply Piano\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=mex&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab1H4c0u8v\r\nDale rienda suelta a tu lado&nbsp;musical.\r\n\r\nBusuu\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=mex&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab1H0c1J7k\r\nAhora es un gran momento para mejorar o aprender un&nbsp;idioma.\r\n\r\nLumosity\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=mex&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab1H2L9p6Y\r\nMant&eacute;n tu cerebro activo y entr&eacute;nalo para ser mejor cada&nbsp;d&iacute;a.\r\n\r\n\r\n\r\nAlgunos contenidos requieren hardware o software espec&iacute;ficos. Es necesaria una conexi&oacute;n a internet y se aplicar&aacute;n las tarifas de datos correspondientes. El precio y la disponibilidad de los contenidos est&aacute;n sujetos a cambios.\r\n\r\nCopyright &copy; 2020 Apple Inc. One Apple Park Way, Cupertino, CA 95014\r\n\r\nPol&iacute;tica de privacidad\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=mex&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab1H7I6D5M\r\n\r\nT&eacute;rminos y condiciones\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=mex&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab1H5n2Y7M\r\n\r\nSoporte\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=mex&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab1H2I5j1C\r\n\r\nTu cuenta\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=mex&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab1H6n9E3h\r\n\r\nSuscribir\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=mex&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab1H2w3A0p\r\n\r\nCancelar suscripci&oacute;n\r\nhttps://mynews.apple.com/subscriptions?v=2&amp;la=es_mx&amp;a=ojFxXUk5GdU1wcYwATgqfN0YKKrGpg95%2BFEnKKbg9SkLdUirSH%2FgfVlSFBK0HzlRFoUWAkse0Pm8Zt1XiGoR5usnTtotDz3HP26pmBScyWwyr5%2BK7SsZhGKC0hyXsJeHNmUxxUiEd3lolgDzl2ZAtpVDB8xCcJh4zn8FbwtkU0ksS9RGNYbCh%2FXvXV%2FvNBJj%2BrODDDqwhI%2F%2Fn%2BF%2FpbCX5NSYXl%2BmXFpZTJjrjyfbAZs%3D\r\n\r\nFacebook\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=mex&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab1H4I9m6h\r\n\r\nTwitter\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=mex&amp;a=IbQQjFRqjWJ0z0FD69a0%2BWPms7fyZqkNeCMF0mpk0XVNX6BUOv73BBMzD5xa6OmZXJv0cbPS%2BgME9AnfvV30ZFEg2iEiQs1s2iVdRMnLIfe8jEtVtREzDqHAB2QiAH69&amp;ct=ab1H7w2y7p\n\n',1,'2020-08-20 18:17:34',0,NULL,NULL);
INSERT INTO `message` VALUES (255,0,0,0,5,'<VGv0DPdRleo3i1NJ9L0GzA.0@notifications.google.com>','Google',NULL,'Security alert','[image: Google]\r\nNew device signed in to\r\n\r\n\r\ncadic.tester@gmail.com\r\nYour Google Account was just signed in to from a new Linux device. You&#039;re\r\ngetting this email to make sure it was you.\r\nCheck activity\r\n&lt;https://accounts.google.com/AccountChooser?Email=cadic.tester@gmail.com&amp;continue=https://myaccount.google.com/alert/nt/1598275897000?rfn%3D31%26rfnc%3D1%26eid%3D7525253589081806302%26et%3D0%26anexp%3D-experiment&gt;\r\nYou received this email to let you know about important changes to your\r\nGoogle Account and services.\r\n&copy; 2020 Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA\n\n',1,'2020-08-24 08:31:38',0,NULL,NULL);
INSERT INTO `message` VALUES (256,0,0,0,10,'<01000174233019b1-2f54fc0e-782f-4133-ba9a-a99027721aba-000000@email.amazonses.com>','Academia.edu',NULL,'50% Off, 2 days only: &ldquo;C Tester&rdquo;: The name &ldquo;C Tester&rdquo; is mentioned in a paper published in Iowa Geological Survey Annual Report','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; is mentioned in a paper published in Iowa Geological Survey Annual Report.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/TTlMWHF4WVJSbHFCakUrSnJRTVo0MzRDWC8wRVNJZGVHemx1Nk5VV0M3ST0tLU5yb2ZLbGUxeDJOOXhRNGo4ODBZL1E9PQ==--34c110ca0eac20cac3e352e0dd22be2edae13a44/t/m9ZxJ-N3PjviY-AkCsN/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions-offsite-discounted\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/TTlMWHF4WVJSbHFCakUrSnJRTVo0MzRDWC8wRVNJZGVHemx1Nk5VV0M3ST0tLU5yb2ZLbGUxeDJOOXhRNGo4ODBZL1E9PQ==--34c110ca0eac20cac3e352e0dd22be2edae13a44/t/m9ZxJ-N3PjviY-AkCsN/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-24 20:16:30',0,NULL,NULL);
INSERT INTO `message` VALUES (257,0,0,0,4,'<8c6cd71d-46b2-e221-82a6-2c9985796fdf@monday.com>','monday.com',NULL,'Do cookie machines really motivate people?','????No, they do not. But we made a video about it anyways. [https://s3.amazonaws.com/monday-activemail/shared/monday-logo-top-100.png] \r\nLog in&rarr;\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tL2F1dGhlbnRpY2F0aW9uL21hZ2ljX2xpbmtfbG9naW4_bGFsb2dpbnRva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUoxYzJWeVgybGtJam94TURZNE1qRTRPU3dpWVdOamIzVnVkRjlwWkNJNk5EZ3pOVGczT0N3aVpYaHdJam94TlRrNE5EVTJNekEzTENKMVkyRWlPaUl5TURFNUxUQTVMVEkyVkRFMU9qSTNPalF3TGpBd01Gb2lMQ0pwWVhRaU9qRTFPVGd6TmprNU1EZDkud2NBZm0ya2llcEtsRnFDR0pLeUJDNElwa2locGNQX0hpV3BSWkRFZmJyOCZ3ZWxjb21lX2JhY2s9dHJ1ZSZzcmM9Y29va2llJnBhdGg9Ym9hcmRzL25ld2VzdF9wdWJsaWNfYm9hcmQiLCJtIjoiYTlkZDRjMjU5ZDU3N2Q3MTBiNzU5M2Y1MGVhOGQ4NDAiLCJpYXQiOjE1OTgzNjk5MDd9.TI4D78eGgoSjRT9D73jwNS-28C3YK1WLCXVrY5YgQiU] pixel [https://amcdn.monday.com/images/0/a9dd4c259d577d710b7593f50ea8d840.png] \r\nWatch this cookie ???? machine motivate people We have a funny youtube channel\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoieW91dHUuYmUvbjhRckwxV2JFdzQiLCJtIjoiYTlkZDRjMjU5ZDU3N2Q3MTBiNzU5M2Y1MGVhOGQ4NDAiLCJpYXQiOjE1OTgzNjk5MDd9.hJpXUA4bpyI6YTWA8Lg5FFJAGfpauJdnQM1kqqSlOBo] \r\nwhere we automate solutions to difficult things in life. In this video we tried\r\nusing cookies to motivate people. It didn&#039;t work. Subscribe to the channel to be\r\nentertained. we built a cookie machine to motivate people. it didn&#039;t work.\r\n[https://monday-activemail.s3.amazonaws.com/shared/Campaigns/cookie/thumbnail-youtube-ui-interface-generic-eyes.jpg]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoieW91dHUuYmUvbjhRckwxV2JFdzQiLCJtIjoiYTlkZDRjMjU5ZDU3N2Q3MTBiNzU5M2Y1MGVhOGQ4NDAiLCJwIjoyLCJpYXQiOjE1OTgzNjk5MDd9.olik07r-BmjhoI1VcrUPbOkO_zcco7OspvuEkoRpuMo] \r\nWatch on Youtube\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoieW91dHUuYmUvbjhRckwxV2JFdzQiLCJtIjoiYTlkZDRjMjU5ZDU3N2Q3MTBiNzU5M2Y1MGVhOGQ4NDAiLCJwIjozLCJpYXQiOjE1OTgzNjk5MDd9.KTtbQIfXTQXhGYR0ZFERtTySt79ITlZWk83aQGXDTxw] \r\nLogin\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidGVzdDUxNDYyMy5tb25kYXkuY29tIiwibSI6ImE5ZGQ0YzI1OWQ1NzdkNzEwYjc1OTNmNTBlYThkODQwIiwiaWF0IjoxNTk4MzY5OTA3fQ.VHY3EmDL3mMoY__huBjUoKIwILa7G3EQ0roqr0oeb7U] \r\n&bull; Webinars\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibW9uZGF5LmNvbS93ZWJpbmFycy8iLCJtIjoiYTlkZDRjMjU5ZDU3N2Q3MTBiNzU5M2Y1MGVhOGQ4NDAiLCJpYXQiOjE1OTgzNjk5MDd9.rcALj8k4zhT3JFPMQ4vfs5Ehl-IGpIXiwySMTqHFOtE] \r\n&bull; FAQ\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoic3VwcG9ydC5tb25kYXkuY29tIiwibSI6ImE5ZGQ0YzI1OWQ1NzdkNzEwYjc1OTNmNTBlYThkODQwIiwiaWF0IjoxNTk4MzY5OTA3fQ.IThjsV5I5LQKjdIupVJDc2OMoVjeM5j7xcXi9WqiSj4] \r\n&bull; Community\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoiY29tbXVuaXR5Lm1vbmRheS5jb20iLCJtIjoiYTlkZDRjMjU5ZDU3N2Q3MTBiNzU5M2Y1MGVhOGQ4NDAiLCJpYXQiOjE1OTgzNjk5MDd9.EDiatSjo8Kvt2wVugmKYzJaxJvKBF_tB108A8MhiPAA]  \r\n\r\nFollow us: \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138361/email_marketing/footer/Facebook.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LmZhY2Vib29rLmNvbS9tb25kYXlkb3Rjb20iLCJtIjoiYTlkZDRjMjU5ZDU3N2Q3MTBiNzU5M2Y1MGVhOGQ4NDAiLCJpYXQiOjE1OTgzNjk5MDd9.0vNodW17zYAihkVwfoAExhkGpGXKrfqVnd7VbOWHXTU] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138361/email_marketing/footer/Youtube.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LnlvdXR1YmUuY29tL2NoYW5uZWwvVUNBOVV2QmlLSGx5MTVyTjh1X0ttM0JRIiwibSI6ImE5ZGQ0YzI1OWQ1NzdkNzEwYjc1OTNmNTBlYThkODQwIiwiaWF0IjoxNTk4MzY5OTA3fQ.GbxgrtBBc93VPxZNiEb9KBlBiRheROey0tKU4fDWyYU] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138359/email_marketing/footer/LinkedIN.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1Ijoid3d3LmxpbmtlZGluLmNvbS9jb21wYW55LzI1MjUxNjkvIiwibSI6ImE5ZGQ0YzI1OWQ1NzdkNzEwYjc1OTNmNTBlYThkODQwIiwiaWF0IjoxNTk4MzY5OTA3fQ.Jc6xX4zMJPdDqG5pNMtwStjpVlMLdT6z7_bzTzSZWQM] \r\n[https://dapulse-res.cloudinary.com/image/upload/v1569138358/email_marketing/footer/Twitter.png]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoidHdpdHRlci5jb20vbW9uZGF5ZG90Y29tIiwibSI6ImE5ZGQ0YzI1OWQ1NzdkNzEwYjc1OTNmNTBlYThkODQwIiwiaWF0IjoxNTk4MzY5OTA3fQ.2NdAEX3fJNUms4RktMcYGyJJugVp_6RpqlcGpehtyug]  \r\n\r\nmonday.com logo [https://amcdn.monday.com/images/1/a9dd4c259d577d710b7593f50ea8d840.png] monday.com [https://dapulse-res.cloudinary.com/image/upload/v1569157981/email_marketing/footer/monday-200x200.png] \r\n\r\nTel Aviv \r\n52 Menachem Begin Road \r\nTel Aviv 6713701 Israel \r\n\r\nNew York \r\n34 W 14th St. \r\nNew York, NY, 10011 United States Take monday.?com [href] everywhere with you \r\n[https://s3.amazonaws.com/monday-activemail/shared/download_android_app.png ] [\r\nhttps://go.onelink.me/wwJQ?pid=referral_install&amp;c=email_marketing&amp;email_source=trial&amp;type=android&amp;c=footer\r\n] [https://s3.amazonaws.com/monday-activemail/shared/download_ios_app.png ]\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoiZ28ub25lbGluay5tZS93d0pRP3BpZD1yZWZlcnJhbF9pbnN0YWxsJmM9ZW1haWxfbWFya2V0aW5nJmVtYWlsX3NvdXJjZT10cmlhbCZ0eXBlPWlwaG9uZSZjPWZvb3RlciAiLCJtIjoiYTlkZDRjMjU5ZDU3N2Q3MTBiNzU5M2Y1MGVhOGQ4NDAiLCJpYXQiOjE1OTgzNjk5MDd9.dI8-Fb0o9N1vx4nuYvpvGqOdvsk4Aw28etrfyOsTWzk]  \r\n\r\nThis email was sent to you regarding your test514623.monday.?com [href] account.\r\nIf you wish to no longer receive emails from us you can unsubscribe\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibGlua3MubW9uZGF5LmNvbS91bnN1YnNjcmliZT91PWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUp0SWpvaVlUbGtaRFJqTWpVNVpEVTNOMlEzTVRCaU56VTVNMlkxTUdWaE9HUTROREFpTENKcFlYUWlPakUxT1Rnek5qazVNRGQ5LmZTTW9yYkV2aGZEOWxVR0RyemYzcGFsSkRyOGt1TUw2cXMxVE01Y0ZQRVkiLCJtIjoiYTlkZDRjMjU5ZDU3N2Q3MTBiNzU5M2Y1MGVhOGQ4NDAiLCJpYXQiOjE1OTgzNjk5MDd9.lH0tG08CwRHTEO6wqtpAp1r8lLogZihqhxD6UcQpJog]\r\n. \r\n\r\nWhy did I receive this email?\r\n[https://links.monday.com?c=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1IjoibW9uZGF5LmNvbS90ZXJtcy9lbWFpbHMiLCJtIjoiYTlkZDRjMjU5ZDU3N2Q3MTBiNzU5M2Y1MGVhOGQ4NDAiLCJpYXQiOjE1OTgzNjk5MDd9.juWr_qsbj8kbqJaxXe6s7ywqb6DxZLf5mUGpfn7ko0Q]\n\n',1,'2020-08-25 10:38:34',0,NULL,NULL);
INSERT INTO `message` VALUES (258,0,0,0,10,'<010001742857e806-8aa85061-3acd-43a7-aafa-864b68616b30-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: The name &ldquo;C Tester&rdquo; is mentioned in a paper published in Office of Scientific and Technical Information  (OSTI)','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; is mentioned in a paper published in Office of Scientific and Technical Information  (OSTI).\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/MGRsa3BwYW9HaTFGRzRGTHNpRzRZekx1WUZpR1FGQTljdm1uTTgvcjk4bz0tLWRmMzl6L0dGQXJaUHNLcTNUSGtKZkE9PQ==--8204045e5df30b22311a0e4a7e1392b5ba823264/t/m9ZxJ-N3WsErD-hmTLy/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/MGRsa3BwYW9HaTFGRzRGTHNpRzRZekx1WUZpR1FGQTljdm1uTTgvcjk4bz0tLWRmMzl6L0dGQXJaUHNLcTNUSGtKZkE9PQ==--8204045e5df30b22311a0e4a7e1392b5ba823264/t/m9ZxJ-N3WsErD-hmTLy/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-25 20:18:04',0,NULL,NULL);
INSERT INTO `message` VALUES (259,0,0,0,10,'<010001742d8071f2-138a8d3b-6e0a-472b-8a96-f8b72f4e5e30-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: The name &ldquo;C Tester&rdquo; was mentioned in 2 papers discovered by Academia, including one published in Medicine','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 2 papers discovered by Academia, including one published in Medicine.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/YktXajBxVnBtV1FqdUZTZllGdUE0WXl5UjM5Z0tOL2tkRUJXWWRJdnRSUT0tLUdVck83UnRJNGgxT0VGelZwemIrcmc9PQ==--921d5d6dbdbac0d2d6777b6eddd696101475c963/t/m9ZxJ-N33A2cC-Ukch4/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/YktXajBxVnBtV1FqdUZTZllGdUE0WXl5UjM5Z0tOL2tkRUJXWWRJdnRSUT0tLUdVck83UnRJNGgxT0VGelZwemIrcmc9PQ==--921d5d6dbdbac0d2d6777b6eddd696101475c963/t/m9ZxJ-N33A2cC-Ukch4/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-26 20:20:27',0,NULL,NULL);
INSERT INTO `message` VALUES (260,0,0,0,10,'<0100017432a337af-4ccd520b-ee0c-47a5-b828-d50f98399dc8-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: The name &ldquo;Tester, C&rdquo; was mentioned in 3 papers discovered by Academia, including one published in American Journal of Occupational Therapy','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 3 papers discovered by Academia, including one published in American Journal of Occupational Therapy.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/blFlS3ZTbWhtQTVMbTZCakFadWtTMEUyRWVvN0tJWnBoOTFFUld2K3Evbz0tLU1wZjFaazIwOFBIV0E1M0llbFdiK3c9PQ==--b3a566178d6e23a3a3413698918c6ab0dfb6afeb/t/m9ZxJ-N4aHzQa-zcVzn/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/blFlS3ZTbWhtQTVMbTZCakFadWtTMEUyRWVvN0tJWnBoOTFFUld2K3Evbz0tLU1wZjFaazIwOFBIV0E1M0llbFdiK3c9PQ==--b3a566178d6e23a3a3413698918c6ab0dfb6afeb/t/m9ZxJ-N4aHzQa-zcVzn/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-27 20:16:32',0,NULL,NULL);
INSERT INTO `message` VALUES (261,0,0,0,10,'<0100017437c83758-98e70b3b-91f2-467b-a504-dda258aa5c22-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: The name &ldquo;Tester, C&rdquo; is mentioned in a paper published in Iowa State College Press,','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; is mentioned in a paper published in Iowa State College Press,.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VG1ncjBDN1ZUaWk1YXd1ME5reGtOVExSbUo0NE8wSzBDb1Y1L2Q3T1RXQT0tLUlVU1BRZjdTVTE4aUtNWG9YWTk5OGc9PQ==--25b5c37e553f86388be37c91e964357f653ac4b5/t/m9ZxJ-N4hQQbL-EPpSu/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/VG1ncjBDN1ZUaWk1YXd1ME5reGtOVExSbUo0NE8wSzBDb1Y1L2Q3T1RXQT0tLUlVU1BRZjdTVTE4aUtNWG9YWTk5OGc9PQ==--25b5c37e553f86388be37c91e964357f653ac4b5/t/m9ZxJ-N4hQQbL-EPpSu/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-28 20:15:03',0,NULL,NULL);
INSERT INTO `message` VALUES (262,0,0,0,10,'<010001743cf2976e-7a9aff3d-588a-4308-b2a7-71dcb983aa05-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: The name &ldquo;C Tester&rdquo; has 1 new mention','Dear Cadic,\r\r\n\r\r\nWe recently found 1 open-access paper mentioning &ldquo;C Tester&rdquo;.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/MjFsVVZYWkoxaTR5cXExbVhNa3JnOHlpWmdqVTlkN0drajhZUjdVTmJ6cz0tLVlwc1lHVk5laUtVVU1uR2VZbFpXVEE9PQ==--4def98b3e46330c65173dfb07a32a0ac1ad0d625/t/m9ZxJ-N4pZNfE-4zWQv/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/MjFsVVZYWkoxaTR5cXExbVhNa3JnOHlpWmdqVTlkN0drajhZUjdVTmJ6cz0tLVlwc1lHVk5laUtVVU1uR2VZbFpXVEE9PQ==--4def98b3e46330c65173dfb07a32a0ac1ad0d625/t/m9ZxJ-N4pZNfE-4zWQv/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-29 20:19:26',0,NULL,NULL);
INSERT INTO `message` VALUES (263,0,0,0,10,'<0100017442204bf5-7cd78f39-afa3-41f2-b982-3b98899853e1-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: The name &ldquo;Tester, C&rdquo; is mentioned in a paper published in Intel Technology Journal','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; is mentioned in a paper published in Intel Technology Journal.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/bkpTWDRjb1VGbUh1c3ZXa0JDTzlOMlFwa1NPZ21jT3k2YlVHUFNCalR0TT0tLWxiVnZYWGQ0WEc5OWt0T0M0Y1BLeVE9PQ==--8ba942db67a3c344f9abfad44ca9e254636f142a/t/m9ZxJ-N4w9PBa-bfLJbU/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/bkpTWDRjb1VGbUh1c3ZXa0JDTzlOMlFwa1NPZ21jT3k2YlVHUFNCalR0TT0tLWxiVnZYWGQ0WEc5OWt0T0M0Y1BLeVE9PQ==--8ba942db67a3c344f9abfad44ca9e254636f142a/t/m9ZxJ-N4w9PBa-bfLJbU/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-30 20:27:27',0,NULL,NULL);
INSERT INTO `message` VALUES (264,0,0,0,10,'<01000174473cab43-6b7a99a6-ec48-44b8-8d2d-bb238f32b522-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: The name &ldquo;Tester, C&rdquo; was mentioned in a paper published two years ago','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in a paper published two years ago.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/WGh0K3RrWmhzcHRlQi9nM2VuL2gwTE43NDVzQnFOMXhZUGhINlZETlBYOD0tLXBwbGI4VmNxZW1aSldFTnZBVE95eWc9PQ==--aacc11940d0555dfb7e038ed2c4161eb66bfd7c2/t/m9ZxJ-N4Eei8r-buW7z9/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/WGh0K3RrWmhzcHRlQi9nM2VuL2gwTE43NDVzQnFOMXhZUGhINlZETlBYOD0tLXBwbGI4VmNxZW1aSldFTnZBVE95eWc9PQ==--aacc11940d0555dfb7e038ed2c4161eb66bfd7c2/t/m9ZxJ-N4Eei8r-buW7z9/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-08-31 20:16:33',0,NULL,NULL);
INSERT INTO `message` VALUES (265,0,0,0,18,'<985976309.19693794.1598965438697@Insideapple.apple.com>','Apple',NULL,'Presentamos el nuevo iMac de 27 pulgadas.','Nuevo iMac de 27 pulgadas\r\n\r\nTodo-en-uno. Va por todo.\r\n\r\nM&aacute;s informaci&oacute;n\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=col&amp;a=z2%2Bnb8HWCoHziyJtbRYNxEJqOcwA12xbGoofYjHA7%2FpmGyr7PDw7WzWcFOd6bN0CqqKPZ%2B5JJEV4zR2CPJIFjxMbMMcQz%2FHMs441wx0fo79H5o5Z0abf271sj%2BAzP0vM6CnT6m0gF8lXUj1OBdVv6E3VXEuDWzlIIng0WIzp6A2JflBt37F948Xin5hFCMkU%2FhDFToU4HHg4%2BXjL2nEBuQ%3D%3D&amp;ct=ab1X5a8h1h\r\n\r\nPantalla Retina 5K de 27 pulgadas con True Tone y opci&oacute;n de vidrio nanotexturizado.\r\n\r\nProcesador de hasta 10 n&uacute;cleos que brinda una potencia y una velocidad superiores.\r\n\r\nProcesador gr&aacute;fico AMD Radeon Pro serie 5000. Renderizaci&oacute;n r&aacute;pida y reproducci&oacute;n fluida.\r\n\r\nMemoria de hasta 128 GB para resolver las tareas m&aacute;s complejas.\r\n\r\nIncre&iacute;ble almacenamiento SSD de hasta 8 TB. Ahora todos los iMac vienen con almacenamiento flash ultrarr&aacute;pido.\r\n\r\nC&aacute;mara FaceTime HD de 1080p y micr&oacute;fonos con calidad de estudio para videollamadas y grabaciones supern&iacute;tidas.\r\n\r\n-------------------\r\n\r\nBuscar una tienda\r\nhttps://c.apple.com/r?v=2&amp;la=es&amp;lc=col&amp;a=z2%2Bnb8HWCoHziyJtbRYNxEJqOcwA12xbGoofYjHA7%2FpmGyr7PDw7WzWcFOd6bN0CqqKPZ%2B5JJEV4zR2CPJIFjxMbMMcQz%2FHMs441wx0fo79H5o5Z0abf271sj%2BAzP0vM6CnT6m0gF8lXUj1OBdVv6E3VXEuDWzlIIng0WIzp6A2JflBt37F948Xin5hFCMkU%2FhDFToU4HHg4%2BXjL2nEBuQ%3D%3D&amp;ct=ab1X6x0Q2Y\r\n\r\n-------------------\r\n\r\nTM y (c) 2020 Apple Inc. One Apple Park Way, MS 96-DM, Cupertino, CA 95014.\r\n\r\n-------------------\r\n\r\nTodos los derechos reservados\r\nhttps://www.apple.com/co/legal/\r\n\r\nPol&iacute;tica de privacidad\r\nhttps://www.apple.com/legal/privacy/es-la/\r\n\r\nMi Apple ID\r\nhttps://appleid.apple.com/co/\r\n\r\n-------------------\r\n\r\nSi prefieres no recibir correos electr&oacute;nicos comerciales de Apple, o si has cambiado tu direcci&oacute;n de email, haz clic aqu&iacute;.\r\nhttps://mynews.apple.com/subscriptions?v=2&amp;la=es_co&amp;a=dJyPDDN%2FOLoZ5QSZ%2FOdkB%2B1fBpbhYukxOVu8gREk3aXw5pfpwD0m%2F1GQ2RZ56Dc2PgLGgB9W7HLqsfrOkqi8yW6M7lOcYJyKl%2FXVUu6yNZ4GqDsh3mN%2FEvyDapwV5Z8OOarqTT%2By%2Fy9u6HKVw3kG7qiZFX1IHmDt%2FcTGRydxR31W2MGYwUWuQAdFxee1RexHSU665sTRVxNLVAVdyFABqtY8T8uVDW1IqMl%2FPllqyo0%3D\n\n',1,'2020-09-01 08:04:03',0,NULL,NULL);
INSERT INTO `message` VALUES (266,0,0,0,12,'<83a0e42bdfc69651a22e1ebc77519079113836fa52d55eee0471ff5af8896702@m.meistertask.com>','MeisterTask',NULL,'cadic, you look like you could use some productivity tips','Get More Done With These 4 Productivity Hacks\r\nWe would all like to achieve more in less time, but sometimes it&rsquo;s easier said than done. Here are 4 simple hacks that will help you raise productivity immediately.\r\n\r\nSleep at Home, Not at Your DeskA good night&rsquo;s sleep has been found to boost your productivity and raise your salary, while importantly making you a healthier and happier person.\r\nhttps://email.m.meistertask.com/c/eJxdjktuhTAMRVcDsyDnnwwy6KTbqPJxIAIKJaGou29eh5UsX8uyj05ygVkR41ic4R5QsJByVFZJ6hlDiiFqLakFbSnlhqvsJUtSIiIITXOWPhtjlQY2CNinHUtteDVf1yke-7g4sEl1cAwhca6E1ChlBJ2EESCMUuPmltbOOvC3gb33ep7nP6Zvw3bMPRhQ1QPMa2a9GfJ1l7iSVs5K8nERTwK2_ks-y7y0SuqGePbD8XLRpxKnhi90t513X7Y_y9t1EzAAemzuvI50x1a-S_v5WHxc6y-AJFqr\r\n\r\nLet the Machines Take OverAutomate menial tasks. Free up valuable time. Focus on the things you&rsquo;re really passionate about. We&rsquo;ve found 12 things you&rsquo;re doing every day that can be automated.\r\nhttps://email.m.meistertask.com/c/eJxdTkmOhDAMfA3cgpyFLIcc5jLfGDmJgaih04LQiN9Peo4jWVVeSuVKPginYuyztxKBlAhpitrpkaMQxClEY0buwDjOpZV6wlGkcSQiUIZP04iTtU4bEJ2CbdgoH5X2isdjiGXrFx-BRwdWoUxNZ2kCK7kTnKwlKYLsV7_U-jo6-dWJ71bXdf23aduwlrmRAK4bgfn0tgEXrC75OR_sLudOLJU2MHrTfrOEdztiZRGfLBDDs5YNK6V-9xFTjkOlz5uWfN4wr3-JT6-sBgtg-upfe0lnrPmd6_2zYHwcv-RRX2U\r\n\r\nSee It ThroughSeeing a project through from the ideation stage to finished product can be a real struggle. Here is our science-based approach to moving from idea to execution.\r\nhttps://email.m.meistertask.com/c/eJwdjjmOwzAMRU9jdTG0L4WKaeYaA4qmbCFWHFjKALl95ABkwU_iPS4xyaARWYleASct05LRBmsESEmCEjpnROAuCKG8shmMXIwhIq6dyNlA9j5Yx-WkeZ0rldbp7NDuMx6VbVGN62RyQAwJeLbCOK4A0JGmPEa2x63356R-Jvk7Ku3HOuNJ0Ms_7aMvzsgv5K3CA1aq9Oi39h6i2saGnRFhKTh3utzjj7VC2b_-V9Tecs-5Yz0-z2N54eCW_v7bAO_tA0dNUSw\r\n\r\nMake Meetings Suck LessWith the right meeting management, your meetings will become more efficient and you can ensure that the results are actually put into practice.\r\nhttps://email.m.meistertask.com/c/eJwtjs1qhTAUhJ9Gd0py8r_Iopu-RjlJjhquUdHcSt--sRSGGRiGj0k-gJMx9tlbgYwkhDRF7bTiCECcQjRGcceM41xYoSdUkJQiIiYNnyaFk7VOGwadZGUslK9KZ8XrNca99IsPjWQi18K6JKMkISxpCCpBkoAC-tUvtR6d-Ojgs-m-77HkLf2THkprw7rPLYBx3YI9xkWzQlTzNg8FN5yp0FaHO9dleAitPK626U8fMeU4VnqI7edcMK9__95eWs0sY6av_jj39I41f-f687VgfF2_h-lY-w\n\n',1,'2020-09-01 14:01:39',0,NULL,NULL);
INSERT INTO `message` VALUES (267,0,0,0,19,'<20200901191413.1.15449581A9518811@m.meistertask.com>','MeisterTask News',NULL,'Customize MeisterTask With Unsplash','2 Million Ways to Make Your Projects Shine\r\nhttps://email.m.meistertask.com/c/eJxljTsOwyAQRE9jl4jFC4aCwk2ugTDgGMU_sVi-fpxUkSJNNaP3JtpRGAyhzVZwwbnhAAYQOgYMJKKRGgYjQWuABvnK1pSpplI9vVjY13a2OHnwt0RF2ZueK6XVFIVXEqVKOMZ2sXOtBzXd0IjHneu6_jTFBh9zYDV96vvpufq8fKdqz42OxdPspr24H9KlzY2ecnAnpUJvdUNBfQ\r\n\r\n\r\n**\r\nUnsplash for MeisterTask\r\nMake it beautiful. Make it yours.\r\n------------------------------------------------------------\r\n\r\nGot an eye for design? MeisterTask&#039;s brand-new Unsplash integration lets you customize your dashboard and projects with almost two million gorgeous images taken by the best photographers online. Express your creativity!\r\n\r\n\r\nFind out more (https://email.m.meistertask.com/c/eJxljTsOwyAQRE9jl4jFC4aCwk2ugTDgGMU_sVi-fpxUkSJNNaP3JtpRGAyhzVZwwbnhAAYQOgYMJKKRGgYjQWuABvnK1pSpplI9vVjY13a2OHnwt0RF2ZueK6XVFIVXEqVKOMZ2sXOtBzXd0IjHneu6_jTFBh9zYDV96vvpufq8fKdqz42OxdPspr24H9KlzY2ecnAnpUJvdUNBfQ)\r\n\r\n\r\nUnsplash for MeisterTask is available on MeisterTask Pro, Business and Enterprise plans. Feeling left out? Use the discount code UNSPLASH to save 10% on your upgrade to MeisterTask Pro!\r\n\r\nUpgrade now (https://email.m.meistertask.com/c/eJxljTsOwyAQRE9jl4jFC4aCwk2ugTDgGMU_sVi-fpxUkSJNNaP3JtpRGAyhzVZwwbnhAAYQOgYMJKKRGgYjQWuABvnK1pSpplI9vVjY13a2OHnwt0RF2ZueK6XVFIVXEqVKOMZ2sXOtBzXd0IjHneu6_jTFBh9zYDV96vvpufq8fKdqz42OxdPspr24H9KlzY2ecnAnpUJvdUNBfQ)\r\n\r\nThe code UNSPLASH provides a 10% discount on your first payment and can be used for either the monthly or yearly subscription to MeisterTask Pro. The code cannot be used in combination with other discounts. Valid until 11/30/2020.\r\n\r\n\r\n============================================================\r\n\r\n&copy; 2020 MeisterLabs   &bull;   ** Imprint (https://email.m.meistertask.com/c/eJxNjsuKxCAQRb8mWYrlo4kLFw1NfkPK0kykYxLUkN9ve5jFQEEVF-6pE6wXRhGNyQouODccwIACyYCBVsroCZ5GwzQBDIpnlmOqLZaG9c3oyONqCRXx8PAepFLSLxIXgToiah3lg8S42bW1sw7yOYi5z33fLKc9_KG-mJ6uR459pXyWtLdBzmc5wkX9eomx9C8hEWvx2-giPxnT9ivQ7LXXc8O6uuUo7p-fi7vzWBO5q8ZSPycaTLk)\r\n&bull;   ** Unsubscribe (https://email.m.meistertask.com/c/eJyNjzFuxCAQRU-DS8QAxlBQrBJtkzQpUqRCGMiarDGWAfn6YaMUKSONNNLTn6f5Xs9UceeGqCmhhCgCoIADw4Bh5FyNEi5qBCkBECcJpxBLDUe15Y5dTsOiCfBZgBReMq6myQfphAflpXdMcAbDqpda94LYBdFrn_M8cYqb_1U9NJ0uOYW-tnCWNdTOTd6rya12yKUgkpAJsWvN97Ah9vy6t_Xt6_3ppYX84RAV1d46blvZV1sW85kP8-dXEzYz2xKdaSUcpef3I_vmar-hw6Gd9dHhGh753vOWbFx_-lX9T-U3GcRtuA)\n\n',1,'2020-09-01 14:14:31',0,NULL,NULL);
INSERT INTO `message` VALUES (268,0,0,0,10,'<010001744c63dffc-f398df75-ca14-499f-92b0-3fa0722408c8-000000@email.amazonses.com>','Academia.edu',NULL,'50% Off, 2 days only: &ldquo;Tester, C&rdquo;: The name &ldquo;Tester, C&rdquo; was mentioned in 2 papers discovered by Academia, including one published two years ago','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 2 papers discovered by Academia, including one published two years ago.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/S01kai81YUphQUMxei9Wbm0vKzR1NVNIdjg1OFhDZnZsRjhHVHdTQWNubz0tLTVHK1RBWUN5aHFCZU4xcEVwNHdVckE9PQ==--df4c539d7f830bd8f9840de2d09fed1cea8b450d/t/m9ZxJ-N4MngKT-bv7g9n/upgrade?feature=name_mentions&amp;premium_discount_coupon=JCXSDFI&amp;trigger=new-name-mentions-offsite-discounted\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/S01kai81YUphQUMxei9Wbm0vKzR1NVNIdjg1OFhDZnZsRjhHVHdTQWNubz0tLTVHK1RBWUN5aHFCZU4xcEVwNHdVckE9PQ==--df4c539d7f830bd8f9840de2d09fed1cea8b450d/t/m9ZxJ-N4MngKT-bv7g9n/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-09-01 20:17:28',0,NULL,NULL);
INSERT INTO `message` VALUES (269,0,0,0,10,'<0100017453033413-e07c0242-0bc5-4054-ba0b-e772410d5d2b-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: The name &ldquo;Tester, C&rdquo; is mentioned in a paper published in Journal of Animal Science','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; is mentioned in a paper published in Journal of Animal Science.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/dkJzV3Z0cDBVZ3dRaCtCdmZWS25pOTM1QTMrWERtbGYwTC9KUHMrekxUQT0tLWpnMFZGWEUrWCtHa0pZQmdUU2Rxcmc9PQ==--b2e4d573eee8874976b2e7e00af06b47ffbb1675/t/m9ZxJ-N4WxfSZ-z9W3K/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/dkJzV3Z0cDBVZ3dRaCtCdmZWS25pOTM1QTMrWERtbGYwTC9KUHMrekxUQT0tLWpnMFZGWEUrWCtHa0pZQmdUU2Rxcmc9PQ==--b2e4d573eee8874976b2e7e00af06b47ffbb1675/t/m9ZxJ-N4WxfSZ-z9W3K/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-09-03 03:09:13',0,NULL,NULL);
INSERT INTO `message` VALUES (270,0,0,0,10,'<010001745845fd84-1d150bce-514e-46b7-aaef-9aa115ff4d28-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: Congratulations on your 750th Mention! The name &ldquo;C Tester&rdquo; was mentioned in 3 papers discovered by Academia, including one published two years ago','Dear Cadic,\r\r\n\r\r\nCongratulations on your 750th Mention!\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 3 papers discovered by Academia, including one published two years ago.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/aFA0THM3eGdoZ3JTMUZ3SFhTa2Vaa1V5amJGU1U5UnVJeDlEMUR0a09iZz0tLUdmZEtKbm5yNVZwKytxMUVrSHkwSEE9PQ==--4a7cc67801793fd02dd57349467886fba41d4ada/t/m9ZxJ-N43P0T4-h3dS8/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite-milestone\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/aFA0THM3eGdoZ3JTMUZ3SFhTa2Vaa1V5amJGU1U5UnVJeDlEMUR0a09iZz0tLUdmZEtKbm5yNVZwKytxMUVrSHkwSEE9PQ==--4a7cc67801793fd02dd57349467886fba41d4ada/t/m9ZxJ-N43P0T4-h3dS8/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-09-04 03:40:16',0,NULL,NULL);
INSERT INTO `message` VALUES (271,0,0,0,10,'<010001745d547ad1-45dfb957-16bd-4a99-9890-71aae2c94bd4-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;Tester, C&rdquo;: The name &ldquo;Tester, C&rdquo; was mentioned in 2 papers discovered by Academia, including one published in DEStech Transactions on Engineering and Technology Research','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;Tester, C&rdquo; was mentioned in 2 papers discovered by Academia, including one published in DEStech Transactions on Engineering and Technology Research.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/N0REdStaUklRV21xRzFudlREek9RN3I3dzNpcy9GWXFTQnVzeEVZdDI2VT0tLVNaVmdRcTZoaVFhenozTVVpclJNRkE9PQ==--aa86e67c33b92fb02c7f37b8041ab93a75f4960e/t/m9ZxJ-N5aP5eJ-Rscm1/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/N0REdStaUklRV21xRzFudlREek9RN3I3dzNpcy9GWXFTQnVzeEVZdDI2VT0tLVNaVmdRcTZoaVFhenozTVVpclJNRkE9PQ==--aa86e67c33b92fb02c7f37b8041ab93a75f4960e/t/m9ZxJ-N5aP5eJ-Rscm1/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-09-05 03:14:12',0,NULL,NULL);
INSERT INTO `message` VALUES (272,0,0,0,10,'<01000174627b67f4-d0763191-4af1-4e07-b3b7-2d4a3ec71551-000000@email.amazonses.com>','Academia.edu',NULL,'&ldquo;C Tester&rdquo;: The name &ldquo;C Tester&rdquo; was mentioned in 2 papers discovered by Academia, including one published in Journal of the Textile Machinery Society of Japan','Dear Cadic,\r\r\n\r\r\nThe name &ldquo;C Tester&rdquo; was mentioned in 2 papers discovered by Academia, including one published in Journal of the Textile Machinery Society of Japan.\r\r\n\r\r\nFollow the link below to see all of your mentions:\r\r\n\r\r\nhttps://www.academia.edu/keypass/YTBZUXVuVVY0VUV5UGdtT3NnWFlwMDg2b2dUZm1NdGZVWnBGWndIdjhHND0tLW1CQkh1Q0lrcGNGY25sdEZCY3dUcXc9PQ==--074496fcd5da094b9fdbe8a0592ff25305868908/t/m9ZxJ-N5hXXMu-bgKgmF/upgrade?feature=name_mentions&amp;trigger=new-name-mentions-offsite\r\r\n\r\r\n-----\r\r\n\r\r\nFollow the link below to disable these notifications:\r\r\n\r\r\nhttps://www.academia.edu/keypass/YTBZUXVuVVY0VUV5UGdtT3NnWFlwMDg2b2dUZm1NdGZVWnBGWndIdjhHND0tLW1CQkh1Q0lrcGNGY25sdEZCY3dUcXc9PQ==--074496fcd5da094b9fdbe8a0592ff25305868908/t/m9ZxJ-N5hXXMu-bgKgmF/unsubscribe/new_mentions\r\r\n\r\r\nAcademia.edu, 580 California St., Suite 400, San Francisco, CA, 94104\n\n',1,'2020-09-06 03:14:49',0,NULL,NULL);

#
# Source for table openid
#

CREATE TABLE `openid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `openid` varchar(255) CHARACTER SET latin1 NOT NULL,
  `openid_email` varchar(127) CHARACTER SET latin1 NOT NULL,
  `openid_server` varchar(255) CHARACTER SET latin1 NOT NULL,
  `openid_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores usersâ€™ openid information';

#
# Dumping data for table openid
#


#
# Source for table page
#

CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `page_description` longtext CHARACTER SET latin1,
  `page_tab` varchar(100) CHARACTER SET latin1 NOT NULL,
  `page_active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores user created pages';

#
# Dumping data for table page
#


#
# Source for table permissions
#

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='Stores permissions used for access control';

#
# Dumping data for table permissions
#

INSERT INTO `permissions` VALUES (1,'reports_view');
INSERT INTO `permissions` VALUES (2,'reports_edit');
INSERT INTO `permissions` VALUES (4,'reports_comments');
INSERT INTO `permissions` VALUES (5,'reports_download');
INSERT INTO `permissions` VALUES (6,'reports_upload');
INSERT INTO `permissions` VALUES (7,'messages');
INSERT INTO `permissions` VALUES (8,'messages_reporters');
INSERT INTO `permissions` VALUES (9,'stats');
INSERT INTO `permissions` VALUES (10,'settings');
INSERT INTO `permissions` VALUES (11,'manage');
INSERT INTO `permissions` VALUES (12,'users');
INSERT INTO `permissions` VALUES (13,'manage_roles');
INSERT INTO `permissions` VALUES (16,'reports_verify');
INSERT INTO `permissions` VALUES (17,'reports_approve');
INSERT INTO `permissions` VALUES (18,'admin_ui');
INSERT INTO `permissions` VALUES (19,'member_ui');
INSERT INTO `permissions` VALUES (20,'delete_all_reports');

#
# Source for table permissions_roles
#

CREATE TABLE `permissions_roles` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED COMMENT='Stores permissions assigned to roles';

#
# Dumping data for table permissions_roles
#

INSERT INTO `permissions_roles` VALUES (1,14);
INSERT INTO `permissions_roles` VALUES (2,1);
INSERT INTO `permissions_roles` VALUES (2,2);
INSERT INTO `permissions_roles` VALUES (2,4);
INSERT INTO `permissions_roles` VALUES (2,5);
INSERT INTO `permissions_roles` VALUES (2,6);
INSERT INTO `permissions_roles` VALUES (2,7);
INSERT INTO `permissions_roles` VALUES (2,8);
INSERT INTO `permissions_roles` VALUES (2,9);
INSERT INTO `permissions_roles` VALUES (2,10);
INSERT INTO `permissions_roles` VALUES (2,11);
INSERT INTO `permissions_roles` VALUES (2,12);
INSERT INTO `permissions_roles` VALUES (2,14);
INSERT INTO `permissions_roles` VALUES (2,15);
INSERT INTO `permissions_roles` VALUES (2,16);
INSERT INTO `permissions_roles` VALUES (2,17);
INSERT INTO `permissions_roles` VALUES (2,18);
INSERT INTO `permissions_roles` VALUES (3,1);
INSERT INTO `permissions_roles` VALUES (3,2);
INSERT INTO `permissions_roles` VALUES (3,4);
INSERT INTO `permissions_roles` VALUES (3,5);
INSERT INTO `permissions_roles` VALUES (3,6);
INSERT INTO `permissions_roles` VALUES (3,7);
INSERT INTO `permissions_roles` VALUES (3,8);
INSERT INTO `permissions_roles` VALUES (3,9);
INSERT INTO `permissions_roles` VALUES (3,10);
INSERT INTO `permissions_roles` VALUES (3,11);
INSERT INTO `permissions_roles` VALUES (3,12);
INSERT INTO `permissions_roles` VALUES (3,13);
INSERT INTO `permissions_roles` VALUES (3,14);
INSERT INTO `permissions_roles` VALUES (3,15);
INSERT INTO `permissions_roles` VALUES (3,16);
INSERT INTO `permissions_roles` VALUES (3,17);
INSERT INTO `permissions_roles` VALUES (3,18);
INSERT INTO `permissions_roles` VALUES (3,20);
INSERT INTO `permissions_roles` VALUES (4,19);

#
# Source for table plugin
#

CREATE TABLE `plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `plugin_url` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `plugin_description` text CHARACTER SET latin1,
  `plugin_priority` tinyint(4) DEFAULT '0',
  `plugin_active` tinyint(4) DEFAULT '0',
  `plugin_installed` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Holds a list of all plugins installed on a deployment';

#
# Dumping data for table plugin
#

INSERT INTO `plugin` VALUES (1,'adminmap',NULL,NULL,0,0,1);
INSERT INTO `plugin` VALUES (2,'clickatell',NULL,NULL,0,0,0);
INSERT INTO `plugin` VALUES (3,'enhancedmap',NULL,NULL,0,1,1);
INSERT INTO `plugin` VALUES (4,'frontlinesms',NULL,NULL,0,0,0);
INSERT INTO `plugin` VALUES (5,'sharing',NULL,NULL,0,0,1);
INSERT INTO `plugin` VALUES (6,'smssync',NULL,NULL,0,0,1);
INSERT INTO `plugin` VALUES (7,'heatmap',NULL,NULL,0,1,1);
INSERT INTO `plugin` VALUES (8,'RHTP_Heatmap',NULL,NULL,0,0,0);
INSERT INTO `plugin` VALUES (9,'analysis',NULL,NULL,0,0,1);
INSERT INTO `plugin` VALUES (10,'opengraph4ushahidi',NULL,NULL,0,1,1);
INSERT INTO `plugin` VALUES (11,'html5locate',NULL,NULL,0,0,1);
INSERT INTO `plugin` VALUES (12,'HomeMapSearch',NULL,NULL,0,0,1);
INSERT INTO `plugin` VALUES (13,'densitymap',NULL,NULL,0,1,1);
INSERT INTO `plugin` VALUES (14,'home-map-search',NULL,NULL,0,0,0);
INSERT INTO `plugin` VALUES (15,'rgraphtree',NULL,NULL,0,1,1);
INSERT INTO `plugin` VALUES (16,'reportstinymce',NULL,NULL,0,0,1);
INSERT INTO `plugin` VALUES (17,'ushahidi-plugin-dataviz',NULL,NULL,0,1,1);

#
# Source for table private_message
#

CREATE TABLE `private_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL,
  `from_user_id` int(11) DEFAULT '0',
  `private_subject` varchar(255) CHARACTER SET latin1 NOT NULL,
  `private_message` text CHARACTER SET latin1 NOT NULL,
  `private_message_date` datetime NOT NULL,
  `private_message_new` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores private messages sent between Members';

#
# Dumping data for table private_message
#


#
# Source for table rating
#

CREATE TABLE `rating` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `comment_id` bigint(20) unsigned DEFAULT NULL,
  `rating` tinyint(4) DEFAULT '0',
  `rating_ip` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `rating_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores credibility ratings for reports and comments';

#
# Dumping data for table rating
#


#
# Source for table reporter
#

CREATE TABLE `reporter` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `service_id` int(10) unsigned DEFAULT NULL,
  `level_id` int(11) unsigned DEFAULT NULL,
  `service_account` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `reporter_first` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `reporter_last` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `reporter_email` varchar(120) CHARACTER SET latin1 DEFAULT NULL,
  `reporter_phone` varchar(60) CHARACTER SET latin1 DEFAULT NULL,
  `reporter_ip` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `reporter_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Information on report submitters via email, twitter and sms';

#
# Dumping data for table reporter
#

INSERT INTO `reporter` VALUES (1,NULL,NULL,2,3,'mohit.d@browserstack.com','Mohit','Daswani','mohit.d@browserstack.com',NULL,NULL,'2020-07-19');
INSERT INTO `reporter` VALUES (2,NULL,NULL,2,3,'Noah@browserstack.com','Noah','from BrowserStack','Noah@browserstack.com',NULL,NULL,'2020-07-19');
INSERT INTO `reporter` VALUES (3,NULL,NULL,2,3,'firebase-noreply@google.com','Firebase','','firebase-noreply@google.com',NULL,NULL,'2020-07-19');
INSERT INTO `reporter` VALUES (4,NULL,NULL,2,3,'team@monday.com','monday.com','','team@monday.com',NULL,NULL,'2020-07-19');
INSERT INTO `reporter` VALUES (5,NULL,NULL,2,3,'no-reply@accounts.google.com','Google','','no-reply@accounts.google.com',NULL,NULL,'2020-07-19');
INSERT INTO `reporter` VALUES (6,NULL,NULL,2,3,'cadic.tester@gmail.com','cadic','tester (mediante Google Drive)','cadic.tester@gmail.com',NULL,NULL,'2020-07-19');
INSERT INTO `reporter` VALUES (7,NULL,NULL,2,3,'compliance@browserstack.com','BrowserStack','','compliance@browserstack.com',NULL,NULL,'2020-07-19');
INSERT INTO `reporter` VALUES (8,NULL,NULL,2,3,'comments-noreply@docs.google.com','=?UTF-8?Q?Andres_Laverde_(Hojas_de_c=C3=A1lculo_de_Google)?=','','comments-noreply@docs.google.com',NULL,NULL,'2020-07-19');
INSERT INTO `reporter` VALUES (9,NULL,NULL,2,3,'updates@academia-mail.com','Academia.edu','','updates@academia-mail.com',NULL,NULL,'2020-07-19');
INSERT INTO `reporter` VALUES (10,NULL,NULL,2,3,'premium@academia-mail.com','Academia.edu','','premium@academia-mail.com',NULL,NULL,'2020-07-19');
INSERT INTO `reporter` VALUES (11,NULL,NULL,2,3,'noreply-utos@google.com','Google','','noreply-utos@google.com',NULL,NULL,'2020-07-19');
INSERT INTO `reporter` VALUES (12,NULL,NULL,2,3,'no-reply@m.meistertask.com','MeisterTask','','no-reply@m.meistertask.com',NULL,NULL,'2020-07-26');
INSERT INTO `reporter` VALUES (13,NULL,NULL,2,3,'sales@dbvis.com','DbVis','Software - Sales','sales@dbvis.com',NULL,NULL,'2020-07-26');
INSERT INTO `reporter` VALUES (14,NULL,NULL,2,3,'analytics-noreply@google.com','Google','Analytics','analytics-noreply@google.com',NULL,NULL,'2020-07-26');
INSERT INTO `reporter` VALUES (15,NULL,NULL,2,3,'new@applemusic.com','Apple','Music','new@applemusic.com',NULL,NULL,'2020-07-28');
INSERT INTO `reporter` VALUES (16,NULL,NULL,2,3,'atencion.ciudadana@medellin.gov.co','atencion.ciudadana@medellin.gov.co','','atencion.ciudadana@medellin.gov.co',NULL,NULL,'2020-07-28');
INSERT INTO `reporter` VALUES (17,NULL,NULL,2,3,'news@browserstack.com','BrowserStack','Team','news@browserstack.com',NULL,NULL,'2020-08-01');
INSERT INTO `reporter` VALUES (18,NULL,NULL,2,3,'News_Americas@insideapple.apple.com','Apple','','News_Americas@insideapple.apple.com',NULL,NULL,'2020-08-01');
INSERT INTO `reporter` VALUES (19,NULL,NULL,2,3,'news@m.meistertask.com','MeisterTask','News','news@m.meistertask.com',NULL,NULL,'2020-08-01');
INSERT INTO `reporter` VALUES (20,NULL,NULL,2,3,'ads-account-noreply@google.com','Google','Ads','ads-account-noreply@google.com',NULL,NULL,'2020-08-19');
INSERT INTO `reporter` VALUES (21,NULL,NULL,2,3,'appstore@insideapple.apple.com','App','Store','appstore@insideapple.apple.com',NULL,NULL,'2020-08-26');

#
# Source for table roles
#

CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET latin1 NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 NOT NULL,
  `access_level` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Defines user access levels and privileges on a deployment';

#
# Dumping data for table roles
#

INSERT INTO `roles` VALUES (1,'login','Login privileges, granted after account confirmation',0);
INSERT INTO `roles` VALUES (2,'admin','Administrative user, has access to almost everything.',90);
INSERT INTO `roles` VALUES (3,'superadmin','Super administrative user, has access to everything.',100);
INSERT INTO `roles` VALUES (4,'member','Regular user with access only to the member area',10);

#
# Source for table roles_users
#

CREATE TABLE `roles_users` (
  `user_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Stores roles assigned to users registered on a deployment';

#
# Dumping data for table roles_users
#

INSERT INTO `roles_users` VALUES (1,1);
INSERT INTO `roles_users` VALUES (1,2);
INSERT INTO `roles_users` VALUES (1,3);
INSERT INTO `roles_users` VALUES (2,1);
INSERT INTO `roles_users` VALUES (2,3);

#
# Source for table scheduler
#

CREATE TABLE `scheduler` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scheduler_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `scheduler_last` int(10) unsigned NOT NULL DEFAULT '0',
  `scheduler_weekday` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_day` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_hour` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_minute` smallint(6) NOT NULL,
  `scheduler_controller` varchar(100) CHARACTER SET latin1 NOT NULL,
  `scheduler_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores schedules for cron jobs';

#
# Dumping data for table scheduler
#

INSERT INTO `scheduler` VALUES (1,'Feeds',1596301391,-1,-1,-1,0,'s_feeds',0);
INSERT INTO `scheduler` VALUES (2,'Alerts',1599441774,-1,-1,-1,-1,'s_alerts',1);
INSERT INTO `scheduler` VALUES (3,'Email',1599441220,-1,-1,-1,0,'s_email',1);
INSERT INTO `scheduler` VALUES (4,'Twitter',1596301423,-1,-1,-1,0,'s_twitter',0);
INSERT INTO `scheduler` VALUES (5,'Cleanup',1599441220,-1,-1,-1,0,'s_cleanup',1);
INSERT INTO `scheduler` VALUES (6,'Sharing',1594511734,-1,-1,-1,-1,'s_sharing',0);

#
# Source for table scheduler_log
#

CREATE TABLE `scheduler_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `scheduler_id` int(10) unsigned NOT NULL,
  `scheduler_status` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `scheduler_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1595 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores a log of scheduler actions';

#
# Dumping data for table scheduler_log
#

INSERT INTO `scheduler_log` VALUES (1,1,'200',1590640752);
INSERT INTO `scheduler_log` VALUES (2,2,'200',1590640752);
INSERT INTO `scheduler_log` VALUES (3,3,'200',1590640752);
INSERT INTO `scheduler_log` VALUES (4,4,'200',1590640752);
INSERT INTO `scheduler_log` VALUES (5,5,'200',1590640752);
INSERT INTO `scheduler_log` VALUES (6,1,'200',1591246853);
INSERT INTO `scheduler_log` VALUES (7,2,'200',1591246853);
INSERT INTO `scheduler_log` VALUES (8,3,'200',1591246853);
INSERT INTO `scheduler_log` VALUES (9,4,'200',1591246853);
INSERT INTO `scheduler_log` VALUES (10,5,'200',1591246853);
INSERT INTO `scheduler_log` VALUES (11,2,'200',1591248010);
INSERT INTO `scheduler_log` VALUES (12,2,'200',1591249378);
INSERT INTO `scheduler_log` VALUES (13,2,'200',1591249391);
INSERT INTO `scheduler_log` VALUES (14,1,'200',1591251011);
INSERT INTO `scheduler_log` VALUES (15,2,'200',1591251011);
INSERT INTO `scheduler_log` VALUES (16,3,'200',1591251011);
INSERT INTO `scheduler_log` VALUES (17,4,'200',1591251011);
INSERT INTO `scheduler_log` VALUES (18,5,'200',1591251011);
INSERT INTO `scheduler_log` VALUES (19,2,'200',1591252849);
INSERT INTO `scheduler_log` VALUES (20,2,'200',1591253157);
INSERT INTO `scheduler_log` VALUES (21,1,'200',1591407409);
INSERT INTO `scheduler_log` VALUES (22,2,'200',1591407409);
INSERT INTO `scheduler_log` VALUES (23,3,'200',1591407409);
INSERT INTO `scheduler_log` VALUES (24,4,'200',1591407409);
INSERT INTO `scheduler_log` VALUES (25,5,'200',1591407409);
INSERT INTO `scheduler_log` VALUES (26,2,'200',1591407421);
INSERT INTO `scheduler_log` VALUES (27,2,'200',1591407480);
INSERT INTO `scheduler_log` VALUES (28,2,'200',1591407485);
INSERT INTO `scheduler_log` VALUES (29,2,'200',1591407587);
INSERT INTO `scheduler_log` VALUES (30,2,'200',1591407600);
INSERT INTO `scheduler_log` VALUES (31,2,'200',1591407630);
INSERT INTO `scheduler_log` VALUES (32,1,'200',1591409798);
INSERT INTO `scheduler_log` VALUES (33,2,'200',1591409798);
INSERT INTO `scheduler_log` VALUES (34,3,'200',1591409798);
INSERT INTO `scheduler_log` VALUES (35,4,'200',1591409798);
INSERT INTO `scheduler_log` VALUES (36,5,'200',1591409798);
INSERT INTO `scheduler_log` VALUES (37,2,'200',1591409833);
INSERT INTO `scheduler_log` VALUES (38,2,'200',1591410096);
INSERT INTO `scheduler_log` VALUES (39,2,'200',1591410580);
INSERT INTO `scheduler_log` VALUES (40,1,'200',1591413065);
INSERT INTO `scheduler_log` VALUES (41,2,'200',1591413065);
INSERT INTO `scheduler_log` VALUES (42,3,'200',1591413065);
INSERT INTO `scheduler_log` VALUES (43,4,'200',1591413065);
INSERT INTO `scheduler_log` VALUES (44,5,'200',1591413065);
INSERT INTO `scheduler_log` VALUES (45,2,'200',1591413256);
INSERT INTO `scheduler_log` VALUES (46,1,'200',1591421665);
INSERT INTO `scheduler_log` VALUES (47,2,'200',1591421665);
INSERT INTO `scheduler_log` VALUES (48,3,'200',1591421665);
INSERT INTO `scheduler_log` VALUES (49,4,'200',1591421665);
INSERT INTO `scheduler_log` VALUES (50,5,'200',1591421665);
INSERT INTO `scheduler_log` VALUES (51,2,'200',1591421725);
INSERT INTO `scheduler_log` VALUES (52,2,'200',1591421783);
INSERT INTO `scheduler_log` VALUES (53,2,'200',1591421848);
INSERT INTO `scheduler_log` VALUES (54,2,'200',1591421880);
INSERT INTO `scheduler_log` VALUES (55,2,'200',1591422109);
INSERT INTO `scheduler_log` VALUES (56,2,'200',1591422369);
INSERT INTO `scheduler_log` VALUES (57,2,'200',1591423034);
INSERT INTO `scheduler_log` VALUES (58,1,'200',1591423600);
INSERT INTO `scheduler_log` VALUES (59,2,'200',1591423600);
INSERT INTO `scheduler_log` VALUES (60,3,'200',1591423600);
INSERT INTO `scheduler_log` VALUES (61,4,'200',1591423600);
INSERT INTO `scheduler_log` VALUES (62,5,'200',1591423600);
INSERT INTO `scheduler_log` VALUES (63,2,'200',1591424286);
INSERT INTO `scheduler_log` VALUES (64,2,'200',1591424350);
INSERT INTO `scheduler_log` VALUES (65,2,'200',1591424420);
INSERT INTO `scheduler_log` VALUES (66,2,'200',1591424779);
INSERT INTO `scheduler_log` VALUES (67,2,'200',1591425002);
INSERT INTO `scheduler_log` VALUES (68,2,'200',1591425138);
INSERT INTO `scheduler_log` VALUES (69,2,'200',1591425250);
INSERT INTO `scheduler_log` VALUES (70,2,'200',1591425346);
INSERT INTO `scheduler_log` VALUES (71,2,'200',1591425653);
INSERT INTO `scheduler_log` VALUES (72,2,'200',1591425866);
INSERT INTO `scheduler_log` VALUES (73,2,'200',1591426103);
INSERT INTO `scheduler_log` VALUES (74,2,'200',1591426184);
INSERT INTO `scheduler_log` VALUES (75,1,'200',1591427964);
INSERT INTO `scheduler_log` VALUES (76,2,'200',1591427964);
INSERT INTO `scheduler_log` VALUES (77,3,'200',1591427964);
INSERT INTO `scheduler_log` VALUES (78,4,'200',1591427964);
INSERT INTO `scheduler_log` VALUES (79,5,'200',1591427964);
INSERT INTO `scheduler_log` VALUES (80,2,'200',1591428067);
INSERT INTO `scheduler_log` VALUES (81,2,'200',1591428268);
INSERT INTO `scheduler_log` VALUES (82,2,'200',1591428721);
INSERT INTO `scheduler_log` VALUES (83,2,'200',1591428872);
INSERT INTO `scheduler_log` VALUES (84,2,'200',1591429040);
INSERT INTO `scheduler_log` VALUES (85,2,'200',1591429167);
INSERT INTO `scheduler_log` VALUES (86,1,'200',1591430903);
INSERT INTO `scheduler_log` VALUES (87,2,'200',1591430903);
INSERT INTO `scheduler_log` VALUES (88,3,'200',1591430903);
INSERT INTO `scheduler_log` VALUES (89,4,'200',1591430903);
INSERT INTO `scheduler_log` VALUES (90,5,'200',1591430903);
INSERT INTO `scheduler_log` VALUES (91,2,'200',1591430947);
INSERT INTO `scheduler_log` VALUES (92,2,'200',1591431055);
INSERT INTO `scheduler_log` VALUES (93,2,'200',1591431076);
INSERT INTO `scheduler_log` VALUES (94,2,'200',1591431446);
INSERT INTO `scheduler_log` VALUES (95,2,'200',1591432668);
INSERT INTO `scheduler_log` VALUES (96,1,'200',1591680938);
INSERT INTO `scheduler_log` VALUES (97,2,'200',1591680938);
INSERT INTO `scheduler_log` VALUES (98,3,'200',1591680938);
INSERT INTO `scheduler_log` VALUES (99,4,'200',1591680938);
INSERT INTO `scheduler_log` VALUES (100,5,'200',1591680938);
INSERT INTO `scheduler_log` VALUES (101,2,'200',1591681207);
INSERT INTO `scheduler_log` VALUES (102,2,'200',1591682033);
INSERT INTO `scheduler_log` VALUES (103,2,'200',1591682049);
INSERT INTO `scheduler_log` VALUES (104,1,'200',1591683569);
INSERT INTO `scheduler_log` VALUES (105,2,'200',1591683569);
INSERT INTO `scheduler_log` VALUES (106,3,'200',1591683569);
INSERT INTO `scheduler_log` VALUES (107,4,'200',1591683569);
INSERT INTO `scheduler_log` VALUES (108,5,'200',1591683569);
INSERT INTO `scheduler_log` VALUES (109,2,'200',1591684224);
INSERT INTO `scheduler_log` VALUES (110,2,'200',1591684415);
INSERT INTO `scheduler_log` VALUES (111,2,'200',1591684444);
INSERT INTO `scheduler_log` VALUES (112,2,'200',1591684668);
INSERT INTO `scheduler_log` VALUES (113,2,'200',1591684995);
INSERT INTO `scheduler_log` VALUES (114,2,'200',1591685238);
INSERT INTO `scheduler_log` VALUES (115,2,'200',1591685347);
INSERT INTO `scheduler_log` VALUES (116,2,'200',1591685635);
INSERT INTO `scheduler_log` VALUES (117,2,'200',1591685705);
INSERT INTO `scheduler_log` VALUES (118,2,'200',1591685810);
INSERT INTO `scheduler_log` VALUES (119,2,'200',1591685821);
INSERT INTO `scheduler_log` VALUES (120,2,'200',1591685915);
INSERT INTO `scheduler_log` VALUES (121,1,'200',1591844173);
INSERT INTO `scheduler_log` VALUES (122,2,'200',1591844173);
INSERT INTO `scheduler_log` VALUES (123,3,'200',1591844173);
INSERT INTO `scheduler_log` VALUES (124,4,'200',1591844173);
INSERT INTO `scheduler_log` VALUES (125,5,'200',1591844173);
INSERT INTO `scheduler_log` VALUES (126,1,'200',1591847235);
INSERT INTO `scheduler_log` VALUES (127,2,'200',1591847235);
INSERT INTO `scheduler_log` VALUES (128,3,'200',1591847235);
INSERT INTO `scheduler_log` VALUES (129,4,'200',1591847235);
INSERT INTO `scheduler_log` VALUES (130,5,'200',1591847235);
INSERT INTO `scheduler_log` VALUES (131,2,'200',1591847588);
INSERT INTO `scheduler_log` VALUES (132,2,'200',1591847641);
INSERT INTO `scheduler_log` VALUES (133,2,'200',1591847916);
INSERT INTO `scheduler_log` VALUES (134,1,'200',1591848174);
INSERT INTO `scheduler_log` VALUES (135,2,'200',1591848174);
INSERT INTO `scheduler_log` VALUES (136,3,'200',1591848174);
INSERT INTO `scheduler_log` VALUES (137,4,'200',1591848174);
INSERT INTO `scheduler_log` VALUES (138,5,'200',1591848174);
INSERT INTO `scheduler_log` VALUES (139,2,'200',1591848507);
INSERT INTO `scheduler_log` VALUES (140,2,'200',1591848543);
INSERT INTO `scheduler_log` VALUES (141,2,'200',1591848658);
INSERT INTO `scheduler_log` VALUES (142,2,'200',1591848661);
INSERT INTO `scheduler_log` VALUES (143,2,'200',1591848742);
INSERT INTO `scheduler_log` VALUES (144,2,'200',1591849051);
INSERT INTO `scheduler_log` VALUES (145,2,'200',1591849261);
INSERT INTO `scheduler_log` VALUES (146,2,'200',1591849683);
INSERT INTO `scheduler_log` VALUES (147,2,'200',1591849871);
INSERT INTO `scheduler_log` VALUES (148,2,'200',1591849972);
INSERT INTO `scheduler_log` VALUES (149,2,'200',1591850215);
INSERT INTO `scheduler_log` VALUES (150,2,'200',1591850475);
INSERT INTO `scheduler_log` VALUES (151,2,'200',1591850574);
INSERT INTO `scheduler_log` VALUES (152,2,'200',1591850613);
INSERT INTO `scheduler_log` VALUES (153,2,'200',1591850936);
INSERT INTO `scheduler_log` VALUES (154,2,'200',1591851029);
INSERT INTO `scheduler_log` VALUES (155,2,'200',1591851118);
INSERT INTO `scheduler_log` VALUES (156,2,'200',1591851123);
INSERT INTO `scheduler_log` VALUES (157,2,'200',1591851182);
INSERT INTO `scheduler_log` VALUES (158,2,'200',1591851443);
INSERT INTO `scheduler_log` VALUES (159,2,'200',1591851490);
INSERT INTO `scheduler_log` VALUES (160,2,'200',1591851549);
INSERT INTO `scheduler_log` VALUES (161,1,'200',1591851611);
INSERT INTO `scheduler_log` VALUES (162,2,'200',1591851611);
INSERT INTO `scheduler_log` VALUES (163,3,'200',1591851611);
INSERT INTO `scheduler_log` VALUES (164,4,'200',1591851611);
INSERT INTO `scheduler_log` VALUES (165,5,'200',1591851611);
INSERT INTO `scheduler_log` VALUES (166,2,'200',1591851671);
INSERT INTO `scheduler_log` VALUES (167,2,'200',1591852597);
INSERT INTO `scheduler_log` VALUES (168,2,'200',1591852756);
INSERT INTO `scheduler_log` VALUES (169,2,'200',1591852813);
INSERT INTO `scheduler_log` VALUES (170,2,'200',1591852878);
INSERT INTO `scheduler_log` VALUES (171,2,'200',1591852927);
INSERT INTO `scheduler_log` VALUES (172,2,'200',1591852991);
INSERT INTO `scheduler_log` VALUES (173,2,'200',1591853137);
INSERT INTO `scheduler_log` VALUES (174,1,'200',1591889939);
INSERT INTO `scheduler_log` VALUES (175,2,'200',1591889939);
INSERT INTO `scheduler_log` VALUES (176,3,'200',1591889939);
INSERT INTO `scheduler_log` VALUES (177,4,'200',1591889939);
INSERT INTO `scheduler_log` VALUES (178,5,'200',1591889939);
INSERT INTO `scheduler_log` VALUES (179,2,'200',1591890342);
INSERT INTO `scheduler_log` VALUES (180,2,'200',1591890502);
INSERT INTO `scheduler_log` VALUES (181,2,'200',1591890599);
INSERT INTO `scheduler_log` VALUES (182,2,'200',1591890685);
INSERT INTO `scheduler_log` VALUES (183,2,'200',1591891098);
INSERT INTO `scheduler_log` VALUES (184,1,'200',1591891405);
INSERT INTO `scheduler_log` VALUES (185,2,'200',1591891405);
INSERT INTO `scheduler_log` VALUES (186,3,'200',1591891405);
INSERT INTO `scheduler_log` VALUES (187,4,'200',1591891405);
INSERT INTO `scheduler_log` VALUES (188,5,'200',1591891405);
INSERT INTO `scheduler_log` VALUES (189,2,'200',1591892345);
INSERT INTO `scheduler_log` VALUES (190,2,'200',1591892514);
INSERT INTO `scheduler_log` VALUES (191,2,'200',1591892675);
INSERT INTO `scheduler_log` VALUES (192,2,'200',1591894270);
INSERT INTO `scheduler_log` VALUES (193,2,'200',1591894349);
INSERT INTO `scheduler_log` VALUES (194,1,'200',1591895331);
INSERT INTO `scheduler_log` VALUES (195,2,'200',1591895331);
INSERT INTO `scheduler_log` VALUES (196,3,'200',1591895331);
INSERT INTO `scheduler_log` VALUES (197,4,'200',1591895331);
INSERT INTO `scheduler_log` VALUES (198,5,'200',1591895331);
INSERT INTO `scheduler_log` VALUES (199,2,'200',1591895369);
INSERT INTO `scheduler_log` VALUES (200,2,'200',1591895586);
INSERT INTO `scheduler_log` VALUES (201,2,'200',1591895679);
INSERT INTO `scheduler_log` VALUES (202,2,'200',1591895703);
INSERT INTO `scheduler_log` VALUES (203,2,'200',1591895989);
INSERT INTO `scheduler_log` VALUES (204,2,'200',1591896013);
INSERT INTO `scheduler_log` VALUES (205,2,'200',1591896603);
INSERT INTO `scheduler_log` VALUES (206,2,'200',1591897692);
INSERT INTO `scheduler_log` VALUES (207,2,'200',1591897758);
INSERT INTO `scheduler_log` VALUES (208,2,'200',1591897860);
INSERT INTO `scheduler_log` VALUES (209,2,'200',1591897921);
INSERT INTO `scheduler_log` VALUES (210,2,'200',1591897994);
INSERT INTO `scheduler_log` VALUES (211,2,'200',1591898043);
INSERT INTO `scheduler_log` VALUES (212,1,'200',1591904819);
INSERT INTO `scheduler_log` VALUES (213,2,'200',1591904819);
INSERT INTO `scheduler_log` VALUES (214,3,'200',1591904819);
INSERT INTO `scheduler_log` VALUES (215,4,'200',1591904819);
INSERT INTO `scheduler_log` VALUES (216,5,'200',1591904819);
INSERT INTO `scheduler_log` VALUES (217,2,'200',1591904821);
INSERT INTO `scheduler_log` VALUES (218,2,'200',1591905231);
INSERT INTO `scheduler_log` VALUES (219,2,'200',1591905249);
INSERT INTO `scheduler_log` VALUES (220,2,'200',1591905375);
INSERT INTO `scheduler_log` VALUES (221,2,'200',1591905445);
INSERT INTO `scheduler_log` VALUES (222,2,'200',1591905527);
INSERT INTO `scheduler_log` VALUES (223,2,'200',1591905548);
INSERT INTO `scheduler_log` VALUES (224,1,'200',1591905695);
INSERT INTO `scheduler_log` VALUES (225,2,'200',1591905695);
INSERT INTO `scheduler_log` VALUES (226,3,'200',1591905695);
INSERT INTO `scheduler_log` VALUES (227,4,'200',1591905695);
INSERT INTO `scheduler_log` VALUES (228,5,'200',1591905695);
INSERT INTO `scheduler_log` VALUES (229,2,'200',1591905885);
INSERT INTO `scheduler_log` VALUES (230,1,'200',1591910216);
INSERT INTO `scheduler_log` VALUES (231,2,'200',1591910216);
INSERT INTO `scheduler_log` VALUES (232,3,'200',1591910216);
INSERT INTO `scheduler_log` VALUES (233,4,'200',1591910216);
INSERT INTO `scheduler_log` VALUES (234,5,'200',1591910216);
INSERT INTO `scheduler_log` VALUES (235,2,'200',1591910261);
INSERT INTO `scheduler_log` VALUES (236,2,'200',1591910309);
INSERT INTO `scheduler_log` VALUES (237,2,'200',1591910341);
INSERT INTO `scheduler_log` VALUES (238,2,'200',1591910467);
INSERT INTO `scheduler_log` VALUES (239,2,'200',1591910559);
INSERT INTO `scheduler_log` VALUES (240,2,'200',1591910620);
INSERT INTO `scheduler_log` VALUES (241,2,'200',1591910664);
INSERT INTO `scheduler_log` VALUES (242,2,'200',1591910738);
INSERT INTO `scheduler_log` VALUES (243,2,'200',1591911506);
INSERT INTO `scheduler_log` VALUES (244,2,'200',1591911563);
INSERT INTO `scheduler_log` VALUES (245,2,'200',1591911618);
INSERT INTO `scheduler_log` VALUES (246,2,'200',1591911710);
INSERT INTO `scheduler_log` VALUES (247,2,'200',1591912254);
INSERT INTO `scheduler_log` VALUES (248,2,'200',1591912262);
INSERT INTO `scheduler_log` VALUES (249,1,'200',1591913339);
INSERT INTO `scheduler_log` VALUES (250,2,'200',1591913339);
INSERT INTO `scheduler_log` VALUES (251,3,'200',1591913339);
INSERT INTO `scheduler_log` VALUES (252,4,'200',1591913339);
INSERT INTO `scheduler_log` VALUES (253,5,'200',1591913339);
INSERT INTO `scheduler_log` VALUES (254,2,'200',1591913346);
INSERT INTO `scheduler_log` VALUES (255,2,'200',1591913621);
INSERT INTO `scheduler_log` VALUES (256,2,'200',1591913843);
INSERT INTO `scheduler_log` VALUES (257,2,'200',1591914850);
INSERT INTO `scheduler_log` VALUES (258,1,'200',1591920220);
INSERT INTO `scheduler_log` VALUES (259,2,'200',1591920220);
INSERT INTO `scheduler_log` VALUES (260,3,'200',1591920220);
INSERT INTO `scheduler_log` VALUES (261,4,'200',1591920220);
INSERT INTO `scheduler_log` VALUES (262,5,'200',1591920220);
INSERT INTO `scheduler_log` VALUES (263,2,'200',1591920249);
INSERT INTO `scheduler_log` VALUES (264,2,'200',1591920324);
INSERT INTO `scheduler_log` VALUES (265,2,'200',1591920394);
INSERT INTO `scheduler_log` VALUES (266,2,'200',1591920683);
INSERT INTO `scheduler_log` VALUES (267,2,'200',1591920755);
INSERT INTO `scheduler_log` VALUES (268,2,'200',1591920816);
INSERT INTO `scheduler_log` VALUES (269,2,'200',1591921116);
INSERT INTO `scheduler_log` VALUES (270,2,'200',1591921157);
INSERT INTO `scheduler_log` VALUES (271,2,'200',1591921404);
INSERT INTO `scheduler_log` VALUES (272,2,'200',1591921740);
INSERT INTO `scheduler_log` VALUES (273,2,'200',1591921751);
INSERT INTO `scheduler_log` VALUES (274,2,'200',1591921914);
INSERT INTO `scheduler_log` VALUES (275,2,'200',1591921941);
INSERT INTO `scheduler_log` VALUES (276,2,'200',1591921980);
INSERT INTO `scheduler_log` VALUES (277,2,'200',1591921981);
INSERT INTO `scheduler_log` VALUES (278,2,'200',1591922058);
INSERT INTO `scheduler_log` VALUES (279,2,'200',1591922107);
INSERT INTO `scheduler_log` VALUES (280,2,'200',1591922166);
INSERT INTO `scheduler_log` VALUES (281,2,'200',1591922222);
INSERT INTO `scheduler_log` VALUES (282,2,'200',1591922296);
INSERT INTO `scheduler_log` VALUES (283,2,'200',1591922494);
INSERT INTO `scheduler_log` VALUES (284,2,'200',1591922584);
INSERT INTO `scheduler_log` VALUES (285,2,'200',1591922649);
INSERT INTO `scheduler_log` VALUES (286,1,'200',1591926894);
INSERT INTO `scheduler_log` VALUES (287,2,'200',1591926894);
INSERT INTO `scheduler_log` VALUES (288,3,'200',1591926894);
INSERT INTO `scheduler_log` VALUES (289,4,'200',1591926894);
INSERT INTO `scheduler_log` VALUES (290,5,'200',1591926894);
INSERT INTO `scheduler_log` VALUES (291,2,'200',1591926904);
INSERT INTO `scheduler_log` VALUES (292,1,'200',1591927276);
INSERT INTO `scheduler_log` VALUES (293,2,'200',1591927276);
INSERT INTO `scheduler_log` VALUES (294,3,'200',1591927276);
INSERT INTO `scheduler_log` VALUES (295,4,'200',1591927276);
INSERT INTO `scheduler_log` VALUES (296,5,'200',1591927276);
INSERT INTO `scheduler_log` VALUES (297,2,'200',1591927469);
INSERT INTO `scheduler_log` VALUES (298,2,'200',1591927501);
INSERT INTO `scheduler_log` VALUES (299,2,'200',1591927599);
INSERT INTO `scheduler_log` VALUES (300,2,'200',1591927620);
INSERT INTO `scheduler_log` VALUES (301,2,'200',1591927627);
INSERT INTO `scheduler_log` VALUES (302,2,'200',1591927705);
INSERT INTO `scheduler_log` VALUES (303,2,'200',1591927800);
INSERT INTO `scheduler_log` VALUES (304,2,'200',1591927874);
INSERT INTO `scheduler_log` VALUES (305,2,'200',1591927997);
INSERT INTO `scheduler_log` VALUES (306,1,'200',1591933679);
INSERT INTO `scheduler_log` VALUES (307,2,'200',1591933679);
INSERT INTO `scheduler_log` VALUES (308,3,'200',1591933679);
INSERT INTO `scheduler_log` VALUES (309,4,'200',1591933679);
INSERT INTO `scheduler_log` VALUES (310,5,'200',1591933679);
INSERT INTO `scheduler_log` VALUES (311,2,'200',1591933693);
INSERT INTO `scheduler_log` VALUES (312,2,'200',1591933787);
INSERT INTO `scheduler_log` VALUES (313,2,'200',1591933846);
INSERT INTO `scheduler_log` VALUES (314,2,'200',1591933981);
INSERT INTO `scheduler_log` VALUES (315,1,'200',1591934541);
INSERT INTO `scheduler_log` VALUES (316,2,'200',1591934541);
INSERT INTO `scheduler_log` VALUES (317,3,'200',1591934541);
INSERT INTO `scheduler_log` VALUES (318,4,'200',1591934541);
INSERT INTO `scheduler_log` VALUES (319,5,'200',1591934541);
INSERT INTO `scheduler_log` VALUES (320,2,'200',1591935119);
INSERT INTO `scheduler_log` VALUES (321,2,'200',1591935123);
INSERT INTO `scheduler_log` VALUES (322,2,'200',1591935383);
INSERT INTO `scheduler_log` VALUES (323,2,'200',1591935681);
INSERT INTO `scheduler_log` VALUES (324,1,'200',1592030530);
INSERT INTO `scheduler_log` VALUES (325,2,'200',1592030530);
INSERT INTO `scheduler_log` VALUES (326,3,'200',1592030530);
INSERT INTO `scheduler_log` VALUES (327,4,'200',1592030530);
INSERT INTO `scheduler_log` VALUES (328,5,'200',1592030530);
INSERT INTO `scheduler_log` VALUES (329,2,'200',1592031310);
INSERT INTO `scheduler_log` VALUES (330,2,'200',1592031482);
INSERT INTO `scheduler_log` VALUES (331,1,'200',1592031724);
INSERT INTO `scheduler_log` VALUES (332,2,'200',1592031724);
INSERT INTO `scheduler_log` VALUES (333,3,'200',1592031724);
INSERT INTO `scheduler_log` VALUES (334,4,'200',1592031724);
INSERT INTO `scheduler_log` VALUES (335,5,'200',1592031724);
INSERT INTO `scheduler_log` VALUES (336,2,'200',1592031791);
INSERT INTO `scheduler_log` VALUES (337,2,'200',1592031864);
INSERT INTO `scheduler_log` VALUES (338,1,'200',1592448177);
INSERT INTO `scheduler_log` VALUES (339,2,'200',1592448178);
INSERT INTO `scheduler_log` VALUES (340,3,'200',1592448178);
INSERT INTO `scheduler_log` VALUES (341,4,'200',1592448178);
INSERT INTO `scheduler_log` VALUES (342,5,'200',1592448178);
INSERT INTO `scheduler_log` VALUES (343,1,'200',1592449375);
INSERT INTO `scheduler_log` VALUES (344,2,'200',1592449375);
INSERT INTO `scheduler_log` VALUES (345,3,'200',1592449375);
INSERT INTO `scheduler_log` VALUES (346,4,'200',1592449375);
INSERT INTO `scheduler_log` VALUES (347,5,'200',1592449375);
INSERT INTO `scheduler_log` VALUES (348,2,'200',1592449382);
INSERT INTO `scheduler_log` VALUES (349,2,'200',1592449458);
INSERT INTO `scheduler_log` VALUES (350,1,'200',1592453450);
INSERT INTO `scheduler_log` VALUES (351,2,'200',1592453450);
INSERT INTO `scheduler_log` VALUES (352,3,'200',1592453450);
INSERT INTO `scheduler_log` VALUES (353,4,'200',1592453450);
INSERT INTO `scheduler_log` VALUES (354,5,'200',1592453450);
INSERT INTO `scheduler_log` VALUES (355,1,'200',1593026952);
INSERT INTO `scheduler_log` VALUES (356,2,'200',1593026952);
INSERT INTO `scheduler_log` VALUES (357,3,'200',1593026952);
INSERT INTO `scheduler_log` VALUES (358,4,'200',1593026952);
INSERT INTO `scheduler_log` VALUES (359,5,'200',1593026952);
INSERT INTO `scheduler_log` VALUES (360,2,'200',1593027192);
INSERT INTO `scheduler_log` VALUES (361,2,'200',1593027257);
INSERT INTO `scheduler_log` VALUES (362,1,'200',1593184327);
INSERT INTO `scheduler_log` VALUES (363,2,'200',1593184327);
INSERT INTO `scheduler_log` VALUES (364,3,'200',1593184327);
INSERT INTO `scheduler_log` VALUES (365,4,'200',1593184327);
INSERT INTO `scheduler_log` VALUES (366,5,'200',1593184327);
INSERT INTO `scheduler_log` VALUES (367,2,'200',1593184393);
INSERT INTO `scheduler_log` VALUES (368,2,'200',1593185331);
INSERT INTO `scheduler_log` VALUES (369,1,'200',1593482187);
INSERT INTO `scheduler_log` VALUES (370,2,'200',1593482187);
INSERT INTO `scheduler_log` VALUES (371,3,'200',1593482187);
INSERT INTO `scheduler_log` VALUES (372,4,'200',1593482188);
INSERT INTO `scheduler_log` VALUES (373,5,'200',1593482188);
INSERT INTO `scheduler_log` VALUES (374,1,'200',1593483263);
INSERT INTO `scheduler_log` VALUES (375,2,'200',1593483263);
INSERT INTO `scheduler_log` VALUES (376,3,'200',1593483263);
INSERT INTO `scheduler_log` VALUES (377,4,'200',1593483263);
INSERT INTO `scheduler_log` VALUES (378,5,'200',1593483263);
INSERT INTO `scheduler_log` VALUES (379,1,'200',1593652193);
INSERT INTO `scheduler_log` VALUES (380,2,'200',1593652193);
INSERT INTO `scheduler_log` VALUES (381,3,'200',1593652193);
INSERT INTO `scheduler_log` VALUES (382,4,'200',1593652193);
INSERT INTO `scheduler_log` VALUES (383,5,'200',1593652193);
INSERT INTO `scheduler_log` VALUES (384,2,'200',1593652203);
INSERT INTO `scheduler_log` VALUES (385,2,'200',1593653837);
INSERT INTO `scheduler_log` VALUES (386,2,'200',1593654983);
INSERT INTO `scheduler_log` VALUES (387,1,'200',1593658607);
INSERT INTO `scheduler_log` VALUES (388,2,'200',1593658607);
INSERT INTO `scheduler_log` VALUES (389,3,'200',1593658607);
INSERT INTO `scheduler_log` VALUES (390,4,'200',1593658607);
INSERT INTO `scheduler_log` VALUES (391,5,'200',1593658607);
INSERT INTO `scheduler_log` VALUES (392,1,'200',1593658955);
INSERT INTO `scheduler_log` VALUES (393,2,'200',1593658955);
INSERT INTO `scheduler_log` VALUES (394,3,'200',1593658955);
INSERT INTO `scheduler_log` VALUES (395,4,'200',1593658955);
INSERT INTO `scheduler_log` VALUES (396,5,'200',1593658955);
INSERT INTO `scheduler_log` VALUES (397,2,'200',1593658981);
INSERT INTO `scheduler_log` VALUES (398,2,'200',1593659406);
INSERT INTO `scheduler_log` VALUES (399,2,'200',1593659540);
INSERT INTO `scheduler_log` VALUES (400,2,'200',1593659812);
INSERT INTO `scheduler_log` VALUES (401,2,'200',1593659822);
INSERT INTO `scheduler_log` VALUES (402,2,'200',1593659880);
INSERT INTO `scheduler_log` VALUES (403,2,'200',1593659912);
INSERT INTO `scheduler_log` VALUES (404,2,'200',1593660460);
INSERT INTO `scheduler_log` VALUES (405,2,'200',1593660504);
INSERT INTO `scheduler_log` VALUES (406,2,'200',1593661363);
INSERT INTO `scheduler_log` VALUES (407,2,'200',1593661564);
INSERT INTO `scheduler_log` VALUES (408,2,'200',1593661657);
INSERT INTO `scheduler_log` VALUES (409,2,'200',1593661716);
INSERT INTO `scheduler_log` VALUES (410,2,'200',1593661764);
INSERT INTO `scheduler_log` VALUES (411,1,'200',1593663409);
INSERT INTO `scheduler_log` VALUES (412,2,'200',1593663409);
INSERT INTO `scheduler_log` VALUES (413,3,'200',1593663409);
INSERT INTO `scheduler_log` VALUES (414,4,'200',1593663409);
INSERT INTO `scheduler_log` VALUES (415,5,'200',1593663409);
INSERT INTO `scheduler_log` VALUES (416,2,'200',1593663493);
INSERT INTO `scheduler_log` VALUES (417,2,'200',1593663802);
INSERT INTO `scheduler_log` VALUES (418,2,'200',1593663843);
INSERT INTO `scheduler_log` VALUES (419,2,'200',1593663932);
INSERT INTO `scheduler_log` VALUES (420,1,'200',1593667668);
INSERT INTO `scheduler_log` VALUES (421,2,'200',1593667668);
INSERT INTO `scheduler_log` VALUES (422,3,'200',1593667668);
INSERT INTO `scheduler_log` VALUES (423,4,'200',1593667668);
INSERT INTO `scheduler_log` VALUES (424,5,'200',1593667668);
INSERT INTO `scheduler_log` VALUES (425,2,'200',1593667680);
INSERT INTO `scheduler_log` VALUES (426,2,'200',1593667695);
INSERT INTO `scheduler_log` VALUES (427,1,'200',1593706845);
INSERT INTO `scheduler_log` VALUES (428,2,'200',1593706845);
INSERT INTO `scheduler_log` VALUES (429,3,'200',1593706845);
INSERT INTO `scheduler_log` VALUES (430,4,'200',1593706845);
INSERT INTO `scheduler_log` VALUES (431,5,'200',1593706845);
INSERT INTO `scheduler_log` VALUES (432,2,'200',1593707004);
INSERT INTO `scheduler_log` VALUES (433,2,'200',1593707040);
INSERT INTO `scheduler_log` VALUES (434,2,'200',1593707048);
INSERT INTO `scheduler_log` VALUES (435,2,'200',1593707100);
INSERT INTO `scheduler_log` VALUES (436,2,'200',1593707116);
INSERT INTO `scheduler_log` VALUES (437,2,'200',1593707426);
INSERT INTO `scheduler_log` VALUES (438,2,'200',1593707782);
INSERT INTO `scheduler_log` VALUES (439,2,'200',1593708124);
INSERT INTO `scheduler_log` VALUES (440,2,'200',1593708299);
INSERT INTO `scheduler_log` VALUES (441,2,'200',1593708303);
INSERT INTO `scheduler_log` VALUES (442,2,'200',1593708360);
INSERT INTO `scheduler_log` VALUES (443,2,'200',1593708363);
INSERT INTO `scheduler_log` VALUES (444,2,'200',1593708420);
INSERT INTO `scheduler_log` VALUES (445,2,'200',1593708423);
INSERT INTO `scheduler_log` VALUES (446,2,'200',1593708492);
INSERT INTO `scheduler_log` VALUES (447,2,'200',1593708784);
INSERT INTO `scheduler_log` VALUES (448,2,'200',1593708907);
INSERT INTO `scheduler_log` VALUES (449,1,'200',1593709560);
INSERT INTO `scheduler_log` VALUES (450,2,'200',1593709560);
INSERT INTO `scheduler_log` VALUES (451,3,'200',1593709560);
INSERT INTO `scheduler_log` VALUES (452,4,'200',1593709560);
INSERT INTO `scheduler_log` VALUES (453,5,'200',1593709560);
INSERT INTO `scheduler_log` VALUES (454,2,'200',1593709574);
INSERT INTO `scheduler_log` VALUES (455,2,'200',1593710501);
INSERT INTO `scheduler_log` VALUES (456,2,'200',1593710708);
INSERT INTO `scheduler_log` VALUES (457,2,'200',1593710761);
INSERT INTO `scheduler_log` VALUES (458,1,'200',1593715641);
INSERT INTO `scheduler_log` VALUES (459,2,'200',1593715641);
INSERT INTO `scheduler_log` VALUES (460,3,'200',1593715641);
INSERT INTO `scheduler_log` VALUES (461,4,'200',1593715641);
INSERT INTO `scheduler_log` VALUES (462,5,'200',1593715641);
INSERT INTO `scheduler_log` VALUES (463,2,'200',1593715713);
INSERT INTO `scheduler_log` VALUES (464,2,'200',1593716215);
INSERT INTO `scheduler_log` VALUES (465,2,'200',1593716228);
INSERT INTO `scheduler_log` VALUES (466,2,'200',1593716347);
INSERT INTO `scheduler_log` VALUES (467,1,'200',1593716574);
INSERT INTO `scheduler_log` VALUES (468,2,'200',1593716574);
INSERT INTO `scheduler_log` VALUES (469,3,'200',1593716574);
INSERT INTO `scheduler_log` VALUES (470,4,'200',1593716574);
INSERT INTO `scheduler_log` VALUES (471,5,'200',1593716574);
INSERT INTO `scheduler_log` VALUES (472,1,'200',1593736351);
INSERT INTO `scheduler_log` VALUES (473,2,'200',1593736351);
INSERT INTO `scheduler_log` VALUES (474,3,'200',1593736351);
INSERT INTO `scheduler_log` VALUES (475,4,'200',1593736351);
INSERT INTO `scheduler_log` VALUES (476,5,'200',1593736351);
INSERT INTO `scheduler_log` VALUES (477,2,'200',1593736705);
INSERT INTO `scheduler_log` VALUES (478,2,'200',1593736779);
INSERT INTO `scheduler_log` VALUES (479,2,'200',1593736807);
INSERT INTO `scheduler_log` VALUES (480,2,'200',1593737865);
INSERT INTO `scheduler_log` VALUES (481,2,'200',1593737930);
INSERT INTO `scheduler_log` VALUES (482,2,'200',1593737975);
INSERT INTO `scheduler_log` VALUES (483,1,'200',1593744374);
INSERT INTO `scheduler_log` VALUES (484,2,'200',1593744374);
INSERT INTO `scheduler_log` VALUES (485,3,'200',1593744374);
INSERT INTO `scheduler_log` VALUES (486,4,'200',1593744374);
INSERT INTO `scheduler_log` VALUES (487,5,'200',1593744374);
INSERT INTO `scheduler_log` VALUES (488,2,'200',1593744420);
INSERT INTO `scheduler_log` VALUES (489,2,'200',1593744434);
INSERT INTO `scheduler_log` VALUES (490,2,'200',1593744480);
INSERT INTO `scheduler_log` VALUES (491,2,'200',1593744687);
INSERT INTO `scheduler_log` VALUES (492,2,'200',1593744772);
INSERT INTO `scheduler_log` VALUES (493,2,'200',1593744788);
INSERT INTO `scheduler_log` VALUES (494,2,'200',1593744967);
INSERT INTO `scheduler_log` VALUES (495,2,'200',1593745024);
INSERT INTO `scheduler_log` VALUES (496,2,'200',1593745115);
INSERT INTO `scheduler_log` VALUES (497,2,'200',1593745185);
INSERT INTO `scheduler_log` VALUES (498,1,'200',1593745206);
INSERT INTO `scheduler_log` VALUES (499,2,'200',1593745206);
INSERT INTO `scheduler_log` VALUES (500,3,'200',1593745206);
INSERT INTO `scheduler_log` VALUES (501,4,'200',1593745206);
INSERT INTO `scheduler_log` VALUES (502,5,'200',1593745206);
INSERT INTO `scheduler_log` VALUES (503,2,'200',1593745303);
INSERT INTO `scheduler_log` VALUES (504,2,'200',1593745501);
INSERT INTO `scheduler_log` VALUES (505,2,'200',1593746926);
INSERT INTO `scheduler_log` VALUES (506,2,'200',1593746940);
INSERT INTO `scheduler_log` VALUES (507,2,'200',1593746946);
INSERT INTO `scheduler_log` VALUES (508,2,'200',1593747000);
INSERT INTO `scheduler_log` VALUES (509,2,'200',1593747008);
INSERT INTO `scheduler_log` VALUES (510,2,'200',1593747192);
INSERT INTO `scheduler_log` VALUES (511,1,'200',1593748870);
INSERT INTO `scheduler_log` VALUES (512,2,'200',1593748870);
INSERT INTO `scheduler_log` VALUES (513,3,'200',1593748870);
INSERT INTO `scheduler_log` VALUES (514,4,'200',1593748870);
INSERT INTO `scheduler_log` VALUES (515,5,'200',1593748870);
INSERT INTO `scheduler_log` VALUES (516,2,'200',1593749140);
INSERT INTO `scheduler_log` VALUES (517,2,'200',1593749629);
INSERT INTO `scheduler_log` VALUES (518,2,'200',1593751106);
INSERT INTO `scheduler_log` VALUES (519,2,'200',1593752232);
INSERT INTO `scheduler_log` VALUES (520,2,'200',1593752396);
INSERT INTO `scheduler_log` VALUES (521,1,'200',1593752409);
INSERT INTO `scheduler_log` VALUES (522,2,'200',1593752409);
INSERT INTO `scheduler_log` VALUES (523,3,'200',1593752409);
INSERT INTO `scheduler_log` VALUES (524,4,'200',1593752409);
INSERT INTO `scheduler_log` VALUES (525,5,'200',1593752409);
INSERT INTO `scheduler_log` VALUES (526,2,'200',1593752487);
INSERT INTO `scheduler_log` VALUES (527,2,'200',1593752654);
INSERT INTO `scheduler_log` VALUES (528,2,'200',1593753167);
INSERT INTO `scheduler_log` VALUES (529,2,'200',1593753183);
INSERT INTO `scheduler_log` VALUES (530,2,'200',1593753254);
INSERT INTO `scheduler_log` VALUES (531,2,'200',1593753373);
INSERT INTO `scheduler_log` VALUES (532,1,'200',1593791602);
INSERT INTO `scheduler_log` VALUES (533,2,'200',1593791602);
INSERT INTO `scheduler_log` VALUES (534,3,'200',1593791602);
INSERT INTO `scheduler_log` VALUES (535,4,'200',1593791602);
INSERT INTO `scheduler_log` VALUES (536,5,'200',1593791602);
INSERT INTO `scheduler_log` VALUES (537,2,'200',1593791713);
INSERT INTO `scheduler_log` VALUES (538,2,'200',1593791764);
INSERT INTO `scheduler_log` VALUES (539,2,'200',1593791883);
INSERT INTO `scheduler_log` VALUES (540,1,'200',1593792327);
INSERT INTO `scheduler_log` VALUES (541,2,'200',1593792327);
INSERT INTO `scheduler_log` VALUES (542,3,'200',1593792327);
INSERT INTO `scheduler_log` VALUES (543,4,'200',1593792327);
INSERT INTO `scheduler_log` VALUES (544,5,'200',1593792327);
INSERT INTO `scheduler_log` VALUES (545,1,'200',1593805321);
INSERT INTO `scheduler_log` VALUES (546,2,'200',1593805321);
INSERT INTO `scheduler_log` VALUES (547,3,'200',1593805321);
INSERT INTO `scheduler_log` VALUES (548,4,'200',1593805321);
INSERT INTO `scheduler_log` VALUES (549,5,'200',1593805321);
INSERT INTO `scheduler_log` VALUES (550,2,'200',1593805429);
INSERT INTO `scheduler_log` VALUES (551,2,'200',1593805445);
INSERT INTO `scheduler_log` VALUES (552,2,'200',1593805525);
INSERT INTO `scheduler_log` VALUES (553,2,'200',1593805561);
INSERT INTO `scheduler_log` VALUES (554,2,'200',1593805955);
INSERT INTO `scheduler_log` VALUES (555,2,'200',1593806015);
INSERT INTO `scheduler_log` VALUES (556,1,'200',1593807064);
INSERT INTO `scheduler_log` VALUES (557,2,'200',1593807064);
INSERT INTO `scheduler_log` VALUES (558,3,'200',1593807064);
INSERT INTO `scheduler_log` VALUES (559,4,'200',1593807064);
INSERT INTO `scheduler_log` VALUES (560,5,'200',1593807064);
INSERT INTO `scheduler_log` VALUES (561,2,'200',1593807207);
INSERT INTO `scheduler_log` VALUES (562,2,'200',1593807293);
INSERT INTO `scheduler_log` VALUES (563,2,'200',1593807300);
INSERT INTO `scheduler_log` VALUES (564,2,'200',1593807301);
INSERT INTO `scheduler_log` VALUES (565,2,'200',1593807437);
INSERT INTO `scheduler_log` VALUES (566,2,'200',1593808048);
INSERT INTO `scheduler_log` VALUES (567,2,'200',1593808194);
INSERT INTO `scheduler_log` VALUES (568,1,'200',1593811872);
INSERT INTO `scheduler_log` VALUES (569,2,'200',1593811872);
INSERT INTO `scheduler_log` VALUES (570,3,'200',1593811872);
INSERT INTO `scheduler_log` VALUES (571,4,'200',1593811872);
INSERT INTO `scheduler_log` VALUES (572,5,'200',1593811872);
INSERT INTO `scheduler_log` VALUES (573,2,'200',1593811925);
INSERT INTO `scheduler_log` VALUES (574,2,'200',1593812000);
INSERT INTO `scheduler_log` VALUES (575,2,'200',1593812040);
INSERT INTO `scheduler_log` VALUES (576,2,'200',1593812409);
INSERT INTO `scheduler_log` VALUES (577,2,'200',1593817917);
INSERT INTO `scheduler_log` VALUES (578,4,'200',1593817917);
INSERT INTO `scheduler_log` VALUES (579,5,'200',1593817917);
INSERT INTO `scheduler_log` VALUES (580,2,'200',1593817938);
INSERT INTO `scheduler_log` VALUES (581,2,'200',1593818069);
INSERT INTO `scheduler_log` VALUES (582,2,'200',1593818106);
INSERT INTO `scheduler_log` VALUES (583,2,'200',1593819711);
INSERT INTO `scheduler_log` VALUES (584,2,'200',1593820084);
INSERT INTO `scheduler_log` VALUES (585,1,'200',1593821932);
INSERT INTO `scheduler_log` VALUES (586,2,'200',1593821932);
INSERT INTO `scheduler_log` VALUES (587,3,'200',1593821932);
INSERT INTO `scheduler_log` VALUES (588,4,'200',1593821932);
INSERT INTO `scheduler_log` VALUES (589,5,'200',1593821932);
INSERT INTO `scheduler_log` VALUES (590,2,'200',1593821940);
INSERT INTO `scheduler_log` VALUES (591,2,'200',1593822172);
INSERT INTO `scheduler_log` VALUES (592,2,'200',1593822224);
INSERT INTO `scheduler_log` VALUES (593,2,'200',1593822455);
INSERT INTO `scheduler_log` VALUES (594,2,'200',1593822927);
INSERT INTO `scheduler_log` VALUES (595,2,'200',1593822976);
INSERT INTO `scheduler_log` VALUES (596,2,'200',1593823410);
INSERT INTO `scheduler_log` VALUES (597,2,'200',1593823695);
INSERT INTO `scheduler_log` VALUES (598,2,'200',1593823794);
INSERT INTO `scheduler_log` VALUES (599,2,'200',1593823832);
INSERT INTO `scheduler_log` VALUES (600,2,'200',1593824262);
INSERT INTO `scheduler_log` VALUES (601,2,'200',1593824305);
INSERT INTO `scheduler_log` VALUES (602,2,'200',1593824354);
INSERT INTO `scheduler_log` VALUES (603,1,'200',1593824425);
INSERT INTO `scheduler_log` VALUES (604,2,'200',1593824425);
INSERT INTO `scheduler_log` VALUES (605,3,'200',1593824425);
INSERT INTO `scheduler_log` VALUES (606,4,'200',1593824425);
INSERT INTO `scheduler_log` VALUES (607,5,'200',1593824425);
INSERT INTO `scheduler_log` VALUES (608,2,'200',1593824555);
INSERT INTO `scheduler_log` VALUES (609,2,'200',1593824593);
INSERT INTO `scheduler_log` VALUES (610,2,'200',1593824713);
INSERT INTO `scheduler_log` VALUES (611,2,'200',1593824829);
INSERT INTO `scheduler_log` VALUES (612,2,'200',1593824966);
INSERT INTO `scheduler_log` VALUES (613,2,'200',1593825005);
INSERT INTO `scheduler_log` VALUES (614,2,'200',1593825090);
INSERT INTO `scheduler_log` VALUES (615,2,'200',1593825130);
INSERT INTO `scheduler_log` VALUES (616,2,'200',1593825223);
INSERT INTO `scheduler_log` VALUES (617,2,'200',1593825305);
INSERT INTO `scheduler_log` VALUES (618,2,'200',1593825817);
INSERT INTO `scheduler_log` VALUES (619,2,'200',1593826235);
INSERT INTO `scheduler_log` VALUES (620,2,'200',1593826265);
INSERT INTO `scheduler_log` VALUES (621,2,'200',1593827830);
INSERT INTO `scheduler_log` VALUES (622,1,'200',1593828194);
INSERT INTO `scheduler_log` VALUES (623,2,'200',1593828194);
INSERT INTO `scheduler_log` VALUES (624,3,'200',1593828194);
INSERT INTO `scheduler_log` VALUES (625,4,'200',1593828194);
INSERT INTO `scheduler_log` VALUES (626,5,'200',1593828194);
INSERT INTO `scheduler_log` VALUES (627,2,'200',1593830277);
INSERT INTO `scheduler_log` VALUES (628,1,'200',1593833369);
INSERT INTO `scheduler_log` VALUES (629,2,'200',1593833369);
INSERT INTO `scheduler_log` VALUES (630,3,'200',1593833369);
INSERT INTO `scheduler_log` VALUES (631,4,'200',1593833369);
INSERT INTO `scheduler_log` VALUES (632,5,'200',1593833369);
INSERT INTO `scheduler_log` VALUES (633,2,'200',1593833423);
INSERT INTO `scheduler_log` VALUES (634,2,'200',1593833463);
INSERT INTO `scheduler_log` VALUES (635,2,'200',1593833990);
INSERT INTO `scheduler_log` VALUES (636,2,'200',1593834000);
INSERT INTO `scheduler_log` VALUES (637,2,'200',1593834001);
INSERT INTO `scheduler_log` VALUES (638,2,'200',1593834280);
INSERT INTO `scheduler_log` VALUES (639,2,'200',1593834301);
INSERT INTO `scheduler_log` VALUES (640,2,'200',1593834385);
INSERT INTO `scheduler_log` VALUES (641,2,'200',1593834451);
INSERT INTO `scheduler_log` VALUES (642,2,'200',1593834521);
INSERT INTO `scheduler_log` VALUES (643,2,'200',1593834705);
INSERT INTO `scheduler_log` VALUES (644,2,'200',1593834730);
INSERT INTO `scheduler_log` VALUES (645,1,'200',1593835257);
INSERT INTO `scheduler_log` VALUES (646,2,'200',1593835257);
INSERT INTO `scheduler_log` VALUES (647,3,'200',1593835257);
INSERT INTO `scheduler_log` VALUES (648,4,'200',1593835257);
INSERT INTO `scheduler_log` VALUES (649,5,'200',1593835257);
INSERT INTO `scheduler_log` VALUES (650,2,'200',1593835262);
INSERT INTO `scheduler_log` VALUES (651,2,'200',1593835338);
INSERT INTO `scheduler_log` VALUES (652,2,'200',1593835384);
INSERT INTO `scheduler_log` VALUES (653,2,'200',1593835475);
INSERT INTO `scheduler_log` VALUES (654,2,'200',1593835626);
INSERT INTO `scheduler_log` VALUES (655,2,'200',1593835744);
INSERT INTO `scheduler_log` VALUES (656,2,'200',1593835848);
INSERT INTO `scheduler_log` VALUES (657,2,'200',1593835943);
INSERT INTO `scheduler_log` VALUES (658,2,'200',1593836061);
INSERT INTO `scheduler_log` VALUES (659,2,'200',1593836100);
INSERT INTO `scheduler_log` VALUES (660,2,'200',1593836103);
INSERT INTO `scheduler_log` VALUES (661,2,'200',1593836342);
INSERT INTO `scheduler_log` VALUES (662,2,'200',1593836405);
INSERT INTO `scheduler_log` VALUES (663,2,'200',1593836467);
INSERT INTO `scheduler_log` VALUES (664,2,'200',1593836627);
INSERT INTO `scheduler_log` VALUES (665,2,'200',1593836641);
INSERT INTO `scheduler_log` VALUES (666,2,'200',1593836707);
INSERT INTO `scheduler_log` VALUES (667,2,'200',1593836773);
INSERT INTO `scheduler_log` VALUES (668,2,'200',1593836967);
INSERT INTO `scheduler_log` VALUES (669,2,'200',1593837002);
INSERT INTO `scheduler_log` VALUES (670,2,'200',1593837070);
INSERT INTO `scheduler_log` VALUES (671,2,'200',1593837135);
INSERT INTO `scheduler_log` VALUES (672,2,'200',1593837506);
INSERT INTO `scheduler_log` VALUES (673,2,'200',1593838029);
INSERT INTO `scheduler_log` VALUES (674,2,'200',1593838171);
INSERT INTO `scheduler_log` VALUES (675,2,'200',1593838229);
INSERT INTO `scheduler_log` VALUES (676,2,'200',1593838294);
INSERT INTO `scheduler_log` VALUES (677,2,'200',1593838324);
INSERT INTO `scheduler_log` VALUES (678,2,'200',1593838580);
INSERT INTO `scheduler_log` VALUES (679,2,'200',1593838623);
INSERT INTO `scheduler_log` VALUES (680,1,'200',1593840039);
INSERT INTO `scheduler_log` VALUES (681,2,'200',1593840039);
INSERT INTO `scheduler_log` VALUES (682,3,'200',1593840039);
INSERT INTO `scheduler_log` VALUES (683,4,'200',1593840039);
INSERT INTO `scheduler_log` VALUES (684,5,'200',1593840039);
INSERT INTO `scheduler_log` VALUES (685,2,'200',1593840065);
INSERT INTO `scheduler_log` VALUES (686,2,'200',1593840135);
INSERT INTO `scheduler_log` VALUES (687,2,'200',1593840335);
INSERT INTO `scheduler_log` VALUES (688,2,'200',1593840369);
INSERT INTO `scheduler_log` VALUES (689,2,'200',1593840860);
INSERT INTO `scheduler_log` VALUES (690,2,'200',1593840903);
INSERT INTO `scheduler_log` VALUES (691,1,'200',1593925959);
INSERT INTO `scheduler_log` VALUES (692,2,'200',1593925959);
INSERT INTO `scheduler_log` VALUES (693,3,'200',1593925959);
INSERT INTO `scheduler_log` VALUES (694,4,'200',1593925959);
INSERT INTO `scheduler_log` VALUES (695,5,'200',1593925959);
INSERT INTO `scheduler_log` VALUES (696,2,'200',1593925988);
INSERT INTO `scheduler_log` VALUES (697,2,'200',1593926044);
INSERT INTO `scheduler_log` VALUES (698,2,'200',1593926210);
INSERT INTO `scheduler_log` VALUES (699,2,'200',1593926236);
INSERT INTO `scheduler_log` VALUES (700,2,'200',1593926283);
INSERT INTO `scheduler_log` VALUES (701,2,'200',1593926342);
INSERT INTO `scheduler_log` VALUES (702,2,'200',1593927411);
INSERT INTO `scheduler_log` VALUES (703,2,'200',1593927423);
INSERT INTO `scheduler_log` VALUES (704,2,'200',1593928274);
INSERT INTO `scheduler_log` VALUES (705,2,'200',1593928320);
INSERT INTO `scheduler_log` VALUES (706,2,'200',1593928324);
INSERT INTO `scheduler_log` VALUES (707,2,'200',1593928382);
INSERT INTO `scheduler_log` VALUES (708,1,'200',1593931517);
INSERT INTO `scheduler_log` VALUES (709,2,'200',1593931517);
INSERT INTO `scheduler_log` VALUES (710,3,'200',1593931517);
INSERT INTO `scheduler_log` VALUES (711,4,'200',1593931517);
INSERT INTO `scheduler_log` VALUES (712,5,'200',1593931517);
INSERT INTO `scheduler_log` VALUES (713,2,'200',1593931578);
INSERT INTO `scheduler_log` VALUES (714,2,'200',1593931694);
INSERT INTO `scheduler_log` VALUES (715,2,'200',1593931745);
INSERT INTO `scheduler_log` VALUES (716,2,'200',1593931812);
INSERT INTO `scheduler_log` VALUES (717,2,'200',1593931869);
INSERT INTO `scheduler_log` VALUES (718,2,'200',1593932121);
INSERT INTO `scheduler_log` VALUES (719,2,'200',1593932197);
INSERT INTO `scheduler_log` VALUES (720,2,'200',1593932247);
INSERT INTO `scheduler_log` VALUES (721,1,'200',1593932555);
INSERT INTO `scheduler_log` VALUES (722,2,'200',1593932555);
INSERT INTO `scheduler_log` VALUES (723,3,'200',1593932555);
INSERT INTO `scheduler_log` VALUES (724,4,'200',1593932555);
INSERT INTO `scheduler_log` VALUES (725,5,'200',1593932555);
INSERT INTO `scheduler_log` VALUES (726,2,'200',1593932716);
INSERT INTO `scheduler_log` VALUES (727,2,'200',1593932841);
INSERT INTO `scheduler_log` VALUES (728,2,'200',1593932920);
INSERT INTO `scheduler_log` VALUES (729,2,'200',1593933013);
INSERT INTO `scheduler_log` VALUES (730,2,'200',1593933698);
INSERT INTO `scheduler_log` VALUES (731,2,'200',1593933789);
INSERT INTO `scheduler_log` VALUES (732,2,'200',1593933941);
INSERT INTO `scheduler_log` VALUES (733,2,'200',1593934009);
INSERT INTO `scheduler_log` VALUES (734,2,'200',1593934040);
INSERT INTO `scheduler_log` VALUES (735,2,'200',1593934080);
INSERT INTO `scheduler_log` VALUES (736,2,'200',1593934090);
INSERT INTO `scheduler_log` VALUES (737,2,'200',1593934278);
INSERT INTO `scheduler_log` VALUES (738,2,'200',1593934320);
INSERT INTO `scheduler_log` VALUES (739,2,'200',1593934528);
INSERT INTO `scheduler_log` VALUES (740,2,'200',1593934646);
INSERT INTO `scheduler_log` VALUES (741,2,'200',1593934780);
INSERT INTO `scheduler_log` VALUES (742,2,'200',1593934848);
INSERT INTO `scheduler_log` VALUES (743,2,'200',1593934954);
INSERT INTO `scheduler_log` VALUES (744,2,'200',1593934982);
INSERT INTO `scheduler_log` VALUES (745,2,'200',1593935172);
INSERT INTO `scheduler_log` VALUES (746,1,'200',1593936036);
INSERT INTO `scheduler_log` VALUES (747,2,'200',1593936036);
INSERT INTO `scheduler_log` VALUES (748,3,'200',1593936036);
INSERT INTO `scheduler_log` VALUES (749,4,'200',1593936036);
INSERT INTO `scheduler_log` VALUES (750,5,'200',1593936036);
INSERT INTO `scheduler_log` VALUES (751,2,'200',1593936101);
INSERT INTO `scheduler_log` VALUES (752,2,'200',1593936145);
INSERT INTO `scheduler_log` VALUES (753,2,'200',1593936233);
INSERT INTO `scheduler_log` VALUES (754,2,'200',1593936241);
INSERT INTO `scheduler_log` VALUES (755,2,'200',1593936564);
INSERT INTO `scheduler_log` VALUES (756,2,'200',1593936817);
INSERT INTO `scheduler_log` VALUES (757,2,'200',1593936841);
INSERT INTO `scheduler_log` VALUES (758,2,'200',1593936903);
INSERT INTO `scheduler_log` VALUES (759,2,'200',1593937376);
INSERT INTO `scheduler_log` VALUES (760,2,'200',1593937382);
INSERT INTO `scheduler_log` VALUES (761,2,'200',1593937440);
INSERT INTO `scheduler_log` VALUES (762,2,'200',1593938303);
INSERT INTO `scheduler_log` VALUES (763,2,'200',1593938379);
INSERT INTO `scheduler_log` VALUES (764,2,'200',1593938411);
INSERT INTO `scheduler_log` VALUES (765,2,'200',1593938481);
INSERT INTO `scheduler_log` VALUES (766,2,'200',1593938527);
INSERT INTO `scheduler_log` VALUES (767,2,'200',1593939219);
INSERT INTO `scheduler_log` VALUES (768,2,'200',1593939242);
INSERT INTO `scheduler_log` VALUES (769,1,'200',1593939601);
INSERT INTO `scheduler_log` VALUES (770,2,'200',1593939601);
INSERT INTO `scheduler_log` VALUES (771,3,'200',1593939601);
INSERT INTO `scheduler_log` VALUES (772,4,'200',1593939601);
INSERT INTO `scheduler_log` VALUES (773,5,'200',1593939601);
INSERT INTO `scheduler_log` VALUES (774,2,'200',1593942705);
INSERT INTO `scheduler_log` VALUES (775,2,'200',1593942793);
INSERT INTO `scheduler_log` VALUES (776,2,'200',1593942896);
INSERT INTO `scheduler_log` VALUES (777,2,'200',1593942941);
INSERT INTO `scheduler_log` VALUES (778,2,'200',1593942963);
INSERT INTO `scheduler_log` VALUES (779,2,'200',1593943029);
INSERT INTO `scheduler_log` VALUES (780,2,'200',1593943085);
INSERT INTO `scheduler_log` VALUES (781,2,'200',1593943189);
INSERT INTO `scheduler_log` VALUES (782,1,'200',1593943236);
INSERT INTO `scheduler_log` VALUES (783,2,'200',1593943236);
INSERT INTO `scheduler_log` VALUES (784,3,'200',1593943236);
INSERT INTO `scheduler_log` VALUES (785,4,'200',1593943236);
INSERT INTO `scheduler_log` VALUES (786,5,'200',1593943236);
INSERT INTO `scheduler_log` VALUES (787,2,'200',1593944040);
INSERT INTO `scheduler_log` VALUES (788,2,'200',1593944042);
INSERT INTO `scheduler_log` VALUES (789,2,'200',1593944133);
INSERT INTO `scheduler_log` VALUES (790,2,'200',1593944229);
INSERT INTO `scheduler_log` VALUES (791,2,'200',1593944489);
INSERT INTO `scheduler_log` VALUES (792,2,'200',1593944522);
INSERT INTO `scheduler_log` VALUES (793,2,'200',1593944969);
INSERT INTO `scheduler_log` VALUES (794,2,'200',1593948337);
INSERT INTO `scheduler_log` VALUES (795,2,'200',1593948369);
INSERT INTO `scheduler_log` VALUES (796,2,'200',1593948444);
INSERT INTO `scheduler_log` VALUES (797,2,'200',1593948483);
INSERT INTO `scheduler_log` VALUES (798,2,'200',1593948541);
INSERT INTO `scheduler_log` VALUES (799,2,'200',1593948619);
INSERT INTO `scheduler_log` VALUES (800,2,'200',1593948875);
INSERT INTO `scheduler_log` VALUES (801,2,'200',1593948904);
INSERT INTO `scheduler_log` VALUES (802,2,'200',1593949190);
INSERT INTO `scheduler_log` VALUES (803,2,'200',1593949203);
INSERT INTO `scheduler_log` VALUES (804,2,'200',1593949262);
INSERT INTO `scheduler_log` VALUES (805,2,'200',1593949328);
INSERT INTO `scheduler_log` VALUES (806,2,'200',1593949723);
INSERT INTO `scheduler_log` VALUES (807,2,'200',1593949748);
INSERT INTO `scheduler_log` VALUES (808,1,'200',1593950404);
INSERT INTO `scheduler_log` VALUES (809,2,'200',1593950404);
INSERT INTO `scheduler_log` VALUES (810,3,'200',1593950404);
INSERT INTO `scheduler_log` VALUES (811,4,'200',1593950404);
INSERT INTO `scheduler_log` VALUES (812,5,'200',1593950404);
INSERT INTO `scheduler_log` VALUES (813,2,'200',1593952130);
INSERT INTO `scheduler_log` VALUES (814,1,'200',1593980351);
INSERT INTO `scheduler_log` VALUES (815,2,'200',1593980351);
INSERT INTO `scheduler_log` VALUES (816,3,'200',1593980351);
INSERT INTO `scheduler_log` VALUES (817,4,'200',1593980351);
INSERT INTO `scheduler_log` VALUES (818,5,'200',1593980351);
INSERT INTO `scheduler_log` VALUES (819,2,'200',1593980459);
INSERT INTO `scheduler_log` VALUES (820,2,'200',1593980465);
INSERT INTO `scheduler_log` VALUES (821,2,'200',1593980694);
INSERT INTO `scheduler_log` VALUES (822,2,'200',1593980702);
INSERT INTO `scheduler_log` VALUES (823,2,'200',1593980831);
INSERT INTO `scheduler_log` VALUES (824,2,'200',1593980893);
INSERT INTO `scheduler_log` VALUES (825,2,'200',1593981647);
INSERT INTO `scheduler_log` VALUES (826,2,'200',1593981728);
INSERT INTO `scheduler_log` VALUES (827,2,'200',1593981970);
INSERT INTO `scheduler_log` VALUES (828,2,'200',1593982107);
INSERT INTO `scheduler_log` VALUES (829,2,'200',1593982142);
INSERT INTO `scheduler_log` VALUES (830,1,'200',1593983492);
INSERT INTO `scheduler_log` VALUES (831,2,'200',1593983492);
INSERT INTO `scheduler_log` VALUES (832,3,'200',1593983492);
INSERT INTO `scheduler_log` VALUES (833,4,'200',1593983492);
INSERT INTO `scheduler_log` VALUES (834,5,'200',1593983492);
INSERT INTO `scheduler_log` VALUES (835,2,'200',1593983522);
INSERT INTO `scheduler_log` VALUES (836,2,'200',1593983598);
INSERT INTO `scheduler_log` VALUES (837,2,'200',1593983651);
INSERT INTO `scheduler_log` VALUES (838,2,'200',1593984466);
INSERT INTO `scheduler_log` VALUES (839,2,'200',1593984495);
INSERT INTO `scheduler_log` VALUES (840,2,'200',1593984548);
INSERT INTO `scheduler_log` VALUES (841,2,'200',1593984719);
INSERT INTO `scheduler_log` VALUES (842,2,'200',1593984809);
INSERT INTO `scheduler_log` VALUES (843,2,'200',1593985510);
INSERT INTO `scheduler_log` VALUES (844,2,'200',1593985615);
INSERT INTO `scheduler_log` VALUES (845,2,'200',1593985625);
INSERT INTO `scheduler_log` VALUES (846,2,'200',1593985690);
INSERT INTO `scheduler_log` VALUES (847,2,'200',1593986304);
INSERT INTO `scheduler_log` VALUES (848,2,'200',1593986370);
INSERT INTO `scheduler_log` VALUES (849,1,'200',1593986674);
INSERT INTO `scheduler_log` VALUES (850,2,'200',1593986674);
INSERT INTO `scheduler_log` VALUES (851,3,'200',1593986674);
INSERT INTO `scheduler_log` VALUES (852,4,'200',1593986674);
INSERT INTO `scheduler_log` VALUES (853,5,'200',1593986674);
INSERT INTO `scheduler_log` VALUES (854,2,'200',1593986704);
INSERT INTO `scheduler_log` VALUES (855,2,'200',1593987188);
INSERT INTO `scheduler_log` VALUES (856,2,'200',1593987288);
INSERT INTO `scheduler_log` VALUES (857,2,'200',1593987303);
INSERT INTO `scheduler_log` VALUES (858,2,'200',1593987369);
INSERT INTO `scheduler_log` VALUES (859,2,'200',1593987424);
INSERT INTO `scheduler_log` VALUES (860,2,'200',1593987760);
INSERT INTO `scheduler_log` VALUES (861,2,'200',1593988524);
INSERT INTO `scheduler_log` VALUES (862,2,'200',1593988573);
INSERT INTO `scheduler_log` VALUES (863,2,'200',1593989285);
INSERT INTO `scheduler_log` VALUES (864,2,'200',1593989342);
INSERT INTO `scheduler_log` VALUES (865,2,'200',1593989428);
INSERT INTO `scheduler_log` VALUES (866,2,'200',1593989465);
INSERT INTO `scheduler_log` VALUES (867,1,'200',1593992293);
INSERT INTO `scheduler_log` VALUES (868,2,'200',1593992293);
INSERT INTO `scheduler_log` VALUES (869,3,'200',1593992293);
INSERT INTO `scheduler_log` VALUES (870,4,'200',1593992293);
INSERT INTO `scheduler_log` VALUES (871,5,'200',1593992293);
INSERT INTO `scheduler_log` VALUES (872,1,'200',1593996552);
INSERT INTO `scheduler_log` VALUES (873,2,'200',1593996552);
INSERT INTO `scheduler_log` VALUES (874,3,'200',1593996552);
INSERT INTO `scheduler_log` VALUES (875,4,'200',1593996552);
INSERT INTO `scheduler_log` VALUES (876,5,'200',1593996552);
INSERT INTO `scheduler_log` VALUES (877,1,'200',1594077922);
INSERT INTO `scheduler_log` VALUES (878,2,'200',1594077922);
INSERT INTO `scheduler_log` VALUES (879,3,'200',1594077922);
INSERT INTO `scheduler_log` VALUES (880,4,'200',1594077922);
INSERT INTO `scheduler_log` VALUES (881,5,'200',1594077922);
INSERT INTO `scheduler_log` VALUES (882,2,'200',1594077960);
INSERT INTO `scheduler_log` VALUES (883,2,'200',1594077962);
INSERT INTO `scheduler_log` VALUES (884,2,'200',1594078119);
INSERT INTO `scheduler_log` VALUES (885,2,'200',1594078149);
INSERT INTO `scheduler_log` VALUES (886,2,'200',1594078229);
INSERT INTO `scheduler_log` VALUES (887,2,'200',1594078261);
INSERT INTO `scheduler_log` VALUES (888,2,'200',1594078342);
INSERT INTO `scheduler_log` VALUES (889,2,'200',1594078395);
INSERT INTO `scheduler_log` VALUES (890,2,'200',1594078475);
INSERT INTO `scheduler_log` VALUES (891,2,'200',1594078536);
INSERT INTO `scheduler_log` VALUES (892,2,'200',1594078584);
INSERT INTO `scheduler_log` VALUES (893,2,'200',1594078639);
INSERT INTO `scheduler_log` VALUES (894,2,'200',1594078685);
INSERT INTO `scheduler_log` VALUES (895,2,'200',1594078747);
INSERT INTO `scheduler_log` VALUES (896,1,'200',1594087882);
INSERT INTO `scheduler_log` VALUES (897,2,'200',1594087882);
INSERT INTO `scheduler_log` VALUES (898,3,'200',1594087882);
INSERT INTO `scheduler_log` VALUES (899,4,'200',1594087882);
INSERT INTO `scheduler_log` VALUES (900,5,'200',1594087882);
INSERT INTO `scheduler_log` VALUES (901,2,'200',1594088105);
INSERT INTO `scheduler_log` VALUES (902,2,'200',1594088218);
INSERT INTO `scheduler_log` VALUES (903,2,'200',1594088235);
INSERT INTO `scheduler_log` VALUES (904,1,'200',1594236607);
INSERT INTO `scheduler_log` VALUES (905,2,'200',1594236607);
INSERT INTO `scheduler_log` VALUES (906,3,'200',1594236607);
INSERT INTO `scheduler_log` VALUES (907,4,'200',1594236607);
INSERT INTO `scheduler_log` VALUES (908,5,'200',1594236607);
INSERT INTO `scheduler_log` VALUES (909,1,'200',1594238805);
INSERT INTO `scheduler_log` VALUES (910,2,'200',1594238805);
INSERT INTO `scheduler_log` VALUES (911,3,'200',1594238805);
INSERT INTO `scheduler_log` VALUES (912,4,'200',1594238805);
INSERT INTO `scheduler_log` VALUES (913,5,'200',1594238805);
INSERT INTO `scheduler_log` VALUES (914,2,'200',1594238860);
INSERT INTO `scheduler_log` VALUES (915,2,'200',1594239248);
INSERT INTO `scheduler_log` VALUES (916,2,'200',1594239331);
INSERT INTO `scheduler_log` VALUES (917,1,'200',1594264366);
INSERT INTO `scheduler_log` VALUES (918,2,'200',1594264366);
INSERT INTO `scheduler_log` VALUES (919,3,'200',1594264366);
INSERT INTO `scheduler_log` VALUES (920,4,'200',1594264366);
INSERT INTO `scheduler_log` VALUES (921,5,'200',1594264366);
INSERT INTO `scheduler_log` VALUES (922,2,'200',1594264386);
INSERT INTO `scheduler_log` VALUES (923,2,'200',1594264839);
INSERT INTO `scheduler_log` VALUES (924,2,'200',1594264894);
INSERT INTO `scheduler_log` VALUES (925,2,'200',1594264934);
INSERT INTO `scheduler_log` VALUES (926,2,'200',1594265074);
INSERT INTO `scheduler_log` VALUES (927,2,'200',1594265441);
INSERT INTO `scheduler_log` VALUES (928,2,'200',1594265478);
INSERT INTO `scheduler_log` VALUES (929,1,'200',1594267851);
INSERT INTO `scheduler_log` VALUES (930,2,'200',1594267851);
INSERT INTO `scheduler_log` VALUES (931,3,'200',1594267851);
INSERT INTO `scheduler_log` VALUES (932,4,'200',1594267851);
INSERT INTO `scheduler_log` VALUES (933,5,'200',1594267851);
INSERT INTO `scheduler_log` VALUES (934,2,'200',1594267927);
INSERT INTO `scheduler_log` VALUES (935,2,'200',1594268179);
INSERT INTO `scheduler_log` VALUES (936,2,'200',1594268230);
INSERT INTO `scheduler_log` VALUES (937,2,'200',1594268355);
INSERT INTO `scheduler_log` VALUES (938,2,'200',1594268579);
INSERT INTO `scheduler_log` VALUES (939,2,'200',1594268584);
INSERT INTO `scheduler_log` VALUES (940,1,'200',1594352605);
INSERT INTO `scheduler_log` VALUES (941,2,'200',1594352605);
INSERT INTO `scheduler_log` VALUES (942,3,'200',1594352605);
INSERT INTO `scheduler_log` VALUES (943,4,'200',1594352605);
INSERT INTO `scheduler_log` VALUES (944,5,'200',1594352605);
INSERT INTO `scheduler_log` VALUES (945,2,'200',1594352669);
INSERT INTO `scheduler_log` VALUES (946,1,'200',1594353657);
INSERT INTO `scheduler_log` VALUES (947,2,'200',1594353657);
INSERT INTO `scheduler_log` VALUES (948,3,'200',1594353657);
INSERT INTO `scheduler_log` VALUES (949,4,'200',1594353657);
INSERT INTO `scheduler_log` VALUES (950,5,'200',1594353657);
INSERT INTO `scheduler_log` VALUES (951,1,'200',1594510854);
INSERT INTO `scheduler_log` VALUES (952,2,'200',1594510854);
INSERT INTO `scheduler_log` VALUES (953,3,'200',1594510854);
INSERT INTO `scheduler_log` VALUES (954,4,'200',1594510854);
INSERT INTO `scheduler_log` VALUES (955,5,'200',1594510854);
INSERT INTO `scheduler_log` VALUES (956,2,'200',1594510871);
INSERT INTO `scheduler_log` VALUES (957,2,'200',1594510921);
INSERT INTO `scheduler_log` VALUES (958,2,'200',1594511049);
INSERT INTO `scheduler_log` VALUES (959,2,'200',1594511403);
INSERT INTO `scheduler_log` VALUES (960,2,'200',1594511472);
INSERT INTO `scheduler_log` VALUES (961,2,'200',1594511669);
INSERT INTO `scheduler_log` VALUES (962,2,'200',1594511734);
INSERT INTO `scheduler_log` VALUES (963,6,'200',1594511734);
INSERT INTO `scheduler_log` VALUES (964,2,'200',1594511762);
INSERT INTO `scheduler_log` VALUES (965,2,'200',1594511867);
INSERT INTO `scheduler_log` VALUES (966,1,'200',1594512001);
INSERT INTO `scheduler_log` VALUES (967,2,'200',1594512001);
INSERT INTO `scheduler_log` VALUES (968,3,'200',1594512001);
INSERT INTO `scheduler_log` VALUES (969,4,'200',1594512001);
INSERT INTO `scheduler_log` VALUES (970,5,'200',1594512001);
INSERT INTO `scheduler_log` VALUES (971,2,'200',1594512081);
INSERT INTO `scheduler_log` VALUES (972,2,'200',1594512358);
INSERT INTO `scheduler_log` VALUES (973,2,'200',1594512364);
INSERT INTO `scheduler_log` VALUES (974,2,'200',1594512469);
INSERT INTO `scheduler_log` VALUES (975,2,'200',1594512520);
INSERT INTO `scheduler_log` VALUES (976,2,'200',1594512627);
INSERT INTO `scheduler_log` VALUES (977,2,'200',1594512797);
INSERT INTO `scheduler_log` VALUES (978,2,'200',1594512841);
INSERT INTO `scheduler_log` VALUES (979,2,'200',1594512911);
INSERT INTO `scheduler_log` VALUES (980,2,'200',1594512976);
INSERT INTO `scheduler_log` VALUES (981,2,'200',1594513085);
INSERT INTO `scheduler_log` VALUES (982,2,'200',1594513715);
INSERT INTO `scheduler_log` VALUES (983,2,'200',1594513745);
INSERT INTO `scheduler_log` VALUES (984,1,'200',1594515882);
INSERT INTO `scheduler_log` VALUES (985,2,'200',1594515882);
INSERT INTO `scheduler_log` VALUES (986,3,'200',1594515882);
INSERT INTO `scheduler_log` VALUES (987,4,'200',1594515882);
INSERT INTO `scheduler_log` VALUES (988,5,'200',1594515882);
INSERT INTO `scheduler_log` VALUES (989,2,'200',1594515904);
INSERT INTO `scheduler_log` VALUES (990,2,'200',1594515982);
INSERT INTO `scheduler_log` VALUES (991,2,'200',1594516083);
INSERT INTO `scheduler_log` VALUES (992,2,'200',1594516197);
INSERT INTO `scheduler_log` VALUES (993,2,'200',1594516209);
INSERT INTO `scheduler_log` VALUES (994,2,'200',1594516406);
INSERT INTO `scheduler_log` VALUES (995,2,'200',1594516579);
INSERT INTO `scheduler_log` VALUES (996,2,'200',1594516649);
INSERT INTO `scheduler_log` VALUES (997,2,'200',1594516700);
INSERT INTO `scheduler_log` VALUES (998,2,'200',1594516745);
INSERT INTO `scheduler_log` VALUES (999,2,'200',1594516810);
INSERT INTO `scheduler_log` VALUES (1000,2,'200',1594516863);
INSERT INTO `scheduler_log` VALUES (1001,2,'200',1594516961);
INSERT INTO `scheduler_log` VALUES (1002,2,'200',1594517692);
INSERT INTO `scheduler_log` VALUES (1003,2,'200',1594517710);
INSERT INTO `scheduler_log` VALUES (1004,2,'200',1594518296);
INSERT INTO `scheduler_log` VALUES (1005,2,'200',1594518579);
INSERT INTO `scheduler_log` VALUES (1006,2,'200',1594518665);
INSERT INTO `scheduler_log` VALUES (1007,2,'200',1594518855);
INSERT INTO `scheduler_log` VALUES (1008,2,'200',1594518912);
INSERT INTO `scheduler_log` VALUES (1009,1,'200',1594519312);
INSERT INTO `scheduler_log` VALUES (1010,2,'200',1594519312);
INSERT INTO `scheduler_log` VALUES (1011,3,'200',1594519312);
INSERT INTO `scheduler_log` VALUES (1012,4,'200',1594519312);
INSERT INTO `scheduler_log` VALUES (1013,5,'200',1594519312);
INSERT INTO `scheduler_log` VALUES (1014,2,'200',1594519331);
INSERT INTO `scheduler_log` VALUES (1015,2,'200',1594519392);
INSERT INTO `scheduler_log` VALUES (1016,2,'200',1594519455);
INSERT INTO `scheduler_log` VALUES (1017,2,'200',1594519511);
INSERT INTO `scheduler_log` VALUES (1018,2,'200',1594519589);
INSERT INTO `scheduler_log` VALUES (1019,2,'200',1594519667);
INSERT INTO `scheduler_log` VALUES (1020,2,'200',1594519685);
INSERT INTO `scheduler_log` VALUES (1021,2,'200',1594520138);
INSERT INTO `scheduler_log` VALUES (1022,2,'200',1594520195);
INSERT INTO `scheduler_log` VALUES (1023,2,'200',1594520229);
INSERT INTO `scheduler_log` VALUES (1024,1,'200',1594686760);
INSERT INTO `scheduler_log` VALUES (1025,2,'200',1594686760);
INSERT INTO `scheduler_log` VALUES (1026,3,'200',1594686760);
INSERT INTO `scheduler_log` VALUES (1027,4,'200',1594686760);
INSERT INTO `scheduler_log` VALUES (1028,5,'200',1594686760);
INSERT INTO `scheduler_log` VALUES (1029,2,'200',1594686792);
INSERT INTO `scheduler_log` VALUES (1030,1,'200',1594698049);
INSERT INTO `scheduler_log` VALUES (1031,2,'200',1594698049);
INSERT INTO `scheduler_log` VALUES (1032,3,'200',1594698049);
INSERT INTO `scheduler_log` VALUES (1033,4,'200',1594698049);
INSERT INTO `scheduler_log` VALUES (1034,5,'200',1594698049);
INSERT INTO `scheduler_log` VALUES (1035,2,'200',1594698064);
INSERT INTO `scheduler_log` VALUES (1036,2,'200',1594698348);
INSERT INTO `scheduler_log` VALUES (1037,1,'200',1594832276);
INSERT INTO `scheduler_log` VALUES (1038,2,'200',1594832276);
INSERT INTO `scheduler_log` VALUES (1039,3,'200',1594832276);
INSERT INTO `scheduler_log` VALUES (1040,4,'200',1594832276);
INSERT INTO `scheduler_log` VALUES (1041,5,'200',1594832276);
INSERT INTO `scheduler_log` VALUES (1042,2,'200',1594832357);
INSERT INTO `scheduler_log` VALUES (1043,1,'200',1594838379);
INSERT INTO `scheduler_log` VALUES (1044,2,'200',1594838379);
INSERT INTO `scheduler_log` VALUES (1045,3,'200',1594838379);
INSERT INTO `scheduler_log` VALUES (1046,4,'200',1594838379);
INSERT INTO `scheduler_log` VALUES (1047,5,'200',1594838379);
INSERT INTO `scheduler_log` VALUES (1048,2,'200',1594838505);
INSERT INTO `scheduler_log` VALUES (1049,2,'200',1594838549);
INSERT INTO `scheduler_log` VALUES (1050,2,'200',1594838583);
INSERT INTO `scheduler_log` VALUES (1051,2,'200',1594838838);
INSERT INTO `scheduler_log` VALUES (1052,2,'200',1594839221);
INSERT INTO `scheduler_log` VALUES (1053,2,'200',1594839245);
INSERT INTO `scheduler_log` VALUES (1054,1,'200',1594865612);
INSERT INTO `scheduler_log` VALUES (1055,2,'200',1594865612);
INSERT INTO `scheduler_log` VALUES (1056,3,'200',1594865612);
INSERT INTO `scheduler_log` VALUES (1057,4,'200',1594865612);
INSERT INTO `scheduler_log` VALUES (1058,5,'200',1594865612);
INSERT INTO `scheduler_log` VALUES (1059,2,'200',1594865986);
INSERT INTO `scheduler_log` VALUES (1060,2,'200',1594866047);
INSERT INTO `scheduler_log` VALUES (1061,2,'200',1594866061);
INSERT INTO `scheduler_log` VALUES (1062,2,'200',1594866254);
INSERT INTO `scheduler_log` VALUES (1063,2,'200',1594866844);
INSERT INTO `scheduler_log` VALUES (1064,2,'200',1594867008);
INSERT INTO `scheduler_log` VALUES (1065,2,'200',1594867380);
INSERT INTO `scheduler_log` VALUES (1066,2,'200',1594867447);
INSERT INTO `scheduler_log` VALUES (1067,2,'200',1594867544);
INSERT INTO `scheduler_log` VALUES (1068,2,'200',1594867679);
INSERT INTO `scheduler_log` VALUES (1069,2,'200',1594868209);
INSERT INTO `scheduler_log` VALUES (1070,2,'200',1594868294);
INSERT INTO `scheduler_log` VALUES (1071,2,'200',1594868393);
INSERT INTO `scheduler_log` VALUES (1072,1,'200',1594868408);
INSERT INTO `scheduler_log` VALUES (1073,2,'200',1594868408);
INSERT INTO `scheduler_log` VALUES (1074,3,'200',1594868409);
INSERT INTO `scheduler_log` VALUES (1075,4,'200',1594868409);
INSERT INTO `scheduler_log` VALUES (1076,5,'200',1594868409);
INSERT INTO `scheduler_log` VALUES (1077,2,'200',1594868580);
INSERT INTO `scheduler_log` VALUES (1078,2,'200',1594868585);
INSERT INTO `scheduler_log` VALUES (1079,2,'200',1594868769);
INSERT INTO `scheduler_log` VALUES (1080,2,'200',1594868849);
INSERT INTO `scheduler_log` VALUES (1081,2,'200',1594869323);
INSERT INTO `scheduler_log` VALUES (1082,2,'200',1594869364);
INSERT INTO `scheduler_log` VALUES (1083,2,'200',1594869434);
INSERT INTO `scheduler_log` VALUES (1084,2,'200',1594869481);
INSERT INTO `scheduler_log` VALUES (1085,2,'200',1594869605);
INSERT INTO `scheduler_log` VALUES (1086,2,'200',1594869698);
INSERT INTO `scheduler_log` VALUES (1087,2,'200',1594869907);
INSERT INTO `scheduler_log` VALUES (1088,2,'200',1594869977);
INSERT INTO `scheduler_log` VALUES (1089,2,'200',1594870368);
INSERT INTO `scheduler_log` VALUES (1090,2,'200',1594870698);
INSERT INTO `scheduler_log` VALUES (1091,2,'200',1594870945);
INSERT INTO `scheduler_log` VALUES (1092,2,'200',1594871081);
INSERT INTO `scheduler_log` VALUES (1093,2,'200',1594871113);
INSERT INTO `scheduler_log` VALUES (1094,2,'200',1594871181);
INSERT INTO `scheduler_log` VALUES (1095,2,'200',1594871262);
INSERT INTO `scheduler_log` VALUES (1096,2,'200',1594871296);
INSERT INTO `scheduler_log` VALUES (1097,1,'200',1594872077);
INSERT INTO `scheduler_log` VALUES (1098,2,'200',1594872077);
INSERT INTO `scheduler_log` VALUES (1099,3,'200',1594872078);
INSERT INTO `scheduler_log` VALUES (1100,4,'200',1594872078);
INSERT INTO `scheduler_log` VALUES (1101,5,'200',1594872078);
INSERT INTO `scheduler_log` VALUES (1102,2,'200',1594872285);
INSERT INTO `scheduler_log` VALUES (1103,2,'200',1594872727);
INSERT INTO `scheduler_log` VALUES (1104,2,'200',1594872821);
INSERT INTO `scheduler_log` VALUES (1105,2,'200',1594873054);
INSERT INTO `scheduler_log` VALUES (1106,2,'200',1594873145);
INSERT INTO `scheduler_log` VALUES (1107,2,'200',1594873224);
INSERT INTO `scheduler_log` VALUES (1108,2,'200',1594873260);
INSERT INTO `scheduler_log` VALUES (1109,2,'200',1594874413);
INSERT INTO `scheduler_log` VALUES (1110,2,'200',1594874644);
INSERT INTO `scheduler_log` VALUES (1111,2,'200',1594875211);
INSERT INTO `scheduler_log` VALUES (1112,2,'200',1594875260);
INSERT INTO `scheduler_log` VALUES (1113,1,'200',1594881518);
INSERT INTO `scheduler_log` VALUES (1114,2,'200',1594881518);
INSERT INTO `scheduler_log` VALUES (1115,3,'200',1594881519);
INSERT INTO `scheduler_log` VALUES (1116,4,'200',1594881519);
INSERT INTO `scheduler_log` VALUES (1117,5,'200',1594881519);
INSERT INTO `scheduler_log` VALUES (1118,1,'200',1595000471);
INSERT INTO `scheduler_log` VALUES (1119,2,'200',1595000471);
INSERT INTO `scheduler_log` VALUES (1120,3,'200',1595000471);
INSERT INTO `scheduler_log` VALUES (1121,4,'200',1595000471);
INSERT INTO `scheduler_log` VALUES (1122,5,'200',1595000471);
INSERT INTO `scheduler_log` VALUES (1123,1,'200',1595129709);
INSERT INTO `scheduler_log` VALUES (1124,2,'200',1595129709);
INSERT INTO `scheduler_log` VALUES (1125,3,'200',1595129709);
INSERT INTO `scheduler_log` VALUES (1126,4,'200',1595129709);
INSERT INTO `scheduler_log` VALUES (1127,5,'200',1595129709);
INSERT INTO `scheduler_log` VALUES (1128,2,'200',1595129953);
INSERT INTO `scheduler_log` VALUES (1129,2,'200',1595130003);
INSERT INTO `scheduler_log` VALUES (1130,1,'200',1595131692);
INSERT INTO `scheduler_log` VALUES (1131,2,'200',1595131692);
INSERT INTO `scheduler_log` VALUES (1132,3,'200',1595131693);
INSERT INTO `scheduler_log` VALUES (1133,4,'200',1595131693);
INSERT INTO `scheduler_log` VALUES (1134,5,'200',1595131693);
INSERT INTO `scheduler_log` VALUES (1135,2,'200',1595131748);
INSERT INTO `scheduler_log` VALUES (1136,2,'200',1595131895);
INSERT INTO `scheduler_log` VALUES (1137,2,'200',1595131920);
INSERT INTO `scheduler_log` VALUES (1138,2,'200',1595133161);
INSERT INTO `scheduler_log` VALUES (1139,2,'200',1595133423);
INSERT INTO `scheduler_log` VALUES (1140,2,'200',1595133609);
INSERT INTO `scheduler_log` VALUES (1141,2,'200',1595133670);
INSERT INTO `scheduler_log` VALUES (1142,2,'200',1595133752);
INSERT INTO `scheduler_log` VALUES (1143,2,'200',1595133811);
INSERT INTO `scheduler_log` VALUES (1144,2,'200',1595133864);
INSERT INTO `scheduler_log` VALUES (1145,2,'200',1595133912);
INSERT INTO `scheduler_log` VALUES (1146,2,'200',1595134037);
INSERT INTO `scheduler_log` VALUES (1147,2,'200',1595134105);
INSERT INTO `scheduler_log` VALUES (1148,2,'200',1595134380);
INSERT INTO `scheduler_log` VALUES (1149,2,'200',1595134403);
INSERT INTO `scheduler_log` VALUES (1150,2,'200',1595134471);
INSERT INTO `scheduler_log` VALUES (1151,2,'200',1595134516);
INSERT INTO `scheduler_log` VALUES (1152,2,'200',1595134776);
INSERT INTO `scheduler_log` VALUES (1153,1,'200',1595134826);
INSERT INTO `scheduler_log` VALUES (1154,2,'200',1595134826);
INSERT INTO `scheduler_log` VALUES (1155,3,'200',1595134839);
INSERT INTO `scheduler_log` VALUES (1156,4,'200',1595134839);
INSERT INTO `scheduler_log` VALUES (1157,5,'200',1595134839);
INSERT INTO `scheduler_log` VALUES (1158,3,'200',1595134840);
INSERT INTO `scheduler_log` VALUES (1159,4,'200',1595134840);
INSERT INTO `scheduler_log` VALUES (1160,5,'200',1595134840);
INSERT INTO `scheduler_log` VALUES (1161,2,'200',1595134866);
INSERT INTO `scheduler_log` VALUES (1162,2,'200',1595134931);
INSERT INTO `scheduler_log` VALUES (1163,2,'200',1595135036);
INSERT INTO `scheduler_log` VALUES (1164,2,'200',1595135060);
INSERT INTO `scheduler_log` VALUES (1165,2,'200',1595135134);
INSERT INTO `scheduler_log` VALUES (1166,2,'200',1595135204);
INSERT INTO `scheduler_log` VALUES (1167,2,'200',1595135279);
INSERT INTO `scheduler_log` VALUES (1168,2,'200',1595135282);
INSERT INTO `scheduler_log` VALUES (1169,2,'200',1595135409);
INSERT INTO `scheduler_log` VALUES (1170,2,'200',1595135496);
INSERT INTO `scheduler_log` VALUES (1171,2,'200',1595135766);
INSERT INTO `scheduler_log` VALUES (1172,2,'200',1595136059);
INSERT INTO `scheduler_log` VALUES (1173,2,'200',1595136075);
INSERT INTO `scheduler_log` VALUES (1174,2,'200',1595136153);
INSERT INTO `scheduler_log` VALUES (1175,2,'200',1595136204);
INSERT INTO `scheduler_log` VALUES (1176,2,'200',1595136292);
INSERT INTO `scheduler_log` VALUES (1177,2,'200',1595137742);
INSERT INTO `scheduler_log` VALUES (1178,1,'200',1595143554);
INSERT INTO `scheduler_log` VALUES (1179,2,'200',1595143554);
INSERT INTO `scheduler_log` VALUES (1180,3,'200',1595143569);
INSERT INTO `scheduler_log` VALUES (1181,4,'200',1595143569);
INSERT INTO `scheduler_log` VALUES (1182,5,'200',1595143569);
INSERT INTO `scheduler_log` VALUES (1183,2,'200',1595143573);
INSERT INTO `scheduler_log` VALUES (1184,3,'200',1595143574);
INSERT INTO `scheduler_log` VALUES (1185,4,'200',1595143574);
INSERT INTO `scheduler_log` VALUES (1186,5,'200',1595143574);
INSERT INTO `scheduler_log` VALUES (1187,2,'200',1595145257);
INSERT INTO `scheduler_log` VALUES (1188,2,'200',1595145345);
INSERT INTO `scheduler_log` VALUES (1189,2,'200',1595145452);
INSERT INTO `scheduler_log` VALUES (1190,2,'200',1595145565);
INSERT INTO `scheduler_log` VALUES (1191,1,'200',1595145649);
INSERT INTO `scheduler_log` VALUES (1192,2,'200',1595145649);
INSERT INTO `scheduler_log` VALUES (1193,3,'200',1595145661);
INSERT INTO `scheduler_log` VALUES (1194,4,'200',1595145662);
INSERT INTO `scheduler_log` VALUES (1195,5,'200',1595145662);
INSERT INTO `scheduler_log` VALUES (1196,2,'200',1595145833);
INSERT INTO `scheduler_log` VALUES (1197,1,'200',1595184385);
INSERT INTO `scheduler_log` VALUES (1198,2,'200',1595184385);
INSERT INTO `scheduler_log` VALUES (1199,3,'200',1595184398);
INSERT INTO `scheduler_log` VALUES (1200,4,'200',1595184398);
INSERT INTO `scheduler_log` VALUES (1201,5,'200',1595184398);
INSERT INTO `scheduler_log` VALUES (1202,2,'200',1595184450);
INSERT INTO `scheduler_log` VALUES (1203,2,'200',1595184482);
INSERT INTO `scheduler_log` VALUES (1204,1,'200',1595210912);
INSERT INTO `scheduler_log` VALUES (1205,2,'200',1595210912);
INSERT INTO `scheduler_log` VALUES (1206,3,'200',1595210927);
INSERT INTO `scheduler_log` VALUES (1207,4,'200',1595210927);
INSERT INTO `scheduler_log` VALUES (1208,5,'200',1595210927);
INSERT INTO `scheduler_log` VALUES (1209,2,'200',1595211247);
INSERT INTO `scheduler_log` VALUES (1210,2,'200',1595211307);
INSERT INTO `scheduler_log` VALUES (1211,2,'200',1595211754);
INSERT INTO `scheduler_log` VALUES (1212,2,'200',1595211942);
INSERT INTO `scheduler_log` VALUES (1213,2,'200',1595211975);
INSERT INTO `scheduler_log` VALUES (1214,2,'200',1595212060);
INSERT INTO `scheduler_log` VALUES (1215,2,'200',1595212365);
INSERT INTO `scheduler_log` VALUES (1216,2,'200',1595212400);
INSERT INTO `scheduler_log` VALUES (1217,2,'200',1595212684);
INSERT INTO `scheduler_log` VALUES (1218,2,'200',1595212753);
INSERT INTO `scheduler_log` VALUES (1219,2,'200',1595213011);
INSERT INTO `scheduler_log` VALUES (1220,1,'200',1595216509);
INSERT INTO `scheduler_log` VALUES (1221,2,'200',1595216509);
INSERT INTO `scheduler_log` VALUES (1222,3,'200',1595216522);
INSERT INTO `scheduler_log` VALUES (1223,4,'200',1595216522);
INSERT INTO `scheduler_log` VALUES (1224,5,'200',1595216522);
INSERT INTO `scheduler_log` VALUES (1225,2,'200',1595216535);
INSERT INTO `scheduler_log` VALUES (1226,2,'200',1595217157);
INSERT INTO `scheduler_log` VALUES (1227,2,'200',1595217296);
INSERT INTO `scheduler_log` VALUES (1228,2,'200',1595217387);
INSERT INTO `scheduler_log` VALUES (1229,1,'200',1595255622);
INSERT INTO `scheduler_log` VALUES (1230,2,'200',1595255622);
INSERT INTO `scheduler_log` VALUES (1231,3,'200',1595255635);
INSERT INTO `scheduler_log` VALUES (1232,4,'200',1595255635);
INSERT INTO `scheduler_log` VALUES (1233,5,'200',1595255635);
INSERT INTO `scheduler_log` VALUES (1234,1,'200',1595273257);
INSERT INTO `scheduler_log` VALUES (1235,2,'200',1595273257);
INSERT INTO `scheduler_log` VALUES (1236,3,'200',1595273270);
INSERT INTO `scheduler_log` VALUES (1237,4,'200',1595273270);
INSERT INTO `scheduler_log` VALUES (1238,5,'200',1595273270);
INSERT INTO `scheduler_log` VALUES (1239,2,'200',1595273316);
INSERT INTO `scheduler_log` VALUES (1240,1,'200',1595329257);
INSERT INTO `scheduler_log` VALUES (1241,2,'200',1595329257);
INSERT INTO `scheduler_log` VALUES (1242,3,'200',1595329270);
INSERT INTO `scheduler_log` VALUES (1243,4,'200',1595329270);
INSERT INTO `scheduler_log` VALUES (1244,5,'200',1595329270);
INSERT INTO `scheduler_log` VALUES (1245,1,'200',1595644523);
INSERT INTO `scheduler_log` VALUES (1246,2,'200',1595644523);
INSERT INTO `scheduler_log` VALUES (1247,3,'200',1595644536);
INSERT INTO `scheduler_log` VALUES (1248,4,'200',1595644536);
INSERT INTO `scheduler_log` VALUES (1249,5,'200',1595644536);
INSERT INTO `scheduler_log` VALUES (1250,2,'200',1595644756);
INSERT INTO `scheduler_log` VALUES (1251,2,'200',1595644989);
INSERT INTO `scheduler_log` VALUES (1252,2,'200',1595645201);
INSERT INTO `scheduler_log` VALUES (1253,2,'200',1595645271);
INSERT INTO `scheduler_log` VALUES (1254,1,'200',1595646013);
INSERT INTO `scheduler_log` VALUES (1255,2,'200',1595646013);
INSERT INTO `scheduler_log` VALUES (1256,3,'200',1595646025);
INSERT INTO `scheduler_log` VALUES (1257,4,'200',1595646025);
INSERT INTO `scheduler_log` VALUES (1258,5,'200',1595646025);
INSERT INTO `scheduler_log` VALUES (1259,2,'200',1595646068);
INSERT INTO `scheduler_log` VALUES (1260,2,'200',1595646129);
INSERT INTO `scheduler_log` VALUES (1261,2,'200',1595646566);
INSERT INTO `scheduler_log` VALUES (1262,2,'200',1595646695);
INSERT INTO `scheduler_log` VALUES (1263,2,'200',1595646853);
INSERT INTO `scheduler_log` VALUES (1264,2,'200',1595646916);
INSERT INTO `scheduler_log` VALUES (1265,2,'200',1595646993);
INSERT INTO `scheduler_log` VALUES (1266,2,'200',1595647120);
INSERT INTO `scheduler_log` VALUES (1267,2,'200',1595647254);
INSERT INTO `scheduler_log` VALUES (1268,2,'200',1595648067);
INSERT INTO `scheduler_log` VALUES (1269,2,'200',1595648120);
INSERT INTO `scheduler_log` VALUES (1270,2,'200',1595648394);
INSERT INTO `scheduler_log` VALUES (1271,2,'200',1595648455);
INSERT INTO `scheduler_log` VALUES (1272,2,'200',1595648610);
INSERT INTO `scheduler_log` VALUES (1273,2,'200',1595648714);
INSERT INTO `scheduler_log` VALUES (1274,2,'200',1595648949);
INSERT INTO `scheduler_log` VALUES (1275,2,'200',1595649205);
INSERT INTO `scheduler_log` VALUES (1276,2,'200',1595649373);
INSERT INTO `scheduler_log` VALUES (1277,1,'200',1595649637);
INSERT INTO `scheduler_log` VALUES (1278,2,'200',1595649637);
INSERT INTO `scheduler_log` VALUES (1279,3,'200',1595649650);
INSERT INTO `scheduler_log` VALUES (1280,4,'200',1595649650);
INSERT INTO `scheduler_log` VALUES (1281,5,'200',1595649650);
INSERT INTO `scheduler_log` VALUES (1282,2,'200',1595649730);
INSERT INTO `scheduler_log` VALUES (1283,2,'200',1595650217);
INSERT INTO `scheduler_log` VALUES (1284,2,'200',1595651076);
INSERT INTO `scheduler_log` VALUES (1285,2,'200',1595651516);
INSERT INTO `scheduler_log` VALUES (1286,2,'200',1595651635);
INSERT INTO `scheduler_log` VALUES (1287,2,'200',1595651863);
INSERT INTO `scheduler_log` VALUES (1288,2,'200',1595652618);
INSERT INTO `scheduler_log` VALUES (1289,2,'200',1595652684);
INSERT INTO `scheduler_log` VALUES (1290,2,'200',1595652762);
INSERT INTO `scheduler_log` VALUES (1291,2,'200',1595653067);
INSERT INTO `scheduler_log` VALUES (1292,2,'200',1595653161);
INSERT INTO `scheduler_log` VALUES (1293,1,'200',1595653248);
INSERT INTO `scheduler_log` VALUES (1294,2,'200',1595653248);
INSERT INTO `scheduler_log` VALUES (1295,3,'200',1595653260);
INSERT INTO `scheduler_log` VALUES (1296,4,'200',1595653260);
INSERT INTO `scheduler_log` VALUES (1297,5,'200',1595653260);
INSERT INTO `scheduler_log` VALUES (1298,2,'200',1595653268);
INSERT INTO `scheduler_log` VALUES (1299,1,'200',1595741445);
INSERT INTO `scheduler_log` VALUES (1300,2,'200',1595741445);
INSERT INTO `scheduler_log` VALUES (1301,3,'200',1595741458);
INSERT INTO `scheduler_log` VALUES (1302,4,'200',1595741458);
INSERT INTO `scheduler_log` VALUES (1303,5,'200',1595741458);
INSERT INTO `scheduler_log` VALUES (1304,2,'200',1595741677);
INSERT INTO `scheduler_log` VALUES (1305,2,'200',1595741704);
INSERT INTO `scheduler_log` VALUES (1306,2,'200',1595741873);
INSERT INTO `scheduler_log` VALUES (1307,2,'200',1595742034);
INSERT INTO `scheduler_log` VALUES (1308,2,'200',1595742537);
INSERT INTO `scheduler_log` VALUES (1309,2,'200',1595742557);
INSERT INTO `scheduler_log` VALUES (1310,2,'200',1595742603);
INSERT INTO `scheduler_log` VALUES (1311,2,'200',1595742698);
INSERT INTO `scheduler_log` VALUES (1312,2,'200',1595742722);
INSERT INTO `scheduler_log` VALUES (1313,2,'200',1595742831);
INSERT INTO `scheduler_log` VALUES (1314,2,'200',1595742847);
INSERT INTO `scheduler_log` VALUES (1315,2,'200',1595742917);
INSERT INTO `scheduler_log` VALUES (1316,2,'200',1595743004);
INSERT INTO `scheduler_log` VALUES (1317,2,'200',1595743045);
INSERT INTO `scheduler_log` VALUES (1318,2,'200',1595743093);
INSERT INTO `scheduler_log` VALUES (1319,1,'200',1595743711);
INSERT INTO `scheduler_log` VALUES (1320,2,'200',1595743711);
INSERT INTO `scheduler_log` VALUES (1321,3,'200',1595743724);
INSERT INTO `scheduler_log` VALUES (1322,4,'200',1595743724);
INSERT INTO `scheduler_log` VALUES (1323,5,'200',1595743724);
INSERT INTO `scheduler_log` VALUES (1324,3,'200',1595743735);
INSERT INTO `scheduler_log` VALUES (1325,4,'200',1595743735);
INSERT INTO `scheduler_log` VALUES (1326,5,'200',1595743735);
INSERT INTO `scheduler_log` VALUES (1327,2,'200',1595743983);
INSERT INTO `scheduler_log` VALUES (1328,2,'200',1595744122);
INSERT INTO `scheduler_log` VALUES (1329,2,'200',1595744164);
INSERT INTO `scheduler_log` VALUES (1330,2,'200',1595744920);
INSERT INTO `scheduler_log` VALUES (1331,2,'200',1595744955);
INSERT INTO `scheduler_log` VALUES (1332,2,'200',1595745017);
INSERT INTO `scheduler_log` VALUES (1333,2,'200',1595745258);
INSERT INTO `scheduler_log` VALUES (1334,2,'200',1595745528);
INSERT INTO `scheduler_log` VALUES (1335,2,'200',1595745749);
INSERT INTO `scheduler_log` VALUES (1336,2,'200',1595746078);
INSERT INTO `scheduler_log` VALUES (1337,2,'200',1595746219);
INSERT INTO `scheduler_log` VALUES (1338,2,'200',1595746268);
INSERT INTO `scheduler_log` VALUES (1339,2,'200',1595746324);
INSERT INTO `scheduler_log` VALUES (1340,2,'200',1595746381);
INSERT INTO `scheduler_log` VALUES (1341,2,'200',1595746444);
INSERT INTO `scheduler_log` VALUES (1342,2,'200',1595746650);
INSERT INTO `scheduler_log` VALUES (1343,2,'200',1595746681);
INSERT INTO `scheduler_log` VALUES (1344,1,'200',1595746811);
INSERT INTO `scheduler_log` VALUES (1345,2,'200',1595746811);
INSERT INTO `scheduler_log` VALUES (1346,3,'200',1595746823);
INSERT INTO `scheduler_log` VALUES (1347,4,'200',1595746823);
INSERT INTO `scheduler_log` VALUES (1348,5,'200',1595746823);
INSERT INTO `scheduler_log` VALUES (1349,2,'200',1595747472);
INSERT INTO `scheduler_log` VALUES (1350,2,'200',1595747526);
INSERT INTO `scheduler_log` VALUES (1351,2,'200',1595747823);
INSERT INTO `scheduler_log` VALUES (1352,2,'200',1595748089);
INSERT INTO `scheduler_log` VALUES (1353,2,'200',1595749093);
INSERT INTO `scheduler_log` VALUES (1354,2,'200',1595749222);
INSERT INTO `scheduler_log` VALUES (1355,2,'200',1595749262);
INSERT INTO `scheduler_log` VALUES (1356,2,'200',1595749356);
INSERT INTO `scheduler_log` VALUES (1357,2,'200',1595749385);
INSERT INTO `scheduler_log` VALUES (1358,2,'200',1595749466);
INSERT INTO `scheduler_log` VALUES (1359,2,'200',1595749506);
INSERT INTO `scheduler_log` VALUES (1360,1,'200',1595979993);
INSERT INTO `scheduler_log` VALUES (1361,2,'200',1595979993);
INSERT INTO `scheduler_log` VALUES (1362,3,'200',1595980007);
INSERT INTO `scheduler_log` VALUES (1363,4,'200',1595980007);
INSERT INTO `scheduler_log` VALUES (1364,5,'200',1595980007);
INSERT INTO `scheduler_log` VALUES (1365,2,'200',1595980035);
INSERT INTO `scheduler_log` VALUES (1366,2,'200',1595980099);
INSERT INTO `scheduler_log` VALUES (1367,2,'200',1595980182);
INSERT INTO `scheduler_log` VALUES (1368,2,'200',1595980385);
INSERT INTO `scheduler_log` VALUES (1369,2,'200',1595980503);
INSERT INTO `scheduler_log` VALUES (1370,2,'200',1595980579);
INSERT INTO `scheduler_log` VALUES (1371,2,'200',1595980620);
INSERT INTO `scheduler_log` VALUES (1372,2,'200',1595980627);
INSERT INTO `scheduler_log` VALUES (1373,2,'200',1595980715);
INSERT INTO `scheduler_log` VALUES (1374,2,'200',1595980741);
INSERT INTO `scheduler_log` VALUES (1375,1,'200',1595980868);
INSERT INTO `scheduler_log` VALUES (1376,2,'200',1595980868);
INSERT INTO `scheduler_log` VALUES (1377,3,'200',1595980886);
INSERT INTO `scheduler_log` VALUES (1378,4,'200',1595980886);
INSERT INTO `scheduler_log` VALUES (1379,5,'200',1595980886);
INSERT INTO `scheduler_log` VALUES (1380,2,'200',1595980962);
INSERT INTO `scheduler_log` VALUES (1381,2,'200',1595981010);
INSERT INTO `scheduler_log` VALUES (1382,2,'200',1595981049);
INSERT INTO `scheduler_log` VALUES (1383,2,'200',1595984211);
INSERT INTO `scheduler_log` VALUES (1384,1,'200',1596299271);
INSERT INTO `scheduler_log` VALUES (1385,2,'200',1596299271);
INSERT INTO `scheduler_log` VALUES (1386,3,'200',1596299284);
INSERT INTO `scheduler_log` VALUES (1387,4,'200',1596299284);
INSERT INTO `scheduler_log` VALUES (1388,5,'200',1596299284);
INSERT INTO `scheduler_log` VALUES (1389,2,'200',1596299287);
INSERT INTO `scheduler_log` VALUES (1390,2,'200',1596300122);
INSERT INTO `scheduler_log` VALUES (1391,2,'200',1596300317);
INSERT INTO `scheduler_log` VALUES (1392,2,'200',1596300691);
INSERT INTO `scheduler_log` VALUES (1393,2,'200',1596300754);
INSERT INTO `scheduler_log` VALUES (1394,2,'200',1596300965);
INSERT INTO `scheduler_log` VALUES (1395,1,'200',1596301391);
INSERT INTO `scheduler_log` VALUES (1396,2,'200',1596301391);
INSERT INTO `scheduler_log` VALUES (1397,3,'200',1596301415);
INSERT INTO `scheduler_log` VALUES (1398,4,'200',1596301415);
INSERT INTO `scheduler_log` VALUES (1399,5,'200',1596301415);
INSERT INTO `scheduler_log` VALUES (1400,3,'200',1596301421);
INSERT INTO `scheduler_log` VALUES (1401,4,'200',1596301421);
INSERT INTO `scheduler_log` VALUES (1402,5,'200',1596301421);
INSERT INTO `scheduler_log` VALUES (1403,3,'200',1596301423);
INSERT INTO `scheduler_log` VALUES (1404,4,'200',1596301423);
INSERT INTO `scheduler_log` VALUES (1405,5,'200',1596301423);
INSERT INTO `scheduler_log` VALUES (1406,2,'200',1596301441);
INSERT INTO `scheduler_log` VALUES (1407,2,'200',1596301501);
INSERT INTO `scheduler_log` VALUES (1408,2,'200',1596301602);
INSERT INTO `scheduler_log` VALUES (1409,2,'200',1596301632);
INSERT INTO `scheduler_log` VALUES (1410,2,'200',1596301700);
INSERT INTO `scheduler_log` VALUES (1411,2,'200',1596301775);
INSERT INTO `scheduler_log` VALUES (1412,2,'200',1596301822);
INSERT INTO `scheduler_log` VALUES (1413,2,'200',1596301934);
INSERT INTO `scheduler_log` VALUES (1414,2,'200',1596302048);
INSERT INTO `scheduler_log` VALUES (1415,2,'200',1596302620);
INSERT INTO `scheduler_log` VALUES (1416,2,'200',1596302651);
INSERT INTO `scheduler_log` VALUES (1417,2,'200',1596302706);
INSERT INTO `scheduler_log` VALUES (1418,2,'200',1596302779);
INSERT INTO `scheduler_log` VALUES (1419,2,'200',1596302824);
INSERT INTO `scheduler_log` VALUES (1420,2,'200',1596302889);
INSERT INTO `scheduler_log` VALUES (1421,2,'200',1596302958);
INSERT INTO `scheduler_log` VALUES (1422,2,'200',1596303211);
INSERT INTO `scheduler_log` VALUES (1423,2,'200',1596303254);
INSERT INTO `scheduler_log` VALUES (1424,2,'200',1596303263);
INSERT INTO `scheduler_log` VALUES (1425,2,'200',1596303712);
INSERT INTO `scheduler_log` VALUES (1426,2,'200',1596303760);
INSERT INTO `scheduler_log` VALUES (1427,2,'200',1596304064);
INSERT INTO `scheduler_log` VALUES (1428,2,'200',1596304409);
INSERT INTO `scheduler_log` VALUES (1429,2,'200',1596304708);
INSERT INTO `scheduler_log` VALUES (1430,2,'200',1596304746);
INSERT INTO `scheduler_log` VALUES (1431,2,'200',1596305184);
INSERT INTO `scheduler_log` VALUES (1432,3,'200',1596305200);
INSERT INTO `scheduler_log` VALUES (1433,5,'200',1596305200);
INSERT INTO `scheduler_log` VALUES (1434,2,'200',1596305384);
INSERT INTO `scheduler_log` VALUES (1435,2,'200',1596305407);
INSERT INTO `scheduler_log` VALUES (1436,2,'200',1596305462);
INSERT INTO `scheduler_log` VALUES (1437,2,'200',1597847102);
INSERT INTO `scheduler_log` VALUES (1438,3,'200',1597847115);
INSERT INTO `scheduler_log` VALUES (1439,5,'200',1597847115);
INSERT INTO `scheduler_log` VALUES (1440,3,'200',1597847117);
INSERT INTO `scheduler_log` VALUES (1441,5,'200',1597847117);
INSERT INTO `scheduler_log` VALUES (1442,2,'200',1597847268);
INSERT INTO `scheduler_log` VALUES (1443,2,'200',1597847290);
INSERT INTO `scheduler_log` VALUES (1444,2,'200',1597847556);
INSERT INTO `scheduler_log` VALUES (1445,2,'200',1597847633);
INSERT INTO `scheduler_log` VALUES (1446,2,'200',1597847717);
INSERT INTO `scheduler_log` VALUES (1447,2,'200',1597847802);
INSERT INTO `scheduler_log` VALUES (1448,2,'200',1597847826);
INSERT INTO `scheduler_log` VALUES (1449,2,'200',1597847887);
INSERT INTO `scheduler_log` VALUES (1450,2,'200',1597847946);
INSERT INTO `scheduler_log` VALUES (1451,2,'200',1597848082);
INSERT INTO `scheduler_log` VALUES (1452,2,'200',1597848121);
INSERT INTO `scheduler_log` VALUES (1453,2,'200',1597848183);
INSERT INTO `scheduler_log` VALUES (1454,2,'200',1597848245);
INSERT INTO `scheduler_log` VALUES (1455,2,'200',1597849206);
INSERT INTO `scheduler_log` VALUES (1456,3,'200',1597849218);
INSERT INTO `scheduler_log` VALUES (1457,5,'200',1597849218);
INSERT INTO `scheduler_log` VALUES (1458,3,'200',1597849219);
INSERT INTO `scheduler_log` VALUES (1459,5,'200',1597849219);
INSERT INTO `scheduler_log` VALUES (1460,2,'200',1598454105);
INSERT INTO `scheduler_log` VALUES (1461,3,'200',1598454112);
INSERT INTO `scheduler_log` VALUES (1462,5,'200',1598454112);
INSERT INTO `scheduler_log` VALUES (1463,3,'200',1598454112);
INSERT INTO `scheduler_log` VALUES (1464,5,'200',1598454112);
INSERT INTO `scheduler_log` VALUES (1465,2,'200',1598454163);
INSERT INTO `scheduler_log` VALUES (1466,2,'200',1598454181);
INSERT INTO `scheduler_log` VALUES (1467,2,'200',1598454249);
INSERT INTO `scheduler_log` VALUES (1468,2,'200',1598454300);
INSERT INTO `scheduler_log` VALUES (1469,2,'200',1598454304);
INSERT INTO `scheduler_log` VALUES (1470,2,'200',1598454377);
INSERT INTO `scheduler_log` VALUES (1471,2,'200',1598454509);
INSERT INTO `scheduler_log` VALUES (1472,2,'200',1598454594);
INSERT INTO `scheduler_log` VALUES (1473,2,'200',1598454885);
INSERT INTO `scheduler_log` VALUES (1474,2,'200',1598455147);
INSERT INTO `scheduler_log` VALUES (1475,2,'200',1598455282);
INSERT INTO `scheduler_log` VALUES (1476,2,'200',1598455531);
INSERT INTO `scheduler_log` VALUES (1477,2,'200',1598455593);
INSERT INTO `scheduler_log` VALUES (1478,2,'200',1598455628);
INSERT INTO `scheduler_log` VALUES (1479,2,'200',1598455923);
INSERT INTO `scheduler_log` VALUES (1480,2,'200',1598456212);
INSERT INTO `scheduler_log` VALUES (1481,2,'200',1598456340);
INSERT INTO `scheduler_log` VALUES (1482,2,'200',1598456347);
INSERT INTO `scheduler_log` VALUES (1483,2,'200',1598457323);
INSERT INTO `scheduler_log` VALUES (1484,2,'200',1598457388);
INSERT INTO `scheduler_log` VALUES (1485,2,'200',1598457457);
INSERT INTO `scheduler_log` VALUES (1486,2,'200',1598457504);
INSERT INTO `scheduler_log` VALUES (1487,2,'200',1598457695);
INSERT INTO `scheduler_log` VALUES (1488,3,'200',1598457703);
INSERT INTO `scheduler_log` VALUES (1489,5,'200',1598457703);
INSERT INTO `scheduler_log` VALUES (1490,2,'200',1598457722);
INSERT INTO `scheduler_log` VALUES (1491,2,'200',1598458270);
INSERT INTO `scheduler_log` VALUES (1492,2,'200',1599149674);
INSERT INTO `scheduler_log` VALUES (1493,3,'200',1599149687);
INSERT INTO `scheduler_log` VALUES (1494,5,'200',1599149687);
INSERT INTO `scheduler_log` VALUES (1495,2,'200',1599359849);
INSERT INTO `scheduler_log` VALUES (1496,3,'200',1599359855);
INSERT INTO `scheduler_log` VALUES (1497,5,'200',1599359855);
INSERT INTO `scheduler_log` VALUES (1498,2,'200',1599359942);
INSERT INTO `scheduler_log` VALUES (1499,2,'200',1599361694);
INSERT INTO `scheduler_log` VALUES (1500,3,'200',1599361696);
INSERT INTO `scheduler_log` VALUES (1501,5,'200',1599361696);
INSERT INTO `scheduler_log` VALUES (1502,3,'200',1599361700);
INSERT INTO `scheduler_log` VALUES (1503,5,'200',1599361700);
INSERT INTO `scheduler_log` VALUES (1504,2,'200',1599413172);
INSERT INTO `scheduler_log` VALUES (1505,3,'200',1599413176);
INSERT INTO `scheduler_log` VALUES (1506,5,'200',1599413176);
INSERT INTO `scheduler_log` VALUES (1507,2,'200',1599413307);
INSERT INTO `scheduler_log` VALUES (1508,2,'200',1599414070);
INSERT INTO `scheduler_log` VALUES (1509,2,'200',1599414221);
INSERT INTO `scheduler_log` VALUES (1510,2,'200',1599414292);
INSERT INTO `scheduler_log` VALUES (1511,2,'200',1599414315);
INSERT INTO `scheduler_log` VALUES (1512,2,'200',1599414392);
INSERT INTO `scheduler_log` VALUES (1513,2,'200',1599414430);
INSERT INTO `scheduler_log` VALUES (1514,2,'200',1599414487);
INSERT INTO `scheduler_log` VALUES (1515,2,'200',1599414923);
INSERT INTO `scheduler_log` VALUES (1516,2,'200',1599415727);
INSERT INTO `scheduler_log` VALUES (1517,3,'200',1599415729);
INSERT INTO `scheduler_log` VALUES (1518,5,'200',1599415729);
INSERT INTO `scheduler_log` VALUES (1519,2,'200',1599415761);
INSERT INTO `scheduler_log` VALUES (1520,2,'200',1599415827);
INSERT INTO `scheduler_log` VALUES (1521,2,'200',1599415885);
INSERT INTO `scheduler_log` VALUES (1522,2,'200',1599415991);
INSERT INTO `scheduler_log` VALUES (1523,2,'200',1599416259);
INSERT INTO `scheduler_log` VALUES (1524,2,'200',1599416303);
INSERT INTO `scheduler_log` VALUES (1525,2,'200',1599416362);
INSERT INTO `scheduler_log` VALUES (1526,2,'200',1599416411);
INSERT INTO `scheduler_log` VALUES (1527,2,'200',1599416473);
INSERT INTO `scheduler_log` VALUES (1528,2,'200',1599416561);
INSERT INTO `scheduler_log` VALUES (1529,2,'200',1599416595);
INSERT INTO `scheduler_log` VALUES (1530,2,'200',1599416652);
INSERT INTO `scheduler_log` VALUES (1531,2,'200',1599416768);
INSERT INTO `scheduler_log` VALUES (1532,2,'200',1599416934);
INSERT INTO `scheduler_log` VALUES (1533,2,'200',1599416943);
INSERT INTO `scheduler_log` VALUES (1534,2,'200',1599417010);
INSERT INTO `scheduler_log` VALUES (1535,2,'200',1599417065);
INSERT INTO `scheduler_log` VALUES (1536,2,'200',1599417157);
INSERT INTO `scheduler_log` VALUES (1537,2,'200',1599417358);
INSERT INTO `scheduler_log` VALUES (1538,2,'200',1599417407);
INSERT INTO `scheduler_log` VALUES (1539,2,'200',1599417429);
INSERT INTO `scheduler_log` VALUES (1540,2,'200',1599417501);
INSERT INTO `scheduler_log` VALUES (1541,2,'200',1599417745);
INSERT INTO `scheduler_log` VALUES (1542,2,'200',1599417781);
INSERT INTO `scheduler_log` VALUES (1543,2,'200',1599417891);
INSERT INTO `scheduler_log` VALUES (1544,2,'200',1599418020);
INSERT INTO `scheduler_log` VALUES (1545,2,'200',1599418061);
INSERT INTO `scheduler_log` VALUES (1546,2,'200',1599418083);
INSERT INTO `scheduler_log` VALUES (1547,2,'200',1599418299);
INSERT INTO `scheduler_log` VALUES (1548,2,'200',1599418325);
INSERT INTO `scheduler_log` VALUES (1549,2,'200',1599418622);
INSERT INTO `scheduler_log` VALUES (1550,2,'200',1599418830);
INSERT INTO `scheduler_log` VALUES (1551,3,'200',1599418832);
INSERT INTO `scheduler_log` VALUES (1552,5,'200',1599418832);
INSERT INTO `scheduler_log` VALUES (1553,2,'200',1599418865);
INSERT INTO `scheduler_log` VALUES (1554,2,'200',1599421977);
INSERT INTO `scheduler_log` VALUES (1555,2,'200',1599424574);
INSERT INTO `scheduler_log` VALUES (1556,3,'200',1599424580);
INSERT INTO `scheduler_log` VALUES (1557,5,'200',1599424580);
INSERT INTO `scheduler_log` VALUES (1558,2,'200',1599425592);
INSERT INTO `scheduler_log` VALUES (1559,2,'200',1599425648);
INSERT INTO `scheduler_log` VALUES (1560,2,'200',1599425702);
INSERT INTO `scheduler_log` VALUES (1561,2,'200',1599426158);
INSERT INTO `scheduler_log` VALUES (1562,3,'200',1599426161);
INSERT INTO `scheduler_log` VALUES (1563,5,'200',1599426161);
INSERT INTO `scheduler_log` VALUES (1564,2,'200',1599426185);
INSERT INTO `scheduler_log` VALUES (1565,2,'200',1599426246);
INSERT INTO `scheduler_log` VALUES (1566,2,'200',1599426307);
INSERT INTO `scheduler_log` VALUES (1567,2,'200',1599426382);
INSERT INTO `scheduler_log` VALUES (1568,2,'200',1599426422);
INSERT INTO `scheduler_log` VALUES (1569,2,'200',1599426492);
INSERT INTO `scheduler_log` VALUES (1570,2,'200',1599426662);
INSERT INTO `scheduler_log` VALUES (1571,2,'200',1599426734);
INSERT INTO `scheduler_log` VALUES (1572,2,'200',1599426785);
INSERT INTO `scheduler_log` VALUES (1573,2,'200',1599426873);
INSERT INTO `scheduler_log` VALUES (1574,2,'200',1599426927);
INSERT INTO `scheduler_log` VALUES (1575,2,'200',1599426988);
INSERT INTO `scheduler_log` VALUES (1576,2,'200',1599427191);
INSERT INTO `scheduler_log` VALUES (1577,2,'200',1599427211);
INSERT INTO `scheduler_log` VALUES (1578,2,'200',1599427287);
INSERT INTO `scheduler_log` VALUES (1579,2,'200',1599427338);
INSERT INTO `scheduler_log` VALUES (1580,2,'200',1599427385);
INSERT INTO `scheduler_log` VALUES (1581,2,'200',1599427453);
INSERT INTO `scheduler_log` VALUES (1582,2,'200',1599427537);
INSERT INTO `scheduler_log` VALUES (1583,2,'200',1599427561);
INSERT INTO `scheduler_log` VALUES (1584,2,'200',1599427636);
INSERT INTO `scheduler_log` VALUES (1585,2,'200',1599427692);
INSERT INTO `scheduler_log` VALUES (1586,2,'200',1599428135);
INSERT INTO `scheduler_log` VALUES (1587,2,'200',1599428165);
INSERT INTO `scheduler_log` VALUES (1588,2,'200',1599441215);
INSERT INTO `scheduler_log` VALUES (1589,3,'200',1599441220);
INSERT INTO `scheduler_log` VALUES (1590,5,'200',1599441220);
INSERT INTO `scheduler_log` VALUES (1591,2,'200',1599441245);
INSERT INTO `scheduler_log` VALUES (1592,2,'200',1599441490);
INSERT INTO `scheduler_log` VALUES (1593,2,'200',1599441611);
INSERT INTO `scheduler_log` VALUES (1594,2,'200',1599441774);

#
# Source for table service
#

CREATE TABLE `service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `service_description` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `service_url` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `service_api` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Info on input sources i.e SMS, Email, Twitter';

#
# Dumping data for table service
#

INSERT INTO `service` VALUES (1,'SMS','Text messages from phones',NULL,NULL);
INSERT INTO `service` VALUES (2,'Email','Email messages sent to your deployment',NULL,NULL);
INSERT INTO `service` VALUES (3,'Twitter','Tweets tweets tweets','http://twitter.com',NULL);

#
# Source for table sessions
#

CREATE TABLE `sessions` (
  `session_id` varchar(127) CHARACTER SET latin1 NOT NULL,
  `last_activity` int(10) unsigned NOT NULL,
  `data` text CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores session information';

#
# Dumping data for table sessions
#

INSERT INTO `sessions` VALUES ('tuu93rq01m6dv5imflumo1jbe4',1599441251,'IsNHZUxZi93BxMi8Qel5eV0qIuJUUxZmnKmw73M2D1Getu47lRsHyWiM1iQjtmXMDRGB/h+MK0+7cqXfGQ1y1Z6AsrtztjeTfH10zYmGprTBLpbBSx3lTsqee8sXCtxuUQeWOa3RxVWZWz1sdJBSxKx3Ut5UcsQz1Sswum25IcUZFfKHdSTm5Q2O/gE01AN3JVx2uwwf8EJ1xR7f2oBqZkiLFExhrtQJoAMkLkSw+HIQdOK6ao2h8AH8y7z2EyegHPPXPhGZO8EXshE8IVU5G7p3fDWdh9NkJZYfUn2BYKlAs5sFpiTiYHrEpsWw17pQEdAJ9LQvPcXYExPR3NRvm0H+rny+eRyrAu1XyyisHbtIQ3pj6hyErxliuPnZB01ouh7oGtPf/4LI8mKnSgSD5Z9ZaEaPUwRB5vgH4ScWAJ0ZsuGIbK4EYQ+mGkPes0lM9aRfNxf/+8WrelyfGzxMSEXyQgi8q/KdFS5Y0sT7KhG2NMuafrzWHjth39Sht3XUF51eqGbQhNhxIZShAA9jcjOzRzf44+ZYgGeMjOu77TniPNvKZR2qlSrkJsgMU9gOe06xmGjuGvOB4N1bwE/nL5/R8B8zCZWnwi3PSlZvJLVLsv/5iBLQii0lw0iLxXyri+UnTiEqL7lFAh843RXud9sWG/xgZppGgZJ4SGaZujlbFhXOTvJu1A1RzMGoEWpI0rXhsPUzYTikO1fmSaXtwFsbHi3yY7LyE/xtLE0hgQGAcEY5fWqd4SSWfE0750TFCKmr8JeMmdnyNiwIcA2b9V5gAaIkyL11QxjW4qG1kDqF+pMLBO09ygGrEk3ZgF6DAktORb2uTHmqClpyXxDngmsrZsZxyuxvfFmUBY9wVAh9OvU5TJm/NaYTANjrfHphBWRzEnC4pwi/+j4JboUZXZPn0dy0RrTnFU8X5B0nFKTOK/N81np6JCtxZWwQI+GAg1WYEB5L1P8AVpRP7eNkSK+JSYXLuVgPBWmSi5+ciKHeWBTB6UWDvXvfobi4NARBnGYyHsBucFfw2caQxM6znrYybtvh0OW/cidxco6BpG7WOLNIdH/Fy14U4OixR5Gys+dUFWPBr/aGeX4+msUw70vqiO8k39phKHkz7AU8g4RMG5JTO7WfGu+JbJqGeLMIK5I0XL0OH71AGVJI/fLzbAuZ8obB1zXV4ObhIV8pcerqAG94F+dFM4iGS0L36AB//Do8utpWVpmDsBLBkSE3qajcK0LfeAXHevlc8rigfAilHLgPsoFbwmmWqxowFm5kke2AvHpGuKwBNoejJxiZIk9JgtfCp0g5xwHbB3snuWabgkqDB1VzaBtT4eBlyMmYDBVyZVCYWoIUNivnhzJCTXbRg1G7tHZuq2K3FTZvVinW4R0zw+xb96mOCdfsEg==');
INSERT INTO `sessions` VALUES ('of4gb08qr4otuhpob8v4pjtdg4',1599428166,'N1g/F0CcBNkudr4BCYgsvz1d3wwUcZGlnoRJJhdPJKyk3Z+t6GMsUTL5WSrbIxjgYUjAA9mPePfdruuaBIjQ8MQwnm9VzEIbj++tP76T3cp6IAXsOCP8fe0LnagITWnEcU+n6I0waTTFP6MCVeL+gVsl0v5VI81EwzKNUhqyRx5kAhQ1QfT8Ji8swzUgwecUu2SOO8+fTLpjyG+7Bjulh5GGqoI5tu4+7n7B5YJiDhQ7LKSxiHOYk+5PbQc7uVaVieKRwN3rGERSQXtMpR5D76keF/KgNEfT09t8fjPgr8Msrk2woLZosNgLh0xnfsj1SAYrevj7lnc2Nwvyu47ykpHO4z3cJgEs2rn1S4ivF/mS24tY+qXIBzsNLXwxoXV8RifNHAoP+Ll9Ot64/cOD9oTBUchgKNKMQvh+NWaNFQk5TiPA44bvbxGsgntJxeEnvVwX31y6kucV2UI447Kk5iisKyIztlv9d/YxlGqUySWim8imHWWxyJMS7tgFNuP6R1CFmAA3BdNUKI4MgROd7RL2QbAkeRsBQUD5eEqhvqABvcqfgwDLGXRsnqWvNPpe3yk1flL5Gf15OxoKikaCzIZ7IaizG3TZohYSkAh7jQhppodR2o+P2NcaWpds7iigkxCSuPByDQcZVcwuU1O+S5SXIviQ3nU8A0+ULqZpJfEdnkJnexYCJfGEuya3xc7W5CdYqRITK8Q7vIdFdMe8WIug5mofKVdK4vVPSnLf3yCoayL/5aJRl4gOaNByMUBVNBZnEBvApFO7YAz+uLhTBME/GpWNB/dpjXyKdqTwKcExgwQhsAZPaqBlBPspSKPEdaSJPWTYDAG5Pnx/jQ2RMFeIW40tVHAazoXoCB2/VT2RdKgZrRSnuIaAgGy8VUlUaHLK2rWuM354Ao7qw1HFn+aTFThoLcV23oMKecU5VxXRYh8GP62N2ktD+R3P3b90uFXc8aR2Xw1bCv5M8Py6+M0JXkkdnq2EznJWdLIzeqghx376K1CFNCwIBjhPlH+djf6TCpuJ+Knjk36HCv+EUF+1fgjxdv4v3MVj9pHPDWIdwWfZM0SBpwZ/XrbK3pv7RM+ldAvx3LFYmb+WkAapGWBo7+eXeDl7FlKQ+0ONEOYbWp2/tqUsMdrSa1uivyEr9p4yTG5edDuFUg4y3G9vEIxxA3BPJh5XNsRQncX+TSBda3Rht1/ElkEw34fXYY/EqW1YOQMOYY01VOgwQ8W5SEMe8khX6vCxzC1f82bOtA+70c2FfWWX7MfcpQCMONWaDtfbxN89v82Vshc0X459/Xsdm6RmQy25kWBK2XaJC+bd69Br9G1mXbJEiVZFvSQmede3p4151yDg0B9ozRI3WRclD1oqeafg0rfN58UyurPipBODXobzQAQ1hyoj/Eo=');
INSERT INTO `sessions` VALUES ('5kn5vnp1he23f1cf88acpu9ee3',1599441777,'01z28SW2lzqu0eHjTElLi2Y9CZUALKBFLYFMuwML3Ak89/ogAlTsOHT0Hw6d6uXtpFHy3lu241KWOEmFjn0rgBQFpSuVbQi5sONLv7nM7OCKh3Fose+h30q11SCASGh6Rwv9CO0oFnq0ANT5xyLSynxnxMffDgm+8kk0DPdhvib9pfHegS2cMEyk6lWrdcF9czRMQ/uUXc3MUzWqtMGXa0r79JoaUXwExTDNigEoTLYvg5bUAOQKOwXlbBEQgJCbJP2P3lZdkzoL+PccW7YeWoVD4/5rhucIORZgzw3kDN5YoYawlsc2Pa5TjBmOrP2p4PwHoxZs1MKroCgXJOiI0l9uwNZxv27wsPBmEmdSNUAxDXUqz4AFq26VFLt+Jub3DhAy0pI9B2fgY1N/fzsQDWAgnrQzwTE1Otrpm8KWDgKz3sdrjiFo0cb7Dy2C2y3Doe/X6xX28ea6zbu0FnDOY8yfIkXv5RPeymU5EDOnLeYmh45Hyz6mpr5ESCCrd++9zd0ADrNF9SDfyxPl0iqjbaI9AHfRkR64trmzFDYQDB2HTnw2SOpCDk8gXzUXbD3n0fCWl3Q6x/93t9wg8t7J4ICMVUrBISM7HT8WcYnx2GkgLWBgbkllpcfIxVbVgEM0si1EoTtYSSAPeHFCCUrdcBka1YNeSeMBTiiXlAFUYW6cus/0RRMJfO2imMyE27Un80hu+Sp5QBipXcvQgWcKchMNlZMNEeyH20NocaFvR1YxOgs6KZo82It9aMPxQf2DRayh079t4ErxdGu0ZpmxFjCkk/ILeJuXragU9nNbQzyvuoZ8toWu4p6W9adR6IKME0fTZncGFyfKAQ4XUYhuxkefEdo7tj/jTiJLMgoTK1VYxurQU1VmYsQjf3q7sxJIQhVaSVozcpODOxbw9z6N0iKQWoX3L5davaE+GRVR+DUlNHYjASrP5Vgx4hgOCS6/UoAWzDvJIr2Hmpx4+lXbFlIKiviWPOpcGakvGtwTQ2QfHrfyqde3CC4cuODL6v31ACbRADVuxfOJoK4lNW38e8gFoWvpoemE7qIJwX+D04IUrAosT2G8rfJbJ93A0LyFIZzZ2vFB17lHwvaR4Zzgj2vpYGxgAVsV3RV2uLtrOp1uN+olh5jBAohf62DjzDIzlGq9wyTh8KygkpgmRNmQZlEoPMfGC4LptzBKGGN8Ntcg9oJcylTtZe9xKcAF7O1JaY1k/uPFvOD6Jg7hys50iRruU4eMC8CSyPxQqMEQgS1zh3qeNPKggN/8cSrZxmXyLEOhT2vwowgXHMMrrDnHngstcgPRUgs+c3Uf1U8a1DT84mFefjT7ZWQ14ZJobldnZH+TgsTvVrIH1yv0A1Rw+UfXERiUQTO/f4ga+OVXO9pv/QQANyEHraRf+QVPQA==');

#
# Source for table settings
#

CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT '' COMMENT 'Unique identifier for the configuration parameter',
  `value` text CHARACTER SET latin1 COMMENT 'Value for the settings parameter',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2757 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Dumping data for table settings
#

INSERT INTO `settings` VALUES (0,'scheduler_lock','0');
INSERT INTO `settings` VALUES (1,'site_name','SS STANDART (OPS/OMS)');
INSERT INTO `settings` VALUES (2,'site_tagline','INFORMACIÓN ESPECÍFICA EN TIEMPO REAL');
INSERT INTO `settings` VALUES (3,'site_banner_id','1');
INSERT INTO `settings` VALUES (4,'site_email','cadic.tester@gmail.com');
INSERT INTO `settings` VALUES (5,'site_key',NULL);
INSERT INTO `settings` VALUES (6,'site_language','es_CO');
INSERT INTO `settings` VALUES (7,'site_style','default');
INSERT INTO `settings` VALUES (8,'site_timezone','America/Bogota');
INSERT INTO `settings` VALUES (9,'site_contact_page','1');
INSERT INTO `settings` VALUES (10,'site_help_page','1');
INSERT INTO `settings` VALUES (11,'site_message','Monitoreo permanente de aquellas situaciones, eventos y procesos relacionados con la salud de la región, a disposición de las autoridades sanitarias del Departamento para fundamentar la toma de decisiones y para consulta del público en general.');
INSERT INTO `settings` VALUES (12,'site_copyright_statement','https://181.135.39.4/entorno/dev/ss_opsoms/ Todos los derechos reservados para la Organización Panamericana de la Salud - OPS/OMS Colombia, Bogotá - Calle 66 Nº 11-50 piso 6 y 7 Tel.: (57) 1-3144141 / Créditos intelectuales para Andrés Diez Córdoba y Natalia Elisa Mesa Angel (57) 3007185880.');
INSERT INTO `settings` VALUES (13,'site_submit_report_message','Agradecemos la información suministrada, es para nosotros de gran utilidad poder monitorear los eventos en salud en tiempo real; su reporte será validado, aprobado o rechazado de acuerdo a la veracidad de la información aportada. \n\nEsta plataforma ha sido implementada y donada con el apoyo de la Organización Panamericana de la Salud OPS/OMS Colombia.');
INSERT INTO `settings` VALUES (14,'allow_reports','1');
INSERT INTO `settings` VALUES (15,'allow_comments','1');
INSERT INTO `settings` VALUES (16,'allow_feed','1');
INSERT INTO `settings` VALUES (17,'allow_stat_sharing','1');
INSERT INTO `settings` VALUES (18,'allow_clustering','1');
INSERT INTO `settings` VALUES (19,'cache_pages','0');
INSERT INTO `settings` VALUES (20,'cache_pages_lifetime','1800');
INSERT INTO `settings` VALUES (21,'private_deployment','0');
INSERT INTO `settings` VALUES (22,'default_map','esri_topo');
INSERT INTO `settings` VALUES (23,'default_map_all','0000cc');
INSERT INTO `settings` VALUES (24,'default_map_all_icon_id',NULL);
INSERT INTO `settings` VALUES (25,'api_google','');
INSERT INTO `settings` VALUES (26,'api_live','Apumcka0uPOF2lKLorq8aeo4nuqfVVeNRqJjqOcLMJ9iMCTsnMsNd9_OvpA8gR0i');
INSERT INTO `settings` VALUES (27,'api_akismet','');
INSERT INTO `settings` VALUES (28,'default_country','49');
INSERT INTO `settings` VALUES (29,'multi_country','0');
INSERT INTO `settings` VALUES (30,'default_city','nairobi');
INSERT INTO `settings` VALUES (31,'default_lat','4.673708972048877');
INSERT INTO `settings` VALUES (32,'default_lon','-73.32161665475269');
INSERT INTO `settings` VALUES (33,'default_zoom','5');
INSERT INTO `settings` VALUES (34,'items_per_page','5');
INSERT INTO `settings` VALUES (35,'items_per_page_admin','20');
INSERT INTO `settings` VALUES (36,'sms_provider','');
INSERT INTO `settings` VALUES (37,'sms_no1',NULL);
INSERT INTO `settings` VALUES (38,'sms_no2',NULL);
INSERT INTO `settings` VALUES (39,'sms_no3',NULL);
INSERT INTO `settings` VALUES (40,'google_analytics','');
INSERT INTO `settings` VALUES (41,'twitter_hashtags',NULL);
INSERT INTO `settings` VALUES (42,'blocks','news_block|reports_block');
INSERT INTO `settings` VALUES (43,'blocks_per_row','2');
INSERT INTO `settings` VALUES (44,'date_modify','2020-09-06 20:20:10');
INSERT INTO `settings` VALUES (45,'stat_id',NULL);
INSERT INTO `settings` VALUES (46,'stat_key','');
INSERT INTO `settings` VALUES (47,'email_username','cadic.tester@gmail.com');
INSERT INTO `settings` VALUES (48,'email_password','.k4sed1c.');
INSERT INTO `settings` VALUES (49,'email_port','993');
INSERT INTO `settings` VALUES (50,'email_host','imap.gmail.com');
INSERT INTO `settings` VALUES (51,'email_servertype','imap');
INSERT INTO `settings` VALUES (52,'email_ssl','1');
INSERT INTO `settings` VALUES (53,'ftp_server',NULL);
INSERT INTO `settings` VALUES (54,'ftp_user_name',NULL);
INSERT INTO `settings` VALUES (55,'alerts_email','cadic.tester@gmail.com');
INSERT INTO `settings` VALUES (57,'facebook_appid',NULL);
INSERT INTO `settings` VALUES (58,'facebook_appsecret',NULL);
INSERT INTO `settings` VALUES (59,'db_version','119');
INSERT INTO `settings` VALUES (60,'ushahidi_version','2.7.4');
INSERT INTO `settings` VALUES (61,'allow_alerts','1');
INSERT INTO `settings` VALUES (62,'require_email_confirmation','0');
INSERT INTO `settings` VALUES (63,'manually_approve_users','0');
INSERT INTO `settings` VALUES (64,'enable_timeline','1');
INSERT INTO `settings` VALUES (65,'feed_geolocation_user','');
INSERT INTO `settings` VALUES (66,'allow_feed_category','0');
INSERT INTO `settings` VALUES (67,'max_upload_size','10');
INSERT INTO `settings` VALUES (68,'forgot_password_secret','jlFrd;]!&sUyONgl2sSrdk#KtUdGvNy#4Gta#_PZ}?WVm@}~ray)n9OL&t~NJm1I');
INSERT INTO `settings` VALUES (2394,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2395,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2396,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2397,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2398,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2399,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2400,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2401,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2402,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2403,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2404,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2405,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2406,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2407,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2408,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2409,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2410,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2411,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2412,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2413,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2414,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2415,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2416,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2417,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2418,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2419,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2420,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2421,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2422,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2423,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2424,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2425,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2426,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2427,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2428,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2429,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2430,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2431,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2432,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2433,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2434,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2435,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2436,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2437,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2438,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2439,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2440,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2441,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2442,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2443,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2444,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2445,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2446,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2447,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2448,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2449,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2450,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2451,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2452,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2453,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2454,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2455,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2456,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2457,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2458,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2459,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2460,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2461,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2462,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2463,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2464,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2465,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2466,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2467,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2468,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2469,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2470,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2471,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2472,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2473,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2474,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2475,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2476,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2477,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2478,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2479,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2480,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2481,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2482,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2483,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2484,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2485,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2486,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2487,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2488,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2489,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2490,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2491,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2492,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2493,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2494,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2495,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2496,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2497,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2498,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2499,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2500,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2501,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2502,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2503,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2504,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2505,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2506,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2507,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2508,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2509,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2510,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2511,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2512,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2513,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2514,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2515,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2516,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2517,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2518,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2519,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2520,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2521,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2522,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2523,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2524,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2525,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2526,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2527,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2528,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2529,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2530,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2531,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2532,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2533,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2534,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2535,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2536,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2537,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2538,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2539,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2540,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2541,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2542,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2543,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2544,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2545,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2546,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2547,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2548,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2549,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2550,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2551,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2552,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2553,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2554,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2555,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2556,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2557,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2558,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2559,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2560,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2561,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2562,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2563,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2564,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2565,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2566,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2567,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2568,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2569,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2570,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2571,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2572,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2573,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2574,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2575,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2576,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2577,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2578,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2579,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2580,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2581,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2582,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2583,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2584,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2585,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2586,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2587,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2588,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2589,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2590,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2591,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2592,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2593,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2594,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2595,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2596,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2597,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2598,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2599,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2600,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2601,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2602,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2603,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2604,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2605,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2606,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2607,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2608,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2609,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2610,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2611,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2612,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2613,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2614,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2615,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2616,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2617,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2618,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2619,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2620,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2621,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2622,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2623,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2624,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2625,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2626,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2627,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2628,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2629,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2630,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2631,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2632,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2633,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2634,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2635,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2636,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2637,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2638,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2639,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2640,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2641,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2642,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2643,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2644,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2645,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2646,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2647,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2648,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2649,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2650,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2651,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2652,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2653,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2654,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2655,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2656,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2657,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2658,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2659,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2660,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2661,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2662,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2663,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2664,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2665,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2666,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2667,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2668,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2669,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2670,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2671,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2672,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2673,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2674,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2675,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2676,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2677,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2678,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2679,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2680,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2681,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2682,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2683,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2684,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2685,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2686,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2687,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2688,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2689,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2690,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2691,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2692,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2693,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2694,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2695,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2696,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2697,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2698,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2699,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2700,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2701,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2702,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2703,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2704,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2705,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2706,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2707,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2708,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2709,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2710,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2711,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2712,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2713,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2714,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2715,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2716,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2717,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2718,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2719,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2720,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2721,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2722,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2723,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2724,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2725,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2726,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2727,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2728,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2729,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2730,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2731,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2732,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2733,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2734,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2735,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2736,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2737,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2738,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2739,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2740,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2741,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2742,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2743,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2744,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2745,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2746,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2747,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2748,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2749,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2750,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2751,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2752,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2753,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2754,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2755,'scheduler_lock','0');
INSERT INTO `settings` VALUES (2756,'scheduler_lock','0');

#
# Source for table sharing
#

CREATE TABLE `sharing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sharing_name` varchar(150) NOT NULL COMMENT 'name that appears on the front end',
  `sharing_url` varchar(255) NOT NULL COMMENT 'url of the deployment to share with',
  `sharing_color` varchar(20) DEFAULT 'CC0000' COMMENT 'color that shows the shared reports',
  `sharing_active` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'sharing active or inactive ',
  `sharing_date` datetime DEFAULT NULL COMMENT 'date the sharing was initiated',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table sharing
#


#
# Source for table sharing_incident
#

CREATE TABLE `sharing_incident` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sharing_id` int(10) unsigned NOT NULL,
  `incident_id` int(10) NOT NULL,
  `incident_title` varchar(255) NOT NULL COMMENT 'title of the report',
  `latitude` double NOT NULL COMMENT 'latitude of the report',
  `longitude` double NOT NULL COMMENT 'longitude of the report',
  `incident_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table sharing_incident
#


#
# Source for table sharing_log
#

CREATE TABLE `sharing_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sharing_id` int(11) NOT NULL,
  `sharing_log_date` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table sharing_log
#


#
# Source for table smssync_message
#

CREATE TABLE `smssync_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `smssync_to` varchar(100) DEFAULT NULL,
  `smssync_from` varchar(100) DEFAULT NULL,
  `smssync_message` text,
  `smssync_message_date` datetime DEFAULT NULL,
  `smssync_sent` tinyint(4) NOT NULL DEFAULT '0',
  `smssync_sent_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table smssync_message
#


#
# Source for table smssync_settings
#

CREATE TABLE `smssync_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `smssync_secret` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table smssync_settings
#


#
# Source for table user_tokens
#

CREATE TABLE `user_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `user_agent` varchar(40) CHARACTER SET latin1 NOT NULL,
  `token` varchar(64) CHARACTER SET latin1 NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores browser tokens assigned to users';

#
# Dumping data for table user_tokens
#

INSERT INTO `user_tokens` VALUES (14,1,'7099cabf09023f229c22ced74664f88bc8b851c3','QKY3ta0KM2a4IMEnMi9B2FCxwdwOv1wz',1593482183,1594691783);
INSERT INTO `user_tokens` VALUES (15,1,'7099cabf09023f229c22ced74664f88bc8b851c3','VwC0ydB8k3qIZKlj53bfWnsqg0OYkxsp',1593483289,1594692889);
INSERT INTO `user_tokens` VALUES (16,1,'7099cabf09023f229c22ced74664f88bc8b851c3','KSIFjHQeUE6x95HyOzjMvvZMFYUxe3Ys',1593715976,1594925576);
INSERT INTO `user_tokens` VALUES (17,1,'7099cabf09023f229c22ced74664f88bc8b851c3','SMLA02TuUemURN6zlc0ZbEQVbyboJSri',1593716174,1594925774);
INSERT INTO `user_tokens` VALUES (18,1,'7099cabf09023f229c22ced74664f88bc8b851c3','aibbRWAFseUcft7gTtaNR7JOPGtaF2IY',1593811897,1595021497);
INSERT INTO `user_tokens` VALUES (19,1,'7099cabf09023f229c22ced74664f88bc8b851c3','PPqO0hjbhwSX5KWnkRX4uaVjIrcgSIZh',1593817772,1595027372);
INSERT INTO `user_tokens` VALUES (20,1,'7099cabf09023f229c22ced74664f88bc8b851c3','hl7JMmeX4brI0nPO54L2BvSNMwVqlsjZ',1593817834,1595027434);
INSERT INTO `user_tokens` VALUES (21,1,'7099cabf09023f229c22ced74664f88bc8b851c3','0ssO9MM6aNCZG0SXafpTdCy6cgUjk2vx',1593817883,1595027483);
INSERT INTO `user_tokens` VALUES (22,1,'7099cabf09023f229c22ced74664f88bc8b851c3','5gbLMStGXS0wKEddpLnROUGekPg7XSOz',1593817915,1595027515);
INSERT INTO `user_tokens` VALUES (23,1,'7099cabf09023f229c22ced74664f88bc8b851c3','iwXzO1vTs56J6hnI4m8qeKvPiIqvkdtV',1593833368,1595042968);
INSERT INTO `user_tokens` VALUES (24,1,'970649ac65ad629e44e5a91b6cb0d706ef602e37','p6ype8MajOc23g1u3VjCLyXIna1GMaOf',1594077956,1595287556);
INSERT INTO `user_tokens` VALUES (25,1,'7099cabf09023f229c22ced74664f88bc8b851c3','niLuyJss39f6kd4oVbuGlQxOxHD4yBXq',1594352662,1595562262);
INSERT INTO `user_tokens` VALUES (26,1,'7099cabf09023f229c22ced74664f88bc8b851c3','vf5b1HRNfbRAGk6oVOnjPKLfA7N9ytpH',1594698062,1595907662);
INSERT INTO `user_tokens` VALUES (27,1,'7099cabf09023f229c22ced74664f88bc8b851c3','oLAvaXEaqtFRZU9RI4DOLlCEsBU7dD25',1594865983,1596075583);
INSERT INTO `user_tokens` VALUES (29,1,'7099cabf09023f229c22ced74664f88bc8b851c3','P3RqIrpC9SyZCFNllwOmnUOXiA87O8ob',1596300315,1597509915);
INSERT INTO `user_tokens` VALUES (30,1,'eca1ebcc012310a44d4eb4b2bb9e8066aea61ca9','lmldcWk7QzuRlR7oUTQsVUmWTnckfOe6',1597847716,1599057316);
INSERT INTO `user_tokens` VALUES (31,2,'1ef9297aa114fee95f233626e3211492ee47ea1b','SwsArwd7jyNaIvQ2DedroLuphuWkaCSl',1599413215,1600622815);

#
# Source for table users
#

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `riverid` varchar(128) CHARACTER SET latin1 NOT NULL,
  `name` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(127) CHARACTER SET latin1 NOT NULL,
  `username` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `password` char(50) CHARACTER SET latin1 NOT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` int(10) unsigned DEFAULT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Flag incase admin opts in for email notifications',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `color` varchar(6) CHARACTER SET latin1 NOT NULL DEFAULT 'FF0000',
  `code` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `public_profile` tinyint(1) NOT NULL DEFAULT '1',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `needinfo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Stores registered usersâ€™ information';

#
# Dumping data for table users
#

INSERT INTO `users` VALUES (1,'','Administrator','cadic.tester@gmail.com','admin','e68276dfc8f9d82217b8dc48a9c3993ee5d5cd3b42a5f0fa83',113,1598471401,0,'2020-08-26 14:50:01','FF0000',NULL,1,0,1,0);
INSERT INTO `users` VALUES (2,'','Natalia Elisa Mesa Angel','nattikangel@gmail.com','nmesa','a16ff2adb280ebabde3f2b89cb70cf03de65da4c83bb0839d2',6,1599441488,1,'2020-09-06 20:18:08','FF0000',NULL,0,1,1,0);

#
# Source for table verified
#

CREATE TABLE `verified` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `verified_date` datetime DEFAULT NULL,
  `verified_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Stores all verified reports';

#
# Dumping data for table verified
#

INSERT INTO `verified` VALUES (1,1,1,'2020-06-11 21:17:40',0);
INSERT INTO `verified` VALUES (2,1,1,'2020-06-11 21:23:40',2);
INSERT INTO `verified` VALUES (3,1,1,'2020-06-11 21:24:23',1);
INSERT INTO `verified` VALUES (4,1,1,'2020-06-11 21:40:29',2);
INSERT INTO `verified` VALUES (5,1,1,'2020-06-11 21:51:02',1);
INSERT INTO `verified` VALUES (6,1,1,'2020-06-11 21:51:05',2);
INSERT INTO `verified` VALUES (7,1,1,'2020-06-11 21:51:16',1);
INSERT INTO `verified` VALUES (8,1,1,'2020-06-11 22:09:16',2);
INSERT INTO `verified` VALUES (9,2,1,'2020-06-11 22:34:44',0);
INSERT INTO `verified` VALUES (10,2,1,'2020-06-12 00:04:16',1);
INSERT INTO `verified` VALUES (11,1,1,'2020-06-12 00:04:23',1);
INSERT INTO `verified` VALUES (12,2310,1,'2020-06-24 19:33:27',1);
INSERT INTO `verified` VALUES (13,2310,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (14,2306,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (15,2305,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (16,2304,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (17,2303,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (18,2301,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (19,2302,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (20,2300,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (21,2299,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (22,2298,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (23,2297,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (24,2296,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (25,2294,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (26,2291,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (27,2290,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (28,2289,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (29,2288,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (30,2287,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (31,2286,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (32,2285,1,'2020-06-24 19:33:39',1);
INSERT INTO `verified` VALUES (33,2310,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (34,2306,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (35,2305,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (36,2304,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (37,2303,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (38,2301,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (39,2302,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (40,2300,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (41,2299,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (42,2298,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (43,2297,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (44,2296,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (45,2294,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (46,2291,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (47,2290,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (48,2289,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (49,2288,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (50,2287,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (51,2286,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (52,2285,1,'2020-06-24 19:34:15',1);
INSERT INTO `verified` VALUES (53,2310,1,'2020-06-24 19:34:45',2);
INSERT INTO `verified` VALUES (54,1,1,'2020-07-02 16:24:08',2);
INSERT INTO `verified` VALUES (55,1,1,'2020-07-02 16:24:50',1);
INSERT INTO `verified` VALUES (56,30,1,'2020-07-02 17:06:40',2);
INSERT INTO `verified` VALUES (57,4,1,'2020-07-04 04:32:43',0);
INSERT INTO `verified` VALUES (58,4,1,'2020-07-04 04:57:08',1);
INSERT INTO `verified` VALUES (59,4,1,'2020-07-04 04:57:47',1);
INSERT INTO `verified` VALUES (60,4,1,'2020-07-04 05:20:55',1);
INSERT INTO `verified` VALUES (61,4,1,'2020-07-04 05:21:05',1);
INSERT INTO `verified` VALUES (62,4,1,'2020-07-04 05:21:18',1);
INSERT INTO `verified` VALUES (63,4,1,'2020-07-04 05:22:19',1);
INSERT INTO `verified` VALUES (64,61,1,'2020-07-12 01:19:16',1);
INSERT INTO `verified` VALUES (65,61,1,'2020-07-12 01:19:19',1);
INSERT INTO `verified` VALUES (66,61,1,'2020-07-12 01:20:09',1);
INSERT INTO `verified` VALUES (67,62,1,'2020-07-12 02:04:55',0);
INSERT INTO `verified` VALUES (68,1,1,'2020-08-01 12:29:25',1);
INSERT INTO `verified` VALUES (69,1,1,'2020-08-01 12:29:28',1);

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
