/* SQL Manager Lite for MySQL                              5.6.4.50082 */
/* ------------------------------------------------------------------- */
/* Host     : localhost                                                */
/* Port     : 3306                                                     */
/* Database : fitpos_db                                                */


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES 'utf8' */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `fitpos_db`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `fitpos_db`;

/* Structure for the `migration_versions` table : */

CREATE TABLE `migration_versions` (
  `version` VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY USING BTREE (`version`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci'
;

/* Structure for the `t_accompagnemement` table : */

CREATE TABLE `t_accompagnemement` (
  `lg_ACCOMPAGNEMENT_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ACCOMPAGNEMENT_ID`),
  UNIQUE KEY `lg_ACCOMPAGNEMENT_ID` USING BTREE (`lg_ACCOMPAGNEMENT_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_alert_event` table : */

CREATE TABLE `t_alert_event` (
  `dt_Date_Envoi` DATETIME DEFAULT NULL,
  `int_Max_Messages` INTEGER(11) DEFAULT NULL,
  `str_Event` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `b_IsCommand` TINYINT(1) DEFAULT NULL,
  `str_SMS_English_Text` TEXT COLLATE latin1_swedish_ci,
  `dec_Num_Percent` DECIMAL(15,6) DEFAULT NULL,
  `str_MAIL_English_Text` TEXT COLLATE latin1_swedish_ci,
  `b_Row_Active` TINYINT(1) DEFAULT NULL,
  `str_SMS_French_Text` TEXT COLLATE latin1_swedish_ci,
  `lg_UID_Who_New` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_UID_Who_Last_Update` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_MAIL_French_Text` TEXT COLLATE latin1_swedish_ci,
  `dt_Last_Enter_Date` DATETIME DEFAULT NULL,
  `str_ERROR_CODE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`str_Event`),
  UNIQUE KEY `str_Event` USING BTREE (`str_Event`)
) ENGINE=InnoDB
CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_skin` table : */

CREATE TABLE `t_skin` (
  `lg_SKIN_ID` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `str_RESOURCE` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DETAIL_PATH` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_SKIN_ID`)
) ENGINE=InnoDB
CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_language` table : */

CREATE TABLE `t_language` (
  `lg_Language_ID` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `str_Local_Cty` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT 'fr',
  `str_Local_Lg` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT 'FR',
  `str_Code` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT 'ml_French',
  `str_Description` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_Language_ID`)
) ENGINE=InnoDB
CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_user` table : */

CREATE TABLE `t_user` (
  `lg_USER_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_LOGIN` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `password` VARCHAR(200) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_CREATED_BY` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_UPDATED_BY` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_FIRST_NAME` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_LAST_NAME` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_LAST_CONNECTION_DATE` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_LAST_ACTIVITY` DATETIME DEFAULT NULL,
  `FUNCTION` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_PHONE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_MAIL` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_Language_ID` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_SKIN_ID` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_IDS` INTEGER(11) DEFAULT NULL,
  `b_CHANGE_PASSWORD` TINYINT(1) DEFAULT NULL,
  `int_CONNEXION` INTEGER(11) DEFAULT NULL,
  `str_FUNCTION` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_EMPLACEMENT_ID` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `b_is_connected` TINYINT(1) DEFAULT NULL,
  `is_active` TINYINT(1) DEFAULT 0,
  PRIMARY KEY USING BTREE (`lg_USER_ID`),
  UNIQUE KEY `str_LOGIN` USING BTREE (`str_LOGIN`),
  KEY `lg_SKIN_ID` USING BTREE (`lg_SKIN_ID`),
  KEY `lg_Language_ID` USING BTREE (`lg_Language_ID`),
  CONSTRAINT `t_user_fk` FOREIGN KEY (`lg_SKIN_ID`) REFERENCES `t_skin` (`lg_SKIN_ID`),
  CONSTRAINT `t_user_fk1` FOREIGN KEY (`lg_Language_ID`) REFERENCES `t_language` (`lg_Language_ID`)
) ENGINE=InnoDB
AVG_ROW_LENGTH=8192 ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_user_fone` table : */

CREATE TABLE `t_user_fone` (
  `lg_USER_FONE_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `str_PHONE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_USER_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY USING BTREE (`lg_USER_FONE_ID`),
  KEY `FK_t_user_fone_lg_USER_ID` USING BTREE (`lg_USER_ID`),
  CONSTRAINT `FK_t_user_fone_lg_USER_ID` FOREIGN KEY (`lg_USER_ID`) REFERENCES `t_user` (`lg_USER_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_alert_event_user_fone` table : */

CREATE TABLE `t_alert_event_user_fone` (
  `lg_ID` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `str_Event` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_USER_FONE_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ID`),
  KEY `str_Event` USING BTREE (`str_Event`),
  KEY `lg_USER_FONE_ID` USING BTREE (`lg_USER_FONE_ID`),
  CONSTRAINT `t_alert_event_user_fone_fk` FOREIGN KEY (`str_Event`) REFERENCES `t_alert_event` (`str_Event`),
  CONSTRAINT `t_alert_event_user_fone_fk1` FOREIGN KEY (`lg_USER_FONE_ID`) REFERENCES `t_user_fone` (`lg_USER_FONE_ID`)
) ENGINE=InnoDB
AVG_ROW_LENGTH=2730 ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_batiment` table : */

CREATE TABLE `t_batiment` (
  `lg_BATIMENT_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_BATIMENT_ID`),
  UNIQUE KEY `lg_BATIMENT_ID` USING BTREE (`lg_BATIMENT_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_caisse` table : */

CREATE TABLE `t_caisse` (
  `lg_CAISSE_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `int_SOLDE` INTEGER(11) DEFAULT NULL,
  `lg_USER_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `lg_CREATED_BY` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `lg_UPDATED_BY` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_CAISSE_ID`),
  KEY `lg_USER_ID` USING BTREE (`lg_USER_ID`),
  CONSTRAINT `t_caisse_fk1` FOREIGN KEY (`lg_USER_ID`) REFERENCES `t_user` (`lg_USER_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_cash_transaction` table : */

CREATE TABLE `t_cash_transaction` (
  `ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `str_TRANSACTION_REF` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_AMOUNT` INTEGER(11) DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `lg_CREATED_BY` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `lg_UPDATED_BY` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(2000) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_USER_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_AMOUNT_DEBIT` INTEGER(11) DEFAULT 0,
  `int_AMOUNT_CREDIT` INTEGER(11) DEFAULT 0,
  `str_NUMERO_COMPTE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT '0000001',
  PRIMARY KEY USING BTREE (`ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_services` table : */

CREATE TABLE `t_services` (
  `lg_SERVICES_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_SERVICES_ID`),
  UNIQUE KEY `lg_SERVICES_ID` USING BTREE (`lg_SERVICES_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_etage` table : */

CREATE TABLE `t_etage` (
  `lg_ETAGE_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `lg_BATIMENT_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_NAME` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ETAGE_ID`),
  UNIQUE KEY `lg_ETAGE_ID` USING BTREE (`lg_ETAGE_ID`),
  KEY `lg_BATIMENT_ID` USING BTREE (`lg_BATIMENT_ID`),
  CONSTRAINT `t_etage_fk` FOREIGN KEY (`lg_BATIMENT_ID`) REFERENCES `t_batiment` (`lg_BATIMENT_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_chambre` table : */

CREATE TABLE `t_chambre` (
  `lg_CHAMBRE_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `lg_ETAGE_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_NAME` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_SERVICES_ID` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_CHAMBRE_ID`),
  UNIQUE KEY `lg_CHAMBRE_ID` USING BTREE (`lg_CHAMBRE_ID`),
  KEY `lg_ETAGE_ID` USING BTREE (`lg_ETAGE_ID`),
  KEY `lg_SERVICES_ID` USING BTREE (`lg_SERVICES_ID`),
  CONSTRAINT `[OwnerName]_fk[num_for_dupddddd]` FOREIGN KEY (`lg_SERVICES_ID`) REFERENCES `t_services` (`lg_SERVICES_ID`),
  CONSTRAINT `t_chambre_fk` FOREIGN KEY (`lg_ETAGE_ID`) REFERENCES `t_etage` (`lg_ETAGE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_channel` table : */

CREATE TABLE `t_channel` (
  `lg_CHANNEL_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_LIBELLE` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_NOTIFICATION_TYPE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_NOTIFICATION_PORT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_CHANNEL_ID`),
  UNIQUE KEY `lg_CHANNEL_ID` USING BTREE (`lg_CHANNEL_ID`)
) ENGINE=InnoDB
CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_ci_carte` table : */

CREATE TABLE `t_ci_carte` (
  `lg_CI_CARTE_ID` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_PICTURE` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  `b_IS_SUGGEST` TINYINT(1) DEFAULT 0,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_PIC_ORIGINALE` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_SMALL` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_MIDDLE` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_BIG` TEXT COLLATE latin1_swedish_ci,
  PRIMARY KEY USING BTREE (`lg_CI_CARTE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_ci_type_carte` table : */

CREATE TABLE `t_ci_type_carte` (
  `lg_CI_TYPE_CARTE_ID` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `lg_CI_CARTE_ID` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_PICTURE` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  `b_IS_SUGGEST` TINYINT(1) DEFAULT 0,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_PIC_ORIGINALE` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_SMALL` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_MIDDLE` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_BIG` TEXT COLLATE latin1_swedish_ci,
  PRIMARY KEY USING BTREE (`lg_CI_TYPE_CARTE_ID`),
  KEY `t_ci_type_carte_fk` USING BTREE (`lg_CI_CARTE_ID`),
  CONSTRAINT `t_ci_type_carte_fk` FOREIGN KEY (`lg_CI_CARTE_ID`) REFERENCES `t_ci_carte` (`lg_CI_CARTE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_ci_plat` table : */

CREATE TABLE `t_ci_plat` (
  `lg_CI_PLAT_ID` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_PICTURE` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  `b_IS_SUGGEST` TINYINT(1) DEFAULT 0,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `lg_CI_TYPE_CARTE_ID` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `str_PIC_ORIGINALE` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_SMALL` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_MIDDLE` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_BIG` TEXT COLLATE latin1_swedish_ci,
  `int_PRIX` INTEGER(11) DEFAULT 0,
  PRIMARY KEY USING BTREE (`lg_CI_PLAT_ID`),
  KEY `lg_CI_TYPE_CARTE_ID` USING BTREE (`lg_CI_TYPE_CARTE_ID`),
  CONSTRAINT `t_ci_plat_fk` FOREIGN KEY (`lg_CI_TYPE_CARTE_ID`) REFERENCES `t_ci_type_carte` (`lg_CI_TYPE_CARTE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_coffre_caisse` table : */

CREATE TABLE `t_coffre_caisse` (
  `ID_COFFRE_CAISSE` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `lg_USER_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_AMOUNT` INTEGER(11) DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `ld_CREATED_BY` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `ld_UPDATED_BY` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_STATUT` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`ID_COFFRE_CAISSE`),
  KEY `lg_USER_ID` USING BTREE (`lg_USER_ID`),
  CONSTRAINT `t_coffre_caisse_fk` FOREIGN KEY (`lg_USER_ID`) REFERENCES `t_user` (`lg_USER_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_commentaire` table : */

CREATE TABLE `t_commentaire` (
  `lg_COMMENTAIRE_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_COMMENTAIRE_ID`),
  UNIQUE KEY `lg_COMMENTAIRE_ID` USING BTREE (`lg_COMMENTAIRE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_cs_claviers` table : */

CREATE TABLE `t_cs_claviers` (
  `lg_CS_CLAVIERS_ID` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_CS_CLAVIERS_ID`),
  UNIQUE KEY `lg_CS_CLAVIERS_ID` USING BTREE (`lg_CS_CLAVIERS_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_cs_fenetres` table : */

CREATE TABLE `t_cs_fenetres` (
  `lg_CS_FENETRES_ID` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `lg_CS_CLAVIERS_ID` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_NAME` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_CS_FENETRES_ID`),
  UNIQUE KEY `lg_C_FENETRES_ID` USING BTREE (`lg_CS_FENETRES_ID`),
  KEY `lg_CS_CLAVIERS_ID` USING BTREE (`lg_CS_CLAVIERS_ID`),
  CONSTRAINT `t_cs_fenetres_fk` FOREIGN KEY (`lg_CS_CLAVIERS_ID`) REFERENCES `t_cs_claviers` (`lg_CS_CLAVIERS_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_cs_sous_fenetres` table : */

CREATE TABLE `t_cs_sous_fenetres` (
  `lg_CS_SOUS_FENETRES_ID` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `lg_CS_FENETRES_ID` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_NAME` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_CS_SOUS_FENETRES_ID`),
  UNIQUE KEY `lg_CS_SOUS_FENETRES_ID` USING BTREE (`lg_CS_SOUS_FENETRES_ID`),
  KEY `lg_CS_FENETRES_ID` USING BTREE (`lg_CS_FENETRES_ID`),
  CONSTRAINT `t_cs_sous_fenetres_fk` FOREIGN KEY (`lg_CS_FENETRES_ID`) REFERENCES `t_cs_fenetres` (`lg_CS_FENETRES_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_customer` table : */

CREATE TABLE `t_customer` (
  `lg_CUSTOMER_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `str_LOGIN` VARCHAR(208) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_PASSWORD` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_FIRST_NAME` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_LAST_NAME` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_LAST_CONNECTION_DATE` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_SKIN_ID` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_Language_ID` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_LAST_ACTIVITY` DATETIME DEFAULT NULL,
  `FUNCTION` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_PHONE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_MAIL` VARCHAR(208) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_ADRESSE` TEXT COLLATE latin1_swedish_ci,
  `str_GPS` TEXT COLLATE latin1_swedish_ci,
  `str_AUTH_METHODE` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT 'FLEX_COMPTA',
  `str_UID_EXT` TEXT COLLATE latin1_swedish_ci,
  PRIMARY KEY USING BTREE (`lg_CUSTOMER_ID`),
  UNIQUE KEY `lg_CUSTOMER_ID` USING BTREE (`lg_CUSTOMER_ID`),
  UNIQUE KEY `str_LOGIN` USING BTREE (`str_LOGIN`),
  KEY `t_customer_fk` USING BTREE (`lg_Language_ID`),
  KEY `t_customer_fk1` USING BTREE (`lg_SKIN_ID`),
  CONSTRAINT `t_customer_fk` FOREIGN KEY (`lg_Language_ID`) REFERENCES `t_language` (`lg_Language_ID`),
  CONSTRAINT `t_customer_fk1` FOREIGN KEY (`lg_SKIN_ID`) REFERENCES `t_skin` (`lg_SKIN_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_customer_account` table : */

CREATE TABLE `t_customer_account` (
  `lg_CUSTOMER_ACCOUNT_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `lg_CUSTOMER_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `int_SOLDE` INTEGER(11) DEFAULT 0,
  `int_SOLDE_MINIMAL` INTEGER(11) DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_PASSWORD` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_LOGIN` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_CUSTOMER_ACCOUNT_ID`),
  UNIQUE KEY `lg_CUSTOMER_ACCOUNT_ID` USING BTREE (`lg_CUSTOMER_ACCOUNT_ID`),
  KEY `t_customer_account_fk` USING BTREE (`lg_CUSTOMER_ID`),
  CONSTRAINT `t_customer_account_fk` FOREIGN KEY (`lg_CUSTOMER_ID`) REFERENCES `t_customer` (`lg_CUSTOMER_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_institutions` table : */

CREATE TABLE `t_institutions` (
  `lg_INSTITUTION_ID` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_ADRESSE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_EMAIL` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_LOGO_LARGE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_LOGO_MIDDLE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_LOGO_SMALL` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_NUM_CONTRIBUABLE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_PARAM_1` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_PARAM_2` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_PARAM_3` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_PHONE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_GPS` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_INSTITUTION_ID`),
  UNIQUE KEY `lg_INSTITUTION_ID` USING BTREE (`lg_INSTITUTION_ID`),
  UNIQUE KEY `lg_INSTITUTION_ID_2` USING BTREE (`lg_INSTITUTION_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_customer_institutions` table : */

CREATE TABLE `t_customer_institutions` (
  `lg_CUSTOMER_INSTITUTIONS_ID` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `lg_INSTITUTION_ID` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_CUSTOMER_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_CUSTOMER_INSTITUTIONS_ID`),
  UNIQUE KEY `lg_CUSTOMER_INSTITUTIONS_ID` USING BTREE (`lg_CUSTOMER_INSTITUTIONS_ID`),
  KEY `lg_CUSTOMER_ID` USING BTREE (`lg_CUSTOMER_ID`),
  KEY `t_customer_institutions_fk` USING BTREE (`lg_INSTITUTION_ID`),
  CONSTRAINT `t_customer_institutions_fk` FOREIGN KEY (`lg_INSTITUTION_ID`) REFERENCES `t_institutions` (`lg_INSTITUTION_ID`),
  CONSTRAINT `t_customer_institutions_fk1` FOREIGN KEY (`lg_CUSTOMER_ID`) REFERENCES `t_customer` (`lg_CUSTOMER_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_schema_carte` table : */

CREATE TABLE `t_schema_carte` (
  `lg_SCHEMA_CARTE_ID` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `str_DESCRIPTION` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_NAME` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_INSTITUTION_ID` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_SCHEMA_CARTE_ID`),
  UNIQUE KEY `lg_SCHEMA_CARTE_ID` USING BTREE (`lg_SCHEMA_CARTE_ID`),
  KEY `lg_INSTITUTION_ID` USING BTREE (`lg_INSTITUTION_ID`),
  CONSTRAINT `t_schema_carte_fk` FOREIGN KEY (`lg_INSTITUTION_ID`) REFERENCES `t_institutions` (`lg_INSTITUTION_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_decoupe` table : */

CREATE TABLE `t_decoupe` (
  `lg_DECOUPE_ID` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_CENTER` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_SCHEMA_CARTE_ID` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_INDEX` INTEGER(11) DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_DECOUPE_ID`),
  UNIQUE KEY `lg_DECOUPE_ID` USING BTREE (`lg_DECOUPE_ID`),
  KEY `lg_SCHEMA_CARTE_ID` USING BTREE (`lg_SCHEMA_CARTE_ID`),
  CONSTRAINT `t_decoupe_fk` FOREIGN KEY (`lg_SCHEMA_CARTE_ID`) REFERENCES `t_schema_carte` (`lg_SCHEMA_CARTE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_type_depense` table : */

CREATE TABLE `t_type_depense` (
  `lg_TYPE_DEPENSE_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `str_TYPE_DEPENSE` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_NUMERO_COMPTE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_TYPE_DEPENSE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_depenses` table : */

CREATE TABLE `t_depenses` (
  `ID_DEPENSE` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `lg_TYPE_DEPENSE_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `str_CREATED_BY` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_UPDATED_BY` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_AMOUNT` DOUBLE(15,3) DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(2000) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_REF_FACTURE` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`ID_DEPENSE`),
  KEY `lg_TYPE_DEPENSE_ID` USING BTREE (`lg_TYPE_DEPENSE_ID`),
  CONSTRAINT `t_depenses_fk` FOREIGN KEY (`lg_TYPE_DEPENSE_ID`) REFERENCES `t_type_depense` (`lg_TYPE_DEPENSE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_entity_map` table : */

CREATE TABLE `t_entity_map` (
  `lg_ENTITY_MAP_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` TEXT COLLATE latin1_swedish_ci,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `lg_SCHEMA_CARTE_ID` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `lg_DECOUPE_ID` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_LAST_AFFECTATION_DATE` DATETIME DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_COORDONNE_GPS` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_SVG_DATA_IN` TEXT COLLATE latin1_swedish_ci,
  `str_SVG_DATA` LONGTEXT COLLATE latin1_swedish_ci,
  `str_SVG_REF` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_SVG_DATA_TEXT` TEXT COLLATE latin1_swedish_ci,
  `str_SVG_FONT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_STROKE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_INDEX` INTEGER(11) DEFAULT 20,
  `str_TYPEBLOCK` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT 'SIMPLE',
  `str_STROKE_WIDTH` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT '1',
  `lg_PARENT_lg_ENTITY_MAP_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ENTITY_MAP_ID`),
  UNIQUE KEY `lg_ENTITY_MAP_ID` USING BTREE (`lg_ENTITY_MAP_ID`),
  KEY `lg_SCHEMA_CARTE_ID` USING BTREE (`lg_SCHEMA_CARTE_ID`),
  KEY `lg_DECOUPE_ID` USING BTREE (`lg_DECOUPE_ID`),
  CONSTRAINT `t_entity_map_fk1` FOREIGN KEY (`lg_DECOUPE_ID`) REFERENCES `t_decoupe` (`lg_DECOUPE_ID`)
) ENGINE=InnoDB
AVG_ROW_LENGTH=13824 ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_event_log` table : */

CREATE TABLE `t_event_log` (
  `lg_EVENT_LOG_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `MATRICULE_ELEVE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(2000) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_CREATED_BY` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_UPDATED_BY` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_TABLE_CONCERN` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_MODULE_CONCERN` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_EVENT_LOG_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_famille` table : */

CREATE TABLE `t_famille` (
  `lg_FAMILLE_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_PIC_ORIGINALE` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_SMALL` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_MIDDLE` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_BIG` TEXT COLLATE latin1_swedish_ci,
  PRIMARY KEY USING BTREE (`lg_FAMILLE_ID`),
  UNIQUE KEY `lg_FAMILLE_ID` USING BTREE (`lg_FAMILLE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_file_data_patient` table : */

CREATE TABLE `t_file_data_patient` (
  `lg_ID` VARCHAR(40) COLLATE utf8_general_ci NOT NULL,
  `str_KEY` VARCHAR(40) COLLATE utf8_general_ci DEFAULT NULL,
  `str_FILE_NAME` VARCHAR(40) COLLATE utf8_general_ci DEFAULT NULL,
  `LIT` VARCHAR(40) COLLATE utf8_general_ci DEFAULT NULL,
  `DOSSIER` VARCHAR(40) COLLATE utf8_general_ci DEFAULT NULL,
  `PATIENT` VARCHAR(40) COLLATE utf8_general_ci DEFAULT NULL,
  `MEDECIN` VARCHAR(40) COLLATE utf8_general_ci DEFAULT NULL,
  `PAYMENT` VARCHAR(40) COLLATE utf8_general_ci DEFAULT NULL,
  `ORGANISME` VARCHAR(40) COLLATE utf8_general_ci DEFAULT NULL,
  `DATE_ENTREE` DATE DEFAULT NULL,
  `DATE_SORTIE` DATE DEFAULT NULL,
  `I_P_P` VARCHAR(40) COLLATE utf8_general_ci DEFAULT NULL,
  `SERVICES` VARCHAR(40) COLLATE utf8_general_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `str_CREATED_BY` VARCHAR(40) COLLATE utf8_general_ci DEFAULT NULL,
  `KEY_CHAMBRE` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `KEY_LIT` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `KEY_ETAGE` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Structure for the `t_imprimante` table : */

CREATE TABLE `t_imprimante` (
  `lg_IMPRIMANTE_ID` VARCHAR(40) COLLATE utf8_general_ci NOT NULL,
  `str_NAME` TEXT COLLATE utf8_general_ci,
  `str_DESCRIPTION` TEXT COLLATE utf8_general_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(40) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_IMPRIMANTE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Structure for the `t_inboud_message` table : */

CREATE TABLE `t_inboud_message` (
  `lg_INBOUND_MESSAGE_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_MESSAGE` TEXT COLLATE latin1_swedish_ci NOT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_PHONE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_INBOUND_MESSAGE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_jour_semaine` table : */

CREATE TABLE `t_jour_semaine` (
  `lg_JOUR_SEMAINE_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_JOUR_SEMAINE_ID`),
  UNIQUE KEY `lg_JOUR_SEMAINE_ID` USING BTREE (`lg_JOUR_SEMAINE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_lit` table : */

CREATE TABLE `t_lit` (
  `lg_LIT_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `lg_CHAMBRE_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_NAME` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_LIT_ID`),
  UNIQUE KEY `lg_LIT_ID` USING BTREE (`lg_LIT_ID`),
  KEY `lg_CHAMBRE_ID` USING BTREE (`lg_CHAMBRE_ID`),
  CONSTRAINT `t_lit_fk` FOREIGN KEY (`lg_CHAMBRE_ID`) REFERENCES `t_chambre` (`lg_CHAMBRE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_lit_occupation` table : */

CREATE TABLE `t_lit_occupation` (
  `lg_LIT_OCCUPATION_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `lg_LIT_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_NAME` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_CUSTOMER_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_LIT_OCCUPATION_ID`),
  UNIQUE KEY `lg_LIT_OCCUPATION_ID` USING BTREE (`lg_LIT_OCCUPATION_ID`),
  KEY `lg_LIT_ID` USING BTREE (`lg_LIT_ID`),
  KEY `lg_CUSTOMER_ID` USING BTREE (`lg_CUSTOMER_ID`),
  CONSTRAINT `t_lit_occupation_fk` FOREIGN KEY (`lg_LIT_ID`) REFERENCES `t_lit` (`lg_LIT_ID`),
  CONSTRAINT `t_lit_occupation_fk2` FOREIGN KEY (`lg_CUSTOMER_ID`) REFERENCES `t_customer` (`lg_CUSTOMER_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_lit_occupation_statut` table : */

CREATE TABLE `t_lit_occupation_statut` (
  `lg_LIT_OCCUPATION_STATUT_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `lg_LIT_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_NAME` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_CUSTOMER_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_DATE` DATE DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_LIT_OCCUPATION_STATUT_ID`),
  UNIQUE KEY `lg_LIT_OCCUPATION_STATUT_ID` USING BTREE (`lg_LIT_OCCUPATION_STATUT_ID`),
  KEY `lg_LIT_ID` USING BTREE (`lg_LIT_ID`),
  KEY `lg_CUSTOMER_ID` USING BTREE (`lg_CUSTOMER_ID`),
  CONSTRAINT `t_lit_occupation_statut_fk` FOREIGN KEY (`lg_LIT_ID`) REFERENCES `t_lit` (`lg_LIT_ID`),
  CONSTRAINT `t_lit_occupation_statut_fk2` FOREIGN KEY (`lg_CUSTOMER_ID`) REFERENCES `t_customer` (`lg_CUSTOMER_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_module` table : */

CREATE TABLE `t_module` (
  `lg_MODULE_ID` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `str_VALUE` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(200) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_PRIORITY` INTEGER(11) DEFAULT 0,
  `str_Status` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `P_KEY` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_Link` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_Icone` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_Icone_hover` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_Icone_out` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_Link_default` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_MODULE_ID`),
  UNIQUE KEY `lg_MODULE_ID` USING BTREE (`lg_MODULE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_menu` table : */

CREATE TABLE `t_menu` (
  `lg_MENU_ID` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `str_VALUE` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(200) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_PRIORITY` INTEGER(11) DEFAULT 0,
  `str_Status` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `P_KEY` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_MODULE_ID` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_MENU_ID`),
  UNIQUE KEY `lg_MENU_ID` USING BTREE (`lg_MENU_ID`),
  KEY `lg_MODULE_ID` USING BTREE (`lg_MODULE_ID`),
  CONSTRAINT `t_menu_fk` FOREIGN KEY (`lg_MODULE_ID`) REFERENCES `t_module` (`lg_MODULE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_menu_repas` table : */

CREATE TABLE `t_menu_repas` (
  `lg_MENU_REPAS_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `lg_JOUR_SEMAINE_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_NAME` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_AMOUNT` INTEGER(11) DEFAULT 0,
  `str_PIC_ORIGINALE` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_SMALL` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_MIDDLE` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_BIG` TEXT COLLATE latin1_swedish_ci,
  PRIMARY KEY USING BTREE (`lg_MENU_REPAS_ID`),
  UNIQUE KEY `lg_MENU_REPAS_ID` USING BTREE (`lg_MENU_REPAS_ID`),
  KEY `lg_JOUR_SEMAINE_ID` USING BTREE (`lg_JOUR_SEMAINE_ID`),
  CONSTRAINT `[OwnerName]_fk[num_for_dup1545]` FOREIGN KEY (`lg_JOUR_SEMAINE_ID`) REFERENCES `t_jour_semaine` (`lg_JOUR_SEMAINE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_product_item` table : */

CREATE TABLE `t_product_item` (
  `lg_PRODUCT_ITEM_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_PRICE` INTEGER(11) DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `int_STOCK_MINIMAL` INTEGER(11) DEFAULT 0,
  `str_PIC_ORIGINALE` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_SMALL` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_MIDDLE` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_BIG` TEXT COLLATE latin1_swedish_ci,
  `b_IS_COMMENTAIRE` TINYINT(1) DEFAULT 0,
  `b_IS_COMPILATION` TINYINT(1) DEFAULT 0,
  `b_IS_FOR_SALE` TINYINT(1) DEFAULT 0,
  `b_IS_IN_CA` TINYINT(1) DEFAULT NULL,
  `b_IS_PROGRAMMABLE_PRICE` TINYINT(1) DEFAULT NULL,
  `b_IS_REMISED` TINYINT(1) DEFAULT 0,
  `lg_FAMILLE_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL DEFAULT '1',
  `int_PRIX_ACHAT` INTEGER(11) DEFAULT 0,
  PRIMARY KEY USING BTREE (`lg_PRODUCT_ITEM_ID`),
  UNIQUE KEY `lg_PRODUCT_ITEM_ID` USING BTREE (`lg_PRODUCT_ITEM_ID`),
  KEY `lg_FAMILLE_ID` USING BTREE (`lg_FAMILLE_ID`),
  CONSTRAINT `t_product_item_fk` FOREIGN KEY (`lg_FAMILLE_ID`) REFERENCES `t_famille` (`lg_FAMILLE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_menu_repas_product_item` table : */

CREATE TABLE `t_menu_repas_product_item` (
  `lg_MENU_REPAS_PRODUCT_ITEM_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `lg_MENU_REPAS_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_PRODUCT_ITEM_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_NAME` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_MENU_REPAS_PRODUCT_ITEM_ID`),
  UNIQUE KEY `lg_MENU_REPAS_PRODUCT_ITEM_ID` USING BTREE (`lg_MENU_REPAS_PRODUCT_ITEM_ID`),
  UNIQUE KEY `lg_MENU_REPAS_ID_uk` USING BTREE (`lg_MENU_REPAS_ID`, `lg_PRODUCT_ITEM_ID`, `str_NAME`),
  KEY `lg_MENU_REPAS_ID` USING BTREE (`lg_MENU_REPAS_ID`),
  KEY `lg_PRODUCT_ITEM_ID` USING BTREE (`lg_PRODUCT_ITEM_ID`),
  CONSTRAINT `[OwnerName]_fk[num_for_dup1405555]` FOREIGN KEY (`lg_PRODUCT_ITEM_ID`) REFERENCES `t_product_item` (`lg_PRODUCT_ITEM_ID`),
  CONSTRAINT `[OwnerName]_fk[num_for_dup145878]` FOREIGN KEY (`lg_MENU_REPAS_ID`) REFERENCES `t_menu_repas` (`lg_MENU_REPAS_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_message` table : */

CREATE TABLE `t_message` (
  `lg_MESSAGE_ID` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `str_MESSAGE` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT 'enable',
  PRIMARY KEY USING BTREE (`lg_MESSAGE_ID`),
  UNIQUE KEY `lg_MESSAGE_ID` USING BTREE (`lg_MESSAGE_ID`)
) ENGINE=InnoDB
CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_type_reglement` table : */

CREATE TABLE `t_type_reglement` (
  `lg_TYPE_REGLEMENT_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_TYPE_REGLEMENT_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_mode_reglement` table : */

CREATE TABLE `t_mode_reglement` (
  `lg_MODE_REGLEMENT_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_TYPE_REGLEMENT_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_MODE_REGLEMENT_ID`),
  UNIQUE KEY `lg_MODE_REGLEMENT` USING BTREE (`lg_MODE_REGLEMENT_ID`),
  KEY `lg_TYPE_REGLEMENT_ID` USING BTREE (`lg_TYPE_REGLEMENT_ID`),
  CONSTRAINT `t_mode_reglement_fk` FOREIGN KEY (`lg_TYPE_REGLEMENT_ID`) REFERENCES `t_type_reglement` (`lg_TYPE_REGLEMENT_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_mouvement` table : */

CREATE TABLE `t_mouvement` (
  `lg_MOUVEMENT_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `lg_FAMILLE_ID` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `lg_USER_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `P_KEY` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `str_TYPE_ACTION` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `str_ACTION` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `dt_DAY` DATE DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_NUMBER` INTEGER(11) DEFAULT 0,
  `int_STOCK_JOUR` INTEGER(11) DEFAULT 0,
  `int_NUMBERTRANSACTION` INTEGER(11) DEFAULT 0,
  PRIMARY KEY USING BTREE (`lg_MOUVEMENT_ID`),
  KEY `FK_t_mouvement_t_famille` USING BTREE (`lg_FAMILLE_ID`),
  KEY `FK_t_mouvement_t_user` USING BTREE (`lg_USER_ID`),
  CONSTRAINT `FK_t_mouvement_t_famille` FOREIGN KEY (`lg_FAMILLE_ID`) REFERENCES `t_famille` (`lg_FAMILLE_ID`),
  CONSTRAINT `FK_t_mouvement_t_user` FOREIGN KEY (`lg_USER_ID`) REFERENCES `t_user` (`lg_USER_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_mouvement_snapshot` table : */

CREATE TABLE `t_mouvement_snapshot` (
  `lg_MOUVEMENT_SNAPSHOT_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `lg_FAMILLE_ID` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_DAY` DATE DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_STOCK_JOUR` INTEGER(11) DEFAULT 0,
  `int_NUMBERTRANSACTION` INTEGER(11) DEFAULT 0,
  PRIMARY KEY USING BTREE (`lg_MOUVEMENT_SNAPSHOT_ID`),
  KEY `FK_t_mouvement_snapshot_t_famille` USING BTREE (`lg_FAMILLE_ID`),
  CONSTRAINT `FK_t_mouvement_snapshot_t_famille` FOREIGN KEY (`lg_FAMILLE_ID`) REFERENCES `t_famille` (`lg_FAMILLE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_mouvementprice` table : */

CREATE TABLE `t_mouvementprice` (
  `lg_MOUVEMENTPRICE_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `lg_FAMILLE_ID` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_USER_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `str_ACTION` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `dt_DAY` DATE DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_PRICE_OLD` INTEGER(11) DEFAULT 0,
  `int_PRICE_NEW` INTEGER(11) DEFAULT 0,
  `int_ECART` INTEGER(11) DEFAULT 0,
  PRIMARY KEY USING BTREE (`lg_MOUVEMENTPRICE_ID`),
  KEY `FK_t_mouvementprice_t_famille` USING BTREE (`lg_FAMILLE_ID`),
  KEY `FK_t_mouvementprice_t_user` USING BTREE (`lg_USER_ID`),
  CONSTRAINT `FK_t_mouvementprice_t_famille` FOREIGN KEY (`lg_FAMILLE_ID`) REFERENCES `t_famille` (`lg_FAMILLE_ID`),
  CONSTRAINT `FK_t_mouvementprice_t_user` FOREIGN KEY (`lg_USER_ID`) REFERENCES `t_user` (`lg_USER_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_type_mvt_caisse` table : */

CREATE TABLE `t_type_mvt_caisse` (
  `lg_TYPE_MVT_CAISSE_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_CODE_COMPTABLE` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_CODE_REGROUPEMENT` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_TYPE_MVT_CAISSE_ID`),
  UNIQUE KEY `lg_TYPE_MVT_CAISSE_ID` USING BTREE (`lg_TYPE_MVT_CAISSE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_mvt_caisse` table : */

CREATE TABLE `t_mvt_caisse` (
  `lg_MVT_CAISSE_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `lg_TYPE_MVT_CAISSE_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `lg_USER_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_NUM_COMPTE` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_NUM_PIECE_COMPTABLE` TEXT COLLATE latin1_swedish_ci,
  `lg_MODE_REGLEMENT_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_AMOUNT` DOUBLE(15,3) DEFAULT NULL,
  `dt_DATE_MVT` DATETIME DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_CREATED_BY` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_UPDATED_BY` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_MVT_CAISSE_ID`),
  KEY `lg_TYPE_MVT_CAISSE_ID` USING BTREE (`lg_TYPE_MVT_CAISSE_ID`),
  KEY `lg_MODE_REGLEMENT_ID` USING BTREE (`lg_MODE_REGLEMENT_ID`),
  KEY `str_CREATED_BY` USING BTREE (`str_CREATED_BY`),
  CONSTRAINT `t_mvt_caisse_fk` FOREIGN KEY (`lg_TYPE_MVT_CAISSE_ID`) REFERENCES `t_type_mvt_caisse` (`lg_TYPE_MVT_CAISSE_ID`),
  CONSTRAINT `t_mvt_caisse_fk1` FOREIGN KEY (`lg_MODE_REGLEMENT_ID`) REFERENCES `t_mode_reglement` (`lg_MODE_REGLEMENT_ID`),
  CONSTRAINT `t_mvt_caisse_fk2` FOREIGN KEY (`str_CREATED_BY`) REFERENCES `t_user` (`lg_USER_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_notification` table : */

CREATE TABLE `t_notification` (
  `lg_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `lg_USER_ID_IN` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_USER_ID_OUT` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(200) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_CONTENT` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_TYPE` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_REF_RESSOURCE` TEXT COLLATE latin1_swedish_ci,
  `str_CUST_ACCOUNT_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_URL_PIC` TEXT COLLATE latin1_swedish_ci,
  `str_NAME` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_CHANNEL` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_CHANNEL_READ` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_GPS` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ID`),
  KEY `lg_USER_ID_IN` USING BTREE (`lg_USER_ID_IN`),
  KEY `lg_USER_ID_OUT` USING BTREE (`lg_USER_ID_OUT`),
  CONSTRAINT `t_notification_fk` FOREIGN KEY (`lg_USER_ID_IN`) REFERENCES `t_user` (`lg_USER_ID`),
  CONSTRAINT `t_notification_fk1` FOREIGN KEY (`lg_USER_ID_OUT`) REFERENCES `t_user` (`lg_USER_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_table` table : */

CREATE TABLE `t_table` (
  `lg_TABLE_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_PIC_ORIGINALE` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_SMALL` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_MIDDLE` TEXT COLLATE latin1_swedish_ci,
  `str_PIC_BIG` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_TABLE_ID`),
  UNIQUE KEY `lg_TABLE_ID` USING BTREE (`lg_TABLE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_order` table : */

CREATE TABLE `t_order` (
  `lg_ORDER_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_TABLE_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_PRICE` INTEGER(11) DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_VALIDATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_REF` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_USER_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_PRICE_UN_PAID` INTEGER(11) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ORDER_ID`),
  UNIQUE KEY `lg_ORDER_ID` USING BTREE (`lg_ORDER_ID`),
  KEY `lg_TABLE_ID` USING BTREE (`lg_TABLE_ID`),
  KEY `lg_USER_ID` USING BTREE (`lg_USER_ID`),
  CONSTRAINT `t_order_fk` FOREIGN KEY (`lg_TABLE_ID`) REFERENCES `t_table` (`lg_TABLE_ID`),
  CONSTRAINT `t_order_fk1` FOREIGN KEY (`lg_USER_ID`) REFERENCES `t_user` (`lg_USER_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_order_customer_account` table : */

CREATE TABLE `t_order_customer_account` (
  `lg_ORDER_CUSTOMER_ACCOUNT_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `int_AMOUNT_DEMANDE` INTEGER(11) DEFAULT NULL,
  `int_AMOUNT_RECU` INTEGER(11) DEFAULT NULL,
  `int_AMOUNT_DIFFERENCE` INTEGER(11) DEFAULT NULL,
  `lg_CUSTOMER_ACCOUNT_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `lg_ORDER_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_PARENT_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT '',
  `lg_LIT_OCCUPATION_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_MENU_REPAS_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_TYPE_MENU_ID` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_DATE_ORDER` DATE DEFAULT NULL,
  `str_GPS` TEXT COLLATE latin1_swedish_ci,
  `str_PAYEMENT_METHODE` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_ZONNE_1` TEXT COLLATE latin1_swedish_ci,
  `str_ZONNE_2` TEXT COLLATE latin1_swedish_ci,
  `str_ZONNE_3` TEXT COLLATE latin1_swedish_ci,
  `str_ZONNE_4` TEXT COLLATE latin1_swedish_ci,
  `str_ZONNE_5` TEXT COLLATE latin1_swedish_ci,
  `str_ZONNE_6` TEXT COLLATE latin1_swedish_ci,
  `str_ZONNE_7` TEXT COLLATE latin1_swedish_ci,
  `str_REF_TOURNNEE` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ORDER_CUSTOMER_ACCOUNT_ID`),
  UNIQUE KEY `lg_ORDER_CUSTOMER_ACCOUNT_ID` USING BTREE (`lg_ORDER_CUSTOMER_ACCOUNT_ID`),
  KEY `lg_CUSTOMER_ACCOUNT_ID` USING BTREE (`lg_CUSTOMER_ACCOUNT_ID`),
  KEY `lg_ORDER_ID` USING BTREE (`lg_ORDER_ID`),
  KEY `lg_LIT_OCCUPATION_ID` USING BTREE (`lg_LIT_OCCUPATION_ID`),
  KEY `lg_MENU_REPAS_ID` USING BTREE (`lg_MENU_REPAS_ID`),
  CONSTRAINT `[OwnerName]_fk[num_for_dup1111111]` FOREIGN KEY (`lg_LIT_OCCUPATION_ID`) REFERENCES `t_lit_occupation` (`lg_LIT_OCCUPATION_ID`),
  CONSTRAINT `[OwnerName]_fk[num_for_dup]UGUG` FOREIGN KEY (`lg_MENU_REPAS_ID`) REFERENCES `t_menu_repas` (`lg_MENU_REPAS_ID`),
  CONSTRAINT `t_order_customer_account_fk` FOREIGN KEY (`lg_CUSTOMER_ACCOUNT_ID`) REFERENCES `t_customer_account` (`lg_CUSTOMER_ACCOUNT_ID`),
  CONSTRAINT `t_order_customer_account_fk1` FOREIGN KEY (`lg_ORDER_ID`) REFERENCES `t_order` (`lg_ORDER_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_order_transaction` table : */

CREATE TABLE `t_order_transaction` (
  `lg_ORDER_TRANSACTION_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_ORDER_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_PRODUCT_ITEM_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_NUMBER` INTEGER(11) DEFAULT NULL,
  `int_NUMBER_UN_PAID` INTEGER(11) DEFAULT NULL,
  `lg_ACCOMPAGNEMENT_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_COMMENTAIRE_ID` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ORDER_TRANSACTION_ID`),
  UNIQUE KEY `lg_ORDER_TRANSACTION_ID` USING BTREE (`lg_ORDER_TRANSACTION_ID`),
  KEY `t_order_transaction_fk` USING BTREE (`lg_ORDER_ID`),
  KEY `lg_PRODUCT_ITEM_ID` USING BTREE (`lg_PRODUCT_ITEM_ID`),
  KEY `lg_ACCOMPAGNEMENT_ID` USING BTREE (`lg_ACCOMPAGNEMENT_ID`),
  KEY `lg_COMMENTAIRE_ID` USING BTREE (`lg_COMMENTAIRE_ID`),
  CONSTRAINT `[OwnerName]_fk455[num_for_dup]` FOREIGN KEY (`lg_ACCOMPAGNEMENT_ID`) REFERENCES `t_accompagnemement` (`lg_ACCOMPAGNEMENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `[OwnerName]_fkkkk[num_for_dup]` FOREIGN KEY (`lg_COMMENTAIRE_ID`) REFERENCES `t_commentaire` (`lg_COMMENTAIRE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `t_order_transaction_fk` FOREIGN KEY (`lg_ORDER_ID`) REFERENCES `t_order` (`lg_ORDER_ID`),
  CONSTRAINT `t_order_transaction_fk1` FOREIGN KEY (`lg_PRODUCT_ITEM_ID`) REFERENCES `t_product_item` (`lg_PRODUCT_ITEM_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_order_transaction_commentaire` table : */

CREATE TABLE `t_order_transaction_commentaire` (
  `lg_ID` VARCHAR(40) COLLATE utf8_general_ci NOT NULL,
  `lg_ORDER_TRANSACTION_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_COMMENTAIRE_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `dt_CREATED` INTEGER(11) DEFAULT NULL,
  `dt_UPDATED` INTEGER(11) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ID`),
  KEY `lg_ORDER_TRANSACTION_ID` USING BTREE (`lg_ORDER_TRANSACTION_ID`),
  KEY `lg_COMMENTAIRE_ID` USING BTREE (`lg_COMMENTAIRE_ID`),
  CONSTRAINT `[OwnerName]_fk[num_for_dup]444` FOREIGN KEY (`lg_COMMENTAIRE_ID`) REFERENCES `t_commentaire` (`lg_COMMENTAIRE_ID`),
  CONSTRAINT `[OwnerName]_fk[num_for_dup]48588` FOREIGN KEY (`lg_ORDER_TRANSACTION_ID`) REFERENCES `t_order_transaction` (`lg_ORDER_TRANSACTION_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_outboud_message` table : */

CREATE TABLE `t_outboud_message` (
  `lg_OUTBOUND_MESSAGE_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_MESSAGE` TEXT COLLATE latin1_swedish_ci NOT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_PHONE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_OUTBOUND_MESSAGE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_parameters` table : */

CREATE TABLE `t_parameters` (
  `str_KEY` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `str_VALUE` TEXT COLLATE latin1_swedish_ci,
  `str_DESCRIPTION` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT 'enable',
  `str_IS_EN_KRYPTED` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_SECTION_KEY` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_TYPE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  PRIMARY KEY USING BTREE (`str_KEY`),
  UNIQUE KEY `str_KEY` USING BTREE (`str_KEY`)
) ENGINE=InnoDB
CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_report_groupe` table : */

CREATE TABLE `t_report_groupe` (
  `lg_REPORT_GROUPE_ID` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `lg_SCHEMA_CARTE_ID` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_NAME` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_REPORT_GROUPE_ID`),
  UNIQUE KEY `lg_REPORT_GROUPE_ID` USING BTREE (`lg_REPORT_GROUPE_ID`),
  KEY `lg_SCHEMA_CARTE_ID` USING BTREE (`lg_SCHEMA_CARTE_ID`),
  CONSTRAINT `t_report_groupe_fk` FOREIGN KEY (`lg_SCHEMA_CARTE_ID`) REFERENCES `t_schema_carte` (`lg_SCHEMA_CARTE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_report` table : */

CREATE TABLE `t_report` (
  `lg_REPORT_ID` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `lg_REPORT_GROUPE_ID` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_DECOUPE_ID` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_NAME` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_WEBSERVICE` TEXT COLLATE latin1_swedish_ci,
  `str_WEBSERVICE_LEGEND` TEXT COLLATE latin1_swedish_ci,
  `str_VALUE` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_COULEUR` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_REPORT_ID`),
  UNIQUE KEY `lg_REPORT_ID` USING BTREE (`lg_REPORT_ID`),
  KEY `lg_REPORT_GROUPE_ID` USING BTREE (`lg_REPORT_GROUPE_ID`),
  KEY `lg_DECOUPE_ID` USING BTREE (`lg_DECOUPE_ID`),
  CONSTRAINT `t_report_fk` FOREIGN KEY (`lg_REPORT_GROUPE_ID`) REFERENCES `t_report_groupe` (`lg_REPORT_GROUPE_ID`),
  CONSTRAINT `t_report_fk1` FOREIGN KEY (`lg_DECOUPE_ID`) REFERENCES `t_decoupe` (`lg_DECOUPE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_preference_schema_carte` table : */

CREATE TABLE `t_preference_schema_carte` (
  `lg_PREFERENCE_SCHEMA_CARTE_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `lg_CUSTOMER_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_SCHEMA_CARTE_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_REPORT_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_PREFERENCE_SCHEMA_CARTE_ID`),
  UNIQUE KEY `lg_PREFERENCE_SCHEMA_CARTE_ID` USING BTREE (`lg_PREFERENCE_SCHEMA_CARTE_ID`),
  KEY `lg_CUSTOMER_ID` USING BTREE (`lg_CUSTOMER_ID`),
  KEY `lg_SCHEMA_CARTE_ID` USING BTREE (`lg_SCHEMA_CARTE_ID`),
  KEY `lg_REPORT_ID` USING BTREE (`lg_REPORT_ID`),
  CONSTRAINT `t_preference_schema_carte_fk` FOREIGN KEY (`lg_CUSTOMER_ID`) REFERENCES `t_customer` (`lg_CUSTOMER_ID`),
  CONSTRAINT `t_preference_schema_carte_fk1` FOREIGN KEY (`lg_SCHEMA_CARTE_ID`) REFERENCES `t_schema_carte` (`lg_SCHEMA_CARTE_ID`),
  CONSTRAINT `t_preference_schema_carte_fk2` FOREIGN KEY (`lg_REPORT_ID`) REFERENCES `t_report` (`lg_REPORT_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_privilege` table : */

CREATE TABLE `t_privilege` (
  `lg_PRIVELEGE_ID` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(80) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `lg_CREATED_BY` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `lg_UPDATED_BY` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_PRIVELEGE_ID_DEP` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_STATUT` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT 'enable',
  PRIMARY KEY USING BTREE (`lg_PRIVELEGE_ID`),
  UNIQUE KEY `lg_PRIVELEGE_ID` USING BTREE (`lg_PRIVELEGE_ID`)
) ENGINE=InnoDB
AVG_ROW_LENGTH=2730 ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_type_contenance` table : */

CREATE TABLE `t_type_contenance` (
  `lg_TYPE_CONTENANCE_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `str_TYPE_CONTENANCE` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_TYPE_CONTENANCE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_product_iem_type_contenance` table : */

CREATE TABLE `t_product_iem_type_contenance` (
  `lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `lg_PRODUCT_ITEM_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_TYPE_CONTENANCE_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `int_NUMBER` INTEGER(11) DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID`),
  UNIQUE KEY `lg_PRODUCT_ITEM_ID` USING BTREE (`lg_PRODUCT_ITEM_ID`),
  KEY `lg_TYPE_CONTENANCE_ID` USING BTREE (`lg_TYPE_CONTENANCE_ID`),
  CONSTRAINT `t_product_iem_type_contenance_fk` FOREIGN KEY (`lg_PRODUCT_ITEM_ID`) REFERENCES `t_product_item` (`lg_PRODUCT_ITEM_ID`),
  CONSTRAINT `t_product_iem_type_contenance_fk1` FOREIGN KEY (`lg_TYPE_CONTENANCE_ID`) REFERENCES `t_type_contenance` (`lg_TYPE_CONTENANCE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_product_item_accompagnemement` table : */

CREATE TABLE `t_product_item_accompagnemement` (
  `lg_PRODUCT_ITEM_ACCOMPAGNEMENT_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `lg_PRODUCT_ITEM_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_ACCOMPAGNEMENT_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_PRODUCT_ITEM_ACCOMPAGNEMENT_ID`),
  KEY `lg_PRODUCT_ITEM_ID` USING BTREE (`lg_PRODUCT_ITEM_ID`),
  KEY `lg_ACCOMPAGNEMENT_ID` USING BTREE (`lg_ACCOMPAGNEMENT_ID`),
  CONSTRAINT `[OwnerName]_fk[num_for_dup]` FOREIGN KEY (`lg_ACCOMPAGNEMENT_ID`) REFERENCES `t_accompagnemement` (`lg_ACCOMPAGNEMENT_ID`),
  CONSTRAINT `t_product_item_accompagnemement_fk` FOREIGN KEY (`lg_PRODUCT_ITEM_ID`) REFERENCES `t_product_item` (`lg_PRODUCT_ITEM_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_product_item_commentaire` table : */

CREATE TABLE `t_product_item_commentaire` (
  `lg_PRODUCT_ITEM_ACCOMPAGNEMENT_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `lg_PRODUCT_ITEM_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_COMMENTAIRE_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_PRODUCT_ITEM_ACCOMPAGNEMENT_ID`),
  KEY `lg_PRODUCT_ITEM_ID` USING BTREE (`lg_PRODUCT_ITEM_ID`),
  KEY `lg_COMMENTAIRE_ID` USING BTREE (`lg_COMMENTAIRE_ID`),
  CONSTRAINT `t_product_item_commentaire_fk` FOREIGN KEY (`lg_PRODUCT_ITEM_ID`) REFERENCES `t_product_item` (`lg_PRODUCT_ITEM_ID`),
  CONSTRAINT `t_product_item_commentaire_fk1` FOREIGN KEY (`lg_COMMENTAIRE_ID`) REFERENCES `t_commentaire` (`lg_COMMENTAIRE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_product_item_stock` table : */

CREATE TABLE `t_product_item_stock` (
  `lg_PRODUCT_ITEM_STOCK_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `lg_PRODUCT_ITEM_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_NUMBER` INTEGER(11) DEFAULT NULL,
  `int_NUMBER_AVAILABLE` INTEGER(11) DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_PRODUCT_ITEM_STOCK_ID`),
  KEY `lg_PRODUCT_ITEM_ID` USING BTREE (`lg_PRODUCT_ITEM_ID`),
  CONSTRAINT `t_product_item_stock_fk` FOREIGN KEY (`lg_PRODUCT_ITEM_ID`) REFERENCES `t_product_item` (`lg_PRODUCT_ITEM_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_product_item_type_contenance_stock` table : */

CREATE TABLE `t_product_item_type_contenance_stock` (
  `lg_PRODUCT_ITEM_TYPE_CONTENANCE_STOCK_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_NUMBER` INTEGER(11) DEFAULT NULL,
  `int_NUMBER_AVAILABLE` INTEGER(11) DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_PRODUCT_ITEM_TYPE_CONTENANCE_STOCK_ID`),
  KEY `lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID` USING BTREE (`lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID`),
  CONSTRAINT `t_product_item_type_contenance_stock_fk` FOREIGN KEY (`lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID`) REFERENCES `t_product_iem_type_contenance` (`lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_quest_qcm` table : */

CREATE TABLE `t_quest_qcm` (
  `lg_QUEST_QCM_ID` VARCHAR(20) COLLATE utf8_general_ci NOT NULL,
  `str_NAME` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATE` DATETIME DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_QUEST_QCM_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Structure for the `t_type_recette` table : */

CREATE TABLE `t_type_recette` (
  `lg_TYPE_RECETTE_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `str_TYPE_RECETTE` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_NUMERO_COMPTE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `is_USE_TVA` TINYINT(1) DEFAULT 0,
  PRIMARY KEY USING BTREE (`lg_TYPE_RECETTE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_recettes` table : */

CREATE TABLE `t_recettes` (
  `ID_RECETTE` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `lg_TYPE_RECETTE_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `str_CREATED_BY` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_UPDATED_BY` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_AMOUNT` DOUBLE(15,3) DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(2000) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_REF_FACTURE` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`ID_RECETTE`),
  KEY `lg_TYPE_RECETTE_ID` USING BTREE (`lg_TYPE_RECETTE_ID`),
  CONSTRAINT `t_recettes_fk` FOREIGN KEY (`lg_TYPE_RECETTE_ID`) REFERENCES `t_type_recette` (`lg_TYPE_RECETTE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_reponse_qcm` table : */

CREATE TABLE `t_reponse_qcm` (
  `lg_REPONSE_QCM_ID` VARCHAR(20) COLLATE utf8_general_ci NOT NULL,
  `str_VALUE` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `str_PHONE` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `str_EMAIL` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `lg_QUEST_QCM_ID` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_REPONSE_QCM_ID`),
  KEY `lg_QUEST_QCM_ID` USING BTREE (`lg_QUEST_QCM_ID`),
  CONSTRAINT `t_reponse_qcm_fk` FOREIGN KEY (`lg_QUEST_QCM_ID`) REFERENCES `t_quest_qcm` (`lg_QUEST_QCM_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Structure for the `t_resume_caisse` table : */

CREATE TABLE `t_resume_caisse` (
  `ld_CAISSE_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `lg_USER_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_SOLDE_MATIN` INTEGER(11) DEFAULT NULL,
  `int_SOLDE_SOIR` INTEGER(11) DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `lg_CREATED_BY` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `lg_UPDATED_BY` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `ID_COFFRE_CAISSE` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_STATUT` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`ld_CAISSE_ID`),
  KEY `lg_USER_ID` USING BTREE (`lg_USER_ID`),
  KEY `ID_COFFRE_CAISSE` USING BTREE (`ID_COFFRE_CAISSE`),
  CONSTRAINT `t_resume_caisse_fk1` FOREIGN KEY (`lg_USER_ID`) REFERENCES `t_user` (`lg_USER_ID`),
  CONSTRAINT `t_resume_caisse_fk2` FOREIGN KEY (`ID_COFFRE_CAISSE`) REFERENCES `t_coffre_caisse` (`ID_COFFRE_CAISSE`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_role` table : */

CREATE TABLE `t_role` (
  `lg_ROLE_ID` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESIGNATION` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_TYPE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT 'custom',
  `str_STATUT` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT 'enable',
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ROLE_ID`),
  UNIQUE KEY `lg_ROLE_ID` USING BTREE (`lg_ROLE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_role_privelege` table : */

CREATE TABLE `t_role_privelege` (
  `lg_ROLE_PRIVILEGE` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `lg_ROLE_ID` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_PRIVILEGE_ID` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `str_CREATED_BY` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_UPDATED_BY` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ROLE_PRIVILEGE`),
  UNIQUE KEY `lg_ROLE_PRIVILEGE` USING BTREE (`lg_ROLE_PRIVILEGE`),
  KEY `lg_ROLE_ID` USING BTREE (`lg_ROLE_ID`),
  KEY `lg_PRIVILEGE_ID` USING BTREE (`lg_PRIVILEGE_ID`),
  CONSTRAINT `t_role_privelege_fk` FOREIGN KEY (`lg_ROLE_ID`) REFERENCES `t_role` (`lg_ROLE_ID`),
  CONSTRAINT `t_role_privelege_fk1` FOREIGN KEY (`lg_PRIVILEGE_ID`) REFERENCES `t_privilege` (`lg_PRIVELEGE_ID`)
) ENGINE=InnoDB
AVG_ROW_LENGTH=2730 ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_role_user` table : */

CREATE TABLE `t_role_user` (
  `lg_USER_ROLE_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `lg_ROLE_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `lg_USER_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_CREATED_BY` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_UPDATED_BY` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_USER_ROLE_ID`),
  UNIQUE KEY `lg_USER_ROLE_ID` USING BTREE (`lg_USER_ROLE_ID`),
  KEY `lg_ROLE_ID` USING BTREE (`lg_ROLE_ID`),
  KEY `lg_USER_ID` USING BTREE (`lg_USER_ID`),
  CONSTRAINT `t_role_user_fk` FOREIGN KEY (`lg_ROLE_ID`) REFERENCES `t_role` (`lg_ROLE_ID`),
  CONSTRAINT `t_role_user_fk1` FOREIGN KEY (`lg_USER_ID`) REFERENCES `t_user` (`lg_USER_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_satisfaction` table : */

CREATE TABLE `t_satisfaction` (
  `lg_SATISFACTION_ID` VARCHAR(20) COLLATE utf8_general_ci NOT NULL,
  `str_NAME` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `str_QUESTION_1` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `str_QUESTION_2` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `str_QUESTION_3` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `str_REPONSE` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_SATISFACTION_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Structure for the `t_sms` table : */

CREATE TABLE `t_sms` (
  `ID_SMS` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `MESSAGE` VARCHAR(200) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `lg_CREATED_BY` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `lg_UPDATED_BY` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`ID_SMS`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_sms_customer` table : */

CREATE TABLE `t_sms_customer` (
  `ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `lg_CUSTOMER_ID` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `ID_SMS` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `str_CREATED_BY` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`ID`),
  KEY `ID_SMS` USING BTREE (`ID_SMS`),
  KEY `lg_CUSTOMER_ID` USING BTREE (`lg_CUSTOMER_ID`),
  CONSTRAINT `t_sms_customer_fk` FOREIGN KEY (`ID_SMS`) REFERENCES `t_sms` (`ID_SMS`),
  CONSTRAINT `t_sms_customer_fk1` FOREIGN KEY (`lg_CUSTOMER_ID`) REFERENCES `t_customer` (`lg_CUSTOMER_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_sms_not_send` table : */

CREATE TABLE `t_sms_not_send` (
  `ID_SMS` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `EXPEDITEUR` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `DESTINATEUR` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `MESSAGES` TEXT COLLATE latin1_swedish_ci,
  `STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `CREDIT` DOUBLE(15,3) DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `lg_CREATED_BY` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `lg_UPDATED_BY` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `ID_SMS_MASTER` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`ID_SMS`),
  KEY `ID_SMS_MASTER` USING BTREE (`ID_SMS_MASTER`),
  CONSTRAINT `t_sms_not_send_fk` FOREIGN KEY (`ID_SMS_MASTER`) REFERENCES `t_sms` (`ID_SMS`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_snap_shop_daly_recette` table : */

CREATE TABLE `t_snap_shop_daly_recette` (
  `lg_ID` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `lg_TYPE_RECETTE_ID` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_AMOUNT` DOUBLE(15,3) DEFAULT NULL,
  `dt_DAY` DATE DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_NUMBER_TRANSACTION` INTEGER(11) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ID`),
  KEY `lg_TYPE_RECETTE_ID` USING BTREE (`lg_TYPE_RECETTE_ID`),
  CONSTRAINT `t_snap_shop_daly_recette_fk` FOREIGN KEY (`lg_TYPE_RECETTE_ID`) REFERENCES `t_type_recette` (`lg_TYPE_RECETTE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_sous_menu` table : */

CREATE TABLE `t_sous_menu` (
  `lg_SOUS_MENU_ID` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `str_VALUE` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(200) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_COMPOSANT` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `lg_MENU_ID` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_PRIORITY` INTEGER(11) DEFAULT 0,
  `str_URL` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_Status` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `P_KEY` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_SOUS_MENU_ID`),
  UNIQUE KEY `lg_SOUS_MENU_ID` USING BTREE (`lg_SOUS_MENU_ID`),
  KEY `lg_MENU_ID` USING BTREE (`lg_MENU_ID`),
  CONSTRAINT `t_sous_menu_fk` FOREIGN KEY (`lg_MENU_ID`) REFERENCES `t_menu` (`lg_MENU_ID`)
) ENGINE=InnoDB
AVG_ROW_LENGTH=3276 ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_tournee_livraison` table : */

CREATE TABLE `t_tournee_livraison` (
  `lg_TOURNEE_LIVRAISON_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `ZONNE` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_USER_ID` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_DATE_TOURNEE` DATE DEFAULT NULL,
  `str_GPS` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_LAT` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_LONG` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_CONTACT` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_REF_CODE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_START_DATE` DATETIME DEFAULT NULL,
  `dt_END_DATE` DATETIME DEFAULT NULL,
  `int_PERCENT_PROCESS` DOUBLE(15,3) DEFAULT NULL,
  `int_TOTAL` INTEGER(11) DEFAULT 0,
  `int_TO_DO` INTEGER(11) DEFAULT 0,
  `dt_LAST_DATE_ACTIVITY` DATETIME DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_TOURNEE_LIVRAISON_ID`),
  UNIQUE KEY `lg_TOURNEE_LIVRAISON_ID` USING BTREE (`lg_TOURNEE_LIVRAISON_ID`),
  KEY `lg_USER_ID` USING BTREE (`lg_USER_ID`),
  CONSTRAINT `[OwnerNametOURNEE]_fk[num_for_dup]` FOREIGN KEY (`lg_USER_ID`) REFERENCES `t_user` (`lg_USER_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_tournee_livraison_order` table : */

CREATE TABLE `t_tournee_livraison_order` (
  `lg_TOURNEE_LIVRAISON_ORDER_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_TOURNEE_LIVRAISON_ID` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_ORDER_ID` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_DATE_PROCESS` DATETIME DEFAULT NULL,
  `str_GPS` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_TOURNEE_LIVRAISON_ORDER_ID`),
  UNIQUE KEY `lg_TOURNEE_LIVRAISON_ORDER_ID` USING BTREE (`lg_TOURNEE_LIVRAISON_ORDER_ID`),
  KEY `lg_ORDER_ID` USING BTREE (`lg_ORDER_ID`),
  KEY `lg_TOURNEE_LIVRAISON_ID` USING BTREE (`lg_TOURNEE_LIVRAISON_ID`),
  CONSTRAINT `[OwnerNameHYYY]_fk[num_for_dup]` FOREIGN KEY (`lg_TOURNEE_LIVRAISON_ID`) REFERENCES `t_tournee_livraison` (`lg_TOURNEE_LIVRAISON_ID`),
  CONSTRAINT `[OwnerNamet_tournee_livraison_order]_fk[num_for_du` FOREIGN KEY (`lg_ORDER_ID`) REFERENCES `t_order` (`lg_ORDER_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_type_ecart_mvt` table : */

CREATE TABLE `t_type_ecart_mvt` (
  `lg_TYPE_ECART_MVT` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_TYPE_ECART_MVT`),
  UNIQUE KEY `lg_TYPE_ECART_MVT` USING BTREE (`lg_TYPE_ECART_MVT`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_type_quest_qcm` table : */

CREATE TABLE `t_type_quest_qcm` (
  `lg_TYPE_QUEST_QCM_ID` VARCHAR(20) COLLATE utf8_general_ci NOT NULL,
  `lg_QUEST_QCM_ID` VARCHAR(20) COLLATE utf8_general_ci NOT NULL,
  `str_NAME` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_TYPE_QUEST_QCM_ID`),
  KEY `lg_QUEST_QCM_ID` USING BTREE (`lg_QUEST_QCM_ID`),
  CONSTRAINT `t_type_quest_qcm_fk` FOREIGN KEY (`lg_QUEST_QCM_ID`) REFERENCES `t_quest_qcm` (`lg_QUEST_QCM_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Structure for the `t_type_vente` table : */

CREATE TABLE `t_type_vente` (
  `lg_TYPE_VENTE_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_DESCRIPTION` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_TYPE` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `str_STATUT` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_TYPE_VENTE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_user_imprimante` table : */

CREATE TABLE `t_user_imprimante` (
  `lg_USER_IMPRIMQNTE_ID` VARCHAR(40) COLLATE utf8_general_ci NOT NULL,
  `lg_USER_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `lg_IMPRIMANTE_ID` VARCHAR(40) COLLATE utf8_general_ci NOT NULL,
  `str_NAME` TEXT COLLATE utf8_general_ci,
  `str_DESCRIPTION` TEXT COLLATE utf8_general_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(40) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_USER_IMPRIMQNTE_ID`),
  KEY `lg_USER_ID` USING BTREE (`lg_USER_ID`),
  KEY `lg_IMPRIMQNTE_ID` USING BTREE (`lg_IMPRIMANTE_ID`),
  CONSTRAINT `t_user_imprimante_fk` FOREIGN KEY (`lg_USER_ID`) REFERENCES `t_user` (`lg_USER_ID`),
  CONSTRAINT `t_user_imprimante_fk1` FOREIGN KEY (`lg_IMPRIMANTE_ID`) REFERENCES `t_imprimante` (`lg_IMPRIMANTE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Structure for the `t_user_services` table : */

CREATE TABLE `t_user_services` (
  `lg_USER_SERVICES_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `lg_SERVICES_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_USER_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY USING BTREE (`lg_USER_SERVICES_ID`),
  KEY `FK_t_user_fone_lg_USER_ID` USING BTREE (`lg_USER_ID`),
  KEY `lg_SERVICES_ID` USING BTREE (`lg_SERVICES_ID`),
  CONSTRAINT `FK_t_user_services_lg_USER_ID` FOREIGN KEY (`lg_USER_ID`) REFERENCES `t_user` (`lg_USER_ID`),
  CONSTRAINT `[OwnerName]_fk[num_for_dupGYGUG]` FOREIGN KEY (`lg_SERVICES_ID`) REFERENCES `t_services` (`lg_SERVICES_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_warehouse` table : */

CREATE TABLE `t_warehouse` (
  `lg_WAREHOUSE_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `lg_USER_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_PRODUCT_ITEM_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `int_NUMBER` INTEGER(11) DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_WAREHOUSE_ID`),
  KEY `lg_USER_ID` USING BTREE (`lg_USER_ID`),
  KEY `lg_PRODUCT_ITEM_ID` USING BTREE (`lg_PRODUCT_ITEM_ID`),
  CONSTRAINT `t_warehouse_fk` FOREIGN KEY (`lg_USER_ID`) REFERENCES `t_user` (`lg_USER_ID`),
  CONSTRAINT `t_warehouse_fk1` FOREIGN KEY (`lg_PRODUCT_ITEM_ID`) REFERENCES `t_product_item` (`lg_PRODUCT_ITEM_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_warehouse_contenance` table : */

CREATE TABLE `t_warehouse_contenance` (
  `lg_WAREHOUSE_CONTENANCE_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `lg_USER_ID` VARCHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID` VARCHAR(40) COLLATE latin1_swedish_ci NOT NULL,
  `int_NUMBER` INTEGER(11) DEFAULT NULL,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_WAREHOUSE_CONTENANCE_ID`),
  KEY `lg_USER_ID` USING BTREE (`lg_USER_ID`),
  KEY `lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID` USING BTREE (`lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID`),
  CONSTRAINT `t_warehouse_contenance_fk` FOREIGN KEY (`lg_USER_ID`) REFERENCES `t_user` (`lg_USER_ID`),
  CONSTRAINT `t_warehouse_contenance_fk1` FOREIGN KEY (`lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID`) REFERENCES `t_product_iem_type_contenance` (`lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_zonne_1` table : */

CREATE TABLE `t_zonne_1` (
  `lg_ZONNE_1_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` TEXT COLLATE latin1_swedish_ci,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ZONNE_1_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_zonne_2` table : */

CREATE TABLE `t_zonne_2` (
  `lg_ZONNE_2_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` TEXT COLLATE latin1_swedish_ci,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ZONNE_2_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_zonne_3` table : */

CREATE TABLE `t_zonne_3` (
  `lg_ZONNE_3_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` TEXT COLLATE latin1_swedish_ci,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ZONNE_3_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_zonne_4` table : */

CREATE TABLE `t_zonne_4` (
  `lg_ZONNE_4_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` TEXT COLLATE latin1_swedish_ci,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ZONNE_4_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_zonne_5` table : */

CREATE TABLE `t_zonne_5` (
  `lg_ZONNE_5_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` TEXT COLLATE latin1_swedish_ci,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ZONNE_5_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_zonne_6` table : */

CREATE TABLE `t_zonne_6` (
  `lg_ZONNE_6_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` TEXT COLLATE latin1_swedish_ci,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ZONNE_6_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `t_zonne_7` table : */

CREATE TABLE `t_zonne_7` (
  `lg_ZONNE_7_ID` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL,
  `str_NAME` TEXT COLLATE latin1_swedish_ci,
  `str_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `dt_CREATED` DATETIME DEFAULT NULL,
  `dt_UPDATED` DATETIME DEFAULT NULL,
  `str_STATUT` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`lg_ZONNE_7_ID`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Definition for the `v_commentaire_product_order` view : */

CREATE ALGORITHM=UNDEFINED DEFINER='root'@'%' SQL SECURITY DEFINER VIEW `v_commentaire_product_order`
AS
select
  `t_product_item`.`str_NAME` AS `str_NAME`,
  `t_commentaire`.`str_NAME` AS `commentaire`,
  `t_order_transaction_commentaire`.`lg_ORDER_TRANSACTION_ID` AS `lg_ORDER_TRANSACTION_ID`
from
  (((`t_order_transaction_commentaire`
  join `t_commentaire` on ((`t_order_transaction_commentaire`.`lg_COMMENTAIRE_ID` = `t_commentaire`.`lg_COMMENTAIRE_ID`)))
  join `t_order_transaction` on ((`t_order_transaction_commentaire`.`lg_ORDER_TRANSACTION_ID` = `t_order_transaction`.`lg_ORDER_TRANSACTION_ID`)))
  join `t_product_item` on ((`t_order_transaction`.`lg_PRODUCT_ITEM_ID` = `t_product_item`.`lg_PRODUCT_ITEM_ID`)));

/* Definition for the `getCommentaire` function : */

DELIMITER $$

CREATE DEFINER = 'root'@'%' FUNCTION `getCommentaire`(
        `P_lg_ORDER_CUSTOMER_ACCOUNT_ID` VARCHAR(40),
        `P_str_NAME` VARCHAR(40)
    )
    RETURNS TEXT CHARACTER SET utf8
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN



declare nb_result VARCHAR(40) default 'glace, pimente';

SELECT GROUP_CONCAT(vc.commentaire SEPARATOR ', ')  FROM v_commentaire_product_order as vc 

WHERE vc.lg_ORDER_TRANSACTION_ID  = P_lg_ORDER_CUSTOMER_ACCOUNT_ID AND vc.str_NAME = P_str_NAME

INTO nb_result;



RETURN nb_result;



END$$

DELIMITER ;

/* Definition for the `getFLASH_ALL_WEB_CANCEL_ORDER` function : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' FUNCTION `getFLASH_ALL_WEB_CANCEL_ORDER`()
    RETURNS INTEGER(20)
    DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
declare nb_result INT(20) default 0;

SELECT COUNT(*) 
FROM       t_order_customer_account
WHERE t_order_customer_account.str_STATUT  IN ('cancel','cancel_by_agent')
AND t_order_customer_account.dt_DATE_ORDER =CURDATE() 
INTO nb_result ;

RETURN nb_result;
END$$

DELIMITER ;

/* Definition for the `getFLASH_ALL_WEB_CA_ORDER` function : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' FUNCTION `getFLASH_ALL_WEB_CA_ORDER`()
    RETURNS INTEGER(20)
    DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
declare nb_result INT(20) default 0;

SELECT SUM(t_order_customer_account.int_AMOUNT_DEMANDE) 
FROM       t_order_customer_account
WHERE t_order_customer_account.str_STATUT  = 'paid'
AND t_order_customer_account.dt_DATE_ORDER =CURDATE()
INTO nb_result ;

RETURN nb_result;
END$$

DELIMITER ;

/* Definition for the `getFLASH_ALL_WEB_ORDER` function : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' FUNCTION `getFLASH_ALL_WEB_ORDER`()
    RETURNS INTEGER(20)
    DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
declare nb_result INT(20) default 0;

SELECT COUNT(0) 
FROM       t_order_customer_account
WHERE t_order_customer_account.str_STATUT  <> 'delete'
INTO nb_result ;

RETURN nb_result;
END$$

DELIMITER ;

/* Definition for the `getFLASH_NEW_WEB_BY_STATUT` function : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' FUNCTION `getFLASH_NEW_WEB_BY_STATUT`(
        `P_str_STATUT` VARCHAR(30)
    )
    RETURNS INTEGER(20)
    DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
declare nb_result INT(20) default 0;

SELECT COUNT(0) 
FROM       t_order_customer_account
WHERE t_order_customer_account.str_STATUT  = P_str_STATUT AND t_order_customer_account.dt_DATE_ORDER =CURDATE()
INTO nb_result ;

RETURN nb_result;
END$$

DELIMITER ;

/* Definition for the `getSTATS_VENTE` function : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' FUNCTION `getSTATS_VENTE`(
        `P_lg_PRODUCT_ITEM_ID` VARCHAR(30),
        `P_date_debut` VARCHAR(30),
        `P_date_fin` VARCHAR(30)
    )
    RETURNS INTEGER(20)
    DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
declare nb_result INT(20) default 0;
SELECT SUM( t_order_transaction.int_NUMBER )  FROM       t_order_transaction
WHERE t_order_transaction.lg_PRODUCT_ITEM_ID  = P_lg_PRODUCT_ITEM_ID
AND t_order_transaction.dt_CREATED between P_date_debut and P_date_fin
INTO nb_result ;

RETURN nb_result;
END$$

DELIMITER ;

/* Definition for the `proc_add_to_cash_transaction` procedure : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `proc_add_to_cash_transaction`(
        IN `ID` VARCHAR(40),
        IN `str_TRANSACTION_REF` VARCHAR(40),
        IN `int_AMOUNT` INTEGER(11),
        IN `lg_CREATED_BY` VARCHAR(20),
        IN `ID_ANNEE_SCOLAIRE` VARCHAR(40),
        IN `str_DESCRIPTION` VARCHAR(2000),
        IN `lg_USER_ID` VARCHAR(40),
        IN `str_NUMERO_COMPTE` VARCHAR(40)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
IF str_TRANSACTION_REF ='D' THEN
SET int_AMOUNT = (-1) * int_AMOUNT;
END IF;
INSERT INTO `t_cash_transaction` (`ID`, `str_TRANSACTION_REF`, `int_AMOUNT`, `lg_CREATED_BY`, `str_DESCRIPTION`,`lg_USER_ID`,`str_NUMERO_COMPTE`) VALUES
  (ID, str_TRANSACTION_REF, int_AMOUNT, lg_CREATED_BY,  str_DESCRIPTION,lg_USER_ID,str_NUMERO_COMPTE);
END$$

DELIMITER ;

/* Definition for the `proc_do_activity` procedure : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `proc_do_activity`(
        IN `lg_USER_ID` VARCHAR(20)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

END$$

DELIMITER ;

/* Definition for the `proc_do_event_log` procedure : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' PROCEDURE `proc_do_event_log`(
        IN `lg_EVENT_LOG_ID` VARCHAR(40),
        IN `MATRICULE_ELEVE` VARCHAR(40),
        IN `str_DESCRIPTION` VARCHAR(2000),
        IN `str_TABLE_CONCERN` VARCHAR(20),
        IN `str_MODULE_CONCERN` VARCHAR(40),
        IN `str_CREATED_BY` VARCHAR(40),
        IN `str_STATUT` VARCHAR(40),
        IN `ID_ANNEE_SCOLAIRE` VARCHAR(20)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
INSERT INTO `t_event_log` (`lg_EVENT_LOG_ID`,
  `str_DESCRIPTION`, `str_CREATED_BY`, `str_STATUT`, `str_TABLE_CONCERN`,
  `str_MODULE_CONCERN`) VALUES
  (lg_EVENT_LOG_ID, str_DESCRIPTION, str_CREATED_BY,
  str_TABLE_CONCERN, str_MODULE_CONCERN,str_STATUT);
END$$

DELIMITER ;

/* Definition for the `v_etat_flash_restau` view : */

CREATE ALGORITHM=UNDEFINED DEFINER='root'@'localhost' SQL SECURITY DEFINER VIEW `v_etat_flash_restau`
AS
select
  `getFLASH_NEW_WEB_BY_STATUT`('is_Waiting') AS `NEW_ORDER`,
  `getFLASH_NEW_WEB_BY_STATUT`('paid') AS `PAY_ORDER`,
  `getFLASH_ALL_WEB_CANCEL_ORDER`() AS `CANCEL_ORDER`,
  `getFLASH_NEW_WEB_BY_STATUT`('delete') AS `DELETE_ORDER`,
  `getFLASH_ALL_WEB_ORDER`() AS `ALL_ORDER`,
  `getFLASH_ALL_WEB_CA_ORDER`() AS `CA_ORDER`;

/* Definition for the `v_lit_disponible` view : */

CREATE ALGORITHM=UNDEFINED DEFINER='root'@'192.168.%' SQL SECURITY DEFINER VIEW `v_lit_disponible`
AS
select
  `t_lit`.`lg_LIT_ID` AS `lg_LIT_ID`,
  `t_lit`.`lg_CHAMBRE_ID` AS `lg_CHAMBRE_ID`,
  `t_lit`.`str_NAME` AS `str_NAME`,
  `t_lit`.`str_DESCRIPTION` AS `str_DESCRIPTION`,
  `t_lit`.`dt_CREATED` AS `dt_CREATED`,
  `t_lit`.`dt_UPDATED` AS `dt_UPDATED`,
  `t_lit`.`str_STATUT` AS `str_STATUT`
from
  `t_lit`
where
  (not (`t_lit`.`lg_LIT_ID` in (
                                 select
                                   `t_lit_occupation_statut`.`lg_LIT_ID`
                                 from
                                   `t_lit_occupation_statut`
  )));

/* Definition for the `v_patient_commande` view : */

CREATE ALGORITHM=UNDEFINED DEFINER='root'@'localhost' SQL SECURITY DEFINER VIEW `v_patient_commande`
AS
select
  1 AS `str_FIRST_NAME`,
  1 AS `str_LAST_NAME`,
  1 AS `lg_JOUR_SEMAINE_ID`,
  1 AS `str_NAME_MENU_REPAS`,
  1 AS `lg_TYPE_MENU_ID`,
  1 AS `dt_CREATED`,
  1 AS `str_STATUT`,
  1 AS `dt_DATE_ORDER`,
  1 AS `lg_CUSTOMER_ACCOUNT_ID`,
  1 AS `lg_CUSTOMER_ID`,
  1 AS `lg_USER_ID`,
  1 AS `lg_MENU_REPAS_ID`,
  1 AS `lg_ORDER_ID`,
  1 AS `lg_ORDER_CUSTOMER_ACCOUNT_ID`;

/* Definition for the `v_stat_vente` view : */

CREATE ALGORITHM=UNDEFINED DEFINER='root'@'localhost' SQL SECURITY DEFINER VIEW `v_stat_vente`
AS
select
  1 AS `lg_PRODUCT_ITEM_ID`,
  1 AS `str_NAME`,
  1 AS `int_NUMBER`,
  1 AS `dt_CREATED`;

/* Definition for the `v_stat_vente_product_item` view : */

CREATE ALGORITHM=UNDEFINED DEFINER='root'@'localhost' SQL SECURITY DEFINER VIEW `v_stat_vente_product_item`
AS
select
  1 AS `lg_PRODUCT_ITEM_ID`,
  1 AS `str_NAME`;

/* Definition for the `v_stats_byproduct` view : */

CREATE ALGORITHM=UNDEFINED DEFINER='root'@'localhost' SQL SECURITY DEFINER VIEW `v_stats_byproduct`
AS
select
  1 AS `str_NAME`,
  1 AS `int_NUMBER`,
  1 AS `dt_CREATED`;

/* Definition for the `v_success_orders` view : */

CREATE ALGORITHM=UNDEFINED DEFINER='root'@'localhost' SQL SECURITY DEFINER VIEW `v_success_orders`
AS
select
  1 AS `lg_TYPE_MENU_ID`,
  1 AS `str_NAME_MENU_REPAS`,
  1 AS `dt_DATE_ORDER`,
  1 AS `lg_MENU_REPAS_ID`,
  1 AS `CHAMBRE`,
  1 AS `LIT`,
  1 AS `str_NAME`,
  1 AS `COMMENTAIRE`,
  1 AS `STATUT`;

/* Data for the `t_accompagnemement` table  (LIMIT 0,500) */

INSERT INTO `t_accompagnemement` (`lg_ACCOMPAGNEMENT_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('72613526876416487','Fritte','Fritte','2017-02-06 13:05:26','2017-02-07 10:34:33','enable'),
  ('72615274354935644275','Riz','Riz','2017-02-06 15:27:43','2017-02-07 10:34:24','enable'),
  ('72710344297012145235','Alloco','Alloco','2017-02-07 10:34:42',NULL,'enable'),
  ('72715501189855344996','Pain','Pain','2017-02-07 15:50:11',NULL,'enable'),
  ('72716191541819818192','Citron','Citron','2017-02-07 16:19:15',NULL,'enable'),
  ('72716441675272692189','Riz aux olives','Riz aux olives','2017-02-07 16:44:16',NULL,'enable');
COMMIT;

/* Data for the `t_alert_event` table  (LIMIT 0,500) */

INSERT INTO `t_alert_event` (`dt_Date_Envoi`, `int_Max_Messages`, `str_Event`, `b_IsCommand`, `str_SMS_English_Text`, `dec_Num_Percent`, `str_MAIL_English_Text`, `b_Row_Active`, `str_SMS_French_Text`, `lg_UID_Who_New`, `lg_UID_Who_Last_Update`, `str_MAIL_French_Text`, `dt_Last_Enter_Date`, `str_ERROR_CODE`) VALUES
  ('2016-02-12 00:00:00',NULL,'N_NEW_ORDER',0,'UNE NOUVELLE COMMANDE  DE [ml_PRODUCT] A ETE ENREGISTRER PAR [ml_USER]',NULL,'UNE NOUVELLE COMMANDE  DE [ml_PRODUCT] A ETE ENREGISTRER PAR [ml_USER]',0,'UNE NOUVELLE COMMANDE  <br>[ml_PRODUCT] <br>A ETE ENREGISTRER PAR [ml_USER]',NULL,NULL,'UNE NOUVELLE COMMANDE  <br>[ml_PRODUCT] <br>A ETE ENREGISTRER PAR [ml_USER]',NULL,NULL),
  (NULL,NULL,'N_ORDER_IS_DELEVREY_PROCESS',0,'UNE NOUVELLE COMMANDE  DE [ml_PRODUCT] A ETE ENREGISTRER PAR [ml_USER]',NULL,'UNE NOUVELLE COMMANDE  DE [ml_PRODUCT] A ETE ENREGISTRER PAR [ml_USER]',0,'UNE NOUVELLE COMMANDE  DE [ml_PRODUCT] A ETE ENREGISTRER PAR [ml_USER]',NULL,NULL,'UNE NOUVELLE COMMANDE  DE [ml_PRODUCT] A ETE ENREGISTRER PAR [ml_USER]',NULL,NULL),
  (NULL,NULL,'N_ORDER_IS_PAID_PROCESS',0,'UNE NOUVELLE COMMANDE  DE [ml_PRODUCT] A ETE ENREGISTRER PAR [ml_USER]',NULL,'UNE NOUVELLE COMMANDE  DE [ml_PRODUCT] A ETE ENREGISTRER PAR [ml_USER]',0,'UNE NOUVELLE COMMANDE  DE [ml_PRODUCT] A ETE ENREGISTRER PAR [ml_USER]',NULL,NULL,'UNE NOUVELLE COMMANDE  DE [ml_PRODUCT] A ETE ENREGISTRER PAR [ml_USER]',NULL,NULL),
  ('0000-00-00 01:00:00',NULL,'N_ORDER_SEND_TO_KITCHEN',0,'Votre Commande a ete Valide',NULL,'Votre Commande a ete Valide',0,'Votre Commande a ete Valide',NULL,NULL,'Votre Commande a ete Valide',NULL,NULL),
  (NULL,NULL,'N_RE_WELCOME_USER',0,'Bienvenue sur FoodDelivery',NULL,'Bienvenue sur FoodDelivery',0,'Bienvenue sur FoodDelivery',NULL,NULL,'Bienvenue sur FoodDelivery',NULL,NULL),
  (NULL,NULL,'N_TOURNEE_IS_CREATE',0,'UNE NOUVELLE COMMANDE  DE [ml_PRODUCT] A ETE ENREGISTRER PAR [ml_USER]',NULL,'UNE NOUVELLE COMMANDE  DE [ml_PRODUCT] A ETE ENREGISTRER PAR [ml_USER]',0,'UNE NOUVELLE COMMANDE  DE [ml_PRODUCT] A ETE ENREGISTRER PAR [ml_USER]',NULL,NULL,'UNE NOUVELLE COMMANDE  DE [ml_PRODUCT] A ETE ENREGISTRER PAR [ml_USER]',NULL,NULL),
  (NULL,NULL,'N_TOURNEE_IS_DONE',0,'UNE NOUVELLE COMMANDE  DE [ml_PRODUCT] A ETE ENREGISTRER PAR [ml_USER]',NULL,'UNE NOUVELLE COMMANDE  DE [ml_PRODUCT] A ETE ENREGISTRER PAR [ml_USER]',0,'UNE NOUVELLE COMMANDE  DE [ml_PRODUCT] A ETE ENREGISTRER PAR [ml_USER]',NULL,NULL,'UNE NOUVELLE COMMANDE  DE [ml_PRODUCT] A ETE ENREGISTRER PAR [ml_USER]',NULL,NULL),
  (NULL,NULL,'N_VALIDATION_ORDER',0,'LA COMMANDE A ETE VALIDER PAR  [ml_USER].',NULL,'LA COMMANDE A ETE VALIDER PAR  [ml_USER].',0,'LA COMMANDE A ETE VALIDER PAR  [ml_USER].',NULL,NULL,'LA COMMANDE A ETE VALIDER PAR  [ml_USER].',NULL,NULL),
  (NULL,NULL,'N_WELCOME_USER',0,'Bienvenue sur FoodDelivery',NULL,'Bienvenue sur FoodDelivery',0,'Bienvenue sur FoodDelivery',NULL,NULL,'Bienvenue sur FoodDelivery',NULL,NULL);
COMMIT;

/* Data for the `t_skin` table  (LIMIT 0,500) */

INSERT INTO `t_skin` (`lg_SKIN_ID`, `str_RESOURCE`, `str_STATUT`, `str_DESCRIPTION`, `str_DETAIL_PATH`) VALUES
  ('1','xtheme-Humangentheme.css','enable','Humangentheme','xtheme-Humangentheme.png'),
  ('2','xtheme-Greengentheme.css','enable','Greengentheme','xtheme-Greengentheme.png'),
  ('3','xtheme-blue.css','enable','blue','xtheme-blue.png'),
  ('4','xtheme-newgentheme.css','enable','newgentheme','xtheme-newgentheme.png'),
  ('5','xtheme-ubuntuTheme.css','enable','ubuntuTheme','xtheme-ubuntuTheme.png'),
  ('6','xtheme-gray-extend.css','enable','gray','xtheme-gray-extend.png'),
  ('7','xtheme-tp.css','enable','tp','xtheme-tp.png');
COMMIT;

/* Data for the `t_language` table  (LIMIT 0,500) */

INSERT INTO `t_language` (`lg_Language_ID`, `str_Local_Cty`, `str_Local_Lg`, `str_Code`, `str_Description`) VALUES
  ('1','fr','FR','fr-FR','Français'),
  ('2','en','GB','en-GB','Anglais');
COMMIT;

/* Data for the `t_user` table  (LIMIT 0,500) */

INSERT INTO `t_user` (`lg_USER_ID`, `str_LOGIN`, `password`, `dt_CREATED`, `dt_UPDATED`, `str_CREATED_BY`, `str_UPDATED_BY`, `str_FIRST_NAME`, `str_LAST_NAME`, `str_LAST_CONNECTION_DATE`, `str_STATUT`, `dt_LAST_ACTIVITY`, `FUNCTION`, `str_PHONE`, `str_MAIL`, `lg_Language_ID`, `lg_SKIN_ID`, `str_IDS`, `b_CHANGE_PASSWORD`, `int_CONNEXION`, `str_FUNCTION`, `lg_EMPLACEMENT_ID`, `b_is_connected`, `is_active`) VALUES
  ('31017105229982132919','admin','$2y$13$A57/UCtlo0t/GkQbQ0lAr.PnAxFHbZi1370fYuPMvpk/AybdYmwh6',NULL,NULL,NULL,NULL,'Master','Ken','2018-06-26 14:48:43','enable','2014-02-09 18:37:13','administrateur',NULL,'0000','2','3',4,0,0,NULL,'PISAM',NULL,1),
  ('31021555156476006126','thierry','$2y$13$A57/UCtlo0t/GkQbQ0lAr.PnAxFHbZi1370fYuPMvpk/AybdYmwh6',NULL,NULL,NULL,NULL,'Bekola','Thierry','2014-11-14 16:39:50','enable','2014-10-21 10:00:49','',NULL,NULL,'1','3',5,0,0,NULL,'PISAM',NULL,0),
  ('3102612583420124210','renee','dd4b21e9ef71e1291183a46b913ae6f2',NULL,NULL,NULL,NULL,'Valencia','N''guessan','2017-04-25 15:27:30','enable',NULL,'Caisse',NULL,NULL,'1','2',3,0,0,NULL,'PISAM',NULL,0),
  ('42101057334294686','test','4a7d1ed414474e4033ac29ccb8653d9b',NULL,NULL,NULL,NULL,'Test','Test','2017-04-29 12:40:26','enable',NULL,'00','9956288',NULL,'1','1',4,0,0,NULL,'PISAM',NULL,0),
  ('42150222079569572824','sandra','4a7d1ed414474e4033ac29ccb8653d9b',NULL,NULL,NULL,NULL,'Sandra','Endalle','2018-06-05 16:12:34','enable','2014-10-20 16:28:32',NULL,'9584855',NULL,'1','3',4,0,0,NULL,'PISAM',NULL,0),
  ('4349285742823031012','nokia','4a7d1ed414474e4033ac29ccb8653d9b',NULL,NULL,NULL,NULL,'nokia','nokia','2014-03-04 09:29:35','delete',NULL,NULL,NULL,NULL,'1','3',4,NULL,NULL,NULL,'zer',NULL,0),
  ('478','admin1','$2y$13$A57/UCtlo0t/GkQbQ0lAr.PnAxFHbZi1370fYuPMvpk/AybdYmwh6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
  ('7291047546404089194','yuri','dd4b21e9ef71e1291183a46b913ae6f2',NULL,NULL,NULL,NULL,'yuri','yagami',NULL,'enable',NULL,NULL,NULL,NULL,'1','3',5,0,0,NULL,'PISAM',NULL,0),
  ('74291246249406234232','pisam','dd4b21e9ef71e1291183a46b913ae6f2',NULL,NULL,NULL,NULL,'pisam','pisam','2018-05-30 09:27:23','enable',NULL,NULL,NULL,NULL,'1','3',3,0,0,NULL,'PISAM',NULL,0);
COMMIT;

/* Data for the `t_user_fone` table  (LIMIT 0,500) */

INSERT INTO `t_user_fone` (`lg_USER_FONE_ID`, `dt_UPDATED`, `str_STATUT`, `dt_CREATED`, `str_PHONE`, `lg_USER_ID`) VALUES
  ('1','2014-02-18 18:08:14','enable','2014-02-18 13:07:02','47204773','31021555156476006126'),
  ('41020141759223567484',NULL,'enable','2014-10-20 14:17:59','77257261','31017105229982132919'),
  ('42181616834518977088',NULL,'enable','2014-02-18 16:16:08','54545455','42150222079569572824'),
  ('42181712419048453420',NULL,'enable','2014-02-18 17:12:41','59495092','31017105229982132919'),
  ('42192074559789178558',NULL,'enable','2014-02-19 20:07:45','07929972','31017105229982132919'),
  ('42222029288841012509',NULL,'enable','2014-02-22 20:29:28','57591660','31021555156476006126'),
  ('4224101914477300368',NULL,'enable','2014-02-24 10:19:14','08089070','31017105229982132919'),
  ('4225124151029433122',NULL,'enable','2014-02-25 01:24:15','08543680','31021555156476006126');
COMMIT;

/* Data for the `t_batiment` table  (LIMIT 0,500) */

INSERT INTO `t_batiment` (`lg_BATIMENT_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('1','BATIMENT 1',NULL,'2017-02-07 14:24:23','2017-02-07 14:24:29','enable'),
  ('2','BATIMENT 2',NULL,'2017-02-07 14:24:40','2017-02-07 14:24:44','enable'),
  ('3','BATIMENT 3',NULL,'2017-02-07 14:24:55','2017-02-07 14:24:59','enable');
COMMIT;

/* Data for the `t_caisse` table  (LIMIT 0,500) */

INSERT INTO `t_caisse` (`lg_CAISSE_ID`, `int_SOLDE`, `lg_USER_ID`, `dt_CREATED`, `lg_CREATED_BY`, `dt_UPDATED`, `lg_UPDATED_BY`) VALUES
  ('201864131297022465',0,'42150222079569572824','2018-06-04 13:01:29','sandra','2018-06-06 00:00:50','sandra');
COMMIT;

/* Data for the `t_services` table  (LIMIT 0,500) */

INSERT INTO `t_services` (`lg_SERVICES_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('1','Medecine','Medecine',NULL,'2017-03-14 16:32:42','enable'),
  ('73141632556214734431','Pediatrie','Pediatrie','2017-03-14 16:32:55',NULL,'enable'),
  ('73141894933598811048','Chirugie','Chirugie','2017-03-14 18:09:49',NULL,'enable'),
  ('7322218194451259694','1EST','1EST','2017-03-22 21:08:19',NULL,'enable'),
  ('73222181949274424687','2EST','2EST','2017-03-22 21:08:19',NULL,'enable'),
  ('73222181957681889463','2ENORD','2ENORD','2017-03-22 21:08:19',NULL,'enable'),
  ('73222181964517238496','2SUD','2SUD','2017-03-22 21:08:19',NULL,'enable'),
  ('73222181970737693045','3EST','3EST','2017-03-22 21:08:19',NULL,'enable'),
  ('73222181976090845373','3ENORD','3ENORD','2017-03-22 21:08:19',NULL,'enable'),
  ('7322218198296442550','3SUD','3SUD','2017-03-22 21:08:19',NULL,'enable'),
  ('73222181987650873187','SINT','SINT','2017-03-22 21:08:19',NULL,'enable');
COMMIT;

/* Data for the `t_etage` table  (LIMIT 0,500) */

INSERT INTO `t_etage` (`lg_ETAGE_ID`, `lg_BATIMENT_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('73222356388022032423','1','1','1 Etage','2017-03-22 23:56:38',NULL,'enable'),
  ('73240562130527289686','1','2','2 Etage','2017-03-24 00:56:21',NULL,'enable'),
  ('7324056214465920150','1','3','3 Etage','2017-03-24 00:56:21',NULL,'enable'),
  ('73240562152774973091','1','500','500 Etage','2017-03-24 00:56:21',NULL,'enable');
COMMIT;

/* Data for the `t_chambre` table  (LIMIT 0,500) */

INSERT INTO `t_chambre` (`lg_CHAMBRE_ID`, `lg_ETAGE_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`, `lg_SERVICES_ID`) VALUES
  ('73222356394074860259','73222356388022032423','30','30','2017-03-22 23:56:39',NULL,'enable','7322218194451259694'),
  ('73222356396843052173','73222356388022032423','32','32','2017-03-22 23:56:39',NULL,'enable','7322218194451259694'),
  ('73222356397558315658','73222356388022032423','3','3','2017-03-22 23:56:39',NULL,'enable','7322218194451259694'),
  ('73222356398489631195','73222356388022032423','34B','34B','2017-03-22 23:56:39',NULL,'enable','7322218194451259694'),
  ('73222356399272677809','73222356388022032423','35','35','2017-03-22 23:56:39',NULL,'enable','7322218194451259694'),
  ('73240562181634824409','73222356388022032423','37','37','2017-03-24 00:56:21',NULL,'enable','7322218194451259694'),
  ('73240562187469375902','73222356388022032423','38','38','2017-03-24 00:56:21',NULL,'enable','7322218194451259694'),
  ('73240562196462745937','73222356388022032423','40B','40B','2017-03-24 00:56:21',NULL,'enable','7322218194451259694'),
  ('7324056221306624860','73222356388022032423','42B','42B','2017-03-24 00:56:22',NULL,'enable','7322218194451259694'),
  ('73240562219294266784','73240562130527289686','43','43','2017-03-24 00:56:22',NULL,'enable','73222181949274424687'),
  ('73240562225611079263','73240562130527289686','44','44','2017-03-24 00:56:22',NULL,'enable','73222181949274424687'),
  ('73240562230965826950','73240562130527289686','47A','47A','2017-03-24 00:56:22',NULL,'enable','73222181949274424687'),
  ('73240562236584002980','73240562130527289686','48','48','2017-03-24 00:56:22',NULL,'enable','73222181949274424687'),
  ('73240562241046951808','73240562130527289686','49','49','2017-03-24 00:56:22',NULL,'enable','73222181949274424687'),
  ('73240562244825681334','73222356388022032423','25','25','2017-03-24 00:56:22',NULL,'enable','73222181949274424687'),
  ('73240562249726333870','73240562130527289686','5','5','2017-03-24 00:56:22',NULL,'enable','73222181949274424687'),
  ('73240562253971322039','73240562130527289686','53','53','2017-03-24 00:56:22',NULL,'enable','73222181949274424687'),
  ('73240562263545046044','73240562130527289686','54','54','2017-03-24 00:56:22',NULL,'enable','73222181949274424687'),
  ('7324056226896576598','73222356388022032423','4B','4B','2017-03-24 00:56:22',NULL,'enable','7322218194451259694'),
  ('73240562271027677938','73240562130527289686','56A','56A','2017-03-24 00:56:22',NULL,'enable','73222181949274424687'),
  ('73240562277051451471','73240562130527289686','56B','56B','2017-03-24 00:56:22',NULL,'enable','73222181949274424687'),
  ('73240562281567784150','73240562130527289686','57A','57A','2017-03-24 00:56:22',NULL,'enable','73222181949274424687'),
  ('73240562286567701549','73240562130527289686','57B','57B','2017-03-24 00:56:22',NULL,'enable','73222181949274424687'),
  ('73240562292056744302','73240562130527289686','58A','58A','2017-03-24 00:56:22',NULL,'enable','73222181949274424687'),
  ('73240562297532211168','73240562130527289686','59A','59A','2017-03-24 00:56:22',NULL,'enable','73222181949274424687'),
  ('73240562311340394636','73240562130527289686','55B','55B','2017-03-24 00:56:23',NULL,'enable','73222181949274424687'),
  ('73240562316293635630','73222356388022032423','20B','20B','2017-03-24 00:56:23',NULL,'enable','73222181964517238496'),
  ('7324056231930899026','73240562130527289686','59B','59B','2017-03-24 00:56:23',NULL,'enable','73222181949274424687'),
  ('73240562320131155022','73240562130527289686','0A','0A','2017-03-24 00:56:23',NULL,'enable','73222181964517238496'),
  ('73240562329876709442','73240562130527289686','03A','03A','2017-03-24 00:56:23',NULL,'enable','73222181964517238496'),
  ('73240562335785785177','73240562130527289686','04A','04A','2017-03-24 00:56:23',NULL,'enable','73222181964517238496'),
  ('73240562340068173193','73240562130527289686','07','07','2017-03-24 00:56:23',NULL,'enable','73222181964517238496'),
  ('7324056234506500498','73240562130527289686','08','08','2017-03-24 00:56:23',NULL,'enable','73222181964517238496'),
  ('73240562350182081690','73222356388022032423','2','2','2017-03-24 00:56:23',NULL,'enable','73222181964517238496'),
  ('73240562355191442014','73222356388022032423','24','24','2017-03-24 00:56:23',NULL,'enable','73222181964517238496'),
  ('73240562361479684638','73222356388022032423','28','28','2017-03-24 00:56:23',NULL,'enable','73222181964517238496'),
  ('73240562368095704050','73222356388022032423','29','29','2017-03-24 00:56:23',NULL,'enable','73222181964517238496'),
  ('7324056237018313530','73240562130527289686','60A','60A','2017-03-24 00:56:23',NULL,'enable','73222181949274424687'),
  ('73240562374212727087','73240562130527289686','09','09','2017-03-24 00:56:23',NULL,'enable','73222181964517238496'),
  ('732405623797957475','73222356388022032423','20','20','2017-03-24 00:56:23',NULL,'enable','73222181964517238496'),
  ('73240562386016446749','7324056214465920150','4','4','2017-03-24 00:56:23',NULL,'enable','73222181970737693045'),
  ('73240562392056828638','7324056214465920150','49B','49B','2017-03-24 00:56:23',NULL,'enable','73222181970737693045'),
  ('73240562399153188744','7324056214465920150','50','50','2017-03-24 00:56:23',NULL,'enable','73222181970737693045'),
  ('73240562412696799574','73240562130527289686','30B','30B','2017-03-24 00:56:24',NULL,'enable','7322218198296442550'),
  ('73240562460378067158','7324056214465920150','05B','05B','2017-03-24 00:56:24',NULL,'enable','7322218198296442550'),
  ('7324056246746101388','73222356388022032423','36A','36A','2017-03-24 00:56:24',NULL,'enable','73222181970737693045'),
  ('73240562486765468553','73222356388022032423','34','34','2017-03-24 00:56:24',NULL,'enable','7322218198296442550'),
  ('73240562537251645974','73222356388022032423','35A','35A','2017-03-24 00:56:25',NULL,'enable','7322218198296442550'),
  ('73240562582055816793','7324056214465920150','05A','05A','2017-03-24 00:56:25',NULL,'enable','7322218198296442550'),
  ('73240562636818209495','73222356388022032423','36','36','2017-03-24 00:56:26',NULL,'enable','7322218198296442550'),
  ('732405626875466917','73222356388022032423','39','39','2017-03-24 00:56:26',NULL,'enable','7322218198296442550'),
  ('73240562714398915686','73240562152774973091','500','500','2017-03-24 00:56:27',NULL,'enable','73222181987650873187'),
  ('7330126898920459982','73222356388022032423','33','33','2017-03-30 13:06:09',NULL,'enable','7322218194451259694');
COMMIT;

/* Data for the `t_ci_carte` table  (LIMIT 0,500) */

INSERT INTO `t_ci_carte` (`lg_CI_CARTE_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `str_STATUT`, `str_PICTURE`, `b_IS_SUGGEST`, `dt_UPDATED`, `str_PIC_ORIGINALE`, `str_PIC_SMALL`, `str_PIC_MIDDLE`, `str_PIC_BIG`) VALUES
  ('62191647763484829718','BOISSONS','BOISSONS','2016-02-19 16:47:07',NULL,'62191647763484829718_83101029319557581739.jpg',NULL,'2016-07-20 11:13:31','62191647763484829718_83101029319557581739.jpg','Small_62191647763484829718_83101029319557581739.jpg',NULL,'Big_62191647763484829718_83101029319557581739.jpg'),
  ('62191714814443168102','CARTE DU JOUR','CARTE DU JOUR','2016-02-19 17:01:48',NULL,'62191714814443168102_66241238541966223593.jpg',NULL,'2016-07-20 11:12:04','62191714814443168102_66241238541966223593.jpg','Small_62191714814443168102_66241238541966223593.jpg',NULL,'Big_62191714814443168102_66241238541966223593.jpg'),
  ('6624125783668134866','SUGGESTIONS','SUGGESTIONS DU CHEF','2016-06-24 12:57:08',NULL,'6624125783668134866_66241257187286763734.jpg',NULL,'2016-07-20 11:13:21','6624125783668134866_66241257187286763734.jpg','Small_6624125783668134866_66241257187286763734.jpg',NULL,'Big_6624125783668134866_66241257187286763734.jpg');
COMMIT;

/* Data for the `t_ci_type_carte` table  (LIMIT 0,500) */

INSERT INTO `t_ci_type_carte` (`lg_CI_TYPE_CARTE_ID`, `lg_CI_CARTE_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `str_STATUT`, `str_PICTURE`, `b_IS_SUGGEST`, `dt_UPDATED`, `str_PIC_ORIGINALE`, `str_PIC_SMALL`, `str_PIC_MIDDLE`, `str_PIC_BIG`) VALUES
  ('62221202140931731554','62191647763484829718','LIQUEURS','LIQUEURS','2016-02-22 12:00:21',NULL,NULL,NULL,'2016-07-20 11:14:57','62221202140931731554_66231816587515285622.jpg','Small_62221202140931731554_66231816587515285622.jpg',NULL,'Big_62221202140931731554_66231816587515285622.jpg'),
  ('62251015364989186669','62191647763484829718','BIERES','BIERES','2016-02-25 10:15:36',NULL,NULL,NULL,'2016-07-20 11:15:14','62251015364989186669_66231818402085811136.jpg','Small_62251015364989186669_66231818402085811136.jpg',NULL,'Big_62251015364989186669_66231818402085811136.jpg'),
  ('62251016684144724440','62191647763484829718','EAUX','EAUX','2016-02-25 10:16:06',NULL,NULL,NULL,'2016-07-20 11:15:28','62251016684144724440_662411866521355037.jpg','Small_62251016684144724440_662411866521355037.jpg',NULL,'Big_62251016684144724440_662411866521355037.jpg'),
  ('6225101848469458226','62191647763484829718','VINS ROUGES','VINS ROUGES','2016-02-25 10:18:48',NULL,NULL,NULL,'2016-07-20 11:15:42','6225101848469458226_6623181921015973920.jpg','Small_6225101848469458226_6623181921015973920.jpg',NULL,'Big_6225101848469458226_6623181921015973920.jpg'),
  ('62251020555116579538','62191647763484829718','VINS BLANCS','VINS BLANCS','2016-02-25 10:20:55',NULL,NULL,NULL,'2016-07-20 11:15:58','62251020555116579538_66231821122489268829.jpg','Small_62251020555116579538_66231821122489268829.jpg',NULL,'Big_62251020555116579538_66231821122489268829.jpg'),
  ('62251021189076592381','62191647763484829718','VINS ROSES','VINS ROSES','2016-02-25 10:21:18',NULL,NULL,NULL,'2016-07-20 11:16:24','62251021189076592381_66231821283653754782.jpg','Small_62251021189076592381_66231821283653754782.jpg',NULL,'Big_62251021189076592381_66231821283653754782.jpg'),
  ('62251023519053854729','62191714814443168102','DESSERTS_MIDI','DESSERTS_MIDI','2016-02-25 10:23:51',NULL,NULL,NULL,'2016-06-24 16:41:08','62251023519053854729_66231824102668470270.jpg','Small_62251023519053854729_66231824102668470270.jpg',NULL,'Big_62251023519053854729_66231824102668470270.jpg'),
  ('66241548223317709115','62191714814443168102','VIANDES_MIDI','VIANDES_MIDI','2016-06-24 15:48:22',NULL,NULL,NULL,'2016-06-24 16:41:20','66241548223317709115_66241843097780969372.jpg','Small_66241548223317709115_66241843097780969372.jpg',NULL,'Big_66241548223317709115_66241843097780969372.jpg'),
  ('6624155623802520193','62191714814443168102','POISSONS_MIDI','POISSONS_MIDI','2016-06-24 15:56:23',NULL,NULL,NULL,'2016-06-24 16:41:26','6624155623802520193_66241850543701103333.jpg','Small_6624155623802520193_66241850543701103333.jpg',NULL,'Big_6624155623802520193_66241850543701103333.jpg'),
  ('66241642496941084026','62191714814443168102','ENTREE_MIDI','ENTREE_MIDI','2016-06-24 16:42:04',NULL,NULL,NULL,NULL,'66241642496941084026_66241853415997975808.jpg','Small_66241642496941084026_66241853415997975808.jpg',NULL,'Big_66241642496941084026_66241853415997975808.jpg'),
  ('67201116423424670627','62191647763484829718','CHAMPAGNES','CHAMPAGNES','2016-07-20 11:16:42',NULL,NULL,NULL,NULL,'67201116423424670627_67201148553901755535.jpg','Small_67201116423424670627_67201148553901755535.jpg',NULL,'Big_67201116423424670627_67201148553901755535.jpg'),
  ('67201117418568801349','62191647763484829718','VINS AU VERRE','VINS AU VERRE','2016-07-20 11:17:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
COMMIT;

/* Data for the `t_ci_plat` table  (LIMIT 0,500) */

INSERT INTO `t_ci_plat` (`lg_CI_PLAT_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `str_STATUT`, `str_PICTURE`, `b_IS_SUGGEST`, `dt_UPDATED`, `lg_CI_TYPE_CARTE_ID`, `str_PIC_ORIGINALE`, `str_PIC_SMALL`, `str_PIC_MIDDLE`, `str_PIC_BIG`, `int_PRIX`) VALUES
  ('62221550197496795813','Salade de fruits','Salade de fruits','2016-02-22 15:50:19',NULL,NULL,0,'2016-02-25 12:55:06','62251023519053854729','62221550197496795813_73162025249078678760.jpg','Small_62221550197496795813_73162025249078678760.jpg',NULL,'Big_62221550197496795813_73162025249078678760.jpg',3000),
  ('62251026556963949293','Crème brullée à la lavande et à lachicorée','Crème brullée à la lavande et à lachicorée','2016-02-25 10:26:55',NULL,NULL,1,'2016-06-24 16:02:11','62251023519053854729','62251026556963949293_66231811218893651233.jpg','Small_62251026556963949293_66231811218893651233.jpg',NULL,'Big_62251026556963949293_66231811218893651233.jpg',5000),
  ('66241134120956465536','Martini Rouge','Martini Rouge','2016-06-24 11:34:01',NULL,NULL,0,'2016-07-20 11:37:37','62221202140931731554','66241134120956465536_6624113425601112209.jpg','Small_66241134120956465536_6624113425601112209.jpg',NULL,'Big_66241134120956465536_6624113425601112209.jpg',3500),
  ('66241550525476345124','Cassolette de Poulet','Cassolette de Poulet à la Brésilienne accompagnée d''une timbale de riz blanc parfumée aux champignons','2016-06-24 15:50:52',NULL,NULL,0,NULL,'66241548223317709115','66241550525476345124_6624192765646368151.jpg','Small_66241550525476345124_6624192765646368151.jpg',NULL,'Big_66241550525476345124_6624192765646368151.jpg',11000),
  ('66241552548225708121','Entrcote Importé USA','Entrcôte Importé USA grillée traditionnelle (400g) rösti au parmesan et sauce béarnaise maison','2016-06-24 15:52:54',NULL,NULL,0,NULL,'66241548223317709115','66241552548225708121_66241931460160977741.jpg','Small_66241552548225708121_66241931460160977741.jpg',NULL,'Big_66241552548225708121_66241931460160977741.jpg',23000),
  ('6624155408218800611','Carré d''agneau de France','Carré d''agneau de France sur purée de patate douce au curcuma, asperges vertes et jus','2016-06-24 15:54:00',NULL,NULL,0,NULL,'66241548223317709115','6624155408218800611_66241933317565375157.jpeg','Small_6624155408218800611_66241933317565375157.jpeg',NULL,'Big_6624155408218800611_66241933317565375157.jpeg',18500),
  ('66241556467912828191','Filet de Sole Panés et Frits','Filet de Sole Panés et Frits, dressé sur sauce tartare maison, petits légumes tournés et glacés','2016-06-24 15:56:46',NULL,NULL,0,NULL,'6624155623802520193','66241556467912828191_66241944714179684364.jpg','Small_66241556467912828191_66241944714179684364.jpg',NULL,'Big_66241556467912828191_66241944714179684364.jpg',10000),
  ('6624160198560049612','Soupe du pêcheur','Soupe du pêcheur façon bouillabaisse au poisson et fruits de mer','2016-06-24 16:00:01',NULL,NULL,0,NULL,'6624155623802520193','6624160198560049612_6624196259978024160.jpg','Small_6624160198560049612_6624196259978024160.jpg',NULL,'Big_6624160198560049612_6624196259978024160.jpg',12000),
  ('66241605419124721731','Thon mi cuit façon maquis','Thon mi cuit façon maquis et timbale de riz parfumé aux champignons','2016-06-24 16:00:54',NULL,NULL,0,NULL,'6624155623802520193','66241605419124721731_66241975061435025929.jpg','Small_66241605419124721731_66241975061435025929.jpg',NULL,'Big_66241605419124721731_66241975061435025929.jpg',10000),
  ('66241616285255588737','Magret de Canard','Magret de Canard cuit à la plancha, pommes de terres fumées, jus de vieux porto au Bissap','2016-06-24 16:16:28',NULL,NULL,0,NULL,'66241548223317709115','66241616285255588737_66241982398621434660.jpg','Small_66241616285255588737_66241982398621434660.jpg',NULL,'Big_66241616285255588737_66241982398621434660.jpg',14000),
  ('662416195854178321','Filet de porc','Filet de porc import au beurre maitre d''hôtel, croquettes de risotto aux pleurotes et son os  moelle','2016-06-24 16:19:05',NULL,NULL,0,NULL,'66241548223317709115','662416195854178321_66241911229758550446.jpg','Small_662416195854178321_66241911229758550446.jpg',NULL,'Big_662416195854178321_66241911229758550446.jpg',17000),
  ('66241621541222495488','Poelée de gambas','Poelée de gambas et son riz cuit minute dans sa bisque à l''essence traditionnelle','2016-06-24 16:21:54',NULL,NULL,0,NULL,'6624155623802520193','66241621541222495488_66241913223636982207.JPG','Small_66241621541222495488_66241913223636982207.JPG',NULL,'Big_66241621541222495488_66241913223636982207.JPG',14500),
  ('66241624441798997550','Méron cuit à la plancha','Méron cuit à la plancha, sauce, noix de coco avec chorizo de estragon, stir fry de légumes','2016-06-24 16:24:44',NULL,NULL,0,NULL,'6624155623802520193','66241624441798997550_66241915423507941423.jpg','Small_66241624441798997550_66241915423507941423.jpg',NULL,'Big_66241624441798997550_66241915423507941423.jpg',12500),
  ('66241628180340095956','Quenelle de mousse chocolat noir','Quenelle de mousse chocolat noir à la cannelle sur génoise imbibée au sirop calhua','2016-06-24 16:28:01',NULL,NULL,0,NULL,'62251023519053854729','66241628180340095956_66241918089989754952.jpg','Small_66241628180340095956_66241918089989754952.jpg',NULL,'Big_66241628180340095956_66241918089989754952.jpg',5500),
  ('6624163541277581533','Coupe glacée chocolat','Coupe glacée chocolat, bonoua et caramel au beurre salé et rice crispies caramélisés, arrosée ou sans vodka Absolut','2016-06-24 16:03:54',NULL,NULL,0,NULL,'62251023519053854729','6624163541277581533_66241919217258235767.jpg','Small_6624163541277581533_66241919217258235767.jpg',NULL,'Big_6624163541277581533_66241919217258235767.jpg',6000),
  ('6624165324440553813','Mille feuilles au caramel ','Mille feuilles au caramel et salé à sa quenelle de glace vanille','2016-06-24 16:05:03',NULL,NULL,0,NULL,'62251023519053854729','6624165324440553813_6624192292993524157.jpg','Small_6624165324440553813_6624192292993524157.jpg',NULL,'Big_6624165324440553813_6624192292993524157.jpg',5500),
  ('66241722758272371428','Gaspacho glacé ou épicé','Gaspacho glacé ou épicé avec ou sans insert de crabe mayonnaise à l''huile d''olive et zest de citron vert','2016-06-24 17:02:27',NULL,NULL,0,NULL,'66241642496941084026','66241722758272371428_66241924459804784594.jpg','Small_66241722758272371428_66241924459804784594.jpg',NULL,'Big_66241722758272371428_66241924459804784594.jpg',9000),
  ('66241731697392932164','Salade Nicoise','Salade Nicoise déstructurée au Thon Rouge grillée au piston de coriandre','2016-06-24 17:03:16',NULL,NULL,0,NULL,'66241642496941084026','66241731697392932164_66241925075445411572.jpg','Small_66241731697392932164_66241925075445411572.jpg',NULL,'Big_66241731697392932164_66241925075445411572.jpg',8000),
  ('66241735626578076872','Saumon fumé maison','Saumon fumé maison, toast aux œufs de poisson et granite de pamplemousse au basilic','2016-06-24 17:03:56',NULL,NULL,0,NULL,'66241642496941084026','66241735626578076872_66241925328929647258.jpg','Small_66241735626578076872_66241925328929647258.jpg',NULL,'Big_66241735626578076872_66241925328929647258.jpg',12500),
  ('6624174472289291407','Raviotes fraiches de fromage de chèvre','Raviotes fraiches de fromage de chèvre à l''arabiatta et copeaux de parmesan grana padano','2016-06-24 17:04:47',NULL,NULL,0,NULL,'66241642496941084026','6624174472289291407_66241925441844527692.jpg','Small_6624174472289291407_66241925441844527692.jpg',NULL,'Big_6624174472289291407_66241925441844527692.jpg',8000),
  ('67201138214221885441','Martini Blanc','Martini Blanc','2016-07-20 11:38:21',NULL,NULL,0,NULL,'62221202140931731554',NULL,NULL,NULL,NULL,3500),
  ('67201138375713556102','Campari','Campari','2016-07-20 11:38:37',NULL,NULL,0,NULL,'62221202140931731554',NULL,NULL,NULL,NULL,3500),
  ('67201139394856999989','Bailey''s','Bailey''s','2016-07-20 11:39:39',NULL,NULL,0,NULL,'62221202140931731554',NULL,NULL,NULL,NULL,5000),
  ('67201139559854571074','Pastis 51','Pastis 51','2016-07-20 11:39:05',NULL,NULL,0,NULL,'62221202140931731554',NULL,NULL,NULL,NULL,4500),
  ('67201139565612855412','Get 27','Get 27','2016-07-20 11:39:56',NULL,NULL,0,NULL,'62221202140931731554',NULL,NULL,NULL,NULL,5500),
  ('67201140165123226208','Jameson','Jameson','2016-07-20 11:40:16',NULL,NULL,0,NULL,'62221202140931731554',NULL,NULL,NULL,NULL,6500);
COMMIT;

/* Data for the `t_coffre_caisse` table  (LIMIT 0,500) */

INSERT INTO `t_coffre_caisse` (`ID_COFFRE_CAISSE`, `lg_USER_ID`, `int_AMOUNT`, `dt_CREATED`, `dt_UPDATED`, `ld_CREATED_BY`, `ld_UPDATED_BY`, `str_STATUT`) VALUES
  ('2017226144758785616','31017105229982132919',0,'2017-02-26 14:47:58','2017-02-26 14:48:04','admin','admin','is_assign'),
  ('20172281057451838872','31017105229982132919',0,'2017-02-28 10:57:45','2017-02-28 10:57:52','admin','admin','is_assign'),
  ('20173161319422558966','31017105229982132919',0,'2017-03-16 13:19:42','2017-03-16 13:19:52','admin','admin','is_assign'),
  ('20173161333166576857','42101057334294686',0,'2017-03-16 13:33:16','2017-03-16 13:35:01','admin','test','is_assign'),
  ('20173201050542744207','31017105229982132919',0,'2017-03-20 10:50:54','2017-03-20 10:51:00','admin','admin','is_assign'),
  ('20173299309167892','31017105229982132919',0,'2017-03-29 09:30:09','2017-03-29 09:30:15','admin','admin','is_assign'),
  ('20185281255453076832','31017105229982132919',10,'2018-05-28 12:55:45','2018-05-28 12:56:02','admin','admin','is_assign'),
  ('2018531842231951569','42150222079569572824',0,'2018-05-31 08:42:23','2018-05-31 08:42:54','admin','sandra','is_assign'),
  ('2018612212529822436','42150222079569572824',0,'2018-06-01 22:12:52','2018-06-01 22:13:21','admin','sandra','is_assign'),
  ('2018621211241436658','42150222079569572824',0,'2018-06-02 12:11:24','2018-06-02 12:15:00','admin','sandra','is_assign'),
  ('2018641157594044053','42150222079569572824',0,'2018-06-04 11:57:59','2018-06-04 12:11:03','sandra','sandra','close'),
  ('201864130553136433','42150222079569572824',0,'2018-06-04 13:00:55','2018-06-04 13:01:29','sandra','sandra','is_assign'),
  ('2018641310447811095','42150222079569572824',0,'2018-06-04 13:10:44','2018-06-04 13:10:46','sandra','sandra','is_assign'),
  ('2018641312348899195','42150222079569572824',0,'2018-06-04 13:12:34','2018-06-04 13:12:35','sandra','sandra','is_assign'),
  ('2018641332211053433','42150222079569572824',0,'2018-06-04 13:32:21','2018-06-04 13:32:21','sandra','sandra','is_assign'),
  ('201864139111214167','42150222079569572824',0,'2018-06-04 13:09:11','2018-06-04 13:09:13','sandra','sandra','is_assign'),
  ('2018651445471102667','42150222079569572824',0,'2018-06-05 14:45:47','2018-06-05 14:45:48','sandra','sandra','is_assign'),
  ('2018651740138102826','42150222079569572824',0,'2018-06-05 17:40:13','2018-06-05 17:40:14','sandra','sandra','is_assign'),
  ('2018651745166123238','42150222079569572824',0,'2018-06-05 17:45:16','2018-06-05 17:45:16','sandra','sandra','is_assign'),
  ('2018651752403811599','42150222079569572824',0,'2018-06-05 17:52:40','2018-06-05 17:52:40','sandra','sandra','is_assign'),
  ('2018652219144999903','42150222079569572824',0,'2018-06-05 22:19:14','2018-06-05 22:19:14','sandra','sandra','is_assign'),
  ('201866003645873','42150222079569572824',0,'2018-06-06 00:00:36','2018-06-06 00:00:36','sandra','sandra','is_assign');
COMMIT;

/* Data for the `t_commentaire` table  (LIMIT 0,500) */

INSERT INTO `t_commentaire` (`lg_COMMENTAIRE_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('72612563844512351216','Avec Sucre','Avec Sucre','2017-02-06 12:56:38','2017-04-25 14:32:14','enable'),
  ('72615442098499013724','Salee','Salee','2017-02-06 15:44:20','2017-04-25 14:23:44','enable'),
  ('72615443184782827231','Pimenté','Pimenté','2017-02-06 15:44:31',NULL,'enable'),
  ('7271357915553324330','A point','A point','2017-02-07 13:57:09',NULL,'enable'),
  ('7271723511767479144','Glacee','Glacee','2017-02-07 17:23:51',NULL,'enable'),
  ('74251423254719816960','Saignant','Saignant','2017-04-25 14:23:25',NULL,'enable'),
  ('74251424164387303825','Huileur','Huileur','2017-04-25 14:24:16',NULL,'enable'),
  ('74251424553107733144','Sec','Sec','2017-04-25 14:24:55',NULL,'enable'),
  ('74251426273565867792','Mur','Mur','2017-04-25 14:26:27',NULL,'enable'),
  ('74251427486374309463','Chaud','Chaud','2017-04-25 14:27:48',NULL,'enable'),
  ('74251427914111455906','Non Mur','Non Mur','2017-04-25 14:27:09',NULL,'enable'),
  ('74251428343361026881','Froid','Froid','2017-04-25 14:28:34',NULL,'enable'),
  ('74251429113237046217','Tiede','Tiede','2017-04-25 14:29:11',NULL,'enable'),
  ('74251431364933084314','Sans Sucre','Sans Sucre','2017-04-25 14:31:36',NULL,'enable'),
  ('7425143353378206625','Lourd','Lourd','2017-04-25 14:33:53',NULL,'enable'),
  ('74251434264565297769','Leger','Leger','2017-04-25 14:34:26','2017-04-25 14:55:04','enable'),
  ('74251453422129568450','Sans Lait','Sans Lait','2017-04-25 14:53:42',NULL,'enable'),
  ('7425145398162039460','Avec Lait','Avec Lait','2017-04-25 14:53:09','2017-04-25 14:55:13','enable');
COMMIT;

/* Data for the `t_cs_claviers` table  (LIMIT 0,500) */

INSERT INTO `t_cs_claviers` (`lg_CS_CLAVIERS_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('62291058366616334426','Accueil','Accueil','2016-02-29 10:58:36','2016-02-29 15:12:55','enable'),
  ('62291674537224496002','iuhhy','yugyugugyu','2016-02-29 16:07:45',NULL,'enable'),
  ('62291675384933426893','ftft','ftttcft','2016-02-29 16:07:53',NULL,'enable');
COMMIT;

/* Data for the `t_cs_fenetres` table  (LIMIT 0,500) */

INSERT INTO `t_cs_fenetres` (`lg_CS_FENETRES_ID`, `lg_CS_CLAVIERS_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('62291058575339312332','62291058366616334426','Fenetre1','Fenetre1','2016-02-29 10:58:57','2016-02-29 15:20:09','enable'),
  ('62291681337971505884','62291058366616334426','hhvbhvhvgh','hghvhvgh','2016-02-29 16:08:13',NULL,'enable');
COMMIT;

/* Data for the `t_cs_sous_fenetres` table  (LIMIT 0,500) */

INSERT INTO `t_cs_sous_fenetres` (`lg_CS_SOUS_FENETRES_ID`, `lg_CS_FENETRES_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('62291520519355138722','62291058575339312332','sous fenetre 1','sous fenetre 1','2016-02-29 15:20:51',NULL,'enable'),
  ('62291683355247246847','62291058575339312332','yugtg','ygtytyty','2016-02-29 16:08:33',NULL,'enable');
COMMIT;

/* Data for the `t_customer` table  (LIMIT 0,500) */

INSERT INTO `t_customer` (`lg_CUSTOMER_ID`, `str_LOGIN`, `str_PASSWORD`, `dt_CREATED`, `dt_UPDATED`, `str_FIRST_NAME`, `str_LAST_NAME`, `str_LAST_CONNECTION_DATE`, `str_STATUT`, `lg_SKIN_ID`, `lg_Language_ID`, `dt_LAST_ACTIVITY`, `FUNCTION`, `str_PHONE`, `str_MAIL`, `str_ADRESSE`, `str_GPS`, `str_AUTH_METHODE`, `str_UID_EXT`) VALUES
  ('1','47204771','4a7d1ed414474e4033ac29ccb8653d9b',NULL,'2014-10-20 14:15:19','Jean','Pierre','2013-10-23 16:04:41','enable','1','1',NULL,'administrateur','47204771','pierre.jean@e-capafrica.com',NULL,NULL,'FLEX_COMPTA',NULL),
  ('7328223819893976987','363226','4a7d1ed414474e4033ac29ccb8653d9b','2017-03-28 22:38:19','2018-05-23 13:10:51','DR ADEPOH MICHELE DORCAS','DR ADEPOH MICHELE DORCAS',NULL,'enable','1','1',NULL,NULL,'000000','',NULL,NULL,'FLEX_COMPTA',NULL),
  ('73282238201874001502','292716','4a7d1ed414474e4033ac29ccb8653d9b','2017-03-28 22:38:20','2018-05-23 13:10:53','DR YESUFU AKIM OWABUNMI','DR YESUFU AKIM OWABUNMI',NULL,'enable','1','1',NULL,NULL,'000','',NULL,NULL,'FLEX_COMPTA',NULL),
  ('73282238203641559702','160565','4a7d1ed414474e4033ac29ccb8653d9b','2017-03-28 22:38:20','2018-05-23 13:10:55','DR GNEBEI ROGER','DR GNEBEI ROGER',NULL,'enable','1','1',NULL,NULL,'000','',NULL,NULL,'FLEX_COMPTA',NULL),
  ('7330126922452946699','','4a7d1ed414474e4033ac29ccb8653d9b','2017-03-30 13:06:09','2017-04-03 15:25:34','KEN MASTER','KEN MASTER1',NULL,'enable','1','1',NULL,NULL,'','',NULL,NULL,'FLEX_COMPTA',NULL),
  ('7441047940159143495','501012','4a7d1ed414474e4033ac29ccb8653d9b','2017-04-04 10:47:09',NULL,'KEN MASTER','KEN MASTER',NULL,'enable','1','1',NULL,NULL,'','',NULL,NULL,'FLEX_COMPTA',NULL),
  ('74417505547281016137','4855555','4a7d1ed414474e4033ac29ccb8653d9b','2017-04-04 17:50:55',NULL,'Djeke Joseph','Djeke Joseph',NULL,'enable','1','1',NULL,NULL,'','',NULL,NULL,'FLEX_COMPTA',NULL),
  ('83232330232046430254','jules','4a7d1ed414474e4033ac29ccb8653d9b','2018-03-23 23:30:23','2018-05-09 20:34:35','koffi','jules','2018-05-09 20:34:34','enable','1','1',NULL,NULL,'77257361','juleskoffi@gmail.com',NULL,'5.35428061059091;-3.9628449641168113','FLEX_COMPTA',NULL),
  ('84221657214901579771','thierrybekola@gmail.com','4a7d1ed414474e4033ac29ccb8653d9b','2018-04-22 16:57:21','2018-06-05 19:38:08','thierry bekola','thierry bekola',NULL,'enable','1','1',NULL,NULL,'99347035','thierrybekola@gmail.com',NULL,'5.4064975000000075;-3.9907539062500206','GOOGLE','BsmzD0GcNmP73GcqEnrZtrlOnnh1'),
  ('84271157282394385936','berteaminata92@gmail.com','4a7d1ed414474e4033ac29ccb8653d9b','2018-04-27 11:57:28','2018-04-27 11:58:51','Aminata Berte','Aminata Berte',NULL,'enable','1','1',NULL,NULL,'','berteaminata92@gmail.com',NULL,'0;0','GOOGLE','a7P9VFW8LKUXFAfF27KdbzE1Vx13'),
  ('84271221546941615824','khalhynoubisubisou@gmail.com','4a7d1ed414474e4033ac29ccb8653d9b','2018-04-27 12:21:54','2018-04-27 12:23:09','fatima kouame','fatima kouame',NULL,'enable','1','1',NULL,NULL,'','khalhynoubisubisou@gmail.com',NULL,'0;0','GOOGLE','PSKmrAcKJYZvGXDz9PxLkWJuZOm1'),
  ('84271291473011327806','hienclement2@gmail.com','4a7d1ed414474e4033ac29ccb8653d9b','2018-04-27 12:09:14','2018-04-27 12:10:26','CLEMENT HIEN','CLEMENT HIEN',NULL,'enable','1','1',NULL,NULL,'','hienclement2@gmail.com',NULL,'0;0','GOOGLE','MBbqwFYhO5QF4niGCNxcTWeNgGQ2'),
  ('8427823982924787578','tchumunvalentia@gmail.com','4a7d1ed414474e4033ac29ccb8653d9b','2018-04-27 08:23:09','2018-04-27 08:34:50','Valentia Tchumun','Valentia Tchumun',NULL,'enable','1','1',NULL,NULL,'','tchumunvalentia@gmail.com',NULL,'0;0','GOOGLE','ghWJ2ihrj2YKjEdJDGMSSodwmNG3'),
  ('84281749262282774462','cendrinebekola@gmail.com','4a7d1ed414474e4033ac29ccb8653d9b','2018-04-28 17:49:26','2018-04-28 17:52:42','Bekola Cendrine','Bekola Cendrine',NULL,'enable','1','1',NULL,NULL,'','cendrinebekola@gmail.com',NULL,'0;0','GOOGLE','CG02O42dYvQaqkVoTxO1SAyTy4H3'),
  ('84291534142747569426','jeanmariebehou502@gmail.com','4a7d1ed414474e4033ac29ccb8653d9b','2018-04-29 15:34:14','2018-04-29 15:36:42','Jean Marie Behou','Jean Marie Behou',NULL,'enable','1','1',NULL,NULL,'','jeanmariebehou502@gmail.com',NULL,'0;0','GOOGLE','prCIXNZSupgjEFeCBQZrSt2UDKq1'),
  ('8541837419331691437','kouamekoffivictorien@gmail.com','4a7d1ed414474e4033ac29ccb8653d9b','2018-05-04 18:37:04','2018-05-04 18:37:48','Koffi Victorien KouamÃ©','Koffi Victorien KouamÃ©',NULL,'enable','1','1',NULL,NULL,'','kouamekoffivictorien@gmail.com',NULL,'0;0','GOOGLE','AeNoOtmipXO9mhkqJBCIEL63Zx93'),
  ('85514565491720232809','e.prosper14@gmail.com','4a7d1ed414474e4033ac29ccb8653d9b','2018-05-05 14:56:54','2018-05-05 14:57:38','Prosper emperor','Prosper emperor',NULL,'enable','1','1',NULL,NULL,'','e.prosper14@gmail.com',NULL,'0;0','GOOGLE','cyQ0bT3UY3XiASQYRizULBbJEU43'),
  ('8631124257524938461','kakolivier@gmail.com','4a7d1ed414474e4033ac29ccb8653d9b','2018-06-05 23:12:49',NULL,'Olivier KAKOU','Olivier KAKOU',NULL,'enable','1','1',NULL,NULL,'','kakolivier@gmail.com',NULL,NULL,'GOOGLE','rJX0dRxmnEVYTUbwOn2Tzej7mEb2'),
  ('86319454848657228617','gaeldjomo1987@gmail.com','4a7d1ed414474e4033ac29ccb8653d9b','2018-06-05 23:12:49','2018-06-03 19:47:14','gael djomo deffo','gael djomo deffo',NULL,'enable','1','1',NULL,NULL,'79930185','gaeldjomo1987@gmail.com',NULL,'5.40699750000001;-3.977160156249979','GOOGLE','Qf4vCWWUEHNz1E0empKNrVThrPz2'),
  ('86321163312098531986','jfeubi@gmail.com','4a7d1ed414474e4033ac29ccb8653d9b','2018-06-05 23:12:49','2018-06-03 21:19:12','joel feubi','joel feubi',NULL,'enable','1','1',NULL,NULL,'670000941','jfeubi@gmail.com',NULL,'2.0861374999999995;12.321496093750014','GOOGLE','jtk13D4B5BhVLEmta2iB2E7J6ue2'),
  ('8632153922774876253','diabatekadi07@gmail.com','4a7d1ed414474e4033ac29ccb8653d9b','2018-06-05 23:12:49','2018-06-03 21:54:57','diabate kadi','diabate kadi',NULL,'enable','1','1',NULL,NULL,'09839982','diabatekadi07@gmail.com',NULL,'-1.7499999991343884E-5;1.953125000397904E-5','GOOGLE','s1tURKauMUeiBIdnPt5y8IaVmO83'),
  ('864747814441592531','nkomessebe@yahoo.fr','4a7d1ed414474e4033ac29ccb8653d9b','2018-06-05 23:12:49','2018-06-04 08:03:05','Yvonne Virginie assomo bilongo','Yvonne Virginie assomo bilongo',NULL,'enable','1','1',NULL,NULL,'699862326','nkomessebe@yahoo.fr',NULL,'4.0234424999999945;9.701753906249976','GOOGLE','64Y6lEH4uNaG0Q20dRscGzkkAit2'),
  ('8657535876915409035','nadiassamala12@gmail.com','4a7d1ed414474e4033ac29ccb8653d9b','2018-06-05 23:12:49',NULL,'Lorraine Nadia','Lorraine Nadia',NULL,'enable','1','1',NULL,NULL,'','nadiassamala12@gmail.com',NULL,NULL,'GOOGLE','gUBrMleCzeMICjuZLkm5k1k9vTk2');
COMMIT;

/* Data for the `t_customer_account` table  (LIMIT 0,500) */

INSERT INTO `t_customer_account` (`lg_CUSTOMER_ACCOUNT_ID`, `lg_CUSTOMER_ID`, `int_SOLDE`, `int_SOLDE_MINIMAL`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`, `str_PASSWORD`, `str_LOGIN`) VALUES
  ('732822382011146610','7328223819893976987',0,0,'2017-03-28 22:38:20',NULL,'enable',NULL,NULL),
  ('73282238202414005273','73282238201874001502',0,0,'2017-03-28 22:38:20',NULL,'enable',NULL,NULL),
  ('73282238204568617783','73282238203641559702',0,0,'2017-03-28 22:38:20',NULL,'enable',NULL,NULL),
  ('7330126929396391415','7330126922452946699',0,0,'2017-03-30 13:06:09',NULL,'enable',NULL,NULL),
  ('7441047968071583788','7441047940159143495',0,0,'2017-04-04 10:47:09',NULL,'enable',NULL,NULL),
  ('74417505563336709966','74417505547281016137',0,0,'2017-04-04 17:50:55',NULL,'enable',NULL,NULL),
  ('83232330236741977331','83232330232046430254',0,0,'2018-03-23 23:30:23','2018-05-24 18:28:21','enable',NULL,NULL),
  ('84221657222332544271','84221657214901579771',-1021925,0,'2018-04-22 16:57:22','2018-06-05 23:46:06','enable',NULL,NULL),
  ('84271157282815351949','84271157282394385936',0,0,'2018-04-27 11:57:28','2018-05-24 18:28:25','enable',NULL,NULL),
  ('84271221547126700222','84271221546941615824',0,0,'2018-04-27 12:21:54','2018-05-24 18:28:28','enable',NULL,NULL),
  ('84271291488566916275','84271291473011327806',0,0,'2018-04-27 12:09:14','2018-05-24 18:28:29','enable',NULL,NULL),
  ('8427823990515884481','8427823982924787578',0,0,'2018-04-27 08:23:09','2018-05-24 18:28:31','enable',NULL,NULL),
  ('84281749262778542441','84281749262282774462',0,0,'2018-04-28 17:49:26','2018-05-24 18:28:33','enable',NULL,NULL),
  ('84291534141869656446','84291534142747569426',0,0,'2018-04-29 15:34:14','2018-05-24 18:28:34','enable',NULL,NULL),
  ('8541837424486171172','8541837419331691437',0,0,'2018-05-04 18:37:04','2018-05-24 18:28:36','enable',NULL,NULL),
  ('85514565575839428396','85514565491720232809',0,0,'2018-05-05 14:56:55','2018-05-24 18:28:37','enable',NULL,NULL),
  ('86311242578499896961','8631124257524938461',0,0,'2018-06-05 23:14:56',NULL,'enable',NULL,NULL),
  ('86319454854864401486','86319454848657228617',-9840,0,'2018-06-05 23:14:56','2018-06-03 20:08:46','enable',NULL,NULL),
  ('86321163313528328933','86321163312098531986',-5330,0,'2018-06-05 23:14:56','2018-06-03 21:19:12','enable',NULL,NULL),
  ('8632153924240468491','8632153922774876253',-2870,0,'2018-06-05 23:14:56','2018-06-03 21:54:57','enable',NULL,NULL),
  ('864747815951333055','864747814441592531',-820,0,'2018-06-05 23:14:56','2018-06-04 08:03:05','enable',NULL,NULL),
  ('8657535880124722237','8657535876915409035',0,0,'2018-06-05 23:14:56',NULL,'enable',NULL,NULL);
COMMIT;

/* Data for the `t_institutions` table  (LIMIT 0,500) */

INSERT INTO `t_institutions` (`lg_INSTITUTION_ID`, `str_NAME`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`, `str_ADRESSE`, `str_EMAIL`, `str_LOGO_LARGE`, `str_LOGO_MIDDLE`, `str_LOGO_SMALL`, `str_NUM_CONTRIBUABLE`, `str_PARAM_1`, `str_PARAM_2`, `str_PARAM_3`, `str_PHONE`, `str_GPS`) VALUES
  ('1','etat de cote d''ivoire',NULL,NULL,'enable','dffdfgfd','xfvfdsfgfdg','fgfd','dfgd','dfgdffd','fdgdf','dfgfd','dfgf','dfgfd','dfgfd',NULL);
COMMIT;

/* Data for the `t_customer_institutions` table  (LIMIT 0,500) */

INSERT INTO `t_customer_institutions` (`lg_CUSTOMER_INSTITUTIONS_ID`, `lg_INSTITUTION_ID`, `lg_CUSTOMER_ID`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('31017138219583898279','1','1',NULL,NULL,'enable');
COMMIT;

/* Data for the `t_schema_carte` table  (LIMIT 0,500) */

INSERT INTO `t_schema_carte` (`lg_SCHEMA_CARTE_ID`, `str_DESCRIPTION`, `str_NAME`, `lg_INSTITUTION_ID`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('1','carte administratif','carte administratif','1',NULL,NULL,'enable');
COMMIT;

/* Data for the `t_type_depense` table  (LIMIT 0,500) */

INSERT INTO `t_type_depense` (`lg_TYPE_DEPENSE_ID`, `str_TYPE_DEPENSE`, `str_NUMERO_COMPTE`) VALUES
  ('1','Salaire','098'),
  ('3','gjgfjfg','5555'),
  ('5','rtrturtu','5455');
COMMIT;

/* Data for the `t_event_log` table  (LIMIT 0,500) */

INSERT INTO `t_event_log` (`lg_EVENT_LOG_ID`, `MATRICULE_ELEVE`, `dt_CREATED`, `dt_UPDATED`, `str_DESCRIPTION`, `str_CREATED_BY`, `str_UPDATED_BY`, `str_STATUT`, `str_TABLE_CONCERN`, `str_MODULE_CONCERN`) VALUES
  ('2016710195612833023',NULL,'2016-07-10 19:56:12',NULL,'Reaprovisionement de la caisse de admin dun montant de 25000','admin',NULL,'enable','t_coffre_caisse','caisse'),
  ('20167101956281291598',NULL,'2016-07-10 19:56:28',NULL,'Ouverture de la caisse de  admin avec un montant de 25000','admin',NULL,'enable','t_coffre_caisse,t_resume_caisse,t_caisse','caisse'),
  ('20172261447585231142',NULL,'2017-02-26 14:47:58',NULL,'Reaprovisionement de la caisse de admin dun montant de 0','admin',NULL,'enable','t_coffre_caisse','caisse'),
  ('20172261448306685577',NULL,'2017-02-26 14:48:30',NULL,'Enregistrement d une somme de  2700.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226144830994627',NULL,'2017-02-26 14:48:30',NULL,'Enregistrement d une somme de  15000.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172261448321262698',NULL,'2017-02-26 14:48:32',NULL,'depense d une somme de  12300.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('201722614484446477',NULL,'2017-02-26 14:48:04',NULL,'Ouverture de la caisse de  admin avec un montant de 0','admin',NULL,'enable','t_coffre_caisse,t_resume_caisse,t_caisse','caisse'),
  ('2017226145093317752',NULL,'2017-02-26 14:50:09',NULL,'Enregistrement d une somme de  12300.0 pour type de recette : Remboursement','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226165737611524',NULL,'2017-02-26 16:57:03',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('201722616574445561',NULL,'2017-02-26 16:57:04',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226165750111745',NULL,'2017-02-26 16:57:50',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172261657507406658',NULL,'2017-02-26 16:57:50',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226165752945606',NULL,'2017-02-26 16:57:52',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017226165754526437',NULL,'2017-02-26 16:57:54',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172261657551663270',NULL,'2017-02-26 16:57:55',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172261657561463453',NULL,'2017-02-26 16:57:56',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017226165758311468',NULL,'2017-02-26 16:57:05',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172261715205854921',NULL,'2017-02-26 17:15:20',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172261715229913753',NULL,'2017-02-26 17:15:22',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172261715312859553',NULL,'2017-02-26 17:15:31',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172261717358194404',NULL,'2017-02-26 17:17:35',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172261717361958106',NULL,'2017-02-26 17:17:36',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172261717372356482',NULL,'2017-02-26 17:17:37',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172261730184785971',NULL,'2017-02-26 17:30:18',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172261730188855469',NULL,'2017-02-26 17:30:18',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226173020294680',NULL,'2017-02-26 17:30:20',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017226183646949512',NULL,'2017-02-26 18:36:04',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226183649829011',NULL,'2017-02-26 18:36:04',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172261836665620',NULL,'2017-02-26 18:36:06',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172261842453304104',NULL,'2017-02-26 18:42:45',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226184245664718',NULL,'2017-02-26 18:42:45',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172261842467652274',NULL,'2017-02-26 18:42:46',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172261852554644512',NULL,'2017-02-26 18:52:55',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172261852557556089',NULL,'2017-02-26 18:52:55',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172261852565172304',NULL,'2017-02-26 18:52:56',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172261852583647792',NULL,'2017-02-26 18:52:58',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226185258393035',NULL,'2017-02-26 18:52:58',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172261852591006153',NULL,'2017-02-26 18:52:59',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017226195638396369',NULL,'2017-02-26 19:56:38',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172261956386714276',NULL,'2017-02-26 19:56:38',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('201722619563960889',NULL,'2017-02-26 19:56:39',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172261956413047158',NULL,'2017-02-26 19:56:41',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172261956416227952',NULL,'2017-02-26 19:56:41',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226195642570491',NULL,'2017-02-26 19:56:42',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172262025427806830',NULL,'2017-02-26 20:25:42',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226202543835934',NULL,'2017-02-26 20:25:43',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226202543930976',NULL,'2017-02-26 20:25:43',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172262025454517669',NULL,'2017-02-26 20:25:45',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262025457073534',NULL,'2017-02-26 20:25:45',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262025463946584',NULL,'2017-02-26 20:25:46',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017226202915919533',NULL,'2017-02-26 20:29:01',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('201722620292696536',NULL,'2017-02-26 20:29:02',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226202929872038',NULL,'2017-02-26 20:29:02',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017226202945867163',NULL,'2017-02-26 20:29:04',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226202948406543',NULL,'2017-02-26 20:29:04',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226202955599198',NULL,'2017-02-26 20:29:05',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172262032321132703',NULL,'2017-02-26 20:32:32',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262032324759996',NULL,'2017-02-26 20:32:32',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262032333972663',NULL,'2017-02-26 20:32:33',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172262032366557064',NULL,'2017-02-26 20:32:36',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262032369196221',NULL,'2017-02-26 20:32:36',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262032375368620',NULL,'2017-02-26 20:32:37',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172262032437678757',NULL,'2017-02-26 20:32:43',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262032453756322',NULL,'2017-02-26 20:32:45',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262032463509593',NULL,'2017-02-26 20:32:46',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172262032575609026',NULL,'2017-02-26 20:32:57',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262032578923836',NULL,'2017-02-26 20:32:57',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262032585815840',NULL,'2017-02-26 20:32:58',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017226203303064723',NULL,'2017-02-26 20:33:00',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226203305685625',NULL,'2017-02-26 20:33:00',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('201722620331403653',NULL,'2017-02-26 20:33:01',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172262033191115374',NULL,'2017-02-26 20:33:19',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262033194539666',NULL,'2017-02-26 20:33:19',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262033206791581',NULL,'2017-02-26 20:33:20',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172262034251844318',NULL,'2017-02-26 20:34:25',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262034255449561',NULL,'2017-02-26 20:34:25',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262034265338234',NULL,'2017-02-26 20:34:26',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172262046161692264',NULL,'2017-02-26 20:46:16',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262046163691800',NULL,'2017-02-26 20:46:16',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262046169963330',NULL,'2017-02-26 20:46:16',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172262046586288958',NULL,'2017-02-26 20:46:58',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226204659658991',NULL,'2017-02-26 20:46:59',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262046597375406',NULL,'2017-02-26 20:46:59',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017226208553301912',NULL,'2017-02-26 20:08:55',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226208556158263',NULL,'2017-02-26 20:08:55',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226208562903494',NULL,'2017-02-26 20:08:56',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017226208581044864',NULL,'2017-02-26 20:08:58',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226208585388191',NULL,'2017-02-26 20:08:58',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226208595679453',NULL,'2017-02-26 20:08:59',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017226210385093422',NULL,'2017-02-26 21:00:38',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226210387087215',NULL,'2017-02-26 21:00:38',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('201722621039330551',NULL,'2017-02-26 21:00:39',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017226210407298145',NULL,'2017-02-26 21:00:40',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226210409063444',NULL,'2017-02-26 21:00:40',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226210415357681',NULL,'2017-02-26 21:00:41',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017226211011987979',NULL,'2017-02-26 21:10:11',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172262110321275499',NULL,'2017-02-26 21:10:32',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262110323889217',NULL,'2017-02-26 21:10:32',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('201722621103243167',NULL,'2017-02-26 21:10:03',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262110331007671',NULL,'2017-02-26 21:10:33',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172262110343194119',NULL,'2017-02-26 21:10:34',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262110347677479',NULL,'2017-02-26 21:10:34',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226211034848411',NULL,'2017-02-26 21:10:03',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262110356789814',NULL,'2017-02-26 21:10:35',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017226211041012857',NULL,'2017-02-26 21:10:04',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017226211055038654',NULL,'2017-02-26 21:10:05',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('201722621105878920',NULL,'2017-02-26 21:10:05',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('201722621107452542',NULL,'2017-02-26 21:10:07',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017226211092734322',NULL,'2017-02-26 21:10:09',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('201722621109961973',NULL,'2017-02-26 21:10:09',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226211301908624',NULL,'2017-02-26 21:01:30',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226211304231846',NULL,'2017-02-26 21:01:30',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('201722621131164872',NULL,'2017-02-26 21:01:31',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172262123435478561',NULL,'2017-02-26 21:23:43',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262123437302715',NULL,'2017-02-26 21:23:43',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262123443632742',NULL,'2017-02-26 21:23:44',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172262132416787699',NULL,'2017-02-26 21:32:41',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262132421006064',NULL,'2017-02-26 21:32:42',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262132428854434',NULL,'2017-02-26 21:32:42',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172262133121272821',NULL,'2017-02-26 21:33:12',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262133123975274',NULL,'2017-02-26 21:33:12',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226213313599092',NULL,'2017-02-26 21:33:13',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172262135367381270',NULL,'2017-02-26 21:35:36',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262135378236868',NULL,'2017-02-26 21:35:37',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017226213537842870',NULL,'2017-02-26 21:35:37',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262136362527497',NULL,'2017-02-26 21:36:36',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226213636269585',NULL,'2017-02-26 21:36:36',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262136369582918',NULL,'2017-02-26 21:36:36',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172262136381127600',NULL,'2017-02-26 21:36:38',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262136383854666',NULL,'2017-02-26 21:36:38',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262136392402651',NULL,'2017-02-26 21:36:39',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172262138324219505',NULL,'2017-02-26 21:38:32',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262138326421042',NULL,'2017-02-26 21:38:32',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172262138332382053',NULL,'2017-02-26 21:38:33',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017226219224156881',NULL,'2017-02-26 21:09:22',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('201722621922845359',NULL,'2017-02-26 21:09:22',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('201722621923878522',NULL,'2017-02-26 21:09:23',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017226219243864433',NULL,'2017-02-26 21:09:24',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226219245643222',NULL,'2017-02-26 21:09:24',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226219251156200',NULL,'2017-02-26 21:09:25',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017226219267451863',NULL,'2017-02-26 21:09:26',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226219271276664',NULL,'2017-02-26 21:09:27',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017226219278691938',NULL,'2017-02-26 21:09:27',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172281057454977568',NULL,'2017-02-28 10:57:45',NULL,'Reaprovisionement de la caisse de admin dun montant de 0','admin',NULL,'enable','t_coffre_caisse','caisse'),
  ('20172281057526831629',NULL,'2017-02-28 10:57:52',NULL,'Ouverture de la caisse de  admin avec un montant de 0','admin',NULL,'enable','t_coffre_caisse,t_resume_caisse,t_caisse','caisse'),
  ('20172281058127382524',NULL,'2017-02-28 10:58:12',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281058131065',NULL,'2017-02-28 10:58:13',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281058143026686',NULL,'2017-02-28 10:58:14',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172281059308712246',NULL,'2017-02-28 10:59:30',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281059311417658',NULL,'2017-02-28 10:59:31',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017228105932416043',NULL,'2017-02-28 10:59:32',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172281123267784269',NULL,'2017-02-28 11:23:26',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017228112327546996',NULL,'2017-02-28 11:23:27',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281123277933201',NULL,'2017-02-28 11:23:27',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172281137496275252',NULL,'2017-02-28 11:37:49',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281137498608938',NULL,'2017-02-28 11:37:49',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017228113750603760',NULL,'2017-02-28 11:37:50',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172281138135064982',NULL,'2017-02-28 11:38:13',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281138139211658',NULL,'2017-02-28 11:38:13',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281138147208230',NULL,'2017-02-28 11:38:14',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017228117544028121',NULL,'2017-02-28 11:07:54',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017228117546622150',NULL,'2017-02-28 11:07:54',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017228117554343104',NULL,'2017-02-28 11:07:55',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172281254272098273',NULL,'2017-02-28 12:54:27',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281254279191004',NULL,'2017-02-28 12:54:27',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281254293547395',NULL,'2017-02-28 12:54:29',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172281255163059289',NULL,'2017-02-28 12:55:16',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017228125516769064',NULL,'2017-02-28 12:55:16',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281255174041820',NULL,'2017-02-28 12:55:17',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017228125777073503',NULL,'2017-02-28 12:57:07',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281257875997',NULL,'2017-02-28 12:57:08',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017228125787996718',NULL,'2017-02-28 12:57:08',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172281316424912744',NULL,'2017-02-28 13:16:42',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281316428724679',NULL,'2017-02-28 13:16:42',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281316438022084',NULL,'2017-02-28 13:16:43',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172281318419197510',NULL,'2017-02-28 13:18:41',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281318421607016',NULL,'2017-02-28 13:18:42',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281318429445215',NULL,'2017-02-28 13:18:42',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172281326322474724',NULL,'2017-02-28 13:26:32',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281326325947420',NULL,'2017-02-28 13:26:32',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281326337798216',NULL,'2017-02-28 13:26:33',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172281344422367484',NULL,'2017-02-28 13:44:42',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017228134442827599',NULL,'2017-02-28 13:44:42',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017228134444205361',NULL,'2017-02-28 13:44:44',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('20172281346171459121',NULL,'2017-02-28 13:46:17',NULL,'Enregistrement d une somme de  5238.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281346175438986',NULL,'2017-02-28 13:46:17',NULL,'Enregistrement d une somme de  29100.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281346208427653',NULL,'2017-02-28 13:46:20',NULL,'Enregistrement d une somme de  5238.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281346213393264',NULL,'2017-02-28 13:46:21',NULL,'Enregistrement d une somme de  29100.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281346283583163',NULL,'2017-02-28 13:46:28',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('201722813462988361',NULL,'2017-02-28 13:46:29',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281346332413253',NULL,'2017-02-28 13:46:33',NULL,'Enregistrement d une somme de  2700.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20172281346336712432',NULL,'2017-02-28 13:46:33',NULL,'Enregistrement d une somme de  15000.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20173161319425483419',NULL,'2017-03-16 13:19:42',NULL,'Reaprovisionement de la caisse de admin dun montant de 0','admin',NULL,'enable','t_coffre_caisse','caisse'),
  ('20173161319522445792',NULL,'2017-03-16 13:19:52',NULL,'Ouverture de la caisse de  admin avec un montant de 0','admin',NULL,'enable','t_coffre_caisse,t_resume_caisse,t_caisse','caisse'),
  ('20173161320168413046',NULL,'2017-03-16 13:20:16',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017316132017621442',NULL,'2017-03-16 13:20:17',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20173161320178006282',NULL,'2017-03-16 13:20:17',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','admin',NULL,'enable','t_depenses','caisse'),
  ('2017316133316764238',NULL,'2017-03-16 13:33:16',NULL,'Reaprovisionement de la caisse de test dun montant de 0','admin',NULL,'enable','t_coffre_caisse','caisse'),
  ('2017316133511578469',NULL,'2017-03-16 13:35:01',NULL,'Ouverture de la caisse de  test avec un montant de 0','test',NULL,'enable','t_coffre_caisse,t_resume_caisse,t_caisse','caisse'),
  ('20173161358412042736',NULL,'2017-03-16 13:58:41',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','test',NULL,'enable','t_recettes','caisse'),
  ('20173161358414765732',NULL,'2017-03-16 13:58:41',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','test',NULL,'enable','t_recettes','caisse'),
  ('20173161358423194141',NULL,'2017-03-16 13:58:42',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','test',NULL,'enable','t_depenses','caisse'),
  ('20173161411529246019',NULL,'2017-03-16 14:11:52',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20173161411531601847',NULL,'2017-03-16 14:11:53',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20173161417466956252',NULL,'2017-03-16 14:17:46',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','test',NULL,'enable','t_recettes','caisse'),
  ('2017316141747366773',NULL,'2017-03-16 14:17:47',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','test',NULL,'enable','t_recettes','caisse'),
  ('20173161417477636094',NULL,'2017-03-16 14:17:47',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','test',NULL,'enable','t_depenses','caisse'),
  ('20173161423431023771',NULL,'2017-03-16 14:23:43',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','test',NULL,'enable','t_recettes','caisse'),
  ('20173161423433157801',NULL,'2017-03-16 14:23:43',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','test',NULL,'enable','t_recettes','caisse'),
  ('2017316142344496302',NULL,'2017-03-16 14:23:44',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','test',NULL,'enable','t_depenses','caisse'),
  ('2017316142537877721',NULL,'2017-03-16 14:25:37',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','test',NULL,'enable','t_recettes','caisse'),
  ('20173161425381406316',NULL,'2017-03-16 14:25:38',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','test',NULL,'enable','t_recettes','caisse'),
  ('20173161425387837417',NULL,'2017-03-16 14:25:38',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','test',NULL,'enable','t_depenses','caisse'),
  ('2017316143042990899',NULL,'2017-03-16 14:30:42',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','test',NULL,'enable','t_recettes','caisse'),
  ('20173161430433155207',NULL,'2017-03-16 14:30:43',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','test',NULL,'enable','t_recettes','caisse'),
  ('20173161430443367099',NULL,'2017-03-16 14:30:44',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','test',NULL,'enable','t_depenses','caisse'),
  ('20173161431357331886',NULL,'2017-03-16 14:31:35',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','test',NULL,'enable','t_recettes','caisse'),
  ('20173161431359368255',NULL,'2017-03-16 14:31:35',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','test',NULL,'enable','t_recettes','caisse'),
  ('20173161431367235939',NULL,'2017-03-16 14:31:36',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','test',NULL,'enable','t_depenses','caisse'),
  ('20173161951573459849',NULL,'2017-03-16 19:51:57',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20173161951575924230',NULL,'2017-03-16 19:51:57',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017316195213408129',NULL,'2017-03-16 19:52:13',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20173161952136447362',NULL,'2017-03-16 19:52:13',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20173161957532292787',NULL,'2017-03-16 19:57:53',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','test',NULL,'enable','t_recettes','caisse'),
  ('20173161957534615797',NULL,'2017-03-16 19:57:53',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','test',NULL,'enable','t_recettes','caisse'),
  ('20173161957547084961',NULL,'2017-03-16 19:57:54',NULL,'depense d une somme de  0.0 pour type de depense : Salaire','test',NULL,'enable','t_depenses','caisse'),
  ('201731620185656599',NULL,'2017-03-16 20:01:08',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('201731620187685819',NULL,'2017-03-16 20:01:08',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017316202177814010',NULL,'2017-03-16 20:02:17',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Remboursement','admin',NULL,'enable','t_recettes','caisse'),
  ('201731620223938346',NULL,'2017-03-16 20:02:23',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Remboursement','admin',NULL,'enable','t_recettes','caisse'),
  ('201731620227241090',NULL,'2017-03-16 20:02:27',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Remboursement','admin',NULL,'enable','t_recettes','caisse'),
  ('20173162040115261215',NULL,'2017-03-16 20:40:11',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20173162040119029860',NULL,'2017-03-16 20:40:11',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20173162040211324736',NULL,'2017-03-16 20:40:21',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20173162040213976363',NULL,'2017-03-16 20:40:21',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017316204126651178',NULL,'2017-03-16 20:04:12',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Remboursement','admin',NULL,'enable','t_recettes','caisse'),
  ('2017316204158885692',NULL,'2017-03-16 20:04:15',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Remboursement','admin',NULL,'enable','t_recettes','caisse'),
  ('201731620421667380',NULL,'2017-03-16 20:04:21',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Remboursement','admin',NULL,'enable','t_recettes','caisse'),
  ('201731620427503822',NULL,'2017-03-16 20:04:27',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Remboursement','admin',NULL,'enable','t_recettes','caisse'),
  ('2017316204313954840',NULL,'2017-03-16 20:04:31',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Remboursement','admin',NULL,'enable','t_recettes','caisse'),
  ('201731620448622410',NULL,'2017-03-16 20:04:48',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('201731620448888728',NULL,'2017-03-16 20:04:48',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017316205068158928',NULL,'2017-03-16 20:50:06',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('201731620507957782',NULL,'2017-03-16 20:50:07',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20173162082256754',NULL,'2017-03-16 20:08:02',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017316208252641',NULL,'2017-03-16 20:08:02',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20173201050549804499',NULL,'2017-03-20 10:50:54',NULL,'Reaprovisionement de la caisse de admin dun montant de 0','admin',NULL,'enable','t_coffre_caisse','caisse'),
  ('2017320105101872576',NULL,'2017-03-20 10:51:00',NULL,'Ouverture de la caisse de  admin avec un montant de 0','admin',NULL,'enable','t_coffre_caisse,t_resume_caisse,t_caisse','caisse'),
  ('201732010518275593',NULL,'2017-03-20 10:51:08',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017320105185785765',NULL,'2017-03-20 10:51:08',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20173201314253778717',NULL,'2017-03-20 13:14:25',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20173201314259263652',NULL,'2017-03-20 13:14:25',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20173291012461888181',NULL,'2017-03-29 10:12:46',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20173291012464134809',NULL,'2017-03-29 10:12:46',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20173291012552444978',NULL,'2017-03-29 10:12:55',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20173291012555933925',NULL,'2017-03-29 10:12:55',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20173291013103872853',NULL,'2017-03-29 10:13:10',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20173291013165332077',NULL,'2017-03-29 10:13:16',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20173291013169774601',NULL,'2017-03-29 10:13:16',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20173291013227333721',NULL,'2017-03-29 10:13:22',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017329101323505105',NULL,'2017-03-29 10:13:23',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('201732910134284945',NULL,'2017-03-29 10:13:04',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('201732910134526871',NULL,'2017-03-29 10:13:04',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2017329101399937261',NULL,'2017-03-29 10:13:09',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017329930152821401',NULL,'2017-03-29 09:30:15',NULL,'Ouverture de la caisse de  admin avec un montant de 0','admin',NULL,'enable','t_coffre_caisse,t_resume_caisse,t_caisse','caisse'),
  ('2017329930329144322',NULL,'2017-03-29 09:30:32',NULL,'Enregistrement d une somme de  0.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2017329930333513388',NULL,'2017-03-29 09:30:33',NULL,'Enregistrement d une somme de  0.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('201732993097409434',NULL,'2017-03-29 09:30:09',NULL,'Reaprovisionement de la caisse de admin dun montant de 0','admin',NULL,'enable','t_coffre_caisse','caisse'),
  ('20183101028232519145',NULL,'2018-03-10 10:28:23',NULL,'Reaprovisionement de la caisse de thierry dun montant de 10000','admin',NULL,'enable','t_coffre_caisse','caisse'),
  ('20183101028501133809',NULL,'2018-03-10 10:28:50',NULL,'Reaprovisionement de la caisse de sandra dun montant de 0','admin',NULL,'enable','t_coffre_caisse','caisse'),
  ('20185281255458178123',NULL,'2018-05-28 12:55:45',NULL,'Reaprovisionement de la caisse de admin dun montant de 10','admin',NULL,'enable','t_coffre_caisse','caisse'),
  ('20185281256206735663',NULL,'2018-05-28 12:56:20',NULL,'Enregistrement d une somme de  2700.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20185281256209659221',NULL,'2018-05-28 12:56:20',NULL,'Enregistrement d une somme de  15000.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2018528125628471720',NULL,'2018-05-28 12:56:02',NULL,'Ouverture de la caisse de  admin avec un montant de 10','admin',NULL,'enable','t_coffre_caisse,t_resume_caisse,t_caisse','caisse'),
  ('20185281320175455755',NULL,'2018-05-28 13:20:17',NULL,'Enregistrement d une somme de  1440.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20185281320179314065',NULL,'2018-05-28 13:20:17',NULL,'Enregistrement d une somme de  8000.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20185281320233283572',NULL,'2018-05-28 13:20:23',NULL,'Enregistrement d une somme de  3500.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('2018528132023765477',NULL,'2018-05-28 13:20:23',NULL,'Enregistrement d une somme de  630.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2018528132071929533',NULL,'2018-05-28 13:20:07',NULL,'Enregistrement d une somme de  900.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('2018528132075013550',NULL,'2018-05-28 13:20:07',NULL,'Enregistrement d une somme de  5000.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20185281331565566259',NULL,'2018-05-28 13:31:56',NULL,'Enregistrement d une somme de  1440.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20185281331568585377',NULL,'2018-05-28 13:31:56',NULL,'Enregistrement d une somme de  8000.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20185281546233866178',NULL,'2018-05-28 15:46:23',NULL,'Enregistrement d une somme de  1710.0 pour type de recette : TVA','admin',NULL,'enable','t_recettes','caisse'),
  ('20185281546237972303',NULL,'2018-05-28 15:46:23',NULL,'Enregistrement d une somme de  9500.0 pour type de recette : Chiffre D''affaire','admin',NULL,'enable','t_recettes','caisse'),
  ('20185311255485773076',NULL,'2018-05-31 12:55:48',NULL,'Enregistrement d une somme de  2520.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018531125549586023',NULL,'2018-05-31 12:55:49',NULL,'Enregistrement d une somme de  14000.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('20185311256258353750',NULL,'2018-05-31 12:56:25',NULL,'Enregistrement d une somme de  2970.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('20185311256261157737',NULL,'2018-05-31 12:56:26',NULL,'Enregistrement d une somme de  16500.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('201853113239132570',NULL,'2018-05-31 13:02:03',NULL,'Enregistrement d une somme de  540.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('201853113241002173',NULL,'2018-05-31 13:02:04',NULL,'Enregistrement d une somme de  3000.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('20185311327582563159',NULL,'2018-05-31 13:27:58',NULL,'Enregistrement d une somme de  7500.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018531132758686805',NULL,'2018-05-31 13:27:58',NULL,'Enregistrement d une somme de  1350.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('20185311328175075709',NULL,'2018-05-31 13:28:17',NULL,'Enregistrement d une somme de  2646.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('20185311328177186324',NULL,'2018-05-31 13:28:17',NULL,'Enregistrement d une somme de  14700.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('20185311333218234474',NULL,'2018-05-31 13:33:21',NULL,'Enregistrement d une somme de  1692.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('20185311333219894013',NULL,'2018-05-31 13:33:21',NULL,'Enregistrement d une somme de  9400.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018531161856453685',NULL,'2018-05-31 16:18:05',NULL,'Enregistrement d une somme de  1440.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('20185311618683725',NULL,'2018-05-31 16:18:06',NULL,'Enregistrement d une somme de  8000.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('20185311622524586489',NULL,'2018-05-31 16:22:52',NULL,'Enregistrement d une somme de  720.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('20185311622527457666',NULL,'2018-05-31 16:22:52',NULL,'Enregistrement d une somme de  4000.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018531174332223381',NULL,'2018-05-31 17:43:32',NULL,'Enregistrement d une somme de  540.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('20185311743322553010',NULL,'2018-05-31 17:43:32',NULL,'Enregistrement d une somme de  3000.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('20185311751579577032',NULL,'2018-05-31 17:51:57',NULL,'Enregistrement d une somme de  540.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('20185311751582875001',NULL,'2018-05-31 17:51:58',NULL,'Enregistrement d une somme de  3000.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('20185312252565719164',NULL,'2018-05-31 22:52:56',NULL,'Enregistrement d une somme de  900.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('20185312252568935561',NULL,'2018-05-31 22:52:56',NULL,'Enregistrement d une somme de  5000.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018531231209823565',NULL,'2018-05-31 23:01:20',NULL,'Enregistrement d une somme de  3690.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018531231211862826',NULL,'2018-05-31 23:01:21',NULL,'Enregistrement d une somme de  20500.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018531231376373959',NULL,'2018-05-31 23:01:37',NULL,'Enregistrement d une somme de  2070.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018531231379033641',NULL,'2018-05-31 23:01:37',NULL,'Enregistrement d une somme de  11500.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018531841535748903',NULL,'2018-05-31 08:41:53',NULL,'Validation de la Cloture de la caisse de  admin avec un montant de 57830','admin',NULL,'enable','t_coffre_caisse,t_resume_caisse,t_caisse','caisse'),
  ('2018531842235611902',NULL,'2018-05-31 08:42:23',NULL,'Reaprovisionement de la caisse de sandra dun montant de 0','admin',NULL,'enable','t_coffre_caisse','caisse'),
  ('2018531842545658224',NULL,'2018-05-31 08:42:54',NULL,'Ouverture de la caisse de  sandra avec un montant de 0','sandra',NULL,'enable','t_coffre_caisse,t_resume_caisse,t_caisse','caisse'),
  ('2018531926365267177',NULL,'2018-05-31 09:26:36',NULL,'Enregistrement d une somme de  2646.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018531926385839528',NULL,'2018-05-31 09:26:38',NULL,'Enregistrement d une somme de  14700.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('201853193056314776',NULL,'2018-05-31 09:30:56',NULL,'Enregistrement d une somme de  3780.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018531930567281351',NULL,'2018-05-31 09:30:56',NULL,'Enregistrement d une somme de  21000.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018531945104089908',NULL,'2018-05-31 09:45:10',NULL,'Enregistrement d une somme de  19000.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018531945412752353',NULL,'2018-05-31 09:45:41',NULL,'Enregistrement d une somme de  1890.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018531945417555931',NULL,'2018-05-31 09:45:41',NULL,'Enregistrement d une somme de  10500.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('20185319459115013',NULL,'2018-05-31 09:45:09',NULL,'Enregistrement d une somme de  3420.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018531951161171588',NULL,'2018-05-31 09:51:16',NULL,'Enregistrement d une somme de  2340.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018531951171776480',NULL,'2018-05-31 09:51:17',NULL,'Enregistrement d une somme de  13000.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('201861221253605726',NULL,'2018-06-01 22:12:53',NULL,'Reaprovisionement de la caisse de sandra dun montant de 0','admin',NULL,'enable','t_coffre_caisse','caisse'),
  ('2018612213215485734',NULL,'2018-06-01 22:13:21',NULL,'Ouverture de la caisse de  sandra avec un montant de 0','sandra',NULL,'enable','t_coffre_caisse,t_resume_caisse,t_caisse','caisse'),
  ('2018612213599918741',NULL,'2018-06-01 22:13:59',NULL,'Enregistrement d une somme de  3150.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('201861221403516021',NULL,'2018-06-01 22:14:00',NULL,'Enregistrement d une somme de  17500.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('201861221635192538',NULL,'2018-06-01 22:16:03',NULL,'Enregistrement d une somme de  720.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('201861221637391212',NULL,'2018-06-01 22:16:03',NULL,'Enregistrement d une somme de  4000.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018612216503361499',NULL,'2018-06-01 22:16:50',NULL,'Enregistrement d une somme de  25500.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('201861221650799112',NULL,'2018-06-01 22:16:50',NULL,'Enregistrement d une somme de  4590.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018612219541378447',NULL,'2018-06-01 22:19:54',NULL,'Enregistrement d une somme de  1710.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018612219543391265',NULL,'2018-06-01 22:19:54',NULL,'Enregistrement d une somme de  9500.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018621211276151851',NULL,'2018-06-02 12:11:27',NULL,'Reaprovisionement de la caisse de sandra dun montant de 0','admin',NULL,'enable','t_coffre_caisse','caisse'),
  ('20186212151366747',NULL,'2018-06-02 12:15:01',NULL,'Ouverture de la caisse de  sandra avec un montant de 0','sandra',NULL,'enable','t_coffre_caisse,t_resume_caisse,t_caisse','caisse'),
  ('2018621253357749697',NULL,'2018-06-02 12:53:35',NULL,'Enregistrement d une somme de  2790.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018621253364677928',NULL,'2018-06-02 12:53:36',NULL,'Enregistrement d une somme de  15500.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018621254138974236',NULL,'2018-06-02 12:54:13',NULL,'Enregistrement d une somme de  3060.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018621254142485517',NULL,'2018-06-02 12:54:14',NULL,'Enregistrement d une somme de  17000.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018621631274784740',NULL,'2018-06-02 16:31:27',NULL,'Enregistrement d une somme de  2250.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018621631281646248',NULL,'2018-06-02 16:31:28',NULL,'Enregistrement d une somme de  12500.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018621655435639015',NULL,'2018-06-02 16:55:43',NULL,'Enregistrement d une somme de  1890.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('201862165546448645',NULL,'2018-06-02 16:55:46',NULL,'Enregistrement d une somme de  10500.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018621655597207645',NULL,'2018-06-02 16:55:59',NULL,'Enregistrement d une somme de  2340.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('201862165602084738',NULL,'2018-06-02 16:56:00',NULL,'Enregistrement d une somme de  13000.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018621738249674450',NULL,'2018-06-02 17:38:24',NULL,'Enregistrement d une somme de  1080.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('2018621738255184264',NULL,'2018-06-02 17:38:25',NULL,'Enregistrement d une somme de  6000.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse'),
  ('201862176486221072',NULL,'2018-06-02 17:06:48',NULL,'Enregistrement d une somme de  2070.0 pour type de recette : TVA','sandra',NULL,'enable','t_recettes','caisse'),
  ('201862176491214421',NULL,'2018-06-02 17:06:49',NULL,'Enregistrement d une somme de  11500.0 pour type de recette : Chiffre D''affaire','sandra',NULL,'enable','t_recettes','caisse');
COMMIT;

/* Data for the `t_famille` table  (LIMIT 0,500) */

INSERT INTO `t_famille` (`lg_FAMILLE_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`, `str_PIC_ORIGINALE`, `str_PIC_SMALL`, `str_PIC_MIDDLE`, `str_PIC_BIG`) VALUES
  ('1','Liqueur','Famille des liqueurs','2014-03-26 11:24:30','2018-03-24 14:38:00','delete','1_83241515229628743504.jpg','Small_1_83241515229628743504.jpg',NULL,'Big_1_83241515229628743504.jpg'),
  ('2','Sucrerie','Famille des sucreries','2014-03-26 11:28:02','2014-03-26 11:31:28','delete','2_83241519443577296248.jpg','Small_2_83241519443577296248.jpg',NULL,'Big_2_83241519443577296248.jpg'),
  ('3','Biere','Famille des bieres','2014-03-26 16:52:58','2014-03-26 16:53:12','delete','3_83241519207863469621.jpg','Small_3_83241519207863469621.jpg',NULL,'Big_3_83241519207863469621.jpg'),
  ('67101710292401617645','Poisson','Poisson','2016-07-10 17:10:29','2016-07-10 17:11:18','enable','67101710292401617645_83241519539576267615.jpg','Small_67101710292401617645_83241519539576267615.jpg',NULL,'Big_67101710292401617645_83241519539576267615.jpg'),
  ('67101710346618656226','Viande','Viande','2016-07-10 17:10:34','2016-07-10 17:11:11','enable','67101710346618656226_83241536263228857221.jpg','Small_67101710346618656226_83241536263228857221.jpg',NULL,'Big_67101710346618656226_83241536263228857221.jpg'),
  ('67101710431359398307','Boisson Chaude','Boisson Chaude','2016-07-10 17:10:43','2017-04-25 14:37:19','delete',NULL,NULL,NULL,NULL),
  ('67101710623778928834','Cockail','Cockail','2016-07-10 17:10:06','2016-07-10 17:10:56','enable','67101710623778928834_83255563391962509001.jpg','Small_67101710623778928834_83255563391962509001.jpg',NULL,'Big_67101710623778928834_83255563391962509001.jpg'),
  ('67101795452328228533','Autre','Autre','2016-07-10 17:09:54','2017-04-25 14:59:40','enable',NULL,NULL,NULL,NULL),
  ('74251437513799994453','Boisson Froide','Boisson Froide','2017-04-25 14:37:51','2017-04-25 14:37:58','enable',NULL,NULL,NULL,NULL),
  ('74251438398918098422','Accompagnement','Accompagnement','2017-04-25 14:38:39','2017-04-25 14:38:51','enable',NULL,NULL,NULL,NULL),
  ('74251449179381328154','Bouillie','Bouillie','2017-04-25 14:49:17','2017-04-25 14:50:39','enable',NULL,NULL,NULL,NULL);
COMMIT;

/* Data for the `t_file_data_patient` table  (LIMIT 0,500) */

INSERT INTO `t_file_data_patient` (`lg_ID`, `str_KEY`, `str_FILE_NAME`, `LIT`, `DOSSIER`, `PATIENT`, `MEDECIN`, `PAYMENT`, `ORGANISME`, `DATE_ENTREE`, `DATE_SORTIE`, `I_P_P`, `SERVICES`, `dt_CREATED`, `str_CREATED_BY`, `KEY_CHAMBRE`, `KEY_LIT`, `KEY_ETAGE`) VALUES
  ('73222356374739418881','7322_00030','null.','130','171001486','DR ADEPOH MICHELE DORCAS','DR ADEPOH MICHELE DORCAS','100','CBOAD','2017-02-10','2017-02-14','363226','1EST','2017-03-22 23:56:37','admin','30','130','1'),
  ('73222356381177382690','7322_00030','null.','132','171001517','DR GNEBEI ROGER','DR GNEBEI ROGER','PAY','PAYANT','2017-02-10','2017-02-14','160565','1EST','2017-03-22 23:56:38','admin','32','132','1'),
  ('73222356383039243916','7322_00030','null.','133','','','','','','2017-03-22','2017-03-22','','','2017-03-22 23:56:38','admin','33','133','1'),
  ('73222356384169564231','7322_00030','null.','134A','','','','','','2017-03-22','2017-03-22','','','2017-03-22 23:56:38','admin','34A','134A','1'),
  ('7322235638443394958','7322_00030','null.','131','171001558','DR YESUFU AKIM OWABUNMI','DR YESUFU AKIM OWABUNMI','100','CASCOMA','2017-02-12','2017-02-16','292716','1EST','2017-03-22 23:56:38','admin','3','131','1'),
  ('73222356384659994462','7322_00030','null.','134B','171001566','PR ANONGBA SIMPLICE','PR ANONGBA SIMPLICE','100','CSIB','2017-02-12','1999-11-30','370983','1EST','2017-03-22 23:56:38','admin','34B','134B','1'),
  ('73222356385539303249','7322_00030','null.','135','171001602','DR KOUASSI KASSI A. JOSEP','DR KOUASSI KASSI A. JOSEP','100','CMCI','2017-02-13','2017-02-14','336900','1EST','2017-03-22 23:56:38','admin','35','135','1'),
  ('73222356386534105486','7322_00030','null.','136','','','','','','2017-03-22','2017-03-22','','','2017-03-22 23:56:38','admin','36','136','1'),
  ('73240561097718565348','7324_00001','null.','130','171001486','XXXXXXXXXXXXXXXXXXXXX','DR ADEPOH MICHELE DORCAS','100','CBOAD','2017-02-10','2017-02-14','363226','1EST','2017-03-24 00:56:10','admin','30','130','1'),
  ('73240561113030443821','7324_00001','null.','132','171001517','XXXXXXXXXXXXXXXXXXXXX','DR GNEBEI ROGER','PAY','PAYANT','2017-02-10','2017-02-14','160565','1EST','2017-03-24 00:56:11','admin','32','132','1'),
  ('7324056111748862994','7324_00001','null.','133','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:11','admin','33','133','1'),
  ('7324056112769336685','7324_00001','null.','134A','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:11','admin','34A','134A','1'),
  ('73240561132036189376','7324_00001','null.','134B','171001566','XXXXXXXXXXXXXXXXXXXXX','PR ANONGBA SIMPLICE','100','CSIB','2017-02-12','1999-11-30','370983','1EST','2017-03-24 00:56:11','admin','34B','134B','1'),
  ('73240561142848614313','7324_00001','null.','135','171001602','XXXXXXXXXXXXXXXXXXXXX','DR KOUASSI KASSI A. JOSEP','100','CMCI','2017-02-13','2017-02-14','336900','1EST','2017-03-24 00:56:11','admin','35','135','1'),
  ('7324056114945577123','7324_00001','null.','136','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:11','admin','36','136','1'),
  ('73240561156065094339','7324_00001','null.','137','171001603','XXXXXXXXXXXXXXXXXXXXX','DR YESUFU AKIM OWABUNMI','100','CASCOMA','2017-02-13','2017-02-15','313729','1EST','2017-03-24 00:56:11','admin','37','137','1'),
  ('73240561159385081268','7324_00001','null.','138','171001496','XXXXXXXXXXXXXXXXXXXXX','DR YESUFU AKIM OWABUNMI','100','CSTANEIN','2017-02-10','2017-02-14','364340','1EST','2017-03-24 00:56:11','admin','38','138','1'),
  ('73240561162694383523','7324_00001','null.','138','171001581','XXXXXXXXXXXXXXXXXXXXX','DR ODI SERGE-ADOPOH','100','CCOLINA','2017-02-12','2017-02-16','154028','1EST','2017-03-24 00:56:11','admin','38','138','1'),
  ('73240561165971472505','7324_00001','null.','139','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:11','admin','39','139','1'),
  ('7324056117259274916','7324_00001','null.','140A','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:11','admin','40A','140A','1'),
  ('73240561180231412124','7324_00001','null.','140B','171001613','','PR ANONGBA SIMPLICE','100','PAYANT','2017-02-13','2017-02-15','16978','1EST','2017-03-24 00:56:11','admin','40B','140B','1'),
  ('73240561183942185716','7324_00001','null.','141A','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:11','admin','4A','141A','1'),
  ('7324056118612303765','7324_00001','null.','131','171001558','XXXXXXXXXXXXXXXXXXXXX','DR YESUFU AKIM OWABUNMI','100','CASCOMA','2017-02-12','2017-02-16','292716','1EST','2017-03-24 00:56:11','admin','3','131','1'),
  ('73240561188150681556','7324_00001','null.','141B','171001634','','DR YESUFU AKIM OWABUNMI','100','CMUSAP17','2017-02-14','2017-02-16','343842','1EST','2017-03-24 00:56:11','admin','4B','141B','1'),
  ('732405611969503962','7324_00001','null.','142A','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:11','admin','42A','142A','1'),
  ('73240561210142185419','7324_00001','null.','240','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:12','admin','40','240','2'),
  ('7324056121465098290','7324_00001','null.','142B','171001556','','DR KOUROUMA. N.','80','CCOLINA','2017-02-12','2017-02-14','324547','1EST','2017-03-24 00:56:12','admin','42B','142B','1'),
  ('73240561218044258109','7324_00001','null.','241','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:12','admin','24','241','1'),
  ('73240561222435985931','7324_00001','null.','242','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:12','admin','4','242','2'),
  ('7324056123005379161','7324_00001','null.','243','171001463','','PR N GUESSAN GABRIEL','100','CSCAINTE','2017-02-09','2017-02-16','126006','2EST','2017-03-24 00:56:12','admin','43','243','2'),
  ('73240561234468537009','7324_00001','null.','244','171001511','','DR YAPI N''KAYO SYLVAIN','100','CSCAINAS','2017-02-10','2017-02-18','371390','2EST','2017-03-24 00:56:12','admin','44','244','2'),
  ('73240561238981887977','7324_00001','null.','245','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:12','admin','45','245','2'),
  ('7324056124221184048','7324_00001','null.','246','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:12','admin','46','246','2'),
  ('7324056124674284841','7324_00001','null.','247A','171000925','','','PAY','PAYANT','2017-01-25','2017-03-25','370546','2EST','2017-03-24 00:56:12','admin','47A','247A','2'),
  ('73240561251146458899','7324_00001','null.','247B','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:12','admin','47B','247B','2'),
  ('73240561254485102241','7324_00001','null.','248','171001205','','','100','CCOLINA','2017-02-02','1999-11-30','370941','2EST','2017-03-24 00:56:12','admin','48','248','2'),
  ('7324056125861469103','7324_00001','null.','143','171001487','','DR BOUAICHA KHADIJA','100','CSTANEIN','2017-02-10','2017-02-14','332890','1EST','2017-03-24 00:56:12','admin','43','143','1'),
  ('73240561258836891918','7324_00001','null.','249','161005098','','','100','CPRCI','2016-06-14','2017-05-08','344955','2EST','2017-03-24 00:56:12','admin','49','249','2'),
  ('73240561263280305849','7324_00001','null.','250','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:12','admin','50','250','2'),
  ('73240561267811152814','7324_00001','null.','251','171001596','','DR SANGARE ABDOUL HASSAN','100','CMUGEFCI','2017-02-13','2017-02-14','348777','2EST','2017-03-24 00:56:12','admin','25','251','1'),
  ('73240561275591264775','7324_00001','null.','251','171001637','','','100','CSODEMI','2017-02-14','2017-02-14','366037','2EST','2017-03-24 00:56:12','admin','25','251','1'),
  ('7324056128109960976','7324_00001','null.','252','171001384','','','100','CMUTFOM','2017-02-07','2017-02-15','152067','2EST','2017-03-24 00:56:12','admin','5','252','2'),
  ('73240561290123661633','7324_00001','null.','253','171001251','','DR YEO NAHOUA','100','CPRCI','2017-02-02','2017-02-15','342341','2EST','2017-03-24 00:56:12','admin','53','253','2'),
  ('73240561296791772035','7324_00001','null.','254','171000181','','DR KONAN KOUASSI JEAN','100','CPRCI','2017-01-05','1999-11-30','9813','2EST','2017-03-24 00:56:12','admin','54','254','2'),
  ('73240561312497045276','7324_00001','null.','256A','171001584','','DR DOFFOU BERENGER CONSTA','100','CGMCSERV','2017-02-12','2017-02-14','333249','2EST','2017-03-24 00:56:13','admin','56A','256A','2'),
  ('7324056132196242895','7324_00001','null.','255A','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:13','admin','55A','255A','2'),
  ('7324056132436013500','7324_00001','null.','256B','171001513','','DR YAPI N''KAYO SYLVAIN','100','CCOLINA','2017-02-10','2017-02-14','256692','2EST','2017-03-24 00:56:13','admin','56B','256B','2'),
  ('73240561331117904401','7324_00001','null.','257A','171001621','','DR YEO NAHOUA','PAY','PAYANT','2017-02-13','2017-02-16','371501','2EST','2017-03-24 00:56:13','admin','57A','257A','2'),
  ('73240561336748604428','7324_00001','null.','257B','171001533','','DR BASSE CHEICK','100','CMUGEFCI','2017-02-11','2017-02-16','371428','2EST','2017-03-24 00:56:13','admin','57B','257B','2'),
  ('73240561342158847931','7324_00001','null.','258A','171001528','','DR BASSE CHEICK','100','CMUTSOTR','2017-02-11','2017-02-14','369492','2EST','2017-03-24 00:56:13','admin','58A','258A','2'),
  ('732405613466154880','7324_00001','null.','258A','171001508','','','100','CMUGEFCI','2017-02-10','1999-11-30','206051','2EST','2017-03-24 00:56:13','admin','58A','258A','2'),
  ('73240561350783186451','7324_00001','null.','258B','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:13','admin','58B','258B','2'),
  ('73240561355260549985','7324_00001','null.','259A','171001623','','DR ODI SERGE-ADOPOH','100','CCOLINA','2017-02-13','2017-02-15','371502','2EST','2017-03-24 00:56:13','admin','59A','259A','2'),
  ('73240561359621451975','7324_00001','null.','259B','171001619','','DR SORO KOUNTELE','100','CMUTMACN','2017-02-13','2017-02-15','337302','2EST','2017-03-24 00:56:13','admin','59B','259B','2'),
  ('73240561364170128439','7324_00001','null.','260A','171001518','','DR YAPI N''KAYO SYLVAIN','100','CMUTCIE','2017-02-11','2017-02-15','237952','2EST','2017-03-24 00:56:13','admin','60A','260A','2'),
  ('7324056136546293684','7324_00001','null.','255B','171001452','','PR KONAN KOUAME PAUL GERA','80','CMUGEFCI','2017-02-09','2017-02-14','367636','2EST','2017-03-24 00:56:13','admin','55B','255B','2'),
  ('73240561368267745666','7324_00001','null.','260B','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:13','admin','60B','260B','2'),
  ('73240561373024609589','7324_00001','null.','220','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:13','admin','0','220','2'),
  ('73240561380385463547','7324_00001','null.','221','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:13','admin','22','221','1'),
  ('73240561385155087950','7324_00001','null.','222','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:13','admin','','222','2'),
  ('73240561389641311380','7324_00001','null.','223','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:13','admin','3','223','2'),
  ('73240561396126037146','7324_00001','null.','224','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:13','admin','4','224','2'),
  ('73240561412897556468','7324_00001','null.','227','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','7','227','2'),
  ('7324056141723000626','7324_00001','null.','228','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','8','228','2'),
  ('7324056142015917623','7324_00001','null.','225','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','5','225','2'),
  ('73240561421751521305','7324_00001','null.','229','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','9','229','2'),
  ('73240561426092505213','7324_00001','null.','230','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','30','230','2'),
  ('73240561430671662636','7324_00001','null.','231','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','23','231','1'),
  ('73240561434861496189','7324_00001','null.','232','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','3','232','2'),
  ('73240561438262953484','7324_00001','null.','233','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','33','233','2'),
  ('7324056144272862462','7324_00001','null.','234','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','34','234','2'),
  ('73240561447174569615','7324_00001','null.','235A','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','35A','235A','2'),
  ('73240561451512617058','7324_00001','null.','235B','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','35B','235B','2'),
  ('7324056145481141536','7324_00001','null.','236A','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','36A','236A','2'),
  ('73240561459386065549','7324_00001','null.','236B','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','36B','236B','2'),
  ('7324056146599690155','7324_00001','null.','237A','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','37A','237A','2'),
  ('73240561471487099701','7324_00001','null.','237B','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','37B','237B','2'),
  ('7324056147731708221','7324_00001','null.','238A','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','38A','238A','2'),
  ('73240561482460684959','7324_00001','null.','238B','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','38B','238B','2'),
  ('7324056148431647463','7324_00001','null.','226','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','6','226','2'),
  ('73240561489461525244','7324_00001','null.','239A','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','39A','239A','2'),
  ('73240561494916822354','7324_00001','null.','239B','','','','','','2017-03-24','2017-03-24','','2ENORD','2017-03-24 00:56:14','admin','39B','239B','2'),
  ('73240561517176397683','7324_00001','null.','201B','171001534','','DR ONNA GUY GERARD GUEI','100','CMUTCIE','2017-02-11','2017-02-14','371424','2SUD','2017-03-24 00:56:15','admin','20B','201B','1'),
  ('73240561528527906454','7324_00001','null.','202A','171001563','','','100','CASCOMA','2017-02-12','2017-02-14','277034','2SUD','2017-03-24 00:56:15','admin','0A','202A','2'),
  ('73240561540210083415','7324_00001','null.','202B','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:15','admin','0B','202B','2'),
  ('73240561544627346043','7324_00001','null.','203A','171001587','','DR NGORAN KOFFI AYA GEORG','100','CBCEAO','2017-02-12','2017-02-14','328086','2SUD','2017-03-24 00:56:15','admin','03A','203A','2'),
  ('73240561552720801661','7324_00001','null.','203B','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:15','admin','03B','203B','2'),
  ('73240561559277094845','7324_00001','null.','204A','171001575','','','100','CASCOMA','2017-02-12','1999-11-30','336948','2SUD','2017-03-24 00:56:15','admin','04A','204A','2'),
  ('73240561563616319763','7324_00001','null.','204B','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:15','admin','04B','204B','2'),
  ('73240561569266445291','7324_00001','null.','205A','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:15','admin','05A','205A','2'),
  ('732405615736324442','7324_00001','null.','201A','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:15','admin','20A','201A','1'),
  ('73240561574694573604','7324_00001','null.','205B','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:15','admin','05B','205B','2'),
  ('73240561580230588325','7324_00001','null.','206','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:15','admin','06','206','2'),
  ('73240561585817117528','7324_00001','null.','207','171001614','','DR ADOU PHILOMENE','100','PAYANT','2017-02-13','1999-11-30','347961','2SUD','2017-03-24 00:56:15','admin','07','207','2'),
  ('732405615898336217','7324_00001','null.','208','171001605','','','100','PAYANT','2017-02-13','2017-02-16','285625','2SUD','2017-03-24 00:56:15','admin','08','208','2'),
  ('73240561594377073980','7324_00001','null.','208','171001606','','','100','CCFE','2017-02-13','2017-02-16','285625','2SUD','2017-03-24 00:56:15','admin','08','208','2'),
  ('73240561612195837482','7324_00001','null.','211','171000351','','PR LASME GUILLAO BERTHE E','PAY','PAYANT','2017-01-10','2017-02-28','369840','2SUD','2017-03-24 00:56:16','admin','2','211','1'),
  ('73240561616429785449','7324_00001','null.','212','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:16','admin','22','212','1'),
  ('73240561620843147644','7324_00001','null.','214','171001550','','PR LASME GUILLAO BERTHE E','100','CCOLINA','2017-02-12','2017-02-18','371330','2SUD','2017-03-24 00:56:16','admin','24','214','1'),
  ('73240561625623172738','7324_00001','null.','215','171001101','','','PAY','PAYANT','2017-01-30','1999-11-30','370809','2SUD','2017-03-24 00:56:16','admin','25','215','1'),
  ('73240561630836706922','7324_00001','null.','216','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:16','admin','26','216','1'),
  ('7324056163749873543','7324_00001','null.','217','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:16','admin','27','217','1'),
  ('73240561644138774050','7324_00001','null.','218','171001561','','','100','CMUGEFCI','2017-02-12','2017-02-14','371282','2SUD','2017-03-24 00:56:16','admin','28','218','1'),
  ('73240561648510098334','7324_00001','null.','219','171001514','','DR KOUADIO BHERAT ARMEL','100','CMUTMDCI','2017-02-11','2017-02-14','371391','2SUD','2017-03-24 00:56:16','admin','29','219','1'),
  ('732405616581721888','7324_00001','null.','209','171001436','','DR NGORAN KOFFI AYA GEORG','100','CMUTCIE','2017-02-08','2017-02-14','332700','2SUD','2017-03-24 00:56:16','admin','09','209','2'),
  ('73240561667099098449','7324_00001','null.','219','171001580','','DR KONE SOMO','100','CMUTMDCI','2017-02-12','2017-02-14','371450','2SUD','2017-03-24 00:56:16','admin','29','219','1'),
  ('7324056167329099874','7324_00001','null.','342','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:16','admin','34','342','2'),
  ('732405616777839362','7324_00001','null.','210','171001211','','DR ADOU PHILOMENE','100','CASCOMA','2017-02-02','2017-02-15','370951','2SUD','2017-03-24 00:56:16','admin','20','210','1'),
  ('73240561678693776266','7324_00001','null.','343','171001549','','DR KONAN SERGE DIDIER','100','CCOLINA','2017-02-12','2017-02-14','30828','3EST','2017-03-24 00:56:16','admin','4','343','3'),
  ('73240561683027206014','7324_00001','null.','344','171001020','','','PAY','PAYANT','2017-01-28','2017-02-15','370736','3EST','2017-03-24 00:56:16','admin','44','344','3'),
  ('73240561687465884460','7324_00001','null.','345','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:16','admin','45','345','3'),
  ('73240561691813728668','7324_00001','null.','346','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:16','admin','46','346','3'),
  ('7324056169621212040','7324_00001','null.','347','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:16','admin','47','347','3'),
  ('73240561710712871896','7324_00001','null.','349B','171001544','','DR ONNA GUY GERARD GUEI','PAY','PAYANT','2017-02-11','2017-02-16','371433','3EST','2017-03-24 00:56:17','admin','49B','349B','3'),
  ('732405617151686636','7324_00001','null.','349B','171001608','','DR DIALLO ZAOURECH','PAY','PAYANT','2017-02-13','2017-02-16','371465','3EST','2017-03-24 00:56:17','admin','49B','349B','3'),
  ('73240561719424321085','7324_00001','null.','349B','171000856','','','80','CMUMADGI','2017-01-23','2017-02-28','191944','3EST','2017-03-24 00:56:17','admin','49B','349B','3'),
  ('73240561722711902814','7324_00001','null.','350','171001541','','DR ONNA GUY GERARD GUEI','PAY','PAYANT','2017-02-11','2017-02-16','6416','3EST','2017-03-24 00:56:17','admin','50','350','3'),
  ('73240561726093936821','7324_00001','null.','351','171000930','','DR YEO NAHOUA','PAY','PAYANT','2017-01-25','2017-02-14','370560','3EST','2017-03-24 00:56:17','admin','35','351','1'),
  ('732405617305735233','7324_00001','null.','351','171001604','','','AUT','PAYANT','2017-02-13','2017-02-15','186134','3EST','2017-03-24 00:56:17','admin','35','351','1'),
  ('7324056173395657931','7324_00001','null.','352','171001510','','DR ODI SERGE-ADOPOH','PAY','PAYANT','2017-02-10','2017-02-14','371389','3EST','2017-03-24 00:56:17','admin','35','352','2'),
  ('73240561738244372043','7324_00001','null.','352','171001466','','DR SORO DRAMANE','100','CSIDAM','2017-02-09','1999-11-30','367623','3EST','2017-03-24 00:56:17','admin','35','352','2'),
  ('73240561742855842212','7324_00001','null.','353','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:17','admin','5','353','3'),
  ('73240561747380426889','7324_00001','null.','354','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:17','admin','54','354','3'),
  ('73240561758324708667','7324_00001','null.','355','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:17','admin','55','355','3'),
  ('7324056176234333423','7324_00001','null.','349A','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:17','admin','49A','349A','3'),
  ('73240561762842138566','7324_00001','null.','356','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:17','admin','56','356','3'),
  ('73240561768282518050','7324_00001','null.','357A','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:17','admin','57A','357A','3'),
  ('73240561772799162700','7324_00001','null.','357B','171000507','','DR DOSSO SOUALIHO','PAY','PAYANT','2017-01-14','2017-02-15','370065','3EST','2017-03-24 00:56:17','admin','57B','357B','3'),
  ('732405617735818476','7324_00001','null.','348','171001386','','','PAY','PAYANT','2017-02-07','2017-02-20','371162','3EST','2017-03-24 00:56:17','admin','48','348','3'),
  ('73240561777241058143','7324_00001','null.','358A','171000913','','PR CAMARA BENOIT','PAY','PAYANT','2017-01-25','2017-03-11','368611','3EST','2017-03-24 00:56:17','admin','58A','358A','3'),
  ('73240561783895782819','7324_00001','null.','358B','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:17','admin','58B','358B','3'),
  ('73240561798250197993','7324_00001','null.','359A','171001573','','','100','CVANBRED','2017-02-12','2017-02-14','150282','3EST','2017-03-24 00:56:17','admin','59A','359A','3'),
  ('7324056181409700157','7324_00001','null.','360A','171001421','','','PAY','PAYANT','2017-02-08','2017-02-15','334477','3EST','2017-03-24 00:56:18','admin','60A','360A','3'),
  ('73240561819223104393','7324_00001','null.','360A','171001628','','DR DOFFOU BERENGER CONSTA','100','CVANBRED','2017-02-13','2017-02-16','360049','3EST','2017-03-24 00:56:18','admin','60A','360A','3'),
  ('73240561823523243841','7324_00001','null.','360B','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:18','admin','60B','360B','3'),
  ('7324056182786964061','7324_00001','null.','359B','171001553','','DR KONAN SERGE DIDIER','100','CMUTCIE','2017-02-12','2017-02-15','201317','3EST','2017-03-24 00:56:18','admin','59B','359B','3'),
  ('73240561827998079045','7324_00001','null.','361A','171000047','','DR YEO NAHOUA','100','CPRCI','2017-01-02','2017-02-28','369434','3EST','2017-03-24 00:56:18','admin','36A','361A','1'),
  ('732405618311575448','7324_00001','null.','361A','171001398','','','100','CMUTCIE','2017-02-07','2017-02-28','57951','3EST','2017-03-24 00:56:18','admin','36A','361A','1'),
  ('73240561834534447162','7324_00001','null.','361B','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:18','admin','36B','361B','1'),
  ('73240561837810669396','7324_00001','null.','362A','171000985','','','100','CMUTSODE','2017-01-27','2017-02-15','370666','3EST','2017-03-24 00:56:18','admin','36A','362A','2'),
  ('73240561841210988538','7324_00001','null.','362A','171001265','','DR YEO NAHOUA','100','CPRCI','2017-02-03','2017-10-25','195663','3EST','2017-03-24 00:56:18','admin','36A','362A','2'),
  ('73240561844429678501','7324_00001','null.','362A','171001509','','','100','CPRCI','2017-02-10','1999-11-30','91951','3EST','2017-03-24 00:56:18','admin','36A','362A','2'),
  ('7324056184787516265','7324_00001','null.','362B','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:18','admin','36B','362B','2'),
  ('73240561854780781619','7324_00001','null.','322','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:18','admin','3','322','2'),
  ('73240561862580915469','7324_00001','null.','323','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:18','admin','33','323','2'),
  ('732405618690697978','7324_00001','null.','324','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:18','admin','34','324','2'),
  ('73240561873937742140','7324_00001','null.','325','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:18','admin','35','325','2'),
  ('7324056187768011758','7324_00001','null.','326','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:18','admin','36','326','2'),
  ('73240561881155345322','7324_00001','null.','327','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:18','admin','37','327','2'),
  ('7324056188229101402','7324_00001','null.','360A','171001393','','','PAY','PAYANT','2017-02-07','2017-02-15','371179','3EST','2017-03-24 00:56:18','admin','60A','360A','3'),
  ('7324056188438517958','7324_00001','null.','328A','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:18','admin','38A','328A','2'),
  ('73240561887787188821','7324_00001','null.','328B','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:18','admin','38B','328B','2'),
  ('73240561890960205398','7324_00001','null.','329','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:18','admin','39','329','2'),
  ('73240561894473125783','7324_00001','null.','330','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:18','admin','0','330','3'),
  ('73240561913339575541','7324_00001','null.','333','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:19','admin','','333','3'),
  ('7324056192584132133','7324_00001','null.','334','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:19','admin','4','334','3'),
  ('73240561934232542645','7324_00001','null.','335','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:19','admin','5','335','3'),
  ('73240561937489129293','7324_00001','null.','336','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:19','admin','6','336','3'),
  ('73240561940992299179','7324_00001','null.','337A','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:19','admin','7A','337A','3'),
  ('732405619442605760','7324_00001','null.','337B','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:19','admin','7B','337B','3'),
  ('73240561947445547656','7324_00001','null.','338A','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:19','admin','8A','338A','3'),
  ('73240561950775122526','7324_00001','null.','338B','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:19','admin','8B','338B','3'),
  ('73240561954190404286','7324_00001','null.','339A','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:19','admin','9A','339A','3'),
  ('73240561957458348330','7324_00001','null.','339B','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:19','admin','9B','339B','3'),
  ('7324056196079723114','7324_00001','null.','340A','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:19','admin','40A','340A','3'),
  ('7324056196585398308','7324_00001','null.','340B','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:19','admin','40B','340B','3'),
  ('73240561970714516640','7324_00001','null.','341A','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:19','admin','34A','341A','1'),
  ('73240561974057986662','7324_00001','null.','341B','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:19','admin','34B','341B','1'),
  ('7324056197656511071','7324_00001','null.','332','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:19','admin','33','332','2'),
  ('73240561977339569082','7324_00001','null.','301A','','','','','','2017-03-24','2017-03-24','','3SUD','2017-03-24 00:56:19','admin','30A','301A','1'),
  ('73240561980780828684','7324_00001','null.','301B','','','','','','2017-03-24','2017-03-24','','3SUD','2017-03-24 00:56:19','admin','30B','301B','1'),
  ('73240561984090808391','7324_00001','null.','302A','','','','','','2017-03-24','2017-03-24','','3SUD','2017-03-24 00:56:19','admin','30A','302A','2'),
  ('73240561987386745832','7324_00001','null.','302B','171001624','','DR DOFFOU BERENGER CONSTA','100','CACCSIR','2017-02-13','2017-02-16','250216','3SUD','2017-03-24 00:56:19','admin','30B','302B','2'),
  ('73240561990648138367','7324_00001','null.','303A','171001591','','DR DOFFOU BERENGER CONSTA','PAY','PAYANT','2017-02-13','2017-02-17','242282','3SUD','2017-03-24 00:56:19','admin','0A','303A','3'),
  ('7324056199349827','7324_00001','null.','331','','','','','','2017-03-24','2017-03-24','','3ENORD','2017-03-24 00:56:19','admin','33','331','1'),
  ('73240561994078464179','7324_00001','null.','303B','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:19','admin','0B','303B','3'),
  ('73240561997360782779','7324_00001','null.','304A','171001577','','','100','CCOLINA','2017-02-12','2017-02-14','371448','3SUD','2017-03-24 00:56:19','admin','04A','304A','3'),
  ('73240562010687521934','7324_00001','null.','305B','171001430','','DR ODI SERGE-ADOPOH','100','CVANBRED','2017-02-08','2017-02-16','371248','3SUD','2017-03-24 00:56:20','admin','05B','305B','3'),
  ('73240562014091197427','7324_00001','null.','306','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:20','admin','06','306','3'),
  ('73240562018310048235','7324_00001','null.','307','161011161','','DR YEO NAHOUA','100','CMUTCNAT','2016-12-29','2017-02-14','369294','3SUD','2017-03-24 00:56:20','admin','07','307','3'),
  ('73240562021732787177','7324_00001','null.','307','131003915','','','100','CBCEAO','2013-07-01','1999-11-30','275285','3SUD','2017-03-24 00:56:20','admin','07','307','3'),
  ('73240562026126557153','7324_00001','null.','308','171001609','','','100','CGMC','2017-02-13','2017-02-15','370356','3SUD','2017-03-24 00:56:20','admin','08','308','3'),
  ('73240562029333122895','7324_00001','null.','308','171001626','','DR DOFFOU BERENGER CONSTA','100','CBILLONK','2017-02-13','2017-02-16','371500','3SUD','2017-03-24 00:56:20','admin','08','308','3'),
  ('73240562032834663297','7324_00001','null.','309','171001612','','','100','PAYANT','2017-02-13','2017-02-14','176113','3SUD','2017-03-24 00:56:20','admin','09','309','3'),
  ('7324056203756480257','7324_00001','null.','310','171001472','','DR YEO NAHOUA','PAY','PAYANT','2017-02-09','2017-02-28','371331','3SUD','2017-03-24 00:56:20','admin','30','310','1'),
  ('7324056204033069259','7324_00001','null.','304B','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:20','admin','04B','304B','3'),
  ('73240562041415293584','7324_00001','null.','311','171001611','','DR ODI SERGE-ADOPOH','100','CMUGEFCI','2017-02-13','2017-02-16','260577','3SUD','2017-03-24 00:56:20','admin','3','311','1'),
  ('73240562048578684800','7324_00001','null.','312','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:20','admin','32','312','1'),
  ('73240562057878921098','7324_00001','null.','314','171001617','','PR KAKOU KONAN MEDARD','100','CMUGEFCI','2017-02-13','2017-02-23','370731','3SUD','2017-03-24 00:56:20','admin','34','314','1'),
  ('7324056206412970771','7324_00001','null.','315A','171001625','','DR DOFFOU BERENGER CONSTA','PAY','PAYANT','2017-02-13','2017-02-18','109890','3SUD','2017-03-24 00:56:20','admin','35A','315A','1'),
  ('73240562068259283723','7324_00001','null.','315B','','','','','','2017-03-24','2017-03-24','','','2017-03-24 00:56:20','admin','35B','315B','1'),
  ('73240562068494564','7324_00001','null.','304A','171001632','','DR DOFFOU BERENGER CONSTA','100','CGSAVCI','2017-02-14','2017-02-17','217128','3SUD','2017-03-24 00:56:20','admin','04A','304A','3'),
  ('7324056207222681984','7324_00001','null.','305A','171001429','','DR ODI SERGE-ADOPOH','100','CONUCI','2017-02-08','2017-02-20','371246','3SUD','2017-03-24 00:56:20','admin','05A','305A','3'),
  ('73240562072882942212','7324_00001','null.','316','171001589','','DR DOFFOU BERENGER CONSTA','100','CALLIAWO','2017-02-12','2017-02-14','324878','3SUD','2017-03-24 00:56:20','admin','36','316','1'),
  ('73240562077353103538','7324_00001','null.','317','171001311','','DR KONAN SERGE DIDIER','PAY','PAYANT','2017-02-05','2017-02-20','74973','3SUD','2017-03-24 00:56:20','admin','37','317','1'),
  ('73240562089483605338','7324_00001','null.','318','171001068','','DR DOSSO SOUALIHO','100','CBCEAO','2017-01-30','1999-11-30','370754','3SUD','2017-03-24 00:56:20','admin','38','318','1'),
  ('73240562094118796629','7324_00001','null.','319','161009941','','DR NDJEUNDO PATRICK GIMEL','100','CASCOMA','2016-11-22','2017-02-14','258048','3SUD','2017-03-24 00:56:20','admin','39','319','1'),
  ('73240562098289961298','7324_00001','null.','320','171000806','','DR ONNA GUY GERARD GUEI','PAY','PAYANT','2017-01-22','2017-02-20','370410','3SUD','2017-03-24 00:56:20','admin','30','320','2'),
  ('73240562110362608852','7324_00001','null.','500','171001582','','DR DOFFOU BERENGER CONSTA','100','CMUGEFCI','2017-02-13','2017-02-17','371452','SINT','2017-03-24 00:56:21','admin','500','500','500'),
  ('73240562114724402301','7324_00001','null.','500','171001137','','','PAY','PAYANT','2017-01-31','2017-02-18','205776','SINT','2017-03-24 00:56:21','admin','500','500','500'),
  ('73240562119274767192','7324_00001','null.','500','171001464','','DR YEO NAHOUA','100','CPRCI','2017-02-09','2017-02-28','17977','SINT','2017-03-24 00:56:21','admin','500','500','500'),
  ('7324056212789261966','7324_00001','null.','321','171001431','','PR BOHOUSSOU KOUACOU PAUL','PAY','PAYANT','2017-02-08','1999-11-30','261804','3SUD','2017-03-24 00:56:21','admin','32','321','1'),
  ('73272132379126711653','7327_00002','null.','130','171001486','XXXXXXXXXXXXXXXXXXXXX','DR ADEPOH MICHELE DORCAS','100','CBOAD','2017-02-10','2017-02-14','363226','1EST','2017-03-27 21:32:37','admin','30','130','1'),
  ('73272132401302836598','7327_00002','null.','131','171001558','XXXXXXXXXXXXXXXXXXXXX','DR YESUFU AKIM OWABUNMI','100','CASCOMA','2017-02-12','2017-02-16','292716','1EST','2017-03-27 21:32:40','admin','3','131','1'),
  ('73272132404401999937','7327_00002','null.','132','171001517','XXXXXXXXXXXXXXXXXXXXX','DR GNEBEI ROGER','PAY','PAYANT','2017-02-10','2017-02-14','160565','1EST','2017-03-27 21:32:40','admin','32','132','1'),
  ('73272132406411604749','7327_00002','null.','133','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:40','admin','33','133','1'),
  ('73272132407572471819','7327_00002','null.','134A','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:40','admin','34A','134A','1'),
  ('73272132408344844601','7327_00002','null.','134B','171001566','XXXXXXXXXXXXXXXXXXXXX','PR ANONGBA SIMPLICE','100','CSIB','2017-02-12','1999-11-30','370983','1EST','2017-03-27 21:32:40','admin','34B','134B','1'),
  ('73272132409064131942','7327_00002','null.','135','171001602','XXXXXXXXXXXXXXXXXXXXX','DR KOUASSI KASSI A. JOSEP','100','CMCI','2017-02-13','2017-02-14','336900','1EST','2017-03-27 21:32:40','admin','35','135','1'),
  ('73272132409787090450','7327_00002','null.','136','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:40','admin','36','136','1'),
  ('73272132411393805441','7327_00002','null.','138','171001581','XXXXXXXXXXXXXXXXXXXXX','DR ODI SERGE-ADOPOH','100','CCOLINA','2017-02-12','2017-02-16','154028','1EST','2017-03-27 21:32:41','admin','38','138','1'),
  ('73272132411663055652','7327_00002','null.','139','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:41','admin','39','139','1'),
  ('73272132412101839958','7327_00002','null.','140A','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:41','admin','40A','140A','1'),
  ('73272132412765574715','7327_00002','null.','140B','171001613','','PR ANONGBA SIMPLICE','100','PAYANT','2017-02-13','2017-02-15','16978','1EST','2017-03-27 21:32:41','admin','40B','140B','1'),
  ('73272132413159904262','7327_00002','null.','141A','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:41','admin','4A','141A','1'),
  ('73272132413659955695','7327_00002','null.','141B','171001634','','DR YESUFU AKIM OWABUNMI','100','CMUSAP17','2017-02-14','2017-02-16','343842','1EST','2017-03-27 21:32:41','admin','4B','141B','1'),
  ('73272132414055874200','7327_00002','null.','142A','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:41','admin','42A','142A','1'),
  ('73272132414645785123','7327_00002','null.','142B','171001556','','DR KOUROUMA. N.','80','CCOLINA','2017-02-12','2017-02-14','324547','1EST','2017-03-27 21:32:41','admin','42B','142B','1'),
  ('73272132415077255944','7327_00002','null.','137','171001603','XXXXXXXXXXXXXXXXXXXXX','DR YESUFU AKIM OWABUNMI','100','CASCOMA','2017-02-13','2017-02-15','313729','1EST','2017-03-27 21:32:41','admin','37','137','1'),
  ('73272132415151902546','7327_00002','null.','143','171001487','','DR BOUAICHA KHADIJA','100','CSTANEIN','2017-02-10','2017-02-14','332890','1EST','2017-03-27 21:32:41','admin','43','143','1'),
  ('73272132415658965936','7327_00002','null.','240','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:41','admin','40','240','2'),
  ('73272132415971487150','7327_00002','null.','241','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:41','admin','24','241','1'),
  ('73272132416429424243','7327_00002','null.','242','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:41','admin','4','242','2'),
  ('73272132416802422685','7327_00002','null.','243','171001463','','PR N GUESSAN GABRIEL','100','CSCAINTE','2017-02-09','2017-02-16','126006','2EST','2017-03-27 21:32:41','admin','43','243','2'),
  ('73272132417204247751','7327_00002','null.','244','171001511','','DR YAPI N''KAYO SYLVAIN','100','CSCAINAS','2017-02-10','2017-02-18','371390','2EST','2017-03-27 21:32:41','admin','44','244','2'),
  ('73272132417729547438','7327_00002','null.','245','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:41','admin','45','245','2'),
  ('73272132418479741677','7327_00002','null.','246','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:41','admin','46','246','2'),
  ('732721324188894345','7327_00002','null.','138','171001496','XXXXXXXXXXXXXXXXXXXXX','DR YESUFU AKIM OWABUNMI','100','CSTANEIN','2017-02-10','2017-02-14','364340','1EST','2017-03-27 21:32:41','admin','38','138','1'),
  ('73272132419388362197','7327_00002','null.','247A','171000925','','','PAY','PAYANT','2017-01-25','2017-03-25','370546','2EST','2017-03-27 21:32:41','admin','47A','247A','2'),
  ('7327213242129176488','7327_00002','null.','249','161005098','','','100','CPRCI','2016-06-14','2017-05-08','344955','2EST','2017-03-27 21:32:42','admin','49','249','2'),
  ('73272132421672654276','7327_00002','null.','250','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:42','admin','50','250','2'),
  ('73272132422122384932','7327_00002','null.','251','171001596','','DR SANGARE ABDOUL HASSAN','100','CMUGEFCI','2017-02-13','2017-02-14','348777','2EST','2017-03-27 21:32:42','admin','25','251','1'),
  ('73272132422511314599','7327_00002','null.','251','171001637','','','100','CSODEMI','2017-02-14','2017-02-14','366037','2EST','2017-03-27 21:32:42','admin','25','251','1'),
  ('73272132422902235585','7327_00002','null.','252','171001384','','','100','CMUTFOM','2017-02-07','2017-02-15','152067','2EST','2017-03-27 21:32:42','admin','5','252','2'),
  ('7327213242377122668','7327_00002','null.','253','171001251','','DR YEO NAHOUA','100','CPRCI','2017-02-02','2017-02-15','342341','2EST','2017-03-27 21:32:42','admin','53','253','2'),
  ('73272132424295008145','7327_00002','null.','254','171000181','','DR KONAN KOUASSI JEAN','100','CPRCI','2017-01-05','1999-11-30','9813','2EST','2017-03-27 21:32:42','admin','54','254','2'),
  ('7327213242451919634','7327_00002','null.','247B','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:42','admin','47B','247B','2'),
  ('73272132424772846967','7327_00002','null.','255A','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:42','admin','55A','255A','2'),
  ('73272132425067016162','7327_00002','null.','255B','171001452','','PR KONAN KOUAME PAUL GERA','80','CMUGEFCI','2017-02-09','2017-02-14','367636','2EST','2017-03-27 21:32:42','admin','55B','255B','2'),
  ('73272132425712234488','7327_00002','null.','256A','171001584','','DR DOFFOU BERENGER CONSTA','100','CGMCSERV','2017-02-12','2017-02-14','333249','2EST','2017-03-27 21:32:42','admin','56A','256A','2'),
  ('73272132426279849324','7327_00002','null.','256B','171001513','','DR YAPI N''KAYO SYLVAIN','100','CCOLINA','2017-02-10','2017-02-14','256692','2EST','2017-03-27 21:32:42','admin','56B','256B','2'),
  ('73272132426655591696','7327_00002','null.','257A','171001621','','DR YEO NAHOUA','PAY','PAYANT','2017-02-13','2017-02-16','371501','2EST','2017-03-27 21:32:42','admin','57A','257A','2'),
  ('73272132427052382673','7327_00002','null.','257B','171001533','','DR BASSE CHEICK','100','CMUGEFCI','2017-02-11','2017-02-16','371428','2EST','2017-03-27 21:32:42','admin','57B','257B','2'),
  ('73272132427387145343','7327_00002','null.','258A','171001528','','DR BASSE CHEICK','100','CMUTSOTR','2017-02-11','2017-02-14','369492','2EST','2017-03-27 21:32:42','admin','58A','258A','2'),
  ('73272132427834628382','7327_00002','null.','258A','171001508','','','100','CMUGEFCI','2017-02-10','1999-11-30','206051','2EST','2017-03-27 21:32:42','admin','58A','258A','2'),
  ('73272132428342889196','7327_00002','null.','248','171001205','','','100','CCOLINA','2017-02-02','1999-11-30','370941','2EST','2017-03-27 21:32:42','admin','48','248','2'),
  ('73272132429628575056','7327_00002','null.','258B','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:42','admin','58B','258B','2'),
  ('73272132431379182822','7327_00002','null.','259A','171001623','','DR ODI SERGE-ADOPOH','100','CCOLINA','2017-02-13','2017-02-15','371502','2EST','2017-03-27 21:32:43','admin','59A','259A','2'),
  ('73272132432965726360','7327_00002','null.','259B','171001619','','DR SORO KOUNTELE','100','CMUTMACN','2017-02-13','2017-02-15','337302','2EST','2017-03-27 21:32:43','admin','59B','259B','2'),
  ('73272132433808377565','7327_00002','null.','260A','171001518','','DR YAPI N''KAYO SYLVAIN','100','CMUTCIE','2017-02-11','2017-02-15','237952','2EST','2017-03-27 21:32:43','admin','60A','260A','2'),
  ('73272132435925567760','7327_00002','null.','260B','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:43','admin','60B','260B','2'),
  ('73272132436401281391','7327_00002','null.','220','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:43','admin','0','220','2'),
  ('73272132436859525258','7327_00002','null.','221','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:43','admin','22','221','1'),
  ('73272132437233786926','7327_00002','null.','222','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:43','admin','','222','2'),
  ('73272132437734657113','7327_00002','null.','223','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:43','admin','3','223','2'),
  ('73272132438122249488','7327_00002','null.','224','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:43','admin','4','224','2'),
  ('73272132438629007971','7327_00002','null.','225','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:43','admin','5','225','2'),
  ('7327213243900411758','7327_00002','null.','226','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:43','admin','6','226','2'),
  ('73272132439394385726','7327_00002','null.','227','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:43','admin','7','227','2'),
  ('73272132439896735608','7327_00002','null.','228','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:43','admin','8','228','2'),
  ('73272132441162911347','7327_00002','null.','231','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:44','admin','23','231','1'),
  ('73272132442085474722','7327_00002','null.','232','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:44','admin','3','232','2'),
  ('73272132442602014421','7327_00002','null.','233','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:44','admin','33','233','2'),
  ('73272132442771797445','7327_00002','null.','229','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:44','admin','9','229','2'),
  ('73272132442995569908','7327_00002','null.','234','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:44','admin','34','234','2'),
  ('73272132443385585801','7327_00002','null.','235A','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:44','admin','35A','235A','2'),
  ('73272132443765363802','7327_00002','null.','235B','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:44','admin','35B','235B','2'),
  ('73272132444098493818','7327_00002','null.','236A','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:44','admin','36A','236A','2'),
  ('73272132444476280863','7327_00002','null.','236B','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:44','admin','36B','236B','2'),
  ('73272132444887675942','7327_00002','null.','237A','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:44','admin','37A','237A','2'),
  ('73272132445258566600','7327_00002','null.','237B','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:44','admin','37B','237B','2'),
  ('73272132445761105523','7327_00002','null.','238A','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:44','admin','38A','238A','2'),
  ('73272132446147992321','7327_00002','null.','238B','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:44','admin','38B','238B','2'),
  ('73272132446547804849','7327_00002','null.','239A','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:44','admin','39A','239A','2'),
  ('73272132446849708834','7327_00002','null.','230','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:44','admin','30','230','2'),
  ('73272132446917084368','7327_00002','null.','239B','','','','','','2017-03-27','2017-03-27','','2ENORD','2017-03-27 21:32:44','admin','39B','239B','2'),
  ('73272132447216091946','7327_00002','null.','201A','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:44','admin','20A','201A','1'),
  ('73272132447712914275','7327_00002','null.','201B','171001534','','DR ONNA GUY GERARD GUEI','100','CMUTCIE','2017-02-11','2017-02-14','371424','2SUD','2017-03-27 21:32:44','admin','20B','201B','1'),
  ('73272132448084696444','7327_00002','null.','202A','171001563','','','100','CASCOMA','2017-02-12','2017-02-14','277034','2SUD','2017-03-27 21:32:44','admin','0A','202A','2'),
  ('73272132448931733431','7327_00002','null.','202B','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:44','admin','0B','202B','2'),
  ('73272132449522289580','7327_00002','null.','203A','171001587','','DR NGORAN KOFFI AYA GEORG','100','CBCEAO','2017-02-12','2017-02-14','328086','2SUD','2017-03-27 21:32:44','admin','03A','203A','2'),
  ('73272132451357015291','7327_00002','null.','205A','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:45','admin','05A','205A','2'),
  ('73272132451732295763','7327_00002','null.','205B','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:45','admin','05B','205B','2'),
  ('73272132452179256543','7327_00002','null.','206','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:45','admin','06','206','2'),
  ('732721324525263739','7327_00002','null.','203B','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:45','admin','03B','203B','2'),
  ('73272132452675621248','7327_00002','null.','207','171001614','','DR ADOU PHILOMENE','100','PAYANT','2017-02-13','1999-11-30','347961','2SUD','2017-03-27 21:32:45','admin','07','207','2'),
  ('73272132453124065864','7327_00002','null.','208','171001605','','','100','PAYANT','2017-02-13','2017-02-16','285625','2SUD','2017-03-27 21:32:45','admin','08','208','2'),
  ('73272132453515350565','7327_00002','null.','208','171001606','','','100','CCFE','2017-02-13','2017-02-16','285625','2SUD','2017-03-27 21:32:45','admin','08','208','2'),
  ('73272132454003315337','7327_00002','null.','209','171001436','','DR NGORAN KOFFI AYA GEORG','100','CMUTCIE','2017-02-08','2017-02-14','332700','2SUD','2017-03-27 21:32:45','admin','09','209','2'),
  ('73272132454409595511','7327_00002','null.','210','171001211','','DR ADOU PHILOMENE','100','CASCOMA','2017-02-02','2017-02-15','370951','2SUD','2017-03-27 21:32:45','admin','20','210','1'),
  ('73272132454893409305','7327_00002','null.','211','171000351','','PR LASME GUILLAO BERTHE E','PAY','PAYANT','2017-01-10','2017-02-28','369840','2SUD','2017-03-27 21:32:45','admin','2','211','1'),
  ('73272132455287292462','7327_00002','null.','204A','171001575','','','100','CASCOMA','2017-02-12','1999-11-30','336948','2SUD','2017-03-27 21:32:45','admin','04A','204A','2'),
  ('73272132455837826294','7327_00002','null.','212','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:45','admin','22','212','1'),
  ('73272132456229906586','7327_00002','null.','214','171001550','','PR LASME GUILLAO BERTHE E','100','CCOLINA','2017-02-12','2017-02-18','371330','2SUD','2017-03-27 21:32:45','admin','24','214','1'),
  ('73272132456616142569','7327_00002','null.','215','171001101','','','PAY','PAYANT','2017-01-30','1999-11-30','370809','2SUD','2017-03-27 21:32:45','admin','25','215','1'),
  ('73272132457084631630','7327_00002','null.','216','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:45','admin','26','216','1'),
  ('73272132457661049779','7327_00002','null.','217','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:45','admin','27','217','1'),
  ('73272132458161253787','7327_00002','null.','218','171001561','','','100','CMUGEFCI','2017-02-12','2017-02-14','371282','2SUD','2017-03-27 21:32:45','admin','28','218','1'),
  ('73272132459069888015','7327_00002','null.','204B','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:45','admin','04B','204B','2'),
  ('73272132459544891544','7327_00002','null.','219','171001514','','DR KOUADIO BHERAT ARMEL','100','CMUTMDCI','2017-02-11','2017-02-14','371391','2SUD','2017-03-27 21:32:45','admin','29','219','1'),
  ('73272132461419166925','7327_00002','null.','344','171001020','','','PAY','PAYANT','2017-01-28','2017-02-15','370736','3EST','2017-03-27 21:32:46','admin','44','344','3'),
  ('73272132462265202382','7327_00002','null.','345','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:46','admin','45','345','3'),
  ('73272132462287121357','7327_00002','null.','219','171001580','','DR KONE SOMO','100','CMUTMDCI','2017-02-12','2017-02-14','371450','2SUD','2017-03-27 21:32:46','admin','29','219','1'),
  ('73272132462706199523','7327_00002','null.','346','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:46','admin','46','346','3'),
  ('73272132463198704638','7327_00002','null.','347','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:46','admin','47','347','3'),
  ('73272132463633399834','7327_00002','null.','348','171001386','','','PAY','PAYANT','2017-02-07','2017-02-20','371162','3EST','2017-03-27 21:32:46','admin','48','348','3'),
  ('73272132464024361381','7327_00002','null.','349A','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:46','admin','49A','349A','3'),
  ('73272132464363824943','7327_00002','null.','349B','171001544','','DR ONNA GUY GERARD GUEI','PAY','PAYANT','2017-02-11','2017-02-16','371433','3EST','2017-03-27 21:32:46','admin','49B','349B','3'),
  ('73272132464758336766','7327_00002','null.','349B','171001608','','DR DIALLO ZAOURECH','PAY','PAYANT','2017-02-13','2017-02-16','371465','3EST','2017-03-27 21:32:46','admin','49B','349B','3'),
  ('73272132465131206569','7327_00002','null.','349B','171000856','','','80','CMUMADGI','2017-01-23','2017-02-28','191944','3EST','2017-03-27 21:32:46','admin','49B','349B','3'),
  ('73272132465576346730','7327_00002','null.','350','171001541','','DR ONNA GUY GERARD GUEI','PAY','PAYANT','2017-02-11','2017-02-16','6416','3EST','2017-03-27 21:32:46','admin','50','350','3'),
  ('73272132465954077528','7327_00002','null.','351','171000930','','DR YEO NAHOUA','PAY','PAYANT','2017-01-25','2017-02-14','370560','3EST','2017-03-27 21:32:46','admin','35','351','1'),
  ('73272132465962813770','7327_00002','null.','342','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:46','admin','34','342','2'),
  ('73272132466359287566','7327_00002','null.','351','171001604','','','AUT','PAYANT','2017-02-13','2017-02-15','186134','3EST','2017-03-27 21:32:46','admin','35','351','1'),
  ('73272132466846300720','7327_00002','null.','352','171001510','','DR ODI SERGE-ADOPOH','PAY','PAYANT','2017-02-10','2017-02-14','371389','3EST','2017-03-27 21:32:46','admin','35','352','2'),
  ('73272132467341996671','7327_00002','null.','352','171001466','','DR SORO DRAMANE','100','CSIDAM','2017-02-09','1999-11-30','367623','3EST','2017-03-27 21:32:46','admin','35','352','2'),
  ('73272132467685668358','7327_00002','null.','353','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:46','admin','5','353','3'),
  ('73272132468565232774','7327_00002','null.','354','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:46','admin','54','354','3'),
  ('73272132469333446487','7327_00002','null.','355','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:46','admin','55','355','3'),
  ('73272132469722314323','7327_00002','null.','356','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:46','admin','56','356','3'),
  ('73272132469818624948','7327_00002','null.','343','171001549','','DR KONAN SERGE DIDIER','100','CCOLINA','2017-02-12','2017-02-14','30828','3EST','2017-03-27 21:32:46','admin','4','343','3'),
  ('73272132471055803445','7327_00002','null.','358A','171000913','','PR CAMARA BENOIT','PAY','PAYANT','2017-01-25','2017-03-11','368611','3EST','2017-03-27 21:32:47','admin','58A','358A','3'),
  ('73272132471496178573','7327_00002','null.','358B','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:47','admin','58B','358B','3'),
  ('73272132471635109063','7327_00002','null.','357A','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:47','admin','57A','357A','3'),
  ('73272132471894358843','7327_00002','null.','359A','171001573','','','100','CVANBRED','2017-02-12','2017-02-14','150282','3EST','2017-03-27 21:32:47','admin','59A','359A','3'),
  ('73272132472274352434','7327_00002','null.','359B','171001553','','DR KONAN SERGE DIDIER','100','CMUTCIE','2017-02-12','2017-02-15','201317','3EST','2017-03-27 21:32:47','admin','59B','359B','3'),
  ('73272132472716962357','7327_00002','null.','360A','171001393','','','PAY','PAYANT','2017-02-07','2017-02-15','371179','3EST','2017-03-27 21:32:47','admin','60A','360A','3'),
  ('73272132472998392361','7327_00002','null.','360A','171001421','','','PAY','PAYANT','2017-02-08','2017-02-15','334477','3EST','2017-03-27 21:32:47','admin','60A','360A','3'),
  ('73272132473488543204','7327_00002','null.','360A','171001628','','DR DOFFOU BERENGER CONSTA','100','CVANBRED','2017-02-13','2017-02-16','360049','3EST','2017-03-27 21:32:47','admin','60A','360A','3'),
  ('73272132473932329592','7327_00002','null.','360B','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:47','admin','60B','360B','3'),
  ('73272132474217720100','7327_00002','null.','361A','171000047','','DR YEO NAHOUA','100','CPRCI','2017-01-02','2017-02-28','369434','3EST','2017-03-27 21:32:47','admin','36A','361A','1'),
  ('73272132474752614346','7327_00002','null.','361A','171001398','','','100','CMUTCIE','2017-02-07','2017-02-28','57951','3EST','2017-03-27 21:32:47','admin','36A','361A','1'),
  ('73272132475391696485','7327_00002','null.','361B','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:47','admin','36B','361B','1'),
  ('73272132475768994438','7327_00002','null.','362A','171000985','','','100','CMUTSODE','2017-01-27','2017-02-15','370666','3EST','2017-03-27 21:32:47','admin','36A','362A','2'),
  ('73272132476193208607','7327_00002','null.','357B','171000507','','DR DOSSO SOUALIHO','PAY','PAYANT','2017-01-14','2017-02-15','370065','3EST','2017-03-27 21:32:47','admin','57B','357B','3'),
  ('73272132476266092321','7327_00002','null.','362A','171001265','','DR YEO NAHOUA','100','CPRCI','2017-02-03','2017-10-25','195663','3EST','2017-03-27 21:32:47','admin','36A','362A','2'),
  ('73272132476646251199','7327_00002','null.','362A','171001509','','','100','CPRCI','2017-02-10','1999-11-30','91951','3EST','2017-03-27 21:32:47','admin','36A','362A','2'),
  ('73272132477148103474','7327_00002','null.','362B','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:47','admin','36B','362B','2'),
  ('73272132477537806505','7327_00002','null.','322','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:47','admin','3','322','2'),
  ('73272132477865914461','7327_00002','null.','323','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:47','admin','33','323','2'),
  ('7327213247834688678','7327_00002','null.','324','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:47','admin','34','324','2'),
  ('73272132478759290278','7327_00002','null.','325','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:47','admin','35','325','2'),
  ('73272132479142126369','7327_00002','null.','326','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:47','admin','36','326','2'),
  ('73272132479532984978','7327_00002','null.','327','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:47','admin','37','327','2'),
  ('73272132479912305522','7327_00002','null.','328A','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:47','admin','38A','328A','2'),
  ('73272132481238696249','7327_00002','null.','331','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:48','admin','33','331','1'),
  ('73272132481522744125','7327_00002','null.','332','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:48','admin','33','332','2'),
  ('73272132481906956910','7327_00002','null.','333','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:48','admin','','333','3'),
  ('7327213248192136646','7327_00002','null.','328B','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:48','admin','38B','328B','2'),
  ('73272132482185513129','7327_00002','null.','334','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:48','admin','4','334','3'),
  ('73272132483004088610','7327_00002','null.','335','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:48','admin','5','335','3'),
  ('7327213248367936789','7327_00002','null.','336','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:48','admin','6','336','3'),
  ('73272132484116338445','7327_00002','null.','337A','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:48','admin','7A','337A','3'),
  ('73272132484409551926','7327_00002','null.','337B','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:48','admin','7B','337B','3'),
  ('73272132484776608673','7327_00002','null.','338A','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:48','admin','8A','338A','3'),
  ('73272132485074473875','7327_00002','null.','338B','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:48','admin','8B','338B','3'),
  ('73272132485726001886','7327_00002','null.','339A','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:48','admin','9A','339A','3'),
  ('73272132485792291020','7327_00002','null.','329','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:48','admin','39','329','2'),
  ('73272132486161161215','7327_00002','null.','339B','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:48','admin','9B','339B','3'),
  ('73272132486579620181','7327_00002','null.','340A','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:48','admin','40A','340A','3'),
  ('73272132486995890525','7327_00002','null.','340B','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:48','admin','40B','340B','3'),
  ('73272132487436673162','7327_00002','null.','341A','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:48','admin','34A','341A','1'),
  ('73272132487823011171','7327_00002','null.','341B','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:48','admin','34B','341B','1'),
  ('7327213248851799958','7327_00002','null.','330','','','','','','2017-03-27','2017-03-27','','3ENORD','2017-03-27 21:32:48','admin','0','330','3'),
  ('73272132488608309870','7327_00002','null.','301A','','','','','','2017-03-27','2017-03-27','','3SUD','2017-03-27 21:32:48','admin','30A','301A','1'),
  ('73272132488981599468','7327_00002','null.','301B','','','','','','2017-03-27','2017-03-27','','3SUD','2017-03-27 21:32:48','admin','30B','301B','1'),
  ('73272132489266627928','7327_00002','null.','302A','','','','','','2017-03-27','2017-03-27','','3SUD','2017-03-27 21:32:48','admin','30A','302A','2'),
  ('73272132489637886159','7327_00002','null.','302B','171001624','','DR DOFFOU BERENGER CONSTA','100','CACCSIR','2017-02-13','2017-02-16','250216','3SUD','2017-03-27 21:32:48','admin','30B','302B','2'),
  ('73272132489924800318','7327_00002','null.','303A','171001591','','DR DOFFOU BERENGER CONSTA','PAY','PAYANT','2017-02-13','2017-02-17','242282','3SUD','2017-03-27 21:32:48','admin','0A','303A','3'),
  ('73272132491382566760','7327_00002','null.','304A','171001632','','DR DOFFOU BERENGER CONSTA','100','CGSAVCI','2017-02-14','2017-02-17','217128','3SUD','2017-03-27 21:32:49','admin','04A','304A','3'),
  ('73272132491891365815','7327_00002','null.','304B','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:49','admin','04B','304B','3'),
  ('73272132492263831356','7327_00002','null.','305A','171001429','','DR ODI SERGE-ADOPOH','100','CONUCI','2017-02-08','2017-02-20','371246','3SUD','2017-03-27 21:32:49','admin','05A','305A','3'),
  ('73272132492643348468','7327_00002','null.','305B','171001430','','DR ODI SERGE-ADOPOH','100','CVANBRED','2017-02-08','2017-02-16','371248','3SUD','2017-03-27 21:32:49','admin','05B','305B','3'),
  ('73272132492927275149','7327_00002','null.','306','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:49','admin','06','306','3'),
  ('73272132493028549614','7327_00002','null.','303B','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:49','admin','0B','303B','3'),
  ('73272132493303794976','7327_00002','null.','307','161011161','','DR YEO NAHOUA','100','CMUTCNAT','2016-12-29','2017-02-14','369294','3SUD','2017-03-27 21:32:49','admin','07','307','3'),
  ('73272132493587506353','7327_00002','null.','307','131003915','','','100','CBCEAO','2013-07-01','1999-11-30','275285','3SUD','2017-03-27 21:32:49','admin','07','307','3'),
  ('73272132493971735324','7327_00002','null.','308','171001609','','','100','CGMC','2017-02-13','2017-02-15','370356','3SUD','2017-03-27 21:32:49','admin','08','308','3'),
  ('73272132494253715861','7327_00002','null.','308','171001626','','DR DOFFOU BERENGER CONSTA','100','CBILLONK','2017-02-13','2017-02-16','371500','3SUD','2017-03-27 21:32:49','admin','08','308','3'),
  ('73272132494639501113','7327_00002','null.','309','171001612','','','100','PAYANT','2017-02-13','2017-02-14','176113','3SUD','2017-03-27 21:32:49','admin','09','309','3'),
  ('73272132494916588891','7327_00002','null.','310','171001472','','DR YEO NAHOUA','PAY','PAYANT','2017-02-09','2017-02-28','371331','3SUD','2017-03-27 21:32:49','admin','30','310','1'),
  ('73272132495291876203','7327_00002','null.','311','171001611','','DR ODI SERGE-ADOPOH','100','CMUGEFCI','2017-02-13','2017-02-16','260577','3SUD','2017-03-27 21:32:49','admin','3','311','1'),
  ('73272132495584060380','7327_00002','null.','312','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:49','admin','32','312','1'),
  ('73272132496013611584','7327_00002','null.','304A','171001577','','','100','CCOLINA','2017-02-12','2017-02-14','371448','3SUD','2017-03-27 21:32:49','admin','04A','304A','3'),
  ('73272132496577436575','7327_00002','null.','314','171001617','','PR KAKOU KONAN MEDARD','100','CMUGEFCI','2017-02-13','2017-02-23','370731','3SUD','2017-03-27 21:32:49','admin','34','314','1'),
  ('73272132497359467762','7327_00002','null.','315A','171001625','','DR DOFFOU BERENGER CONSTA','PAY','PAYANT','2017-02-13','2017-02-18','109890','3SUD','2017-03-27 21:32:49','admin','35A','315A','1'),
  ('73272132498288252078','7327_00002','null.','315B','','','','','','2017-03-27','2017-03-27','','','2017-03-27 21:32:49','admin','35B','315B','1'),
  ('73272132498568299832','7327_00002','null.','316','171001589','','DR DOFFOU BERENGER CONSTA','100','CALLIAWO','2017-02-12','2017-02-14','324878','3SUD','2017-03-27 21:32:49','admin','36','316','1'),
  ('73272132498959371565','7327_00002','null.','317','171001311','','DR KONAN SERGE DIDIER','PAY','PAYANT','2017-02-05','2017-02-20','74973','3SUD','2017-03-27 21:32:49','admin','37','317','1'),
  ('73272132499233943925','7327_00002','null.','318','171001068','','DR DOSSO SOUALIHO','100','CBCEAO','2017-01-30','1999-11-30','370754','3SUD','2017-03-27 21:32:49','admin','38','318','1'),
  ('73272132499619934515','7327_00002','null.','319','161009941','','DR NDJEUNDO PATRICK GIMEL','100','CASCOMA','2016-11-22','2017-02-14','258048','3SUD','2017-03-27 21:32:49','admin','39','319','1'),
  ('73272132499908553496','7327_00002','null.','320','171000806','','DR ONNA GUY GERARD GUEI','PAY','PAYANT','2017-01-22','2017-02-20','370410','3SUD','2017-03-27 21:32:49','admin','30','320','2'),
  ('73272132501244728780','7327_00002','null.','500','171001464','','DR YEO NAHOUA','100','CPRCI','2017-02-09','2017-02-28','17977','SINT','2017-03-27 21:32:50','admin','500','500','500'),
  ('73272132502846341668','7327_00002','null.','321','171001431','','PR BOHOUSSOU KOUACOU PAUL','PAY','PAYANT','2017-02-08','1999-11-30','261804','3SUD','2017-03-27 21:32:50','admin','32','321','1'),
  ('73272132505724995158','7327_00002','null.','500','171001582','','DR DOFFOU BERENGER CONSTA','100','CMUGEFCI','2017-02-13','2017-02-17','371452','SINT','2017-03-27 21:32:50','admin','500','500','500'),
  ('73272132509475507634','7327_00002','null.','500','171001137','','','PAY','PAYANT','2017-01-31','2017-02-18','205776','SINT','2017-03-27 21:32:50','admin','500','500','500'),
  ('73282238192638856814','7328_00001','null.','130','171001486','DR ADEPOH MICHELE DORCAS','DR ADEPOH MICHELE DORCAS','100','CBOAD','2017-02-10','2017-02-14','363226','1EST','2017-03-28 22:38:19','admin','30','130','1'),
  ('73282238196036677205','7328_00001','null.','131','171001558','DR YESUFU AKIM OWABUNMI','DR YESUFU AKIM OWABUNMI','100','CASCOMA','2017-02-12','2017-02-16','292716','1EST','2017-03-28 22:38:19','admin','3','131','1'),
  ('73282238196353935908','7328_00001','null.','132','171001517','DR GNEBEI ROGER','DR GNEBEI ROGER','PAY','PAYANT','2017-02-10','2017-02-14','160565','1EST','2017-03-28 22:38:19','admin','32','132','1'),
  ('73282252159758695609','7328_00002','null.','130','171001486','DR ADEPOH MICHELE DORCAS','DR ADEPOH MICHELE DORCAS','100','CBOAD','2017-02-10','2017-02-14','363226','1EST','2017-03-28 22:52:15','admin','30','130','1'),
  ('73282252162292865401','7328_00002','null.','131','171001558','DR YESUFU AKIM OWABUNMI','DR YESUFU AKIM OWABUNMI','100','CASCOMA','2017-02-12','2017-02-16','292716','1EST','2017-03-28 22:52:16','admin','3','131','1'),
  ('73282252165981775467','7328_00002','null.','132','171001517','DR GNEBEI ROGER','DR GNEBEI ROGER','PAY','PAYANT','2017-02-10','2017-02-14','160565','1EST','2017-03-28 22:52:16','admin','32','132','1'),
  ('73301213469599643063','7330_00001','null.','130','171001486','DR ADEPOH MICHELE DORCAS','DR ADEPOH MICHELE DORCAS','100','CBOAD','2017-02-10','2017-02-14','363226','1EST','2017-03-30 12:01:34','admin','30','130','1'),
  ('73301213475836979835','7330_00001','null.','131','171001558','DR YESUFU AKIM OWABUNMI','DR YESUFU AKIM OWABUNMI','100','CASCOMA','2017-02-12','2017-02-16','292716','1EST','2017-03-30 12:01:34','admin','3','131','1'),
  ('73301213478977569830','7330_00001','null.','132','171001517','DR GNEBEI ROGER','DR GNEBEI ROGER','PAY','PAYANT','2017-02-10','2017-02-14','160565','1EST','2017-03-30 12:01:34','admin','32','132','1'),
  ('7330126841795492573','7330_00002','null.','130','171001486','DR ADEPOH MICHELE DORCAS','DR ADEPOH MICHELE DORCAS','100','CBOAD','2017-02-10','2017-02-14','363226','1EST','2017-03-30 12:06:08','admin','30','130','1'),
  ('7330126861028427714','7330_00002','null.','131','171001558','DR YESUFU AKIM OWABUNMI','DR YESUFU AKIM OWABUNMI','100','CASCOMA','2017-02-12','2017-02-16','292716','1EST','2017-03-30 12:06:08','admin','3','131','1'),
  ('7330126868861863528','7330_00002','null.','132','171001517','DR GNEBEI ROGER','DR GNEBEI ROGER','PAY','PAYANT','2017-02-10','2017-02-14','160565','1EST','2017-03-30 12:06:08','admin','32','132','1'),
  ('7330126876640717139','7330_00002','null.','133','171001512','KEN MASTER','KEN MASTER','155','','2017-02-10','2017-02-14','501012','1EST','2017-03-30 12:06:08','admin','33','133','1'),
  ('7441047911874658110','744_00002','null.','130','171001486','DR ADEPOH MICHELE DORCAS','DR ADEPOH MICHELE DORCAS','100','CBOAD','2017-02-10','2017-02-14','363226','1EST','2017-04-04 10:47:09','admin','30','130','1'),
  ('744104791681226928','744_00002','null.','131','171001558','DR YESUFU AKIM OWABUNMI','DR YESUFU AKIM OWABUNMI','100','CASCOMA','2017-02-12','2017-02-16','292716','1EST','2017-04-04 10:47:09','admin','3','131','1'),
  ('7441047919799551561','744_00002','null.','132','171001517','DR GNEBEI ROGER','DR GNEBEI ROGER','PAY','PAYANT','2017-02-10','2017-02-14','160565','1EST','2017-04-04 10:47:09','admin','32','132','1'),
  ('7441047923497917847','744_00002','null.','133','171001512','KEN MASTER','KEN MASTER','155','','2017-02-10','2017-02-14','501012','1EST','2017-04-04 10:47:09','admin','33','133','1'),
  ('74417505471948067578','744_00003','null.','130','171001486','DR ADEPOH MICHELE DORCAS','DR ADEPOH MICHELE DORCAS','100','CBOAD','2017-02-10','2017-02-14','363226','1EST','2017-04-04 17:50:54','admin','30','130','1'),
  ('7441750549053891721','744_00003','null.','131','171001558','DR YESUFU AKIM OWABUNMI','DR YESUFU AKIM OWABUNMI','100','CASCOMA','2017-02-12','2017-02-16','292716','1EST','2017-04-04 17:50:54','admin','3','131','1'),
  ('74417505496988267236','744_00003','null.','132','171001517','DR GNEBEI ROGER','DR GNEBEI ROGER','PAY','PAYANT','2017-02-10','2017-02-14','160565','1EST','2017-04-04 17:50:54','admin','32','132','1'),
  ('7441750552136453772','744_00003','null.','133','171001512','KEN MASTER','KEN MASTER','155','','2017-02-10','2017-02-14','501012','1EST','2017-04-04 17:50:55','admin','33','133','1'),
  ('744175055771042925','744_00003','null.','134','181811','Djeke Joseph','','','','2017-02-11','2017-02-15','4855555','1EST','2017-04-04 17:50:55','admin','34','134','1');
COMMIT;

/* Data for the `t_inboud_message` table  (LIMIT 0,500) */

INSERT INTO `t_inboud_message` (`lg_INBOUND_MESSAGE_ID`, `dt_CREATED`, `dt_UPDATED`, `str_MESSAGE`, `str_STATUT`, `str_PHONE`) VALUES
  ('41020141751026627258','2014-10-20 14:17:05',NULL,'STOCK','intrusion','77257261'),
  ('41020141835464705613','2014-10-20 14:18:03','2014-10-20 14:18:03','STOCK','authorized','77257261'),
  ('41020141840595791796','2014-10-20 14:18:40','2014-10-20 14:18:40','STOCK','authorized','77257261'),
  ('42181311031942703047','2014-02-18 13:11:00',NULL,'cc manyck','intrusion','01010101'),
  ('42181391971596355896','2014-02-18 13:09:19',NULL,'cc manyck','authorized','47204771'),
  ('42181421278782406838','2014-02-18 14:21:27',NULL,'de','intrusion','59495092'),
  ('42181421518383939903','2014-02-18 14:21:51',NULL,'de','authorized','47204771'),
  ('42181422379689876421','2014-02-18 14:22:37',NULL,'de','authorized','47204771'),
  ('42181641548062863357','2014-02-18 16:41:54','2014-02-18 16:41:54','cc manyck','authorized','47204771'),
  ('42181642446989178656','2014-02-18 16:42:44','2014-02-18 16:42:44','STOCK','authorized','47204771'),
  ('42181645531895468160','2014-02-18 16:45:53','2014-02-18 16:45:53','STOCK','authorized','47204771'),
  ('42181648085678548290','2014-02-18 16:48:00','2014-02-18 16:48:00','STOCK','authorized','47204771'),
  ('42181649849164353732','2014-02-18 16:49:08','2014-02-18 16:49:08','STOCK','authorized','47204771'),
  ('42181650277927584043','2014-02-18 16:50:27','2014-02-18 16:50:27','STOCK','authorized','47204771'),
  ('4218171333275425294','2014-02-18 17:13:03','2014-02-18 17:13:03','STOCK','authorized','47204771'),
  ('42181782329492131140','2014-02-18 17:08:23',NULL,'helo','intrusion','59495092'),
  ('4218179131961575579','2014-02-18 17:09:13','2014-02-18 17:09:14','helo','authorized','47204771'),
  ('42181794965619872893','2014-02-18 17:09:49','2014-02-18 17:09:49','STOCK','authorized','47204771'),
  ('42181817251844576942','2014-02-18 18:17:25',NULL,'Votre credit est insuffisant pour effectuer cette operation.','intrusion','+0'),
  ('42181819378144938151','2014-02-18 18:19:03',NULL,'Votre credit est insuffisant pour effectuer cette operation.','intrusion','+0'),
  ('42181938854022967108','2014-02-18 19:38:08',NULL,'STOCK','intrusion','+22559495092'),
  ('42182055141035621871','2014-02-18 20:55:14',NULL,'STOCK','intrusion','+22505597350'),
  ('42182120427533031729','2014-02-18 21:20:42',NULL,'Cc cheri juxt t di k xava tjr pa xui malad vwla pkw jt rpnd pa tro xer tmp xi porte tw bian bizu','intrusion','+22577273585'),
  ('42182120559369103529','2014-02-18 21:20:55',NULL,'Votre credit est insuffisant pour effectuer cette operation.','intrusion','+0'),
  ('42182124242094646323','2014-02-18 21:24:24',NULL,'tai ala maison ou tai o ba','intrusion','+22557591660'),
  ('42191615373976031229','2014-02-19 16:15:37',NULL,'cc manyck','intrusion','47204771'),
  ('42191619226277512241','2014-02-19 16:19:02',NULL,'cc manyck','intrusion','47204771'),
  ('42191621207529297217','2014-02-19 16:21:20',NULL,'cc manyck','intrusion','47204771'),
  ('4219162143345643589','2014-02-19 16:21:43',NULL,'cc manyck','intrusion','47204771'),
  ('42191623559285272171','2014-02-19 16:23:55',NULL,'cc manyck','intrusion','47204771'),
  ('42191629251366619520','2014-02-19 16:29:25',NULL,'cc manyck','intrusion','47204771'),
  ('42192081679910285991','2014-02-19 20:08:16','2014-02-19 20:08:16','STOCK','authorized','07929972'),
  ('42192127516932723565','2014-02-19 21:27:51',NULL,'Coucou','intrusion','08543680'),
  ('42192128514977942433','2014-02-19 21:28:51',NULL,'Je vais bien et toi?','intrusion','08543680'),
  ('42192129428708012633','2014-02-19 21:29:42',NULL,'Ok cool','intrusion','08543680'),
  ('42192133838867123594','2014-02-19 21:33:08',NULL,'Tn cmportement ne m a pas plus sincÃ¨rement on program un truc,j amÃ©nage mn program Ã  koz 2 xa.j t Ã©kri u repndais pas et aprÃ¨ u ve ke mw j vienne alr ke ','intrusion','08543680'),
  ('42192133851366493651','2014-02-19 21:33:08',NULL,'le temp Ã©tÃ¨ 2ja avancÃ©','intrusion','08543680'),
  ('42192135579838739688','2014-02-19 21:35:57',NULL,'Tu cnais la date de mn aniv nn','intrusion','08543680'),
  ('42192139127451912854','2014-02-19 21:39:12',NULL,'Le 27 de ce mois dnk program mn kado','intrusion','08543680'),
  ('42192313472862531900','2014-02-19 23:13:47',NULL,'b cest mtn jai fini oh mai tu pa o work dmin','intrusion','57591660'),
  ('42192328458438706328','2014-02-19 23:28:45',NULL,'Apl moi stp','intrusion','47796784'),
  ('4219812201834103707','2014-02-19 08:12:20',NULL,'STOCK','intrusion','2255949509259495092'),
  ('42198125480687253841','2014-02-19 08:12:54','2014-02-19 08:12:54','STOCK','authorized','59495092'),
  ('4219873219088511166','2014-02-19 08:07:32',NULL,'STOCK','intrusion','2255949509259495092'),
  ('42211445057197928510','2014-02-21 14:04:50',NULL,'cc manyck','intrusion','47204771'),
  ('42211453994543248102','2014-02-21 14:05:39',NULL,'cc manyck','intrusion','47204771'),
  ('42211464897584288997','2014-02-21 14:06:48',NULL,'cc manyck','intrusion','47204771'),
  ('42211495084126082741','2014-02-21 14:09:50',NULL,'cc manyck','intrusion','47204771'),
  ('42211857512772124932','2014-02-21 18:57:51',NULL,'STOCKg','intrusion','47204771'),
  ('42211858229599785754','2014-02-21 18:58:22','2014-02-21 18:58:22','STOCKg','authorized','59495092'),
  ('42211921027433783834','2014-02-21 19:02:10',NULL,'slt cmen va tu?','intrusion','09820020'),
  ('42212039124815547839','2014-02-21 20:39:12',NULL,'207:Le numÃ©ro de la transaction R140221.2037.430274 de recharger 500 FCFA de 48754890 a rÃ©ussi. Votre nouveau solde est 532 et la validitÃ© est 07/04/14. ','intrusion','454'),
  ('42212245389737812787','2014-02-21 22:45:03',NULL,'de kel genr e cÃ¨ du a koi?','intrusion','09820020'),
  ('42212252348736679366','2014-02-21 22:52:34',NULL,'sorry.','intrusion','09820020'),
  ('42221658206706573922','2014-02-22 16:58:20',NULL,'Week-end surprise! Clients prÃ©payÃ©s, les 22 et 23/02, modifiez votre liste de NumÃ©ros prÃ©fÃ©rÃ©s Ã  100F/Num au lieu de 500F via le #221# ou appelez le 221. Merci','intrusion','Info Orange'),
  ('42221728504153754668','2014-02-22 17:28:50',NULL,'Grd frer','intrusion','57346583'),
  ('42222027417556653860','2014-02-22 20:27:41',NULL,'salu','intrusion','57591660'),
  ('42222032195987124506','2014-02-22 20:32:19','2014-02-22 20:32:19','lu','authorized','57591660'),
  ('42241019448065966628','2014-02-24 10:19:44','2014-02-24 10:19:44','STOCK ','authorized','08089070'),
  ('42241022278226814468','2014-02-24 10:22:27','2014-02-24 10:22:27','STOCK','authorized','08089070'),
  ('4225124461765518515','2014-02-25 01:24:46','2014-02-25 01:24:46','STOCK','authorized','08543680'),
  ('4311711253241083864','2014-03-01 17:11:25','2014-03-01 17:11:25','STOCK','authorized','59495092'),
  ('43117113089088633701','2014-03-01 17:11:30','2014-03-01 17:11:30','BLACKLABEL(-1);TUBORG(29);MALTA(28);GUINESS(34);BAYLES(21);TONIC(22);ABSOLUTEVODKA(9);COCACOLA(33);GET27(-2);','authorized','59495092'),
  ('43117123463384647782','2014-03-01 17:12:34','2014-03-01 17:12:34','STOCK','authorized','59495092'),
  ('43117124061420661450','2014-03-01 17:12:40','2014-03-01 17:12:40','BLACKLABEL(-1);TUBORG(29);MALTA(28);GUINESS(34);BAYLES(21);TONIC(22);ABSOLUTEVODKA(9);COCACOLA(33);GET27(-2);','authorized','59495092'),
  ('43117135888080839139','2014-03-01 17:13:58','2014-03-01 17:13:58','STOCK','authorized','59495092'),
  ('4311714423043168123','2014-03-01 17:14:04','2014-03-01 17:14:04','BLACKLABEL(9);TUBORG(29);MALTA(28);GUINESS(34);BAYLES(21);TONIC(22);ABSOLUTEVODKA(9);COCACOLA(33);GET27(-2);','authorized','59495092'),
  ('43117153327655638441','2014-03-01 17:15:33','2014-03-01 17:15:33','BOOBAS','authorized','59495092'),
  ('4311717156347589013','2014-03-01 17:17:15','2014-03-01 17:17:15','TNGRANPER','authorized','57591660'),
  ('43117184482235343623','2014-03-01 17:18:44','2014-03-01 17:18:44','DESABIETW','authorized','57591660'),
  ('43117214357898269367','2014-03-01 17:21:43','2014-03-01 17:21:43','STOK','authorized','57591660'),
  ('43117231537061753418','2014-03-01 17:23:15','2014-03-01 17:23:15','STOCK','authorized','57591660'),
  ('46272018433479452904','2014-06-27 20:18:43','2014-06-27 20:18:43','SOLDE','authorized','59495092'),
  ('46272022984649698851','2014-06-27 20:22:09','2014-06-27 20:22:09','STOCK','authorized','59495092'),
  ('46272026145739227893','2014-06-27 20:26:14','2014-06-27 20:26:14','STOCKK','authorized','59495092'),
  ('46272032301504406447','2014-06-27 20:32:30','2014-06-27 20:32:30','STOCKK','authorized','59495092'),
  ('46272033117895786413','2014-06-27 20:33:11','2014-06-27 20:33:11','STOCKK','authorized','59495092'),
  ('46272041166018059674','2014-06-27 20:41:16','2014-06-27 20:41:17','STOCKK','authorized','59495092'),
  ('46272042691556297922','2014-06-27 20:42:06','2014-06-27 20:42:07','STOCKK','authorized','59495092'),
  ('5411629381435951260','2015-04-01 16:29:38','2015-04-01 16:29:38','1454','authorized','77257261'),
  ('54116294993167072234','2015-04-01 16:29:49','2015-04-01 16:29:49','STOCK','authorized','77257261'),
  ('5411630231243478849','2015-04-01 16:30:23','2015-04-01 16:30:23','STOCK','authorized','77257261'),
  ('54116313685535437335','2015-04-01 16:31:36','2015-04-01 16:31:36','STOCK','authorized','77257261'),
  ('54116364364304355','2015-04-01 16:36:43','2015-04-01 16:36:43','STOCK','authorized','77257261'),
  ('54116365736114192859','2015-04-01 16:36:57','2015-04-01 16:36:57','STOCK','authorized','77257261'),
  ('8310102491209787740','2018-03-10 10:02:49','2018-03-10 10:02:49','BALANCE','authorized','77257261'),
  ('83101032383113606628','2018-03-10 10:03:23','2018-03-10 10:03:23','STOCK','authorized','77257261'),
  ('8310959933890813550','2018-03-10 09:59:09',NULL,'77257261','intrusion','balance');
COMMIT;

/* Data for the `t_jour_semaine` table  (LIMIT 0,500) */

INSERT INTO `t_jour_semaine` (`lg_JOUR_SEMAINE_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('1','LUNDI','LUNDI','2017-02-07 11:12:14','2017-02-07 11:13:45','enable'),
  ('2','MARDI','MARDI','2017-02-07 11:12:23','2017-02-07 11:13:46','enable'),
  ('3','MERCREDI','MERCREDI','2017-02-07 11:12:32','2017-02-07 11:13:47','enable'),
  ('4','JEUDI','JEUDI','2017-02-07 11:12:41','2017-02-07 11:13:48','enable'),
  ('5','VENDREDI','VENDREDI','2017-02-07 11:12:53','2017-02-07 11:13:49','enable'),
  ('6','SAMEDI','SAMEDI','2017-02-07 11:13:08','2017-02-07 11:13:50','enable'),
  ('7','DIMANCHE','DIMANCHE','2017-02-07 11:13:17','2017-02-07 11:13:51','enable');
COMMIT;

/* Data for the `t_lit` table  (LIMIT 0,500) */

INSERT INTO `t_lit` (`lg_LIT_ID`, `lg_CHAMBRE_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('73222356401244631236','73222356396843052173','132','132','2017-03-22 23:56:40',NULL,'enable'),
  ('73222356402222505533','73222356397558315658','131','131','2017-03-22 23:56:40',NULL,'enable'),
  ('73222356403275408002','73222356394074860259','130','130','2017-03-22 23:56:40',NULL,'enable'),
  ('73222356405959831852','73222356398489631195','134B','134B','2017-03-22 23:56:40',NULL,'enable'),
  ('73222356409663623201','73222356399272677809','135','135','2017-03-22 23:56:40',NULL,'enable'),
  ('7324056276786681114','73240562181634824409','137','137','2017-03-24 00:56:27',NULL,'enable'),
  ('7324056281644561915','73240562196462745937','140B','140B','2017-03-24 00:56:28',NULL,'enable'),
  ('73240562829970625774','7324056226896576598','141B','141B','2017-03-24 00:56:28',NULL,'enable'),
  ('73240562837255169100','7324056221306624860','142B','142B','2017-03-24 00:56:28',NULL,'enable'),
  ('73240562842986825567','73240562219294266784','243','243','2017-03-24 00:56:28',NULL,'enable'),
  ('73240562846811082530','73240562225611079263','244','244','2017-03-24 00:56:28',NULL,'enable'),
  ('73240562851724135861','73240562230965826950','247A','247A','2017-03-24 00:56:28',NULL,'enable'),
  ('73240562855970682364','73240562236584002980','248','248','2017-03-24 00:56:28',NULL,'enable'),
  ('73240562860445366469','73240562219294266784','143','143','2017-03-24 00:56:28',NULL,'enable'),
  ('7324056286215023589','73240562187469375902','138','138','2017-03-24 00:56:28',NULL,'enable'),
  ('73240562864817885145','73240562241046951808','249','249','2017-03-24 00:56:28',NULL,'enable'),
  ('73240562869365277328','73240562244825681334','251','251','2017-03-24 00:56:28',NULL,'enable'),
  ('73240562873642614513','73240562249726333870','252','252','2017-03-24 00:56:28',NULL,'enable'),
  ('7324056287815085609','73240562253971322039','253','253','2017-03-24 00:56:28',NULL,'enable'),
  ('73240562882681708937','73240562263545046044','254','254','2017-03-24 00:56:28',NULL,'enable'),
  ('73240562887020295791','73240562271027677938','256A','256A','2017-03-24 00:56:28',NULL,'enable'),
  ('73240562891275215793','73240562277051451471','256B','256B','2017-03-24 00:56:28',NULL,'enable'),
  ('73240562896198183114','73240562281567784150','257A','257A','2017-03-24 00:56:28',NULL,'enable'),
  ('73240562911227912457','73240562292056744302','258A','258A','2017-03-24 00:56:29',NULL,'enable'),
  ('73240562924099829808','73240562297532211168','259A','259A','2017-03-24 00:56:29',NULL,'enable'),
  ('7324056292946812352','73240562286567701549','257B','257B','2017-03-24 00:56:29',NULL,'enable'),
  ('73240562931230536673','7324056231930899026','259B','259B','2017-03-24 00:56:29',NULL,'enable'),
  ('73240562936731547320','7324056237018313530','260A','260A','2017-03-24 00:56:29',NULL,'enable'),
  ('7324056294199890657','73240562311340394636','255B','255B','2017-03-24 00:56:29',NULL,'enable'),
  ('7324056294727639269','73240562316293635630','201B','201B','2017-03-24 00:56:29',NULL,'enable'),
  ('732405629523380048','73240562320131155022','202A','202A','2017-03-24 00:56:29',NULL,'enable'),
  ('732405629566561373','73240562329876709442','203A','203A','2017-03-24 00:56:29',NULL,'enable'),
  ('73240562961315396335','73240562335785785177','204A','204A','2017-03-24 00:56:29',NULL,'enable'),
  ('7324056296553186152','73240562340068173193','207','207','2017-03-24 00:56:29',NULL,'enable'),
  ('73240562969928043367','7324056234506500498','208','208','2017-03-24 00:56:29',NULL,'enable'),
  ('7324056297464035330','73240562350182081690','211','211','2017-03-24 00:56:29',NULL,'enable'),
  ('73240562978767253789','73240562355191442014','214','214','2017-03-24 00:56:29',NULL,'enable'),
  ('73240562983432486198','73240562244825681334','215','215','2017-03-24 00:56:29',NULL,'enable'),
  ('73240562987816407758','73240562361479684638','218','218','2017-03-24 00:56:29',NULL,'enable'),
  ('73240562992197755716','73240562368095704050','219','219','2017-03-24 00:56:29',NULL,'enable'),
  ('7324056299674770452','73240562374212727087','209','209','2017-03-24 00:56:29',NULL,'enable'),
  ('73240563010049467578','73240562225611079263','344','344','2017-03-24 00:56:30',NULL,'enable'),
  ('73240563014355466997','73240562392056828638','349B','349B','2017-03-24 00:56:30',NULL,'enable'),
  ('7324056301462388168','732405623797957475','210','210','2017-03-24 00:56:30',NULL,'enable'),
  ('73240563019118144758','73240562399153188744','350','350','2017-03-24 00:56:30',NULL,'enable'),
  ('7324056302298042170','73222356399272677809','351','351','2017-03-24 00:56:30',NULL,'enable'),
  ('73240563027841595858','73222356399272677809','352','352','2017-03-24 00:56:30',NULL,'enable'),
  ('73240563032475791560','73240562286567701549','357B','357B','2017-03-24 00:56:30',NULL,'enable'),
  ('7324056303804204599','73240562236584002980','348','348','2017-03-24 00:56:30',NULL,'enable'),
  ('73240563042159256032','73240562292056744302','358A','358A','2017-03-24 00:56:30',NULL,'enable'),
  ('73240563048646559989','73240562297532211168','359A','359A','2017-03-24 00:56:30',NULL,'enable'),
  ('7324056305493509347','73240562386016446749','343','343','2017-03-24 00:56:30',NULL,'enable'),
  ('73240563055337539372','7324056237018313530','360A','360A','2017-03-24 00:56:30',NULL,'enable'),
  ('73240563059963821244','7324056231930899026','359B','359B','2017-03-24 00:56:30',NULL,'enable'),
  ('73240563064287453854','7324056246746101388','361A','361A','2017-03-24 00:56:30',NULL,'enable'),
  ('73240563068467746889','7324056246746101388','362A','362A','2017-03-24 00:56:30',NULL,'enable'),
  ('73240563073868521583','73240562412696799574','302B','302B','2017-03-24 00:56:30',NULL,'enable'),
  ('73240563078455285572','73240562320131155022','303A','303A','2017-03-24 00:56:30',NULL,'enable'),
  ('73240563083831123547','73240562335785785177','304A','304A','2017-03-24 00:56:30',NULL,'enable'),
  ('73240563088288241992','73240562460378067158','305B','305B','2017-03-24 00:56:30',NULL,'enable'),
  ('73240563092996649569','73240562340068173193','307','307','2017-03-24 00:56:30',NULL,'enable'),
  ('73240563097877032506','7324056234506500498','308','308','2017-03-24 00:56:30',NULL,'enable'),
  ('73240563113879431512','73222356394074860259','310','310','2017-03-24 00:56:31',NULL,'enable'),
  ('73240563120868723517','73222356397558315658','311','311','2017-03-24 00:56:31',NULL,'enable'),
  ('73240563132970091470','73240562486765468553','314','314','2017-03-24 00:56:31',NULL,'enable'),
  ('7324056313376881954','73240562374212727087','309','309','2017-03-24 00:56:31',NULL,'enable'),
  ('7324056313887118893','73240562537251645974','315A','315A','2017-03-24 00:56:31',NULL,'enable'),
  ('73240563144510646573','73240562582055816793','305A','305A','2017-03-24 00:56:31',NULL,'enable'),
  ('73240563152384566564','73240562636818209495','316','316','2017-03-24 00:56:31',NULL,'enable'),
  ('73240563158551372495','73240562181634824409','317','317','2017-03-24 00:56:31',NULL,'enable'),
  ('73240563167848367849','73240562187469375902','318','318','2017-03-24 00:56:31',NULL,'enable'),
  ('73240563172625732393','732405626875466917','319','319','2017-03-24 00:56:31',NULL,'enable'),
  ('73240563177168428297','73222356394074860259','320','320','2017-03-24 00:56:31',NULL,'enable'),
  ('73240563191356362394','73240562714398915686','500','500','2017-03-24 00:56:31',NULL,'enable'),
  ('73240563197827706343','73222356396843052173','321','321','2017-03-24 00:56:31',NULL,'enable'),
  ('7330126913045379257','7330126898920459982','133','133','2017-03-30 13:06:09',NULL,'enable'),
  ('74417505529095773179','73240562486765468553','134','134','2017-04-04 17:50:55',NULL,'enable');
COMMIT;

/* Data for the `t_lit_occupation` table  (LIMIT 0,500) */

INSERT INTO `t_lit_occupation` (`lg_LIT_OCCUPATION_ID`, `lg_LIT_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`, `lg_CUSTOMER_ID`) VALUES
  ('73282238205494582942','73222356403275408002',NULL,NULL,'2017-03-28 22:38:20',NULL,'is_Valided','7328223819893976987'),
  ('73282238206956513555','73222356402222505533',NULL,NULL,'2017-03-28 22:38:20',NULL,'is_Valided','73282238201874001502'),
  ('73282238209835454837','73222356401244631236',NULL,NULL,'2017-03-28 22:38:20',NULL,'is_Valided','73282238203641559702'),
  ('73282239453978506792','73222356405959831852',NULL,NULL,'2017-03-28 22:39:45',NULL,'is_Valided','7328223819893976987'),
  ('7328225216211676365','73222356403275408002',NULL,NULL,'2017-03-28 22:52:16',NULL,'is_Closed','7328223819893976987'),
  ('73282252163048441298','73222356402222505533',NULL,NULL,'2017-03-28 22:52:16',NULL,'is_Closed','73282238201874001502'),
  ('73282252164554550883','73222356401244631236',NULL,NULL,'2017-03-28 22:52:16',NULL,'is_Closed','73282238203641559702'),
  ('73282252165833025697','73222356405959831852',NULL,NULL,'2017-03-28 22:52:16',NULL,'is_Closed','7328223819893976987'),
  ('73282252167418683493','73222356403275408002',NULL,NULL,'2017-03-28 22:52:16',NULL,'is_Valided','7328223819893976987'),
  ('73282252168466241998','73222356402222505533',NULL,NULL,'2017-03-28 22:52:16',NULL,'is_Valided','73282238201874001502'),
  ('73282252169397763397','73222356401244631236',NULL,NULL,'2017-03-28 22:52:16',NULL,'is_Valided','73282238203641559702'),
  ('73301213521914407349','73222356403275408002',NULL,NULL,'2017-03-30 13:01:35',NULL,'is_Closed','7328223819893976987'),
  ('73301213537796387761','73222356402222505533',NULL,NULL,'2017-03-30 13:01:35',NULL,'is_Closed','73282238201874001502'),
  ('73301213546637932600','73222356401244631236',NULL,NULL,'2017-03-30 13:01:35',NULL,'is_Closed','73282238203641559702'),
  ('73301213560621643949','73222356403275408002',NULL,NULL,'2017-03-30 13:01:35',NULL,'is_Valided','7328223819893976987'),
  ('73301213568451667161','73222356402222505533',NULL,NULL,'2017-03-30 13:01:35',NULL,'is_Valided','73282238201874001502'),
  ('733012135763988703','73222356401244631236',NULL,NULL,'2017-03-30 13:01:35',NULL,'is_Valided','73282238203641559702'),
  ('733012610159802963','7330126913045379257',NULL,NULL,'2017-03-30 13:06:10',NULL,'is_Valided','7330126922452946699'),
  ('7330126934087944168','73222356403275408002',NULL,NULL,'2017-03-30 13:06:09',NULL,'is_Closed','7328223819893976987'),
  ('7330126944945184678','73222356402222505533',NULL,NULL,'2017-03-30 13:06:09',NULL,'is_Closed','73282238201874001502'),
  ('733012695553385550','73222356401244631236',NULL,NULL,'2017-03-30 13:06:09',NULL,'is_Closed','73282238203641559702'),
  ('7330126963345374286','73222356403275408002',NULL,NULL,'2017-03-30 13:06:09',NULL,'is_Valided','7328223819893976987'),
  ('7330126985282936962','73222356402222505533',NULL,NULL,'2017-03-30 13:06:09',NULL,'is_Valided','73282238201874001502'),
  ('7330126993087495933','73222356401244631236',NULL,NULL,'2017-03-30 13:06:09',NULL,'is_Valided','73282238203641559702'),
  ('74291132779052749284','73222356403275408002',NULL,NULL,'2017-04-29 11:03:27',NULL,'is_Closed','7328223819893976987'),
  ('7429113292234798572','73222356402222505533',NULL,NULL,'2017-04-29 11:03:29',NULL,'is_Closed','73282238201874001502'),
  ('74291132998268812','73222356401244631236',NULL,NULL,'2017-04-29 11:03:29',NULL,'is_Closed','73282238203641559702'),
  ('74291133011490475617','7330126913045379257',NULL,NULL,'2017-04-29 11:03:30',NULL,'is_Closed','7441047940159143495'),
  ('74291133027986658288','74417505529095773179',NULL,NULL,'2017-04-29 11:03:30',NULL,'is_Closed','74417505547281016137'),
  ('74410444547028882961','7330126913045379257',NULL,NULL,'2017-04-04 10:44:45',NULL,'is_Closed','7330126922452946699'),
  ('74410444626440669656','73222356403275408002',NULL,NULL,'2017-04-04 10:44:46',NULL,'is_Closed','7328223819893976987'),
  ('74410444655896601252','73222356402222505533',NULL,NULL,'2017-04-04 10:44:46',NULL,'is_Closed','73282238201874001502'),
  ('7441044468493919561','73222356401244631236',NULL,NULL,'2017-04-04 10:44:46',NULL,'is_Closed','73282238203641559702'),
  ('74410471014839564698','7330126913045379257',NULL,NULL,'2017-04-04 10:47:10',NULL,'is_Valided','7441047940159143495'),
  ('7441047105314131733','73222356401244631236',NULL,NULL,'2017-04-04 10:47:10',NULL,'is_Valided','73282238203641559702'),
  ('7441047979274754208','73222356403275408002',NULL,NULL,'2017-04-04 10:47:09',NULL,'is_Valided','7328223819893976987'),
  ('7441047988354683381','73222356402222505533',NULL,NULL,'2017-04-04 10:47:09',NULL,'is_Valided','73282238201874001502'),
  ('74417505581423029553','73222356401244631236',NULL,NULL,'2017-04-04 17:50:55',NULL,'is_Closed','73282238203641559702'),
  ('74417505623533063542','73222356403275408002',NULL,NULL,'2017-04-04 17:50:56',NULL,'is_Closed','7328223819893976987'),
  ('74417505634494501388','73222356402222505533',NULL,NULL,'2017-04-04 17:50:56',NULL,'is_Closed','73282238201874001502'),
  ('74417505650733775046','73222356403275408002',NULL,NULL,'2017-04-04 17:50:56',NULL,'is_Valided','7328223819893976987'),
  ('74417505663762263477','73222356402222505533',NULL,NULL,'2017-04-04 17:50:56',NULL,'is_Valided','73282238201874001502'),
  ('744175056741861187','7330126913045379257',NULL,NULL,'2017-04-04 17:50:56',NULL,'is_Closed','7441047940159143495'),
  ('74417505676966832719','73222356401244631236',NULL,NULL,'2017-04-04 17:50:56',NULL,'is_Valided','73282238203641559702'),
  ('74417505688997213127','7330126913045379257',NULL,NULL,'2017-04-04 17:50:56',NULL,'is_Valided','7441047940159143495'),
  ('7441750574748412462','74417505529095773179',NULL,NULL,'2017-04-04 17:50:57',NULL,'is_Valided','74417505547281016137');
COMMIT;

/* Data for the `t_module` table  (LIMIT 0,500) */

INSERT INTO `t_module` (`lg_MODULE_ID`, `str_VALUE`, `str_DESCRIPTION`, `int_PRIORITY`, `str_Status`, `P_KEY`, `str_Link`, `str_Icone`, `str_Icone_hover`, `str_Icone_out`, `str_Link_default`) VALUES
  ('1','Administration','Administration',0,'enable','P_MOD_ADMINISTRATION',NULL,NULL,NULL,NULL,NULL);
COMMIT;

/* Data for the `t_menu` table  (LIMIT 0,500) */

INSERT INTO `t_menu` (`lg_MENU_ID`, `str_VALUE`, `str_DESCRIPTION`, `int_PRIORITY`, `str_Status`, `P_KEY`, `lg_MODULE_ID`) VALUES
  ('1','Utilisateurs','Utilisateurs',0,'enable','P_M_GESTION_UTILISATEUR','1'),
  ('2','La carte','La carte',1,'enable','P_M_GESTION_TEST','1'),
  ('3','Gestion Report','Gestion Report',2,'enable','P_M_GESTION_REPORT','1'),
  ('4','Les Clients','Les Clients',3,'enable','P_M_GESTION_CLIENT','1'),
  ('5','Configuration','Configuration',4,'enable','P_M_CONFIGURATION','1'),
  ('6','Commande','Commande',5,'enable','P_M_FACTURATION','1'),
  ('62261745414789249809','Licence','Licence',3,'enable','P_M_SONDAGE','1'),
  ('7','Caisse','Caisse',6,'enable','P_M_CAISSE','1'),
  ('728921142488452605','Tableau de Bord','Tableau de Bord',1,'enable','P_M_GESTION_ADMISSION','1'),
  ('8','Gestion Stock','Gestion Stock',7,'enable','P_M_GESTION_STOCK','1'),
  ('9','Conformite','Conformite',8,'enable','P_M_CARTE_INTERACTIVE','1');
COMMIT;

/* Data for the `t_menu_repas` table  (LIMIT 0,500) */

INSERT INTO `t_menu_repas` (`lg_MENU_REPAS_ID`, `lg_JOUR_SEMAINE_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`, `int_AMOUNT`, `str_PIC_ORIGINALE`, `str_PIC_SMALL`, `str_PIC_MIDDLE`, `str_PIC_BIG`) VALUES
  ('7227146491279303532','7','MENU DIMANCHE','MENU DIMANCHE','2017-02-27 14:06:49','2018-03-24 14:13:13','enable',50000,'7227146491279303532_8324141313243891362.jpg','Small_7227146491279303532_8324141313243891362.jpg',NULL,'Big_7227146491279303532_8324141313243891362.jpg'),
  ('72711552556951149617','1','MENU LUNDI','MENU LUNDI','2017-02-07 11:55:25','2018-03-24 13:55:23','enable',45000,'72711552556951149617_83241355233107613928.jpg','Small_72711552556951149617_83241355233107613928.jpg',NULL,'Big_72711552556951149617_83241355233107613928.jpg'),
  ('72711554177021273349','2','MENU DU MARDI','MENU DU MARDI','2017-02-07 11:55:41','2018-03-24 13:55:37','enable',85000,'72711554177021273349_83241355364475140863.jpg','Small_72711554177021273349_83241355364475140863.jpg',NULL,'Big_72711554177021273349_83241355364475140863.jpg'),
  ('72711560428322392','3','MENU DU MERCREDI','MENU DU MERCREDI','2017-02-07 11:56:00','2018-03-24 13:55:51','enable',0,'72711560428322392_83241355494088819364.jpg','Small_72711560428322392_83241355494088819364.jpg',NULL,'Big_72711560428322392_83241355494088819364.jpg'),
  ('7271156137703129574','4','MENU DU JEUDI','MENU DU JEUDI','2017-02-07 11:56:13','2018-03-24 14:12:35','enable',0,'7271156137703129574_83241412337241771114.jpg','Small_7271156137703129574_83241412337241771114.jpg',NULL,'Big_7271156137703129574_83241412337241771114.jpg'),
  ('72713331170877536','5','MENU DU VENDREDI','MENU DU VENDREDI','2017-02-07 13:33:11','2018-03-24 14:12:51','enable',0,'72713331170877536_83241412518398968989.JPG','Small_72713331170877536_83241412518398968989.JPG',NULL,'Big_72713331170877536_83241412518398968989.JPG'),
  ('SYS','6','MENU DE BASE','MENU DU SAMEDI','2017-02-07 17:25:19','2018-03-25 06:07:11','default',0,'72717251963521823475_83241412222549846114.jpg','Small_72717251963521823475_83241412222549846114.jpg',NULL,'Big_72717251963521823475_83241412222549846114.jpg');
COMMIT;

/* Data for the `t_product_item` table  (LIMIT 0,500) */

INSERT INTO `t_product_item` (`lg_PRODUCT_ITEM_ID`, `str_NAME`, `str_DESCRIPTION`, `int_PRICE`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`, `int_STOCK_MINIMAL`, `str_PIC_ORIGINALE`, `str_PIC_SMALL`, `str_PIC_MIDDLE`, `str_PIC_BIG`, `b_IS_COMMENTAIRE`, `b_IS_COMPILATION`, `b_IS_FOR_SALE`, `b_IS_IN_CA`, `b_IS_PROGRAMMABLE_PRICE`, `b_IS_REMISED`, `lg_FAMILLE_ID`, `int_PRIX_ACHAT`) VALUES
  ('67101712195787344322','Jus de fruits','Jus de fruits',1000,NULL,NULL,'enable',0,'67101712195787344322_83241523348945375367.jpg','Small_67101712195787344322_83241523348945375367.jpg','','Big_67101712195787344322_83241523348945375367.jpg',1,1,1,1,1,1,'74251437513799994453',1000),
  ('67101716496016399596','Quaker','Quaker',1250,NULL,NULL,'enable',0,'67101716496016399596_73301149362725648822.jpg','Small_67101716496016399596_73301149362725648822.jpg','','Big_67101716496016399596_73301149362725648822.jpg',1,1,1,1,1,1,'74251449179381328154',1250),
  ('67101716924942215333','Bouillie de riz','Bouillie de riz',800,NULL,NULL,'enable',0,'67101716924942215333_7330115018143556934.jpg','Small_67101716924942215333_7330115018143556934.jpg','','Big_67101716924942215333_7330115018143556934.jpg',1,1,1,1,1,1,'74251449179381328154',800),
  ('67101718095018457516','Creme de riz','Creme de riz',650,NULL,NULL,'enable',0,'67101718095018457516_73301150192043807913.JPG','Small_67101718095018457516_73301150192043807913.JPG','','Big_67101718095018457516_73301150192043807913.JPG',1,1,1,1,1,1,'74251449179381328154',650),
  ('67101718304891358239','Croissant','Croissant',1200,NULL,NULL,'enable',0,'67101718304891358239_73301150425959810839.jpg','Small_67101718304891358239_73301150425959810839.jpg','','Big_67101718304891358239_73301150425959810839.jpg',1,1,1,1,1,1,'74251438398918098422',1200),
  ('67101719398774099106','Beurre','Beurre',0,NULL,NULL,'enable',0,'67101719398774099106_73301150598692086153.jpg','Small_67101719398774099106_73301150598692086153.jpg','','Big_67101719398774099106_73301150598692086153.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('67101726546457588560','Confiture','Confiture',0,NULL,NULL,'enable',0,'67101726546457588560_7330115112948604903.jpg','Small_67101726546457588560_7330115112948604903.jpg','','Big_67101726546457588560_7330115112948604903.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('67101727411547599522','Thé','Thé',0,NULL,NULL,'enable',0,'67101727411547599522_73301151273697372580.jpg','Small_67101727411547599522_73301151273697372580.jpg','','Big_67101727411547599522_73301151273697372580.jpg',1,1,1,1,1,1,'67101710431359398307',0),
  ('67101728199597924756','Thé-lait','Thé-lait',0,NULL,NULL,'enable',0,'67101728199597924756_73301151428688885496.jpg','Small_67101728199597924756_73301151428688885496.jpg','','Big_67101728199597924756_73301151428688885496.jpg',1,1,1,1,1,1,'67101710431359398307',15000),
  ('67101728454512713952','Café','Café',0,NULL,NULL,'enable',0,'67101728454512713952_73301152264429306728.jpg','Small_67101728454512713952_73301152264429306728.jpg','','Big_67101728454512713952_73301152264429306728.jpg',1,1,1,1,1,1,'67101710431359398307',0),
  ('67101729306058284265','Café-lait','Café-lait',0,NULL,NULL,'enable',0,'67101729306058284265_73301152424102226841.jpg','Small_67101729306058284265_73301152424102226841.jpg','','Big_67101729306058284265_73301152424102226841.jpg',1,1,1,1,1,1,'67101710431359398307',0),
  ('67101730267233137689','Chocolat','Chocolat',0,NULL,NULL,'enable',0,'67101730267233137689_73301152563716980551.jpg','Small_67101730267233137689_73301152563716980551.jpg','','Big_67101730267233137689_73301152563716980551.jpg',1,1,1,1,1,1,'67101710431359398307',0),
  ('67101730327784114189','Chocolat au lait','Chocolat au lait',0,NULL,NULL,'enable',0,'67101730327784114189_73301153924580084667.jpg','Small_67101730327784114189_73301153924580084667.jpg','','Big_67101730327784114189_73301153924580084667.jpg',1,1,1,1,1,1,'67101710431359398307',0),
  ('67101731315097443083','Lait chaud','Lait chaud',0,NULL,NULL,'enable',0,'67101731315097443083_73301153241621285208.jpg','Small_67101731315097443083_73301153241621285208.jpg','','Big_67101731315097443083_73301153241621285208.jpg',1,1,1,1,1,1,'67101710431359398307',0),
  ('67101731391388359505','Lait froid','Lait froid',0,NULL,NULL,'enable',0,'67101731391388359505_7330115338161730028.jpg','Small_67101731391388359505_7330115338161730028.jpg','','Big_67101731391388359505_7330115338161730028.jpg',1,1,1,1,1,1,'74251437513799994453',0),
  ('67101731535239117878','Boeuf aux légumes ','Boeuf aux légumes ',0,NULL,NULL,'enable',0,'67101731535239117878_73301153579915266136.jpg','Small_67101731535239117878_73301153579915266136.jpg','','Big_67101731535239117878_73301153579915266136.jpg',1,1,1,1,1,1,'74251438398918098422',0),
  ('67101732241137974871','Couscous','Couscous',0,NULL,NULL,'enable',0,'67101732241137974871_73301154135573387472.jpg','Small_67101732241137974871_73301154135573387472.jpg','','Big_67101732241137974871_73301154135573387472.jpg',1,1,1,1,1,1,'74251438398918098422',0),
  ('67101732465603861337','Tarte aux pommes ','Tarte aux pommes ',0,NULL,NULL,'enable',0,'67101732465603861337_73301154327168359881.jpg','Small_67101732465603861337_73301154327168359881.jpg','','Big_67101732465603861337_73301154327168359881.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('67101734499725803587','Fruit','Fruit',0,NULL,NULL,'enable',0,'67101734499725803587_73301154498647019343.jpg','Small_67101734499725803587_73301154498647019343.jpg','','Big_67101734499725803587_73301154498647019343.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('67101736369346481343','Citronnelle','Citronnelle',0,NULL,NULL,'enable',0,'67101736369346481343_7330115532536763939.jpg','Small_67101736369346481343_7330115532536763939.jpg','','Big_67101736369346481343_7330115532536763939.jpg',1,1,1,1,1,1,'67101710431359398307',0),
  ('67101737264269496538','Citronnelle','Citronnelle',0,NULL,NULL,'enable',0,'67101737264269496538_73301217399533847415.jpg','Small_67101737264269496538_73301217399533847415.jpg','','Big_67101737264269496538_73301217399533847415.jpg',1,1,1,1,1,1,'67101710431359398307',8000),
  ('67101738246840906525','Salade verte','Salade verte',0,NULL,NULL,'enable',0,'67101738246840906525_73301229461554082941.jpg','Small_67101738246840906525_73301229461554082941.jpg','','Big_67101738246840906525_73301229461554082941.jpg',1,1,1,1,1,1,'74251438398918098422',0),
  ('67101738338564425773','Poisson à la camerounaise','Poisson à la camerounaise',1000,NULL,NULL,'enable',0,'67101738338564425773_73301230112662463684.jpg','Small_67101738338564425773_73301230112662463684.jpg','','Big_67101738338564425773_73301230112662463684.jpg',1,1,1,1,1,1,'67101710292401617645',1000),
  ('67101739555877705909','Pomme boulangère','Pomme boulangère',0,NULL,NULL,'enable',0,'67101739555877705909_73301230307687416822.jpg','Small_67101739555877705909_73301230307687416822.jpg','','Big_67101739555877705909_73301230307687416822.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('67101740267499189768','Crème caramel','Crème caramel',0,NULL,NULL,'enable',0,'67101740267499189768_73301231151477951066.jpg','Small_67101740267499189768_73301231151477951066.jpg','','Big_67101740267499189768_73301231151477951066.jpg',1,1,1,1,1,1,'67101710623778928834',0),
  ('67101741056812641775','Salade de concombres','Salade de concombres',0,NULL,NULL,'enable',0,'67101741056812641775_73301231181238124599.jpg','Small_67101741056812641775_73301231181238124599.jpg','','Big_67101741056812641775_73301231181238124599.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('67101741309743937547','Poulet roti','Poulet roti',0,NULL,NULL,'enable',0,'67101741309743937547_73301231416755811466.jpg','Small_67101741309743937547_73301231416755811466.jpg','','Big_67101741309743937547_73301231416755811466.jpg',1,1,1,1,1,1,'67101710346618656226',0),
  ('67101742177516583256','Eclair à la vanille','Eclair à la vanille',0,NULL,NULL,'enable',0,'67101742177516583256_73301232367335977583.jpg','Small_67101742177516583256_73301232367335977583.jpg','','Big_67101742177516583256_73301232367335977583.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('67101742528323610695','Salade d''avocats','Salade d''avocats',0,NULL,NULL,'enable',0,'67101742528323610695_73301232295932214922.jpg','Small_67101742528323610695_73301232295932214922.jpg','','Big_67101742528323610695_73301232295932214922.jpg',1,1,1,1,1,1,'67101710431359398307',500),
  ('67101743202138401531','Mousse au chocolat','Mousse au chocolat',0,NULL,NULL,'enable',0,'67101743202138401531_73301233368954865147.JPG','Small_67101743202138401531_73301233368954865147.JPG','','Big_67101743202138401531_73301233368954865147.JPG',1,1,1,1,1,1,'67101710431359398307',0),
  ('67101743494508201693','Pizza','Pizza',0,NULL,NULL,'enable',0,'67101743494508201693_73301233555447966785.jpeg','Small_67101743494508201693_73301233555447966785.jpeg','','Big_67101743494508201693_73301233555447966785.jpeg',1,1,1,1,1,1,'67101710431359398307',500),
  ('67101744146024059996','Darne de poisson grillé','Darne de poisson grillé',0,NULL,NULL,'enable',0,'67101744146024059996_73301234142583294802.jpg','Small_67101744146024059996_73301234142583294802.jpg','','Big_67101744146024059996_73301234142583294802.jpg',1,1,1,1,1,1,'67101710431359398307',500),
  ('67101744425645068807','Abolo','Abolo',0,NULL,NULL,'enable',0,'67101744425645068807_83249401677245798691.jpg','Small_67101744425645068807_83249401677245798691.jpg','','Big_67101744425645068807_83249401677245798691.jpg',1,1,1,1,1,1,'67101710431359398307',0),
  ('67101745457702837786','Jardinière de légumes','Jardinière de légumes',0,NULL,NULL,'enable',0,'67101745457702837786_73301235040050289062.jpg','Small_67101745457702837786_73301235040050289062.jpg','','Big_67101745457702837786_73301235040050289062.jpg',1,1,1,1,1,1,'67101710431359398307',0),
  ('67101745666588479350','Bande de fruits','Bande de fruits',0,NULL,NULL,'enable',0,'67101745666588479350_73301235442058997990.jpg','Small_67101745666588479350_73301235442058997990.jpg','','Big_67101745666588479350_73301235442058997990.jpg',1,1,1,1,1,1,'67101710431359398307',0),
  ('67101746116819109649','CELEST','CELEST',0,NULL,NULL,'delete',0,'67101746116819109649_73301236368242091327.jpg','Small_67101746116819109649_73301236368242091327.jpg','','Big_67101746116819109649_73301236368242091327.jpg',1,1,1,1,1,1,'2',0),
  ('67101747348925031817','CODYS ENERGIE','CODYS ENERGIE',0,NULL,NULL,'delete',0,'67101747348925031817_73301236207987173535.jpg','Small_67101747348925031817_73301236207987173535.jpg','','Big_67101747348925031817_73301236207987173535.jpg',1,1,1,1,1,1,'2',500),
  ('67101747385094104540','SOLE 1','SOLE 1',0,NULL,NULL,'delete',0,'67101747385094104540_73301236477957139931.jpg','Small_67101747385094104540_73301236477957139931.jpg','','Big_67101747385094104540_73301236477957139931.jpg',1,1,1,1,1,1,'67101710292401617645',0),
  ('67101748543718945134','SOLE 2','SOLE 2',0,NULL,NULL,'delete',0,'67101748543718945134_73301237622654086057.jpg','Small_67101748543718945134_73301237622654086057.jpg','','Big_67101748543718945134_73301237622654086057.jpg',1,1,1,1,1,1,'67101710292401617645',0),
  ('67101749406008858624','SOLE 3','SOLE 3',0,NULL,NULL,'delete',0,'67101749406008858624_73301237236582761129.jpg','Small_67101749406008858624_73301237236582761129.jpg','','Big_67101749406008858624_73301237236582761129.jpg',1,1,1,1,1,1,'67101710292401617645',0),
  ('67101750255452881681','SOLE 4','SOLE 4',0,NULL,NULL,'delete',0,'67101750255452881681_73301253516365861422.jpg','Small_67101750255452881681_73301253516365861422.jpg','','Big_67101750255452881681_73301253516365861422.jpg',1,1,1,1,1,1,'67101710292401617645',0),
  ('67101751199303412326','Riz aux olives','Riz aux olives',2500,NULL,NULL,'enable',0,'67101751199303412326_83261330188315107254.jpg','Small_67101751199303412326_83261330188315107254.jpg','','Big_67101751199303412326_83261330188315107254.jpg',1,1,1,1,1,1,'67101710292401617645',2500),
  ('67101752499793272918','SEX AND THE BEACH','SEX AND THE BEACH',0,NULL,NULL,'delete',0,'','','','',1,1,1,1,1,1,'2',0),
  ('67101854511005161444','ATTIEKE','ATTIEKE',0,NULL,NULL,'enable',0,'67101854511005161444_73301254383612487866.jpg','Small_67101854511005161444_73301254383612487866.jpg','','Big_67101854511005161444_73301254383612487866.jpg',1,1,1,1,1,1,'74251438398918098422',0),
  ('72271137494757520408','Flan parisienne','Flan parisienne',0,NULL,NULL,'enable',5,'72271137494757520408_73301255566778682489.jpg','Small_72271137494757520408_73301255566778682489.jpg','','Big_72271137494757520408_73301255566778682489.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('72271143215539528702','Niz de caille','Niz de caille',0,NULL,NULL,'enable',4,'72271143215539528702_73301255598868854811.jpeg','Small_72271143215539528702_73301255598868854811.jpeg','','Big_72271143215539528702_73301255598868854811.jpeg',1,1,1,1,1,1,'67101795452328228533',0),
  ('72271143596946105613','Mouton aux oignons','Mouton aux oignons',0,NULL,NULL,'enable',6,'72271143596946105613_73301256262341092662.jpg','Small_72271143596946105613_73301256262341092662.jpg','','Big_72271143596946105613_73301256262341092662.jpg',1,1,1,1,1,1,'67101710346618656226',0),
  ('72271144342137234719','Riz au cury','Riz au cury',0,NULL,NULL,'enable',8,'','','','',1,1,1,1,1,1,'74251438398918098422',0),
  ('72271145819561033459','Lentilles','Lentilles',0,NULL,NULL,'enable',2,'72271145819561033459_73301256426282105540.jpg','Small_72271145819561033459_73301256426282105540.jpg','','Big_72271145819561033459_73301256426282105540.jpg',1,1,1,1,1,1,'74251438398918098422',0),
  ('7227114722439003502','Tarte au citron','Tarte au citron',0,NULL,NULL,'enable',7,'7227114722439003502_7330125722974608032.jpg','Small_7227114722439003502_7330125722974608032.jpg','','Big_7227114722439003502_7330125722974608032.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('72271147499504974334','Salade de tomate','Salade de tomate',0,NULL,NULL,'enable',8,'72271147499504974334_73301257197576845272.jpg','Small_72271147499504974334_73301257197576845272.jpg','','Big_72271147499504974334_73301257197576845272.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('72271149593139289174','Poisson au four','Poisson au four',3500,NULL,NULL,'enable',7,'72271149593139289174_83261331353821276830.jpg','Small_72271149593139289174_83261331353821276830.jpg','','Big_72271149593139289174_83261331353821276830.jpg',1,1,1,1,1,1,'67101710292401617645',3500),
  ('72271150973358506676','Farandole de légumes','Farandole de légumes',0,NULL,NULL,'enable',8,'72271150973358506676_73301258288676764948.jpg','Small_72271150973358506676_73301258288676764948.jpg','','Big_72271150973358506676_73301258288676764948.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('72271151206323695554','Carotte rapée','Carotte rapée',0,NULL,NULL,'enable',7,'72271151206323695554_73301258188184735428.jpg','Small_72271151206323695554_73301258188184735428.jpg','','Big_72271151206323695554_73301258188184735428.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('72271151573885165136','Pintade sautée','Pintade sautée',0,NULL,NULL,'enable',8,'72271151573885165136_73301258389294918824.JPG','Small_72271151573885165136_73301258389294918824.JPG','','Big_72271151573885165136_73301258389294918824.JPG',1,1,1,1,1,1,'67101710346618656226',0),
  ('72271152335162427134','Pomme lyonnaise','Pomme lyonnaise',0,NULL,NULL,'enable',5,'72271152335162427134_73301259375894804685.jpg','Small_72271152335162427134_73301259375894804685.jpg','','Big_72271152335162427134_73301259375894804685.jpg',1,1,1,1,1,1,'74251438398918098422',0),
  ('7227115312343619916','Haricots verts','Haricots verts',0,NULL,NULL,'enable',10,'7227115312343619916_73301259226651404925.jpg','Small_7227115312343619916_73301259226651404925.jpg','','Big_7227115312343619916_73301259226651404925.jpg',1,1,1,1,1,1,'74251438398918098422',0),
  ('72271153574323653749','Gâteau opera','Gâteau opera',0,NULL,NULL,'enable',20,'72271153574323653749_73301259571339475187.jpg','Small_72271153574323653749_73301259571339475187.jpg','','Big_72271153574323653749_73301259571339475187.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('72271154426803146991','Lasagne','Lasagne',0,NULL,NULL,'enable',10,'72271154426803146991_73301301873884846062.jpg','Small_72271154426803146991_73301301873884846062.jpg','','Big_72271154426803146991_73301301873884846062.jpg',1,1,1,1,1,1,'67101710431359398307',6000),
  ('72271155393924813157','Bavaroise aux fruits','Bavaroise aux fruits',0,NULL,NULL,'enable',20,'72271155393924813157_73301303391963726109.jpg','Small_72271155393924813157_73301303391963726109.jpg','','Big_72271155393924813157_73301303391963726109.jpg',1,1,1,1,1,1,'67101710431359398307',3000),
  ('7227115728467691657','Salade nicoise','Salade nicoise',0,NULL,NULL,'enable',11,'7227115728467691657_73301371767742374675.jpg','Small_7227115728467691657_73301371767742374675.jpg','','Big_7227115728467691657_73301371767742374675.jpg',1,1,1,1,1,1,'67101710431359398307',5000),
  ('7227115893928960854','Salade de fruits exotiques','Salade de fruits exotiques',0,NULL,NULL,'enable',5,'7227115893928960854_73301375826680918856.jpg','Small_7227115893928960854_73301375826680918856.jpg','','Big_7227115893928960854_73301375826680918856.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('72271159102274000597','Poisson piperade','Poisson piperade',2500,NULL,NULL,'enable',4,'72271159102274000597_73301382844345735701.JPG','Small_72271159102274000597_73301382844345735701.JPG','','Big_72271159102274000597_73301382844345735701.JPG',1,1,1,1,1,1,'67101710292401617645',2500),
  ('72271349285331556419','Riz aux vermicelles','Riz aux vermicelles',0,NULL,NULL,'enable',45,'72271349285331556419_7330138553380948292.jpg','Small_72271349285331556419_7330138553380948292.jpg','','Big_72271349285331556419_7330138553380948292.jpg',1,1,1,1,1,1,'74251438398918098422',0),
  ('72271350172828301177','Hamberger','Hamberger',0,NULL,NULL,'enable',50,'72271350172828301177_73301250384166091970.jpg','Small_72271350172828301177_73301250384166091970.jpg','','Big_72271350172828301177_73301250384166091970.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('7227135150909071806','Jardinière de légumes','Jardinière de légumes',0,NULL,NULL,'enable',20,'7227135150909071806_7330139204459349314.jpg','Small_7227135150909071806_7330139204459349314.jpg','','Big_7227135150909071806_7330139204459349314.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('72271352587584784535','Mille feuilles','Mille feuilles',0,NULL,NULL,'enable',10,'72271352587584784535_73301394087088948163.jpg','Small_72271352587584784535_73301394087088948163.jpg','','Big_72271352587584784535_73301394087088948163.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('72710432974244876243','Lapin chasseur','Lapin chasseur',0,NULL,NULL,'enable',0,'72710432974244876243_73301395775356718866.jpg','Small_72710432974244876243_73301395775356718866.jpg','','Big_72710432974244876243_73301395775356718866.jpg',1,1,1,1,1,1,'67101710346618656226',0),
  ('7271045393082157826','Tagliatelle','Tagliatelle',0,NULL,NULL,'enable',0,'7271045393082157826_73301310166254068221.jpg','Small_7271045393082157826_73301310166254068221.jpg','','Big_7271045393082157826_73301310166254068221.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('7271541291860547103','KEDJENOU','KEDJENOU',0,NULL,NULL,'enable',0,'7271541291860547103_73301310417365966572.jpg','Small_7271541291860547103_73301310417365966572.jpg','','Big_7271541291860547103_73301310417365966572.jpg',1,1,1,1,1,1,'67101710346618656226',0),
  ('72715492898447911943','SALADE A L''AVOCAT','SALADE A L''AVOCAT',0,NULL,NULL,'enable',0,'72715492898447911943_73301250501606941865.jpg','Small_72715492898447911943_73301250501606941865.jpg','','Big_72715492898447911943_73301250501606941865.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('727163455841524239','Salade verte','Salade verte',0,NULL,NULL,'enable',500,'727163455841524239_73301250248033859524.jpg','Small_727163455841524239_73301250248033859524.jpg','','Big_727163455841524239_73301250248033859524.jpg',1,1,1,1,1,1,'67101795452328228533',0),
  ('83221628332273619309','Ndolai','Ndolai',15000,NULL,NULL,'enable',0,'83221628332273619309_83221635214505590715.jpg','Small_83221628332273619309_83221635214505590715.jpg','','Big_83221628332273619309_83221635214505590715.jpg',1,1,1,1,1,1,'74251438398918098422',15000),
  ('8324127229991141454','Jack Daniels','Jack Daniels',15000,NULL,NULL,'delete',0,'8324127229991141454_83241523144217825702.jpg','Small_8324127229991141454_83241523144217825702.jpg','','Big_8324127229991141454_83241523144217825702.jpg',1,1,1,1,1,1,'1',15000);
COMMIT;

/* Data for the `t_menu_repas_product_item` table  (LIMIT 0,500) */

INSERT INTO `t_menu_repas_product_item` (`lg_MENU_REPAS_PRODUCT_ITEM_ID`, `lg_MENU_REPAS_ID`, `lg_PRODUCT_ITEM_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('83240385561095364467','7227146491279303532','67101744425645068807','X_PETIT_DEJEUNER',NULL,'2018-03-24 00:38:55',NULL,'enable'),
  ('83240385978743801484','7227146491279303532','67101745666588479350','X_DINER',NULL,'2018-03-24 00:38:59',NULL,'enable'),
  ('8324039167399861637','7227146491279303532','67101854511005161444','X_DEJEUNER',NULL,'2018-03-24 00:39:16',NULL,'enable'),
  ('8324039351624693033','7227146491279303532','67101745666588479350','X_PETIT_DEJEUNER',NULL,'2018-03-24 00:39:35',NULL,'enable'),
  ('8324039364479847234','7227146491279303532','72271155393924813157','X_PETIT_DEJEUNER',NULL,'2018-03-24 00:39:36',NULL,'enable'),
  ('83240393744889791010','7227146491279303532','67101745666588479350','X_DEJEUNER',NULL,'2018-03-24 00:39:37',NULL,'enable'),
  ('83240394072185479174','7227146491279303532','67101736369346481343','X_DINER',NULL,'2018-03-24 00:39:40',NULL,'enable'),
  ('83240394160156462704','7227146491279303532','67101737264269496538','X_DINER',NULL,'2018-03-24 00:39:41',NULL,'enable');
COMMIT;

/* Data for the `t_message` table  (LIMIT 0,500) */

INSERT INTO `t_message` (`lg_MESSAGE_ID`, `str_MESSAGE`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('564564213561456446446','BIENVENUE AU RESTAURANT ENTRACTE.','2016-06-24 17:40:00',NULL,'enable'),
  ('66241823344698043245','Test de creation de message','2016-06-24 18:23:34','2016-06-24 18:25:53','enable');
COMMIT;

/* Data for the `t_notification` table  (LIMIT 0,500) */

INSERT INTO `t_notification` (`lg_ID`, `lg_USER_ID_IN`, `lg_USER_ID_OUT`, `str_DESCRIPTION`, `str_CONTENT`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`, `str_TYPE`, `str_REF_RESSOURCE`, `str_CUST_ACCOUNT_ID`, `str_URL_PIC`, `str_NAME`, `str_CHANNEL`, `str_CHANNEL_READ`, `str_GPS`) VALUES
  ('1','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Jus de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 14:39:01',NULL,'Read','N_NEW_ORDER','72261438599572104000','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('72261439144948763871','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 14:39:01',NULL,'Read','N_NEW_ORDER','72261438599572104000',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261439172616997571','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 14:39:01',NULL,'Read','N_NEW_ORDER','72261438599572104000',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226143922878103419','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 14:39:02',NULL,'Read','N_NEW_ORDER','72261438599572104000',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261439245964747909','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 14:39:02',NULL,'Read','N_NEW_ORDER','72261438599572104000',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261441427206241570','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Jus de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 14:41:42',NULL,'Read','N_NEW_ORDER','72261441423989401436',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261441428442805587','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 14:41:42',NULL,'Read','N_NEW_ORDER','72261441423989401436',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261441432307356885','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 14:41:43',NULL,'Read','N_NEW_ORDER','72261441423989401436',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261441433523727559','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 14:41:43',NULL,'Read','N_NEW_ORDER','72261441423989401436',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261441437667704931','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 14:41:43',NULL,'Read','N_NEW_ORDER','72261441423989401436',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261448292387685820','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Jus de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 14:48:29',NULL,'Read','N_NEW_ORDER','72261448287725723915',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261448293521440263','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 14:48:29',NULL,'Read','N_NEW_ORDER','72261448287725723915',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261448294682496492','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 14:48:29',NULL,'Read','N_NEW_ORDER','72261448287725723915',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261448296146182621','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 14:48:29',NULL,'Read','N_NEW_ORDER','72261448287725723915',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261448297265962667','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 14:48:29',NULL,'Read','N_NEW_ORDER','72261448287725723915',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261450459791136694','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Jus de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 14:50:45',NULL,'Read','N_NEW_ORDER','72261450454299951472',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261450461315590978','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 14:50:46',NULL,'Read','N_NEW_ORDER','72261450454299951472',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261450462546509169','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 14:50:46',NULL,'Read','N_NEW_ORDER','72261450454299951472',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261450464179312563','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 14:50:46',NULL,'Read','N_NEW_ORDER','72261450454299951472',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261450465242996475','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 14:50:46',NULL,'Read','N_NEW_ORDER','72261450454299951472',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261521041930595296','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Jus de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 15:02:10',NULL,'Read','N_NEW_ORDER','722615210978444800',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261521052379673013','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 15:02:10',NULL,'Read','N_NEW_ORDER','722615210978444800',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226152106614312822','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 15:02:10',NULL,'Read','N_NEW_ORDER','722615210978444800',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261521077747763115','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 15:02:10',NULL,'Read','N_NEW_ORDER','722615210978444800',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261521091141643689','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 15:02:10',NULL,'Read','N_NEW_ORDER','722615210978444800',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261525983645339002','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Thé-lait (1) ;Beurre (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 15:02:59',NULL,'Read','N_NEW_ORDER','72261525917263571825',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226152599887854818','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Thé-lait (1) ;Beurre (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 15:02:59',NULL,'Read','N_NEW_ORDER','72261525917263571825',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226153011793571960','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Thé-lait (1) ;Beurre (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 15:03:00',NULL,'Read','N_NEW_ORDER','72261525917263571825',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226153023010725056','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Thé-lait (1) ;Beurre (1)  <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 15:03:00',NULL,'Read','N_NEW_ORDER','72261525917263571825',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226153033549469835','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Thé-lait (1) ;Beurre (1)  <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 15:03:00',NULL,'Read','N_NEW_ORDER','72261525917263571825',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261624202078151838','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 16:24:20',NULL,'Read','N_NEW_ORDER','72261624192577273684',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261624204422186128','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 16:24:20',NULL,'Read','N_NEW_ORDER','72261624192577273684',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261624205502145677','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 16:24:20',NULL,'Read','N_NEW_ORDER','72261624192577273684',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261624207492512756','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 16:24:20',NULL,'Read','N_NEW_ORDER','72261624192577273684',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261624209167525794','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 16:24:20',NULL,'Read','N_NEW_ORDER','72261624192577273684',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261627115352311570','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 16:27:11',NULL,'Read','N_NEW_ORDER','72261627109144641390',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261627118064745908','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 16:27:11',NULL,'Read','N_NEW_ORDER','72261627109144641390',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261627119983815960','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 16:27:11',NULL,'Read','N_NEW_ORDER','72261627109144641390',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261627121991461472','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 16:27:12',NULL,'Read','N_NEW_ORDER','72261627109144641390',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261627123832646664','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 16:27:12',NULL,'Read','N_NEW_ORDER','72261627109144641390',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261634495673098687','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 16:34:49',NULL,'Read','N_NEW_ORDER','72261634492327329217',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261634497411057935','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 16:34:49',NULL,'Read','N_NEW_ORDER','72261634492327329217',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261634499012855903','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 16:34:49',NULL,'Read','N_NEW_ORDER','72261634492327329217',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261634502222524638','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 16:34:50',NULL,'Read','N_NEW_ORDER','72261634492327329217',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261634508473719177','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 16:34:50',NULL,'Read','N_NEW_ORDER','72261634492327329217',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261637101918146189','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 16:37:10',NULL,'Read','N_NEW_ORDER','72261637923072927279',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261637102332411903','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 16:37:10',NULL,'Read','N_NEW_ORDER','72261637923072927279',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261637103116558560','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 16:37:10',NULL,'Read','N_NEW_ORDER','72261637923072927279',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261637956649439735','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 16:37:09',NULL,'Read','N_NEW_ORDER','72261637923072927279',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261637981252545640','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 16:37:09',NULL,'Read','N_NEW_ORDER','72261637923072927279',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261642414377599234','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 16:42:41',NULL,'Read','N_NEW_ORDER','72261642411981488178',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261642415595867874','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 16:42:41',NULL,'Read','N_NEW_ORDER','72261642411981488178',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261642417116735351','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 16:42:41',NULL,'Read','N_NEW_ORDER','72261642411981488178',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261642418883757762','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 16:42:41',NULL,'Read','N_NEW_ORDER','72261642411981488178',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226164242632265811','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 16:42:42',NULL,'Read','N_NEW_ORDER','72261642411981488178',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261656596361743883','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 16:56:59',NULL,'Read','N_NEW_ORDER','72261656586719144667',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261656599704982541','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 16:56:59',NULL,'Read','N_NEW_ORDER','72261656586719144667',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261657025388539811','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 16:57:00',NULL,'Read','N_NEW_ORDER','72261656586719144667',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261657124761054149','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 16:57:01',NULL,'Read','N_NEW_ORDER','72261656586719144667',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261657155288369745','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 16:57:01',NULL,'Read','N_NEW_ORDER','72261656586719144667',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261657471888270597','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 16:57:47',NULL,'Read','N_NEW_ORDER','72261657464697737350',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261657475211346823','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 16:57:47',NULL,'Read','N_NEW_ORDER','72261657464697737350',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261657477124020886','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 16:57:47',NULL,'Read','N_NEW_ORDER','72261657464697737350',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261657479238584716','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 16:57:47',NULL,'Read','N_NEW_ORDER','72261657464697737350',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261657481671184916','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 16:57:48',NULL,'Read','N_NEW_ORDER','72261657464697737350',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261657528336977798','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 16:57:52',NULL,'Read','N_NEW_ORDER','72261657523901375632',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261657532071225852','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 16:57:53',NULL,'Read','N_NEW_ORDER','72261657523901375632',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261657532598505025','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 16:57:53',NULL,'Read','N_NEW_ORDER','72261657523901375632',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261657534174680681','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 16:57:53',NULL,'Read','N_NEW_ORDER','72261657523901375632',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261657535659563230','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 16:57:53',NULL,'Read','N_NEW_ORDER','72261657523901375632',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261665328271775569','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 16:06:53',NULL,'Read','N_NEW_ORDER','7226166521303855257',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261665361990266463','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 16:06:53',NULL,'Read','N_NEW_ORDER','7226166521303855257',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261665376875445316','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 16:06:53',NULL,'Read','N_NEW_ORDER','7226166521303855257',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226166539674436180','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 16:06:53',NULL,'Read','N_NEW_ORDER','7226166521303855257',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226166547929355701','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 16:06:54',NULL,'Read','N_NEW_ORDER','7226166521303855257',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261715178422484582','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 17:15:17',NULL,'Read','N_NEW_ORDER','72261715173896938422',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261715182633215767','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 17:15:18',NULL,'Read','N_NEW_ORDER','72261715173896938422',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261715184409417238','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 17:15:18',NULL,'Read','N_NEW_ORDER','72261715173896938422',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261715185877636915','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 17:15:18',NULL,'Read','N_NEW_ORDER','72261715173896938422',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226171518791533400','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 17:15:18',NULL,'Read','N_NEW_ORDER','72261715173896938422',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261717341106232698','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 17:17:34',NULL,'Read','N_NEW_ORDER','72261717337531611174',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261717344029489596','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 17:17:34',NULL,'Read','N_NEW_ORDER','72261717337531611174',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261717346741805938','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 17:17:34',NULL,'Read','N_NEW_ORDER','72261717337531611174',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261717347919847979','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 17:17:34',NULL,'Read','N_NEW_ORDER','72261717337531611174',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261717351069209582','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 17:17:35',NULL,'Read','N_NEW_ORDER','72261717337531611174',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261730172067583350','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 17:30:17',NULL,'Read','N_NEW_ORDER','72261730169439986571',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261730173085827125','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 17:30:17',NULL,'Read','N_NEW_ORDER','72261730169439986571',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261730173968080785','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 17:30:17',NULL,'Read','N_NEW_ORDER','72261730169439986571',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261730175326585665','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 17:30:17',NULL,'Read','N_NEW_ORDER','72261730169439986571',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261730177161644596','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 17:30:17',NULL,'Read','N_NEW_ORDER','72261730169439986571',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226183633807905582','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 18:36:03',NULL,'Read','N_NEW_ORDER','722618363581222855',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226183635749605467','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 18:36:03',NULL,'Read','N_NEW_ORDER','722618363581222855',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261836368756179305','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 18:36:03',NULL,'Read','N_NEW_ORDER','722618363581222855',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261836378917076016','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 18:36:03',NULL,'Read','N_NEW_ORDER','722618363581222855',NULL,NULL,NULL,NULL,NULL,NULL),
  ('722618363914516970','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 18:36:03',NULL,'Read','N_NEW_ORDER','722618363581222855',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261842439236528833','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 18:42:43',NULL,'Read','N_NEW_ORDER','72261842435563554825',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261842442444824185','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 18:42:44',NULL,'Read','N_NEW_ORDER','72261842435563554825',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261842444142850172','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 18:42:44',NULL,'Read','N_NEW_ORDER','72261842435563554825',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261842445557248705','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 18:42:44',NULL,'Read','N_NEW_ORDER','72261842435563554825',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226184244591513321','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 18:42:44',NULL,'Read','N_NEW_ORDER','72261842435563554825',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261852541127062238','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 18:52:54',NULL,'Read','N_NEW_ORDER','72261852536473297374',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261852542842797636','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 18:52:54',NULL,'Read','N_NEW_ORDER','72261852536473297374',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261852544859512454','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 18:52:54',NULL,'Read','N_NEW_ORDER','72261852536473297374',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261852546631923672','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 18:52:54',NULL,'Read','N_NEW_ORDER','72261852536473297374',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261852548456261341','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 18:52:54',NULL,'Read','N_NEW_ORDER','72261852536473297374',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261852568966237260','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 18:52:56',NULL,'Read','N_NEW_ORDER','72261852566328800879',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261852571516352645','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 18:52:57',NULL,'Read','N_NEW_ORDER','72261852566328800879',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261852572996472705','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 18:52:57',NULL,'Read','N_NEW_ORDER','72261852566328800879',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261852574078803208','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 18:52:57',NULL,'Read','N_NEW_ORDER','72261852566328800879',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261852575056804642','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 18:52:57',NULL,'Read','N_NEW_ORDER','72261852566328800879',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261956371297121131','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 19:56:37',NULL,'Read','N_NEW_ORDER','72261956366408689234',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261956371917151208','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 19:56:37',NULL,'Read','N_NEW_ORDER','72261956366408689234',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261956373129688118','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 19:56:37',NULL,'Read','N_NEW_ORDER','72261956366408689234',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261956374814788559','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 19:56:37',NULL,'Read','N_NEW_ORDER','72261956366408689234',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261956375763097264','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 19:56:37',NULL,'Read','N_NEW_ORDER','72261956366408689234',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226195640110572482','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 19:56:40',NULL,'Read','N_NEW_ORDER','72261956398856429655',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261956402366364911','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 19:56:40',NULL,'Read','N_NEW_ORDER','72261956398856429655',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72261956403496722731','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 19:56:40',NULL,'Read','N_NEW_ORDER','72261956398856429655',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226195640528964272','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 19:56:40',NULL,'Read','N_NEW_ORDER','72261956398856429655',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226195640629809777','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 19:56:40',NULL,'Read','N_NEW_ORDER','72261956398856429655',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262025416583405298','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 20:25:41',NULL,'Read','N_NEW_ORDER','72262025411065273931',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262025418069398437','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 20:25:41',NULL,'Read','N_NEW_ORDER','72262025411065273931',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262025419041817260','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 20:25:41',NULL,'Read','N_NEW_ORDER','72262025411065273931',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262025421583028937','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 20:25:42',NULL,'Read','N_NEW_ORDER','72262025411065273931',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262025425084441949','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 20:25:42',NULL,'Read','N_NEW_ORDER','72262025411065273931',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262025443618502431','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 20:25:44',NULL,'Read','N_NEW_ORDER','72262025441183875948',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262025444676918367','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 20:25:44',NULL,'Read','N_NEW_ORDER','72262025441183875948',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262025446161458114','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 20:25:44',NULL,'Read','N_NEW_ORDER','72262025441183875948',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262025447778144711','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 20:25:44',NULL,'Read','N_NEW_ORDER','72262025441183875948',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262025449092358670','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 20:25:44',NULL,'Read','N_NEW_ORDER','72262025441183875948',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262029015128441806','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 20:29:00',NULL,'Read','N_NEW_ORDER','72262028598189939960',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262029032660053668','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 20:29:00',NULL,'Read','N_NEW_ORDER','72262028598189939960',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226202904997180397','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 20:29:00',NULL,'Read','N_NEW_ORDER','72262028598189939960',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262029069659459645','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 20:29:00',NULL,'Read','N_NEW_ORDER','72262028598189939960',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262029080140192012','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 20:29:00',NULL,'Read','N_NEW_ORDER','72262028598189939960',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262029347846865463','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 20:29:03',NULL,'Read','N_NEW_ORDER','72262029320939159375',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262029360247221172','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 20:29:03',NULL,'Read','N_NEW_ORDER','72262029320939159375',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262029371841461199','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 20:29:03',NULL,'Read','N_NEW_ORDER','72262029320939159375',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262029385190129013','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 20:29:03',NULL,'Read','N_NEW_ORDER','72262029320939159375',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262029398765249913','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 20:29:03',NULL,'Read','N_NEW_ORDER','72262029320939159375',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032308396681473','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 20:32:30',NULL,'Read','N_NEW_ORDER','72262032305455220667',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032309333598186','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 20:32:30',NULL,'Read','N_NEW_ORDER','72262032305455220667',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032312002405577','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 20:32:31',NULL,'Read','N_NEW_ORDER','72262032305455220667',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032313561747597','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 20:32:31',NULL,'Read','N_NEW_ORDER','72262032305455220667',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032314886236013','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 20:32:31',NULL,'Read','N_NEW_ORDER','72262032305455220667',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032338487743513','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 20:32:33',NULL,'Read','N_NEW_ORDER','72262032335829992828',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032343479545686','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 20:32:34',NULL,'Read','N_NEW_ORDER','72262032335829992828',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032349828498212','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 20:32:34',NULL,'Read','N_NEW_ORDER','72262032335829992828',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032351841728350','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 20:32:35',NULL,'Read','N_NEW_ORDER','72262032335829992828',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226203235464129765','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 20:32:35',NULL,'Read','N_NEW_ORDER','72262032335829992828',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032379358587360','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 20:32:37',NULL,'Read','N_NEW_ORDER','72262032376632546791',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032383836919376','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 20:32:38',NULL,'Read','N_NEW_ORDER','72262032376632546791',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032393892607284','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 20:32:39',NULL,'Read','N_NEW_ORDER','72262032376632546791',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032396235166269','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 20:32:39',NULL,'Read','N_NEW_ORDER','72262032376632546791',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032403859916104','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 20:32:40',NULL,'Read','N_NEW_ORDER','72262032376632546791',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032562358487653','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 20:32:56',NULL,'Read','N_NEW_ORDER','72262032557763564820',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032563771467547','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 20:32:56',NULL,'Read','N_NEW_ORDER','72262032557763564820',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032565374166930','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 20:32:56',NULL,'Read','N_NEW_ORDER','72262032557763564820',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032567047808724','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 20:32:56',NULL,'Read','N_NEW_ORDER','72262032557763564820',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032568596665526','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 20:32:56',NULL,'Read','N_NEW_ORDER','72262032557763564820',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032589829557480','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 20:32:58',NULL,'Read','N_NEW_ORDER','72262032586881584243',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032591015504876','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 20:32:59',NULL,'Read','N_NEW_ORDER','72262032586881584243',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032593457299117','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 20:32:59',NULL,'Read','N_NEW_ORDER','72262032586881584243',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032595248283876','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 20:32:59',NULL,'Read','N_NEW_ORDER','72262032586881584243',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262032596911740549','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 20:32:59',NULL,'Read','N_NEW_ORDER','72262032586881584243',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262033176857221990','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 20:33:17',NULL,'Read','N_NEW_ORDER','72262033173129564688',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226203317923827393','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 20:33:17',NULL,'Read','N_NEW_ORDER','72262033173129564688',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262033181139986212','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 20:33:18',NULL,'Read','N_NEW_ORDER','72262033173129564688',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262033182253974830','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 20:33:18',NULL,'Read','N_NEW_ORDER','72262033173129564688',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262033183191290755','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 20:33:18',NULL,'Read','N_NEW_ORDER','72262033173129564688',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262034241513651422','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 20:34:24',NULL,'Read','N_NEW_ORDER','72262034238349806519',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262034243096076586','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 20:34:24',NULL,'Read','N_NEW_ORDER','72262034238349806519',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262034244229129626','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 20:34:24',NULL,'Read','N_NEW_ORDER','72262034238349806519',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262034245039919348','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 20:34:24',NULL,'Read','N_NEW_ORDER','72262034238349806519',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262034246429884901','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 20:34:24',NULL,'Read','N_NEW_ORDER','72262034238349806519',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262046153893107666','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 20:46:15',NULL,'Read','N_NEW_ORDER','72262046151852083114',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262046154764987495','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 20:46:15',NULL,'Read','N_NEW_ORDER','72262046151852083114',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262046155605719214','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 20:46:15',NULL,'Read','N_NEW_ORDER','72262046151852083114',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262046156408553904','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 20:46:15',NULL,'Read','N_NEW_ORDER','72262046151852083114',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262046157278971331','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 20:46:15',NULL,'Read','N_NEW_ORDER','72262046151852083114',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262046575393190746','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 20:46:57',NULL,'Read','N_NEW_ORDER','72262046573459548581',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262046576196977281','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 20:46:57',NULL,'Read','N_NEW_ORDER','72262046573459548581',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262046577068025908','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 20:46:57',NULL,'Read','N_NEW_ORDER','72262046573459548581',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262046577968328044','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 20:46:57',NULL,'Read','N_NEW_ORDER','72262046573459548581',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262046578864037846','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 20:46:57',NULL,'Read','N_NEW_ORDER','72262046573459548581',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262085398289738117','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 20:08:53',NULL,'Read','N_NEW_ORDER','72262085356671383862',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262085420899783838','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 20:08:54',NULL,'Read','N_NEW_ORDER','72262085356671383862',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262085430015461496','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 20:08:54',NULL,'Read','N_NEW_ORDER','72262085356671383862',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262085443541629619','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 20:08:54',NULL,'Read','N_NEW_ORDER','72262085356671383862',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262085458645745687','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 20:08:54',NULL,'Read','N_NEW_ORDER','72262085356671383862',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262085678238854933','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 20:08:56',NULL,'Read','N_NEW_ORDER','72262085645331865609',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262085717333271785','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 20:08:57',NULL,'Read','N_NEW_ORDER','72262085645331865609',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262085728285419','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 20:08:57',NULL,'Read','N_NEW_ORDER','72262085645331865609',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262085728699837509','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 20:08:57',NULL,'Read','N_NEW_ORDER','72262085645331865609',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226208574128204920','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 20:08:57',NULL,'Read','N_NEW_ORDER','72262085645331865609',NULL,NULL,NULL,NULL,NULL,NULL),
  ('722621037552909992','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:00:37',NULL,'Read','N_NEW_ORDER','72262103691793356368',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262103767331746339','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:00:37',NULL,'Read','N_NEW_ORDER','72262103691793356368',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262103775430725437','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:00:37',NULL,'Read','N_NEW_ORDER','72262103691793356368',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262103784475842361','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:00:37',NULL,'Read','N_NEW_ORDER','72262103691793356368',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262103793351198695','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:00:37',NULL,'Read','N_NEW_ORDER','72262103691793356368',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262103980993067128','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:00:39',NULL,'Read','N_NEW_ORDER','72262103943045155983',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262103994551304575','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:00:39',NULL,'Read','N_NEW_ORDER','72262103943045155983',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262104020879908695','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:00:40',NULL,'Read','N_NEW_ORDER','72262103943045155983',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262104028988197439','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:00:40',NULL,'Read','N_NEW_ORDER','72262103943045155983',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226210405664562437','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:00:40',NULL,'Read','N_NEW_ORDER','72262103943045155983',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110234186967373','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:10:02',NULL,'Read','N_NEW_ORDER','7226211026870033523',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226211024751750277','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:10:02',NULL,'Read','N_NEW_ORDER','7226211026870033523',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110258444132725','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:10:02',NULL,'Read','N_NEW_ORDER','7226211026870033523',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110266973424809','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:10:02',NULL,'Read','N_NEW_ORDER','7226211026870033523',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110280521294544','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:10:02',NULL,'Read','N_NEW_ORDER','7226211026870033523',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110313016514719','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:10:31',NULL,'Read','N_NEW_ORDER','72262110312811158375',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110314104097813','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:10:31',NULL,'Read','N_NEW_ORDER','72262110312811158375',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110315328674851','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:10:31',NULL,'Read','N_NEW_ORDER','72262110312811158375',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110316108323623','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:10:31',NULL,'Read','N_NEW_ORDER','72262110312811158375',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110317078121482','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:10:31',NULL,'Read','N_NEW_ORDER','72262110312811158375',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110335199154304','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:10:33',NULL,'Read','N_NEW_ORDER','72262110332312608271',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110336273101167','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:10:33',NULL,'Read','N_NEW_ORDER','72262110332312608271',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110337094148495','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:10:33',NULL,'Read','N_NEW_ORDER','72262110332312608271',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110337914691368','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:10:33',NULL,'Read','N_NEW_ORDER','72262110332312608271',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110339008751758','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:10:33',NULL,'Read','N_NEW_ORDER','72262110332312608271',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110454937233121','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:10:04',NULL,'Read','N_NEW_ORDER','72262110421264342673',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110462593294339','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:10:04',NULL,'Read','N_NEW_ORDER','72262110421264342673',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110470729398780','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:10:04',NULL,'Read','N_NEW_ORDER','72262110421264342673',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110479745588703','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:10:04',NULL,'Read','N_NEW_ORDER','72262110421264342673',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110493031892198','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:10:04',NULL,'Read','N_NEW_ORDER','72262110421264342673',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226211081284535737','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:10:08',NULL,'Read','N_NEW_ORDER','72262110773348267077',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110825169227641','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:10:08',NULL,'Read','N_NEW_ORDER','72262110773348267077',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226211084037056204','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:10:08',NULL,'Read','N_NEW_ORDER','72262110773348267077',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110849672063483','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:10:08',NULL,'Read','N_NEW_ORDER','72262110773348267077',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262110859683215341','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:10:08',NULL,'Read','N_NEW_ORDER','72262110773348267077',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262112927461293819','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:01:29',NULL,'Read','N_NEW_ORDER','7226211297615579359',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262112937383438426','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:01:29',NULL,'Read','N_NEW_ORDER','7226211297615579359',NULL,NULL,NULL,NULL,NULL,NULL),
  ('722621129463381195','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:01:29',NULL,'Read','N_NEW_ORDER','7226211297615579359',NULL,NULL,NULL,NULL,NULL,NULL),
  ('722621129551937242','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:01:29',NULL,'Read','N_NEW_ORDER','7226211297615579359',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262112965189863267','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:01:29',NULL,'Read','N_NEW_ORDER','7226211297615579359',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262123425993319983','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:23:42',NULL,'Read','N_NEW_ORDER','72262123424015155614',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262123427045145199','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:23:42',NULL,'Read','N_NEW_ORDER','72262123424015155614',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262123427928785259','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:23:42',NULL,'Read','N_NEW_ORDER','72262123424015155614',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262123428854288739','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:23:42',NULL,'Read','N_NEW_ORDER','72262123424015155614',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226212343086479122','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:23:43',NULL,'Read','N_NEW_ORDER','72262123424015155614',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262132405509113192','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:32:40',NULL,'Read','N_NEW_ORDER','72262132402384149546',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262132407806827752','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:32:40',NULL,'Read','N_NEW_ORDER','72262132402384149546',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262132408733288183','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:32:40',NULL,'Read','N_NEW_ORDER','72262132402384149546',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262132411492972830','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:32:41',NULL,'Read','N_NEW_ORDER','72262132402384149546',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262132411757292078','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:32:41',NULL,'Read','N_NEW_ORDER','72262132402384149546',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262133113168900748','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:33:11',NULL,'Read','N_NEW_ORDER','72262133111282296740',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262133114189083665','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:33:11',NULL,'Read','N_NEW_ORDER','72262133111282296740',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262133115011829871','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:33:11',NULL,'Read','N_NEW_ORDER','72262133111282296740',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262133115769008939','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:33:11',NULL,'Read','N_NEW_ORDER','72262133111282296740',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262133116695776845','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:33:11',NULL,'Read','N_NEW_ORDER','72262133111282296740',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262135357224071057','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:35:35',NULL,'Read','N_NEW_ORDER','72262135354205804777',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262135358162331745','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:35:35',NULL,'Read','N_NEW_ORDER','72262135354205804777',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262135358984517272','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:35:35',NULL,'Read','N_NEW_ORDER','72262135354205804777',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262135359908240622','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:35:35',NULL,'Read','N_NEW_ORDER','72262135354205804777',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262135367891187810','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:35:36',NULL,'Read','N_NEW_ORDER','72262135354205804777',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262136341681634819','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:36:34',NULL,'Read','N_NEW_ORDER','72262136338666021382',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262136342462332740','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:36:34',NULL,'Read','N_NEW_ORDER','72262136338666021382',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262136343299247366','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:36:34',NULL,'Read','N_NEW_ORDER','72262136338666021382',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262136344159605662','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:36:34',NULL,'Read','N_NEW_ORDER','72262136338666021382',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262136348488959232','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:36:34',NULL,'Read','N_NEW_ORDER','72262136338666021382',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262136352058356281','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:36:35',NULL,'Read','N_NEW_ORDER','72262136349912664643',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262136352841303419','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:36:35',NULL,'Read','N_NEW_ORDER','72262136349912664643',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262136353728551168','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:36:35',NULL,'Read','N_NEW_ORDER','72262136349912664643',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262136354691311318','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:36:35',NULL,'Read','N_NEW_ORDER','72262136349912664643',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262136355738404686','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:36:35',NULL,'Read','N_NEW_ORDER','72262136349912664643',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262136372861679636','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:36:37',NULL,'Read','N_NEW_ORDER','72262136371002258553',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262136373731531327','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:36:37',NULL,'Read','N_NEW_ORDER','72262136371002258553',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262136374622925336','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:36:37',NULL,'Read','N_NEW_ORDER','72262136371002258553',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262136375861161914','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:36:37',NULL,'Read','N_NEW_ORDER','72262136371002258553',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262136376787791934','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:36:37',NULL,'Read','N_NEW_ORDER','72262136371002258553',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262138303553740506','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:38:30',NULL,'Read','N_NEW_ORDER','72262138301631792142',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262138304808494159','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:38:30',NULL,'Read','N_NEW_ORDER','72262138301631792142',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262138305949169912','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:38:30',NULL,'Read','N_NEW_ORDER','72262138301631792142',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262138306811603711','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:38:30',NULL,'Read','N_NEW_ORDER','72262138301631792142',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262138307625365546','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:38:30',NULL,'Read','N_NEW_ORDER','72262138301631792142',NULL,NULL,NULL,NULL,NULL,NULL),
  ('722621383157574116','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:38:31',NULL,'Read','N_NEW_ORDER','72262138313332874855',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262138316593817237','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:38:31',NULL,'Read','N_NEW_ORDER','72262138313332874855',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262138317491495496','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:38:31',NULL,'Read','N_NEW_ORDER','72262138313332874855',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262138318374641337','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:38:31',NULL,'Read','N_NEW_ORDER','72262138313332874855',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262138319248651739','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:38:31',NULL,'Read','N_NEW_ORDER','72262138313332874855',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262192092842711880','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:09:20',NULL,'Read','N_NEW_ORDER','72262192069087061479',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226219211015007707','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:09:21',NULL,'Read','N_NEW_ORDER','72262192069087061479',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262192119133811054','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:09:21',NULL,'Read','N_NEW_ORDER','72262192069087061479',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226219212149569123','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:09:21',NULL,'Read','N_NEW_ORDER','72262192069087061479',NULL,NULL,NULL,NULL,NULL,NULL),
  ('722621921279440572','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:09:21',NULL,'Read','N_NEW_ORDER','72262192069087061479',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262192343012751384','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:09:23',NULL,'Read','N_NEW_ORDER','72262192324264466923',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262192351572582456','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:09:23',NULL,'Read','N_NEW_ORDER','72262192324264466923',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262192360312347098','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:09:23',NULL,'Read','N_NEW_ORDER','72262192324264466923',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262192374390832087','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:09:23',NULL,'Read','N_NEW_ORDER','72262192324264466923',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262192384632137269','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:09:23',NULL,'Read','N_NEW_ORDER','72262192324264466923',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262192544616995210','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 21:09:25',NULL,'Read','N_NEW_ORDER','7226219252597355414',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7226219255964175128','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-26 21:09:25',NULL,'Read','N_NEW_ORDER','7226219252597355414',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262192578138242435','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-26 21:09:25',NULL,'Read','N_NEW_ORDER','7226219252597355414',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262192598065574245','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-26 21:09:25',NULL,'Read','N_NEW_ORDER','7226219252597355414',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72262192611459026525','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-26 21:09:26',NULL,'Read','N_NEW_ORDER','7226219252597355414',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72271514395422068528','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-27 15:14:39',NULL,'Read','N_NEW_ORDER','72271514391816781431',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72271514397853214680','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-27 15:14:39',NULL,'Read','N_NEW_ORDER','72271514391816781431',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72271514399264025928','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-27 15:14:39',NULL,'Read','N_NEW_ORDER','72271514391816781431',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72271514402251469585','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-27 15:14:40',NULL,'Read','N_NEW_ORDER','72271514391816781431',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72271514405723705251','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-27 15:14:40',NULL,'Read','N_NEW_ORDER','72271514391816781431',NULL,NULL,NULL,NULL,NULL,NULL),
  ('722716192442399298','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Beurre (1) ;Bouillie de riz (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-27 16:19:24',NULL,'Read','N_NEW_ORDER','72271619236615649507',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72271619245923687349','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Bouillie de riz (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-27 16:19:24',NULL,'Read','N_NEW_ORDER','72271619236615649507',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72271619248087245529','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Bouillie de riz (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-27 16:19:24',NULL,'Read','N_NEW_ORDER','72271619236615649507',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72271619249412895515','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Bouillie de riz (1)  <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-27 16:19:24',NULL,'Read','N_NEW_ORDER','72271619236615649507',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72271619256195461566','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Bouillie de riz (1)  <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-27 16:19:25',NULL,'Read','N_NEW_ORDER','72271619236615649507',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72271623353306233279','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Creme de riz (1) ;Beurre (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-27 16:23:35',NULL,'Read','N_NEW_ORDER','72271623349604784837',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72271623355005236576','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Creme de riz (1) ;Beurre (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-27 16:23:35',NULL,'Read','N_NEW_ORDER','72271623349604784837',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72271623356168020153','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Creme de riz (1) ;Beurre (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-27 16:23:35',NULL,'Read','N_NEW_ORDER','72271623349604784837',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72271623357316716719','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Creme de riz (1) ;Beurre (1)  <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-27 16:23:35',NULL,'Read','N_NEW_ORDER','72271623349604784837',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72271623358354336878','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Creme de riz (1) ;Beurre (1)  <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-27 16:23:35',NULL,'Read','N_NEW_ORDER','72271623349604784837',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72271623373304608667','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Beurre (1) ;Creme de riz (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-27 16:23:37',NULL,'Read','N_NEW_ORDER','72271623366686613949',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72271623374389856397','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Creme de riz (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-27 16:23:37',NULL,'Read','N_NEW_ORDER','72271623366686613949',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72271623375571126790','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Creme de riz (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-27 16:23:37',NULL,'Read','N_NEW_ORDER','72271623366686613949',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72271623376758256393','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Creme de riz (1)  <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-27 16:23:37',NULL,'Read','N_NEW_ORDER','72271623366686613949',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72271623377953883460','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Creme de riz (1)  <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-27 16:23:37',NULL,'Read','N_NEW_ORDER','72271623366686613949',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281025203132164869','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-28 10:25:20',NULL,'Read','N_NEW_ORDER','72281025198492714963',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281025205308761441','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-28 10:25:20',NULL,'Read','N_NEW_ORDER','72281025198492714963',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281025206546016858','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-28 10:25:20',NULL,'Read','N_NEW_ORDER','72281025198492714963',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281025208073263767','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-28 10:25:20',NULL,'Read','N_NEW_ORDER','72281025198492714963',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7228102521832118015','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-28 10:25:21',NULL,'Read','N_NEW_ORDER','72281025198492714963',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281042195035697840','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-28 10:42:19',NULL,'Read','N_NEW_ORDER','72281042192615277169',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281042196284303927','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-28 10:42:19',NULL,'Read','N_NEW_ORDER','72281042192615277169',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281042198345314972','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-28 10:42:19',NULL,'Read','N_NEW_ORDER','72281042192615277169',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281042199746752949','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-28 10:42:19',NULL,'Read','N_NEW_ORDER','72281042192615277169',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281042201519635922','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-28 10:42:20',NULL,'Read','N_NEW_ORDER','72281042192615277169',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281056437879692648','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-28 10:56:43',NULL,'Read','N_NEW_ORDER','72281056426858390208',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281056442167478436','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-28 10:56:44',NULL,'Read','N_NEW_ORDER','72281056426858390208',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281056443582026269','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-28 10:56:44',NULL,'Read','N_NEW_ORDER','72281056426858390208',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281056445154588575','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-28 10:56:44',NULL,'Read','N_NEW_ORDER','72281056426858390208',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281056445511017549','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-28 10:56:44',NULL,'Read','N_NEW_ORDER','72281056426858390208',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281058107407633123','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-28 10:58:10',NULL,'Read','N_NEW_ORDER','72281058101621547746',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281058108713974410','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-28 10:58:10',NULL,'Read','N_NEW_ORDER','72281058101621547746',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281058111492296642','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-28 10:58:11',NULL,'Read','N_NEW_ORDER','72281058101621547746',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281058113492726455','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-28 10:58:11',NULL,'Read','N_NEW_ORDER','72281058101621547746',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281058113607868159','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-28 10:58:11',NULL,'Read','N_NEW_ORDER','72281058101621547746',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281059295148859823','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-28 10:59:29',NULL,'Read','N_NEW_ORDER','72281059292911213723',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281059296277514936','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-28 10:59:29',NULL,'Read','N_NEW_ORDER','72281059292911213723',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281059298221337628','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-28 10:59:29',NULL,'Read','N_NEW_ORDER','72281059292911213723',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281059302134534441','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-28 10:59:30',NULL,'Read','N_NEW_ORDER','72281059292911213723',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281059306765514824','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-28 10:59:30',NULL,'Read','N_NEW_ORDER','72281059292911213723',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281123257579879181','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-28 11:23:25',NULL,'Read','N_NEW_ORDER','72281123255272177649',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281123258915933452','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-28 11:23:25',NULL,'Read','N_NEW_ORDER','72281123255272177649',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281123261122288466','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-28 11:23:26',NULL,'Read','N_NEW_ORDER','72281123255272177649',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281123262288171294','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-28 11:23:26',NULL,'Read','N_NEW_ORDER','72281123255272177649',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7228112326864614285','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-28 11:23:26',NULL,'Read','N_NEW_ORDER','72281123255272177649',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281137487337575782','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-28 11:37:48',NULL,'Read','N_NEW_ORDER','72281137484996509729',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281137488486030373','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-28 11:37:48',NULL,'Read','N_NEW_ORDER','72281137484996509729',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281137489556255262','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-28 11:37:48',NULL,'Read','N_NEW_ORDER','72281137484996509729',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281137491772816269','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-28 11:37:49',NULL,'Read','N_NEW_ORDER','72281137484996509729',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281137498776813734','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-28 11:37:49',NULL,'Read','N_NEW_ORDER','72281137484996509729',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281138124238156421','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-28 11:38:12',NULL,'Read','N_NEW_ORDER','72281138121781165261',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7228113812602315107','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-28 11:38:12',NULL,'Read','N_NEW_ORDER','72281138121781165261',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281138127122129857','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-28 11:38:12',NULL,'Read','N_NEW_ORDER','72281138121781165261',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281138128479009375','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-28 11:38:12',NULL,'Read','N_NEW_ORDER','72281138121781165261',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281138129567378381','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-28 11:38:12',NULL,'Read','N_NEW_ORDER','72281138121781165261',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281175313675951990','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-28 11:07:53',NULL,'Read','N_NEW_ORDER','722811752795148575',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281175331149113635','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-28 11:07:53',NULL,'Read','N_NEW_ORDER','722811752795148575',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281175351479353902','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-28 11:07:53',NULL,'Read','N_NEW_ORDER','722811752795148575',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281175366650411335','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-28 11:07:53',NULL,'Read','N_NEW_ORDER','722811752795148575',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281175384171717690','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-28 11:07:53',NULL,'Read','N_NEW_ORDER','722811752795148575',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281254257234966718','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-28 12:54:25',NULL,'Read','N_NEW_ORDER','72281254251242953522',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7228125425881874476','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-28 12:54:25',NULL,'Read','N_NEW_ORDER','72281254251242953522',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281254261459645146','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-28 12:54:26',NULL,'Read','N_NEW_ORDER','72281254251242953522',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281254262456545146','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-28 12:54:26',NULL,'Read','N_NEW_ORDER','72281254251242953522',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281254263723365833','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-28 12:54:26',NULL,'Read','N_NEW_ORDER','72281254251242953522',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281255144787832942','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-28 12:55:14',NULL,'Read','N_NEW_ORDER','72281255141402820816',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281255147082814780','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-28 12:55:14',NULL,'Read','N_NEW_ORDER','72281255141402820816',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281255148728768227','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-28 12:55:14',NULL,'Read','N_NEW_ORDER','72281255141402820816',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281255152693498044','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-28 12:55:15',NULL,'Read','N_NEW_ORDER','72281255141402820816',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281255159934364086','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-28 12:55:15',NULL,'Read','N_NEW_ORDER','72281255141402820816',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281257650998047220','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-28 12:57:06',NULL,'Read','N_NEW_ORDER','7228125762825391157',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281257662364668585','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-28 12:57:06',NULL,'Read','N_NEW_ORDER','7228125762825391157',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281257674020369902','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-28 12:57:06',NULL,'Read','N_NEW_ORDER','7228125762825391157',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281257716750913349','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-28 12:57:07',NULL,'Read','N_NEW_ORDER','7228125762825391157',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7228125776374172141','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br> <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-28 12:57:07',NULL,'Read','N_NEW_ORDER','7228125762825391157',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281316408658810613','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-28 13:16:40',NULL,'Read','N_NEW_ORDER','72281316403985912404',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281316412126421190','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-28 13:16:41',NULL,'Read','N_NEW_ORDER','72281316403985912404',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281316413637681265','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-28 13:16:41',NULL,'Read','N_NEW_ORDER','72281316403985912404',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281316414938384480','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-28 13:16:41',NULL,'Read','N_NEW_ORDER','72281316403985912404',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281316418330756','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-28 13:16:41',NULL,'Read','N_NEW_ORDER','72281316403985912404',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281318406015079596','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-28 13:18:40',NULL,'Read','N_NEW_ORDER','72281318401835383368',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281318407131906577','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-28 13:18:40',NULL,'Read','N_NEW_ORDER','72281318401835383368',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281318408249396168','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-28 13:18:40',NULL,'Read','N_NEW_ORDER','72281318401835383368',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281318409515982204','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-28 13:18:40',NULL,'Read','N_NEW_ORDER','72281318401835383368',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281318411111594426','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-28 13:18:41',NULL,'Read','N_NEW_ORDER','72281318401835383368',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281326301528352314','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-28 13:26:30',NULL,'Read','N_NEW_ORDER','72281326293761024845',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7228132630413199738','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-28 13:26:30',NULL,'Read','N_NEW_ORDER','72281326293761024845',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281326306782097609','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-28 13:26:30',NULL,'Read','N_NEW_ORDER','72281326293761024845',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281326308534508299','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-28 13:26:30',NULL,'Read','N_NEW_ORDER','72281326293761024845',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281326317054471919','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-28 13:26:31',NULL,'Read','N_NEW_ORDER','72281326293761024845',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7228134139993384027','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-28 13:41:03',NULL,'Read','N_NEW_ORDER','72281341318546928180','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('72281341416972461361','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-28 13:41:04',NULL,'Read','N_NEW_ORDER','72281341318546928180','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('72281341432566213909','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-28 13:41:04',NULL,'Read','N_NEW_ORDER','72281341318546928180','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('72281341446182925748','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-28 13:41:04',NULL,'Read','N_NEW_ORDER','72281341318546928180','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('72281341459448204634','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-28 13:41:04',NULL,'Read','N_NEW_ORDER','72281341318546928180','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('72281344397215894523','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-28 13:44:39',NULL,'Read','N_NEW_ORDER','72281344384956223888',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281344399223908782','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-28 13:44:39',NULL,'Read','N_NEW_ORDER','72281344384956223888',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281344401245968523','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-28 13:44:40',NULL,'Read','N_NEW_ORDER','72281344384956223888',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281344402839266282','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-28 13:44:40',NULL,'Read','N_NEW_ORDER','72281344384956223888',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281344404471184100','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-28 13:44:40',NULL,'Read','N_NEW_ORDER','72281344384956223888',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281345369604081967','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Chocolat (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-28 13:45:36',NULL,'Read','N_NEW_ORDER','72281345357948026211',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281345372054213936','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Chocolat (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-28 13:45:37',NULL,'Read','N_NEW_ORDER','72281345357948026211',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281345374972190720','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Chocolat (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-28 13:45:37',NULL,'Read','N_NEW_ORDER','72281345357948026211',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281345376648761883','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Chocolat (1)  <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-28 13:45:37',NULL,'Read','N_NEW_ORDER','72281345357948026211',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281345378439922326','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Chocolat (1)  <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-28 13:45:37',NULL,'Read','N_NEW_ORDER','72281345357948026211',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281345505863545649','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Thé-lait (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-28 13:45:50',NULL,'Read','N_NEW_ORDER','72281345499943323288',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281345507393956562','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Thé-lait (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-02-28 13:45:50',NULL,'Read','N_NEW_ORDER','72281345499943323288',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281345509124080625','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Thé-lait (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-02-28 13:45:50',NULL,'Read','N_NEW_ORDER','72281345499943323288',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281345511749222717','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Thé-lait (1)  <br>A ETE ENREGISTRER PAR TEST  TEST','2017-02-28 13:45:51',NULL,'Read','N_NEW_ORDER','72281345499943323288',NULL,NULL,NULL,NULL,NULL,NULL),
  ('72281345514519497643','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Thé-lait (1)  <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-02-28 13:45:51',NULL,'Read','N_NEW_ORDER','72281345499943323288',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161316456541337962','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 13:16:45',NULL,'Read','N_NEW_ORDER','7316131645886086666',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161316458348846528','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 13:16:45',NULL,'Read','N_NEW_ORDER','7316131645886086666',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161316459875047240','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 13:16:45',NULL,'Read','N_NEW_ORDER','7316131645886086666',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161319834428638864','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Quaker (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 13:19:08',NULL,'Read','N_NEW_ORDER','73161319788836734759',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161319845378424903','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Quaker (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 13:19:08',NULL,'Read','N_NEW_ORDER','73161319788836734759',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161319857285728038','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Quaker (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 13:19:08',NULL,'Read','N_NEW_ORDER','73161319788836734759',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161320156082837712','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Quaker (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 13:20:15',NULL,'Read','N_NEW_ORDER','73161320152565428120',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161320157134845684','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Quaker (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 13:20:15',NULL,'Read','N_NEW_ORDER','73161320152565428120',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161320158242717507','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Quaker (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 13:20:15',NULL,'Read','N_NEW_ORDER','73161320152565428120',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161332385766215369','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Quaker (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 13:32:38',NULL,'Read','N_NEW_ORDER','73161332382871153890',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161332386825419325','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Quaker (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 13:32:38',NULL,'Read','N_NEW_ORDER','73161332382871153890',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161332388317151688','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Quaker (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 13:32:38',NULL,'Read','N_NEW_ORDER','73161332382871153890',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161332413554228094','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 13:03:24',NULL,'Read','N_NEW_ORDER','73161332273069609396','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73161332452821562379','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 13:03:24',NULL,'Read','N_NEW_ORDER','73161332273069609396','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('7316133247469509856','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 13:03:24',NULL,'Read','N_NEW_ORDER','73161332273069609396','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73161358394476868233','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Quaker (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 13:58:39',NULL,'Read','N_NEW_ORDER','73161358388845524987',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161358396988964326','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Quaker (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 13:58:39',NULL,'Read','N_NEW_ORDER','73161358388845524987',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161358398934212756','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Quaker (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 13:58:39',NULL,'Read','N_NEW_ORDER','73161358388845524987',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161392469756951902','31017105229982132919','31017105229982132919','Je veu Baiser','UNE NOUVELLE COMMANDE  DE ;Abolo (1) ;ATTIEKE (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 13:09:24',NULL,'Read','N_NEW_ORDER','73161392377132643000','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73161392484231025281','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 13:09:24',NULL,'Read','N_NEW_ORDER','73161392377132643000','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('7316139249809222943','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 13:09:24',NULL,'Read','N_NEW_ORDER','73161392377132643000','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73161411281243063594','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bouillie de riz (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 14:11:28',NULL,'Read','N_NEW_ORDER','7316141127725569345',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161411283223765959','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bouillie de riz (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 14:11:28',NULL,'Read','N_NEW_ORDER','7316141127725569345',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161411284395933875','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bouillie de riz (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 14:11:28',NULL,'Read','N_NEW_ORDER','7316141127725569345',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161417457184314848','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Quaker (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 14:17:45',NULL,'Read','N_NEW_ORDER','73161417454046714391',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161417458342678540','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Quaker (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 14:17:45',NULL,'Read','N_NEW_ORDER','73161417454046714391',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161417459596905505','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Quaker (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 14:17:45',NULL,'Read','N_NEW_ORDER','73161417454046714391',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161423421291818322','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1) ;Quaker (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 14:23:42',NULL,'Read','N_NEW_ORDER','73161423415533958293',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161423422721746611','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Quaker (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 14:23:42',NULL,'Read','N_NEW_ORDER','73161423415533958293',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161423423871080896','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Quaker (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 14:23:42',NULL,'Read','N_NEW_ORDER','73161423415533958293',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161424348205117700','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1) ;ATTIEKE (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 14:24:34',NULL,'Read','N_NEW_ORDER','73161424344259532312',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161424349205950216','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 14:24:34',NULL,'Read','N_NEW_ORDER','73161424344259532312',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7316142435655768779','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 14:24:35',NULL,'Read','N_NEW_ORDER','73161424344259532312',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161425371655768227','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 14:25:37',NULL,'Read','N_NEW_ORDER','73161425366189028397',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161425372625636593','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 14:25:37',NULL,'Read','N_NEW_ORDER','73161425366189028397',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161425376646993343','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1) ;ATTIEKE (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 14:25:37',NULL,'Read','N_NEW_ORDER','73161425366189028397',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161428101442588677','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Bavaroise aux fruits (1) ;Creme de riz (1) ;Crème caramel (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 14:28:10',NULL,'Read','N_NEW_ORDER','73161428946374052723',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161428102417190937','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Bavaroise aux fruits (1) ;Creme de riz (1) ;Crème caramel (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 14:28:10',NULL,'Read','N_NEW_ORDER','73161428946374052723',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7316142810436546918','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Beurre (1) ;Bavaroise aux fruits (1) ;Creme de riz (1) ;Crème caramel (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 14:28:10',NULL,'Read','N_NEW_ORDER','73161428946374052723',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161429431386947400','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Bavaroise aux fruits (1) ;Creme de riz (1) ;Crème caramel (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 14:29:43',NULL,'Read','N_NEW_ORDER','73161429423812689771',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161429432543946530','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Bavaroise aux fruits (1) ;Creme de riz (1) ;Crème caramel (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 14:29:43',NULL,'Read','N_NEW_ORDER','73161429423812689771',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161429434553608568','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Beurre (1) ;Bavaroise aux fruits (1) ;Creme de riz (1) ;Crème caramel (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 14:29:43',NULL,'Read','N_NEW_ORDER','73161429423812689771',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161430421751610504','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Bavaroise aux fruits (1) ;Creme de riz (1) ;Crème caramel (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 14:30:42',NULL,'Read','N_NEW_ORDER','73161430412866146839',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161430422944473859','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Bavaroise aux fruits (1) ;Creme de riz (1) ;Crème caramel (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 14:30:42',NULL,'Read','N_NEW_ORDER','73161430412866146839',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161430428017807799','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Beurre (1) ;Bavaroise aux fruits (1) ;Creme de riz (1) ;Crème caramel (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 14:30:42',NULL,'Read','N_NEW_ORDER','73161430412866146839',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161431345217430835','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Beurre (1) ;Creme de riz (1) ;Crème caramel (1) ;Bande de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 14:31:34',NULL,'Read','N_NEW_ORDER','73161431339197629206',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161431346497633505','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Creme de riz (1) ;Crème caramel (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 14:31:34',NULL,'Read','N_NEW_ORDER','73161431339197629206',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7316143134782588022','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Creme de riz (1) ;Crème caramel (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 14:31:34',NULL,'Read','N_NEW_ORDER','73161431339197629206',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7316194567089206730','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 19:45:06',NULL,'Read','N_NEW_ORDER','73161945567866516850',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161945685652249299','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 19:45:06',NULL,'Read','N_NEW_ORDER','73161945567866516850',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7316194573158645778','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 19:45:07',NULL,'Read','N_NEW_ORDER','73161945567866516850',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7316195058381483469','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 19:50:58',NULL,'Read','N_NEW_ORDER','73161950575036265198',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161950586082572866','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 19:50:58',NULL,'Read','N_NEW_ORDER','73161950575036265198',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161950587442058190','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 19:50:58',NULL,'Read','N_NEW_ORDER','73161950575036265198',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161957514033977593','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bavaroise aux fruits (1) ;Crème caramel (1) ;Abolo (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Quaker (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 19:57:51',NULL,'Read','N_NEW_ORDER','73161957505568231472',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161957516265242331','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bavaroise aux fruits (1) ;Crème caramel (1) ;Abolo (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Quaker (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 19:57:51',NULL,'Read','N_NEW_ORDER','73161957505568231472',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73161957518298415520','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bavaroise aux fruits (1) ;Crème caramel (1) ;Abolo (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Quaker (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 19:57:51',NULL,'Read','N_NEW_ORDER','73161957505568231472',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162004760611082086','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1) ;ATTIEKE (1) ;Quaker (1) ;Bande de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 20:00:47',NULL,'Read','N_NEW_ORDER','73162004676170975453',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162004774882117007','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;ATTIEKE (1) ;Quaker (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 20:00:47',NULL,'Read','N_NEW_ORDER','73162004676170975453',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7316200478671242977','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;ATTIEKE (1) ;Quaker (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 20:00:47',NULL,'Read','N_NEW_ORDER','73162004676170975453',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162013048433068068','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Beurre (1) ;Crème caramel (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 20:01:30',NULL,'Read','N_NEW_ORDER','73162012977568531001',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162013060116304787','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Crème caramel (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 20:01:30',NULL,'Read','N_NEW_ORDER','73162012977568531001',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162013073876695270','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Crème caramel (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 20:01:30',NULL,'Read','N_NEW_ORDER','73162012977568531001',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162015236060339796','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bouillie de riz (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 20:15:02',NULL,'Read','N_NEW_ORDER','73162015179362886151',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162015249554627878','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bouillie de riz (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 20:15:02',NULL,'Read','N_NEW_ORDER','73162015179362886151',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162015259879998211','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bouillie de riz (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 20:15:02',NULL,'Read','N_NEW_ORDER','73162015179362886151',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162034819053539838','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Beurre (1) ;Bavaroise aux fruits (1) ;Creme de riz (1) ;Crème caramel (1) ;Abolo (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Quaker (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 20:03:48',NULL,'Read','N_NEW_ORDER','7316203476312057251',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162034830778136835','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Bavaroise aux fruits (1) ;Creme de riz (1) ;Crème caramel (1) ;Abolo (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Quaker (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 20:03:48',NULL,'Read','N_NEW_ORDER','7316203476312057251',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162034843639447505','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Bavaroise aux fruits (1) ;Creme de riz (1) ;Crème caramel (1) ;Abolo (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Quaker (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 20:03:48',NULL,'Read','N_NEW_ORDER','7316203476312057251',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162039415346433861','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Creme de riz (1) ;Crème caramel (1) ;Abolo (1) ;Bavaroise aux fruits (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Quaker (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 20:39:41',NULL,'Read','N_NEW_ORDER','73162039399184214712',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162039417373189593','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Creme de riz (1) ;Crème caramel (1) ;Abolo (1) ;Bavaroise aux fruits (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Quaker (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 20:39:41',NULL,'Read','N_NEW_ORDER','73162039399184214712',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162039419344385525','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Creme de riz (1) ;Crème caramel (1) ;Abolo (1) ;Bavaroise aux fruits (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Quaker (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 20:39:41',NULL,'Read','N_NEW_ORDER','73162039399184214712',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162049404918115398','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Beurre (1) ;Bavaroise aux fruits (1) ;Creme de riz (1) ;Abolo (1) ;Quaker (1) ;Bande de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 20:49:40',NULL,'Read','N_NEW_ORDER','73162049393899480139',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162049406627739859','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Bavaroise aux fruits (1) ;Creme de riz (1) ;Abolo (1) ;Quaker (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 20:49:40',NULL,'Read','N_NEW_ORDER','73162049393899480139',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162049407952835751','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Bavaroise aux fruits (1) ;Creme de riz (1) ;Abolo (1) ;Quaker (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 20:49:40',NULL,'Read','N_NEW_ORDER','73162049393899480139',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162075235715596198','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Beurre (1) ;Bavaroise aux fruits (1) ;Creme de riz (1) ;Crème caramel (1) ;Abolo (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Quaker (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-16 20:07:52',NULL,'Read','N_NEW_ORDER','73162075129237956606',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162075246085105347','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Bavaroise aux fruits (1) ;Creme de riz (1) ;Crème caramel (1) ;Abolo (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Quaker (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-16 20:07:52',NULL,'Read','N_NEW_ORDER','73162075129237956606',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73162075266675218894','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Bavaroise aux fruits (1) ;Creme de riz (1) ;Crème caramel (1) ;Abolo (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Quaker (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-16 20:07:52',NULL,'Read','N_NEW_ORDER','73162075129237956606',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201024272399188682','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 10:24:27',NULL,'Read','N_NEW_ORDER','73201024266677317435',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201024273868285196','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 10:24:27',NULL,'Read','N_NEW_ORDER','73201024266677317435',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201024275553480112','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 10:24:27',NULL,'Read','N_NEW_ORDER','73201024266677317435',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201044211358501400','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bouillie de riz (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 10:44:21',NULL,'Read','N_NEW_ORDER','73201044206093862334',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201044212355723827','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bouillie de riz (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 10:44:21',NULL,'Read','N_NEW_ORDER','73201044206093862334',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201044213822644142','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bouillie de riz (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 10:44:21',NULL,'Read','N_NEW_ORDER','73201044206093862334',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201044466738269161','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Thé-lait (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 10:44:46',NULL,'Read','N_NEW_ORDER','73201044462439765319',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201044471211882355','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Thé-lait (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 10:44:47',NULL,'Read','N_NEW_ORDER','73201044462439765319',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7320104447541587278','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Thé-lait (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 10:44:47',NULL,'Read','N_NEW_ORDER','73201044462439765319',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201045205973456919','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 10:45:20',NULL,'Read','N_NEW_ORDER','73201045201977028911',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201045207283157322','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 10:45:20',NULL,'Read','N_NEW_ORDER','73201045201977028911',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201045209136708741','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 10:45:20',NULL,'Read','N_NEW_ORDER','73201045201977028911',NULL,NULL,NULL,NULL,NULL,NULL);
COMMIT;

/* Data for the `t_notification` table  (LIMIT 500,500) */

INSERT INTO `t_notification` (`lg_ID`, `lg_USER_ID_IN`, `lg_USER_ID_OUT`, `str_DESCRIPTION`, `str_CONTENT`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`, `str_TYPE`, `str_REF_RESSOURCE`, `str_CUST_ACCOUNT_ID`, `str_URL_PIC`, `str_NAME`, `str_CHANNEL`, `str_CHANNEL_READ`, `str_GPS`) VALUES
  ('73201049513281822998','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 10:49:51',NULL,'Read','N_NEW_ORDER','73201049509094827951',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201049515312505445','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 10:49:51',NULL,'Read','N_NEW_ORDER','73201049509094827951',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201049516319564265','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 10:49:51',NULL,'Read','N_NEW_ORDER','73201049509094827951',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201051579351043820','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 10:51:57',NULL,'Read','N_NEW_ORDER','73201051572857986252','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('7320105158158421588','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 10:51:58',NULL,'Read','N_NEW_ORDER','73201051572857986252','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73201051585189903726','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 10:51:58',NULL,'Read','N_NEW_ORDER','73201051572857986252','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73201055531372723493','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 10:55:53',NULL,'Read','N_NEW_ORDER','73201055521407201617','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73201055534117392487','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 10:55:53',NULL,'Read','N_NEW_ORDER','73201055521407201617','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73201055536386729650','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 10:55:53',NULL,'Read','N_NEW_ORDER','73201055521407201617','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73201056407469499790','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 10:56:40',NULL,'Read','N_NEW_ORDER','73201056399654490484','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73201056409306469538','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 10:56:40',NULL,'Read','N_NEW_ORDER','73201056399654490484','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73201056416190145400','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 10:56:41',NULL,'Read','N_NEW_ORDER','73201056399654490484','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73201057382924954251','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 10:57:38',NULL,'Read','N_NEW_ORDER','73201057374381853166','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73201057384924343281','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 10:57:38',NULL,'Read','N_NEW_ORDER','73201057374381853166','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73201057386395875260','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 10:57:38',NULL,'Read','N_NEW_ORDER','73201057374381853166','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73201119247323317128','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 11:19:02',NULL,'Read','N_NEW_ORDER','73201119188821943124','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73201119275853031662','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 11:19:02',NULL,'Read','N_NEW_ORDER','73201119188821943124','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('7320111929379860282','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 11:19:02',NULL,'Read','N_NEW_ORDER','73201119188821943124','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73201151184946201991','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 11:51:18',NULL,'UnRead','N_NEW_ORDER','73201151171486424455',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201151187933944660','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 11:51:18',NULL,'Read','N_NEW_ORDER','73201151171486424455','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73201151189967177110','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 11:51:18',NULL,'UnRead','N_NEW_ORDER','73201151171486424455',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201214541522508183','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 12:14:54',NULL,'Read','N_NEW_ORDER','73201214533446041587','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73201214543731303162','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 12:14:54',NULL,'Read','N_NEW_ORDER','73201214533446041587','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73201214545039216133','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 12:14:54',NULL,'UnRead','N_NEW_ORDER','73201214533446041587',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201232232618901641','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 12:32:23',NULL,'Read','N_NEW_ORDER','7320123222418246194','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73201232233972985795','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 12:32:23',NULL,'UnRead','N_NEW_ORDER','7320123222418246194',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201232235135119383','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 12:32:23',NULL,'UnRead','N_NEW_ORDER','7320123222418246194',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201235247115367246','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 12:35:24',NULL,'UnRead','N_NEW_ORDER','73201235249462388849',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201235248792827245','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 12:35:24',NULL,'UnRead','N_NEW_ORDER','73201235249462388849',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201235252612729191','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 12:35:25',NULL,'Read','N_NEW_ORDER','73201235249462388849','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73201236183125696227','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 12:36:18',NULL,'UnRead','N_NEW_ORDER','73201236177475084669',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201236185136562432','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 12:36:18',NULL,'UnRead','N_NEW_ORDER','73201236177475084669',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201236186446677457','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 12:36:18',NULL,'UnRead','N_NEW_ORDER','73201236177475084669',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201248115985213891','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 12:48:11',NULL,'UnRead','N_NEW_ORDER','73201248116882783958',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201248117339259850','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 12:48:11',NULL,'UnRead','N_NEW_ORDER','73201248116882783958',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201248119149691209','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 12:48:11',NULL,'UnRead','N_NEW_ORDER','73201248116882783958',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201250486960045626','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 12:50:04',NULL,'UnRead','N_NEW_ORDER','73201250439134644356',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201250535472866392','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 12:50:05',NULL,'Read','N_NEW_ORDER','73201250439134644356','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('7320125059161622629','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 12:50:05',NULL,'UnRead','N_NEW_ORDER','73201250439134644356',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201252199709504409','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 12:52:19',NULL,'Read','N_NEW_ORDER','73201252194533744536','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73201252203175213422','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 12:52:20',NULL,'UnRead','N_NEW_ORDER','73201252194533744536',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201252205422180354','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 12:52:20',NULL,'UnRead','N_NEW_ORDER','73201252194533744536',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201264375575655487','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 12:06:43',NULL,'UnRead','N_NEW_ORDER','73201264282336293490',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7320126439242586013','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 12:06:43',NULL,'UnRead','N_NEW_ORDER','73201264282336293490',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201264412456716718','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 12:06:44',NULL,'UnRead','N_NEW_ORDER','73201264282336293490',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201312678627772886','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 13:01:26',NULL,'UnRead','N_NEW_ORDER','73201312559680727846',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201312687614971207','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 13:12:06',NULL,'Read','N_NEW_ORDER','73201312639488023660',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201312711297674563','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 13:12:07',NULL,'Read','N_NEW_ORDER','73201312639488023660',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7320131272122219616','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 13:12:07',NULL,'Read','N_NEW_ORDER','73201312639488023660',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7320131273341720277','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 13:01:27',NULL,'UnRead','N_NEW_ORDER','73201312559680727846',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7320131273494419494','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 13:01:27',NULL,'UnRead','N_NEW_ORDER','73201312559680727846',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201352837053098235','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 13:05:28',NULL,'UnRead','N_NEW_ORDER','73201352754735694894',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73201352863266304894','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 13:05:28',NULL,'UnRead','N_NEW_ORDER','73201352754735694894',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7320135286977615118','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 13:05:28',NULL,'UnRead','N_NEW_ORDER','73201352754735694894',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7320942197744064685','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bavaroise aux fruits (1) ;Creme de riz (1) ;Bande de fruits (1) ;Quaker (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 09:42:19',NULL,'Read','N_NEW_ORDER','732094216673433520',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73209422028986179636','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bavaroise aux fruits (1) ;Creme de riz (1) ;Bande de fruits (1) ;Quaker (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 09:42:20',NULL,'Read','N_NEW_ORDER','732094216673433520',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73209422054852648847','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bavaroise aux fruits (1) ;Creme de riz (1) ;Bande de fruits (1) ;Quaker (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 09:42:20',NULL,'Read','N_NEW_ORDER','732094216673433520',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73209473869722645740','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Bande de fruits (1) ;Quaker (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 09:47:38',NULL,'Read','N_NEW_ORDER','73209473770156435124',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73209473892294675289','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Quaker (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 09:47:38',NULL,'Read','N_NEW_ORDER','73209473770156435124',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73209473915036072993','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Quaker (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 09:47:39',NULL,'Read','N_NEW_ORDER','73209473770156435124',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73209483074437315053','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Creme de riz (1) ;Abolo (1) ;Beurre (1) ;Quaker (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-20 09:48:30',NULL,'Read','N_NEW_ORDER','73209482889042905581',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73209483089117945739','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Creme de riz (1) ;Abolo (1) ;Beurre (1) ;Quaker (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-20 09:48:30',NULL,'Read','N_NEW_ORDER','73209482889042905581',NULL,NULL,NULL,NULL,NULL,NULL),
  ('732094831682065310','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Creme de riz (1) ;Abolo (1) ;Beurre (1) ;Quaker (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-20 09:48:31',NULL,'Read','N_NEW_ORDER','73209482889042905581',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73212157488679216269','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Tagliatelle (1) ;Tarte aux pommes  (1) ;Tarte au citron (1) ;Croissant (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-21 21:57:48',NULL,'UnRead','N_NEW_ORDER','73212157472122370305',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73212157491744444812','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Tagliatelle (1) ;Tarte aux pommes  (1) ;Tarte au citron (1) ;Croissant (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-21 21:57:49',NULL,'UnRead','N_NEW_ORDER','73212157472122370305',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73212157494057617652','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Tagliatelle (1) ;Tarte aux pommes  (1) ;Tarte au citron (1) ;Croissant (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-21 21:57:49',NULL,'UnRead','N_NEW_ORDER','73212157472122370305',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73212244430754452124','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Pintade sautée (1) ;Thé-lait (1) ;Thé (1) ;Tarte aux pommes  (1) ;Tarte au citron (1) ;Tagliatelle (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-21 22:04:44',NULL,'UnRead','N_NEW_ORDER','73212244336066758492',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73212244444280114463','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Pintade sautée (1) ;Thé-lait (1) ;Thé (1) ;Tarte aux pommes  (1) ;Tarte au citron (1) ;Tagliatelle (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-21 22:04:44',NULL,'UnRead','N_NEW_ORDER','73212244336066758492',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73212244459841796084','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Pintade sautée (1) ;Thé-lait (1) ;Thé (1) ;Tarte aux pommes  (1) ;Tarte au citron (1) ;Tagliatelle (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-21 22:04:44',NULL,'UnRead','N_NEW_ORDER','73212244336066758492',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73222324153561037658','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-22 23:24:15',NULL,'UnRead','N_NEW_ORDER','73222324146318866498',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73222324155945897537','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-22 23:24:15',NULL,'UnRead','N_NEW_ORDER','73222324146318866498',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73222324157419857703','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-22 23:24:15',NULL,'UnRead','N_NEW_ORDER','73222324146318866498',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73222326109245070882','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Pintade sautée (1) ;Thé-lait (1) ;Thé (1) ;Tarte aux pommes  (1) ;Pizza (1) ;Tarte au citron (1) ;Tagliatelle (1) ;Poisson au four (1) ;Poisson à l''ivoirienne (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-22 23:26:10',NULL,'UnRead','N_NEW_ORDER','73222326968985191201',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73222326111935801797','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Pintade sautée (1) ;Thé-lait (1) ;Thé (1) ;Tarte aux pommes  (1) ;Pizza (1) ;Tarte au citron (1) ;Tagliatelle (1) ;Poisson au four (1) ;Poisson à l''ivoirienne (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-22 23:26:11',NULL,'UnRead','N_NEW_ORDER','73222326968985191201',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73222326115551447512','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Pintade sautée (1) ;Thé-lait (1) ;Thé (1) ;Tarte aux pommes  (1) ;Pizza (1) ;Tarte au citron (1) ;Tagliatelle (1) ;Poisson au four (1) ;Poisson à l''ivoirienne (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-22 23:26:11',NULL,'UnRead','N_NEW_ORDER','73222326968985191201',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73222327252152934871','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson au four (1) ;Poisson à l''ivoirienne (1) ;Pizza (1) ;Pintade sautée (1) ;Thé-lait (1) ;Tarte aux pommes  (1) ;Tarte au citron (1) ;Tagliatelle (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-22 23:27:25',NULL,'UnRead','N_NEW_ORDER','73222327239965326861',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73222327254009696760','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson au four (1) ;Poisson à l''ivoirienne (1) ;Pizza (1) ;Pintade sautée (1) ;Thé-lait (1) ;Tarte aux pommes  (1) ;Tarte au citron (1) ;Tagliatelle (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-22 23:27:25',NULL,'UnRead','N_NEW_ORDER','73222327239965326861',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73222327254622803749','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson au four (1) ;Poisson à l''ivoirienne (1) ;Pizza (1) ;Pintade sautée (1) ;Thé-lait (1) ;Tarte aux pommes  (1) ;Tarte au citron (1) ;Tagliatelle (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-22 23:27:25',NULL,'UnRead','N_NEW_ORDER','73222327239965326861',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73222335163935651895','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1) ;ATTIEKE (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-22 23:35:01',NULL,'UnRead','N_NEW_ORDER','73222335086952967538',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7322233517866675310','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-22 23:35:01',NULL,'UnRead','N_NEW_ORDER','73222335086952967538',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73222335195213394927','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-22 23:35:01',NULL,'UnRead','N_NEW_ORDER','73222335086952967538',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73222357167803755291','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-22 23:57:16',NULL,'UnRead','N_NEW_ORDER','73222357137343911436',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73222357173317182109','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-22 23:57:17',NULL,'UnRead','N_NEW_ORDER','73222357137343911436',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73222357177792695503','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-22 23:57:17',NULL,'UnRead','N_NEW_ORDER','73222357137343911436',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73230243937595863372','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Quaker (1) ;Beurre (1) ;Bavaroise aux fruits (1) ;Abolo (1) ;Bande de fruits (1) ;ATTIEKE (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-23 00:24:39',NULL,'UnRead','N_NEW_ORDER','73230243858011213190',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73230243961180617008','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Quaker (1) ;Beurre (1) ;Bavaroise aux fruits (1) ;Abolo (1) ;Bande de fruits (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-23 00:24:39',NULL,'UnRead','N_NEW_ORDER','73230243858011213190',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73230243971167621061','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Quaker (1) ;Beurre (1) ;Bavaroise aux fruits (1) ;Abolo (1) ;Bande de fruits (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-23 00:24:39',NULL,'UnRead','N_NEW_ORDER','73230243858011213190',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7323025112413359664','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-23 00:25:11',NULL,'UnRead','N_NEW_ORDER','73230251074932383334',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7323025113267323266','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-23 00:25:11',NULL,'UnRead','N_NEW_ORDER','73230251074932383334',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73230251142642368268','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-23 00:25:11',NULL,'UnRead','N_NEW_ORDER','73230251074932383334',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271519499681168950','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-27 15:19:49',NULL,'UnRead','N_NEW_ORDER','73271519477455888425',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271519503252466937','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-27 15:19:50',NULL,'UnRead','N_NEW_ORDER','73271519477455888425',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271519505228398608','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-27 15:19:50',NULL,'UnRead','N_NEW_ORDER','73271519477455888425',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271520165399248637','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-27 15:20:16',NULL,'UnRead','N_NEW_ORDER','73271520156539302585',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271520167879084451','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-27 15:20:16',NULL,'UnRead','N_NEW_ORDER','73271520156539302585',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271520169731294385','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-27 15:20:16',NULL,'UnRead','N_NEW_ORDER','73271520156539302585',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271520275226159502','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-27 15:20:27',NULL,'UnRead','N_NEW_ORDER','73271520263342087524',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271520278479872457','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-27 15:20:27',NULL,'UnRead','N_NEW_ORDER','73271520263342087524',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271520284082282544','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-27 15:20:28',NULL,'UnRead','N_NEW_ORDER','73271520263342087524',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271520426014939255','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Tagliatelle (1) ;Tarte aux pommes  (1) ;Tarte au citron (1) ;Croissant (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-27 15:20:04',NULL,'UnRead','N_NEW_ORDER','73271520246846031773',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271520450674873389','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Tagliatelle (1) ;Tarte aux pommes  (1) ;Tarte au citron (1) ;Croissant (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-27 15:20:04',NULL,'UnRead','N_NEW_ORDER','73271520246846031773',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7327152049561734131','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (1) ;Tagliatelle (1) ;Tarte aux pommes  (1) ;Tarte au citron (1) ;Croissant (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-27 15:20:04',NULL,'UnRead','N_NEW_ORDER','73271520246846031773',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271521311058016328','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Pintade sautée (1) ;Thé-lait (1) ;Tarte aux pommes  (1) ;Tarte au citron (1) ;Tagliatelle (1) ;Pizza (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-27 15:21:31',NULL,'UnRead','N_NEW_ORDER','73271521298597868468',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271521313016018617','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Pintade sautée (1) ;Thé-lait (1) ;Tarte aux pommes  (1) ;Tarte au citron (1) ;Tagliatelle (1) ;Pizza (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-27 15:21:31',NULL,'UnRead','N_NEW_ORDER','73271521298597868468',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271521314742495143','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Pintade sautée (1) ;Thé-lait (1) ;Tarte aux pommes  (1) ;Tarte au citron (1) ;Tagliatelle (1) ;Pizza (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-27 15:21:31',NULL,'UnRead','N_NEW_ORDER','73271521298597868468',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271521414949192696','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-27 15:21:41',NULL,'UnRead','N_NEW_ORDER','73271521408697029993',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271521416914145498','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-27 15:21:41',NULL,'UnRead','N_NEW_ORDER','73271521408697029993',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271521418075531378','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-27 15:21:41',NULL,'UnRead','N_NEW_ORDER','73271521408697029993',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271613391527362190','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (1) ;Tagliatelle (1) ;Croissant (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-27 16:13:39',NULL,'UnRead','N_NEW_ORDER','73271613384806051544',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271613392835553926','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Tagliatelle (1) ;Croissant (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-27 16:13:39',NULL,'UnRead','N_NEW_ORDER','73271613384806051544',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271613394376594763','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Tagliatelle (1) ;Croissant (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-27 16:13:39',NULL,'UnRead','N_NEW_ORDER','73271613384806051544',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271619237919605442','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Café-lait (1) ;Café (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-27 16:19:23',NULL,'UnRead','N_NEW_ORDER','73271619231135214796',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271619239038318800','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Café-lait (1) ;Café (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-27 16:19:23',NULL,'UnRead','N_NEW_ORDER','73271619231135214796',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7327161924765272252','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Café-lait (1) ;Café (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-27 16:19:24',NULL,'UnRead','N_NEW_ORDER','73271619231135214796',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271619474711668387','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Carotte rapée (1) ;Café-lait (1) ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-27 16:19:47',NULL,'UnRead','N_NEW_ORDER','73271619468799065735',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271619476088547997','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Carotte rapée (1) ;Café-lait (1) ;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-27 16:19:47',NULL,'UnRead','N_NEW_ORDER','73271619468799065735',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271619477565190257','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Carotte rapée (1) ;Café-lait (1) ;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-27 16:19:47',NULL,'UnRead','N_NEW_ORDER','73271619468799065735',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271634535389376284','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1) ;Café-lait (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-27 16:34:53',NULL,'UnRead','N_NEW_ORDER','73271634517905315648',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73271634537773809538','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1) ;Café-lait (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-27 16:34:53',NULL,'UnRead','N_NEW_ORDER','73271634517905315648',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7327163454118603078','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1) ;Café-lait (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-27 16:34:54',NULL,'UnRead','N_NEW_ORDER','73271634517905315648',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7327168615214426837','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Pintade sautée (1) ;Thé-lait (1) ;Tagliatelle (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-27 16:08:06',NULL,'UnRead','N_NEW_ORDER','732716851054604140',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7327168640524325155','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Pintade sautée (1) ;Thé-lait (1) ;Tagliatelle (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-27 16:08:06',NULL,'UnRead','N_NEW_ORDER','732716851054604140',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7327168654969149304','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Pintade sautée (1) ;Thé-lait (1) ;Tagliatelle (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-27 16:08:06',NULL,'UnRead','N_NEW_ORDER','732716851054604140',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73272151313577727893','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bavaroise aux fruits (1) ;ATTIEKE (1) ;Abolo (1) ;Bande de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-27 21:51:03',NULL,'UnRead','N_NEW_ORDER','7327215117543366689',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73272151345421805835','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bavaroise aux fruits (1) ;ATTIEKE (1) ;Abolo (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-27 21:51:03',NULL,'UnRead','N_NEW_ORDER','7327215117543366689',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73272151365657651293','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bavaroise aux fruits (1) ;ATTIEKE (1) ;Abolo (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-27 21:51:03',NULL,'UnRead','N_NEW_ORDER','7327215117543366689',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73272151577445383869','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1) ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-27 21:51:57',NULL,'UnRead','N_NEW_ORDER','73272151578657568005',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73272151578945111502','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-27 21:51:57',NULL,'UnRead','N_NEW_ORDER','73272151578657568005',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73272151582453335211','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-27 21:51:58',NULL,'UnRead','N_NEW_ORDER','73272151578657568005',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73272152245526219916','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bavaroise aux fruits (1) ;Bande de fruits (1) ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-27 21:52:24',NULL,'UnRead','N_NEW_ORDER','73272152236801767962',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73272152246834299256','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bavaroise aux fruits (1) ;Bande de fruits (1) ;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-27 21:52:24',NULL,'UnRead','N_NEW_ORDER','73272152236801767962',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73272152248151252690','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bavaroise aux fruits (1) ;Bande de fruits (1) ;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-27 21:52:24',NULL,'UnRead','N_NEW_ORDER','73272152236801767962',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73272152551863781818','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Carotte rapée (1) ;Café-lait (1) ;Café (1) ;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-27 21:52:55',NULL,'UnRead','N_NEW_ORDER','73272152541494279659',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73272152553019131841','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Carotte rapée (1) ;Café-lait (1) ;Café (1) ;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-27 21:52:55',NULL,'UnRead','N_NEW_ORDER','73272152541494279659',NULL,NULL,NULL,NULL,NULL,NULL),
  ('732721525589525920','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Carotte rapée (1) ;Café-lait (1) ;Café (1) ;Bande de fruits (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-27 21:52:55',NULL,'UnRead','N_NEW_ORDER','73272152541494279659',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73272153229172221276','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Carotte rapée (1) ;Café-lait (1) ;Café (1) ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-27 21:53:22',NULL,'UnRead','N_NEW_ORDER','73272153221221676695',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73272153231267489300','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Carotte rapée (1) ;Café-lait (1) ;Café (1) ;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-27 21:53:23',NULL,'UnRead','N_NEW_ORDER','73272153221221676695',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73272153231652277372','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Carotte rapée (1) ;Café-lait (1) ;Café (1) ;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-27 21:53:23',NULL,'UnRead','N_NEW_ORDER','73272153221221676695',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73272153512452449376','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Carotte rapée (1) ;Café-lait (1) ;Café (1) ;Bavaroise aux fruits (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-27 21:53:51',NULL,'UnRead','N_NEW_ORDER','73272153504833577400',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73272153514027441839','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Carotte rapée (1) ;Café-lait (1) ;Café (1) ;Bavaroise aux fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-27 21:53:51',NULL,'UnRead','N_NEW_ORDER','73272153504833577400',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73272153515108064118','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Carotte rapée (1) ;Café-lait (1) ;Café (1) ;Bavaroise aux fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-27 21:53:51',NULL,'UnRead','N_NEW_ORDER','73272153504833577400',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73282246523731908864','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-28 22:46:52',NULL,'UnRead','N_NEW_ORDER','73282246515169099166',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7328224652636477860','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-28 22:46:52',NULL,'UnRead','N_NEW_ORDER','73282246515169099166',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73282246527745651656','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-28 22:46:52',NULL,'UnRead','N_NEW_ORDER','73282246515169099166',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73282253174376217913','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1) ;Bande de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-28 22:53:17',NULL,'UnRead','N_NEW_ORDER','73282253168047337993',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73282253175622032885','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-28 22:53:17',NULL,'UnRead','N_NEW_ORDER','73282253168047337993',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73282253176876525155','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-28 22:53:17',NULL,'UnRead','N_NEW_ORDER','73282253168047337993',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73282391681795094050','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-28 23:09:16',NULL,'UnRead','N_NEW_ORDER','73282391616227297453',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73282391694174464615','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-28 23:09:16',NULL,'UnRead','N_NEW_ORDER','73282391616227297453',NULL,NULL,NULL,NULL,NULL,NULL),
  ('732823917625969061','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-28 23:09:17',NULL,'UnRead','N_NEW_ORDER','73282391616227297453',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73290303732547335086','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 00:30:37',NULL,'UnRead','N_NEW_ORDER','73290303542490081979',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73290303749452294667','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 00:30:37',NULL,'UnRead','N_NEW_ORDER','73290303542490081979',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329030375111248521','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 00:30:37',NULL,'UnRead','N_NEW_ORDER','73290303542490081979',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73290452492480532047','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 00:45:24',NULL,'UnRead','N_NEW_ORDER','73290452435595962098',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73290452518760387252','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 00:45:25',NULL,'UnRead','N_NEW_ORDER','73290452435595962098',NULL,NULL,NULL,NULL,NULL,NULL),
  ('732904525462396264','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 00:45:25',NULL,'UnRead','N_NEW_ORDER','73290452435595962098',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73290481493255402644','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 00:48:14',NULL,'UnRead','N_NEW_ORDER','73290481431319985413',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73290481518993214514','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 00:48:15',NULL,'UnRead','N_NEW_ORDER','73290481431319985413',NULL,NULL,NULL,NULL,NULL,NULL),
  ('732904815528905110','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 00:48:15',NULL,'UnRead','N_NEW_ORDER','73290481431319985413',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73290543648893526881','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Bande de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 00:54:36',NULL,'UnRead','N_NEW_ORDER','7329054369369834520',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73290543664425627868','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 00:54:36',NULL,'UnRead','N_NEW_ORDER','7329054369369834520',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73290543675563461122','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 00:54:36',NULL,'UnRead','N_NEW_ORDER','7329054369369834520',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73290583641386894815','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1) ;Bande de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 00:58:36',NULL,'UnRead','N_NEW_ORDER','73290583590783793164',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73290583651910441758','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 00:58:36',NULL,'UnRead','N_NEW_ORDER','73290583590783793164',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73290583665989367007','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 00:58:36',NULL,'UnRead','N_NEW_ORDER','73290583590783793164',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291011112572852680','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 10:11:11',NULL,'Read','N_NEW_ORDER','7329101110616525850',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291011115778273648','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 10:11:11',NULL,'Read','N_NEW_ORDER','7329101110616525850',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329101111642406318','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 10:11:11',NULL,'Read','N_NEW_ORDER','7329101110616525850',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329101177173690973','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 10:11:07',NULL,'Read','N_NEW_ORDER','73291011715915613632',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291011791769656303','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 10:11:07',NULL,'Read','N_NEW_ORDER','73291011715915613632',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329101181321274655','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 10:11:08',NULL,'Read','N_NEW_ORDER','73291011715915613632',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291011953573388338','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 10:11:09',NULL,'Read','N_NEW_ORDER','73291011893227977996',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291011964920451891','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 10:11:09',NULL,'Read','N_NEW_ORDER','73291011893227977996',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291011986984053712','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 10:11:09',NULL,'Read','N_NEW_ORDER','73291011893227977996',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329104734988678507','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 01:00:47',NULL,'UnRead','N_NEW_ORDER','732910468618899929',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329104747258881516','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 01:00:47',NULL,'UnRead','N_NEW_ORDER','732910468618899929',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329104757873157482','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 01:00:47',NULL,'UnRead','N_NEW_ORDER','732910468618899929',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291181516159103291','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 01:18:15',NULL,'UnRead','N_NEW_ORDER','73291181461175122379',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291181529931602884','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 01:18:15',NULL,'UnRead','N_NEW_ORDER','73291181461175122379',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329118154277707704','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 01:18:15',NULL,'UnRead','N_NEW_ORDER','73291181461175122379',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329120269216232801','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 01:20:02',NULL,'UnRead','N_NEW_ORDER','7329120224550074320',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329120281067644905','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 01:20:02',NULL,'UnRead','N_NEW_ORDER','7329120224550074320',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329120291422708822','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 01:20:02',NULL,'UnRead','N_NEW_ORDER','7329120224550074320',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329121516040702702','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 01:21:05',NULL,'Read','N_NEW_ORDER','7329121472084569067',NULL,NULL,NULL,NULL,NULL,NULL),
  ('732912152588617790','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 01:21:05',NULL,'Read','N_NEW_ORDER','7329121472084569067',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329121535771976658','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 01:21:05',NULL,'Read','N_NEW_ORDER','7329121472084569067',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329123593561152152','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1) ;ATTIEKE (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 01:23:59',NULL,'Read','N_NEW_ORDER','73291235890487014096',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291235945820631181','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 01:23:59',NULL,'Read','N_NEW_ORDER','73291235890487014096',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291235972115868013','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 01:23:59',NULL,'Read','N_NEW_ORDER','73291235890487014096',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329123811935051151','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 01:23:08',NULL,'Read','N_NEW_ORDER','7329123764423851499',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291238139482808','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 01:23:08',NULL,'Read','N_NEW_ORDER','7329123764423851499',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329123822742351176','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 01:23:08',NULL,'Read','N_NEW_ORDER','7329123764423851499',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291310319877396706','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1) ;Abolo1 (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 13:10:31',NULL,'UnRead','N_NEW_ORDER','73291310315843649439',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291310321877583266','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo1 (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 13:10:32',NULL,'UnRead','N_NEW_ORDER','73291310315843649439',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291310328760265122','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo1 (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 13:10:32',NULL,'UnRead','N_NEW_ORDER','73291310315843649439',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291310334168678996','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo1 (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 13:10:33',NULL,'UnRead','N_NEW_ORDER','73291310336295296493',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291310335164842314','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo1 (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 13:10:33',NULL,'UnRead','N_NEW_ORDER','73291310336295296493',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291310336165691933','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo1 (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 13:10:33',NULL,'UnRead','N_NEW_ORDER','73291310336295296493',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291310345275685324','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 13:10:34',NULL,'UnRead','N_NEW_ORDER','73291310341786190776',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291310346314810478','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 13:10:34',NULL,'UnRead','N_NEW_ORDER','73291310341786190776',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291310347528400391','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 13:10:34',NULL,'UnRead','N_NEW_ORDER','73291310341786190776',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291355817513925499','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1) ;Abolo1 (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 13:05:58',NULL,'UnRead','N_NEW_ORDER','7329135571662362589',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291355831533598529','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo1 (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 13:05:58',NULL,'UnRead','N_NEW_ORDER','7329135571662362589',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291355850077906613','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo1 (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 13:05:58',NULL,'UnRead','N_NEW_ORDER','7329135571662362589',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329136276489221118','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Bande de fruits (1) ;Abolo1 (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 13:06:27',NULL,'UnRead','N_NEW_ORDER','73291362688156166604',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329136277732189228','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Abolo1 (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 13:06:27',NULL,'UnRead','N_NEW_ORDER','73291362688156166604',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291362786832134443','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Abolo1 (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 13:06:27',NULL,'UnRead','N_NEW_ORDER','73291362688156166604',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73291764905487946','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 01:07:06',NULL,'Read','N_NEW_ORDER','732917611586192641','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('732917661423873701','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 01:07:06',NULL,'UnRead','N_NEW_ORDER','732917611586192641',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329176715869712','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 01:07:06',NULL,'Read','N_NEW_ORDER','732917611586192641','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('73299214847266399727','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Crème caramel (1) ;Croissant (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 09:21:48',NULL,'Read','N_NEW_ORDER','7329921476396926242',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73299214871166088511','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Crème caramel (1) ;Croissant (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 09:21:48',NULL,'Read','N_NEW_ORDER','7329921476396926242',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329921488161191694','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Crème caramel (1) ;Croissant (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 09:21:48',NULL,'Read','N_NEW_ORDER','7329921476396926242',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73299222550797028281','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Darne de poisson grillé (1) ;Creme de riz (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 09:22:25',NULL,'UnRead','N_NEW_ORDER','73299222484344504740',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73299222560832026393','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Darne de poisson grillé (1) ;Creme de riz (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 09:22:25',NULL,'UnRead','N_NEW_ORDER','73299222484344504740',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73299222571886509544','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Darne de poisson grillé (1) ;Creme de riz (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 09:22:25',NULL,'UnRead','N_NEW_ORDER','73299222484344504740',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329955221572564332','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 09:55:22',NULL,'Read','N_NEW_ORDER','732995521874169724',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73299552236051234974','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 09:55:22',NULL,'Read','N_NEW_ORDER','732995521874169724',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73299552250639187969','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 09:55:22',NULL,'Read','N_NEW_ORDER','732995521874169724',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73299552447646174389','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1) ;Bande de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 09:55:24',NULL,'Read','N_NEW_ORDER','73299552370698197325',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329955246011428509','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 09:55:24',NULL,'Read','N_NEW_ORDER','73299552370698197325',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329955247393301962','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 09:55:24',NULL,'Read','N_NEW_ORDER','73299552370698197325',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7329955266106849319','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-29 09:55:26',NULL,'Read','N_NEW_ORDER','73299552589284904903',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73299552735971657655','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-29 09:55:27',NULL,'Read','N_NEW_ORDER','73299552589284904903',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73299552813346636590','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-29 09:55:28',NULL,'Read','N_NEW_ORDER','73299552589284904903',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73301158813658441169','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Creme de riz (1) ;Bouillie de riz (1) ;Quaker (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-30 11:58:08',NULL,'UnRead','N_NEW_ORDER','73301158740843835733',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73301158838682408848','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Creme de riz (1) ;Bouillie de riz (1) ;Quaker (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-30 11:58:08',NULL,'UnRead','N_NEW_ORDER','73301158740843835733',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73301158857824134379','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Creme de riz (1) ;Bouillie de riz (1) ;Quaker (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-30 11:58:08',NULL,'UnRead','N_NEW_ORDER','73301158740843835733',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7330127507692051230','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Croissant (1) ;Creme de riz (1) ;Quaker (1) ;Jus de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-30 12:07:50',NULL,'UnRead','N_NEW_ORDER','733012750571252542',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73301275097857278906','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Croissant (1) ;Creme de riz (1) ;Quaker (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-30 12:07:50',NULL,'UnRead','N_NEW_ORDER','733012750571252542',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73301275113414598215','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Croissant (1) ;Creme de riz (1) ;Quaker (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-30 12:07:51',NULL,'UnRead','N_NEW_ORDER','733012750571252542',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73311075238294133','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Tarte au citron (1) ;Tarte aux pommes  (1) ;Thé-lait (1) ;Thé (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-31 10:07:05',NULL,'Read','N_NEW_ORDER','733110743414569045','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('7331107545711755412','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Tarte au citron (1) ;Tarte aux pommes  (1) ;Thé-lait (1) ;Thé (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-31 10:07:05',NULL,'UnRead','N_NEW_ORDER','733110743414569045',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7331107563725041292','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Tarte au citron (1) ;Tarte aux pommes  (1) ;Thé-lait (1) ;Thé (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-31 10:07:05',NULL,'UnRead','N_NEW_ORDER','733110743414569045',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73311122475431466688','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Hamberger (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-31 11:22:47',NULL,'UnRead','N_NEW_ORDER','73311122451306725848',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73311122478479998151','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Hamberger (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-31 11:22:47',NULL,'UnRead','N_NEW_ORDER','73311122451306725848',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73311122483676918199','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Hamberger (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-31 11:22:48',NULL,'UnRead','N_NEW_ORDER','73311122451306725848',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73323163893169355925','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-03-03 23:16:38',NULL,'UnRead','N_NEW_ORDER','7332316372929308309',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73323163936231122589','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-03-03 23:16:39',NULL,'UnRead','N_NEW_ORDER','7332316372929308309',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73323163966361483868','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-03-03 23:16:39',NULL,'UnRead','N_NEW_ORDER','7332316372929308309',NULL,NULL,NULL,NULL,NULL,NULL),
  ('73323164025051376989','31017105229982132919','42150222079569572824','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR SANDRA  ENDALLE','2017-03-03 23:16:40',NULL,'UnRead','N_NEW_ORDER','7332316372929308309',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7332316404824877149','31017105229982132919','42101057334294686','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR TEST  TEST','2017-03-03 23:16:40',NULL,'UnRead','N_NEW_ORDER','7332316372929308309',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74220294660728891790','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Hamberger (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-02 20:29:46',NULL,'UnRead','N_NEW_ORDER','74220293982615461185',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74220294871920678574','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Hamberger (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-02 20:29:48',NULL,'UnRead','N_NEW_ORDER','74220293982615461185',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74220294899181678139','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Hamberger (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-02 20:29:48',NULL,'UnRead','N_NEW_ORDER','74220293982615461185',NULL,NULL,NULL,NULL,NULL,NULL),
  ('742202957613861273','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Hamberger (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-02 20:29:57',NULL,'UnRead','N_NEW_ORDER','74220295590643767655',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74220295785611629296','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Hamberger (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-02 20:29:57',NULL,'UnRead','N_NEW_ORDER','74220295590643767655',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7422029583395134289','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Hamberger (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-02 20:29:58',NULL,'UnRead','N_NEW_ORDER','74220295590643767655',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7422031129547196922','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Carotte rapée (1) ;ATTIEKE (1) ;Abolo (1) ;Café-lait (1) ;Café (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-02 20:31:01',NULL,'UnRead','N_NEW_ORDER','74220305927173321922',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7422031152558589384','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Carotte rapée (1) ;ATTIEKE (1) ;Abolo (1) ;Café-lait (1) ;Café (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-02 20:31:01',NULL,'UnRead','N_NEW_ORDER','74220305927173321922',NULL,NULL,NULL,NULL,NULL,NULL),
  ('742203124086297051','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Carotte rapée (1) ;ATTIEKE (1) ;Abolo (1) ;Café-lait (1) ;Café (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-02 20:31:02',NULL,'UnRead','N_NEW_ORDER','74220305927173321922',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74241119165511697900','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1) ;Café-lait (1) ;Jus de fruits (1) ;Café (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-24 11:19:16',NULL,'UnRead','N_NEW_ORDER','74241119149091357463',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74241119168655853392','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;Café-lait (1) ;Jus de fruits (1) ;Café (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-24 11:19:16',NULL,'UnRead','N_NEW_ORDER','74241119149091357463',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7424111917546929281','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;Café-lait (1) ;Jus de fruits (1) ;Café (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-24 11:19:17',NULL,'UnRead','N_NEW_ORDER','74241119149091357463',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74242035241916948212','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1) ;Café-lait (1) ;Café (1) ;Jus de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-24 20:35:24',NULL,'UnRead','N_NEW_ORDER','74242035232194025436',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74242035243609694200','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;Café-lait (1) ;Café (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-24 20:35:24',NULL,'UnRead','N_NEW_ORDER','74242035232194025436',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74242035245132712891','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;Café-lait (1) ;Café (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-24 20:35:24',NULL,'UnRead','N_NEW_ORDER','74242035232194025436',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7424204471537978609','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1) ;Abolo (1) ;Café-lait (1) ;Café (1) ;Jus de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-24 20:44:07',NULL,'UnRead','N_NEW_ORDER','74242044639647723147',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7424204472915148691','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo (1) ;Café-lait (1) ;Café (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-24 20:44:07',NULL,'UnRead','N_NEW_ORDER','74242044639647723147',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74242044743551325296','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo (1) ;Café-lait (1) ;Café (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-24 20:44:07',NULL,'UnRead','N_NEW_ORDER','74242044639647723147',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74242319524602938566','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bavaroise aux fruits (1) ;Bande de fruits (1) ;Abolo (1) ;Café-lait (1) ;Café (1) ;Carotte rapée (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-24 23:19:52',NULL,'UnRead','N_NEW_ORDER','74242319502052319748',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74242319526954936908','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bavaroise aux fruits (1) ;Bande de fruits (1) ;Abolo (1) ;Café-lait (1) ;Café (1) ;Carotte rapée (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-24 23:19:52',NULL,'UnRead','N_NEW_ORDER','74242319502052319748',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74242319528627214430','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bavaroise aux fruits (1) ;Bande de fruits (1) ;Abolo (1) ;Café-lait (1) ;Café (1) ;Carotte rapée (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-24 23:19:52',NULL,'UnRead','N_NEW_ORDER','74242319502052319748',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74242326122352800159','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1) ;Abolo (1) ;Café-lait (1) ;Café (1) ;Bouillie de riz (1) ;Jus de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-24 23:26:12',NULL,'UnRead','N_NEW_ORDER','74242326107633891181',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74242326124874294211','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo (1) ;Café-lait (1) ;Café (1) ;Bouillie de riz (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-24 23:26:12',NULL,'UnRead','N_NEW_ORDER','74242326107633891181',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74242326126379399199','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo (1) ;Café-lait (1) ;Café (1) ;Bouillie de riz (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-24 23:26:12',NULL,'UnRead','N_NEW_ORDER','74242326107633891181',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74242328281469497141','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-24 23:28:28',NULL,'UnRead','N_NEW_ORDER','74242328272427613567',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74242328283053313998','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-24 23:28:28',NULL,'UnRead','N_NEW_ORDER','74242328272427613567',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74242328284324383355','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-24 23:28:28',NULL,'UnRead','N_NEW_ORDER','74242328272427613567',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74242339185004772941','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Darne de poisson grillé (1) ;Crème caramel (1) ;Croissant (1) ;Creme de riz (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-24 23:39:18',NULL,'UnRead','N_NEW_ORDER','74242339176517146922',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74242339186945151538','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Darne de poisson grillé (1) ;Crème caramel (1) ;Croissant (1) ;Creme de riz (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-24 23:39:18',NULL,'UnRead','N_NEW_ORDER','74242339176517146922',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74242339188178807441','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Darne de poisson grillé (1) ;Crème caramel (1) ;Croissant (1) ;Creme de riz (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-24 23:39:18',NULL,'UnRead','N_NEW_ORDER','74242339176517146922',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74252258565902370144','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-25 22:58:56',NULL,'UnRead','N_NEW_ORDER','74252258551562034214',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74252258569355048649','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-25 22:58:56',NULL,'UnRead','N_NEW_ORDER','74252258551562034214',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74252258577733485141','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-25 22:58:57',NULL,'UnRead','N_NEW_ORDER','74252258551562034214',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7426026451624403531','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Croissant (1) ;Beurre (1) ;Creme de riz (1) ;Bouillie de riz (1) ;Quaker (1) ;Jus de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-26 00:26:04',NULL,'UnRead','N_NEW_ORDER','7426026163475426471',NULL,NULL,NULL,NULL,NULL,NULL),
  ('742602649151254293','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Croissant (1) ;Beurre (1) ;Creme de riz (1) ;Bouillie de riz (1) ;Quaker (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-26 00:26:04',NULL,'UnRead','N_NEW_ORDER','7426026163475426471',NULL,NULL,NULL,NULL,NULL,NULL),
  ('742602656566144842','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Croissant (1) ;Beurre (1) ;Creme de riz (1) ;Bouillie de riz (1) ;Quaker (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-26 00:26:05',NULL,'UnRead','N_NEW_ORDER','7426026163475426471',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74315105395329827637','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Carotte rapée (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Café (1) ;Jus de fruits (1) ;Café-lait (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-03 15:10:53',NULL,'UnRead','N_NEW_ORDER','74315105238720046917',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74315105412438504414','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Carotte rapée (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Café (1) ;Jus de fruits (1) ;Café-lait (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-03 15:10:54',NULL,'UnRead','N_NEW_ORDER','74315105238720046917',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74315105429937083576','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Carotte rapée (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Café (1) ;Jus de fruits (1) ;Café-lait (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-03 15:10:54',NULL,'UnRead','N_NEW_ORDER','74315105238720046917',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74315183208922476','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Carotte rapée (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1) ;Café-lait (1) ;Café (1) ;Jus de fruits (1) ;Bavaroise aux fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-03 15:18:03',NULL,'Read','N_NEW_ORDER','7431518183755552290','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('743151833334211864','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Carotte rapée (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1) ;Café-lait (1) ;Café (1) ;Jus de fruits (1) ;Bavaroise aux fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-03 15:18:03',NULL,'UnRead','N_NEW_ORDER','7431518183755552290',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7431518340588282405','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Carotte rapée (1) ;ATTIEKE (1) ;Bande de fruits (1) ;Abolo (1) ;Café-lait (1) ;Café (1) ;Jus de fruits (1) ;Bavaroise aux fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-03 15:18:03',NULL,'UnRead','N_NEW_ORDER','7431518183755552290',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7431518624217084432','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Café (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-03 15:18:06',NULL,'UnRead','N_NEW_ORDER','7431518540821366297',NULL,NULL,NULL,NULL,NULL,NULL),
  ('743151863947975593','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Café (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-03 15:18:06',NULL,'UnRead','N_NEW_ORDER','7431518540821366297',NULL,NULL,NULL,NULL,NULL,NULL),
  ('743151868655173606','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Café (1) ;Jus de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-03 15:18:06',NULL,'UnRead','N_NEW_ORDER','7431518540821366297',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74315245194559179250','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Café (1) ;Jus de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-03 15:24:51',NULL,'Read','N_NEW_ORDER','74315245144948874848',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7431524521387173890','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Café (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-03 15:24:52',NULL,'Read','N_NEW_ORDER','74315245144948874848',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74315245223973518102','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Café (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-03 15:24:52',NULL,'Read','N_NEW_ORDER','74315245144948874848',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74315261315976182284','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1) ;Café-lait (1) ;Café (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-03 15:26:13',NULL,'UnRead','N_NEW_ORDER','74315261262722863762',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74315261328046344753','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;Café-lait (1) ;Café (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-03 15:26:13',NULL,'UnRead','N_NEW_ORDER','74315261262722863762',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74315261340528228175','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;Café-lait (1) ;Café (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-03 15:26:13',NULL,'UnRead','N_NEW_ORDER','74315261262722863762',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74410494408379367','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Café-lait (1) ;Café (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-04 10:49:04',NULL,'Read','N_NEW_ORDER','744104929159359355',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7441049454278108477','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1) ;Bande de fruits (1) ;Café-lait (1) ;Café (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-04 10:49:04',NULL,'Read','N_NEW_ORDER','744104929159359355',NULL,NULL,NULL,NULL,NULL,NULL),
  ('744104946363355913','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1) ;Bande de fruits (1) ;Café-lait (1) ;Café (1) ;Jus de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-04 10:49:04',NULL,'Read','N_NEW_ORDER','744104929159359355',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7441049588724558800','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-04 10:49:05',NULL,'UnRead','N_NEW_ORDER','7441049553291388947',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7441049614578502233','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-04 10:49:06',NULL,'UnRead','N_NEW_ORDER','7441049553291388947',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74410496532661283','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-04 10:49:06',NULL,'Read','N_NEW_ORDER','7441049553291388947','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('744104975594032985','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1) ;Café-lait (1) ;Jus de fruits (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-04 10:49:07',NULL,'UnRead','N_NEW_ORDER','7441049677413209286',NULL,NULL,NULL,NULL,NULL,NULL),
  ('744104976825116148','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Café-lait (1) ;Jus de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-04 10:49:07',NULL,'UnRead','N_NEW_ORDER','7441049677413209286',NULL,NULL,NULL,NULL,NULL,NULL),
  ('744104978273853285','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Café-lait (1) ;Jus de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-04 10:49:07',NULL,'UnRead','N_NEW_ORDER','7441049677413209286',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7441758462521541513','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Café (1) ;Bouillie de riz (1) ;Jus de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-04 17:58:46',NULL,'UnRead','N_NEW_ORDER','7441758452806232129',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74417584643661754001','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Café (1) ;Bouillie de riz (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-04 17:58:46',NULL,'UnRead','N_NEW_ORDER','7441758452806232129',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7441758465526555678','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Café (1) ;Bouillie de riz (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-04 17:58:46',NULL,'UnRead','N_NEW_ORDER','7441758452806232129',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74417593347248015395','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1) ;Jus de fruits (1) ;ATTIEKE (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-04 17:59:33',NULL,'UnRead','N_NEW_ORDER','7441759329181029629',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74417593358861217574','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;Jus de fruits (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-04 17:59:33',NULL,'UnRead','N_NEW_ORDER','7441759329181029629',NULL,NULL,NULL,NULL,NULL,NULL),
  ('74417593373524077580','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;Jus de fruits (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-04 17:59:33',NULL,'UnRead','N_NEW_ORDER','7441759329181029629',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7441759532525312023','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-04 17:59:05',NULL,'UnRead','N_NEW_ORDER','7441759488062818097',NULL,NULL,NULL,NULL,NULL,NULL),
  ('7441759544764509776','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-04 17:59:05',NULL,'UnRead','N_NEW_ORDER','7441759488062818097',NULL,NULL,NULL,NULL,NULL,NULL),
  ('744175955639076607','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-04 17:59:05',NULL,'Read','N_NEW_ORDER','7441759488062818097','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('74418181126150791168','42101057334294686','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1) ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-04-04 18:18:11',NULL,'Read','N_NEW_ORDER','7441818108602172456','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('74418181136187109244','42101057334294686','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-04-04 18:18:11',NULL,'UnRead','N_NEW_ORDER','7441818108602172456',NULL,NULL,NULL,NULL,NULL,NULL),
  ('744181811477926201','42101057334294686','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1) ;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-04-04 18:18:11',NULL,'UnRead','N_NEW_ORDER','7441818108602172456',NULL,NULL,NULL,NULL,NULL,NULL),
  ('78231149139216600525','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Beurre (1) ;Bouillie de riz (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-08-23 11:49:13',NULL,'UnRead','N_NEW_ORDER','78231149118598686505',NULL,NULL,NULL,NULL,NULL,NULL),
  ('78231149142255544882','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Bouillie de riz (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2017-08-23 11:49:14',NULL,'UnRead','N_NEW_ORDER','78231149118598686505',NULL,NULL,NULL,NULL,NULL,NULL),
  ('78231149144107687633','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Beurre (1) ;Bouillie de riz (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2017-08-23 11:49:14',NULL,'UnRead','N_NEW_ORDER','78231149118598686505',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8',NULL,NULL,'je veu baiser lol ububububu','UNE NOUVELLE COMMANDE  DE ;Jus de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2017-02-26 14:39:01',NULL,'Read',NULL,NULL,'84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('83241047306081143611','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 10:47:30',NULL,'UnRead','N_NEW_ORDER','83241047217778569863',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241047311486660721','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 10:47:31',NULL,'UnRead','N_NEW_ORDER','83241047217778569863',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241047314135333551','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 10:47:31',NULL,'UnRead','N_NEW_ORDER','83241047217778569863',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241047325609994331','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 10:47:32',NULL,'UnRead','N_NEW_ORDER','83241047326445363771',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241047326662055967','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 10:47:32',NULL,'UnRead','N_NEW_ORDER','83241047326445363771',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241047328097577915','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 10:47:32',NULL,'UnRead','N_NEW_ORDER','83241047326445363771',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241049524185349837','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Citronnelle (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 10:49:05',NULL,'UnRead','N_NEW_ORDER','83241049476395534561',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241049538467351786','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Citronnelle (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 10:49:05',NULL,'UnRead','N_NEW_ORDER','83241049476395534561',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8324104954872527019','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Citronnelle (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 10:49:05',NULL,'UnRead','N_NEW_ORDER','83241049476395534561',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241151229624649473','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 11:51:22',NULL,'UnRead','N_NEW_ORDER','83241151209186189209',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241151231798465565','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 11:51:23',NULL,'UnRead','N_NEW_ORDER','83241151209186189209',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241151233807749989','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 11:51:23',NULL,'UnRead','N_NEW_ORDER','83241151209186189209',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241151248381501776','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 11:51:24',NULL,'UnRead','N_NEW_ORDER','8324115124223808622',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241151252939309773','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 11:51:25',NULL,'UnRead','N_NEW_ORDER','8324115124223808622',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241151259735597777','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 11:51:25',NULL,'UnRead','N_NEW_ORDER','8324115124223808622',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241228138529541655','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Citronnelle (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 12:28:13',NULL,'UnRead','N_NEW_ORDER','83241228108359657419',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241228142985344482','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Citronnelle (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 12:28:14',NULL,'UnRead','N_NEW_ORDER','83241228108359657419',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241228145885570841','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Citronnelle (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 12:28:14',NULL,'UnRead','N_NEW_ORDER','83241228108359657419',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241413596199372498','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Citronnelle (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 14:13:59',NULL,'UnRead','N_NEW_ORDER','83241413577954325399',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241414020651074199','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Citronnelle (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 14:14:00',NULL,'UnRead','N_NEW_ORDER','83241413577954325399',NULL,NULL,NULL,NULL,NULL,NULL),
  ('832414140899741729','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Citronnelle (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 14:14:00',NULL,'UnRead','N_NEW_ORDER','83241413577954325399',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241414154799669020','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 14:14:01',NULL,'UnRead','N_NEW_ORDER','83241414086194811421',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241414174143607943','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 14:14:01',NULL,'UnRead','N_NEW_ORDER','83241414086194811421',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241414190810951264','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 14:14:01',NULL,'UnRead','N_NEW_ORDER','83241414086194811421',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241414321097846541','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 14:14:03',NULL,'UnRead','N_NEW_ORDER','83241414239168874753',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241414366598952780','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 14:14:03',NULL,'UnRead','N_NEW_ORDER','83241414239168874753',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241414383323016403','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 14:14:03',NULL,'UnRead','N_NEW_ORDER','83241414239168874753',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241711487608408192','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bouillie de riz (1) ;Quaker (1) ;Jus de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 17:11:48',NULL,'UnRead','N_NEW_ORDER','83241711476179932848',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241711492346834015','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bouillie de riz (1) ;Quaker (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 17:11:49',NULL,'UnRead','N_NEW_ORDER','83241711476179932848',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241711493143135238','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bouillie de riz (1) ;Quaker (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 17:11:49',NULL,'UnRead','N_NEW_ORDER','83241711476179932848',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241720108596988535','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Citronnelle (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 17:20:10',NULL,'UnRead','N_NEW_ORDER','83241720104423235396',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241720109746253772','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Citronnelle (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 17:20:10',NULL,'UnRead','N_NEW_ORDER','83241720104423235396',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241720116063142503','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Citronnelle (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 17:20:11',NULL,'UnRead','N_NEW_ORDER','83241720104423235396',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241720119171501678','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 17:20:11',NULL,'UnRead','N_NEW_ORDER','83241720114788714393',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241720122369826206','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 17:20:12',NULL,'UnRead','N_NEW_ORDER','83241720114788714393',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241720127679999787','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 17:20:12',NULL,'UnRead','N_NEW_ORDER','83241720114788714393',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241736164252495580','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 17:36:16',NULL,'UnRead','N_NEW_ORDER','83241736136907501827',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241736167171252725','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 17:36:16',NULL,'UnRead','N_NEW_ORDER','83241736136907501827',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241736172605581354','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 17:36:17',NULL,'UnRead','N_NEW_ORDER','83241736136907501827',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241739318950141171','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;ATTIEKE (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 17:39:03',NULL,'UnRead','N_NEW_ORDER','8324173925875532564',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241739336280271644','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 17:39:03',NULL,'UnRead','N_NEW_ORDER','8324173925875532564',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8324173934736014498','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 17:39:03',NULL,'UnRead','N_NEW_ORDER','8324173925875532564',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241739447677558967','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Citronnelle (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 17:39:44',NULL,'UnRead','N_NEW_ORDER','83241739443053477126',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241739449453200175','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Citronnelle (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 17:39:44',NULL,'UnRead','N_NEW_ORDER','83241739443053477126',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241739458230373350','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Citronnelle (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 17:39:45',NULL,'UnRead','N_NEW_ORDER','83241739443053477126',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241744149155062810','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 17:44:01',NULL,'UnRead','N_NEW_ORDER','83241744087427139957',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241744190269843638','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 17:44:01',NULL,'UnRead','N_NEW_ORDER','83241744087427139957',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8324174422830287552','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 17:44:02',NULL,'UnRead','N_NEW_ORDER','83241744087427139957',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241755348346405862','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1) ;Bande de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 17:55:34',NULL,'UnRead','N_NEW_ORDER','83241755335081577481',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241755349743109190','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 17:55:34',NULL,'UnRead','N_NEW_ORDER','83241755335081577481',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8324175535705043651','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 17:55:35',NULL,'UnRead','N_NEW_ORDER','83241755335081577481',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241756284248987632','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bavaroise aux fruits (1) ;Citronnelle (1) ;ATTIEKE (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 17:56:28',NULL,'UnRead','N_NEW_ORDER','83241756279068842466',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241756285038980123','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bavaroise aux fruits (1) ;Citronnelle (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 17:56:28',NULL,'Read','N_NEW_ORDER','83241756279068842466','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('8324175628586431305','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bavaroise aux fruits (1) ;Citronnelle (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 17:56:28',NULL,'UnRead','N_NEW_ORDER','83241756279068842466',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241758144725676229','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1) ;ATTIEKE (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 17:58:14',NULL,'UnRead','N_NEW_ORDER','83241758142472356433',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241758145649244607','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 17:58:14',NULL,'UnRead','N_NEW_ORDER','83241758142472356433',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241758146606469925','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 17:58:14',NULL,'UnRead','N_NEW_ORDER','83241758142472356433',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241781014480445494','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Citronnelle (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 17:08:10',NULL,'UnRead','N_NEW_ORDER','8324178414389956733',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241781168517124386','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Citronnelle (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 17:08:11',NULL,'UnRead','N_NEW_ORDER','8324178414389956733',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241781254110215131','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Citronnelle (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 17:08:12',NULL,'Read','N_NEW_ORDER','8324178414389956733','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('83241782221925755183','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 17:08:22',NULL,'UnRead','N_NEW_ORDER','8324178205698654586',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241782249956735176','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 17:08:22',NULL,'UnRead','N_NEW_ORDER','8324178205698654586',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241782266283046329','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 17:08:22',NULL,'UnRead','N_NEW_ORDER','8324178205698654586',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241782383551962644','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-24 17:08:23',NULL,'UnRead','N_NEW_ORDER','83241782312047651394',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83241782399193388039','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-24 17:08:23',NULL,'UnRead','N_NEW_ORDER','83241782312047651394',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8324178241009892105','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-24 17:08:24',NULL,'UnRead','N_NEW_ORDER','83241782312047651394',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83255351920480715860','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1) ;Bande de fruits (1) ;Citronnelle (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-25 05:35:19',NULL,'UnRead','N_NEW_ORDER','832553517358341100',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83255351942118116525','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;Bande de fruits (1) ;Citronnelle (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-25 05:35:19',NULL,'UnRead','N_NEW_ORDER','832553517358341100',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83255351954219895281','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;Bande de fruits (1) ;Citronnelle (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-25 05:35:19',NULL,'UnRead','N_NEW_ORDER','832553517358341100',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83256282213226641650','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (1) ;Riz aux olives (1) ;Poisson au four (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-25 06:28:22',NULL,'UnRead','N_NEW_ORDER','83256281460812821149',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83256282268798456600','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (1) ;Poisson au four (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-25 06:28:22',NULL,'UnRead','N_NEW_ORDER','83256281460812821149',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8325628237171559984','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (1) ;Poisson au four (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-25 06:28:23',NULL,'UnRead','N_NEW_ORDER','83256281460812821149',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8325630546780886708','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (1) ;Poulet roti (1) ;Mouton aux oignons (1) ;Pintade sautée (1) ;Beurre (1) ;Confiture (1) ;Jus de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-25 06:30:05',NULL,'UnRead','N_NEW_ORDER','8325630398552673853',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8325630558478368170','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Poulet roti (1) ;Mouton aux oignons (1) ;Pintade sautée (1) ;Beurre (1) ;Confiture (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-25 06:30:05',NULL,'UnRead','N_NEW_ORDER','8325630398552673853',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8325630573410308773','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Poulet roti (1) ;Mouton aux oignons (1) ;Pintade sautée (1) ;Beurre (1) ;Confiture (1) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-25 06:30:05',NULL,'UnRead','N_NEW_ORDER','8325630398552673853',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83281461219694893893','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1) ;ATTIEKE (1) ;Bande de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-03-28 14:06:12',NULL,'UnRead','N_NEW_ORDER','8328146981980855577',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83281461243036378851','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;ATTIEKE (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-03-28 14:06:12',NULL,'UnRead','N_NEW_ORDER','8328146981980855577',NULL,NULL,NULL,NULL,NULL,NULL),
  ('83281461258824096606','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;ATTIEKE (1) ;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-03-28 14:06:12',NULL,'UnRead','N_NEW_ORDER','8328146981980855577',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84211354553640822717','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Bande de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-02 11:35:45',NULL,'UnRead','N_NEW_ORDER','8421135431341448222',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84211354590663852959','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-02 11:35:45',NULL,'UnRead','N_NEW_ORDER','8421135431341448222',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8421135468076968388','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Bande de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-02 11:35:46',NULL,'UnRead','N_NEW_ORDER','8421135431341448222',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221218622823776937','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson au four (1) ;Riz aux olives (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-22 12:18:06',NULL,'UnRead','N_NEW_ORDER','8422121856818187958',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221218633785902183','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson au four (1) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-22 12:18:06',NULL,'UnRead','N_NEW_ORDER','8422121856818187958',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221218644253316501','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson au four (1) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-22 12:18:06',NULL,'UnRead','N_NEW_ORDER','8422121856818187958',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221239477373602321','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (1) ;Riz aux olives (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-22 12:39:47',NULL,'UnRead','N_NEW_ORDER','84221239473525523140',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221239478239442554','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-22 12:39:47',NULL,'UnRead','N_NEW_ORDER','84221239473525523140',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221239479127250806','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-22 12:39:47',NULL,'UnRead','N_NEW_ORDER','84221239473525523140',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221254576163763760','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (6)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-22 12:54:57',NULL,'UnRead','N_NEW_ORDER','84221254565367898401',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221254578057383529','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (6)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-22 12:54:57',NULL,'UnRead','N_NEW_ORDER','84221254565367898401',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221254579837820362','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (6)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-22 12:54:57',NULL,'UnRead','N_NEW_ORDER','84221254565367898401',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221255251819714932','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-22 12:55:25',NULL,'UnRead','N_NEW_ORDER','842212552483461193',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221255252771437447','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-22 12:55:25',NULL,'UnRead','N_NEW_ORDER','842212552483461193',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221255257475329029','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (4) ;Riz aux olives (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-22 12:55:25',NULL,'UnRead','N_NEW_ORDER','842212552483461193',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8422134174389345667','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (4) ;Riz aux olives (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-22 13:04:01',NULL,'UnRead','N_NEW_ORDER','8422134128294414210',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8422134183986367772','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-22 13:04:01',NULL,'UnRead','N_NEW_ORDER','8422134128294414210',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8422134192676852718','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-22 13:04:01',NULL,'UnRead','N_NEW_ORDER','8422134128294414210',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221723166417473225','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-22 17:23:16',NULL,'UnRead','N_NEW_ORDER','84221723156574705040',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221723168493795349','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-22 17:23:16',NULL,'UnRead','N_NEW_ORDER','84221723156574705040',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8422172317326977777','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-22 17:23:17',NULL,'UnRead','N_NEW_ORDER','84221723156574705040',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221942386496784521','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson piperade (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-22 19:42:38',NULL,'UnRead','N_NEW_ORDER','84221942381089839925',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221942387799852965','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson piperade (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-22 19:42:38',NULL,'UnRead','N_NEW_ORDER','84221942381089839925',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221942388988023419','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson piperade (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-22 19:42:38',NULL,'UnRead','N_NEW_ORDER','84221942381089839925',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221943211550106464','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-22 19:43:02',NULL,'UnRead','N_NEW_ORDER','84221943147558424499',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221943231834048027','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-22 19:43:02',NULL,'UnRead','N_NEW_ORDER','84221943147558424499',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221943243035148047','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-22 19:43:02',NULL,'UnRead','N_NEW_ORDER','84221943147558424499',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221943477256023402','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Abolo (1) ;ATTIEKE (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-22 19:43:47',NULL,'UnRead','N_NEW_ORDER','84221943469154475761',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221943479665481658','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-22 19:43:47',NULL,'UnRead','N_NEW_ORDER','84221943469154475761',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8422194348121616423','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Abolo (1) ;ATTIEKE (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-22 19:43:48',NULL,'UnRead','N_NEW_ORDER','84221943469154475761',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221946496451185503','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson au four (5) ;Poisson à l''ivoirienne (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-22 19:46:49',NULL,'UnRead','N_NEW_ORDER','84221946488499429809',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221946497654768702','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson au four (5) ;Poisson à l''ivoirienne (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-22 19:46:49',NULL,'UnRead','N_NEW_ORDER','84221946488499429809',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221946498855909980','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson au four (5) ;Poisson à l''ivoirienne (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-22 19:46:49',NULL,'UnRead','N_NEW_ORDER','84221946488499429809',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221947483532134949','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-22 19:47:48',NULL,'UnRead','N_NEW_ORDER','84221947478714429352',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221947485827381323','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-22 19:47:48',NULL,'UnRead','N_NEW_ORDER','84221947478714429352',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221947486847450228','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-22 19:47:48',NULL,'UnRead','N_NEW_ORDER','84221947478714429352',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221954206291901776','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Riz aux olives (2) ;Poisson à l''ivoirienne (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-22 19:54:20',NULL,'UnRead','N_NEW_ORDER','84221954198588503593',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221954207554886125','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (2) ;Poisson à l''ivoirienne (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-22 19:54:20',NULL,'UnRead','N_NEW_ORDER','84221954198588503593',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84221954209019374678','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (2) ;Poisson à l''ivoirienne (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-22 19:54:20',NULL,'UnRead','N_NEW_ORDER','84221954198588503593',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84229193035397137599','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-22 09:19:30',NULL,'UnRead','N_NEW_ORDER','842291929041529295',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84229193060355525726','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-22 09:19:30',NULL,'UnRead','N_NEW_ORDER','842291929041529295',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84229193073756309765','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-22 09:19:30',NULL,'UnRead','N_NEW_ORDER','842291929041529295',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8422920304118753560','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-22 09:20:30',NULL,'UnRead','N_NEW_ORDER','842292030837543119',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8422920305107369133','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-22 09:20:30',NULL,'UnRead','N_NEW_ORDER','842292030837543119',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84229203061491549632','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-22 09:20:30',NULL,'UnRead','N_NEW_ORDER','842292030837543119',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84229305479713852250','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-22 09:30:54',NULL,'UnRead','N_NEW_ORDER','84229305442120753240',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84229305491773172830','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-22 09:30:54',NULL,'UnRead','N_NEW_ORDER','84229305442120753240',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8422930554363089703','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-22 09:30:55',NULL,'UnRead','N_NEW_ORDER','84229305442120753240',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84229561196187833115','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-22 09:56:11',NULL,'UnRead','N_NEW_ORDER','84229561061052946828',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84229561216828028372','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-22 09:56:12',NULL,'UnRead','N_NEW_ORDER','84229561061052946828',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84229561235125024560','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-22 09:56:12',NULL,'UnRead','N_NEW_ORDER','84229561061052946828',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84229571393078343026','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson au four (1) ;Poisson à l''ivoirienne (1) ;Riz aux olives (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-22 09:57:13',NULL,'UnRead','N_NEW_ORDER','84229571331631102158',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84229571418335512320','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson au four (1) ;Poisson à l''ivoirienne (1) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-22 09:57:14',NULL,'UnRead','N_NEW_ORDER','84229571331631102158',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8422957146829229290','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson au four (1) ;Poisson à l''ivoirienne (1) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-22 09:57:14',NULL,'UnRead','N_NEW_ORDER','84229571331631102158',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84231005885972653775','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-23 10:00:58',NULL,'UnRead','N_NEW_ORDER','84231005834528412999',NULL,NULL,NULL,NULL,NULL,NULL),
  ('842310059116863942','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-23 10:00:59',NULL,'UnRead','N_NEW_ORDER','84231005834528412999',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84231005911792002917','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-23 10:00:59',NULL,'UnRead','N_NEW_ORDER','84231005834528412999',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84231021418687532430','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (1) ;Poisson au four (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-23 10:02:14',NULL,'UnRead','N_NEW_ORDER','84231021365544473405',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84231021428162781762','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (1) ;Poisson au four (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-23 10:02:14',NULL,'UnRead','N_NEW_ORDER','84231021365544473405',NULL,NULL,NULL,NULL,NULL,NULL),
  ('842310214875691428','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (1) ;Riz aux olives (1) ;Poisson au four (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-23 10:02:14',NULL,'UnRead','N_NEW_ORDER','84231021365544473405',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84231042977527942022','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson au four (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-23 10:04:29',NULL,'UnRead','N_NEW_ORDER','84231042949085945565',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84231042986868588420','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson au four (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-23 10:04:29',NULL,'UnRead','N_NEW_ORDER','84231042949085945565',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84231042994961568549','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson au four (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-23 10:04:29',NULL,'UnRead','N_NEW_ORDER','84231042949085945565',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84231061334014508021','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-23 10:06:13',NULL,'UnRead','N_NEW_ORDER','8423106131126746447',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84231061344965357500','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-23 10:06:13',NULL,'UnRead','N_NEW_ORDER','8423106131126746447',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8423106135505921599','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-23 10:06:13',NULL,'UnRead','N_NEW_ORDER','8423106131126746447',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84231633890722023021','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-23 16:33:08',NULL,'UnRead','N_NEW_ORDER','84231633727291788276',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84231633915677839844','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-23 16:33:09',NULL,'UnRead','N_NEW_ORDER','84231633727291788276',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84231633947149942542','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-23 16:33:09',NULL,'UnRead','N_NEW_ORDER','84231633727291788276',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84238405946669286774','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-23 08:40:59',NULL,'UnRead','N_NEW_ORDER','8423840583312308226',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84238405967228831564','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-23 08:40:59',NULL,'UnRead','N_NEW_ORDER','8423840583312308226',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84238405983395342241','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-23 08:40:59',NULL,'UnRead','N_NEW_ORDER','8423840583312308226',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84238433995346799647','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (6)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-23 08:43:39',NULL,'UnRead','N_NEW_ORDER','84238433958765671724',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8423843401372246142','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (6)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-23 08:43:40',NULL,'UnRead','N_NEW_ORDER','84238433958765671724',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8423843404766232731','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (6)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-23 08:43:40',NULL,'UnRead','N_NEW_ORDER','84238433958765671724',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8423854071993276631','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-23 08:54:00',NULL,'UnRead','N_NEW_ORDER','84238535977648214948',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8423854095356726974','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-23 08:54:00',NULL,'UnRead','N_NEW_ORDER','84238535977648214948',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8423854110786317198','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-23 08:54:01',NULL,'UnRead','N_NEW_ORDER','84238535977648214948',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8423955108714869208','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-23 09:55:10',NULL,'UnRead','N_NEW_ORDER','8423955971110679997',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84239551140196286398','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-23 09:55:11',NULL,'UnRead','N_NEW_ORDER','8423955971110679997',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8423955115524933137','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-23 09:55:11',NULL,'UnRead','N_NEW_ORDER','8423955971110679997',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241038398629351702','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-24 10:38:39',NULL,'UnRead','N_NEW_ORDER','84241038392891423594',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241038401202909795','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-24 10:38:40',NULL,'UnRead','N_NEW_ORDER','84241038392891423594',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8424103840132255988','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-24 10:38:40',NULL,'UnRead','N_NEW_ORDER','84241038392891423594',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241039333255844394','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Riz aux olives (3) ;Poisson à l''ivoirienne (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-24 10:39:33',NULL,'UnRead','N_NEW_ORDER','84241039327793893396',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241039334377617909','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (3) ;Poisson à l''ivoirienne (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-24 10:39:33',NULL,'UnRead','N_NEW_ORDER','84241039327793893396',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8424103933528486327','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (3) ;Poisson à l''ivoirienne (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-24 10:39:33',NULL,'UnRead','N_NEW_ORDER','84241039327793893396',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241116777593567927','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (5) ;Riz aux olives (3) ;Poisson au four (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-24 11:16:07',NULL,'UnRead','N_NEW_ORDER','84241116693095516589',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241116793751268014','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5) ;Riz aux olives (3) ;Poisson au four (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-24 11:16:07',NULL,'UnRead','N_NEW_ORDER','84241116693095516589',NULL,NULL,NULL,NULL,NULL,NULL),
  ('842411168747906153','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5) ;Riz aux olives (3) ;Poisson au four (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-24 11:16:08',NULL,'UnRead','N_NEW_ORDER','84241116693095516589',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241117493157449812','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (3) ;Poisson au four (6)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-24 11:17:49',NULL,'UnRead','N_NEW_ORDER','84241117487017466453',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241117494688514839','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (3) ;Poisson au four (6)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-24 11:17:49',NULL,'UnRead','N_NEW_ORDER','84241117487017466453',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241117496918642795','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (3) ;Poisson au four (6)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-24 11:17:49',NULL,'UnRead','N_NEW_ORDER','84241117487017466453',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241126126719938817','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (3) ;Riz aux olives (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-24 11:26:12',NULL,'UnRead','N_NEW_ORDER','84241126129853004721',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241126128111738379','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (3) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-24 11:26:12',NULL,'UnRead','N_NEW_ORDER','84241126129853004721',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8424112612983715031','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (3) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-24 11:26:12',NULL,'UnRead','N_NEW_ORDER','84241126129853004721',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241535519021869683','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (1) ;Riz aux olives (2) ;Poisson au four (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-24 15:35:51',NULL,'UnRead','N_NEW_ORDER','84241535501645281310',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8424153552225535274','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (2) ;Poisson au four (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-24 15:35:52',NULL,'UnRead','N_NEW_ORDER','84241535501645281310',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241535529054486743','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (2) ;Poisson au four (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-24 15:35:52',NULL,'UnRead','N_NEW_ORDER','84241535501645281310',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241750126936104897','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (5) ;Riz aux olives (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-24 17:50:12',NULL,'UnRead','N_NEW_ORDER','8424175011797687743',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241750128478353122','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-24 17:50:12',NULL,'UnRead','N_NEW_ORDER','8424175011797687743',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241750131457693855','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-24 17:50:13',NULL,'UnRead','N_NEW_ORDER','8424175011797687743',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241755328742624521','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (4) ;Poisson au four (3) ;Riz aux olives (3) ;Poulet roti (3) ;Mouton aux oignons (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-24 17:55:32',NULL,'UnRead','N_NEW_ORDER','84241755315317170246',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241755329904988884','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4) ;Poisson au four (3) ;Riz aux olives (3) ;Poulet roti (3) ;Mouton aux oignons (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-24 17:55:32',NULL,'UnRead','N_NEW_ORDER','84241755315317170246',NULL,NULL,NULL,NULL,NULL,NULL);
COMMIT;

/* Data for the `t_notification` table  (LIMIT 1000,500) */

INSERT INTO `t_notification` (`lg_ID`, `lg_USER_ID_IN`, `lg_USER_ID_OUT`, `str_DESCRIPTION`, `str_CONTENT`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`, `str_TYPE`, `str_REF_RESSOURCE`, `str_CUST_ACCOUNT_ID`, `str_URL_PIC`, `str_NAME`, `str_CHANNEL`, `str_CHANNEL_READ`, `str_GPS`) VALUES
  ('84241755332965608593','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4) ;Poisson au four (3) ;Riz aux olives (3) ;Poulet roti (3) ;Mouton aux oignons (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-24 17:55:33',NULL,'UnRead','N_NEW_ORDER','84241755315317170246',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241837416691577308','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (4) ;Riz aux olives (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-24 18:37:41',NULL,'UnRead','N_NEW_ORDER','84241837413538921764',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241837417502745428','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-24 18:37:41',NULL,'UnRead','N_NEW_ORDER','84241837413538921764',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84241837418502554882','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-24 18:37:41',NULL,'UnRead','N_NEW_ORDER','84241837413538921764',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8424750850343238822','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (10) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-24 07:50:08',NULL,'UnRead','N_NEW_ORDER','8424750682815629279',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8424750866640656815','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (10) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-24 07:50:08',NULL,'UnRead','N_NEW_ORDER','8424750682815629279',NULL,NULL,NULL,NULL,NULL,NULL),
  ('842475088850619954','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (10) ;Riz aux olives (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-24 07:50:08',NULL,'UnRead','N_NEW_ORDER','8424750682815629279',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8424841142962678622','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-24 08:04:11',NULL,'UnRead','N_NEW_ORDER','8424841073347519437',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8424841160011887027','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-24 08:04:11',NULL,'UnRead','N_NEW_ORDER','8424841073347519437',NULL,NULL,NULL,NULL,NULL,NULL),
  ('842484117593274624','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-24 08:04:11',NULL,'UnRead','N_NEW_ORDER','8424841073347519437',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84251529416422353336','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (3) ;Riz aux olives (2) ;Poisson au four (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-25 15:29:41',NULL,'UnRead','N_NEW_ORDER','84251529413724024944',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84251529417182675836','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (3) ;Riz aux olives (2) ;Poisson au four (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-25 15:29:41',NULL,'UnRead','N_NEW_ORDER','84251529413724024944',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84251529419272703512','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (3) ;Riz aux olives (2) ;Poisson au four (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-25 15:29:41',NULL,'UnRead','N_NEW_ORDER','84251529413724024944',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84251715785524835200','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-25 17:15:07',NULL,'UnRead','N_NEW_ORDER','84251715767466458239',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84251715792481321174','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-25 17:15:07',NULL,'UnRead','N_NEW_ORDER','84251715767466458239',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84251715798430139660','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-25 17:15:07',NULL,'UnRead','N_NEW_ORDER','84251715767466458239',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84251813452379359866','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (1) ;Riz aux olives (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-25 18:13:45',NULL,'UnRead','N_NEW_ORDER','84251813457988924228',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84251813452896341696','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-25 18:13:45',NULL,'UnRead','N_NEW_ORDER','84251813457988924228',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84251813453463888646','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-25 18:13:45',NULL,'UnRead','N_NEW_ORDER','84251813457988924228',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8425192664305741631','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-25 19:26:06',NULL,'UnRead','N_NEW_ORDER','84251926625820154542',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8425192664964958456','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-25 19:26:06',NULL,'UnRead','N_NEW_ORDER','84251926625820154542',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84251926655516248158','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-25 19:26:06',NULL,'UnRead','N_NEW_ORDER','84251926625820154542',NULL,NULL,NULL,NULL,NULL,NULL),
  ('842619024128267274','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-26 19:00:24',NULL,'UnRead','N_NEW_ORDER','8426190238871325782',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84261902418436913164','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-26 19:00:24',NULL,'UnRead','N_NEW_ORDER','8426190238871325782',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8426190242582026293','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-26 19:00:24',NULL,'UnRead','N_NEW_ORDER','8426190238871325782',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84261916031135482265','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Riz aux olives (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-26 19:16:00',NULL,'UnRead','N_NEW_ORDER','8426191606888584569',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84261916038668728466','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-26 19:16:00',NULL,'UnRead','N_NEW_ORDER','8426191606888584569',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84261916046139508109','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-26 19:16:00',NULL,'UnRead','N_NEW_ORDER','8426191606888584569',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8426195221139962766','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (7) ;Riz aux olives (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-26 19:52:21',NULL,'UnRead','N_NEW_ORDER','84261952209637770246',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84261952211981096428','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (7) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-26 19:52:21',NULL,'UnRead','N_NEW_ORDER','84261952209637770246',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84261952212735610593','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (7) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-26 19:52:21',NULL,'UnRead','N_NEW_ORDER','84261952209637770246',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84261953534255713216','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-26 19:53:53',NULL,'UnRead','N_NEW_ORDER','84261953531847867536',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84261953535277237545','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-26 19:53:53',NULL,'UnRead','N_NEW_ORDER','84261953531847867536',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84261953535857980250','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-26 19:53:53',NULL,'UnRead','N_NEW_ORDER','84261953531847867536',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8426196272351194109','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-26 19:06:02',NULL,'UnRead','N_NEW_ORDER','842619623981825164',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8426196278677514999','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-26 19:06:02',NULL,'UnRead','N_NEW_ORDER','842619623981825164',NULL,NULL,NULL,NULL,NULL,NULL),
  ('842619628462077439','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-26 19:06:02',NULL,'UnRead','N_NEW_ORDER','842619623981825164',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84261972162359489799','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (4) ;Riz aux olives (3) ;Poisson au four (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-26 19:07:21',NULL,'UnRead','N_NEW_ORDER','842619721387585354',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84261972168956201463','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4) ;Riz aux olives (3) ;Poisson au four (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-26 19:07:21',NULL,'UnRead','N_NEW_ORDER','842619721387585354',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84261972175064688945','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4) ;Riz aux olives (3) ;Poisson au four (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-26 19:07:21',NULL,'UnRead','N_NEW_ORDER','842619721387585354',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84262012242449149455','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (6)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-26 20:01:22',NULL,'UnRead','N_NEW_ORDER','84262012226668536957',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84262012248678937229','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (6)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-26 20:01:22',NULL,'UnRead','N_NEW_ORDER','84262012226668536957',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84262012253863132419','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (6)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-26 20:01:22',NULL,'UnRead','N_NEW_ORDER','84262012226668536957',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84271022464451837875','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Riz aux olives (3) ;Poisson au four (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-27 10:22:46',NULL,'UnRead','N_NEW_ORDER','84271022462058562151',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84271022465115810151','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (3) ;Poisson au four (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-27 10:22:46',NULL,'UnRead','N_NEW_ORDER','84271022462058562151',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84271022465884952892','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (3) ;Poisson au four (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-27 10:22:46',NULL,'UnRead','N_NEW_ORDER','84271022462058562151',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84271146266463028961','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (5) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-27 11:46:26',NULL,'UnRead','N_NEW_ORDER','84271146263575385761',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84271146267206829375','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-27 11:46:26',NULL,'UnRead','N_NEW_ORDER','84271146263575385761',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84271146267833201147','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-27 11:46:26',NULL,'UnRead','N_NEW_ORDER','84271146263575385761',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84271158502982504554','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (1) ;Riz aux olives (1) ;Poisson au four (1) ;Poulet roti (1) ;Crème caramel (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-27 11:58:50',NULL,'UnRead','N_NEW_ORDER','84271158499507227458',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84271158503796200664','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (1) ;Poisson au four (1) ;Poulet roti (1) ;Crème caramel (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-27 11:58:50',NULL,'UnRead','N_NEW_ORDER','84271158499507227458',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84271158512273254225','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (1) ;Poisson au four (1) ;Poulet roti (1) ;Crème caramel (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-27 11:58:51',NULL,'UnRead','N_NEW_ORDER','84271158499507227458',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84271210258163857982','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (1) ;Riz aux olives (2) ;Crème caramel (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-27 12:10:25',NULL,'UnRead','N_NEW_ORDER','84271210254712389853',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84271210258931260454','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (2) ;Crème caramel (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-27 12:10:25',NULL,'UnRead','N_NEW_ORDER','84271210254712389853',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84271210259584564109','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (2) ;Crème caramel (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-27 12:10:25',NULL,'UnRead','N_NEW_ORDER','84271210254712389853',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8427122381698095618','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (3) ;Riz aux olives (3) ;Poisson au four (1) ;Poulet roti (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-27 12:23:08',NULL,'UnRead','N_NEW_ORDER','84271223788166894741',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84271223822943263569','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (3) ;Riz aux olives (3) ;Poisson au four (1) ;Poulet roti (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-27 12:23:08',NULL,'UnRead','N_NEW_ORDER','84271223788166894741',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8427122393666762929','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (3) ;Riz aux olives (3) ;Poisson au four (1) ;Poulet roti (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-27 12:23:09',NULL,'UnRead','N_NEW_ORDER','84271223788166894741',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8427122453839471097','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson au four (1) ;KEDJENOU (4) ;Beurre (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-27 12:02:04',NULL,'UnRead','N_NEW_ORDER','8427122422257205352',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8427122460227322125','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson au four (1) ;KEDJENOU (4) ;Beurre (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-27 12:02:04',NULL,'UnRead','N_NEW_ORDER','8427122422257205352',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8427122466829649637','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson au four (1) ;KEDJENOU (4) ;Beurre (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-27 12:02:04',NULL,'UnRead','N_NEW_ORDER','8427122422257205352',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84271241091881928412','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (1) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-27 12:41:00',NULL,'UnRead','N_NEW_ORDER','84271241024853218253',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8427124109944561651','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-27 12:41:00',NULL,'UnRead','N_NEW_ORDER','84271241024853218253',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8427124118117927223','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-27 12:41:01',NULL,'UnRead','N_NEW_ORDER','84271241024853218253',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84271544079162901904','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Jus de fruits (1) ;Poulet roti (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-27 15:44:00',NULL,'UnRead','N_NEW_ORDER','8427154403534319511',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84271544085941669759','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1) ;Poulet roti (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-27 15:44:00',NULL,'UnRead','N_NEW_ORDER','8427154403534319511',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84271544091945727131','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1) ;Poulet roti (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-27 15:44:00',NULL,'UnRead','N_NEW_ORDER','8427154403534319511',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84272248148942373642','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (6) ;Riz aux olives (10) ;Poisson au four (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-27 22:48:14',NULL,'UnRead','N_NEW_ORDER','84272248146601287659',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84272248149476624727','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (6) ;Riz aux olives (10) ;Poisson au four (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-27 22:48:14',NULL,'UnRead','N_NEW_ORDER','84272248146601287659',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8427224815274519288','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (6) ;Riz aux olives (10) ;Poisson au four (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-27 22:48:15',NULL,'UnRead','N_NEW_ORDER','84272248146601287659',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84278344983142195296','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (5) ;Riz aux olives (6)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-27 08:34:49',NULL,'UnRead','N_NEW_ORDER','84278344930927829757',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84278344995414668322','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5) ;Riz aux olives (6)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-27 08:34:49',NULL,'UnRead','N_NEW_ORDER','84278344930927829757',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8427834506862304391','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5) ;Riz aux olives (6)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-27 08:34:50',NULL,'UnRead','N_NEW_ORDER','84278344930927829757',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8427856437621152114','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (4) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-27 08:56:04',NULL,'UnRead','N_NEW_ORDER','8427856411918583871',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84278564462399883','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-27 08:56:04',NULL,'UnRead','N_NEW_ORDER','8427856411918583871',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8427856454674381377','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-27 08:56:04',NULL,'UnRead','N_NEW_ORDER','8427856411918583871',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8427881220964989646','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (7) ;Riz aux olives (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-27 08:08:12',NULL,'UnRead','N_NEW_ORDER','842788122052339835',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8427881227072111716','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (7) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-27 08:08:12',NULL,'UnRead','N_NEW_ORDER','842788122052339835',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8427881232250384740','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (7) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-27 08:08:12',NULL,'UnRead','N_NEW_ORDER','842788122052339835',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281159407756333619','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (6) ;Riz aux olives (3) ;Poulet roti (3) ;Crème caramel (10) ;Poisson piperade (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-28 11:59:40',NULL,'UnRead','N_NEW_ORDER','84281159403395946388',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281159408405921772','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (6) ;Riz aux olives (3) ;Poulet roti (3) ;Crème caramel (10) ;Poisson piperade (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-28 11:59:40',NULL,'UnRead','N_NEW_ORDER','84281159403395946388',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281159409003278538','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (6) ;Riz aux olives (3) ;Poulet roti (3) ;Crème caramel (10) ;Poisson piperade (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-28 11:59:40',NULL,'UnRead','N_NEW_ORDER','84281159403395946388',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281222502769065398','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Riz aux olives (1) ;Poisson au four (2) ;Poisson à l''ivoirienne (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-28 12:22:50',NULL,'UnRead','N_NEW_ORDER','84281222498542273203',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281222503306414238','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (1) ;Poisson au four (2) ;Poisson à l''ivoirienne (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-28 12:22:50',NULL,'UnRead','N_NEW_ORDER','84281222498542273203',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281222504882947270','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (1) ;Poisson au four (2) ;Poisson à l''ivoirienne (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-28 12:22:50',NULL,'UnRead','N_NEW_ORDER','84281222498542273203',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281227442147569678','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (4) ;Riz aux olives (1) ;Poulet roti (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-28 12:27:44',NULL,'UnRead','N_NEW_ORDER','84281227438043854784',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281227442722765996','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4) ;Riz aux olives (1) ;Poulet roti (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-28 12:27:44',NULL,'UnRead','N_NEW_ORDER','84281227438043854784',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281227443286026340','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4) ;Riz aux olives (1) ;Poulet roti (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-28 12:27:44',NULL,'UnRead','N_NEW_ORDER','84281227438043854784',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281329136921361766','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (1) ;Poisson au four (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-28 13:29:13',NULL,'UnRead','N_NEW_ORDER','84281329135038695121',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281329137482725843','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Poisson au four (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-28 13:29:13',NULL,'UnRead','N_NEW_ORDER','84281329135038695121',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281329138169932989','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Poisson au four (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-28 13:29:13',NULL,'UnRead','N_NEW_ORDER','84281329135038695121',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281385129843445','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-28 13:08:05',NULL,'UnRead','N_NEW_ORDER','8428138480421608917',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281385178554803','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-28 13:08:05',NULL,'UnRead','N_NEW_ORDER','8428138480421608917',NULL,NULL,NULL,NULL,NULL,NULL),
  ('842813857789449666','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-28 13:08:05',NULL,'UnRead','N_NEW_ORDER','8428138480421608917',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281448124657769337','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (6)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-28 14:48:01',NULL,'UnRead','N_NEW_ORDER','84281448094295642695',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281448130334565843','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (6)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-28 14:48:01',NULL,'UnRead','N_NEW_ORDER','84281448094295642695',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281448136093181934','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (6)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-28 14:48:01',NULL,'UnRead','N_NEW_ORDER','84281448094295642695',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281745698795444037','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-28 17:45:06',NULL,'UnRead','N_NEW_ORDER','84281745672657802724',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281745711160579812','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-28 17:45:07',NULL,'UnRead','N_NEW_ORDER','84281745672657802724',NULL,NULL,NULL,NULL,NULL,NULL),
  ('842817457432352871','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-28 17:45:07',NULL,'UnRead','N_NEW_ORDER','84281745672657802724',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281752418825467231','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Riz aux olives (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-28 17:52:41',NULL,'UnRead','N_NEW_ORDER','84281752417005685492',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84281752419452692620','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-28 17:52:41',NULL,'UnRead','N_NEW_ORDER','84281752417005685492',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8428175242235468345','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-28 17:52:42',NULL,'UnRead','N_NEW_ORDER','84281752417005685492',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84291342149568573794','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-29 13:42:14',NULL,'UnRead','N_NEW_ORDER','84291342148019898941',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84291342151083005863','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-29 13:42:15',NULL,'UnRead','N_NEW_ORDER','84291342148019898941',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84291342153474725649','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-29 13:42:15',NULL,'UnRead','N_NEW_ORDER','84291342148019898941',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84291392762226313110','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (5) ;Poulet roti (4) ;Crème caramel (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-29 13:09:27',NULL,'UnRead','N_NEW_ORDER','84291392741245391219',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84291392769070733034','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5) ;Poulet roti (4) ;Crème caramel (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-29 13:09:27',NULL,'UnRead','N_NEW_ORDER','84291392741245391219',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84291392779053496463','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (5) ;Poulet roti (4) ;Crème caramel (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-29 13:09:27',NULL,'UnRead','N_NEW_ORDER','84291392741245391219',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84291416108875066672','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-29 14:16:10',NULL,'UnRead','N_NEW_ORDER','84291416102373833604',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84291416109421365213','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-29 14:16:10',NULL,'UnRead','N_NEW_ORDER','84291416102373833604',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8429141611722887889','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-29 14:16:11',NULL,'UnRead','N_NEW_ORDER','84291416102373833604',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84291525419096846781','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (3) ;Riz aux olives (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-29 15:25:04',NULL,'UnRead','N_NEW_ORDER','84291525396742312390',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84291525425919492516','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (3) ;Riz aux olives (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-29 15:25:04',NULL,'UnRead','N_NEW_ORDER','84291525396742312390',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84291525432095206732','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (3) ;Riz aux olives (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-29 15:25:04',NULL,'UnRead','N_NEW_ORDER','84291525396742312390',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84291536421474687570','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-29 15:36:42',NULL,'UnRead','N_NEW_ORDER','84291536416722195909',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84291536422269188774','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-29 15:36:42',NULL,'UnRead','N_NEW_ORDER','84291536416722195909',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8429153642853701572','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (4) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-29 15:36:42',NULL,'UnRead','N_NEW_ORDER','84291536416722195909',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84291540337314708114','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (3) ;Riz aux olives (2) ;Poisson au four (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-29 15:40:33',NULL,'UnRead','N_NEW_ORDER','84291540335201245829',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84291540337947934495','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (3) ;Riz aux olives (2) ;Poisson au four (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-29 15:40:33',NULL,'UnRead','N_NEW_ORDER','84291540335201245829',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84291540338502135177','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (3) ;Riz aux olives (2) ;Poisson au four (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-29 15:40:33',NULL,'UnRead','N_NEW_ORDER','84291540335201245829',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84301812541911431195','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Jus de fruits (1) ;Lait froid (2) ;Riz aux olives (1) ;Poisson au four (1) ;Poisson à l''ivoirienne (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-04-30 18:12:54',NULL,'UnRead','N_NEW_ORDER','84301812539246808588',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84301812542724344588','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1) ;Lait froid (2) ;Riz aux olives (1) ;Poisson au four (1) ;Poisson à l''ivoirienne (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-04-30 18:12:54',NULL,'UnRead','N_NEW_ORDER','84301812539246808588',NULL,NULL,NULL,NULL,NULL,NULL),
  ('84301812543598883899','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (1) ;Lait froid (2) ;Riz aux olives (1) ;Poisson au four (1) ;Poisson à l''ivoirienne (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-04-30 18:12:54',NULL,'UnRead','N_NEW_ORDER','84301812539246808588',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85151418181288887735','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-15 14:18:18',NULL,'UnRead','N_NEW_ORDER','85151418178902897174',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8515141818204703001','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-15 14:18:18',NULL,'UnRead','N_NEW_ORDER','85151418178902897174',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85151418186936927087','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-15 14:18:18',NULL,'UnRead','N_NEW_ORDER','85151418178902897174',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85151458486668956611','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-15 14:58:48',NULL,'UnRead','N_NEW_ORDER','85151458484928714601',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85151458487353650246','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-15 14:58:48',NULL,'UnRead','N_NEW_ORDER','85151458484928714601',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85151458487961871950','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-15 14:58:48',NULL,'UnRead','N_NEW_ORDER','85151458484928714601',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85213365691453391589','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (1) ;Riz aux olives (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-02 13:36:56',NULL,'UnRead','N_NEW_ORDER','85213365673198517327',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85213365697184648980','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-02 13:36:56',NULL,'UnRead','N_NEW_ORDER','85213365673198517327',NULL,NULL,NULL,NULL,NULL,NULL),
  ('852133657389217874','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-02 13:36:57',NULL,'UnRead','N_NEW_ORDER','85213365673198517327',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85213565290963389300','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson au four (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-02 13:56:52',NULL,'UnRead','N_NEW_ORDER','852135652751236220',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85213565297114598419','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson au four (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-02 13:56:52',NULL,'UnRead','N_NEW_ORDER','852135652751236220',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8521356533460704906','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson au four (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-02 13:56:53',NULL,'UnRead','N_NEW_ORDER','852135652751236220',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241034468003971755','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 10:34:46',NULL,'Read','N_NEW_ORDER','85241034453282723428',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241034472292055999','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 10:34:47',NULL,'Read','N_NEW_ORDER','85241034453282723428',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241034472376815396','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 10:34:47',NULL,'Read','N_NEW_ORDER','85241034453282723428',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241035495348453408','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 10:35:49',NULL,'Read','N_NEW_ORDER','85241035487638132993',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241035496881337942','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 10:35:49',NULL,'Read','N_NEW_ORDER','85241035487638132993',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241035498057947312','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 10:35:49',NULL,'Read','N_NEW_ORDER','85241035487638132993',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241036302921237401','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 10:36:30',NULL,'Read','N_NEW_ORDER','85241036299202240823',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241036304363206643','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 10:36:30',NULL,'Read','N_NEW_ORDER','85241036299202240823',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241036305702073365','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 10:36:30',NULL,'Read','N_NEW_ORDER','85241036299202240823',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241418525221210193','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (1) ;Riz aux olives (1) ;Poisson au four (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 14:18:52',NULL,'Read','N_NEW_ORDER','85241418509415762204',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241418529192707940','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (1) ;Riz aux olives (1) ;Poisson au four (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 14:18:52',NULL,'Read','N_NEW_ORDER','85241418509415762204',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241418531309065819','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (1) ;Riz aux olives (1) ;Poisson au four (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 14:18:53',NULL,'Read','N_NEW_ORDER','85241418509415762204',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241422763325964330','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5) ;Poisson au four (4) ;Poisson piperade (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 14:22:07',NULL,'Read','N_NEW_ORDER','85241422696345001105',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241422782230208954','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Poisson au four (4) ;Poisson piperade (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 14:22:07',NULL,'Read','N_NEW_ORDER','85241422696345001105',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241422791695504639','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Poisson au four (4) ;Poisson piperade (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 14:22:07',NULL,'Read','N_NEW_ORDER','85241422696345001105',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241434507607836675','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5) ;Riz aux olives (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 14:34:50',NULL,'UnRead','N_NEW_ORDER','85241434503147772437',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241434508828788975','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 14:34:50',NULL,'UnRead','N_NEW_ORDER','85241434503147772437',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241434511831452127','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 14:34:51',NULL,'UnRead','N_NEW_ORDER','85241434503147772437',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241511252291542115','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (3) ;Poulet roti (2) ;Beurre (2) ;Jus de fruits (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 15:11:25',NULL,'Read','N_NEW_ORDER','85241511239087437449',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241511253256681361','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (3) ;Poulet roti (2) ;Beurre (2) ;Jus de fruits (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 15:11:25',NULL,'Read','N_NEW_ORDER','85241511239087437449',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241511256895201291','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5) ;Riz aux olives (3) ;Poulet roti (2) ;Beurre (2) ;Jus de fruits (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 15:11:25',NULL,'Read','N_NEW_ORDER','85241511239087437449',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241636424417517276','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (6)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 16:36:42',NULL,'Read','N_NEW_ORDER','85241636413071732674',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241636426926953159','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 16:36:42',NULL,'Read','N_NEW_ORDER','85241636413071732674',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241636428673411619','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 16:36:42',NULL,'Read','N_NEW_ORDER','85241636413071732674',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241639346182892314','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 16:39:34',NULL,'UnRead','N_NEW_ORDER','85241639337575576906',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241639347757097227','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 16:39:34',NULL,'UnRead','N_NEW_ORDER','85241639337575576906',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241639349155576109','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 16:39:34',NULL,'UnRead','N_NEW_ORDER','85241639337575576906',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241641165805117248','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3) ;Riz aux olives (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 16:41:16',NULL,'UnRead','N_NEW_ORDER','85241641169221041487',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241641167135184928','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 16:41:16',NULL,'UnRead','N_NEW_ORDER','85241641169221041487',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241641168492019833','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 16:41:16',NULL,'UnRead','N_NEW_ORDER','85241641169221041487',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241835536395625441','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 18:35:53',NULL,'UnRead','N_NEW_ORDER','85241835528634435568',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241835537756782486','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 18:35:53',NULL,'UnRead','N_NEW_ORDER','85241835528634435568',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8524183554679879754','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 18:35:54',NULL,'UnRead','N_NEW_ORDER','85241835528634435568',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241836535174556584','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Quaker (1) ;Bouillie de riz (1) ;Creme de riz (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 18:36:53',NULL,'UnRead','N_NEW_ORDER','85241836527425472200',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241836536394974974','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Quaker (1) ;Bouillie de riz (1) ;Creme de riz (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 18:36:53',NULL,'UnRead','N_NEW_ORDER','85241836527425472200',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241836537723845837','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Quaker (1) ;Bouillie de riz (1) ;Creme de riz (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 18:36:53',NULL,'UnRead','N_NEW_ORDER','85241836527425472200',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241855274164112905','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (8)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 18:55:27',NULL,'Read','N_NEW_ORDER','8524185527538603383',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241855275055390658','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (8)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 18:55:27',NULL,'Read','N_NEW_ORDER','8524185527538603383',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241855276095588742','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (8)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 18:55:27',NULL,'Read','N_NEW_ORDER','8524185527538603383',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241856487122354514','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (1) ;Riz aux olives (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 18:56:48',NULL,'Read','N_NEW_ORDER','85241856483057906154',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241856488225447577','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (1) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 18:56:48',NULL,'Read','N_NEW_ORDER','85241856483057906154',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241856489027102112','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (1) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 18:56:48',NULL,'Read','N_NEW_ORDER','85241856483057906154',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241862450115702330','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (6)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 18:06:24',NULL,'Read','N_NEW_ORDER','85241862287376432792',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241862477872599445','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 18:06:24',NULL,'Read','N_NEW_ORDER','85241862287376432792',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85241862493610637575','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 18:06:24',NULL,'Read','N_NEW_ORDER','85241862287376432792',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85249282832668456587','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 09:28:28',NULL,'UnRead','N_NEW_ORDER','8524928213431596796',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85249282882473632579','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 09:28:28',NULL,'UnRead','N_NEW_ORDER','8524928213431596796',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85249282952886842386','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 09:28:29',NULL,'UnRead','N_NEW_ORDER','8524928213431596796',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85249311855613169789','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poulet roti (1) ;Mouton aux oignons (1) ;Riz aux olives (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 09:31:18',NULL,'UnRead','N_NEW_ORDER','8524931178588749145',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85249311869027044076','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poulet roti (1) ;Mouton aux oignons (1) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 09:31:18',NULL,'UnRead','N_NEW_ORDER','8524931178588749145',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85249311879992156121','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poulet roti (1) ;Mouton aux oignons (1) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 09:31:18',NULL,'UnRead','N_NEW_ORDER','8524931178588749145',NULL,NULL,NULL,NULL,NULL,NULL),
  ('852493791233377167','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (2) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 09:37:09',NULL,'Read','N_NEW_ORDER','8524937847885843114',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8524937925518251267','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (2) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 09:37:09',NULL,'Read','N_NEW_ORDER','8524937847885843114',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8524937936821982116','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (2) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 09:37:09',NULL,'Read','N_NEW_ORDER','8524937847885843114',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8524941051124821270','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Riz aux olives (3) ;Poisson à la camerounaise (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 09:41:00',NULL,'UnRead','N_NEW_ORDER','8524940598645404872',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8524941061641774810','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (3) ;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 09:41:00',NULL,'UnRead','N_NEW_ORDER','8524940598645404872',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8524941071587753581','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (3) ;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 09:41:00',NULL,'UnRead','N_NEW_ORDER','8524940598645404872',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85249445940793838493','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 09:44:59',NULL,'UnRead','N_NEW_ORDER','852494458851230351',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8524944595328735173','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 09:44:59',NULL,'UnRead','N_NEW_ORDER','852494458851230351',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85249445965927666320','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 09:44:59',NULL,'UnRead','N_NEW_ORDER','852494458851230351',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8524947167958699661','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 09:47:16',NULL,'UnRead','N_NEW_ORDER','85249471644119682987',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85249471688293185662','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 09:47:16',NULL,'UnRead','N_NEW_ORDER','85249471644119682987',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8524947172069727743','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 09:47:17',NULL,'UnRead','N_NEW_ORDER','85249471644119682987',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8524949388414972057','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 09:49:03',NULL,'UnRead','N_NEW_ORDER','8524949355571887975',NULL,NULL,NULL,NULL,NULL,NULL),
  ('852494939664544143','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 09:49:03',NULL,'UnRead','N_NEW_ORDER','8524949355571887975',NULL,NULL,NULL,NULL,NULL,NULL),
  ('852494948771395535','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 09:49:04',NULL,'UnRead','N_NEW_ORDER','8524949355571887975',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85249503714674673155','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 09:50:37',NULL,'Read','N_NEW_ORDER','85249503668046239124',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85249503723111718893','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 09:50:37',NULL,'Read','N_NEW_ORDER','85249503668046239124',NULL,NULL,NULL,NULL,NULL,NULL),
  ('852495037556165408','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 09:50:37',NULL,'Read','N_NEW_ORDER','85249503668046239124',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85249583098442565393','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (6)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-24 09:58:30',NULL,'Read','N_NEW_ORDER','85249583061195434766',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85249583118960918781','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-24 09:58:31',NULL,'Read','N_NEW_ORDER','85249583061195434766',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85249583134073142582','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-24 09:58:31',NULL,'Read','N_NEW_ORDER','85249583061195434766',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85251055528739739947','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3) ;Riz aux olives (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-25 10:55:52',NULL,'Read','N_NEW_ORDER','85251055514244889680',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85251055532052425659','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-25 10:55:53',NULL,'Read','N_NEW_ORDER','85251055514244889680',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85251055536495417925','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-25 10:55:53',NULL,'Read','N_NEW_ORDER','85251055514244889680',NULL,NULL,NULL,NULL,NULL,NULL),
  ('852511249396019263','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4) ;Riz aux olives (2) ;Poisson au four (2) ;Poisson piperade (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-25 11:02:04',NULL,'Read','N_NEW_ORDER','8525112230717553679',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8525112538454701327','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (2) ;Poisson au four (2) ;Poisson piperade (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-25 11:02:05',NULL,'Read','N_NEW_ORDER','8525112230717553679',NULL,NULL,NULL,NULL,NULL,NULL),
  ('852511255374992733','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (2) ;Poisson au four (2) ;Poisson piperade (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-25 11:02:05',NULL,'Read','N_NEW_ORDER','8525112230717553679',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85251322711481749862','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-25 13:22:07',NULL,'Read','N_NEW_ORDER','8525132252434967586',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85251322739184356623','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-25 13:22:07',NULL,'Read','N_NEW_ORDER','8525132252434967586',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8525132275678216303','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-25 13:22:07',NULL,'Read','N_NEW_ORDER','8525132252434967586',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85252025321844694495','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5) ;Riz aux olives (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-25 20:02:53',NULL,'UnRead','N_NEW_ORDER','85252025147329485030',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8525202534061617310','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-25 20:02:53',NULL,'UnRead','N_NEW_ORDER','85252025147329485030',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85252025360871354621','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-25 20:02:53',NULL,'UnRead','N_NEW_ORDER','85252025147329485030',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281320185875117956','31017105229982132919','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-28 13:20:18',NULL,'Read','N_VALIDATION_ORDER','85251055514244889680',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281320239332552608','31017105229982132919','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-28 13:20:23',NULL,'Read','N_VALIDATION_ORDER','85241856483057906154',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281320811278524047','31017105229982132919','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-28 13:20:08',NULL,'Read','N_VALIDATION_ORDER','8525132252434967586',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281331572738516742','31017105229982132919','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-28 13:31:57',NULL,'Read','N_VALIDATION_ORDER','8524185527538603383',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281342141548849829','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (2) ;Riz aux olives (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-28 13:42:14',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (2) ;Riz aux olives (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281342142937713825','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (2) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-28 13:42:14',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (2) ;Riz aux olives (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281342143777635532','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (2) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-28 13:42:14',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (2) ;Riz aux olives (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281344517106079862','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5) ;Riz aux olives (4) ;Poulet roti (6) ;Crème caramel (7) ;Jus de fruits (6) ;Croissant (4) ;Boeuf aux légumes  (3) ;Quaker (3) ;Bouillie de riz (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-28 13:44:51',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (4) ;Poulet roti (6) ;Crème caramel (7) ;Jus de fruits (6) ;Croissant (4) ;Boeuf aux légumes  (3) ;Quaker (3) ;Bouillie de riz (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281344517927471664','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (4) ;Poulet roti (6) ;Crème caramel (7) ;Jus de fruits (6) ;Croissant (4) ;Boeuf aux légumes  (3) ;Quaker (3) ;Bouillie de riz (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-28 13:44:51',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (4) ;Poulet roti (6) ;Crème caramel (7) ;Jus de fruits (6) ;Croissant (4) ;Boeuf aux légumes  (3) ;Quaker (3) ;Bouillie de riz (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281344519079450765','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (4) ;Poulet roti (6) ;Crème caramel (7) ;Jus de fruits (6) ;Croissant (4) ;Boeuf aux légumes  (3) ;Quaker (3) ;Bouillie de riz (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-28 13:44:51',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (4) ;Poulet roti (6) ;Crème caramel (7) ;Jus de fruits (6) ;Croissant (4) ;Boeuf aux légumes  (3) ;Quaker (3) ;Bouillie de riz (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8528142047170634408','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (1) ;Riz aux olives (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-28 14:20:47',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (1) ;Riz aux olives (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281420472844233749','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (1) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-28 14:20:47',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (1) ;Riz aux olives (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281420473748865150','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (1) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-28 14:20:47',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (1) ;Riz aux olives (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281421197328926473','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson piperade (1) ;Poisson au four (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-28 14:21:19',NULL,'UnRead','N_NEW_ORDER',';Poisson piperade (1) ;Poisson au four (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281421198322206746','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson piperade (1) ;Poisson au four (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-28 14:21:19',NULL,'UnRead','N_NEW_ORDER',';Poisson piperade (1) ;Poisson au four (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8528142119923843306','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson piperade (1) ;Poisson au four (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-28 14:21:19',NULL,'UnRead','N_NEW_ORDER',';Poisson piperade (1) ;Poisson au four (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281541589548656398','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (6) ;Riz aux olives (4) ;Poisson au four (2) ;Poulet roti (4) ;Mouton aux oignons (1) ;Crème caramel (6) ;Beurre (3) ;Poisson piperade (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-28 15:41:58',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (4) ;Poisson au four (2) ;Poulet roti (4) ;Mouton aux oignons (1) ;Crème caramel (6) ;Beurre (3) ;Poisson piperade (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281541591025609185','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6) ;Riz aux olives (4) ;Poisson au four (2) ;Poulet roti (4) ;Mouton aux oignons (1) ;Crème caramel (6) ;Beurre (3) ;Poisson piperade (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-28 15:41:59',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (4) ;Poisson au four (2) ;Poulet roti (4) ;Mouton aux oignons (1) ;Crème caramel (6) ;Beurre (3) ;Poisson piperade (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281541592012767554','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6) ;Riz aux olives (4) ;Poisson au four (2) ;Poulet roti (4) ;Mouton aux oignons (1) ;Crème caramel (6) ;Beurre (3) ;Poisson piperade (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-28 15:41:59',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (4) ;Poisson au four (2) ;Poulet roti (4) ;Mouton aux oignons (1) ;Crème caramel (6) ;Beurre (3) ;Poisson piperade (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281546243037718841','31017105229982132919','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-28 15:46:24',NULL,'Read','N_VALIDATION_ORDER','85281421192252463983',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8528182036991855370','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-28 18:20:03',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281820385087352020','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-28 18:20:03',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281820395674624858','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-28 18:20:03',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281835583787753469','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3) ;Riz aux olives (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-28 18:35:58',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281835585571526800','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-28 18:35:58',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281835587697795339','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-28 18:35:58',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281837295168060348','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4) ;Poisson au four (3) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-28 18:37:29',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Poisson au four (3) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281837296514989156','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Poisson au four (3) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-28 18:37:29',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Poisson au four (3) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281837297593121950','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Poisson au four (3) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-28 18:37:29',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Poisson au four (3) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8528185506245148202','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4) ;Poisson au four (2) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-28 18:05:50',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Poisson au four (2) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281855088655446876','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Poisson au four (2) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-28 18:05:50',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Poisson au four (2) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8528185516894195526','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Poisson au four (2) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-28 18:05:51',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Poisson au four (2) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281855223316524182','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4) ;Riz aux olives (6) ;Poisson au four (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-28 18:55:22',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (6) ;Poisson au four (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281855224847282809','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (6) ;Poisson au four (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-28 18:55:22',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (6) ;Poisson au four (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281855237311824362','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (6) ;Poisson au four (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-28 18:55:23',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (6) ;Poisson au four (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281856011575373698','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3) ;Riz aux olives (2) ;Poulet roti (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-28 18:56:00',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (2) ;Poulet roti (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8528185602838911948','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (2) ;Poulet roti (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-28 18:56:00',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (2) ;Poulet roti (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281856039332119273','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (2) ;Poulet roti (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-28 18:56:00',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (2) ;Poulet roti (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281863641231533330','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3) ;Riz aux olives (3) ;Poisson au four (4) ;Poisson piperade (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-28 18:06:36',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ;Poisson au four (4) ;Poisson piperade (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281863657147135605','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (3) ;Poisson au four (4) ;Poisson piperade (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-28 18:06:36',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ;Poisson au four (4) ;Poisson piperade (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281863670067963781','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (3) ;Poisson au four (4) ;Poisson piperade (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-28 18:06:36',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ;Poisson au four (4) ;Poisson piperade (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281938323481906226','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4) ;Riz aux olives (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-28 19:38:32',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281938325868374491','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-28 19:38:32',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281938327756774620','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-28 19:38:32',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281955509378262266','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (1) ;Riz aux olives (2) ;Poisson au four (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-28 19:55:50',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (1) ;Riz aux olives (2) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281955511223145266','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (1) ;Riz aux olives (2) ;Poisson au four (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-28 19:55:51',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (1) ;Riz aux olives (2) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281955513494400727','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (1) ;Riz aux olives (2) ;Poisson au four (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-28 19:55:51',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (1) ;Riz aux olives (2) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281955596940936','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3) ;Riz aux olives (3) ;Crème caramel (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-28 19:55:05',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ;Crème caramel (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('852819556470615933','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (3) ;Crème caramel (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-28 19:55:06',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ;Crème caramel (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85281955670892401613','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (3) ;Crème caramel (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-28 19:55:06',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ;Crème caramel (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85282001061299824938','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4) ;Riz aux olives (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-28 20:00:10',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85282001071247028611','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-28 20:00:10',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85282001082720329949','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-28 20:00:10',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85282035721428629968','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (1) ;Riz aux olives (1) ;Poisson au four (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-28 20:03:57',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (1) ;Riz aux olives (1) ;Poisson au four (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85282035733074681086','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (1) ;Riz aux olives (1) ;Poisson au four (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-28 20:03:57',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (1) ;Riz aux olives (1) ;Poisson au four (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8528203576792099974','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (1) ;Riz aux olives (1) ;Poisson au four (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-28 20:03:57',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (1) ;Riz aux olives (1) ;Poisson au four (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291056431963319142','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4) ;Riz aux olives (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-29 10:56:43',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291056434387061998','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-29 10:56:43',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291056436317457795','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-29 10:56:43',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291113328065552682','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Riz aux olives (1) ;Poisson à la camerounaise (2) ;Poisson au four (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-29 11:13:32',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (1) ;Poisson à la camerounaise (2) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291113329546551151','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (1) ;Poisson à la camerounaise (2) ;Poisson au four (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-29 11:13:32',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (1) ;Poisson à la camerounaise (2) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291113331927842755','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (1) ;Poisson à la camerounaise (2) ;Poisson au four (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-29 11:13:33',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (1) ;Poisson à la camerounaise (2) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291117474612724243','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Riz aux olives (2) ;Poisson à la camerounaise (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-29 11:17:47',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (2) ;Poisson à la camerounaise (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291117475845381296','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (2) ;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-29 11:17:47',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (2) ;Poisson à la camerounaise (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291117477279347316','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (2) ;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-29 11:17:47',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (2) ;Poisson à la camerounaise (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291120422086145433','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (6) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-29 11:20:42',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291120423082691851','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-29 11:20:42',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291120424026758213','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-29 11:20:42',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291127487287768449','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (6) ;Riz aux olives (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-29 11:27:48',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291127488981944625','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-29 11:27:48',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('852911274924327415','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-29 11:27:49',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291134821734714011','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4) ;Riz aux olives (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-29 11:03:48',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291134835076671153','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-29 11:03:48',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291134845999794056','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-29 11:03:48',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291144301193141383','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-29 11:44:30',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291144302924129527','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-29 11:44:30',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291144304716092534','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-29 11:44:30',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291146559887046279','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Riz aux olives (2) ;Poisson à la camerounaise (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-29 11:46:55',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (2) ;Poisson à la camerounaise (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291146563916204770','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (2) ;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-29 11:46:56',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (2) ;Poisson à la camerounaise (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291146565529850614','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (2) ;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-29 11:46:56',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (2) ;Poisson à la camerounaise (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291152497147449768','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3) ;Riz aux olives (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-29 11:52:49',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291152498526039647','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-29 11:52:49',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291152499667965448','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-29 11:52:49',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291154112986588544','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (2) ;Riz aux olives (6)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-29 11:54:11',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (2) ;Riz aux olives (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8529115411409550643','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (2) ;Riz aux olives (6)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-29 11:54:11',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (2) ;Riz aux olives (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291154115154724100','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (2) ;Riz aux olives (6)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-29 11:54:11',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (2) ;Riz aux olives (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291155267557657413','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-29 11:55:26',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291155268752361733','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-29 11:55:26',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291155269695088454','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-29 11:55:26',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('852911569708878672','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3) ;Riz aux olives (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-29 11:56:09',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291156985067965928','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-29 11:56:09',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8529115699693926131','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-29 11:56:09',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8529117303799528521','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3) ;Riz aux olives (2) ;Poisson au four (3) ;Poisson piperade (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-29 11:07:30',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (2) ;Poisson au four (3) ;Poisson piperade (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291173051852256803','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (2) ;Poisson au four (3) ;Poisson piperade (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-29 11:07:30',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (2) ;Poisson au four (3) ;Poisson piperade (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291173066418564284','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (2) ;Poisson au four (3) ;Poisson piperade (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-29 11:07:30',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (2) ;Poisson au four (3) ;Poisson piperade (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291247368862863693','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (10)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-29 12:47:36',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (10) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85291247371863051442','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (10)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-29 12:47:37',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (10) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8529124737188275780','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (10)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-29 12:47:37',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (10) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85298151898776285492','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5) ;Riz aux olives (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-29 08:15:18',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85298151912997075675','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-29 08:15:19',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85298151927652909529','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-29 08:15:19',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85298212416088734255','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (3) ;Poisson au four (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-29 08:21:24',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (3) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85298212426939155874','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (3) ;Poisson au four (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-29 08:21:24',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (3) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8529821245289938834','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4) ;Riz aux olives (3) ;Poisson au four (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-29 08:21:24',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (3) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8530104453549440557','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (8) ;Riz aux olives (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-30 10:04:45',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (8) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85301044560917228926','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (8) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-30 10:04:45',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (8) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85301044576475011737','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (8) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-30 10:04:45',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (8) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85301241463887810410','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-30 12:41:46',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85301241466247003304','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-30 12:41:46',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85301241468079322312','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-30 12:41:46',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('853091288114492328','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (1) ;Riz aux olives (3) ;Poisson au four (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-30 09:12:08',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (1) ;Riz aux olives (3) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8530912924764403384','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (1) ;Riz aux olives (3) ;Poisson au four (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-30 09:12:09',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (1) ;Riz aux olives (3) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85309129949229722','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (1) ;Riz aux olives (3) ;Poisson au four (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-30 09:12:09',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (1) ;Riz aux olives (3) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85309132416461935053','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3) ;Poulet roti (2) ;Beurre (2) ;Jus de fruits (4) ;Croissant (3) ;Boeuf aux légumes  (1) ;Quaker (2) ;Bouillie de riz (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-30 09:13:24',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Poulet roti (2) ;Beurre (2) ;Jus de fruits (4) ;Croissant (3) ;Boeuf aux légumes  (1) ;Quaker (2) ;Bouillie de riz (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85309132437312103503','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Poulet roti (2) ;Beurre (2) ;Jus de fruits (4) ;Croissant (3) ;Boeuf aux légumes  (1) ;Quaker (2) ;Bouillie de riz (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-30 09:13:24',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Poulet roti (2) ;Beurre (2) ;Jus de fruits (4) ;Croissant (3) ;Boeuf aux légumes  (1) ;Quaker (2) ;Bouillie de riz (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85309132452021271587','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Poulet roti (2) ;Beurre (2) ;Jus de fruits (4) ;Croissant (3) ;Boeuf aux légumes  (1) ;Quaker (2) ;Bouillie de riz (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-30 09:13:24',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Poulet roti (2) ;Beurre (2) ;Jus de fruits (4) ;Croissant (3) ;Boeuf aux légumes  (1) ;Quaker (2) ;Bouillie de riz (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8530915965183996778','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (6) ;Riz aux olives (6)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-30 09:01:59',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('853092032129037148','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6) ;Riz aux olives (6)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-30 09:02:00',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('853092050820766','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6) ;Riz aux olives (6)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-30 09:02:00',NULL,'Read','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (6) ','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('85311234285556767180','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson piperade (4) ;Jus de fruits (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-31 12:34:28',NULL,'UnRead','N_NEW_ORDER',';Poisson piperade (4) ;Jus de fruits (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311234286878044685','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson piperade (4) ;Jus de fruits (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-31 12:34:28',NULL,'UnRead','N_NEW_ORDER',';Poisson piperade (4) ;Jus de fruits (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311234288378591672','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson piperade (4) ;Jus de fruits (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-31 12:34:28',NULL,'UnRead','N_NEW_ORDER',';Poisson piperade (4) ;Jus de fruits (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311234477240702424','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4) ;Riz aux olives (5) ;Poulet roti (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-31 12:34:04',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (5) ;Poulet roti (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311234530796804600','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (5) ;Poulet roti (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-31 12:34:05',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (5) ;Poulet roti (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311234551654529112','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (5) ;Poulet roti (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-31 12:34:05',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (5) ;Poulet roti (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311255495676874304','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-31 12:55:49',NULL,'Read','N_VALIDATION_ORDER','85311234279178443509',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311256267082760713','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-31 12:56:26',NULL,'Read','N_VALIDATION_ORDER','85311234326223345427',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311303392615059556','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Jus de fruits (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-31 13:00:33',NULL,'UnRead','N_NEW_ORDER',';Jus de fruits (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311303413157805938','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-31 13:00:34',NULL,'UnRead','N_NEW_ORDER',';Jus de fruits (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8531130344140587886','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-31 13:00:34',NULL,'UnRead','N_NEW_ORDER',';Jus de fruits (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311324222996320244','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3) ;Riz aux olives (3) ;Jus de fruits (3) ;Croissant (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-31 13:24:22',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ;Jus de fruits (3) ;Croissant (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311324223981921422','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (3) ;Jus de fruits (3) ;Croissant (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-31 13:24:22',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ;Jus de fruits (3) ;Croissant (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311324226355935322','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (3) ;Jus de fruits (3) ;Croissant (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-31 13:24:22',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ;Jus de fruits (3) ;Croissant (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('853113244292868496','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-31 13:02:04',NULL,'Read','N_VALIDATION_ORDER','85311303361427873735',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8531132520647704926','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-31 13:25:20',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311325207303915680','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-31 13:25:20',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311325208213958177','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-31 13:25:20',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311327586185308627','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-31 13:27:58',NULL,'Read','N_VALIDATION_ORDER','85311325202243562926',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311328182697359503','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-31 13:28:18',NULL,'Read','N_VALIDATION_ORDER','85311324217217103978',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311330249835698680','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3) ;Poulet roti (2) ;Beurre (1) ;Jus de fruits (4) ;Croissant (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-31 13:30:24',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Poulet roti (2) ;Beurre (1) ;Jus de fruits (4) ;Croissant (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311330251244159531','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Poulet roti (2) ;Beurre (1) ;Jus de fruits (4) ;Croissant (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-31 13:30:25',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Poulet roti (2) ;Beurre (1) ;Jus de fruits (4) ;Croissant (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311330252034545833','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Poulet roti (2) ;Beurre (1) ;Jus de fruits (4) ;Croissant (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-31 13:30:25',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Poulet roti (2) ;Beurre (1) ;Jus de fruits (4) ;Croissant (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311333226241798121','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-31 13:33:22',NULL,'Read','N_VALIDATION_ORDER','85311330242678969983',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311445475321641161','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3) ;Riz aux olives (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-31 14:45:47',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311445477132365393','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-31 14:45:47',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311445477946952845','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-31 14:45:47',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8531151138779756676','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Quaker (1) ;Chocolat (1) ;Thé-lait (1) ;Beurre (1) ;Bouillie de riz (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-31 15:01:13',NULL,'UnRead','N_NEW_ORDER',';Quaker (1) ;Chocolat (1) ;Thé-lait (1) ;Beurre (1) ;Bouillie de riz (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311511398494524373','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Quaker (1) ;Chocolat (1) ;Thé-lait (1) ;Beurre (1) ;Bouillie de riz (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-31 15:01:13',NULL,'UnRead','N_NEW_ORDER',';Quaker (1) ;Chocolat (1) ;Thé-lait (1) ;Beurre (1) ;Bouillie de riz (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8531151145450404950','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Quaker (1) ;Chocolat (1) ;Thé-lait (1) ;Beurre (1) ;Bouillie de riz (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-31 15:01:14',NULL,'UnRead','N_NEW_ORDER',';Quaker (1) ;Chocolat (1) ;Thé-lait (1) ;Beurre (1) ;Bouillie de riz (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311542168256223470','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-31 15:42:16',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311542171161025521','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-31 15:42:17',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311542172726064920','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-31 15:42:17',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8531161865632630405','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-31 16:18:06',NULL,'Read','N_VALIDATION_ORDER','85311445469733333605',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311622531033185648','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-31 16:22:53',NULL,'Read','N_VALIDATION_ORDER','85311542148666433307',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311627553933414303','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (7)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-31 16:27:55',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (7) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311627555484416711','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (7)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-31 16:27:55',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (7) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311627556939469763','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (7)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-31 16:27:55',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (7) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311739885520683309','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-31 17:39:08',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311739898858729077','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-31 17:39:08',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311739911981409646','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-31 17:39:09',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311743326046448756','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-31 17:43:32',NULL,'Read','N_VALIDATION_ORDER','85311739846130367453',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311751111121484129','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-31 17:51:11',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311751112414643328','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-31 17:51:11',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311751113414099855','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-31 17:51:11',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311751587713839390','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-31 17:51:58',NULL,'Read','N_VALIDATION_ORDER','85311751108035575531',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311752241039928637','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-31 17:52:24',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311752241887965989','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-31 17:52:24',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8531175224232796227','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-31 17:52:24',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311795424460558165','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (6)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-31 17:09:54',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311795436056458177','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-31 17:09:54',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311795446648591355','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-31 17:09:54',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311846423623719725','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (7)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-31 18:46:42',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (7) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311846424522866650','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (7)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-31 18:46:42',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (7) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85311846425497040501','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (7)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-31 18:46:42',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (7) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85312252572409057598','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-31 22:52:57',NULL,'Read','N_VALIDATION_ORDER','85311752237477743132',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85312254152776930349','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson au four (1) ;Riz aux olives (1) ;Jus de fruits (1) ;Croissant (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-31 22:54:15',NULL,'UnRead','N_NEW_ORDER',';Poisson au four (1) ;Riz aux olives (1) ;Jus de fruits (1) ;Croissant (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85312254153614500137','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson au four (1) ;Riz aux olives (1) ;Jus de fruits (1) ;Croissant (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-31 22:54:15',NULL,'UnRead','N_NEW_ORDER',';Poisson au four (1) ;Riz aux olives (1) ;Jus de fruits (1) ;Croissant (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85312254154463354601','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson au four (1) ;Riz aux olives (1) ;Jus de fruits (1) ;Croissant (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-31 22:54:15',NULL,'UnRead','N_NEW_ORDER',';Poisson au four (1) ;Riz aux olives (1) ;Jus de fruits (1) ;Croissant (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85312258138648704324','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-31 22:58:13',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85312258141167487867','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-31 22:58:14',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85312258141728942651','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-31 22:58:14',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85312259266144388490','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Riz aux olives (4) ;Poisson au four (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-31 22:59:26',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (4) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85312259266915201629','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (4) ;Poisson au four (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-31 22:59:26',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (4) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85312259267762464564','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (4) ;Poisson au four (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-31 22:59:26',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (4) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85312312153818886399','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-31 23:01:21',NULL,'Read','N_VALIDATION_ORDER','85312259261294206340',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8531231382439378511','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-31 23:01:38',NULL,'Read','N_VALIDATION_ORDER','85312258134863223762',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85319264327038561302','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-31 09:26:43',NULL,'Read','N_VALIDATION_ORDER','85309132218636978093',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85319305740399979807','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-31 09:30:57',NULL,'Read','N_VALIDATION_ORDER','8530915746533842296',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85319451190077554765','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-31 09:45:11',NULL,'Read','N_VALIDATION_ORDER','8530912741755431770',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85319454263712997459','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-31 09:45:42',NULL,'Read','N_VALIDATION_ORDER','85301241447544209359',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8531951188367764614','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-05-31 09:51:18',NULL,'Read','N_VALIDATION_ORDER','85301044433956399165',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85418374815291519583','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (2) ;Riz aux olives (1) ;Poisson au four (1) ;Poulet roti (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-04 18:37:48',NULL,'UnRead','N_NEW_ORDER','85418374712886038991',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85418374822275813530','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (2) ;Riz aux olives (1) ;Poisson au four (1) ;Poulet roti (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-04 18:37:48',NULL,'UnRead','N_NEW_ORDER','85418374712886038991',NULL,NULL,NULL,NULL,NULL,NULL),
  ('854183748891122289','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (2) ;Riz aux olives (1) ;Poisson au four (1) ;Poulet roti (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-04 18:37:48',NULL,'UnRead','N_NEW_ORDER','85418374712886038991',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8551326355659244375','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (3) ;Riz aux olives (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-05 13:26:03',NULL,'UnRead','N_NEW_ORDER','8551326336785471229',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8551326361328644565','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (3) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-05 13:26:03',NULL,'UnRead','N_NEW_ORDER','8551326336785471229',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8551326368577865167','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (3) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-05 13:26:03',NULL,'UnRead','N_NEW_ORDER','8551326336785471229',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85514573867381462290','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (4) ;Riz aux olives (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-05 14:57:38',NULL,'UnRead','N_NEW_ORDER','8551457384804080119',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85514573874059874889','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-05 14:57:38',NULL,'UnRead','N_NEW_ORDER','8551457384804080119',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85514573880895278697','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (4) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-05 14:57:38',NULL,'UnRead','N_NEW_ORDER','8551457384804080119',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8571048307004458460','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à l''ivoirienne (1) ;Riz aux olives (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-07 10:48:30',NULL,'UnRead','N_NEW_ORDER','85710483042252037208',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85710483076342325413','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-07 10:48:30',NULL,'UnRead','N_NEW_ORDER','85710483042252037208',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85710483083933233482','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à l''ivoirienne (1) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-07 10:48:30',NULL,'UnRead','N_NEW_ORDER','85710483042252037208',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85715221917945085606','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (1) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-07 15:22:19',NULL,'UnRead','N_NEW_ORDER','85715221881079031961',NULL,NULL,NULL,NULL,NULL,NULL),
  ('857152219608469380','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (1) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-07 15:22:19',NULL,'UnRead','N_NEW_ORDER','85715221881079031961',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85715221996731972','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (1) ;Riz aux olives (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-07 15:22:19',NULL,'UnRead','N_NEW_ORDER','85715221881079031961',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8571650350353161600','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Riz aux olives (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-07 16:50:03',NULL,'UnRead','N_NEW_ORDER','8571650332114413199',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8571650358380738317','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-07 16:50:03',NULL,'UnRead','N_NEW_ORDER','8571650332114413199',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8571650363773841568','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-07 16:50:03',NULL,'UnRead','N_NEW_ORDER','8571650332114413199',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85812451513482727062','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-08 12:45:15',NULL,'UnRead','N_NEW_ORDER','8581245149684665510',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85812451520815169134','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-08 12:45:15',NULL,'UnRead','N_NEW_ORDER','8581245149684665510',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85812451526770035394','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-08 12:45:15',NULL,'UnRead','N_NEW_ORDER','8581245149684665510',NULL,NULL,NULL,NULL,NULL,NULL),
  ('858140190585588432','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-08 14:00:01',NULL,'UnRead','N_NEW_ORDER','858140167135055752',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85814019821813080','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-08 14:00:01',NULL,'UnRead','N_NEW_ORDER','858140167135055752',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85814024912242066','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-08 14:00:02',NULL,'UnRead','N_NEW_ORDER','858140167135055752',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8591123275818763352','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-05-09 11:23:27',NULL,'UnRead','N_NEW_ORDER','85911232670040449714',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85911232766939288869','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-05-09 11:23:27',NULL,'UnRead','N_NEW_ORDER','85911232670040449714',NULL,NULL,NULL,NULL,NULL,NULL),
  ('85911232772612071678','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-05-09 11:23:27',NULL,'UnRead','N_NEW_ORDER','85911232670040449714',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86116384138127401052','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-01 16:38:41',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8611638415290934474','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (6) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-01 16:38:41',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('861163841553917110','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-01 16:38:41',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8611639125445606294','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (7) ;Riz aux olives (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-01 16:39:12',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (7) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('861163912653988786','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (7) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-01 16:39:12',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (7) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86116391275157399421','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (7) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-01 16:39:12',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (7) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8611639388094396121','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5) ;Riz aux olives (6) ;Poisson au four (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-01 16:39:38',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (6) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86116393899798672437','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (6) ;Poisson au four (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-01 16:39:38',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (6) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8611639392109722403','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (6) ;Poisson au four (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-01 16:39:39',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (6) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86116424248378587885','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5) ;Riz aux olives (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-01 16:42:42',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86116424258523549508','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-01 16:42:42',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86116424268118747315','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-01 16:42:42',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86116442191482873119','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Jus de fruits (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-01 16:44:21',NULL,'UnRead','N_NEW_ORDER',';Jus de fruits (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8611644221075634482','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-01 16:44:22',NULL,'UnRead','N_NEW_ORDER',';Jus de fruits (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8611644221267194239','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Jus de fruits (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-01 16:44:22',NULL,'UnRead','N_NEW_ORDER',';Jus de fruits (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86116447177260198','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5) ;Riz aux olives (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-01 16:44:07',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8611644727743205192','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-01 16:44:07',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8611644737369738361','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-01 16:44:07',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86116564626259362835','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-01 16:56:46',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86116564636311882467','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-01 16:56:46',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86116564645982822041','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-01 16:56:46',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86118335326662228605','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson piperade (2) ;Poisson au four (2) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-01 18:33:53',NULL,'UnRead','N_NEW_ORDER',';Poisson piperade (2) ;Poisson au four (2) ;Jus de fruits (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86118335339386925242','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson piperade (2) ;Poisson au four (2) ;Jus de fruits (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-01 18:33:53',NULL,'UnRead','N_NEW_ORDER',';Poisson piperade (2) ;Poisson au four (2) ;Jus de fruits (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8611833538982452085','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson piperade (2) ;Poisson au four (2) ;Jus de fruits (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-01 18:33:53',NULL,'UnRead','N_NEW_ORDER',';Poisson piperade (2) ;Poisson au four (2) ;Jus de fruits (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86118354531442317798','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-01 18:35:45',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86118354545472678164','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-01 18:35:45',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86118354556230733842','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-01 18:35:45',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8611836249935634952','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-01 18:36:24',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86118362511783935535','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-01 18:36:25',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8611836252831012971','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-01 18:36:25',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86119493410449604661','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (8) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-01 19:49:34',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (8) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86119493426234069492','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (8) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-01 19:49:34',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (8) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86119493439318451286','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (8) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-01 19:49:34',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (8) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86119521338672881820','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (8) ;Riz aux olives (7)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-01 19:52:13',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (8) ;Riz aux olives (7) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86119521352829159368','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (8) ;Riz aux olives (7)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-01 19:52:13',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (8) ;Riz aux olives (7) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86119521362956976208','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (8) ;Riz aux olives (7)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-01 19:52:13',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (8) ;Riz aux olives (7) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86120111259057347508','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Riz aux olives (7)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-01 20:11:12',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (7) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86120111271082636457','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (7)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-01 20:11:12',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (7) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('861201113264504704','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (7)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-01 20:11:13',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (7) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86120163978267262000','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (2) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-01 20:16:39',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (2) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86120164026221787967','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (2) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-01 20:16:40',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (2) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8612016406656208912','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (2) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-01 20:16:40',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (2) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86120253064931872301','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (2) ;Riz aux olives (6)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-01 20:25:30',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (2) ;Riz aux olives (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86120253074136379642','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (2) ;Riz aux olives (6)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-01 20:25:30',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (2) ;Riz aux olives (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86120253090575202623','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (2) ;Riz aux olives (6)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-01 20:25:30',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (2) ;Riz aux olives (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86121333211917434663','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-01 21:33:32',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('861213332234163274','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-01 21:33:32',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86121333232798324147','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-01 21:33:32',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8612214079484077963','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-06-01 22:14:00',NULL,'Read','N_VALIDATION_ORDER','86120111213272919766',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8612216413491157972','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-06-01 22:16:04',NULL,'Read','N_VALIDATION_ORDER','86116564594378135876',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86122165093134096890','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-06-01 22:16:50',NULL,'Read','N_VALIDATION_ORDER','861195212695132545',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8612219547671608428','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-06-01 22:19:54',NULL,'Read','N_VALIDATION_ORDER','8612016389345463661',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86212311198291428214','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-02 12:31:11',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8621231121785328696','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-02 12:31:12',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86212311230913669463','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-02 12:31:12',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86212533769730493455','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-06-02 12:53:37',NULL,'Read','N_VALIDATION_ORDER','86119493332162366961',NULL,NULL,NULL,NULL,NULL,NULL),
  ('862125414949173529','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-06-02 12:54:14',NULL,'Read','N_VALIDATION_ORDER','8612025302217011405',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86216312920385786435','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-06-02 16:31:29',NULL,'Read','N_VALIDATION_ORDER','86212311091531806552',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8621649505896353496','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (6)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-02 16:49:50',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86216495076170336137','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-02 16:49:50',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86216495098163892612','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-02 16:49:50',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86216501144394551557','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3) ;Riz aux olives (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-02 16:50:11',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL);
COMMIT;

/* Data for the `t_notification` table  (LIMIT 1099,500) */

INSERT INTO `t_notification` (`lg_ID`, `lg_USER_ID_IN`, `lg_USER_ID_OUT`, `str_DESCRIPTION`, `str_CONTENT`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`, `str_TYPE`, `str_REF_RESSOURCE`, `str_CUST_ACCOUNT_ID`, `str_URL_PIC`, `str_NAME`, `str_CHANNEL`, `str_CHANNEL_READ`, `str_GPS`) VALUES
  ('86216501167365448283','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-02 16:50:11',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86216501179951552586','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-02 16:50:11',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86216554847933987437','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-06-02 16:55:48',NULL,'Read','N_VALIDATION_ORDER','8611835446044795379',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86216561199846473','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-06-02 16:56:01',NULL,'Read','N_VALIDATION_ORDER','86118335183155888527',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86216564659412139607','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Riz aux olives (3) ;Poisson à la camerounaise (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-02 16:56:46',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (3) ;Poisson à la camerounaise (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8621656467635787586','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (3) ;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-02 16:56:46',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (3) ;Poisson à la camerounaise (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86216564693712365466','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Riz aux olives (3) ;Poisson à la camerounaise (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-02 16:56:46',NULL,'UnRead','N_NEW_ORDER',';Riz aux olives (3) ;Poisson à la camerounaise (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86217365420245502718','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (6)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-02 17:36:54',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86217365429178247911','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-02 17:36:54',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86217365438388209935','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-02 17:36:54',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86217382583144192517','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-06-02 17:38:25',NULL,'Read','N_VALIDATION_ORDER','8621736539105397424',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86217649637224837','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-06-02 17:06:49',NULL,'Read','N_VALIDATION_ORDER','86216564592328825152',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86515241234421687646','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-05 15:24:12',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('865152412436654340','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-05 15:24:12',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86515241259063583183','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-05 15:24:12',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86515251545495095','31017105229982132919','31017105229982132919','N_ORDER_SEND_TO_KITCHEN','LA COMMANDE A ETE ENVOYE EN CUISINE  PAR  THIERRY BEKOLA.','2018-06-05 15:25:01',NULL,'Read','N_ORDER_SEND_TO_KITCHEN','N_ORDER_SEND_TO_KITCHEN','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('86515301664048226064','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (7)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-05 15:30:16',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (7) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86515301673268261710','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (7)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-05 15:30:16',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (7) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86515301689784447184','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (7)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-05 15:30:16',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (7) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8651610398149512111',NULL,'42150222079569572824','N_TOURNEE_IS_CREATE','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR SANDRA ENDALLE','2018-06-05 16:10:39',NULL,'Read','N_TOURNEE_IS_CREATE','N_TOURNEE_IS_CREATE','42150222079569572824',NULL,NULL,NULL,NULL,NULL),
  ('86516125736835863382',NULL,'42150222079569572824','N_TOURNEE_IS_CREATE','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR SANDRA ENDALLE','2018-06-05 16:12:57',NULL,'Read','N_TOURNEE_IS_CREATE','N_TOURNEE_IS_CREATE','42150222079569572824',NULL,NULL,NULL,NULL,NULL),
  ('8651614092129168974',NULL,'42150222079569572824','N_TOURNEE_IS_CREATE','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR SANDRA ENDALLE','2018-06-05 16:14:00',NULL,'Read','N_TOURNEE_IS_CREATE','N_TOURNEE_IS_CREATE','42150222079569572824',NULL,NULL,NULL,NULL,NULL),
  ('86516175839599303815',NULL,'42150222079569572824','N_TOURNEE_IS_CREATE','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR SANDRA ENDALLE','2018-06-05 16:17:58',NULL,'Read','N_TOURNEE_IS_CREATE','N_TOURNEE_IS_CREATE','42150222079569572824',NULL,NULL,NULL,NULL,NULL),
  ('8651684023463136154',NULL,'42150222079569572824','N_TOURNEE_IS_CREATE','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR SANDRA ENDALLE','2018-06-05 16:08:40',NULL,'Read','N_TOURNEE_IS_CREATE','N_TOURNEE_IS_CREATE','42150222079569572824',NULL,NULL,NULL,NULL,NULL),
  ('86517163929175272682','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4) ;Riz aux olives (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-05 17:16:39',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517163943131541703','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-05 17:16:39',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517163952783389988','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-05 17:16:39',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8651719237993749267','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (7) ;Riz aux olives (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-05 17:19:23',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (7) ;Riz aux olives (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517192398929136984','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (7) ;Riz aux olives (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-05 17:19:23',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (7) ;Riz aux olives (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8651719249255496088','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (7) ;Riz aux olives (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-05 17:19:24',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (7) ;Riz aux olives (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517201388953822353','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (6) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-05 17:20:13',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517201412610976680','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-05 17:20:14',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('865172014628761823','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-05 17:20:14',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517211228238138954','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5) ;Riz aux olives (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-05 17:21:12',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517211238028984014','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-05 17:21:12',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517211248330057886','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-05 17:21:12',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517223594284706812','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4) ;Riz aux olives (4)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-05 17:22:35',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517223618132288974','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-05 17:22:36',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8651722366277829988','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (4)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-05 17:22:36',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (4) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8651728434015026701','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (1) ;Riz aux olives (1) ;Poisson au four (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-05 17:28:43',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (1) ;Riz aux olives (1) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517284350025675330','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (1) ;Riz aux olives (1) ;Poisson au four (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-05 17:28:43',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (1) ;Riz aux olives (1) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517284358741871093','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (1) ;Riz aux olives (1) ;Poisson au four (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-05 17:28:43',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (1) ;Riz aux olives (1) ;Poisson au four (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517294189580259265','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-05 17:29:41',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517294213217823895','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-05 17:29:42',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8651729424268097421','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-05 17:29:42',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517342074229801102','31017105229982132919','31017105229982132919','N_ORDER_SEND_TO_KITCHEN','LA COMMANDE A ETE ENVOYE EN CUISINE  PAR  THIERRY BEKOLA.','2018-06-05 17:34:20',NULL,'Read','N_ORDER_SEND_TO_KITCHEN','N_ORDER_SEND_TO_KITCHEN','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('86517342571236041225','31017105229982132919','31017105229982132919','N_ORDER_SEND_TO_KITCHEN','LA COMMANDE A ETE ENVOYE EN CUISINE  PAR  THIERRY BEKOLA.','2018-06-05 17:34:25',NULL,'Read','N_ORDER_SEND_TO_KITCHEN','N_ORDER_SEND_TO_KITCHEN','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('86517401328091335457',NULL,NULL,'N_ORDER_IS_DELEVREY_PROCESS','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR THIERRY BEKOLA','2018-06-05 17:40:13',NULL,'Read','N_ORDER_IS_DELEVREY_PROCESS','N_ORDER_IS_DELEVREY_PROCESS','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('86517401344316329102',NULL,NULL,'N_ORDER_IS_DELEVREY_PROCESS','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR THIERRY BEKOLA','2018-06-05 17:40:13',NULL,'Read','N_ORDER_IS_DELEVREY_PROCESS','N_ORDER_IS_DELEVREY_PROCESS','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('86517401362323342770',NULL,NULL,'N_ORDER_IS_DELEVREY_PROCESS','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR THIERRY BEKOLA','2018-06-05 17:40:13',NULL,'Read','N_ORDER_IS_DELEVREY_PROCESS','N_ORDER_IS_DELEVREY_PROCESS','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('86517403450364625964','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-06-05 17:40:34',NULL,'Read','N_VALIDATION_ORDER','86517294151396421520',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517435380762362316','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-06-05 17:43:53',NULL,'Read','N_VALIDATION_ORDER','86517284252418926631',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8651744050072342495',NULL,'42150222079569572824','N_TOURNEE_IS_DONE','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR SANDRA ENDALLE','2018-06-05 17:44:00',NULL,'Read','N_TOURNEE_IS_DONE','N_TOURNEE_IS_DONE','42150222079569572824',NULL,NULL,NULL,NULL,NULL),
  ('86517443520379598196','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-05 17:44:35',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517443529657274293','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (6) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-05 17:44:35',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8651744358138516658','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (6) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-05 17:44:35',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (6) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517444343642777981','31017105229982132919','31017105229982132919','N_ORDER_SEND_TO_KITCHEN','LA COMMANDE A ETE ENVOYE EN CUISINE  PAR  THIERRY BEKOLA.','2018-06-05 17:44:43',NULL,'Read','N_ORDER_SEND_TO_KITCHEN','N_ORDER_SEND_TO_KITCHEN','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('86517451653643047994',NULL,NULL,'N_ORDER_IS_DELEVREY_PROCESS','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR THIERRY BEKOLA','2018-06-05 17:45:16',NULL,'Read','N_ORDER_IS_DELEVREY_PROCESS','N_ORDER_IS_DELEVREY_PROCESS','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('865174518653974991',NULL,'42150222079569572824','N_TOURNEE_IS_CREATE','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR SANDRA ENDALLE','2018-06-05 17:45:01',NULL,'Read','N_TOURNEE_IS_CREATE','N_TOURNEE_IS_CREATE','42150222079569572824',NULL,NULL,NULL,NULL,NULL),
  ('86517454178296788884','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-06-05 17:45:41',NULL,'Read','N_VALIDATION_ORDER','86517443456938547121',NULL,NULL,NULL,NULL,NULL,NULL),
  ('865174558391752772',NULL,'42150222079569572824','N_TOURNEE_IS_DONE','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR SANDRA ENDALLE','2018-06-05 17:45:58',NULL,'Read','N_TOURNEE_IS_DONE','N_TOURNEE_IS_DONE','42150222079569572824',NULL,NULL,NULL,NULL,NULL),
  ('86517464953137312677',NULL,'42150222079569572824','N_TOURNEE_IS_CREATE','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR SANDRA ENDALLE','2018-06-05 17:46:49',NULL,'Read','N_TOURNEE_IS_CREATE','N_TOURNEE_IS_CREATE','42150222079569572824',NULL,NULL,NULL,NULL,NULL),
  ('86517521558352609534','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (3) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-05 17:52:15',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517521567621284','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-05 17:52:15',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86517521576141817645','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (3) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-05 17:52:15',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (3) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8651752248524435463','31017105229982132919','31017105229982132919','N_ORDER_SEND_TO_KITCHEN','LA COMMANDE A ETE ENVOYE EN CUISINE  PAR  THIERRY BEKOLA.','2018-06-05 17:52:24',NULL,'Read','N_ORDER_SEND_TO_KITCHEN','N_ORDER_SEND_TO_KITCHEN','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('86517524031447458883',NULL,NULL,'N_ORDER_IS_DELEVREY_PROCESS','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR THIERRY BEKOLA','2018-06-05 17:52:40',NULL,'Read','N_ORDER_IS_DELEVREY_PROCESS','N_ORDER_IS_DELEVREY_PROCESS','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('8651775962911668171',NULL,'42150222079569572824','N_TOURNEE_IS_CREATE','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR SANDRA ENDALLE','2018-06-05 17:07:59',NULL,'Read','N_TOURNEE_IS_CREATE','N_TOURNEE_IS_CREATE','42150222079569572824',NULL,NULL,NULL,NULL,NULL),
  ('86519173050789658708','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-06-05 19:17:30',NULL,'Read','N_VALIDATION_ORDER','8651752156140127940',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8651917377887127177',NULL,'42150222079569572824','N_TOURNEE_IS_DONE','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR SANDRA ENDALLE','2018-06-05 19:17:37',NULL,'Read','N_TOURNEE_IS_DONE','N_TOURNEE_IS_DONE','42150222079569572824',NULL,NULL,NULL,NULL,NULL),
  ('86519353425150124316','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (8) ;Riz aux olives (6)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-05 19:35:34',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (8) ;Riz aux olives (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86519353432970525345','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (8) ;Riz aux olives (6)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-05 19:35:34',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (8) ;Riz aux olives (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86519353444368288019','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (8) ;Riz aux olives (6)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-05 19:35:34',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (8) ;Riz aux olives (6) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8651938783746765055','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-05 19:38:07',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8651938791234062324','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-05 19:38:07',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8651938798634743852','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-05 19:38:07',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8651940592541788626','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5) ;Riz aux olives (3)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-05 19:40:05',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8651940610970359267','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-05 19:40:06',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86519406257346986','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (3)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-05 19:40:06',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (3) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86519425125465608934','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4) ;Riz aux olives (2)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-05 19:42:51',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86519425133583922008','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-05 19:42:51',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86519425141934192241','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (2)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-05 19:42:51',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (2) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86519475164546676597','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (7) ;Riz aux olives (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-05 19:47:51',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (7) ;Riz aux olives (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86519475172254396288','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (7) ;Riz aux olives (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-05 19:47:51',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (7) ;Riz aux olives (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8651947518093437661','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (7) ;Riz aux olives (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-05 19:47:51',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (7) ;Riz aux olives (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86519513994655809452','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (5) ;Riz aux olives (5)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-05 19:51:39',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86519514012956416502','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (5)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-05 19:51:40',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('865195140397072851','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (5) ;Riz aux olives (5)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-05 19:51:40',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (5) ;Riz aux olives (5) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8652218291879731707',NULL,'42150222079569572824','N_TOURNEE_IS_CREATE','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR SANDRA ENDALLE','2018-06-05 22:18:29',NULL,'Read','N_TOURNEE_IS_CREATE','N_TOURNEE_IS_CREATE','42150222079569572824',NULL,NULL,NULL,NULL,NULL),
  ('86522184325446067710','31017105229982132919','31017105229982132919','N_ORDER_SEND_TO_KITCHEN','LA COMMANDE A ETE ENVOYE EN CUISINE  PAR  THIERRY BEKOLA.','2018-06-05 22:18:43',NULL,'Read','N_ORDER_SEND_TO_KITCHEN','N_ORDER_SEND_TO_KITCHEN','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('86522184681984171755','31017105229982132919','31017105229982132919','N_ORDER_SEND_TO_KITCHEN','LA COMMANDE A ETE ENVOYE EN CUISINE  PAR  THIERRY BEKOLA.','2018-06-05 22:18:46',NULL,'Read','N_ORDER_SEND_TO_KITCHEN','N_ORDER_SEND_TO_KITCHEN','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('86522185173195101192','31017105229982132919','31017105229982132919','N_ORDER_SEND_TO_KITCHEN','LA COMMANDE A ETE ENVOYE EN CUISINE  PAR  THIERRY BEKOLA.','2018-06-05 22:18:51',NULL,'Read','N_ORDER_SEND_TO_KITCHEN','N_ORDER_SEND_TO_KITCHEN','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('86522191437894122476',NULL,NULL,'N_ORDER_IS_DELEVREY_PROCESS','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR THIERRY BEKOLA','2018-06-05 22:19:14',NULL,'Read','N_ORDER_IS_DELEVREY_PROCESS','N_ORDER_IS_DELEVREY_PROCESS','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('8652346574346875689','31017105229982132919','31017105229982132919','Nouvelle Commande','UNE NOUVELLE COMMANDE  DE ;Poisson à la camerounaise (4) ;Riz aux olives (1)  A ETE ENREGISTRER PAR MASTER  KEN','2018-06-05 23:46:05',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8652346585173345711','31017105229982132919','31021555156476006126','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR BEKOLA  THIERRY','2018-06-05 23:46:05',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8652346594087942660','31017105229982132919','3102612583420124210','Nouvelle Commande','UNE NOUVELLE COMMANDE  <br>;Poisson à la camerounaise (4) ;Riz aux olives (1)  <br>A ETE ENREGISTRER PAR VALENCIA  N''GUESSAN','2018-06-05 23:46:05',NULL,'UnRead','N_NEW_ORDER',';Poisson à la camerounaise (4) ;Riz aux olives (1) ',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8660038737248548','42150222079569572824','74291246249406234232','N_VALIDATION_ORDER','LA COMMANDE A ETE VALIDER PAR  PISAM  PISAM.','2018-06-06 00:00:38',NULL,'Read','N_VALIDATION_ORDER','86519513955910866643',NULL,NULL,NULL,NULL,NULL,NULL),
  ('866003911579407919','42150222079569572824','42150222079569572824','N_ORDER_IS_PAID_PROCESS','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR THIERRY BEKOLA','2018-06-06 00:00:39',NULL,'Read','N_ORDER_IS_PAID_PROCESS','N_ORDER_IS_PAID_PROCESS','84221657222332544271',NULL,NULL,NULL,NULL,NULL),
  ('866005096293175526',NULL,'42150222079569572824','N_TOURNEE_IS_DONE','UNE NOUVELLE COMMANDE  DE  A ETE ENREGISTRER PAR SANDRA ENDALLE','2018-06-06 00:00:50',NULL,'Read','N_TOURNEE_IS_DONE','N_TOURNEE_IS_DONE','42150222079569572824',NULL,NULL,NULL,NULL,NULL);
COMMIT;

/* Data for the `t_table` table  (LIMIT 0,500) */

INSERT INTO `t_table` (`lg_TABLE_ID`, `str_NAME`, `str_PIC_ORIGINALE`, `str_PIC_SMALL`, `str_PIC_MIDDLE`, `str_PIC_BIG`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('1','Table 2',NULL,'tabledefault.png',NULL,NULL,NULL,NULL,'enable'),
  ('31022182118243401935','Table 1',NULL,'tabledefault.png',NULL,NULL,NULL,NULL,'enable'),
  ('31022182412941329665','Table 3',NULL,'tabledefault.png',NULL,NULL,NULL,NULL,'enable'),
  ('41128855546128502854','Table 5',NULL,'tabledefault.png',NULL,NULL,NULL,NULL,'enable'),
  ('4291856342683972238','Table 4',NULL,'tabledefault.png',NULL,NULL,NULL,NULL,'enable'),
  ('67101782469567261235','Table 6',NULL,'tabledefault.png',NULL,NULL,NULL,NULL,'enable'),
  ('67101783052732518279','Table 7',NULL,'tabledefault.png',NULL,NULL,NULL,NULL,'enable'),
  ('6710178357505841880','Table 8',NULL,'tabledefault.png',NULL,NULL,NULL,NULL,'enable'),
  ('67101784583059445974','Table 9',NULL,'tabledefault.png',NULL,NULL,NULL,NULL,'enable'),
  ('67101785225197771978','Table 10',NULL,'tabledefault.png',NULL,NULL,NULL,NULL,'enable');
COMMIT;

/* Data for the `t_order` table  (LIMIT 0,500) */

INSERT INTO `t_order` (`lg_ORDER_ID`, `str_NAME`, `lg_TABLE_ID`, `int_PRICE`, `dt_CREATED`, `dt_VALIDATED`, `dt_UPDATED`, `str_STATUT`, `str_REF`, `lg_USER_ID`, `int_PRICE_UN_PAID`) VALUES
  ('86116564594378135876','','1',3280,'2018-06-01 16:56:45','2018-06-01 22:16:03','2018-06-01 16:56:46','paid','861_00002','31017105229982132919',4000),
  ('86118335183155888527','','1',10660,'2018-06-01 18:33:51','2018-06-02 16:55:59','2018-06-01 18:33:53','paid','861_00002','31017105229982132919',13000),
  ('8611835446044795379','','1',8610,'2018-06-01 18:35:44','2018-06-02 16:55:40','2018-06-01 18:35:45','paid','861_00003','31017105229982132919',10500),
  ('86118362458211559478','','1',0,'2018-06-01 18:36:24',NULL,'2018-06-01 18:36:32','cancel','861_00004','31017105229982132919',5000),
  ('86119493332162366961','','1',12710,'2018-06-01 19:49:33','2018-06-02 12:53:34','2018-06-01 19:49:34','paid','861_00005','31017105229982132919',15500),
  ('861195212695132545','','1',20910,'2018-06-01 19:52:12','2018-06-01 22:16:49','2018-06-01 19:52:13','paid','861_00006','31017105229982132919',25500),
  ('86120111213272919766','','1',14350,'2018-06-01 20:11:12','2018-06-01 22:13:58','2018-06-01 20:11:13','paid','861_00007','31017105229982132919',17500),
  ('8612016389345463661','','1',7790,'2018-06-01 20:16:38','2018-06-01 22:19:53','2018-06-01 20:16:40','paid','861_00008','31017105229982132919',9500),
  ('8612025302217011405','','1',13940,'2018-06-01 20:25:30','2018-06-02 12:54:13','2018-06-01 20:25:31','paid','861_00009','31017105229982132919',17000),
  ('86121333121652929186','','1',0,'2018-06-01 21:33:31',NULL,'2018-06-01 21:33:40','cancel','861_00010','31017105229982132919',4000),
  ('86212311091531806552','','1',10250,'2018-06-02 12:31:10','2018-06-02 16:31:25','2018-06-02 12:31:12','paid','862_00001','31017105229982132919',12500),
  ('86216494993974206840','','1',0,'2018-06-02 16:49:49',NULL,'2018-06-02 16:52:48','cancel','862_00002','31017105229982132919',6000),
  ('8621650107066243757','','1',0,'2018-06-02 16:50:10',NULL,'2018-06-02 16:50:43','cancel','862_00003','31017105229982132919',8000),
  ('86216564592328825152','','1',9430,'2018-06-02 16:56:45','2018-06-02 17:06:48','2018-06-02 16:56:47','paid','862_00004','31017105229982132919',11500),
  ('8621736539105397424','','1',4920,'2018-06-02 17:36:53','2018-06-02 17:38:24','2018-06-02 17:36:54','paid','862_00005','31017105229982132919',6000),
  ('86515241077722045360','','1',0,'2018-06-05 15:24:10',NULL,'2018-06-05 15:24:12','unpaid','865_00001','31017105229982132919',3000),
  ('86515301620162705169','','1',0,'2018-06-05 15:30:16',NULL,'2018-06-05 15:30:17','unpaid','865_00002','31017105229982132919',7000),
  ('8651716387786893637','','1',0,'2018-06-05 17:16:38',NULL,'2018-06-05 17:16:39','unpaid','865_00003','31017105229982132919',14000),
  ('86517192338769291896','','1',0,'2018-06-05 17:19:23',NULL,'2018-06-05 17:19:24','unpaid','865_00004','31017105229982132919',19500),
  ('8651720132991362980','','1',0,'2018-06-05 17:20:13',NULL,'2018-06-05 17:20:14','unpaid','865_00005','31017105229982132919',13500),
  ('86517211174537777069','','1',0,'2018-06-05 17:21:11',NULL,'2018-06-05 17:21:12','unpaid','865_00006','31017105229982132919',10000),
  ('86517223542866183262','','1',0,'2018-06-05 17:22:35',NULL,'2018-06-05 17:39:28','cancel','865_00007','31017105229982132919',14000),
  ('86517284252418926631','','1',11480,'2018-06-05 17:28:42','2018-06-05 17:43:52','2018-06-05 17:28:43','paid','865_00008','31017105229982132919',14000),
  ('86517294151396421520','','1',10250,'2018-06-05 17:29:41','2018-06-05 17:40:32','2018-06-05 17:29:42','paid','865_00009','31017105229982132919',12500),
  ('86517443456938547121','','1',11070,'2018-06-05 17:44:34','2018-06-05 17:45:40','2018-06-05 17:44:35','paid','865_00010','31017105229982132919',13500),
  ('8651752156140127940','','1',8610,'2018-06-05 17:52:15','2018-06-05 19:17:29','2018-06-05 17:52:16','paid','865_00011','31017105229982132919',10500),
  ('86519353376754396817','','1',0,'2018-06-05 19:35:33',NULL,'2018-06-05 19:35:34','unpaid','865_00012','31017105229982132919',23000),
  ('8651938721712683388','','1',0,'2018-06-05 19:38:07',NULL,'2018-06-05 19:38:08','unpaid','865_00013','31017105229982132919',11500),
  ('8651940549173491874','','1',0,'2018-06-05 19:40:05',NULL,'2018-06-05 19:40:06','unpaid','865_00014','31017105229982132919',12500),
  ('86519425060033243803','','1',0,'2018-06-05 19:42:50',NULL,'2018-06-05 19:42:51','unpaid','865_00015','31017105229982132919',9000),
  ('8651947518092498914','','1',0,'2018-06-05 19:47:51',NULL,'2018-06-05 19:47:51','unpaid','865_00016','31017105229982132919',19500),
  ('86519513955910866643','','1',14350,'2018-06-05 19:51:39','2018-06-06 00:00:36','2018-06-05 19:51:40','paid','865_00017','31017105229982132919',17500),
  ('8652346489366766425','','1',0,'2018-06-05 23:46:04',NULL,'2018-06-05 23:46:06','unpaid','865_00018','31017105229982132919',6500);
COMMIT;

/* Data for the `t_order_customer_account` table  (LIMIT 0,500) */

INSERT INTO `t_order_customer_account` (`lg_ORDER_CUSTOMER_ACCOUNT_ID`, `int_AMOUNT_DEMANDE`, `int_AMOUNT_RECU`, `int_AMOUNT_DIFFERENCE`, `lg_CUSTOMER_ACCOUNT_ID`, `lg_ORDER_ID`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`, `lg_PARENT_ID`, `lg_LIT_OCCUPATION_ID`, `lg_MENU_REPAS_ID`, `lg_TYPE_MENU_ID`, `dt_DATE_ORDER`, `str_GPS`, `str_PAYEMENT_METHODE`, `str_ZONNE_1`, `str_ZONNE_2`, `str_ZONNE_3`, `str_ZONNE_4`, `str_ZONNE_5`, `str_ZONNE_6`, `str_ZONNE_7`, `str_REF_TOURNNEE`) VALUES
  ('86517223660843616976',14000,0,0,'84221657222332544271','86517223542866183262','2018-06-05 17:22:36','2018-06-05 17:39:28','cancel',NULL,NULL,'SYS','1','2018-06-05','5.405404;-3.982330000000001','Orange Money','99347035','Abidjan',' CÃ´te d''Ivoire','99347035','',NULL,NULL,''),
  ('865172844676717956',14000,0,0,'84221657222332544271','86517284252418926631','2018-06-05 17:28:44','2018-06-05 17:43:53','paid',NULL,NULL,'SYS','1','2018-06-05','5.400422500000012;-3.9915507812499844','A la livraison','Boulevard des Martyrs',' Abidjan',' CÃ´te d''Ivoire','99347035','',NULL,NULL,'86517759344110626'),
  ('86517294255843826040',12500,0,0,'84221657222332544271','86517294151396421520','2018-06-05 17:29:42','2018-06-05 17:40:34','paid',NULL,NULL,'SYS','1','2018-06-05','5.405404;-3.982330000000001','Orange Money','99347035','Abidjan',' CÃ´te d''Ivoire','99347035','',NULL,NULL,'86517759344110626'),
  ('86517443583033036458',13500,0,0,'84221657222332544271','86517443456938547121','2018-06-05 17:44:35','2018-06-05 17:45:41','paid',NULL,NULL,'SYS','1','2018-06-05','5.400422500000012;-3.9915507812499844','Orange Money','Boulevard des Martyrs',' Abidjan',' CÃ´te d''Ivoire','99347035','',NULL,NULL,'8651745096496545901'),
  ('8651752162834163829',10500,0,0,'84221657222332544271','8651752156140127940','2018-06-05 17:52:16','2018-06-05 19:17:30','paid',NULL,NULL,'SYS','1','2018-06-05','5.400422500000012;-3.9915507812499844','Orange Money','Boulevard des Martyrs',' Abidjan',' CÃ´te d''Ivoire','99347035','',NULL,NULL,'86517464937520722438'),
  ('86519353491937772018',23000,0,0,'84221657222332544271','86519353376754396817','2018-06-05 19:35:35',NULL,'is_Waiting',NULL,NULL,'SYS','1','2018-06-05','5.405404;-3.982330000000001','Orange Money','99347035','Abidjan',' CÃ´te d''Ivoire','99347035','',NULL,NULL,''),
  ('865193883624850333',11500,0,0,'84221657222332544271','8651938721712683388','2018-06-05 19:38:08',NULL,'is_Waiting',NULL,NULL,'SYS','1','2018-06-05','5.4064975000000075;-3.9907539062500206','Orange Money','M 2',' Abidjan',' CÃ´te d''Ivoire','99347035','',NULL,NULL,''),
  ('8651940644064699013',12500,0,0,'84221657222332544271','8651940549173491874','2018-06-05 19:40:06',NULL,'is_Waiting',NULL,NULL,'SYS','1','2018-06-05','5.4064975000000075;-3.9907539062500206','Orange Money','M 2',' Abidjan',' CÃ´te d''Ivoire','99347035','',NULL,NULL,''),
  ('86519425177434505141',9000,0,0,'84221657222332544271','86519425060033243803','2018-06-05 19:42:51','2018-06-05 22:18:51','is_Validate',NULL,NULL,'SYS','1','2018-06-05','5.4064975000000075;-3.9907539062500206','Orange Money','M 2',' Abidjan',' CÃ´te d''Ivoire','99347035','',NULL,NULL,''),
  ('86519475219220094094',19500,0,0,'84221657222332544271','8651947518092498914','2018-06-05 19:47:52','2018-06-05 22:18:46','is_Validate',NULL,NULL,'SYS','1','2018-06-05','5.4064975000000075;-3.9907539062500206','A la livraison','M 2',' Abidjan',' CÃ´te d''Ivoire','99347035','',NULL,NULL,''),
  ('86519514046187511859',17500,0,0,'84221657222332544271','86519513955910866643','2018-06-05 19:51:40','2018-06-06 00:00:38','paid',NULL,NULL,'SYS','1','2018-06-05','5.4064975000000075;-3.9907539062500206','Orange Money','M 2',' Abidjan',' CÃ´te d''Ivoire','99347035','',NULL,NULL,'8652218292391913223'),
  ('8652346631644238411',6500,0,0,'84221657222332544271','8652346489366766425','2018-06-05 23:46:06',NULL,'is_Waiting',NULL,NULL,'SYS','1','2018-06-05','5.4064975000000075;-3.9907539062500206','Orange Money','M 2',' Abidjan',' CÃ´te d''Ivoire','99347035','',NULL,NULL,'');
COMMIT;

/* Data for the `t_order_transaction` table  (LIMIT 0,500) */

INSERT INTO `t_order_transaction` (`lg_ORDER_TRANSACTION_ID`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`, `lg_ORDER_ID`, `lg_PRODUCT_ITEM_ID`, `int_NUMBER`, `int_NUMBER_UN_PAID`, `lg_ACCOMPAGNEMENT_ID`, `lg_COMMENTAIRE_ID`) VALUES
  ('86118335215546024449','2018-06-01 18:33:52','2018-06-02 16:56:00','paid','86118335183155888527','72271159102274000597',2,0,NULL,NULL),
  ('86118335256162033368','2018-06-01 18:33:52','2018-06-02 16:56:00','paid','86118335183155888527','72271149593139289174',2,0,NULL,NULL),
  ('86118335266217724391','2018-06-01 18:33:52','2018-06-02 16:56:00','paid','86118335183155888527','67101712195787344322',1,0,NULL,NULL),
  ('861183544732298165','2018-06-01 18:35:44','2018-06-02 16:55:47','paid','8611835446044795379','67101738338564425773',3,0,NULL,NULL),
  ('86118354491079223446','2018-06-01 18:35:44','2018-06-02 16:55:47','paid','8611835446044795379','67101751199303412326',3,0,NULL,NULL),
  ('86118362469740026111','2018-06-01 18:36:24','2018-06-01 18:36:32','cancel','86118362458211559478','67101738338564425773',5,0,NULL,NULL),
  ('86119493344374458044','2018-06-01 19:49:33','2018-06-02 12:53:36','paid','86119493332162366961','67101738338564425773',8,0,NULL,NULL),
  ('86119493362454289624','2018-06-01 19:49:33','2018-06-02 12:53:36','paid','86119493332162366961','67101751199303412326',3,0,NULL,NULL),
  ('86120111228075094445','2018-06-01 20:11:12','2018-06-01 22:14:00','unpaid','86120111213272919766','67101751199303412326',7,0,NULL,NULL),
  ('86120163919291687182','2018-06-01 20:16:39','2018-06-01 22:19:54','paid','8612016389345463661','67101738338564425773',2,0,NULL,NULL),
  ('86120163935053415218','2018-06-01 20:16:39','2018-06-01 22:19:54','paid','8612016389345463661','67101751199303412326',3,0,NULL,NULL),
  ('86120253034437625079','2018-06-01 20:25:30','2018-06-02 12:54:14','paid','8612025302217011405','67101738338564425773',2,0,NULL,NULL),
  ('8612025304245864468','2018-06-01 20:25:30','2018-06-02 12:54:14','paid','8612025302217011405','67101751199303412326',6,0,NULL,NULL),
  ('86212311126480119968','2018-06-02 12:31:11','2018-06-02 16:31:28','paid','86212311091531806552','67101738338564425773',5,0,NULL,NULL),
  ('86212311156399243305','2018-06-02 12:31:11','2018-06-02 16:31:28','paid','86212311091531806552','67101751199303412326',3,0,NULL,NULL),
  ('86216495014280011695','2018-06-02 16:49:50','2018-06-02 16:52:48','cancel','86216494993974206840','67101738338564425773',6,0,NULL,NULL),
  ('86216501082782864265','2018-06-02 16:50:10','2018-06-02 16:50:44','cancel','8621650107066243757','67101738338564425773',3,0,NULL,NULL),
  ('86216501095090826776','2018-06-02 16:50:10','2018-06-02 16:50:44','cancel','8621650107066243757','67101751199303412326',2,0,NULL,NULL),
  ('862165646274948853','2018-06-02 16:56:46','2018-06-02 17:06:49','paid','86216564592328825152','67101751199303412326',3,0,NULL,NULL),
  ('8621656465648826986','2018-06-02 16:56:46','2018-06-02 17:06:49','paid','86216564592328825152','67101738338564425773',4,0,NULL,NULL),
  ('862173654177351938','2018-06-02 17:36:54','2018-06-02 17:38:25','paid','8621736539105397424','67101738338564425773',6,0,NULL,NULL),
  ('865152411186481112','2018-06-05 15:24:11','2018-06-05 15:24:13','unpaid','86515241077722045360','67101738338564425773',3,0,NULL,NULL),
  ('86515301635797924564','2018-06-05 15:30:16','2018-06-05 15:30:17','unpaid','86515301620162705169','67101738338564425773',7,0,NULL,NULL),
  ('86517163861116903617','2018-06-05 17:16:38','2018-06-05 17:16:39','unpaid','8651716387786893637','67101738338564425773',4,0,NULL,NULL),
  ('86517163883784898046','2018-06-05 17:16:38','2018-06-05 17:16:39','unpaid','8651716387786893637','67101751199303412326',4,0,NULL,NULL),
  ('86517192348264571919','2018-06-05 17:19:23','2018-06-05 17:19:24','unpaid','86517192338769291896','67101738338564425773',7,0,NULL,NULL),
  ('86517192356072897193','2018-06-05 17:19:23','2018-06-05 17:19:24','unpaid','86517192338769291896','67101751199303412326',5,0,NULL,NULL),
  ('86517201349631363151','2018-06-05 17:20:13','2018-06-05 17:20:14','unpaid','8651720132991362980','67101738338564425773',6,0,NULL,NULL),
  ('86517201361078177829','2018-06-05 17:20:13','2018-06-05 17:20:14','unpaid','8651720132991362980','67101751199303412326',3,0,NULL,NULL),
  ('8651721118575455524','2018-06-05 17:21:11','2018-06-05 17:21:12','unpaid','86517211174537777069','67101738338564425773',5,0,NULL,NULL),
  ('865172112578139458','2018-06-05 17:21:12','2018-06-05 17:21:12','unpaid','86517211174537777069','67101751199303412326',2,0,NULL,NULL),
  ('86517223551363903619','2018-06-05 17:22:35','2018-06-05 17:39:28','cancel','86517223542866183262','67101738338564425773',4,0,NULL,NULL),
  ('8651722356717328452','2018-06-05 17:22:35','2018-06-05 17:39:28','cancel','86517223542866183262','67101751199303412326',4,0,NULL,NULL),
  ('86517284262973004168','2018-06-05 17:28:42','2018-06-05 17:43:53','paid','86517284252418926631','67101738338564425773',1,0,NULL,NULL),
  ('86517284277897511435','2018-06-05 17:28:42','2018-06-05 17:43:53','paid','86517284252418926631','67101751199303412326',1,0,NULL,NULL),
  ('865172843306974800','2018-06-05 17:28:43','2018-06-05 17:43:53','paid','86517284252418926631','72271149593139289174',3,0,NULL,NULL),
  ('86517294162040326252','2018-06-05 17:29:41','2018-06-05 17:40:34','paid','86517294151396421520','67101738338564425773',5,0,NULL,NULL),
  ('8651729417007483169','2018-06-05 17:29:41','2018-06-05 17:40:34','paid','86517294151396421520','67101751199303412326',3,0,NULL,NULL),
  ('86517443467674839579','2018-06-05 17:44:34','2018-06-05 17:45:41','paid','86517443456938547121','67101738338564425773',6,0,NULL,NULL),
  ('86517443484198798437','2018-06-05 17:44:34','2018-06-05 17:45:41','paid','86517443456938547121','67101751199303412326',3,0,NULL,NULL),
  ('86517521524219185406','2018-06-05 17:52:15','2018-06-05 19:17:30','paid','8651752156140127940','67101738338564425773',3,0,NULL,NULL),
  ('86517521535893463512','2018-06-05 17:52:15','2018-06-05 19:17:30','paid','8651752156140127940','67101751199303412326',3,0,NULL,NULL),
  ('86519353390774491215','2018-06-05 19:35:33','2018-06-05 19:35:34','unpaid','86519353376754396817','67101738338564425773',8,0,NULL,NULL),
  ('8651935344134461114','2018-06-05 19:35:34','2018-06-05 19:35:34','unpaid','86519353376754396817','67101751199303412326',6,0,NULL,NULL),
  ('865193873241530743','2018-06-05 19:38:07','2018-06-05 19:38:08','unpaid','8651938721712683388','67101738338564425773',4,0,NULL,NULL),
  ('8651938763471495094','2018-06-05 19:38:07','2018-06-05 19:38:08','unpaid','8651938721712683388','67101751199303412326',3,0,NULL,NULL),
  ('8651940559538941739','2018-06-05 19:40:05','2018-06-05 19:40:06','unpaid','8651940549173491874','67101738338564425773',5,0,NULL,NULL),
  ('8651940572452744912','2018-06-05 19:40:05','2018-06-05 19:40:06','unpaid','8651940549173491874','67101751199303412326',3,0,NULL,NULL),
  ('86519425070530251583','2018-06-05 19:42:50','2018-06-05 19:42:51','unpaid','86519425060033243803','67101738338564425773',4,0,NULL,NULL),
  ('8651942508348360309','2018-06-05 19:42:50','2018-06-05 19:42:51','unpaid','86519425060033243803','67101751199303412326',2,0,NULL,NULL),
  ('86519475129859048130','2018-06-05 19:47:51','2018-06-05 19:47:52','unpaid','8651947518092498914','67101738338564425773',7,0,NULL,NULL),
  ('86519475138314812787','2018-06-05 19:47:51','2018-06-05 19:47:52','unpaid','8651947518092498914','67101751199303412326',5,0,NULL,NULL),
  ('86519513964376981378','2018-06-05 19:51:39','2018-06-06 00:00:38','paid','86519513955910866643','67101738338564425773',5,0,NULL,NULL),
  ('86519513973465054734','2018-06-05 19:51:39','2018-06-06 00:00:38','paid','86519513955910866643','67101751199303412326',5,0,NULL,NULL),
  ('8652346518473977716','2018-06-05 23:46:05','2018-06-05 23:46:06','unpaid','8652346489366766425','67101738338564425773',4,0,NULL,NULL),
  ('8652346536574416701','2018-06-05 23:46:05','2018-06-05 23:46:06','unpaid','8652346489366766425','67101751199303412326',1,0,NULL,NULL);
COMMIT;

/* Data for the `t_outboud_message` table  (LIMIT 0,500) */

INSERT INTO `t_outboud_message` (`lg_OUTBOUND_MESSAGE_ID`, `dt_CREATED`, `dt_UPDATED`, `str_MESSAGE`, `str_STATUT`, `str_PHONE`) VALUES
  ('83101032430674487710','2018-03-10 10:03:24',NULL,'Thé-lait(0);Thé(1);SOLE 1(2);SEX AND THE BEACH(5);Salade verte(12);Salade de concombres(48);Quaker(-39);Pomme boulangère(48);Poisson à l''ivoirienne(12);Lait froid(1);Jus de fruits(1);Jardinière de légumes(3);Fruit(3);Croissant(1);Creme de riz(89985);Crème caramel(89981);Couscous(2);Confiture(1);CODYS ENERGIE(12);Citronnelle(2);Citronnelle(3);Chocolat au lait(1);Chocolat(0);Café-lait(2);Café(1);Bouillie de riz(-1);Beurre(-5);Bavaroise aux fruits(89987);Bande de fruits(89952);ATTIEKE(-32);Abolo(14957);','is_Waiting','77257261');
COMMIT;

/* Data for the `t_parameters` table  (LIMIT 0,500) */

INSERT INTO `t_parameters` (`str_KEY`, `str_VALUE`, `str_DESCRIPTION`, `str_STATUT`, `str_IS_EN_KRYPTED`, `str_SECTION_KEY`, `str_TYPE`, `dt_CREATED`, `dt_UPDATED`) VALUES
  ('KEY',NULL,NULL,'enable',NULL,NULL,'SYSTEME',NULL,NULL),
  ('KEY_CUSTOMER_APP','GRILLADIN','Identité du client de l''application','enable',NULL,NULL,'CUSTOMER',NULL,NULL),
  ('KEY_GEST_MANAGE_AVAILABLE','enable','Statut de la prise en compte du module de gestion ','enable',NULL,NULL,'CUSTOMER',NULL,NULL),
  ('KEY_LAST_FILE_NUMBER','[{\"str_last_date\":\"2018\\/06\\/04\",\"int_last_code\":\"00003\"}]','Dernier numero du fichier','enable',NULL,NULL,'SYSTEME',NULL,NULL),
  ('KEY_LAST_ORDER_NUMBER','[{\"str_last_date\":\"2018\\/06\\/05\",\"int_last_code\":\"00018\"}]','Dernier numero commande','enable',NULL,NULL,'SYSTEME',NULL,NULL),
  ('KEY_LAST_TOURNEE_NUMBER','[{\"str_last_date\":\"2018\\/06\\/05\",\"int_last_code\":\"00010\"}]','Dernier numero tournee','enable',NULL,NULL,'SYSTEME',NULL,NULL),
  ('KEY_LICENCE_DATA','qIcRTWFGZugl58UPIC0QwOsnz6+AwYNUGkg//dtUPXB54FAR86XvrHWcRDpbYURXg4q31clO2Wuif/S2XkipUltqyIX4fYJTt2Njs0vHbkr1J4aKDPckWFIqxedqu10opDQkjEMASEVc1v43/VXbe0dFKFGjXOV4','Information sur la licence','enable',NULL,NULL,'SYSTEME',NULL,NULL),
  ('KEY_SIZE_ORDER_NUMBER','5','Nombre de caracter de numer de commande','enable',NULL,'ORDER','CUSTOMER',NULL,NULL),
  ('KEY_TVA_ACCOUNT','44310154556','Compte TVA','enable',NULL,'TVA','CUSTOMER',NULL,NULL),
  ('KEY_TVA_VALUE','18','Valeur de la tva en % ex (18)','enable','','TVA','CUSTOMER',NULL,NULL),
  ('SMS_DEFAULT_EXPEDITEUR','59495092','Numero de l''expedieteur de l''SMS','enable',NULL,NULL,'CUSTOMER',NULL,NULL);
COMMIT;

/* Data for the `t_report_groupe` table  (LIMIT 0,500) */

INSERT INTO `t_report_groupe` (`lg_REPORT_GROUPE_ID`, `lg_SCHEMA_CARTE_ID`, `str_NAME`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('1','1','Castel Bierre',NULL,NULL,'enable');
COMMIT;

/* Data for the `t_privilege` table  (LIMIT 0,500) */

INSERT INTO `t_privilege` (`lg_PRIVELEGE_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `lg_CREATED_BY`, `dt_UPDATED`, `lg_UPDATED_BY`, `lg_PRIVELEGE_ID_DEP`, `str_STATUT`) VALUES
  ('1','P_M_GESTION_UTILISATEUR','Menu gestion utilisateur',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('10','P_SM_MENU','Sous menu menu',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('11','P_SM_SOUSMENU','Sous menu sous-menu',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('12','P_SM_INSTITUTION','Sous menu institution',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('123','P_SM_CAISSE','Sous Menu Situation Caisse',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('13','P_M_GESTION_REPORT','Menu report',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('14','P_SM_REPORT','Sous menu report',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('15','P_SM_GROUPEREPORT','Sous menu groupe report',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('153164642624654','P_SM_MESSAGE','Sous menu message',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('16','P_SM_SCHEMACARTE','Sous menu schema carte',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('17','P_SM_DECOUPE','Sous menu decoupe',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('18','P_SM_SKIN','Sous menu skin',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('19','P_SM_LANGUAGE','Sous menu language',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('2','P_SM_UTILISATEUR','Sous menu utilisateur',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('20','P_M_GESTION_CLIENT','Menu client',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('20131022161512881859','P_SM_TABLE','Sous menu table',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('21','P_SM_CLIENT','Sous menu client',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('22','P_SM_PREFERENCE','Sous menu preference',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('23','P_M_CONFIGURATION','Menu configuration',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('24','P_M_FACTURATION','Menu facturation',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('25','P_SM_COMMANDE','Sous menu commande',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('26','P_SM_HISTORIQUE','Sous menu historique',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('27','P_SM_OUVERTURE_CAISSEMP','Sous menu ouverture caisse emp',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('28','P_SM_OUVERTURECAISSE','Sous menu ouverture caisse',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('29','P_SM_TRAITEMENT_COMMANDE','Sous menu traitement commande',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('3','P_SM_ROLE','Sous menu role',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('30','P_M_CAISSE','Menu caisee',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('31','P_SM_SMS','Sous menu sms',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('31022163033556868372','P_SM_PRODUCT_ITEM','Sous menu produit',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('32','P_SM_EMAIL','Sous menu email',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('33','P_M_GESTION_STOCK','Menu gestion de stock',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('34','P_SM_ETAT_STOCK','Sous menu etat de stock',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('35','P_SM_ENTREE_STOCK','Sous menu entree de stock',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('36','P_SM_REPORT_DYNAMIC','Sous menu report dynamique',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('37','P_SM_VENTE_PRODUIT','Sous menu vente par produit',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('38','P_SM_ENREGISTREMENT_COMMANDE','Sous menu enregistrement commande',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('39','P_SM_TVA','Sous menu tva',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('4','P_SM_MON_COMPTE','Sous menu mon compte',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('40','P_SM_TYPE_DEPENSE','Sous menu type depense',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('41','P_SM_TYPE_RECETTE','Sous menu recette',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('42','P_SM_JOURNAL_RECETTE','Sous menu journal recette',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('43','P_SM_CLIENT_ACCOUNT','Sous menu client account',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('44','P_SM_TYPE_CONTENANCE','Sous menu type contenance',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('45','P_SM_PRODUIT_CONTENANCE','Sous menu produit par contenance',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('5','P_SM_PERSONNALISATION','Sous menu personnalisation',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('546','P_SM_GEST_CAISSE','Sous menu gestion caisse',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('6','P_SM_DECONNEXION','Sous menu deconnexion',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('62261746499451672519','P_M_SONDAGE','Menu Sondage',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('62261753614384643271','P_SM_QUEST_QCM','Sous Menu Questqcm',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('62261758156181428946','P_SM_REPONSE_QCM','Sous Menu Reponse Qcm',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('6226182879331485814','P_SM_TYPE_QCM','Sous Menu Type Quest QCM',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('6229851115429503211','P_SM_CLAVIER','Sous Menu Clavier',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('62298551176081284251','P_SM_FENETRES','Sous Menu Fenetres',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('62298573942433209481','P_SM_SOUS_FENETRES','Sous Menu Sous Fenetres',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('67101755924179788805','P_SM_FAMILLE','Sous Menu Famille',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('689','N_NEW_ORDER','Notification d''enregistrement d''une nouvelle commande',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('7','P_M_GESTION_TEST','Menu gestion test',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('72613432868824462365','P_SM_COMMENTAIRE','Sous menu gestion des commentaire',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('7261455414066648209','P_SM_ACCOMPAGNEMENT','Sous menu accompagnement','2017-02-06 14:55:41',NULL,NULL,NULL,NULL,'enable'),
  ('7271130196492659399','P_SM_MENU_REPAS','Sous menu Menu Repas','2017-02-07 11:30:01',NULL,NULL,NULL,NULL,'enable'),
  ('72714474059291908770','P_SM_ETAGE','Sous menu etage','2017-02-07 14:47:40',NULL,NULL,NULL,NULL,'enable'),
  ('72715121393449627427','P_SM_CHAMBRE','Sous menu gestion des chambre','2017-02-07 15:12:13',NULL,NULL,NULL,NULL,'enable'),
  ('72715363780639683658','P_SM_LIT','Sous menu gestion des lits','2017-02-07 15:36:37',NULL,NULL,NULL,NULL,'enable'),
  ('728921999159149847','P_M_GESTION_ADMISSION','Menu gestion des admissions','2017-02-08 09:21:09',NULL,NULL,NULL,NULL,'enable'),
  ('728923333773378220','P_SM_ADMISSION_CHAMBRE','Sous menu admission en chambre','2017-02-08 09:23:33',NULL,NULL,NULL,NULL,'enable'),
  ('731416353426518115','P_SM_AGENT','Sous menu agent','2017-03-14 16:35:34',NULL,NULL,NULL,NULL,'enable'),
  ('73201027288026127603','P_SM_LISTE_COMMANDE','Sous menu liste des commande pisam','2017-03-20 10:27:28',NULL,NULL,NULL,NULL,'enable'),
  ('73311027541436298899','P_SM_PARAMETRE','Sous Menu parametre','2017-03-31 10:27:54',NULL,NULL,NULL,NULL,'enable'),
  ('73911144991929334781','P_SM_SERVICES','Sous Menu Services','2017-03-09 11:14:49',NULL,NULL,NULL,NULL,'enable'),
  ('784','N_VALIDATION_ORDER','Notification de validation  de commande',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('8','P_SM_PRIVILEGE','Sous menu privilege',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('85231254108146040749','P_M_WEB_COMMANDE','Gestion des Webs Commandes','2018-05-23 12:54:10',NULL,NULL,NULL,NULL,'enable'),
  ('85291261436067259009','P_SM_TOURNEE','Gestion des tournees','2018-05-29 12:06:14',NULL,NULL,NULL,NULL,'enable'),
  ('9','P_SM_MODULE','Sous menu module',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('999','P_M_CARTE_INTERACTIVE','Menu carte interactive',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('9999991','P_SM_PRODUIT','Sous menu produit',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('9999992','P_SM_CATEGORIE','Sous menu categorie',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('9999994','P_SM_CARTEMENU','Sous menu carte menu',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('9999996','P_SM_CARTE','Sous menu carte',NULL,NULL,NULL,NULL,NULL,'enable'),
  ('9999997','P_SM_SATISFACTION','Sous menu satisfaction',NULL,NULL,NULL,NULL,NULL,'enable');
COMMIT;

/* Data for the `t_type_contenance` table  (LIMIT 0,500) */

INSERT INTO `t_type_contenance` (`lg_TYPE_CONTENANCE_ID`, `str_TYPE_CONTENANCE`, `str_STATUT`, `dt_CREATED`, `dt_UPDATED`) VALUES
  ('43310581941369073761','un quart','enable','2014-03-03 10:58:19','2014-03-03 11:01:25'),
  ('43312294262940638661','un demi','enable','2014-03-03 12:29:42',NULL);
COMMIT;

/* Data for the `t_product_item_accompagnemement` table  (LIMIT 0,500) */

INSERT INTO `t_product_item_accompagnemement` (`lg_PRODUCT_ITEM_ACCOMPAGNEMENT_ID`, `lg_PRODUCT_ITEM_ID`, `lg_ACCOMPAGNEMENT_ID`, `str_STATUT`, `dt_CREATED`, `dt_UPDATED`) VALUES
  ('72271510164410469304','67101745666588479350','72716191541819818192','enable','2017-02-27 15:10:01',NULL),
  ('72281318631189857607','67101744425645068807','72716191541819818192','enable','2017-02-28 13:18:06',NULL),
  ('72710395325194097207','67101718095018457516','72710344297012145235','enable','2017-02-07 10:39:53',NULL),
  ('72710400660312200','67101726546457588560','72615274354935644275','enable','2017-02-07 10:40:00',NULL),
  ('7271040715773232603','67101734499725803587','72613526876416487','enable','2017-02-07 10:40:07',NULL),
  ('72710444635832577884','72710432974244876243','72710344297012145235','enable','2017-02-07 10:44:46',NULL),
  ('7271044466596557391','72710432974244876243','72613526876416487','enable','2017-02-07 10:44:46',NULL),
  ('7271045509186685411','7271045393082157826','72613526876416487','enable','2017-02-07 10:45:50',NULL),
  ('7271357265384745943','72710432974244876243','72615274354935644275','enable','2017-02-07 13:57:26',NULL),
  ('7271541543415905785','7271541291860547103','72615274354935644275','enable','2017-02-07 15:41:54',NULL),
  ('7271541544139456973','7271541291860547103','72613526876416487','enable','2017-02-07 15:41:54',NULL),
  ('7271550221307614246','72715492898447911943','72715501189855344996','enable','2017-02-07 15:50:22',NULL),
  ('72715503242592137278','72715492898447911943','72710344297012145235','enable','2017-02-07 15:50:32',NULL),
  ('7271724152868459280','67101712195787344322','72615274354935644275','enable','2017-02-07 17:24:15',NULL),
  ('73162045682295222','67101739555877705909','72710344297012145235','enable','2017-03-16 20:45:06',NULL),
  ('73162045732843709111','67101739555877705909','72716191541819818192','enable','2017-03-16 20:45:07',NULL),
  ('73162045812635498678','67101739555877705909','72613526876416487','enable','2017-03-16 20:45:08',NULL),
  ('73213393425815785444','72271155393924813157','72710344297012145235','enable','2017-03-02 13:39:34',NULL),
  ('73213393427916399287','72271155393924813157','72716191541819818192','enable','2017-03-02 13:39:34',NULL),
  ('83221628522157694612','83221628332273619309','72716441675272692189','enable','2018-03-22 16:28:52',NULL);
COMMIT;

/* Data for the `t_product_item_commentaire` table  (LIMIT 0,500) */

INSERT INTO `t_product_item_commentaire` (`lg_PRODUCT_ITEM_ACCOMPAGNEMENT_ID`, `lg_PRODUCT_ITEM_ID`, `lg_COMMENTAIRE_ID`, `str_STATUT`, `dt_CREATED`, `dt_UPDATED`) VALUES
  ('74251440309046658912','67101712195787344322','74251431364933084314','enable','2017-04-25 14:40:30',NULL),
  ('74251440432882303402','67101712195787344322','7271723511767479144','enable','2017-04-25 14:40:43',NULL),
  ('74251440469812807516','67101712195787344322','74251434264565297769','enable','2017-04-25 14:40:46',NULL),
  ('742514409102798215','67101712195787344322','72612563844512351216','enable','2017-04-25 14:40:09',NULL),
  ('74251441121754248023','67101712195787344322','7425143353378206625','enable','2017-04-25 14:41:01',NULL),
  ('74251451283032237465','67101716496016399596','72612563844512351216','enable','2017-04-25 14:51:28',NULL),
  ('74251451302804232904','67101716496016399596','74251427486374309463','enable','2017-04-25 14:51:30',NULL),
  ('7425145135040654556','67101716496016399596','74251428343361026881','enable','2017-04-25 14:51:35',NULL),
  ('74251451396202957511','67101716496016399596','74251434264565297769','enable','2017-04-25 14:51:39',NULL),
  ('74251451403033113421','67101716496016399596','7425143353378206625','enable','2017-04-25 14:51:40',NULL),
  ('7425145245252285735','67101716496016399596','74251429113237046217','enable','2017-04-25 14:52:04',NULL),
  ('74251455453269532776','67101716496016399596','74251453422129568450','enable','2017-04-25 14:55:45',NULL),
  ('74251455554721597576','67101716496016399596','7425145398162039460','enable','2017-04-25 14:55:55',NULL),
  ('74251456194879080743','67101716924942215333','7425145398162039460','enable','2017-04-25 14:56:19',NULL),
  ('74251456289156826144','67101716924942215333','72612563844512351216','enable','2017-04-25 14:56:28',NULL),
  ('74251456321306284638','67101716924942215333','74251427486374309463','enable','2017-04-25 14:56:32',NULL),
  ('74251456327394721177','67101716924942215333','74251428343361026881','enable','2017-04-25 14:56:32',NULL),
  ('74251456426091930766','67101716924942215333','7425143353378206625','enable','2017-04-25 14:56:42',NULL),
  ('74251456428510893553','67101716924942215333','74251434264565297769','enable','2017-04-25 14:56:42',NULL),
  ('74251456506007089204','67101716924942215333','74251453422129568450','enable','2017-04-25 14:56:50',NULL),
  ('74251456511516973740','67101716924942215333','74251431364933084314','enable','2017-04-25 14:56:51',NULL),
  ('74251456532357297786','67101716924942215333','74251429113237046217','enable','2017-04-25 14:56:53',NULL),
  ('74251458201748532307','67101718304891358239','74251427486374309463','enable','2017-04-25 14:58:20',NULL),
  ('74251458208939109431','67101718304891358239','74251428343361026881','enable','2017-04-25 14:58:20',NULL),
  ('74251504493366116193','67101727411547599522','7425145398162039460','enable','2017-04-25 15:00:44',NULL),
  ('74251504585482252320','67101727411547599522','72612563844512351216','enable','2017-04-25 15:00:45',NULL),
  ('74251504970651186152','67101727411547599522','74251428343361026881','enable','2017-04-25 15:00:49',NULL),
  ('74251505046725295641','67101727411547599522','74251427486374309463','enable','2017-04-25 15:00:50',NULL),
  ('74251505741346955369','67101727411547599522','74251453422129568450','enable','2017-04-25 15:00:57',NULL),
  ('7425151195497459450','67101727411547599522','74251429113237046217','enable','2017-04-25 15:01:01',NULL),
  ('74251529549135549187','67101718095018457516','74251427486374309463','enable','2017-04-25 15:29:54',NULL),
  ('74251529567511991417','67101718095018457516','72612563844512351216','enable','2017-04-25 15:29:56',NULL),
  ('74251529588983205370','67101718095018457516','74251428343361026881','enable','2017-04-25 15:29:58',NULL),
  ('7425153053341875964','67101718095018457516','74251434264565297769','enable','2017-04-25 15:30:05',NULL),
  ('74251530577663885623','67101718095018457516','7425143353378206625','enable','2017-04-25 15:30:05',NULL),
  ('74251531175772160846','67101728454512713952','72612563844512351216','enable','2017-04-25 15:31:17',NULL),
  ('74251531207826372970','67101728454512713952','74251427486374309463','enable','2017-04-25 15:31:20',NULL),
  ('74251531213437447629','67101728454512713952','74251428343361026881','enable','2017-04-25 15:31:21',NULL),
  ('74251531301409123602','67101728454512713952','74251431364933084314','enable','2017-04-25 15:31:30',NULL),
  ('74251531322327363636','67101728454512713952','74251429113237046217','enable','2017-04-25 15:31:32',NULL),
  ('74251531527246950855','67101729306058284265','74251428343361026881','enable','2017-04-25 15:31:52',NULL),
  ('74251531529351509575','67101729306058284265','74251427486374309463','enable','2017-04-25 15:31:52',NULL),
  ('74251531556617068222','67101729306058284265','74251429113237046217','enable','2017-04-25 15:31:55',NULL),
  ('74251533179381055907','67101732241137974871','72615442098499013724','enable','2017-04-25 15:33:17',NULL),
  ('742515333644130959','67101732241137974871','7271357915553324330','enable','2017-04-25 15:33:03',NULL),
  ('74251533461716136518','67101732241137974871','74251427486374309463','enable','2017-04-25 15:33:04',NULL),
  ('7425153389745738606','67101732241137974871','74251428343361026881','enable','2017-04-25 15:33:08',NULL),
  ('74251535298948583620','67101736369346481343','7425145398162039460','enable','2017-04-25 15:35:29',NULL),
  ('74251535305888801726','67101736369346481343','72612563844512351216','enable','2017-04-25 15:35:30',NULL),
  ('74251535317318651729','67101736369346481343','74251427486374309463','enable','2017-04-25 15:35:31',NULL),
  ('74251535361315354206','67101736369346481343','74251428343361026881','enable','2017-04-25 15:35:36',NULL),
  ('74251535417663248222','67101736369346481343','74251429113237046217','enable','2017-04-25 15:35:41',NULL),
  ('74251537243077796242','67101738338564425773','72615443184782827231','enable','2017-04-25 15:37:24',NULL),
  ('74251537754037043965','67101738338564425773','74251427486374309463','enable','2017-04-25 15:37:07',NULL),
  ('74251539238423622568','67101741309743937547','7271357915553324330','enable','2017-04-25 15:39:23',NULL),
  ('74251539296383593184','67101741309743937547','74251427486374309463','enable','2017-04-25 15:39:29',NULL),
  ('74251540379984339528','67101741309743937547','72615443184782827231','enable','2017-04-25 15:40:37',NULL),
  ('74251541568704085883','72271143596946105613','74251427486374309463','enable','2017-04-25 15:41:56',NULL),
  ('74251541575141238841','72271143596946105613','7271357915553324330','enable','2017-04-25 15:41:57',NULL),
  ('74251544258648372567','72271144342137234719','74251427486374309463','enable','2017-04-25 15:44:25',NULL),
  ('74251544291349818966','72271144342137234719','74251428343361026881','enable','2017-04-25 15:44:29',NULL),
  ('74251544575049877416','72271145819561033459','74251427486374309463','enable','2017-04-25 15:44:57',NULL),
  ('74251545034337676972','72271145819561033459','74251428343361026881','enable','2017-04-25 15:45:00',NULL),
  ('74251546134438687458','72271149593139289174','74251428343361026881','enable','2017-04-25 15:46:13',NULL),
  ('74251546171812622410','72271149593139289174','72615443184782827231','enable','2017-04-25 15:46:17',NULL),
  ('74251546216295865525','72271149593139289174','72615442098499013724','enable','2017-04-25 15:46:21',NULL),
  ('7425154676464174610','72271149593139289174','7271357915553324330','enable','2017-04-25 15:46:07',NULL),
  ('74251546886491302166','72271149593139289174','74251427486374309463','enable','2017-04-25 15:46:08',NULL),
  ('74251547412598824855','72271151573885165136','7271357915553324330','enable','2017-04-25 15:47:41',NULL),
  ('74251547422971466840','72271151573885165136','74251427486374309463','enable','2017-04-25 15:47:42',NULL),
  ('74251547463519232344','72271151573885165136','74251428343361026881','enable','2017-04-25 15:47:46',NULL),
  ('74251548238028678766','72271152335162427134','74251427486374309463','enable','2017-04-25 15:48:23',NULL),
  ('74251548267289625186','72271152335162427134','74251428343361026881','enable','2017-04-25 15:48:26',NULL),
  ('74251548469662646491','7227115312343619916','74251427486374309463','enable','2017-04-25 15:48:46',NULL),
  ('74251548496991106695','7227115312343619916','74251428343361026881','enable','2017-04-25 15:48:49',NULL),
  ('74251550448871659715','72271349285331556419','74251427486374309463','enable','2017-04-25 15:50:44',NULL),
  ('74251550466462345155','72271349285331556419','74251428343361026881','enable','2017-04-25 15:50:46',NULL),
  ('74251551286014474363','72271159102274000597','7271357915553324330','enable','2017-04-25 15:51:28',NULL),
  ('74251551317652569424','72271159102274000597','74251427486374309463','enable','2017-04-25 15:51:31',NULL),
  ('74251551323858120741','72271159102274000597','74251428343361026881','enable','2017-04-25 15:51:32',NULL),
  ('74251551364194586243','72271159102274000597','72615443184782827231','enable','2017-04-25 15:51:36',NULL),
  ('74251551377286834391','72271159102274000597','72615442098499013724','enable','2017-04-25 15:51:37',NULL),
  ('74251552179581478671','72710432974244876243','7271357915553324330','enable','2017-04-25 15:52:17',NULL),
  ('74251552257602033839','72710432974244876243','74251428343361026881','enable','2017-04-25 15:52:25',NULL),
  ('74251552295562796144','72710432974244876243','74251427486374309463','enable','2017-04-25 15:52:29',NULL),
  ('74251552334849000637','72710432974244876243','72615443184782827231','enable','2017-04-25 15:52:33',NULL),
  ('74251552343581933199','72710432974244876243','74251423254719816960','enable','2017-04-25 15:52:34',NULL),
  ('74251552389198702924','72710432974244876243','72615442098499013724','enable','2017-04-25 15:52:38',NULL),
  ('74251552393276360236','72710432974244876243','74251453422129568450','enable','2017-04-25 15:52:39',NULL),
  ('74251552438002010137','72710432974244876243','74251429113237046217','enable','2017-04-25 15:52:43',NULL),
  ('7425155328750888671','7271541291860547103','74251427486374309463','enable','2017-04-25 15:53:28',NULL),
  ('74251553292672740233','7271541291860547103','74251428343361026881','enable','2017-04-25 15:53:29',NULL),
  ('74251553336011331100','7271541291860547103','72615443184782827231','enable','2017-04-25 15:53:33',NULL),
  ('74251553354601873942','7271541291860547103','72615442098499013724','enable','2017-04-25 15:53:35',NULL),
  ('74251553424724635770','7271541291860547103','74251429113237046217','enable','2017-04-25 15:53:42',NULL),
  ('83221628537468319347','83221628332273619309','74251429113237046217','enable','2018-03-22 16:28:53',NULL),
  ('83221628548182946210','83221628332273619309','74251431364933084314','enable','2018-03-22 16:28:54',NULL),
  ('83221628553443737325','83221628332273619309','74251424553107733144','enable','2018-03-22 16:28:55',NULL),
  ('83221628576473552536','83221628332273619309','74251453422129568450','enable','2018-03-22 16:28:57',NULL),
  ('83221628581248267738','83221628332273619309','72615442098499013724','enable','2018-03-22 16:28:58',NULL),
  ('83221628585779823332','83221628332273619309','74251423254719816960','enable','2018-03-22 16:28:58',NULL);
COMMIT;

/* Data for the `t_product_item_stock` table  (LIMIT 0,500) */

INSERT INTO `t_product_item_stock` (`lg_PRODUCT_ITEM_STOCK_ID`, `lg_PRODUCT_ITEM_ID`, `int_NUMBER`, `int_NUMBER_AVAILABLE`, `dt_CREATED`, `dt_UPDATED`) VALUES
  ('67101754332779511832','67101712195787344322',-45,28,'2016-07-10 17:54:33','2018-06-02 16:56:00'),
  ('67101754557251205342','67101718095018457516',89985,90012,'2016-07-10 17:54:55','2018-05-24 18:36:53'),
  ('67101755338119657489','67101716924942215333',-20,4,'2016-07-10 17:55:33','2018-05-31 15:01:13'),
  ('67101755475936263683','67101716496016399596',-56,16,'2016-07-10 17:55:47','2018-05-31 15:01:12'),
  ('67101756298963722727','67101719398774099106',482,550,'2016-07-10 17:56:29','2018-05-31 15:01:13'),
  ('67101756511544299720','67101726546457588560',1,1,'2016-07-10 17:56:51','2018-03-25 06:30:04'),
  ('67101756680561212816','67101718304891358239',-35,3,'2016-07-10 17:56:06','2018-05-31 22:54:15'),
  ('67101757153819556296','67101727411547599522',1,1,'2016-07-10 17:57:15','2017-03-31 10:07:04'),
  ('67101757299329964541','67101728199597924756',0,3,'2016-07-10 17:57:29','2018-05-31 15:01:13'),
  ('67101757437296533607','67101728454512713952',1,6,'2016-07-10 17:57:43','2017-04-25 18:32:19'),
  ('67101758165354708226','67101729306058284265',2,5,'2016-07-10 17:58:16','2017-04-25 18:32:19'),
  ('67101758497646140361','67101730327784114189',1,1,'2016-07-10 17:58:49',NULL),
  ('67101759186235086949','67101730267233137689',0,1,'2016-07-10 17:59:18','2018-05-31 15:01:13'),
  ('67101816101393989686','67101731391388359505',1,1,'2016-07-10 18:16:10','2018-04-30 18:12:53'),
  ('67101818138113210127','67101732241137974871',2,2,'2016-07-10 18:18:13',NULL),
  ('67101818416067798517','67101734499725803587',3,3,'2016-07-10 18:18:41',NULL),
  ('6710181983856886857','67101736369346481343',3,3,'2016-07-10 18:19:08','2018-03-24 17:39:44'),
  ('67101826369311269856','67101737264269496538',2,2,'2016-07-10 18:26:36','2018-03-25 05:35:18'),
  ('67101827278199474834','67101738338564425773',-128,194,'2016-07-10 18:27:27','2018-06-06 00:00:38'),
  ('67101827516913699652','67101738246840906525',12,12,'2016-07-10 18:27:05','2017-03-20 14:56:11'),
  ('67101827541236236603','67101739555877705909',48,48,'2016-07-10 18:27:54',NULL),
  ('67101828445744016711','67101741056812641775',48,48,'2016-07-10 18:28:44',NULL),
  ('67101829397782501486','67101745457702837786',3,3,'2016-07-10 18:29:39',NULL),
  ('67101853377088168490','67101747385094104540',2,2,'2016-07-10 18:53:37','2016-07-10 19:58:45'),
  ('67101853736394212107','67101747348925031817',12,12,'2016-07-10 18:53:07','2016-07-10 20:00:29'),
  ('6710185437711159815','67101752499793272918',5,5,'2016-07-10 18:54:03','2016-07-10 20:00:32'),
  ('67101855493445702509','67101854511005161444',-32,14,'2016-07-10 18:55:04','2018-04-22 19:43:47'),
  ('72281316254922818995','67101744425645068807',514957,515022,'2017-02-28 13:16:25','2018-04-22 19:43:47'),
  ('73161423336251595367','67101745666588479350',89952,90012,'2017-03-16 14:23:33','2018-04-02 11:35:44'),
  ('7316142793749687418','72271155393924813157',89987,90005,'2017-03-16 14:27:09','2018-03-24 17:56:28'),
  ('7316142867059452507','67101740267499189768',89981,90043,'2017-03-16 14:28:06','2018-05-28 19:56:40'),
  ('85241512457761012673','67101741309743937547',-23,33,'2018-05-24 15:12:04','2018-05-31 13:33:22'),
  ('85241524967440816897','72271149593139289174',-26,77,'2018-05-24 15:02:49','2018-06-05 17:43:53'),
  ('85241524993495899091','72271159102274000597',-7,61,'2018-05-24 15:02:49','2018-06-02 16:56:00'),
  ('85241543471174548011','67101751199303412326',-180,176,'2018-05-24 15:04:34','2018-06-06 00:00:38'),
  ('85281720493319280786','72271143596946105613',0,17,'2018-05-28 17:20:49',NULL);
COMMIT;

/* Data for the `t_quest_qcm` table  (LIMIT 0,500) */

INSERT INTO `t_quest_qcm` (`lg_QUEST_QCM_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATE`) VALUES
  ('6226160575044688224','ENVIRONNEMENT','Propreté','2016-02-26 16:00:57',NULL);
COMMIT;

/* Data for the `t_type_recette` table  (LIMIT 0,500) */

INSERT INTO `t_type_recette` (`lg_TYPE_RECETTE_ID`, `str_TYPE_RECETTE`, `str_NUMERO_COMPTE`, `is_USE_TVA`) VALUES
  ('1','Chiffre D''affaire','444',1),
  ('2','TVA','4431',0),
  ('3','Remboursement','09098',0);
COMMIT;

/* Data for the `t_recettes` table  (LIMIT 0,500) */

INSERT INTO `t_recettes` (`ID_RECETTE`, `lg_TYPE_RECETTE_ID`, `dt_CREATED`, `str_CREATED_BY`, `dt_UPDATED`, `str_UPDATED_BY`, `int_AMOUNT`, `str_DESCRIPTION`, `str_REF_FACTURE`) VALUES
  ('2018651740338933166','1',NULL,'sandra',NULL,NULL,12500.000,'TVA  ENC. ;Poisson à la camerounaise (5) ;Riz aux olives (3)  ','86517294151396421520'),
  ('201865174033909941','2',NULL,'sandra',NULL,NULL,2250.000,'TVA  ENC. ;Poisson à la camerounaise (5) ;Riz aux olives (3)  ','86517294151396421520'),
  ('2018651743527202389','2',NULL,'sandra',NULL,NULL,2520.000,'TVA  ENC. ;Poisson à la camerounaise (1) ;Riz aux olives (1) ;Poisson au four (3)  ','86517284252418926631'),
  ('2018651743529888896','1',NULL,'sandra',NULL,NULL,14000.000,'TVA  ENC. ;Poisson à la camerounaise (1) ;Riz aux olives (1) ;Poisson au four (3)  ','86517284252418926631'),
  ('2018651745406405086','2',NULL,'sandra',NULL,NULL,2430.000,'TVA  ENC. ;Poisson à la camerounaise (6) ;Riz aux olives (3)  ','86517443456938547121'),
  ('2018651745409658449','1',NULL,'sandra',NULL,NULL,13500.000,'TVA  ENC. ;Poisson à la camerounaise (6) ;Riz aux olives (3)  ','86517443456938547121'),
  ('2018651917293907092','2',NULL,'sandra',NULL,NULL,1890.000,'TVA  ENC. ;Poisson à la camerounaise (3) ;Riz aux olives (3)  ','8651752156140127940'),
  ('2018651917298295888','1',NULL,'sandra',NULL,NULL,10500.000,'TVA  ENC. ;Poisson à la camerounaise (3) ;Riz aux olives (3)  ','8651752156140127940'),
  ('20186600371831556','2',NULL,'sandra',NULL,NULL,3150.000,'TVA  ENC. ;Poisson à la camerounaise (5) ;Riz aux olives (5)  ','86519513955910866643'),
  ('20186600377373906','1',NULL,'sandra',NULL,NULL,17500.000,'TVA  ENC. ;Poisson à la camerounaise (5) ;Riz aux olives (5)  ','86519513955910866643');
COMMIT;

/* Data for the `t_reponse_qcm` table  (LIMIT 0,500) */

INSERT INTO `t_reponse_qcm` (`lg_REPONSE_QCM_ID`, `str_VALUE`, `str_DESCRIPTION`, `str_PHONE`, `str_EMAIL`, `lg_QUEST_QCM_ID`, `dt_CREATED`, `dt_UPDATED`) VALUES
  ('62261627307414080709','bon','Propreté','098778888','',NULL,'2016-02-26 16:27:30',NULL);
COMMIT;

/* Data for the `t_resume_caisse` table  (LIMIT 0,500) */

INSERT INTO `t_resume_caisse` (`ld_CAISSE_ID`, `lg_USER_ID`, `int_SOLDE_MATIN`, `int_SOLDE_SOIR`, `dt_CREATED`, `lg_CREATED_BY`, `dt_UPDATED`, `lg_UPDATED_BY`, `ID_COFFRE_CAISSE`, `str_STATUT`) VALUES
  ('2018641310469817214','42150222079569572824',0,0,'2018-06-03 13:10:46','sandra',NULL,NULL,'2018641310447811095','is_Using'),
  ('201864131235776637','42150222079569572824',0,0,'2018-06-04 13:12:35','sandra','2018-06-04 13:32:08','sandra','2018641312348899195','is_Closed'),
  ('201864131297028721','42150222079569572824',0,0,'2018-06-03 13:10:46','sandra','2018-06-04 13:06:20','sandra','201864130553136433','is_Closed'),
  ('2018641332212534478','42150222079569572824',0,0,'2018-06-04 13:32:21','sandra','2018-06-04 13:32:31','sandra','2018641332211053433','is_Closed'),
  ('201864139133295701','42150222079569572824',0,0,'2018-06-03 13:10:46','sandra','2018-06-04 13:09:55','sandra','201864139111214167','is_Closed'),
  ('2018651445487439971','42150222079569572824',0,0,'2018-06-05 14:45:48','sandra','2018-06-05 14:46:41','sandra','2018651445471102667','is_Closed'),
  ('2018651740142267032','42150222079569572824',0,0,'2018-06-05 17:40:14','sandra','2018-06-05 17:44:00','sandra','2018651740138102826','is_Closed'),
  ('2018651745169671085','42150222079569572824',0,0,'2018-06-05 17:45:16','sandra','2018-06-05 17:45:58','sandra','2018651745166123238','is_Closed'),
  ('2018651752405773249','42150222079569572824',0,0,'2018-06-05 17:52:40','sandra','2018-06-05 19:17:37','sandra','2018651752403811599','is_Closed'),
  ('2018652219146494338','42150222079569572824',0,0,'2018-06-05 22:19:14','sandra',NULL,NULL,'2018652219144999903','is_Using'),
  ('20186600366538803','42150222079569572824',0,0,'2018-06-06 00:00:36','sandra','2018-06-06 00:00:50','sandra','201866003645873','is_Closed');
COMMIT;

/* Data for the `t_role` table  (LIMIT 0,500) */

INSERT INTO `t_role` (`lg_ROLE_ID`, `str_NAME`, `str_DESIGNATION`, `str_TYPE`, `str_STATUT`, `dt_CREATED`, `dt_UPDATED`) VALUES
  ('1','admin','Administrateur du systemes','system','enable',NULL,NULL),
  ('20131031201318367116','Caisier','Caisier',NULL,'enable',NULL,NULL),
  ('20142171241333277693','Developpeur','Developpeur',NULL,'enable',NULL,NULL),
  ('20142171241446902197','Serveur','Serveur',NULL,'enable',NULL,NULL),
  ('2017291115544721236','Dieteticiene','Dieteticiene',NULL,'enable','2017-02-09 11:15:54',NULL),
  ('20174291241194787434','pisam','pisam',NULL,'enable','2017-04-29 12:41:19',NULL);
COMMIT;

/* Data for the `t_role_privelege` table  (LIMIT 0,500) */

INSERT INTO `t_role_privelege` (`lg_ROLE_PRIVILEGE`, `lg_ROLE_ID`, `lg_PRIVILEGE_ID`, `dt_CREATED`, `str_CREATED_BY`, `dt_UPDATED`, `str_UPDATED_BY`) VALUES
  ('10','1','10',NULL,NULL,NULL,NULL),
  ('11','1','11',NULL,NULL,NULL,NULL),
  ('12','1','12',NULL,NULL,NULL,NULL),
  ('13','1','13',NULL,NULL,NULL,NULL),
  ('14','1','14',NULL,NULL,NULL,NULL),
  ('15','1','15',NULL,NULL,NULL,NULL),
  ('16','1','16',NULL,NULL,NULL,NULL),
  ('17','1','17',NULL,NULL,NULL,NULL),
  ('18','1','18',NULL,NULL,NULL,NULL),
  ('19','1','19',NULL,NULL,NULL,NULL),
  ('2','1','2',NULL,NULL,NULL,NULL),
  ('201310171549124974828','1','22',NULL,NULL,NULL,NULL),
  ('20131022161547753356','1','20131022161512881859',NULL,NULL,NULL,NULL),
  ('201310221615503378256','1','20131022161512881859',NULL,NULL,NULL,NULL),
  ('20131022163645865907','1','31022163033556868372',NULL,NULL,NULL,NULL),
  ('201310312012468721292','1','1',NULL,NULL,NULL,NULL),
  ('201310312012486466914','1','24',NULL,NULL,NULL,NULL),
  ('201310312013108038299','20131031201318367116','13',NULL,NULL,NULL,NULL),
  ('201310312013123522670','20131031201318367116','17',NULL,NULL,NULL,NULL),
  ('201310312013135988184','20131031201318367116','6',NULL,NULL,NULL,NULL),
  ('20131031201391369493','20131031201318367116','20',NULL,NULL,NULL,NULL),
  ('2014210019375502217','1','546',NULL,NULL,NULL,NULL),
  ('20142141051408699521','1','37',NULL,NULL,NULL,NULL),
  ('20142141117142344504','1','689',NULL,NULL,NULL,NULL),
  ('2014220105805877888','1','38',NULL,NULL,NULL,NULL),
  ('20142201424478556600','1','41',NULL,NULL,NULL,NULL),
  ('20142201424501958441','1','41',NULL,NULL,NULL,NULL),
  ('2014292143113362621','1','123',NULL,NULL,NULL,NULL),
  ('2014292143132033971','1','123',NULL,NULL,NULL,NULL),
  ('2014311736237994802','20142171241333277693','1',NULL,NULL,NULL,NULL),
  ('201434126454385426','20142171241446902197','5',NULL,NULL,NULL,NULL),
  ('201434127294322479','20142171241446902197','5',NULL,NULL,NULL,NULL),
  ('2016216155241683527','20142171241333277693','9999996',NULL,NULL,NULL,NULL),
  ('201621615534653981','20142171241333277693','9999996',NULL,NULL,NULL,NULL),
  ('2016216161766926474','1','9999994',NULL,NULL,NULL,NULL),
  ('2016216167272341070','20142171241333277693','9999994',NULL,NULL,NULL,NULL),
  ('2016216167333679375','20142171241333277693','9999994',NULL,NULL,NULL,NULL),
  ('2016217111472904820','1','999',NULL,NULL,NULL,NULL),
  ('2016226174817728266','1','62261746499451672519',NULL,NULL,NULL,NULL),
  ('20162261754248328564','1','62261753614384643271',NULL,NULL,NULL,NULL),
  ('2016226175919851628','1','62261758156181428946',NULL,NULL,NULL,NULL),
  ('2016710176407169401','1','67101755924179788805',NULL,NULL,NULL,NULL),
  ('20172613442956183','1','72613432868824462365',NULL,NULL,NULL,NULL),
  ('21','1','21',NULL,NULL,NULL,NULL),
  ('23','1','23',NULL,NULL,NULL,NULL),
  ('25','1','25',NULL,NULL,NULL,NULL),
  ('26','1','26',NULL,NULL,NULL,NULL),
  ('27','1','27',NULL,NULL,NULL,NULL),
  ('28','1','28',NULL,NULL,NULL,NULL),
  ('3','1','3',NULL,NULL,NULL,NULL),
  ('30','1','30',NULL,NULL,NULL,NULL),
  ('31','1','31',NULL,NULL,NULL,NULL),
  ('32','1','32',NULL,NULL,NULL,NULL),
  ('33','1','33',NULL,NULL,NULL,NULL),
  ('34','1','34',NULL,NULL,NULL,NULL),
  ('35','1','35',NULL,NULL,NULL,NULL),
  ('36','1','36',NULL,NULL,NULL,NULL),
  ('37','1','37',NULL,NULL,NULL,NULL),
  ('38','1','38',NULL,NULL,NULL,NULL),
  ('4','1','4',NULL,NULL,NULL,NULL),
  ('41','1','42',NULL,NULL,NULL,NULL),
  ('42','1','43',NULL,NULL,NULL,NULL),
  ('423646131365464165','1','153164642624654',NULL,NULL,NULL,NULL),
  ('44','1','45',NULL,NULL,NULL,NULL),
  ('45','1','9999996',NULL,NULL,NULL,NULL),
  ('46','1','9999992',NULL,NULL,NULL,NULL),
  ('47','1','9999991',NULL,NULL,NULL,NULL),
  ('48','1','9999997',NULL,NULL,NULL,NULL),
  ('6','1','6',NULL,NULL,NULL,NULL),
  ('7','1','7',NULL,NULL,NULL,NULL),
  ('72615131085712231669','1','6',NULL,'31017105229982132919',NULL,NULL),
  ('72615132216830661025','1','30',NULL,'31017105229982132919',NULL,NULL),
  ('72615152314577319003','1','7261455414066648209',NULL,'31017105229982132919',NULL,NULL),
  ('726151622724940935','1','30',NULL,'31017105229982132919',NULL,NULL),
  ('72615201138339275729','1','30',NULL,'31017105229982132919',NULL,NULL),
  ('726154577415353836','1','20',NULL,'31017105229982132919',NULL,NULL),
  ('7271133686534617403','1','7271130196492659399',NULL,'31017105229982132919',NULL,NULL),
  ('7271448684724444549','1','72714474059291908770',NULL,'31017105229982132919',NULL,NULL),
  ('7271517258375178022','1','72715121393449627427',NULL,'31017105229982132919',NULL,NULL),
  ('7271537863049427383','1','72715363780639683658',NULL,'31017105229982132919',NULL,NULL),
  ('7289221967593696134','1','728921999159149847',NULL,'31017105229982132919',NULL,NULL),
  ('7289235790418603900','1','728923333773378220',NULL,'31017105229982132919',NULL,NULL),
  ('73141636433437585932','1','731416353426518115',NULL,'31017105229982132919',NULL,NULL),
  ('7316133404383983804','2017291115544721236','30',NULL,'31017105229982132919',NULL,NULL),
  ('73161334646370749224','2017291115544721236','546',NULL,'31017105229982132919',NULL,NULL),
  ('7316133476535866201','2017291115544721236','28',NULL,'31017105229982132919',NULL,NULL),
  ('73161334866484681045','2017291115544721236','123',NULL,'31017105229982132919',NULL,NULL),
  ('73201028545217118452','1','73201027288026127603',NULL,'31017105229982132919',NULL,NULL),
  ('73311028241686531749','1','73311027541436298899',NULL,'31017105229982132919',NULL,NULL),
  ('7391115285946837998','1','73911144991929334781',NULL,'31017105229982132919',NULL,NULL),
  ('74291241368085356577','20174291241194787434','30',NULL,'31017105229982132919',NULL,NULL),
  ('74291242212195729133','20174291241194787434','25',NULL,'31017105229982132919',NULL,NULL),
  ('74291242362691966541','20174291241194787434','23',NULL,'31017105229982132919',NULL,NULL),
  ('74291242554707854183','20174291241194787434','20',NULL,'31017105229982132919',NULL,NULL),
  ('74291242574608365815','20174291241194787434','21',NULL,'31017105229982132919',NULL,NULL),
  ('74291242585045151329','20174291241194787434','43',NULL,'31017105229982132919',NULL,NULL),
  ('74291243129839833382','20174291241194787434','728921999159149847',NULL,'31017105229982132919',NULL,NULL),
  ('74291243134188984934','20174291241194787434','728923333773378220',NULL,'31017105229982132919',NULL,NULL),
  ('74291243483421955020','20174291241194787434','31',NULL,'31017105229982132919',NULL,NULL),
  ('74291244258949199882','20174291241194787434','731416353426518115',NULL,'31017105229982132919',NULL,NULL),
  ('74291244417952387870','20174291241194787434','73201027288026127603',NULL,'31017105229982132919',NULL,NULL),
  ('74291244548198546855','20174291241194787434','7261455414066648209',NULL,'31017105229982132919',NULL,NULL),
  ('74291245167519638235','20174291241194787434','72613432868824462365',NULL,'31017105229982132919',NULL,NULL),
  ('74291245266239295948','20174291241194787434','29',NULL,'31017105229982132919',NULL,NULL),
  ('7429124527254271110','20174291241194787434','72715121393449627427',NULL,'31017105229982132919',NULL,NULL),
  ('74291245282528156890','20174291241194787434','4',NULL,'31017105229982132919',NULL,NULL),
  ('74291245336259376222','20174291241194787434','784',NULL,'31017105229982132919',NULL,NULL),
  ('8','1','8',NULL,NULL,NULL,NULL),
  ('85231255477157794319','1','85231254108146040749',NULL,'31017105229982132919',NULL,NULL),
  ('85291264597215072632','1','85291261436067259009',NULL,'31017105229982132919',NULL,NULL),
  ('9','1','9',NULL,NULL,NULL,NULL);
COMMIT;

/* Data for the `t_role_user` table  (LIMIT 0,500) */

INSERT INTO `t_role_user` (`lg_USER_ROLE_ID`, `lg_ROLE_ID`, `lg_USER_ID`, `dt_CREATED`, `dt_UPDATED`, `str_CREATED_BY`, `str_UPDATED_BY`) VALUES
  ('1','1','31017105229982132919',NULL,NULL,NULL,NULL),
  ('20131021555156875700','1','31021555156476006126',NULL,NULL,NULL,NULL),
  ('23','1','3102612583420124210',NULL,NULL,NULL,NULL),
  ('4349285789814199273','20131031201318367116','4349285742823031012',NULL,NULL,NULL,NULL),
  ('729104919668972212','20142171241333277693','7291047546404089194','2017-02-09 10:49:19',NULL,NULL,NULL),
  ('73141653192151657949','2017291115544721236','42101057334294686','2017-03-14 16:53:19',NULL,NULL,NULL),
  ('73141653860324089750','2017291115544721236','42150222079569572824','2017-03-14 16:53:08',NULL,NULL,NULL),
  ('74291246253575387648','20174291241194787434','74291246249406234232','2017-04-29 12:46:25',NULL,NULL,NULL);
COMMIT;

/* Data for the `t_sms` table  (LIMIT 0,500) */

INSERT INTO `t_sms` (`ID_SMS`, `MESSAGE`, `dt_CREATED`, `lg_CREATED_BY`, `dt_UPDATED`, `lg_UPDATED_BY`, `STATUT`) VALUES
  ('41114162915294515927','yo man','2014-11-14 16:29:15','thierry',NULL,NULL,'enable'),
  ('41114163352449757324','slt man','2014-11-14 16:33:52','47204771',NULL,NULL,'is_Process'),
  ('41127164140877917828','HCVGHH  VV VJUV VJV','2014-11-27 16:41:40','47204771',NULL,NULL,'is_Process'),
  ('41127164229102362357','JBH IBN J','2014-11-27 16:42:29','77257261',NULL,NULL,'is_Process'),
  ('42111441111288710133','Slt a tous les filles et les gars','2014-02-11 14:41:11','admin','2014-02-15 14:01:31','admin','enable'),
  ('42111617407481707560','salut 2eme test','2014-02-11 16:17:40','07070707',NULL,NULL,'is_Process'),
  ('42111624361007148530','salut 3eme test','2014-02-11 16:24:36','47204771',NULL,NULL,'is_Process'),
  ('42111627444252209839','salut 3eme test','2014-02-11 16:27:44','47204771',NULL,NULL,'is_Process'),
  ('4211163305625735297','salut 3eme test','2014-02-11 16:33:00','47204771',NULL,NULL,'is_Process'),
  ('42111635196945913217','salut 3eme test','2014-02-11 16:35:19','47204771',NULL,NULL,'is_Process'),
  ('421116363572951769','salut 3eme test','2014-02-11 16:36:03','47204771',NULL,NULL,'is_Process'),
  ('421116928345853623','salut c un test','2014-02-11 16:09:28',NULL,NULL,NULL,'is_Process'),
  ('42111712562752287605','nbghgfredgvh','2014-02-11 17:12:56','47204771',NULL,NULL,'is_Process'),
  ('42111713175888153883','njhyuiolkjuyhgtr','2014-02-11 17:13:17','metch',NULL,NULL,'is_Process'),
  ('4211171843913379232','nbhgtfre1235','2014-02-11 17:18:43','47204771',NULL,NULL,'is_Process'),
  ('4211172312391735460','drgdfgtdfg','2014-02-11 17:23:12','47204771',NULL,NULL,'is_Process'),
  ('4211172747540347981','salut 3eme test','2014-02-11 17:27:47','47204771',NULL,NULL,'is_Process'),
  ('42111730197393585313','12324587','2014-02-11 17:30:19','47204771',NULL,NULL,'is_Process'),
  ('42111733246489419718','0123564879','2014-02-11 17:33:24','47204771',NULL,NULL,'is_Process'),
  ('42111753166816382748','fdsdfg','2014-02-11 17:05:31','47204771',NULL,NULL,'is_Process'),
  ('4211177146192350859','r-è(-è(-è(-è','2014-02-11 17:07:14','47204771',NULL,NULL,'is_Process'),
  ('42111781565273394356','jhgjhvbu iubub ','2014-02-11 17:08:15','47204771',NULL,NULL,'is_Process'),
  ('4211179560935245377','salut 3eme test','2014-02-11 17:09:05','47204771',NULL,NULL,'is_Process'),
  ('42128335330792026828','lu on est le 12/02/2014','2014-02-12 08:33:53','47204771',NULL,NULL,'is_Process'),
  ('42142239443063294968','sfdsfsdfsdfsdfsfsdf','2014-02-14 22:39:44','47204771',NULL,NULL,'is_Process'),
  ('42151415112592353699','Urgent Reunion demain a 11 h ....','2014-02-15 14:01:51','admin','2014-02-15 14:02:05','admin','enable'),
  ('4215143409436941224','yo les mec','2014-02-15 14:03:40','47204771',NULL,NULL,'is_Process'),
  ('42151642139963529066','Eh valencia tu es ou?','2014-02-15 16:42:13','57591660',NULL,NULL,'is_Process'),
  ('42151643213685244265','ehhhh hvbhvvh','2014-02-15 16:43:21','57591660',NULL,NULL,'is_Process'),
  ('42161114118839314683','Slt on di koi?','2014-02-16 11:14:11','07696015',NULL,NULL,'is_Process'),
  ('42161115062996494625','hdh yfgiuufiu','2014-02-16 11:15:00','admin',NULL,NULL,'enable'),
  ('42171722999334559372','test','2014-02-17 17:22:09','08484757',NULL,NULL,'is_Process'),
  ('42181548448386204971','uçyèghèçhèç','2014-02-18 15:48:44','47204771',NULL,NULL,'is_Process'),
  ('42181935849154699921','test','2014-02-18 19:35:08','0597350',NULL,NULL,'is_Process'),
  ('42192063768284521248','slt a toi','2014-02-19 20:06:37','07929972',NULL,NULL,'is_Process'),
  ('422512332406592672','Super soireee ce soir','2014-02-25 01:23:03','08543680',NULL,NULL,'is_Process'),
  ('431171012548963796','test','2014-03-01 17:10:12','57591660',NULL,NULL,'is_Process'),
  ('43117152912642525863','Boobas','2014-03-01 17:15:29','59495092',NULL,NULL,'is_Process'),
  ('431171615395810497','peteuse','2014-03-01 17:16:15','57591660',NULL,NULL,'is_Process'),
  ('43117174156577466373','tu es fole????','2014-03-01 17:17:41','57591660',NULL,NULL,'is_Process'),
  ('43117827586756738','ye va lenciza on di koi?','2014-03-01 17:08:27','57591660',NULL,NULL,'is_Process'),
  ('4311785156923172696','tu es ou?','2014-03-01 17:08:51','57591660',NULL,NULL,'is_Process'),
  ('4311791992434145940','on di koi?','2014-03-01 17:09:19','57591660',NULL,NULL,'is_Process'),
  ('45161655338836328248','on di koi?','2014-05-16 16:55:33','47204771',NULL,NULL,'is_Process'),
  ('54116112166458859981','Yo test','2015-04-01 16:11:21','07247773',NULL,NULL,'is_Process'),
  ('54116115519223812749','tu est ou','2015-04-01 16:11:55','07247773',NULL,NULL,'is_Process'),
  ('541161251717039944','on di koi le boss est la','2015-04-01 16:12:05','07247773',NULL,NULL,'is_Process'),
  ('54116143922064501343','tu esy  ou?','2015-04-01 16:14:39','48828011',NULL,NULL,'is_Process'),
  ('541161451499972849','tu a fil les script','2015-04-01 16:14:51','48828011',NULL,NULL,'is_Process'),
  ('62151723076726154512','RTGHRTYHRT','2016-02-15 17:02:30','ken',NULL,NULL,'enable'),
  ('6215172723264078575','FGHFG','2016-02-15 17:02:07','47204771',NULL,NULL,'is_Process'),
  ('72716152533085687558','03113','2017-02-07 16:15:25','47204771',NULL,NULL,'is_Process'),
  ('73161621132433201554','yo man','2017-03-16 16:21:13','885888888',NULL,NULL,'is_Process'),
  ('73161636529368412931','momo','2017-03-16 16:36:52','48484848848',NULL,NULL,'is_Process'),
  ('73161637137267239230','hhh','2017-03-16 16:37:13','08543680',NULL,NULL,'is_Process'),
  ('73161637187275571628','guèg_g_','2017-03-16 16:37:18','59495092',NULL,NULL,'is_Process'),
  ('7316163730639410239','hh','2017-03-16 16:37:30','48484848848',NULL,NULL,'is_Process'),
  ('73161637348409211031','hu','2017-03-16 16:37:34','48828011',NULL,NULL,'is_Process'),
  ('73161637418475895891','hh','2017-03-16 16:37:41','0597350',NULL,NULL,'is_Process'),
  ('73161637459085032650','hbu','2017-03-16 16:37:45','07696015',NULL,NULL,'is_Process'),
  ('73161637507026202788','hhhhh','2017-03-16 16:37:50','77257261',NULL,NULL,'is_Process'),
  ('7316163814825818998','bjb','2017-03-16 16:38:01','59495092',NULL,NULL,'is_Process');
COMMIT;

/* Data for the `t_sms_not_send` table  (LIMIT 0,500) */

INSERT INTO `t_sms_not_send` (`ID_SMS`, `EXPEDITEUR`, `DESTINATEUR`, `MESSAGES`, `STATUT`, `CREDIT`, `dt_CREATED`, `lg_CREATED_BY`, `dt_UPDATED`, `lg_UPDATED_BY`, `ID_SMS_MASTER`) VALUES
  ('201411141633526804775','null','47204771','slt man','is_Waiting',0.000,'2014-11-14 16:33:52','null','2014-11-14 16:33:52','thierry','41114163352449757324'),
  ('201411271641404922228','null','47204771','HCVGHH  VV VJUV VJV','is_Waiting',0.000,'2014-11-27 16:41:40','null','2014-11-27 16:41:40','sandra','41127164140877917828'),
  ('201411271642292468371','null','77257261','JBH IBN J','is_Waiting',0.000,'2014-11-27 16:42:29','null','2014-11-27 16:42:29','sandra','41127164229102362357'),
  ('2014627201340256198','null','57591660','Eh valencia tu es ou?','is_Waiting',0.000,'2014-06-27 20:13:40','null','2014-06-27 20:13:40','admin','42151642139963529066'),
  ('2014627201468636212','null','57591660','Eh valencia tu es ou?','is_Waiting',0.000,'2014-06-27 20:14:06','null','2014-06-27 20:14:06','admin','42151642139963529066'),
  ('20146272018428193759','null','57591660','Eh valencia tu es ou?','is_Waiting',0.000,'2014-06-27 20:18:42','null','2014-06-27 20:18:42','admin','42151642139963529066'),
  ('2014627202293712586','null','57591660','Eh valencia tu es ou?','is_Waiting',0.000,'2014-06-27 20:22:09','null','2014-06-27 20:22:09','admin','42151642139963529066'),
  ('20146272026131852260','null','57591660','Eh valencia tu es ou?','is_Waiting',0.000,'2014-06-27 20:26:13','null','2014-06-27 20:26:13','admin','42151642139963529066'),
  ('20146272032283749110','null','57591660','Eh valencia tu es ou?','is_Waiting',0.000,'2014-06-27 20:32:28','null','2014-06-27 20:32:28','admin','42151642139963529066'),
  ('20146272033109588805','null','57591660','Eh valencia tu es ou?','is_Waiting',0.000,'2014-06-27 20:33:10','null','2014-06-27 20:33:10','admin','42151642139963529066'),
  ('20146272041143501115','null','57591660','Eh valencia tu es ou?','is_Waiting',0.000,'2014-06-27 20:41:14','null','2014-06-27 20:41:14','admin','42151642139963529066'),
  ('2014627204242542986','null','57591660','Eh valencia tu es ou?','is_Waiting',0.000,'2014-06-27 20:42:04','null','2014-06-27 20:42:04','sandra','42151642139963529066'),
  ('201541161122524418','null','07247773','Yo test','is_Waiting',0.000,'2015-04-01 16:11:22','null','2015-04-01 16:11:22','ken','54116112166458859981'),
  ('2015411611553832397','null','07247773','tu est ou','is_Waiting',0.000,'2015-04-01 16:11:55','null','2015-04-01 16:11:55','ken','54116115519223812749'),
  ('201541161253735924','null','07247773','on di koi le boss est la','is_Waiting',0.000,'2015-04-01 16:12:05','null','2015-04-01 16:12:05','ken','541161251717039944'),
  ('2015411614394132285','null','48828011','tu esy  ou?','is_Waiting',0.000,'2015-04-01 16:14:39','null','2015-04-01 16:14:39','ken','54116143922064501343'),
  ('201541161451656803','null','48828011','tu a fil les script','is_Waiting',0.000,'2015-04-01 16:14:51','null','2015-04-01 16:14:51','ken','541161451499972849'),
  ('201621517274818592','null','47204771','FGHFG','is_Waiting',0.000,'2016-02-15 17:02:07','null','2016-02-15 17:02:07','ken','6215172723264078575'),
  ('2017271615255237773','null','47204771','03113','is_Waiting',0.000,'2017-02-07 16:15:25','null','2017-02-07 16:15:25','admin','72716152533085687558'),
  ('20173161621157248308','null','885888888','yo man','is_Waiting',0.000,'2017-03-16 16:21:15','null','2017-03-16 16:21:15','admin','73161621132433201554'),
  ('20173161636542977244','null','48484848848','momo','is_Waiting',0.000,'2017-03-16 16:36:55','null','2017-03-16 16:36:54','admin','73161636529368412931'),
  ('20173161637139385078','null','08543680','hhh','is_Waiting',0.000,'2017-03-16 16:37:13','null','2017-03-16 16:37:13','admin','73161637137267239230'),
  ('20173161637188765577','null','59495092','guèg_g_','is_Waiting',0.000,'2017-03-16 16:37:18','null','2017-03-16 16:37:18','admin','73161637187275571628'),
  ('20173161637308517316','null','48484848848','hh','is_Waiting',0.000,'2017-03-16 16:37:30','null','2017-03-16 16:37:30','admin','7316163730639410239'),
  ('2017316163735142020','null','48828011','hu','is_Waiting',0.000,'2017-03-16 16:37:35','null','2017-03-16 16:37:35','admin','73161637348409211031'),
  ('2017316163742924858','null','0597350','hh','is_Waiting',0.000,'2017-03-16 16:37:42','null','2017-03-16 16:37:42','admin','73161637418475895891'),
  ('2017316163746274868','null','07696015','hbu','is_Waiting',0.000,'2017-03-16 16:37:46','null','2017-03-16 16:37:46','admin','73161637459085032650'),
  ('20173161637508278513','null','77257261','hhhhh','is_Waiting',0.000,'2017-03-16 16:37:50','null','2017-03-16 16:37:50','admin','73161637507026202788'),
  ('2017316163811874027','null','59495092','bjb','is_Waiting',0.000,'2017-03-16 16:38:01','null','2017-03-16 16:38:01','admin','7316163814825818998');
COMMIT;

/* Data for the `t_snap_shop_daly_recette` table  (LIMIT 0,500) */

INSERT INTO `t_snap_shop_daly_recette` (`lg_ID`, `lg_TYPE_RECETTE_ID`, `int_AMOUNT`, `dt_DAY`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`, `int_NUMBER_TRANSACTION`) VALUES
  ('72261448306192459826','2',2700.000,'2017-02-26','2017-02-26 14:48:30',NULL,'enable',1),
  ('72261448308697873559','1',15000.000,'2017-02-26','2017-02-26 14:48:30',NULL,'enable',1),
  ('72261450922744478573','3',12300.000,'2017-02-26','2017-02-26 14:50:09',NULL,'enable',1),
  ('72261657362398073074','2',0.000,'2017-02-26','2017-02-26 16:57:03',NULL,'enable',1),
  ('72261657429731215850','1',0.000,'2017-02-26','2017-02-26 16:57:04',NULL,'enable',1),
  ('72261657498928524882','2',0.000,'2017-02-26','2017-02-26 16:57:49',NULL,'enable',1),
  ('72261657505685075695','1',0.000,'2017-02-26','2017-02-26 16:57:50',NULL,'enable',1),
  ('72261657543348781819','2',0.000,'2017-02-26','2017-02-26 16:57:54',NULL,'enable',1),
  ('72261657556783508598','1',0.000,'2017-02-26','2017-02-26 16:57:55',NULL,'enable',1),
  ('72261715198636454478','2',0.000,'2017-02-26','2017-02-26 17:15:19',NULL,'enable',1),
  ('72261715227677919158','1',0.000,'2017-02-26','2017-02-26 17:15:22',NULL,'enable',1),
  ('72261717357859130384','2',0.000,'2017-02-26','2017-02-26 17:17:35',NULL,'enable',1),
  ('72261717361481516684','1',0.000,'2017-02-26','2017-02-26 17:17:36',NULL,'enable',1),
  ('72261730184454313847','2',0.000,'2017-02-26','2017-02-26 17:30:18',NULL,'enable',1),
  ('72261730188425669831','1',0.000,'2017-02-26','2017-02-26 17:30:18',NULL,'enable',1),
  ('72261836462556666598','2',0.000,'2017-02-26','2017-02-26 18:36:04',NULL,'enable',1),
  ('72261836494751872390','1',0.000,'2017-02-26','2017-02-26 18:36:04',NULL,'enable',1),
  ('72261842452932630783','2',0.000,'2017-02-26','2017-02-26 18:42:45',NULL,'enable',1),
  ('72261842455954783448','1',0.000,'2017-02-26','2017-02-26 18:42:45',NULL,'enable',1),
  ('72261852554176042873','2',0.000,'2017-02-26','2017-02-26 18:52:55',NULL,'enable',1),
  ('72261852557176745344','1',0.000,'2017-02-26','2017-02-26 18:52:55',NULL,'enable',1),
  ('72261852579992595730','2',0.000,'2017-02-26','2017-02-26 18:52:58',NULL,'enable',1),
  ('72261852583175800749','1',0.000,'2017-02-26','2017-02-26 18:52:58',NULL,'enable',1),
  ('72261956383303744903','2',0.000,'2017-02-26','2017-02-26 19:56:38',NULL,'enable',1),
  ('72261956386299144987','1',0.000,'2017-02-26','2017-02-26 19:56:38',NULL,'enable',1),
  ('72261956412502241322','2',0.000,'2017-02-26','2017-02-26 19:56:41',NULL,'enable',1),
  ('72261956415764312401','1',0.000,'2017-02-26','2017-02-26 19:56:41',NULL,'enable',1),
  ('72262025427276256626','2',0.000,'2017-02-26','2017-02-26 20:25:42',NULL,'enable',1),
  ('7226202543401532759','1',0.000,'2017-02-26','2017-02-26 20:25:43',NULL,'enable',1),
  ('72262025454045140974','2',0.000,'2017-02-26','2017-02-26 20:25:45',NULL,'enable',1),
  ('72262025456595721312','1',0.000,'2017-02-26','2017-02-26 20:25:45',NULL,'enable',1),
  ('72262029144628016578','2',0.000,'2017-02-26','2017-02-26 20:29:01',NULL,'enable',1),
  ('72262029194465009160','1',0.000,'2017-02-26','2017-02-26 20:29:01',NULL,'enable',1),
  ('7226202944899876065','2',0.000,'2017-02-26','2017-02-26 20:29:04',NULL,'enable',1),
  ('72262029479995799580','1',0.000,'2017-02-26','2017-02-26 20:29:04',NULL,'enable',1),
  ('72262032323855046927','1',0.000,'2017-02-26','2017-02-26 20:32:32',NULL,'enable',1),
  ('72262032324835035675','2',0.000,'2017-02-26','2017-02-26 20:32:32',NULL,'enable',1),
  ('72262032366228398675','2',0.000,'2017-02-26','2017-02-26 20:32:36',NULL,'enable',1),
  ('72262032368092032350','1',0.000,'2017-02-26','2017-02-26 20:32:36',NULL,'enable',1),
  ('72262032433306327738','2',0.000,'2017-02-26','2017-02-26 20:32:43',NULL,'enable',1),
  ('72262032449353203463','1',0.000,'2017-02-26','2017-02-26 20:32:44',NULL,'enable',1),
  ('72262032575108377448','2',0.000,'2017-02-26','2017-02-26 20:32:57',NULL,'enable',1),
  ('72262032578186088159','1',0.000,'2017-02-26','2017-02-26 20:32:57',NULL,'enable',1),
  ('72262033026119235420','2',0.000,'2017-02-26','2017-02-26 20:33:00',NULL,'enable',1),
  ('72262033052490348800','1',0.000,'2017-02-26','2017-02-26 20:33:00',NULL,'enable',1),
  ('72262033194034815986','1',0.000,'2017-02-26','2017-02-26 20:33:19',NULL,'enable',1),
  ('72262033197075522867','2',0.000,'2017-02-26','2017-02-26 20:33:19',NULL,'enable',1),
  ('72262034251456004039','2',0.000,'2017-02-26','2017-02-26 20:34:25',NULL,'enable',1),
  ('72262034254694305519','1',0.000,'2017-02-26','2017-02-26 20:34:25',NULL,'enable',1),
  ('72262046161342741487','2',0.000,'2017-02-26','2017-02-26 20:46:16',NULL,'enable',1),
  ('72262046163272882736','1',0.000,'2017-02-26','2017-02-26 20:46:16',NULL,'enable',1),
  ('72262046584437844381','2',0.000,'2017-02-26','2017-02-26 20:46:58',NULL,'enable',1),
  ('72262046589501652408','1',0.000,'2017-02-26','2017-02-26 20:46:58',NULL,'enable',1),
  ('72262085528097525577','2',0.000,'2017-02-26','2017-02-26 20:08:55',NULL,'enable',1),
  ('72262085557182071212','1',0.000,'2017-02-26','2017-02-26 20:08:55',NULL,'enable',1),
  ('7226208584695717568','2',0.000,'2017-02-26','2017-02-26 20:08:58',NULL,'enable',1),
  ('72262085848089641768','1',0.000,'2017-02-26','2017-02-26 20:08:58',NULL,'enable',1),
  ('72262103840870487401','2',0.000,'2017-02-26','2017-02-26 21:00:38',NULL,'enable',1),
  ('72262103866144854695','1',0.000,'2017-02-26','2017-02-26 21:00:38',NULL,'enable',1),
  ('72262104068658469221','2',0.000,'2017-02-26','2017-02-26 21:00:40',NULL,'enable',1),
  ('7226210408649321824','1',0.000,'2017-02-26','2017-02-26 21:00:40',NULL,'enable',1),
  ('72262110320137098541','2',0.000,'2017-02-26','2017-02-26 21:10:03',NULL,'enable',1),
  ('72262110323291624297','1',0.000,'2017-02-26','2017-02-26 21:10:32',NULL,'enable',1),
  ('72262110328165211809','2',0.000,'2017-02-26','2017-02-26 21:10:32',NULL,'enable',1),
  ('72262110342854055546','2',0.000,'2017-02-26','2017-02-26 21:10:34',NULL,'enable',1),
  ('72262110345093049674','1',0.000,'2017-02-26','2017-02-26 21:10:03',NULL,'enable',1),
  ('72262110347114210749','1',0.000,'2017-02-26','2017-02-26 21:10:34',NULL,'enable',1),
  ('72262110546715157458','2',0.000,'2017-02-26','2017-02-26 21:10:05',NULL,'enable',1),
  ('72262110580396146902','1',0.000,'2017-02-26','2017-02-26 21:10:05',NULL,'enable',1),
  ('72262110923821275262','1',0.000,'2017-02-26','2017-02-26 21:10:09',NULL,'enable',1),
  ('7226211096442814113','2',0.000,'2017-02-26','2017-02-26 21:10:09',NULL,'enable',1),
  ('7226211303808157455','1',0.000,'2017-02-26','2017-02-26 21:01:30',NULL,'enable',1),
  ('7226211307183896296','2',0.000,'2017-02-26','2017-02-26 21:01:30',NULL,'enable',1),
  ('72262123434993129609','2',0.000,'2017-02-26','2017-02-26 21:23:43',NULL,'enable',1),
  ('72262123436944228613','1',0.000,'2017-02-26','2017-02-26 21:23:43',NULL,'enable',1),
  ('72262132416364400673','2',0.000,'2017-02-26','2017-02-26 21:32:41',NULL,'enable',1),
  ('72262132419276700266','1',0.000,'2017-02-26','2017-02-26 21:32:41',NULL,'enable',1),
  ('72262133123627814167','1',0.000,'2017-02-26','2017-02-26 21:33:12',NULL,'enable',1),
  ('72262133129188349792','2',0.000,'2017-02-26','2017-02-26 21:33:12',NULL,'enable',1),
  ('72262135365924639289','2',0.000,'2017-02-26','2017-02-26 21:35:36',NULL,'enable',1),
  ('72262135371831441646','1',0.000,'2017-02-26','2017-02-26 21:35:37',NULL,'enable',1),
  ('72262136359646749433','2',0.000,'2017-02-26','2017-02-26 21:36:35',NULL,'enable',1),
  ('72262136362161979995','1',0.000,'2017-02-26','2017-02-26 21:36:36',NULL,'enable',1),
  ('72262136383321770896','1',0.000,'2017-02-26','2017-02-26 21:36:38',NULL,'enable',1),
  ('72262136386880088436','2',0.000,'2017-02-26','2017-02-26 21:36:38',NULL,'enable',1),
  ('72262138323879232299','2',0.000,'2017-02-26','2017-02-26 21:38:32',NULL,'enable',1),
  ('72262138325531790192','1',0.000,'2017-02-26','2017-02-26 21:38:32',NULL,'enable',1),
  ('72262192237476149004','1',0.000,'2017-02-26','2017-02-26 21:09:22',NULL,'enable',1),
  ('72262192297659802','2',0.000,'2017-02-26','2017-02-26 21:09:22',NULL,'enable',1),
  ('72262192434344626943','2',0.000,'2017-02-26','2017-02-26 21:09:24',NULL,'enable',1),
  ('72262192453186749604','1',0.000,'2017-02-26','2017-02-26 21:09:24',NULL,'enable',1),
  ('72262192668128098454','2',0.000,'2017-02-26','2017-02-26 21:09:26',NULL,'enable',1),
  ('7226219275721366436','1',0.000,'2017-02-26','2017-02-26 21:09:27',NULL,'enable',1),
  ('72281058126803588468','2',0.000,'2017-02-28','2017-02-28 10:58:12',NULL,'enable',1),
  ('72281058134381622165','1',0.000,'2017-02-28','2017-02-28 10:58:13',NULL,'enable',1),
  ('72281059308329204661','2',0.000,'2017-02-28','2017-02-28 10:59:30',NULL,'enable',1),
  ('72281059319490161916','1',0.000,'2017-02-28','2017-02-28 10:59:31',NULL,'enable',1),
  ('72281123267326249240','2',0.000,'2017-02-28','2017-02-28 11:23:26',NULL,'enable',1),
  ('7228112327747028873','1',0.000,'2017-02-28','2017-02-28 11:23:27',NULL,'enable',1),
  ('72281137495814349237','2',0.000,'2017-02-28','2017-02-28 11:37:49',NULL,'enable',1),
  ('72281137498268965691','1',0.000,'2017-02-28','2017-02-28 11:37:49',NULL,'enable',1),
  ('72281138134558644036','2',0.000,'2017-02-28','2017-02-28 11:38:13',NULL,'enable',1),
  ('72281138138204328932','1',0.000,'2017-02-28','2017-02-28 11:38:13',NULL,'enable',1),
  ('72281175435487138008','2',0.000,'2017-02-28','2017-02-28 11:07:54',NULL,'enable',1),
  ('72281175462455723156','1',0.000,'2017-02-28','2017-02-28 11:07:54',NULL,'enable',1),
  ('72281254271607405454','2',0.000,'2017-02-28','2017-02-28 12:54:27',NULL,'enable',1),
  ('72281254278102298364','1',0.000,'2017-02-28','2017-02-28 12:54:27',NULL,'enable',1),
  ('72281255162269602963','2',0.000,'2017-02-28','2017-02-28 12:55:16',NULL,'enable',1),
  ('72281255162706941609','1',0.000,'2017-02-28','2017-02-28 12:55:16',NULL,'enable',1),
  ('72281257766570925375','2',0.000,'2017-02-28','2017-02-28 12:57:07',NULL,'enable',1),
  ('72281257796137226784','1',0.000,'2017-02-28','2017-02-28 12:57:07',NULL,'enable',1),
  ('7228131642410491020','2',0.000,'2017-02-28','2017-02-28 13:16:42',NULL,'enable',1),
  ('72281316427621104357','1',0.000,'2017-02-28','2017-02-28 13:16:42',NULL,'enable',1),
  ('72281318418556754165','2',0.000,'2017-02-28','2017-02-28 13:18:41',NULL,'enable',1),
  ('72281318421244593731','1',0.000,'2017-02-28','2017-02-28 13:18:42',NULL,'enable',1),
  ('72281326321782972818','2',0.000,'2017-02-28','2017-02-28 13:26:32',NULL,'enable',1),
  ('72281326324924220225','1',0.000,'2017-02-28','2017-02-28 13:26:32',NULL,'enable',1),
  ('72281344427446252933','1',0.000,'2017-02-28','2017-02-28 13:44:42',NULL,'enable',1),
  ('72281344429135924057','2',0.000,'2017-02-28','2017-02-28 13:44:42',NULL,'enable',1),
  ('72281346174793966948','1',29100.000,'2017-02-28','2017-02-28 13:46:17',NULL,'enable',1),
  ('72281346176613103075','2',5238.000,'2017-02-28','2017-02-28 13:46:17',NULL,'enable',1),
  ('72281346207711405621','2',5238.000,'2017-02-28','2017-02-28 13:46:20',NULL,'enable',1),
  ('72281346212861054974','1',29100.000,'2017-02-28','2017-02-28 13:46:21',NULL,'enable',1),
  ('72281346283019394911','2',0.000,'2017-02-28','2017-02-28 13:46:28',NULL,'enable',1),
  ('72281346288796273275','1',0.000,'2017-02-28','2017-02-28 13:46:28',NULL,'enable',1),
  ('72281346331609136479','2',2700.000,'2017-02-28','2017-02-28 13:46:33',NULL,'enable',1),
  ('72281346335883210508','1',15000.000,'2017-02-28','2017-02-28 13:46:33',NULL,'enable',1),
  ('73161320167996495650','2',0.000,'2017-03-16','2017-03-16 13:20:16',NULL,'enable',1),
  ('73161320172041419413','1',0.000,'2017-03-16','2017-03-16 13:20:17',NULL,'enable',1),
  ('73161358411526997942','2',0.000,'2017-03-16','2017-03-16 13:58:41',NULL,'enable',1),
  ('73161358414252219111','1',0.000,'2017-03-16','2017-03-16 13:58:41',NULL,'enable',1),
  ('73161411528904947363','2',0.000,'2017-03-16','2017-03-16 14:11:52',NULL,'enable',1),
  ('73161411531166952753','1',0.000,'2017-03-16','2017-03-16 14:11:53',NULL,'enable',1),
  ('73161417466232851841','2',0.000,'2017-03-16','2017-03-16 14:17:46',NULL,'enable',1),
  ('73161417469871017677','1',0.000,'2017-03-16','2017-03-16 14:17:46',NULL,'enable',1),
  ('73161423432656301133','1',0.000,'2017-03-16','2017-03-16 14:23:43',NULL,'enable',1),
  ('7316142343535516965','2',0.000,'2017-03-16','2017-03-16 14:23:43',NULL,'enable',1),
  ('73161425378428351871','2',0.000,'2017-03-16','2017-03-16 14:25:37',NULL,'enable',1),
  ('73161425381116132456','1',0.000,'2017-03-16','2017-03-16 14:25:38',NULL,'enable',1),
  ('73161430429576254825','2',0.000,'2017-03-16','2017-03-16 14:30:42',NULL,'enable',1),
  ('73161430432475072651','1',0.000,'2017-03-16','2017-03-16 14:30:43',NULL,'enable',1),
  ('73161431356222621179','2',0.000,'2017-03-16','2017-03-16 14:31:35',NULL,'enable',1),
  ('73161431358944753306','1',0.000,'2017-03-16','2017-03-16 14:31:35',NULL,'enable',1),
  ('73161951572867051238','2',0.000,'2017-03-16','2017-03-16 19:51:57',NULL,'enable',1),
  ('73161951575491243210','1',0.000,'2017-03-16','2017-03-16 19:51:57',NULL,'enable',1),
  ('73161952133288141326','2',0.000,'2017-03-16','2017-03-16 19:52:13',NULL,'enable',1),
  ('73161952135993279971','1',0.000,'2017-03-16','2017-03-16 19:52:13',NULL,'enable',1),
  ('73161957531687925606','2',0.000,'2017-03-16','2017-03-16 19:57:53',NULL,'enable',1),
  ('73161957534155488455','1',0.000,'2017-03-16','2017-03-16 19:57:53',NULL,'enable',1),
  ('7316201848187107583','2',0.000,'2017-03-16','2017-03-16 20:01:08',NULL,'enable',1),
  ('7316201873212678674','1',0.000,'2017-03-16','2017-03-16 20:01:08',NULL,'enable',1),
  ('7316202177449987220','3',0.000,'2017-03-16','2017-03-16 20:02:17',NULL,'enable',1),
  ('7316202236077604846','3',0.000,'2017-03-16','2017-03-16 20:02:23',NULL,'enable',1),
  ('73162022698970509178','3',0.000,'2017-03-16','2017-03-16 20:02:26',NULL,'enable',1),
  ('73162040114843649643','2',0.000,'2017-03-16','2017-03-16 20:40:11',NULL,'enable',1),
  ('73162040117463003628','1',0.000,'2017-03-16','2017-03-16 20:40:11',NULL,'enable',1),
  ('73162040213553517723','1',0.000,'2017-03-16','2017-03-16 20:40:21',NULL,'enable',1),
  ('73162040216079401521','2',0.000,'2017-03-16','2017-03-16 20:40:21',NULL,'enable',1),
  ('73162041261382416966','3',0.000,'2017-03-16','2017-03-16 20:04:12',NULL,'enable',1),
  ('73162041584648674503','3',0.000,'2017-03-16','2017-03-16 20:04:15',NULL,'enable',1),
  ('7316204213445294615','3',0.000,'2017-03-16','2017-03-16 20:04:21',NULL,'enable',1),
  ('731620427871827095','3',0.000,'2017-03-16','2017-03-16 20:04:27',NULL,'enable',1),
  ('73162043135623688198','3',0.000,'2017-03-16','2017-03-16 20:04:31',NULL,'enable',1),
  ('73162044857963135615','2',0.000,'2017-03-16','2017-03-16 20:04:48',NULL,'enable',1),
  ('7316204488151932224','1',0.000,'2017-03-16','2017-03-16 20:04:48',NULL,'enable',1),
  ('73162050674966496454','2',0.000,'2017-03-16','2017-03-16 20:50:06',NULL,'enable',1),
  ('7316205074084743923','1',0.000,'2017-03-16','2017-03-16 20:50:07',NULL,'enable',1),
  ('7316208222462214592','2',0.000,'2017-03-16','2017-03-16 20:08:02',NULL,'enable',1),
  ('7316208248588123000','1',0.000,'2017-03-16','2017-03-16 20:08:02',NULL,'enable',1),
  ('73201051819134297318','2',0.000,'2017-03-20','2017-03-20 10:51:08',NULL,'enable',1),
  ('73201051849147944539','1',0.000,'2017-03-20','2017-03-20 10:51:08',NULL,'enable',1),
  ('73201314252529294196','2',0.000,'2017-03-20','2017-03-20 13:14:25',NULL,'enable',1),
  ('73201314258682228244','1',0.000,'2017-03-20','2017-03-20 13:14:25',NULL,'enable',1),
  ('73291012461117115275','2',0.000,'2017-03-29','2017-03-29 10:12:46',NULL,'enable',1),
  ('73291012463709023839','1',0.000,'2017-03-29','2017-03-29 10:12:46',NULL,'enable',1),
  ('73291012552075293905','2',0.000,'2017-03-29','2017-03-29 10:12:55',NULL,'enable',1),
  ('73291012555243014233','1',0.000,'2017-03-29','2017-03-29 10:12:55',NULL,'enable',1),
  ('73291013103514952690','1',0.000,'2017-03-29','2017-03-29 10:13:10',NULL,'enable',1),
  ('73291013164628038829','2',0.000,'2017-03-29','2017-03-29 10:13:16',NULL,'enable',1),
  ('73291013169305280417','1',0.000,'2017-03-29','2017-03-29 10:13:16',NULL,'enable',1),
  ('73291013226875454158','2',0.000,'2017-03-29','2017-03-29 10:13:22',NULL,'enable',1),
  ('732910132394838930','1',0.000,'2017-03-29','2017-03-29 10:13:23',NULL,'enable',1),
  ('73291013393992972215','2',0.000,'2017-03-29','2017-03-29 10:13:03',NULL,'enable',1),
  ('73291013442455107475','1',0.000,'2017-03-29','2017-03-29 10:13:04',NULL,'enable',1),
  ('73291013993162103767','2',0.000,'2017-03-29','2017-03-29 10:13:09',NULL,'enable',1),
  ('73299303282840887350','2',0.000,'2017-03-29','2017-03-29 09:30:32',NULL,'enable',1),
  ('7329930332962693957','1',0.000,'2017-03-29','2017-03-29 09:30:33',NULL,'enable',1),
  ('85281256205387647334','2',2700.000,'2018-05-28','2018-05-28 12:56:20',NULL,'enable',1),
  ('85281256208899959974','1',15000.000,'2018-05-28','2018-05-28 12:56:20',NULL,'enable',1),
  ('85281320174316101379','2',1440.000,'2018-05-28','2018-05-28 13:20:17',NULL,'enable',1),
  ('85281320178393006109','1',8000.000,'2018-05-28','2018-05-28 13:20:17',NULL,'enable',1),
  ('85281320232230296520','2',630.000,'2018-05-28','2018-05-28 13:20:23',NULL,'enable',1),
  ('85281320232742465381','1',3500.000,'2018-05-28','2018-05-28 13:20:23',NULL,'enable',1),
  ('85281320710821442276','2',900.000,'2018-05-28','2018-05-28 13:20:07',NULL,'enable',1),
  ('85281320743427474564','1',5000.000,'2018-05-28','2018-05-28 13:20:07',NULL,'enable',1),
  ('85281331565091785290','2',1440.000,'2018-05-28','2018-05-28 13:31:56',NULL,'enable',1),
  ('852813315676381452','1',8000.000,'2018-05-28','2018-05-28 13:31:56',NULL,'enable',1),
  ('85281546233376491944','2',1710.000,'2018-05-28','2018-05-28 15:46:23',NULL,'enable',1),
  ('85281546237403148447','1',9500.000,'2018-05-28','2018-05-28 15:46:23',NULL,'enable',1),
  ('85311255484823796855','2',2520.000,'2018-05-31','2018-05-31 12:55:48',NULL,'enable',1),
  ('85311255491686896585','1',14000.000,'2018-05-31','2018-05-31 12:55:49',NULL,'enable',1),
  ('85311256257931098308','2',2970.000,'2018-05-31','2018-05-31 12:56:25',NULL,'enable',1),
  ('85311256265868947016','1',16500.000,'2018-05-31','2018-05-31 12:56:26',NULL,'enable',1),
  ('8531132388048529398','2',540.000,'2018-05-31','2018-05-31 13:02:03',NULL,'enable',1),
  ('853113246749967605','1',3000.000,'2018-05-31','2018-05-31 13:02:04',NULL,'enable',1),
  ('85311327582158995268','1',7500.000,'2018-05-31','2018-05-31 13:27:58',NULL,'enable',1),
  ('85311327582663525442','2',1350.000,'2018-05-31','2018-05-31 13:27:58',NULL,'enable',1),
  ('85311328174129872293','2',2646.000,'2018-05-31','2018-05-31 13:28:17',NULL,'enable',1),
  ('85311328176684747707','1',14700.000,'2018-05-31','2018-05-31 13:28:17',NULL,'enable',1),
  ('85311333217475454102','2',1692.000,'2018-05-31','2018-05-31 13:33:21',NULL,'enable',1),
  ('85311333219591430267','1',9400.000,'2018-05-31','2018-05-31 13:33:21',NULL,'enable',1),
  ('85311618557747335083','2',1440.000,'2018-05-31','2018-05-31 16:18:05',NULL,'enable',1),
  ('85311618592410494932','1',8000.000,'2018-05-31','2018-05-31 16:18:05',NULL,'enable',1),
  ('85311622524014239466','2',720.000,'2018-05-31','2018-05-31 16:22:52',NULL,'enable',1),
  ('85311622526808787126','1',4000.000,'2018-05-31','2018-05-31 16:22:52',NULL,'enable',1),
  ('85311743319641587220','2',540.000,'2018-05-31','2018-05-31 17:43:31',NULL,'enable',1),
  ('85311743322137917481','1',3000.000,'2018-05-31','2018-05-31 17:43:32',NULL,'enable',1),
  ('85311751579043387347','2',540.000,'2018-05-31','2018-05-31 17:51:57',NULL,'enable',1),
  ('85311751582385605898','1',3000.000,'2018-05-31','2018-05-31 17:51:58',NULL,'enable',1),
  ('85312252565172907536','2',900.000,'2018-05-31','2018-05-31 22:52:56',NULL,'enable',1),
  ('85312252568396921415','1',5000.000,'2018-05-31','2018-05-31 22:52:56',NULL,'enable',1),
  ('85312312093783659909','2',3690.000,'2018-05-31','2018-05-31 23:01:20',NULL,'enable',1),
  ('853123121137718721','1',20500.000,'2018-05-31','2018-05-31 23:01:21',NULL,'enable',1),
  ('85312313752399752386','2',2070.000,'2018-05-31','2018-05-31 23:01:37',NULL,'enable',1),
  ('85312313785463148616','1',11500.000,'2018-05-31','2018-05-31 23:01:37',NULL,'enable',1),
  ('85319263642862328593','2',2646.000,'2018-05-31','2018-05-31 09:26:36',NULL,'enable',1),
  ('85319263850151316020','1',14700.000,'2018-05-31','2018-05-31 09:26:38',NULL,'enable',1),
  ('85319305595398617447','2',3780.000,'2018-05-31','2018-05-31 09:30:55',NULL,'enable',1),
  ('85319305665513752155','1',21000.000,'2018-05-31','2018-05-31 09:30:56',NULL,'enable',1),
  ('85319451029636245955','1',19000.000,'2018-05-31','2018-05-31 09:45:10',NULL,'enable',1),
  ('8531945416848412222','1',10500.000,'2018-05-31','2018-05-31 09:45:41',NULL,'enable',1),
  ('8531945418618672870','2',1890.000,'2018-05-31','2018-05-31 09:45:41',NULL,'enable',1),
  ('8531945893377172507','2',3420.000,'2018-05-31','2018-05-31 09:45:08',NULL,'enable',1),
  ('8531951165154077159','2',2340.000,'2018-05-31','2018-05-31 09:51:16',NULL,'enable',1),
  ('8531951171579538747','1',13000.000,'2018-05-31','2018-05-31 09:51:17',NULL,'enable',1),
  ('86122135994116049479','2',3150.000,'2018-06-01','2018-06-01 22:13:59',NULL,'enable',1),
  ('8612214016788945312','1',17500.000,'2018-06-01','2018-06-01 22:14:00',NULL,'enable',1),
  ('8612216346895544940','2',720.000,'2018-06-01','2018-06-01 22:16:03',NULL,'enable',1),
  ('861221637009018552','1',4000.000,'2018-06-01','2018-06-01 22:16:03',NULL,'enable',1),
  ('86122165029828451000','1',25500.000,'2018-06-01','2018-06-01 22:16:50',NULL,'enable',1),
  ('8612216503842401842','2',4590.000,'2018-06-01','2018-06-01 22:16:50',NULL,'enable',1),
  ('861221954257026051','2',1710.000,'2018-06-01','2018-06-01 22:19:54',NULL,'enable',1),
  ('86122195428970383513','1',9500.000,'2018-06-01','2018-06-01 22:19:54',NULL,'enable',1),
  ('8621253357048481384','2',2790.000,'2018-06-02','2018-06-02 12:53:35',NULL,'enable',1),
  ('86212533640416479750','1',15500.000,'2018-06-02','2018-06-02 12:53:36',NULL,'enable',1),
  ('86212541382674247750','2',3060.000,'2018-06-02','2018-06-02 12:54:13',NULL,'enable',1),
  ('86212541419167106446','1',17000.000,'2018-06-02','2018-06-02 12:54:14',NULL,'enable',1),
  ('86216312739699306064','2',2250.000,'2018-06-02','2018-06-02 16:31:27',NULL,'enable',1),
  ('86216312811332501428','1',12500.000,'2018-06-02','2018-06-02 16:31:28',NULL,'enable',1),
  ('86216554313259762506','2',1890.000,'2018-06-02','2018-06-02 16:55:43',NULL,'enable',1),
  ('86216554561474881585','1',10500.000,'2018-06-02','2018-06-02 16:55:45',NULL,'enable',1),
  ('86216555965173663253','2',2340.000,'2018-06-02','2018-06-02 16:55:59',NULL,'enable',1),
  ('862165601451624584','1',13000.000,'2018-06-02','2018-06-02 16:56:00',NULL,'enable',1),
  ('86217382489880988738','2',1080.000,'2018-06-02','2018-06-02 17:38:24',NULL,'enable',1),
  ('86217382547732765246','1',6000.000,'2018-06-02','2018-06-02 17:38:25',NULL,'enable',1),
  ('8621764858032966197','2',2070.000,'2018-06-02','2018-06-02 17:06:48',NULL,'enable',1),
  ('862176497969066356','1',11500.000,'2018-06-02','2018-06-02 17:06:49',NULL,'enable',1),
  ('86517403376918345201','2',2250.000,'2018-06-05','2018-06-05 17:40:33',NULL,'enable',1),
  ('86517403410139664647','1',12500.000,'2018-06-05','2018-06-05 17:40:34',NULL,'enable',1),
  ('86517435290443697821','2',2520.000,'2018-06-05','2018-06-05 17:43:52',NULL,'enable',1),
  ('86517435321390493529','1',14000.000,'2018-06-05','2018-06-05 17:43:53',NULL,'enable',1),
  ('86517454081162765372','2',2430.000,'2018-06-05','2018-06-05 17:45:40',NULL,'enable',1),
  ('86517454125661747233','1',13500.000,'2018-06-05','2018-06-05 17:45:41',NULL,'enable',1),
  ('86519172972063599840','2',1890.000,'2018-06-05','2018-06-05 19:17:29',NULL,'enable',1),
  ('86519173042136135','1',10500.000,'2018-06-05','2018-06-05 19:17:30',NULL,'enable',1),
  ('86600376078691927','2',3150.000,'2018-06-06','2018-06-06 00:00:37',NULL,'enable',1),
  ('866003798289996772','1',17500.000,'2018-06-06','2018-06-06 00:00:37',NULL,'enable',1);
COMMIT;

/* Data for the `t_sous_menu` table  (LIMIT 0,500) */

INSERT INTO `t_sous_menu` (`lg_SOUS_MENU_ID`, `str_VALUE`, `str_DESCRIPTION`, `str_COMPOSANT`, `lg_MENU_ID`, `int_PRIORITY`, `str_URL`, `str_Status`, `P_KEY`) VALUES
  ('1','Utilisateur','Utilisateur','/users/list','1',3,NULL,'enable','P_SM_UTILISATEUR'),
  ('10','Institution','Institution','institutionmanager','4',1,NULL,'disable','P_SM_INSTITUTION'),
  ('11','Journal','Journal','journalmanager','3',1,NULL,'enable','P_SM_REPORT'),
  ('12','Groupe report','Groupe report','groupereportmanager','3',2,NULL,'disable','P_SM_GROUPEREPORT'),
  ('13','Schema carte','Schema carte','schemacartemanager','4',2,NULL,'disable','P_SM_SCHEMACARTE'),
  ('14','Decoupe','Decoupe','decoupemanager','2',7,NULL,'enable','P_SM_DECOUPE'),
  ('15','Skin','Skin','skinmanager','1',6,NULL,'enable','P_SM_SKIN'),
  ('16','Language','Language','languagemanager','2',8,NULL,'enable','P_SM_LANGUAGE'),
  ('17','Client','Client','clientmanager','4',3,NULL,'enable','P_SM_CLIENT'),
  ('18','Preference','Preference','preferencemanager','4',4,NULL,'disable','P_SM_PREFERENCE'),
  ('19','Validation Commande','Validation Commande','commandemanager','6',1,NULL,'enable','P_SM_COMMANDE'),
  ('2','Role','Role','rolemanager','1',4,NULL,'enable','P_SM_ROLE'),
  ('20','Historique','Historique','historiquemanager','6',4,NULL,'enable','P_SM_HISTORIQUE'),
  ('21','Ouverture Caisse Emp','Ouverture Caisse Emp','ouverturecaisseempmanager','7',3,NULL,'enable','P_SM_OUVERTURE_CAISSEMP'),
  ('22','Ouverture Caisse','Ouverture Caisse','ouverturecaissemanger','7',4,NULL,'enable','P_SM_OUVERTURECAISSE'),
  ('23','Traitement Commande','Traitement Commande','traitementcommandemanager','6',2,NULL,'enable','P_SM_TRAITEMENT_COMMANDE'),
  ('24','Sms','Sms','smsmanager','4',5,NULL,'enable','P_SM_SMS'),
  ('25','Email','Email','notification','4',6,NULL,'enable','P_SM_EMAIL'),
  ('26','Etat Stock','Etat Stock','etatstockmanager','8',1,NULL,'enable','P_SM_ETAT_STOCK'),
  ('27','Entree Stock','Entree Stock','entreestockmanager','8',2,NULL,'enable','P_SM_ENTREE_STOCK'),
  ('28','Stock Par Produit','Stock Par Produit','reportdynamiquemanager','3',3,NULL,'enable','P_SM_REPORT_DYNAMIC'),
  ('29','Vente Par Produit','Vente Par Produit','venteproduitmanager','3',4,NULL,'enable','P_SM_VENTE_PRODUIT'),
  ('3','Mon compte','Mon compte','myaccountmanager','1',1,NULL,'enable','P_SM_MON_COMPTE'),
  ('30','Enregistrement Commande','Enregistrement Commande','registerordermanager','6',3,NULL,'enable','P_SM_ENREGISTREMENT_COMMANDE'),
  ('31','Tva','Tva','/type/tva','5',3,NULL,'enable','P_SM_TVA'),
  ('31022161436865340949','Table','Table','tablemanager','5',1,NULL,'enable','P_SM_TABLE'),
  ('31022161723532945140','Produit','Produit','productitemmanager','5',2,NULL,'enable','P_SM_PRODUCT_ITEM'),
  ('31022183454171778942','Situation Caisse','Situation Caisse','caissemanger','7',3,NULL,'enable','P_SM_CAISSE'),
  ('32','Type Depense','Type Depense','/type/depense','5',4,NULL,'enable','P_SM_TYPE_DEPENSE'),
  ('33','Type Recette','Type Recette','/type/recette','5',5,NULL,'enable','P_SM_TYPE_RECETTE'),
  ('34','Compte Client','Compte Client','clientaccountmanager','6',5,NULL,'enable','P_SM_CLIENT_ACCOUNT'),
  ('345','Gestion Caisse','Gestion Caisse','gestcaissemanager','7',5,NULL,'enable','P_SM_GEST_CAISSE'),
  ('35','Journal Recette','Journal Recette','journalrecettemanager','3',5,NULL,'enable','P_SM_JOURNAL_RECETTE'),
  ('36','Type Contenance','Type Contenance','/type/contenance','5',6,NULL,'enable','P_SM_TYPE_CONTENANCE'),
  ('37','Produit Par Contenance','Produit Par Contenance','produitcontenancemanager','5',7,NULL,'enable','P_SM_PRODUIT_CONTENANCE'),
  ('4','Personnalisation','Personnalisation','personalisationmanager','1',2,NULL,'disable','P_SM_PERSONNALISATION'),
  ('5','Deconnexion','Deconnexion','basic-panels3','1',5,NULL,'enable','P_SM_DECONNEXION'),
  ('6','Privilege','Privilege','privilegemanager','1',1,NULL,'enable','P_SM_PRIVILEGE'),
  ('6226124547508072484','Satisfaction','Satisfaction','satisfactionmanager','9',7,NULL,'enable','P_SM_SATISFACTION'),
  ('62261752168629515740','Qcm','Qcm','questqcmmanager','62261745414789249809',1,NULL,'enable','P_SM_QUEST_QCM'),
  ('62261756534447999235','Reponse Qcm','Reponse Qcm','reponseqcmmanager','62261745414789249809',2,NULL,'enable','P_SM_REPONSE_QCM'),
  ('62261815123410666249','Type Qcm','Type Qcm','typequestqcmmanager','62261745414789249809',3,NULL,'enable','P_SM_TYPE_QCM'),
  ('62298503194365978502','Clavier','Clavier','claviersmanager','5',4,NULL,'enable','P_SM_CLAVIER'),
  ('62298545162663913','Fenetres','Fenetres','fenetresmanager','5',5,NULL,'enable','P_SM_FENETRES'),
  ('62298572845638127144','Sous Fenetres','Sous Fenetres','sousfenetresmanager','5',6,NULL,'enable','P_SM_SOUS_FENETRES'),
  ('65461303646363','Message','Message','messagemanager','9',7,NULL,'enable','P_SM_MESSAGE'),
  ('67101752798746392573','Famille','Famille','famillemanager','5',1,NULL,'enable','P_SM_FAMILLE'),
  ('7','Module','Module','modulemanager','2',2,NULL,'enable','P_SM_MODULE'),
  ('72613423826787875537','Commentaire','Commentaire','commentaireManager','5',1,NULL,'enable','P_SM_COMMENTAIRE'),
  ('72614523385370602650','Accompagnement','Accompagnement','accompagnementManager','5',2,NULL,'enable','P_SM_ACCOMPAGNEMENT'),
  ('72711295441573697671','Menu Repas','Menu Repas','menurepasmanager','5',1,NULL,'enable','P_SM_MENU_REPAS'),
  ('7271447189898641039','Etages','Etages','etagemanager','5',1,NULL,'enable','P_SM_ETAGE'),
  ('7271512377795805424','Chambre','Chambre','chambremanager','5',1,NULL,'enable','P_SM_CHAMBRE'),
  ('7271536228134423','Lit','Lit','litmanager','5',1,NULL,'enable','P_SM_LIT'),
  ('728923259332299237','Admision Chambre','Admision Chambre','admissionchambremanager','728921142488452605',1,NULL,'enable','P_SM_ADMISSION_CHAMBRE'),
  ('73141635257679285395','Agent','Agent','agentmanager','1',1,NULL,'enable','P_SM_AGENT'),
  ('73201027891347491798','Liste des commandes','Liste des commandes','commandepisammanager','6',1,NULL,'enable','P_SM_LISTE_COMMANDE'),
  ('73311027362696392619','Parametre','Parametre','parametermanager','5',1,NULL,'enable','P_SM_PARAMETRE'),
  ('73911132728158569766','Services','Services','servicesManager','5',1,NULL,'enable','P_SM_SERVICES'),
  ('8','Menu','Menu','menumanager','1',3,NULL,'enable','P_SM_MENU'),
  ('85231255359574624385','Web Commande','Web Commande','webcommandemanager','6',1,NULL,'enable','P_M_WEB_COMMANDE'),
  ('85291255265772281458','Tournée','Tournée','tourneemanager','6',1,NULL,'enable','P_SM_TOURNEE'),
  ('9','Sous-menu','Sous-menu','sousmenumanager','1',4,NULL,'enable','P_SM_SOUSMENU'),
  ('9999992','Plat','Plat','ciplatmanager','9',3,NULL,'enable','P_SM_CATEGORIE'),
  ('9999994','Type Carte','Type Carte','typecartemanager','9',7,NULL,'enable','P_SM_CARTEMENU'),
  ('9999996','Carte','Carte','cartemanager','9',6,NULL,'enable','P_SM_CARTE'),
  ('9999998','Plan de la salle ','Plan de la salle ','/type/seatinplanmanager','5',1,NULL,'enable','P_SM_SEATINGPLAN'),
  ('9999999','Imprimante','Imprimante','/type/imprimante','5',2,NULL,'enable','P_SM_PRINTER');
COMMIT;

/* Data for the `t_tournee_livraison` table  (LIMIT 0,500) */

INSERT INTO `t_tournee_livraison` (`lg_TOURNEE_LIVRAISON_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`, `ZONNE`, `lg_USER_ID`, `dt_DATE_TOURNEE`, `str_GPS`, `str_LAT`, `str_LONG`, `str_CONTACT`, `str_REF_CODE`, `dt_START_DATE`, `dt_END_DATE`, `int_PERCENT_PROCESS`, `int_TOTAL`, `int_TO_DO`, `dt_LAST_DATE_ACTIVITY`) VALUES
  ('8611657896621027165','','','2018-06-01 16:57:08','2018-06-01 22:18:17','is_Closed','','42150222079569572824',NULL,'5.407866666666666;-3.980693333333334',NULL,NULL,NULL,'861_00002',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86121473354248683027','','','2018-06-01 21:47:33','2018-06-01 21:49:40','is_Closed','','42150222079569572824',NULL,'0;0',NULL,NULL,NULL,'861_00002',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8612149954591135159','','','2018-06-01 21:49:09','2018-06-01 21:50:08','is_Closed','','42150222079569572824',NULL,'5.4074583333333335;-3.9806016666666664',NULL,NULL,NULL,'861_00003',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86121512783039204460','','','2018-06-01 21:51:27','2018-06-01 22:18:10','is_Closed','','42150222079569572824',NULL,'5.407866666666666;-3.980693333333334',NULL,NULL,NULL,'861_00004',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86122191085899755425','','','2018-06-01 22:19:10','2018-06-02 12:03:47','is_Closed','','42150222079569572824',NULL,'5.407933333333333;-3.9806683333333335',NULL,NULL,NULL,'861_00005',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8621216509284272347','','','2018-06-02 12:16:50','2018-06-02 13:04:49','is_Closed','','42150222079569572824',NULL,'5.4079266666666665;-3.9807416666666664',NULL,NULL,NULL,'862_00001',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86213323559533375244','','','2018-06-02 13:32:35','2018-06-02 16:40:53','is_Closed','','42150222079569572824',NULL,'5.4079619;-3.9808678',NULL,NULL,NULL,'862_00004',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8621653254369545730','','','2018-06-02 16:53:25','2018-06-02 16:56:07','is_Closed','','42150222079569572824',NULL,'5.40797873;-3.98088244',NULL,NULL,NULL,'862_00005',NULL,NULL,NULL,NULL,NULL,NULL),
  ('8621657442687598887','','','2018-06-02 16:57:04','2018-06-02 17:06:57','is_Closed','','42150222079569572824',NULL,'5.40797728;-3.9808819',NULL,NULL,NULL,'862_00006',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86217373512299706585','','','2018-06-02 17:37:35','2018-06-05 14:44:03','is_Closed','','42150222079569572824',NULL,'5.4075750000000005;-3.9806266666666668',NULL,NULL,NULL,'862_00007',NULL,NULL,NULL,NULL,NULL,NULL),
  ('86514453355128054213','','','2018-06-05 14:45:33','2018-06-05 14:46:42','is_Closed','','42150222079569572824',NULL,'0;0',NULL,NULL,NULL,'865_00001',NULL,NULL,NULL,NULL,0,NULL),
  ('8651745096496545901','','','2018-06-05 17:45:01','2018-06-05 17:45:58','is_Closed','','42150222079569572824',NULL,'0;0',NULL,NULL,NULL,'865_00008',NULL,NULL,NULL,NULL,0,NULL),
  ('86517464937520722438','','','2018-06-05 17:46:49','2018-06-05 19:17:37','is_Closed','','42150222079569572824',NULL,'0;0',NULL,NULL,NULL,'865_00009',NULL,NULL,NULL,NULL,0,NULL),
  ('86517759344110626','','','2018-06-05 17:07:59','2018-06-05 17:44:00','is_Closed','','42150222079569572824',NULL,'0;0',NULL,NULL,NULL,'865_00007',NULL,NULL,NULL,NULL,0,NULL),
  ('8652218292391913223','','','2018-06-05 22:18:29','2018-06-06 00:00:50','is_Closed','','42150222079569572824',NULL,'0;0',NULL,NULL,NULL,'865_00010',NULL,NULL,NULL,NULL,0,NULL);
COMMIT;

/* Data for the `t_tournee_livraison_order` table  (LIMIT 0,500) */

INSERT INTO `t_tournee_livraison_order` (`lg_TOURNEE_LIVRAISON_ORDER_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`, `lg_TOURNEE_LIVRAISON_ID`, `lg_ORDER_ID`, `dt_DATE_PROCESS`, `str_GPS`) VALUES
  ('86116573737965414822','0,0',NULL,NULL,NULL,'close','8611657896621027165','86116564594378135876','2018-06-01 22:16:04',NULL),
  ('8612151321442143150','0,0',NULL,NULL,NULL,'close','86121512783039204460','861195212695132545','2018-06-01 22:16:51',NULL),
  ('86121513562165804994','0,0',NULL,NULL,NULL,'close','86121512783039204460','86120111213272919766','2018-06-01 22:14:00',NULL),
  ('86122191431840516698','0,0',NULL,NULL,NULL,'close','86122191085899755425','8612016389345463661','2018-06-01 22:19:54',NULL),
  ('86212165466196941516','0,0',NULL,NULL,NULL,'close','8621216509284272347','86119493332162366961','2018-06-02 12:53:38',NULL),
  ('86212165485655103788','0,0',NULL,NULL,NULL,'close','8621216509284272347','8612025302217011405','2018-06-02 12:54:15',NULL),
  ('86213325338561477175','0,0',NULL,NULL,NULL,'close','86213323559533375244','86212311091531806552','2018-06-02 16:31:29',NULL),
  ('86216535616334789420','0,0',NULL,NULL,NULL,'close','8621653254369545730','86118335183155888527','2018-06-02 16:56:01',NULL),
  ('86216535616388426095','0,0',NULL,NULL,NULL,'close','8621653254369545730','8611835446044795379','2018-06-02 16:55:49',NULL),
  ('86216572374448593708',NULL,NULL,NULL,NULL,'enable','8621657442687598887','86216564592328825152',NULL,NULL),
  ('86217373783968614570',NULL,NULL,NULL,NULL,'enable','86217373512299706585','8621736539105397424',NULL,NULL),
  ('86517343352526376820',NULL,NULL,NULL,NULL,'enable','86517759344110626','86517294151396421520',NULL,NULL),
  ('86517343435246102606',NULL,NULL,NULL,NULL,'enable','86517759344110626','86517284252418926631',NULL,NULL),
  ('8651745486742904060',NULL,NULL,NULL,NULL,'enable','8651745096496545901','86517443456938547121',NULL,NULL),
  ('86517522895264145891',NULL,NULL,NULL,NULL,'enable','86517464937520722438','8651752156140127940',NULL,NULL),
  ('8651793658839942971',NULL,NULL,NULL,NULL,'enable','86517759344110626','86515241077722045360',NULL,NULL),
  ('86522185973753615933','0,0',NULL,NULL,NULL,'close','8652218292391913223','86519513955910866643','2018-06-06 00:00:38',NULL);
COMMIT;

/* Data for the `t_user_services` table  (LIMIT 0,500) */

INSERT INTO `t_user_services` (`lg_USER_SERVICES_ID`, `dt_UPDATED`, `str_STATUT`, `dt_CREATED`, `lg_SERVICES_ID`, `lg_USER_ID`) VALUES
  ('73141818261104733334',NULL,NULL,NULL,'73141632556214734431','42150222079569572824'),
  ('7321215110135552861',NULL,NULL,NULL,'73141632556214734431','42101057334294686'),
  ('73212151939480601100',NULL,NULL,NULL,'73141894933598811048','42101057334294686'),
  ('73212151965259798127',NULL,NULL,NULL,'1','42101057334294686'),
  ('73222323479548189306',NULL,NULL,NULL,'7322218194451259694','42101057334294686'),
  ('73222323485934990204',NULL,NULL,NULL,'73222181957681889463','42101057334294686'),
  ('73222324262176336445',NULL,NULL,NULL,'73222181949274424687','42101057334294686'),
  ('73222324269128398583',NULL,NULL,NULL,'73222181964517238496','42101057334294686'),
  ('73222324276951983756',NULL,NULL,NULL,'73222181976090845373','42101057334294686'),
  ('73222324286687184857',NULL,NULL,NULL,'73222181970737693045','42101057334294686'),
  ('73222324294344137240',NULL,NULL,NULL,'7322218198296442550','42101057334294686'),
  ('73222324309962305241',NULL,NULL,NULL,'73222181987650873187','42101057334294686');
COMMIT;

/* Data for the `t_warehouse` table  (LIMIT 0,500) */

INSERT INTO `t_warehouse` (`lg_WAREHOUSE_ID`, `lg_USER_ID`, `lg_PRODUCT_ITEM_ID`, `int_NUMBER`, `dt_CREATED`, `dt_UPDATED`) VALUES
  ('67101754332779511832','31017105229982132919','67101712195787344322',2,'2016-07-10 17:54:33',NULL),
  ('67101754557251205342','31017105229982132919','67101718095018457516',3,'2016-07-10 17:54:55',NULL),
  ('67101755338119657489','31017105229982132919','67101716924942215333',1,'2016-07-10 17:55:33',NULL),
  ('67101755475936263683','31017105229982132919','67101716496016399596',3,'2016-07-10 17:55:47',NULL),
  ('67101756298963722727','31017105229982132919','67101719398774099106',3,'2016-07-10 17:56:29',NULL),
  ('67101756511544299720','31017105229982132919','67101726546457588560',1,'2016-07-10 17:56:51',NULL),
  ('67101756680561212816','31017105229982132919','67101718304891358239',1,'2016-07-10 17:56:06',NULL),
  ('67101757153819556296','31017105229982132919','67101727411547599522',1,'2016-07-10 17:57:15',NULL),
  ('67101757299329964541','31017105229982132919','67101728199597924756',1,'2016-07-10 17:57:29',NULL),
  ('67101757437296533607','31017105229982132919','67101728454512713952',1,'2016-07-10 17:57:43',NULL),
  ('67101758165354708226','31017105229982132919','67101729306058284265',2,'2016-07-10 17:58:16',NULL),
  ('67101758497646140361','31017105229982132919','67101730327784114189',1,'2016-07-10 17:58:49',NULL),
  ('67101759186235086949','31017105229982132919','67101730267233137689',1,'2016-07-10 17:59:18',NULL),
  ('67101816101393989686','31017105229982132919','67101731391388359505',1,'2016-07-10 18:16:10',NULL),
  ('67101818138113210127','31017105229982132919','67101732241137974871',2,'2016-07-10 18:18:13',NULL),
  ('67101818416067798517','31017105229982132919','67101734499725803587',3,'2016-07-10 18:18:41',NULL),
  ('6710181983856886857','31017105229982132919','67101736369346481343',3,'2016-07-10 18:19:08',NULL),
  ('67101826369311269856','31017105229982132919','67101737264269496538',3,'2016-07-10 18:26:36',NULL),
  ('67101827278199474834','31017105229982132919','67101738338564425773',12,'2016-07-10 18:27:27',NULL),
  ('67101827516913699652','31017105229982132919','67101738246840906525',12,'2016-07-10 18:27:05',NULL),
  ('67101827541236236603','31017105229982132919','67101739555877705909',48,'2016-07-10 18:27:54',NULL),
  ('67101828445744016711','31017105229982132919','67101741056812641775',48,'2016-07-10 18:28:44',NULL),
  ('67101829397782501486','31017105229982132919','67101745457702837786',3,'2016-07-10 18:29:39',NULL),
  ('67101853377088168490','31017105229982132919','67101747385094104540',2,'2016-07-10 18:53:37',NULL),
  ('67101853736394212107','31017105229982132919','67101747348925031817',12,'2016-07-10 18:53:07',NULL),
  ('6710185437711159815','31017105229982132919','67101752499793272918',5,'2016-07-10 18:54:03',NULL),
  ('67101855493445702509','31017105229982132919','67101854511005161444',1,'2016-07-10 18:55:04',NULL),
  ('72281316254922818995','31017105229982132919','67101744425645068807',-150000,'2017-02-28 13:16:25','2017-02-28 22:32:46'),
  ('73161423336251595367','31017105229982132919','67101745666588479350',90000,'2017-03-16 14:23:33',NULL),
  ('73161427402156090145','31017105229982132919','67101718095018457516',90000,'2017-03-16 14:27:40',NULL),
  ('7316142793749687418','31017105229982132919','72271155393924813157',90000,'2017-03-16 14:27:09',NULL),
  ('7316142867059452507','31017105229982132919','67101740267499189768',90000,'2017-03-16 14:28:06',NULL),
  ('8323232029779428805','31017105229982132919','67101719398774099106',500,'2018-03-23 23:20:03',NULL),
  ('83232320416341951210','31017105229982132919','67101744425645068807',500000,'2018-03-23 23:20:41',NULL);
COMMIT;

/* Data for the `t_zonne_1` table  (LIMIT 0,500) */

INSERT INTO `t_zonne_1` (`lg_ZONNE_1_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('8524103448672598554','19 Rue du Consulat','19 Rue du Consulat','2018-05-24 10:34:48',NULL,'enable'),
  ('85241035505709899668','L 237','L 237','2018-05-24 10:35:50',NULL,'enable'),
  ('85241418544534332292','AngrÃ©','AngrÃ©','2018-05-24 14:18:54',NULL,'enable'),
  ('85241835548081812211','L 130','L 130','2018-05-24 18:35:54',NULL,'enable'),
  ('85251322854769068242','L 150','L 150','2018-05-25 13:22:08',NULL,'enable'),
  ('86116564687129345995','Dokui Djomi','Dokui Djomi','2018-06-01 16:56:46',NULL,'enable'),
  ('86118335427897592849','Autoroute d''Abobo','Autoroute d''Abobo','2018-06-01 18:33:54',NULL,'enable'),
  ('86212311314614313656','99347035','99347035','2018-06-02 12:31:13',NULL,'enable'),
  ('86217365476897067807','G 2','G 2','2018-06-02 17:36:54',NULL,'enable'),
  ('86517192454580711656','Boulevard des Martyrs','Boulevard des Martyrs','2018-06-05 17:19:24',NULL,'enable'),
  ('8651938856493039300','M 2','M 2','2018-06-05 19:38:08',NULL,'enable');
COMMIT;

/* Data for the `t_zonne_2` table  (LIMIT 0,500) */

INSERT INTO `t_zonne_2` (`lg_ZONNE_2_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('85241034481478463834',' 87000 Limoges',' 87000 Limoges','2018-05-24 10:34:48',NULL,'enable'),
  ('85241035507803368482',' Abidjan',' Abidjan','2018-05-24 10:35:50',NULL,'enable'),
  ('86212311321165134065','Abidjan','Abidjan','2018-06-02 12:31:13',NULL,'enable');
COMMIT;

/* Data for the `t_zonne_3` table  (LIMIT 0,500) */

INSERT INTO `t_zonne_3` (`lg_ZONNE_3_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('85241034482262799602',' France',' France','2018-05-24 10:34:48',NULL,'enable'),
  ('85241035511802627758',' CÃ´te d''Ivoire',' CÃ´te d''Ivoire','2018-05-24 10:35:51',NULL,'enable');
COMMIT;

/* Data for the `t_zonne_4` table  (LIMIT 0,500) */

INSERT INTO `t_zonne_4` (`lg_ZONNE_4_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('85241418547546703592','9999999','9999999','2018-05-24 14:18:54',NULL,'enable'),
  ('85241511269106071778','78905325','78905325','2018-05-24 15:11:26',NULL,'enable'),
  ('85282035868330755089','99347035','99347035','2018-05-28 20:03:58',NULL,'enable');
COMMIT;

/* Data for the `t_zonne_5` table  (LIMIT 0,500) */

INSERT INTO `t_zonne_5` (`lg_ZONNE_5_ID`, `str_NAME`, `str_DESCRIPTION`, `dt_CREATED`, `dt_UPDATED`, `str_STATUT`) VALUES
  ('85241034483719953953','','','2018-05-24 10:34:48',NULL,'enable');
COMMIT;

/* Definition for the `TrgCheckInsert_t_accompagnemement` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_accompagnemement` BEFORE INSERT ON `t_accompagnemement`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_accompagnemement` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_accompagnemement` BEFORE UPDATE ON `t_accompagnemement`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_t_batiment` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_batiment` BEFORE INSERT ON `t_batiment`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_batiment` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_batiment` BEFORE UPDATE ON `t_batiment`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `t_cash_transaction_before_ins_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_cash_transaction_before_ins_tr` BEFORE INSERT ON `t_cash_transaction`
  FOR EACH ROW
BEGIN
 UPDATE t_caisse
        SET t_caisse.dt_UPDATED = NOW(),
            t_caisse.int_SOLDE = t_caisse.int_SOLDE + NEW.int_AMOUNT
        WHERE t_caisse.lg_USER_ID = NEW.lg_USER_ID;
SET NEW.dt_CREATED = NOW();
IF NEW.int_AMOUNT > 0 THEN
SET NEW.int_AMOUNT_CREDIT = NEW.int_AMOUNT ;
ELSE
SET NEW.int_AMOUNT_DEBIT = (-1*NEW.int_AMOUNT) ;
END IF;
END$$

DELIMITER ;

/* Definition for the `t_cash_transaction_before_upd_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_cash_transaction_before_upd_tr` BEFORE UPDATE ON `t_cash_transaction`
  FOR EACH ROW
BEGIN
SET NEW.dt_UPDATED = NOW();
END$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_t_chambre` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_chambre` BEFORE INSERT ON `t_chambre`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_chambre` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_chambre` BEFORE UPDATE ON `t_chambre`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_t_commentaire` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_commentaire` BEFORE INSERT ON `t_commentaire`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_commentaire` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_commentaire` BEFORE UPDATE ON `t_commentaire`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `t_customer_before_ins_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_customer_before_ins_tr` BEFORE INSERT ON `t_customer`
  FOR EACH ROW
BEGIN
    set new.dt_CREATED=now();
END$$

DELIMITER ;

/* Definition for the `t_customer_before_upd_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_customer_before_upd_tr` BEFORE UPDATE ON `t_customer`
  FOR EACH ROW
BEGIN
    set new.dt_UPDATED=now();
END$$

DELIMITER ;

/* Definition for the `t_customer_account_before_ins_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_customer_account_before_ins_tr` BEFORE INSERT ON `t_customer_account`
  FOR EACH ROW
BEGIN
    set new.dt_CREATED = NOW();
END$$

DELIMITER ;

/* Definition for the `t_customer_account_before_upd_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_customer_account_before_upd_tr` BEFORE UPDATE ON `t_customer_account`
  FOR EACH ROW
BEGIN
         set new.dt_UPDATED = NOW();
END$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_t_etage` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_etage` BEFORE INSERT ON `t_etage`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_etage` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_etage` BEFORE UPDATE ON `t_etage`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_event_log` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_event_log` BEFORE INSERT ON `t_event_log`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_event_log` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_event_log` BEFORE UPDATE ON `t_event_log`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_t_jour_semaine` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_jour_semaine` BEFORE INSERT ON `t_jour_semaine`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_jour_semaine` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_jour_semaine` BEFORE UPDATE ON `t_jour_semaine`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_t_lit` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_lit` BEFORE INSERT ON `t_lit`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_lit` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_lit` BEFORE UPDATE ON `t_lit`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_t_lit_occupation` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_lit_occupation` BEFORE INSERT ON `t_lit_occupation`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_lit_occupation` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_lit_occupation` BEFORE UPDATE ON `t_lit_occupation`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_t_lit_occupation_statut` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_lit_occupation_statut` BEFORE INSERT ON `t_lit_occupation_statut`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_lit_occupation_statut` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_lit_occupation_statut` BEFORE UPDATE ON `t_lit_occupation_statut`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_t_menu_repas` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_menu_repas` BEFORE INSERT ON `t_menu_repas`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_menu_repas` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_menu_repas` BEFORE UPDATE ON `t_menu_repas`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_t_menu_repas_product_item` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_menu_repas_product_item` BEFORE INSERT ON `t_menu_repas_product_item`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_menu_repas_product_item` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_menu_repas_product_item` BEFORE UPDATE ON `t_menu_repas_product_item`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `t_mouvement_before_update` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_mouvement_before_update` BEFORE UPDATE ON `t_mouvement`
  FOR EACH ROW
BEGIN

    set new.dt_UPDATED = NOW();

END$$

DELIMITER ;

/* Definition for the `t_mouvementprice_before_insert` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_mouvementprice_before_insert` BEFORE INSERT ON `t_mouvementprice`
  FOR EACH ROW
BEGIN
set NEW.int_ECART = NEW.int_PRICE_NEW - NEW.int_PRICE_OLD;
END$$

DELIMITER ;

/* Definition for the `t_mouvementprice_before_update` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_mouvementprice_before_update` BEFORE UPDATE ON `t_mouvementprice`
  FOR EACH ROW
BEGIN
set NEW.int_ECART = NEW.int_PRICE_NEW - NEW.int_PRICE_OLD;
END$$

DELIMITER ;

/* Definition for the `t_order_customer_account_before_ins_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_order_customer_account_before_ins_tr` BEFORE INSERT ON `t_order_customer_account`
  FOR EACH ROW
BEGIN
        set new.dt_CREATED = NOW();
END$$

DELIMITER ;

/* Definition for the `t_order_customer_account_before_upd_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_order_customer_account_before_upd_tr` BEFORE UPDATE ON `t_order_customer_account`
  FOR EACH ROW
BEGIN
        set new.dt_UPDATED = NOW();
END$$

DELIMITER ;

/* Definition for the `t_product_iem_type_contenance_before_ins_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_product_iem_type_contenance_before_ins_tr` BEFORE INSERT ON `t_product_iem_type_contenance`
  FOR EACH ROW
BEGIN
    set new.dt_CREATED = now() ;
END$$

DELIMITER ;

/* Definition for the `t_product_iem_type_contenance_before_upd_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_product_iem_type_contenance_before_upd_tr` BEFORE UPDATE ON `t_product_iem_type_contenance`
  FOR EACH ROW
BEGIN
    set new.dt_UPDATED = now() ;
END$$

DELIMITER ;

/* Definition for the `t_product_item_accompagnemement_before_ins_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_product_item_accompagnemement_before_ins_tr` BEFORE INSERT ON `t_product_item_accompagnemement`
  FOR EACH ROW
BEGIN
        set new.dt_CREATED=NOW();
END$$

DELIMITER ;

/* Definition for the `t_product_item_accompagnemement_before_upd_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_product_item_accompagnemement_before_upd_tr` BEFORE UPDATE ON `t_product_item_accompagnemement`
  FOR EACH ROW
BEGIN
        set new.dt_UPDATED=NOW();
END$$

DELIMITER ;

/* Definition for the `t_product_item_commentaire_before_ins_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_product_item_commentaire_before_ins_tr` BEFORE INSERT ON `t_product_item_commentaire`
  FOR EACH ROW
BEGIN
        set new.dt_CREATED=NOW();
END$$

DELIMITER ;

/* Definition for the `t_product_item_commentaire_before_upd_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_product_item_commentaire_before_upd_tr` BEFORE UPDATE ON `t_product_item_commentaire`
  FOR EACH ROW
BEGIN
        set new.dt_UPDATED=NOW();
END$$

DELIMITER ;

/* Definition for the `t_product_item_stock_before_ins_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_product_item_stock_before_ins_tr` BEFORE INSERT ON `t_product_item_stock`
  FOR EACH ROW
BEGIN
        set new.dt_CREATED=NOW();
END$$

DELIMITER ;

/* Definition for the `t_product_item_stock_before_upd_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_product_item_stock_before_upd_tr` BEFORE UPDATE ON `t_product_item_stock`
  FOR EACH ROW
BEGIN
        set new.dt_UPDATED=NOW();
END$$

DELIMITER ;

/* Definition for the `t_product_item_type_contenance_stock_before_ins_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_product_item_type_contenance_stock_before_ins_tr` BEFORE INSERT ON `t_product_item_type_contenance_stock`
  FOR EACH ROW
BEGIN
        set new.dt_CREATED=NOW();
END$$

DELIMITER ;

/* Definition for the `t_product_item_type_contenance_stock_before_upd_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_product_item_type_contenance_stock_before_upd_tr` BEFORE UPDATE ON `t_product_item_type_contenance_stock`
  FOR EACH ROW
BEGIN
        set new.dt_UPDATED=NOW();
END$$

DELIMITER ;

/* Definition for the `CheckInsertt_t_sms` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `CheckInsertt_t_sms` BEFORE INSERT ON `t_sms`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `CheckUpdatet_t_sms` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `CheckUpdatet_t_sms` BEFORE UPDATE ON `t_sms`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `CheckInsertt_sms_not_send` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `CheckInsertt_sms_not_send` BEFORE INSERT ON `t_sms_not_send`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `CheckUpdatet_t_sms_not_send` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `CheckUpdatet_t_sms_not_send` BEFORE UPDATE ON `t_sms_not_send`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `t_snap_shop_daly_recette_before_ins_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_snap_shop_daly_recette_before_ins_tr` BEFORE INSERT ON `t_snap_shop_daly_recette`
  FOR EACH ROW
BEGIN
    set new.dt_CREATED = NOW();
END$$

DELIMITER ;

/* Definition for the `t_snap_shop_daly_recette_before_upd_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_snap_shop_daly_recette_before_upd_tr` BEFORE UPDATE ON `t_snap_shop_daly_recette`
  FOR EACH ROW
BEGIN
          set new.dt_UPDATED = NOW();
END$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_t_tournee_livraison` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_tournee_livraison` BEFORE INSERT ON `t_tournee_livraison`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_t_tournee_livraison_order` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_tournee_livraison_order` BEFORE INSERT ON `t_tournee_livraison`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_tournee_livraison` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_tournee_livraison` BEFORE UPDATE ON `t_tournee_livraison`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_tournee_livraison_order` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_tournee_livraison_order` BEFORE UPDATE ON `t_tournee_livraison`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `t_type_contenance_before_ins_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_type_contenance_before_ins_tr` BEFORE INSERT ON `t_type_contenance`
  FOR EACH ROW
BEGIN
    set new.dt_CREATED = now() ;
END$$

DELIMITER ;

/* Definition for the `t_type_contenance_before_upd_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_type_contenance_before_upd_tr` BEFORE UPDATE ON `t_type_contenance`
  FOR EACH ROW
BEGIN

    set new.dt_UPDATED = now() ;
END$$

DELIMITER ;

/* Definition for the `t_warehouse_before_ins_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_warehouse_before_ins_tr` BEFORE INSERT ON `t_warehouse`
  FOR EACH ROW
BEGIN
declare nb_result INTEGER(10) default 0;  
SELECT COUNT(*) FROM t_product_item_stock 
where  t_product_item_stock.lg_PRODUCT_ITEM_ID = NEW.lg_PRODUCT_ITEM_ID
INTO nb_result ;
 set new.dt_CREATED = NOW();
 IF nb_result > 0 THEN
 UPDATE t_product_item_stock
        SET t_product_item_stock.dt_UPDATED = NOW(),
            t_product_item_stock.int_NUMBER = t_product_item_stock.int_NUMBER + NEW.int_NUMBER,
            t_product_item_stock.int_NUMBER_AVAILABLE = t_product_item_stock.int_NUMBER_AVAILABLE + NEW.int_NUMBER
        WHERE t_product_item_stock.lg_PRODUCT_ITEM_ID = NEW.lg_PRODUCT_ITEM_ID;
ELSE
INSERT INTO t_product_item_stock ( `lg_PRODUCT_ITEM_STOCK_ID`,`lg_PRODUCT_ITEM_ID`,`int_NUMBER`,`int_NUMBER_AVAILABLE`) VALUES( NEW.lg_WAREHOUSE_ID,NEW.lg_PRODUCT_ITEM_ID,NEW.int_NUMBER,NEW.int_NUMBER)  ;      
END IF;
END$$

DELIMITER ;

/* Definition for the `t_warehouse_before_upd_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_warehouse_before_upd_tr` BEFORE UPDATE ON `t_warehouse`
  FOR EACH ROW
BEGIN
          set new.dt_UPDATED = NOW();
END$$

DELIMITER ;

/* Definition for the `t_warehouse_contenance_before_ins_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_warehouse_contenance_before_ins_tr` BEFORE INSERT ON `t_warehouse_contenance`
  FOR EACH ROW
BEGIN
declare nb_result INTEGER(10) default 0;  
SELECT COUNT(*) FROM t_product_item_type_contenance_stock 
where  t_product_item_type_contenance_stock.lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID = NEW.lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID
INTO nb_result ;
 set new.dt_CREATED = NOW();
 IF nb_result > 0 THEN
 UPDATE t_product_item_type_contenance_stock
        SET t_product_item_type_contenance_stock.dt_UPDATED = NOW(),
            t_product_item_type_contenance_stock.int_NUMBER = t_product_item_type_contenance_stock.int_NUMBER + NEW.int_NUMBER,
            t_product_item_type_contenance_stock.int_NUMBER_AVAILABLE = t_product_item_type_contenance_stock.int_NUMBER_AVAILABLE + NEW.int_NUMBER
        WHERE t_product_item_type_contenance_stock.lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID = NEW.lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID;
ELSE
INSERT INTO t_product_item_type_contenance_stock ( `lg_PRODUCT_ITEM_TYPE_CONTENANCE_STOCK_ID`,`lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID`,`int_NUMBER`,`int_NUMBER_AVAILABLE`) VALUES( NEW.lg_WAREHOUSE_CONTENANCE_ID,NEW.lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID,NEW.int_NUMBER,NEW.int_NUMBER)  ;      
END IF;
END$$

DELIMITER ;

/* Definition for the `t_warehouse_contenance_before_upd_tr` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `t_warehouse_contenance_before_upd_tr` BEFORE UPDATE ON `t_warehouse_contenance`
  FOR EACH ROW
BEGIN
          set new.dt_UPDATED = NOW();
END$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_t_zonne_1` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_zonne_1` BEFORE INSERT ON `t_zonne_1`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_zonne_1` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_zonne_1` BEFORE UPDATE ON `t_zonne_1`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_t_zonne_2` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_zonne_2` BEFORE INSERT ON `t_zonne_2`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_zonne_2` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_zonne_2` BEFORE UPDATE ON `t_zonne_2`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_t_zonne_3` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_zonne_3` BEFORE INSERT ON `t_zonne_3`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_zonne_3` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_zonne_3` BEFORE UPDATE ON `t_zonne_3`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_t_zonne_4` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_zonne_4` BEFORE INSERT ON `t_zonne_4`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_zonne_4` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_zonne_4` BEFORE UPDATE ON `t_zonne_4`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_t_zonne_5` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_zonne_5` BEFORE INSERT ON `t_zonne_5`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_zonne_5` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_zonne_5` BEFORE UPDATE ON `t_zonne_5`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_t_zonne_6` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_zonne_6` BEFORE INSERT ON `t_zonne_6`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_zonne_6` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_zonne_6` BEFORE UPDATE ON `t_zonne_6`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckInsert_t_zonne_7` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckInsert_t_zonne_7` BEFORE INSERT ON `t_zonne_7`
  FOR EACH ROW
SET NEW.dt_CREATED = NOW()$$

DELIMITER ;

/* Definition for the `TrgCheckUpdate_t_zonne_7` trigger : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `TrgCheckUpdate_t_zonne_7` BEFORE UPDATE ON `t_zonne_7`
  FOR EACH ROW
SET NEW.dt_UPDATED = NOW()$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;