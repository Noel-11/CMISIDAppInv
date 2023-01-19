-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.21 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_appinvi
CREATE DATABASE IF NOT EXISTS `db_appinvi` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_appinvi`;

-- Dumping structure for table db_appinvi.tbl_application
CREATE TABLE IF NOT EXISTS `tbl_application` (
  `application_id` varchar(50) NOT NULL,
  `client_id` varchar(50) DEFAULT NULL,
  `application_name` varchar(100) DEFAULT NULL,
  `application_details` varchar(200) DEFAULT NULL,
  `application_url` varchar(200) DEFAULT NULL,
  `application_start_date` date DEFAULT NULL,
  `application_deployment_date` date DEFAULT NULL,
  `application_version` varchar(50) DEFAULT NULL,
  `application_status` varchar(50) DEFAULT NULL,
  `contact_person` varchar(50) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `contact_email_address` varchar(50) DEFAULT NULL,
  `is_active` varchar(50) DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `create_date` varchar(50) DEFAULT NULL,
  `last_user` varchar(50) DEFAULT NULL,
  `last_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`application_id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_appinvi.tbl_application: ~0 rows (approximately)
INSERT IGNORE INTO `tbl_application` (`application_id`, `client_id`, `application_name`, `application_details`, `application_url`, `application_start_date`, `application_deployment_date`, `application_version`, `application_status`, `contact_person`, `contact_number`, `contact_email_address`, `is_active`, `create_user`, `create_date`, `last_user`, `last_date`) VALUES
	('1', '01182023400418AA6BFC275AEE4A979B1C64525', 'test', 'test', 'test', '2023-01-19', '2023-01-19', '1', 'DONE', 'test', 'test', 'test', 'Y', NULL, NULL, NULL, NULL);

-- Dumping structure for table db_appinvi.tbl_application_assigned_personnel
CREATE TABLE IF NOT EXISTS `tbl_application_assigned_personnel` (
  `application_assisgned_personnel_id` varchar(50) NOT NULL,
  `application_version_id` varchar(50) DEFAULT NULL,
  `personnel_id` varchar(50) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT 'Y',
  `create_date` varchar(50) DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `last_date` varchar(50) DEFAULT NULL,
  `last_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`application_assisgned_personnel_id`),
  KEY `application_version_id` (`application_version_id`),
  KEY `personnel_id` (`personnel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_appinvi.tbl_application_assigned_personnel: ~0 rows (approximately)
INSERT IGNORE INTO `tbl_application_assigned_personnel` (`application_assisgned_personnel_id`, `application_version_id`, `personnel_id`, `is_active`, `create_date`, `create_user`, `last_date`, `last_user`) VALUES
	('1', '1', '01192023481002A7D50071A1EC42F29F2AC89A2', 'Y', NULL, NULL, NULL, NULL),
	('2', '1', '01192023491032522606F939FB4569927499476', 'Y', NULL, NULL, NULL, NULL);

-- Dumping structure for table db_appinvi.tbl_application_version
CREATE TABLE IF NOT EXISTS `tbl_application_version` (
  `application_version_id` varchar(50) NOT NULL,
  `application_id` varchar(50) DEFAULT NULL,
  `application_version_start_date` date DEFAULT NULL,
  `application_version_end_date` date DEFAULT NULL,
  `application_features` varchar(1000) DEFAULT NULL,
  `deployment_letter_url` varchar(200) DEFAULT NULL,
  `system_analysis_design_url` varchar(200) DEFAULT NULL,
  `deployment_agreement_url` varchar(200) DEFAULT NULL,
  `version_no` varchar(10) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT 'Y',
  `create_user` varchar(50) DEFAULT NULL,
  `create_date` varchar(50) DEFAULT NULL,
  `last_user` varchar(50) DEFAULT NULL,
  `last_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`application_version_id`),
  KEY `application_id` (`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_appinvi.tbl_application_version: ~0 rows (approximately)
INSERT IGNORE INTO `tbl_application_version` (`application_version_id`, `application_id`, `application_version_start_date`, `application_version_end_date`, `application_features`, `deployment_letter_url`, `system_analysis_design_url`, `deployment_agreement_url`, `version_no`, `is_active`, `create_user`, `create_date`, `last_user`, `last_date`) VALUES
	('1', '1', '2023-01-19', '2023-01-19', 'test', 'test', 'test', 'test', '1', 'Y', NULL, NULL, NULL, NULL);

-- Dumping structure for table db_appinvi.tbl_cms_menu
CREATE TABLE IF NOT EXISTS `tbl_cms_menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `menu_name` varchar(100) DEFAULT NULL,
  `page_url` varchar(200) DEFAULT NULL,
  `menu_level` tinyint unsigned DEFAULT NULL,
  `sort_order` tinyint unsigned DEFAULT NULL,
  `is_public` varchar(1) NOT NULL,
  `is_active` varchar(1) NOT NULL,
  `system_module` tinyint unsigned DEFAULT NULL,
  `last_user` varchar(30) DEFAULT NULL,
  `last_date` varchar(30) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- Dumping data for table db_appinvi.tbl_cms_menu: ~23 rows (approximately)
INSERT IGNORE INTO `tbl_cms_menu` (`menu_id`, `parent_id`, `menu_name`, `page_url`, `menu_level`, `sort_order`, `is_public`, `is_active`, `system_module`, `last_user`, `last_date`, `module`) VALUES
	(1, 0, 'Administration', '', 1, 99, 'N', 'Y', 1, 'System Administrator', '09/16/2020 4:20:21 PM', 'CMISID'),
	(2, 1, 'User Account', '~/Secured/SystemAdministration/UserEntry.aspx', 2, 1, 'N', 'Y', 1, 'AUTO', '4/17/2014 10:29:54 AM', NULL),
	(3, 1, 'User Role', '~/Secured/SystemAdministration/UserRole.aspx', 2, 2, 'N', 'N', 1, 'System Administrator', '01/18/2023 4:43:03 PM', NULL),
	(4, 1, 'User Permission', '~/Secured/SystemAdministration/UserPermission.aspx', 2, 3, 'N', 'Y', 1, 'AUTO', '4/17/2014 10:29:54 AM', NULL),
	(5, 1, 'Role Permission', '~/Secured/SystemAdministration/RolePermission.aspx', 2, 4, 'N', 'N', 1, 'System Administrator', '01/18/2023 4:43:34 PM', NULL),
	(6, 1, 'CMS', '~/Secured/SystemAdministration/cmsMenu.aspx', 2, 5, 'N', 'Y', 1, 'AUTO', '4/17/2014 10:29:54 AM', NULL),
	(7, 1, 'Employee Upload', '~/Secured/SystemAdministration/UploadEmployeeInformation.aspx', 2, 6, 'N', 'N', 1, 'System Administrator', '25/01/2018 10:30:40 AM', NULL),
	(34, 1, 'Encrypt String', '~/Secured/SystemAdministration/EncryptString.aspx', 2, 99, 'N', 'N', 1, 'System Administrator', '25/01/2018 10:30:47 AM', NULL),
	(54, 1, 'System Users', '~/Secured/SystemAdministration/SystemUsers.aspx', 2, 7, 'N', 'N', NULL, 'System Administrator', '01/18/2023 4:42:49 PM', NULL),
	(64, 0, 'User Account', '', 1, 5, 'N', 'N', NULL, 'System Administrator', '01/19/2023 10:05:50 AM', 'CMISID'),
	(65, 64, 'User Entry', '~/Secured/UserAdmin/adminUserEntry.aspx', 2, 1, 'N', 'Y', NULL, 'System Administrator', '10/06/2021 1:55:42 PM', NULL),
	(66, 64, 'User Permission', '~/Secured/UserAdmin/adminUserPermission.aspx', 2, 2, 'N', 'Y', NULL, 'System Administrator', '10/06/2021 2:00:33 PM', NULL),
	(83, 0, 'Reference', '', 1, 3, 'N', 'Y', NULL, 'System Administrator', '12/7/2022 5:09:20 PM', 'CMISID'),
	(84, 83, 'Set Signatory', '~/Secured/Reference/RefSetSignatories.aspx', 2, 1, 'N', 'N', NULL, 'System Administrator', '01/18/2023 2:02:20 PM', NULL),
	(93, 0, 'Application', '', 1, 1, 'N', 'Y', NULL, 'System Administrator', '01/12/2023 10:21:59 AM', 'CMISID'),
	(94, 93, 'New Application', '~/Secured/AppInventory/NewApplication.aspx', 2, 1, 'N', 'Y', NULL, 'System Administrator', '01/12/2023 3:46:14 PM', NULL),
	(95, 0, 'Reports', '', 1, 3, 'N', 'Y', NULL, 'System Administrator', '01/19/2023 1:42:02 PM', 'CMISID'),
	(97, 93, 'App Inventory', '~/Secured/AppInventory/AppInventory.aspx', 2, 2, 'N', 'Y', NULL, 'System Administrator', '01/12/2023 3:56:26 PM', NULL),
	(98, 83, 'Division', '~/Secured/Reference/refDivision.aspx', 2, 1, 'N', 'Y', NULL, 'System Administrator', '01/18/2023 2:07:41 PM', NULL),
	(99, 83, 'Clients', '~/Secured/Reference/refClients.aspx', 2, 2, 'N', 'Y', NULL, 'System Administrator', '01/18/2023 4:07:15 PM', NULL),
	(100, 83, 'User Roles', '~/Secured/Reference/refUserRoles.aspx', 2, 4, 'N', 'Y', NULL, 'System Administrator', '01/19/2023 10:19:17 AM', NULL),
	(101, 83, 'Personnel', '~/Secured/Reference/refPersonnel.aspx', 2, 3, 'N', 'Y', NULL, 'System Administrator', '01/19/2023 10:19:33 AM', NULL),
	(102, 95, 'Application', '~/Secured/Reports/rptReports.aspx', 2, 1, 'N', 'Y', NULL, 'System Administrator', '01/19/2023 3:40:40 PM', NULL);

-- Dumping structure for table db_appinvi.tbl_login_log
CREATE TABLE IF NOT EXISTS `tbl_login_log` (
  `trans_id` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `login_ip` varchar(50) DEFAULT NULL,
  `login_datetime` datetime DEFAULT NULL,
  `login_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_appinvi.tbl_login_log: ~0 rows (approximately)
INSERT IGNORE INTO `tbl_login_log` (`trans_id`, `user_id`, `login_ip`, `login_datetime`, `login_status`) VALUES
	('0110202301125047FCEBA9213B418FA32D4CBC7', 'admin', '::1', '2023-01-10 12:01:50', 'SUCCESS');

-- Dumping structure for table db_appinvi.tbl_ref_clients
CREATE TABLE IF NOT EXISTS `tbl_ref_clients` (
  `client_id` varchar(50) NOT NULL,
  `client_name` varchar(50) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT 'Y',
  `create_user` varchar(50) DEFAULT NULL,
  `create_date` varchar(50) DEFAULT NULL,
  `last_user` varchar(50) DEFAULT NULL,
  `last_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_appinvi.tbl_ref_clients: ~1 rows (approximately)
INSERT IGNORE INTO `tbl_ref_clients` (`client_id`, `client_name`, `is_active`, `create_user`, `create_date`, `last_user`, `last_date`) VALUES
	('01182023400418AA6BFC275AEE4A979B1C64525', 'CLIENT NAME1', 'Y', 'System Administrator', '01/18/2023 4:40:18 PM', 'System Administrator', '01/18/2023 4:40:25 PM');

-- Dumping structure for table db_appinvi.tbl_ref_division
CREATE TABLE IF NOT EXISTS `tbl_ref_division` (
  `division_id` varchar(50) NOT NULL,
  `division_name` varchar(50) DEFAULT NULL,
  `abbreviation` varchar(50) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT 'Y',
  `create_user` varchar(50) DEFAULT NULL,
  `create_date` varchar(50) DEFAULT NULL,
  `last_user` varchar(50) DEFAULT NULL,
  `last_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`division_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_appinvi.tbl_ref_division: ~3 rows (approximately)
INSERT IGNORE INTO `tbl_ref_division` (`division_id`, `division_name`, `abbreviation`, `is_active`, `create_user`, `create_date`, `last_user`, `last_date`) VALUES
	('01182023330310FA3538B2EFD74D91A42CAAE39', 'TEST', 'TEST', 'Y', 'System Administrator', '01/18/2023 3:33:10 PM', 'System Administrator', '01/18/2023 3:36:41 PM'),
	('01182023370306F457FB8EED8943F4B70FE4626', '1231', '123', 'Y', 'System Administrator', '01/18/2023 3:37:06 PM', 'System Administrator', '01/18/2023 3:37:40 PM'),
	('011820235203220B3E4E8105BF4DBD9071D9294', 'TEST3', 'TEST3', 'Y', 'System Administrator', '01/18/2023 3:52:22 PM', NULL, NULL);

-- Dumping structure for table db_appinvi.tbl_ref_personnels
CREATE TABLE IF NOT EXISTS `tbl_ref_personnels` (
  `personnel_id` varchar(50) NOT NULL,
  `personnel_name` varchar(50) DEFAULT NULL,
  `personnel_details` varchar(50) DEFAULT NULL,
  `personnel_role_id` varchar(50) DEFAULT NULL,
  `division_id` varchar(50) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT 'Y',
  `create_user` varchar(50) DEFAULT NULL,
  `create_date` varchar(50) DEFAULT NULL,
  `last_user` varchar(50) DEFAULT NULL,
  `last_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`personnel_id`),
  KEY `personnel_role_id` (`personnel_role_id`),
  KEY `division_id` (`division_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_appinvi.tbl_ref_personnels: ~0 rows (approximately)
INSERT IGNORE INTO `tbl_ref_personnels` (`personnel_id`, `personnel_name`, `personnel_details`, `personnel_role_id`, `division_id`, `is_active`, `create_user`, `create_date`, `last_user`, `last_date`) VALUES
	('01192023481002A7D50071A1EC42F29F2AC89A2', 'swoOshh', 'bongkiEe', 'DEVELOPER', '01182023330310FA3538B2EFD74D91A42CAAE39', 'Y', 'System Administrator', '01/19/2023 10:48:02 AM', 'System Administrator', '01/19/2023 10:50:00 AM'),
	('01192023491032522606F939FB4569927499476', 'oshswo', 'pongkiEbaabeee', 'PROJECT MANAGER', '01182023330310FA3538B2EFD74D91A42CAAE39', 'Y', 'System Administrator', '01/19/2023 10:49:32 AM', 'System Administrator', '01/19/2023 10:49:44 AM');

-- Dumping structure for table db_appinvi.tbl_signatories
CREATE TABLE IF NOT EXISTS `tbl_signatories` (
  `trans_id` varchar(50) NOT NULL,
  `form_type` varchar(50) DEFAULT NULL,
  `signature_type` varchar(50) DEFAULT NULL,
  `signatory_name` varchar(50) DEFAULT NULL,
  `signatory_position` varchar(500) DEFAULT NULL,
  `sig_specimen` longblob,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_appinvi.tbl_signatories: ~8 rows (approximately)
INSERT IGNORE INTO `tbl_signatories` (`trans_id`, `form_type`, `signature_type`, `signatory_name`, `signatory_position`, `sig_specimen`) VALUES
	('1', 'TRAFFIC VIOLATION', 'APPROVED BY', 'HON. ROLANDO "KLAREX" UY', 'CITY MAYOR', NULL),
	('2', 'TRAFFIC VIOLATION', 'BY AUTHORITY', 'ATTY. KENNETH O. TAMALA, MBA', 'City Legal Officer', NULL),
	('3', 'BUSINESS TAX', 'APPROVED BY', 'HON. ROLANDO "KLAREX" UY', 'CITY MAYOR', NULL),
	('4', 'BUSINESS TAX', 'BY AUTHORITY', 'ATTY. KENNETH O. TAMALA, MBA', 'City Legal Officer', NULL),
	('5', 'REAL PROPERTY', 'APPROVED BY', 'HON. ROLANDO "KLAREX" UY', 'CITY MAYOR', NULL),
	('6', 'REAL PROPERTY', 'BY AUTHORITY', 'ATTY. KENNETH O. TAMALA, MBA', 'City Legal Officer', NULL),
	('7', 'STALL HOLDER', 'APPROVED BY', 'HON. ROLANDO "KLAREX" UY', 'CITY MAYOR', NULL),
	('8', 'STALL HOLDER', 'BY AUTHORITY', 'ATTY. KENNETH O. TAMALA, MBA', 'City Legal Officer', NULL);

-- Dumping structure for table db_appinvi.tbl_system_default
CREATE TABLE IF NOT EXISTS `tbl_system_default` (
  `default_desc` varchar(50) DEFAULT NULL,
  `default_value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_appinvi.tbl_system_default: ~6 rows (approximately)
INSERT IGNORE INTO `tbl_system_default` (`default_desc`, `default_value`) VALUES
	('default password', 'tl9UUtoyQm2uzSorsCfAEg=e0ea150034825421a'),
	('notify_sms', 'N'),
	('consent_desc1', '&nbsp;I, hereby explicitly and unambiguously consent to the collection, use and transfer, in electronic or other form, of my personal data for the purpose of processing my SoloParent ID Application.'),
	('consent_desc', 'By submitting the data required in this Online Burial Booking, You CONSENT to the collection, generation, use, processing, storage and retention of your personal information and sensitive personal information by the CLENRO for the purpose(s) described in this document. PLEASE ensure that you have completely read and understood \r\n<a onmouseover= "document.getElementById(\'lbDPTerms\').click();">the terms</a> above before submitting. You also authorized the Office to disclose your information to accredited or non-accredited parties.'),
	('dpn', '<p><strong>BACKGROUND</strong></p>\r\n<p>The Republic Act No. 10173 also known as the Data Privacy Act of 2012 which requires the government and the private sector to follow and comply to fulfill their objective to protect personal data in information and communications systems.</p>\r\n<p>With this, it ensures that entities of the City Government of Cagayan de Oro to implement measures and procedures that guarantee the safety and security of personal data under their control or custody and thereby upholding an individual&rsquo;s data privacy rights; this also applies the principles of Transparency, Legitimate Purpose, and Proportionality in processing of the personal data submitted and stored in the information and communication system.</p>\r\n<p>This Manual serves as a guide or handbook for ensuring the compliance and the City Government with the Data Privacy Act and its Implementing Rules and Regulations (IRR). This also encapsulates the privacy and data protection protocols that is being observed and is being carried out within this entity for specific circumstances (e.g., from collection to destruction), directed toward the fulfillment and realization of the rights of data subjects.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>INTRODUCTION</strong></p>\r\n<p>We, the City Government of Cagayan de Oro respects and values your data privacy rights. It is our duty to give you assurance and confidence to notify you on the submitted with data most specifically your given personal information on how it is being collected, processed, and kept. This is also to inform you on your rights in accordance of the laws and regulations stated and specified in the Republic Act No. 10173 which is also known as the &ldquo;Data Privacy Act of 2012 (DPA)&rdquo;.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><strong>DEFINITION OF TERMS</strong></p>\r\n<ul>\r\n<li><u>Data Privacy Act</u> &ndash; refers to the Republic Act No. 10173 or the Data Privacy Act of 2012 and its implementing rules and regulations (insert url:<u><a href="https://www.privacy.gov.ph/implementing-rules-regulations-data-privacy-act-2012/">https://www.privacy.gov.ph/implementing-rules-regulations-data-privacy-act-2012/</a></u>).</li>\r\n</ul>\r\n<ul>\r\n<li><u>Processing</u> &ndash; refers to any operation or set of operations performed upon personal data including, but not limited to, the collection, recording, organization, storage, updating or modification, retrieval, consultation, use, consolidation, blocking, erasure or destruction of data. Processing may be performed through automated means, or manual processing, if the personal data are contained or are intended to be contained in a filing system;</li>\r\n<li><u>Personal data</u> &ndash; collectively refers to personal information, sensitive personal information, and privileged information;</li>\r\n<li><u>Personal Information</u> &ndash; refers to any information, whether recorded in a material form or not, from which the identity of an individual is apparent or can be reasonably and directly ascertained by the entity holding the information, or when put together with other information would directly and certainly identify an individual;</li>\r\n<li><u>Sensitive Personal Information</u> &ndash; refers to personal data:\r\n<ul>\r\n<li>About an individual&rsquo;s race, ethnic origin, marital status, age, color, and religious, philosophical or political affiliations;</li>\r\n<li>About an individual&rsquo;s health, education, genetic or sexual life of a person, or to any proceeding for any offense committed or alleged to have been committed by such individual, the disposal of such proceedings, or the sentence of any court in such proceedings;</li>\r\n</ul>\r\n</li>\r\n<li><u>Privileged information</u> &ndash; refers to any and all forms of personal data, which, under the Rules of Court and other pertinent laws constitute privileged communication;</li>\r\n<li><u>Data Subject / Clients</u> &ndash; refers to an individual whose personal, sensitive personal, or privileged information is processed; who gives consent to the processors to process the stated data; [<em>Include specific Data Subjects depending on the IS</em>]</li>\r\n<li><u>Information System </u>&ndash; an application or an online application that tools the automation process of personal data with the assigned processor; contains the data privacy consent of the client for the Solo Parent Online Registration;</li>\r\n<li><u>Processing office </u>&ndash; City Social Welfare Development Department given the authority to process the personal, sensitive personal, or privileged information;</li>\r\n<li><u>Processor </u>&ndash; Staff, personnel, processing office, City Government of Cagayan de Oro employee or individual who processes the personal data using the information system with utmost confidentiality, integrity and authenticity;</li>\r\n<li><u>National Privacy Commission (NPC)</u> &ndash; refers as the forefront of not only implementing but complying with the Data Privacy Act of 2012;</li>\r\n<li><u>Data Protection Officer </u>&ndash; Any natural or juridical person or other body involved in the processing of personal data or otherwise be accountable for ensuring compliance with applicable laws and regulations for the protection of data privacy and security.</li>\r\n<li><u>Third Party Sharing and Processing</u> &ndash; Information as well as Personal information of the Data Subjects is being shared and processed outside the entity, subject to cross-border arrangement and cooperation.</li>\r\n<li><u>Data Sharing Agreement</u> &ndash; Needed when third party sharing and processing of data is being made for the relevant process or use of the data of the data subjects.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p><strong>SCOPE AND LIMITATIONS</strong></p>\r\n<p>All personnel of the City Government of Cagayan de Oro especially the office processing the data, regardless of the type of employment or contractual arrangement, must comply with the terms set out in this Data Privacy Manual. This Data Privacy Manual is publicly posted for the information and transparency of the data being processed through the information systems with the data processors identified in the next section of this manual.</p>\r\n<p>[<em>Can also include here the purpose of the IS on highlighting the scope of the data being processed within the IS</em>]</p>\r\n<p>&nbsp;</p>\r\n<p><strong>PROCESSING OF PERSONAL DATA: WHAT WE PROCESS, HOW WE PROCESS, WHO WILL PROCESS, WHY WE PROCESS</strong></p>\r\n<ol>\r\n<li><u>Collection (What Information Do We Collect)</u>:</li>\r\n</ol>\r\n<p>The processing office with the processor collects the information required in the<strong> Online Burial Booking</strong>. The information provided and submitted by the clients, including their [<em>full name, address, email address, contact number, birthday and other personal data</em> <em>together with their attached documents and the kind of request or process selected</em>]. The information system stores the personal data in the database system assigned for this information system respectively and is being protected through the security protocol set out by the server where the database system is located to give assurance that the data will be protected and secured.</p>\r\n<ol>\r\n<li><u>Use (How We Process Your Information)</u>:</li>\r\n</ol>\r\n<p>Personal data collected shall be used accordingly base on the data subject&rsquo;s request as well as for the processing office and the City Government records which is as follows:</p>\r\n<ol>\r\n<li>Data Subject&rsquo; request:\r\n<ol>\r\n<li>Processing for the service availed</li>\r\n<li>Third Party Processing [<em>if there&rsquo;s any</em>]</li>\r\n</ol>\r\n</li>\r\n<li>Profiling: [<em>fill in</em>]</li>\r\n<li>Research: [<em>fill in</em>]</li>\r\n<li>Others: [<em>fill in</em>]</li>\r\n</ol>\r\n<p>&nbsp;</p>\r\n<ol>\r\n<li><u>Storage, Retention and Destruction</u></li>\r\n</ol>\r\n<p>The processor as well as the information system will ensure that personal data under its custody are protected against any other unlawful processing (misused, modified, interfered, lost or disclosed to unauthorized processors without the Data Sharing Agreement).</p>\r\n<p>The implementation and the management of the information system shall have security practices and processes such as but not limited to the following:</p>\r\n<ul>\r\n<li>Document storage security policies;</li>\r\n<li>Security measures to control access to our systems and premises;</li>\r\n<li>Limitations on access to personal data;</li>\r\n<li>Strict selection of third-party data processors and partners; and</li>\r\n<li>Electronic security systems, such as firewalls, data encryption and transmission of data through a secured file transfer protocol.</li>\r\n</ul>\r\n<p>The personal data shall be kept and maintained up to a certain period or as long as necessary for the purpose for which they were collected or as required by laws and regulations.</p>\r\n<p>[<em>Add retention period here.]</em></p>\r\n<ol>\r\n<li><u>Access</u></li>\r\n</ol>\r\n<p>Due to the sensitive and confidential nature of the personal data under the custody of the City Government, only the client/data subject and the authorized processor shall be allowed to access such personal data, for any purpose, except for those contrary to law, public policy, public order or morals. The authorized processor of this information system are as follows:</p>\r\n<ol>\r\n<li>Processing office: Process your request [<em>please edit if necessary</em>]</li>\r\n<li>City Management Information System Office: ICT system in-charge for the City Government. Data accessibility of this office is only limited to the structure of the database for the development purposes only. This shared accessibility is being protected by a data sharing agreement between the processing office and the developer-CMISO.</li>\r\n<li>Third Party Offices: [<em>if there&rsquo;s any, please enumerate</em>]</li>\r\n</ol>\r\n<p>&nbsp;</p>\r\n<ol>\r\n<li><u>Disclosure and Sharing</u></li>\r\n</ol>\r\n<p>All processors shall maintain the confidentiality and secrecy of all personal data that come to their knowledge and possession, even after resignation, termination of contract, or other contractual relations. Personal data under the custody of the City Government shall be disclosed only pursuant to a lawful purpose, and to authorized recipients of such data.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>SECURITY MEASURED: HOW WE PROTECT YOUR DATA</strong></p>\r\n<p>The Data Privacy of the City Government is being managed by the registered Data Protection Officer, Atty. Reymond Q. Villablanca (currently the Asst. City Legal Officer). The Data Protection Officer who is being assisted by the Compliance Officer for Privacy of each City Government Offices/Department, shall oversee the compliance of the organization with the DPA, its IRR, and other related policies, including the conduct of a Privacy Impact Assessment, implementation of security measures, security incident and data breach protocol, and the inquiry and complaints procedure. All employees will be asked to sign a Non-Disclosure Agreement. All employees with access to personal data shall operate and hold personal data under strict confidentiality if the same is not intended for public disclosure.</p>\r\n<p>Personal data in the custody of the organization may be in digital/electronic format and paper-based/physical format. All personal data being processed by the organization shall be stored in a data room, where paper-based documents are kept in locked filing cabinets while the digital/electronic files are stored in secured server managed by the [<em>who manages the server of this IS</em>]. And only the authorized personnel have the access of the server with the level of access permission.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>BREACH AND SECURITY INCIDENTS: RISK INVOLVE IN PROCESSING</strong></p>\r\n<p>The [<em>server manager/CMISO</em>] shall always maintain a backup file for all personal data under its custody. In the event of a security incident or data breach, it shall always compare the backup with the affected file to determine the presence of any inconsistencies or alterations resulting from the incident or breach.</p>\r\n<p>In case of breach incident, the [<em>server manager/CMISO</em>] will report to the Data Protection Officer together with the responsible Compliance Officer for Privacy of the certain City Government Office for the notification protocol. The [<em>server manager/CMISO</em>] detailed documentation of the incident or breach encountered as will be forwarded to the management and to the NPC depending on the City Government DPO&rsquo;s advise.</p>\r\n<p><strong>HOW MAY CONTACT US FOR INQUIRIES AND COMPLAINTS</strong></p>\r\n<p><strong>You as our Data Subjects have the following rights (RIGHTS OF DATA SUBJECTS):</strong></p>\r\n<p>Personal information will be made available to the clients and authorized processors anytime in case there are requests for correction, modification or deletion.&nbsp; It is the right of the individual owning the personal data to inquire or obtain a copy of the personal information provided to us.</p>\r\n<p>&nbsp;</p>\r\n<ol>\r\n<li>The right to be informed, thus this Data Privacy Manual on how your personal information collected be processed through this Information System.</li>\r\n<li>The right to access, thus you have the access of your personal details and account.</li>\r\n<li>The right to object, thus you can the right not to submit the data so as not the data to be processed.</li>\r\n<li><em>The right to erasure or blocking. [if there&rsquo;s a privilege for client to wipe out his/her data]</em></li>\r\n<li>The right to damages, thus you can request for assessment of your data that might be mishandled to our Data Privacy Officer.</li>\r\n<li>The right to file a complaint, thus you can file a complaint to our Data Privacy Officer to any misused, maliciously disclosed, or improperly disposition of your data.</li>\r\n<li>The right to rectify, thus you have the right to correct your submitted through [<em>the system or through the data information processor</em>].</li>\r\n</ol>\r\n<p>For further inquiries or complaints, you may report or coordinate with our City Government&rsquo;s Data Privacy Officer:</p>\r\n<p><strong>Atty. Reymond Q. Villablanca</strong></p>\r\n<p>Asst. City Legal Officer</p>\r\n<p>City Legal Office</p>\r\n<p>Ground Floor, Executive Building, City Hall, Cagayan de Oro City</p>\r\n<p>Email: dpo.cdo@gmail.com</p>\r\n<p>Contact Number: (088) 857-2260 / +63-960-902-1208</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n'),
	('notification_limit', '2');

-- Dumping structure for table db_appinvi.tbl_user_access_permission
CREATE TABLE IF NOT EXISTS `tbl_user_access_permission` (
  `user_permission_id` int NOT NULL AUTO_INCREMENT,
  `user_role_id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  `page_url` varchar(200) DEFAULT NULL,
  `can_access` char(1) NOT NULL,
  `can_create` char(1) NOT NULL,
  `can_update` char(1) NOT NULL,
  `can_delete` char(1) NOT NULL,
  `can_report` char(1) NOT NULL,
  `can_export` char(1) NOT NULL,
  `last_user` varchar(50) DEFAULT NULL,
  `last_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5436 DEFAULT CHARSET=utf8;

-- Dumping data for table db_appinvi.tbl_user_access_permission: ~290 rows (approximately)
INSERT IGNORE INTO `tbl_user_access_permission` (`user_permission_id`, `user_role_id`, `user_id`, `menu_id`, `page_url`, `can_access`, `can_create`, `can_update`, `can_delete`, `can_report`, `can_export`, `last_user`, `last_date`) VALUES
	(497, '4', NULL, 1, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '6/24/2014 2:18:01 PM'),
	(498, '4', NULL, 2, 'UserEntry.aspx', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'System Administrator', '6/24/2014 2:18:01 PM'),
	(499, '4', NULL, 3, 'UserRole.aspx', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'System Administrator', '6/24/2014 2:18:01 PM'),
	(500, '4', NULL, 4, 'UserPermission.aspx', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'System Administrator', '6/24/2014 2:18:01 PM'),
	(501, '4', NULL, 5, 'RolePermission.aspx', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'System Administrator', '6/24/2014 2:18:01 PM'),
	(502, '4', NULL, 6, 'cmsMenu.aspx', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'System Administrator', '6/24/2014 2:18:01 PM'),
	(503, '4', NULL, 35, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '6/24/2014 2:18:01 PM'),
	(857, '7', '00370', 7, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(858, '7', '00370', 8, 'PDSList.aspx', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(859, '7', '00370', 25, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(860, '7', '00370', 26, 'EmploymentDetailsEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(861, '7', '00370', 9, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(862, '7', '00370', 10, 'ProvinceEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(863, '7', '00370', 11, 'MunicipalityEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(864, '7', '00370', 12, 'BarangayEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(865, '7', '00370', 13, 'SchoolEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(866, '7', '00370', 14, 'SkillEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(867, '7', '00370', 15, 'CourseEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(868, '7', '00370', 16, 'EligibilityEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(869, '7', '00370', 30, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(870, '7', '00370', 31, 'DivisionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(871, '7', '00370', 32, 'PositionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(872, '7', '00370', 33, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(873, '7', '00370', 34, 'rptDivisionPersonnel.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(874, '7', '00370', 35, 'rptDivisionPersonnel.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(875, '7', '00370', 17, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(876, '7', '00370', 18, 'rptAOBirthdayCelebrants.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(877, '7', '00370', 20, 'rptAOEmployeeListingAge.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(878, '7', '00370', 21, 'rptAOEmployeeListingGender.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(879, '7', '00370', 22, 'rptAOEmployeeListTraining.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(880, '7', '00370', 23, 'rptAOEmployeeSkillsInventory.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(881, '7', '00370', 24, 'rptAOOfficeEmployeeList.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(882, '7', '00370', 27, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(883, '7', '00370', 28, 'EarnLeaves.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(884, '7', '00370', 29, 'EmployeeLeaveLedger.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(885, '7', '00370', 36, 'LeaveApplicationManagement.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(886, '7', '00370', 37, 'ApproveLeaveApplication.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:19 PM'),
	(887, '7', '00370', 38, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:19 PM'),
	(888, '7', '00370', 39, 'EmployeeUserEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:19 PM'),
	(889, '7', '00370', 1, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:19 PM'),
	(890, '7', '00370', 2, 'UserEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:19 PM'),
	(891, '7', '00370', 3, 'UserRole.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:19 PM'),
	(892, '7', '00370', 4, 'UserPermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:19 PM'),
	(893, '7', '00370', 5, 'RolePermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:19 PM'),
	(894, '7', '00370', 6, 'cmsMenu.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:19 PM'),
	(1361, '0', '02072015150805D11DE3459F9740E6B9C3', 7, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1362, '0', '02072015150805D11DE3459F9740E6B9C3', 8, 'PDSList.aspx', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1363, '0', '02072015150805D11DE3459F9740E6B9C3', 25, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1364, '0', '02072015150805D11DE3459F9740E6B9C3', 40, 'OfficePlantillaED.aspx', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1365, '0', '02072015150805D11DE3459F9740E6B9C3', 45, 'NonOfficePlantillaED.aspx', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1366, '0', '02072015150805D11DE3459F9740E6B9C3', 26, 'OfficeNonPlantillaED.aspx', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1367, '0', '02072015150805D11DE3459F9740E6B9C3', 9, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1368, '0', '02072015150805D11DE3459F9740E6B9C3', 10, 'ProvinceEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1369, '0', '02072015150805D11DE3459F9740E6B9C3', 11, 'MunicipalityEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1370, '0', '02072015150805D11DE3459F9740E6B9C3', 12, 'BarangayEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1371, '0', '02072015150805D11DE3459F9740E6B9C3', 13, 'SchoolEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1372, '0', '02072015150805D11DE3459F9740E6B9C3', 14, 'SkillEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1373, '0', '02072015150805D11DE3459F9740E6B9C3', 15, 'CourseEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1374, '0', '02072015150805D11DE3459F9740E6B9C3', 16, 'EligibilityEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1375, '0', '02072015150805D11DE3459F9740E6B9C3', 30, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1376, '0', '02072015150805D11DE3459F9740E6B9C3', 31, 'DivisionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1377, '0', '02072015150805D11DE3459F9740E6B9C3', 32, 'OfficePlantillaPositionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1378, '0', '02072015150805D11DE3459F9740E6B9C3', 46, 'SectionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1379, '0', '02072015150805D11DE3459F9740E6B9C3', 41, 'OfficeNonPlantillaPositionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1380, '0', '02072015150805D11DE3459F9740E6B9C3', 44, 'NonOfficePlantillaPositionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1381, '0', '02072015150805D11DE3459F9740E6B9C3', 33, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1382, '0', '02072015150805D11DE3459F9740E6B9C3', 34, 'rptDivisionPersonnel.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1383, '0', '02072015150805D11DE3459F9740E6B9C3', 35, 'rptDivisionPersonnel.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1384, '0', '02072015150805D11DE3459F9740E6B9C3', 42, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1385, '0', '02072015150805D11DE3459F9740E6B9C3', 43, 'PersonnelScheduleEntryAdd.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1386, '0', '02072015150805D11DE3459F9740E6B9C3', 17, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1387, '0', '02072015150805D11DE3459F9740E6B9C3', 18, 'rptAOBirthdayCelebrants.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1388, '0', '02072015150805D11DE3459F9740E6B9C3', 20, 'rptAOEmployeeListingAge.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1389, '0', '02072015150805D11DE3459F9740E6B9C3', 21, 'rptAOEmployeeListingGender.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1390, '0', '02072015150805D11DE3459F9740E6B9C3', 22, 'rptAOEmployeeListTraining.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1391, '0', '02072015150805D11DE3459F9740E6B9C3', 23, 'rptAOEmployeeSkillsInventory.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1392, '0', '02072015150805D11DE3459F9740E6B9C3', 24, 'rptAOOfficeEmployeeList.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1393, '0', '02072015150805D11DE3459F9740E6B9C3', 27, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1394, '0', '02072015150805D11DE3459F9740E6B9C3', 28, 'EarnLeaves.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1395, '0', '02072015150805D11DE3459F9740E6B9C3', 29, 'EmployeeLeaveLedger.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1396, '0', '02072015150805D11DE3459F9740E6B9C3', 36, 'LeaveApplicationManagement.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1397, '0', '02072015150805D11DE3459F9740E6B9C3', 37, 'ApproveLeaveApplication.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1398, '0', '02072015150805D11DE3459F9740E6B9C3', 1, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1399, '0', '02072015150805D11DE3459F9740E6B9C3', 2, 'UserEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1400, '0', '02072015150805D11DE3459F9740E6B9C3', 3, 'UserRole.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1401, '0', '02072015150805D11DE3459F9740E6B9C3', 4, 'UserPermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1402, '0', '02072015150805D11DE3459F9740E6B9C3', 5, 'RolePermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1403, '0', '02072015150805D11DE3459F9740E6B9C3', 6, 'cmsMenu.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1404, '0', '02072015150805D11DE3459F9740E6B9C3', 38, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1405, '0', '02072015150805D11DE3459F9740E6B9C3', 39, 'EmployeeUserEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1406, '0', '02072015150805D11DE3459F9740E6B9C3', 47, 'EmployeeUserPermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1407, '0', '02072015331152ECF111F4CD03403EB6F7', 25, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1408, '0', '02072015331152ECF111F4CD03403EB6F7', 40, 'OfficePlantillaED.aspx', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1409, '0', '02072015331152ECF111F4CD03403EB6F7', 45, 'NonOfficePlantillaED.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1410, '0', '02072015331152ECF111F4CD03403EB6F7', 26, 'OfficeNonPlantillaED.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1411, '0', '02072015331152ECF111F4CD03403EB6F7', 30, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1412, '0', '02072015331152ECF111F4CD03403EB6F7', 31, 'DivisionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1413, '0', '02072015331152ECF111F4CD03403EB6F7', 32, 'OfficePlantillaPositionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1414, '0', '02072015331152ECF111F4CD03403EB6F7', 46, 'SectionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1415, '0', '02072015331152ECF111F4CD03403EB6F7', 41, 'OfficeNonPlantillaPositionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1416, '0', '02072015331152ECF111F4CD03403EB6F7', 44, 'NonOfficePlantillaPositionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1417, '0', '02072015331152ECF111F4CD03403EB6F7', 33, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1418, '0', '02072015331152ECF111F4CD03403EB6F7', 34, 'rptDivisionPersonnel.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1419, '0', '02072015331152ECF111F4CD03403EB6F7', 35, 'rptDivisionPersonnel.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1420, '0', '02072015331152ECF111F4CD03403EB6F7', 42, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1421, '0', '02072015331152ECF111F4CD03403EB6F7', 43, 'PersonnelScheduleEntryAdd.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(3572, '0', '04092015351013406688026FD84887B6A4', 65, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3573, '0', '04092015351013406688026FD84887B6A4', 66, 'ApplyAppendLogTime.aspx', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3574, '0', '04092015351013406688026FD84887B6A4', 77, 'AttendanceEmployeeNoLog.aspx', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3575, '0', '04092015351013406688026FD84887B6A4', 61, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3576, '0', '04092015351013406688026FD84887B6A4', 62, 'BioOnlineLogTimeDownload.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3577, '0', '04092015351013406688026FD84887B6A4', 63, 'BiometricEmployeeDTRPrinting.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3578, '0', '04092015351013406688026FD84887B6A4', 64, 'ProcessTimeLogsIndividual.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3579, '0', '04092015351013406688026FD84887B6A4', 84, 'ProcessTimeLogsAll.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3580, '0', '04092015351013406688026FD84887B6A4', 78, 'ViewBiometricRawTimeLogs.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3581, '0', '04092015351013406688026FD84887B6A4', 67, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3582, '0', '04092015351013406688026FD84887B6A4', 68, 'EmployeeInformation.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3583, '0', '04092015351013406688026FD84887B6A4', 71, 'BiometricEmployeeShiftSchedule.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3584, '0', '04092015351013406688026FD84887B6A4', 70, 'BiometricScheduleEntry.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3585, '0', '04092015351013406688026FD84887B6A4', 69, 'HolidayEntry.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3586, '0', '04092015351013406688026FD84887B6A4', 79, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3587, '0', '04092015351013406688026FD84887B6A4', 80, 'PositionEntry.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3588, '0', '04092015351013406688026FD84887B6A4', 81, 'DivisionEntry.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3589, '0', '04092015351013406688026FD84887B6A4', 38, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3590, '0', '04092015351013406688026FD84887B6A4', 39, 'EmployeeUserEntry.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3591, '0', '04092015351013406688026FD84887B6A4', 47, 'EmployeeUserPermission.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3592, '0', '04092015351013406688026FD84887B6A4', 82, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3593, '0', '04092015351013406688026FD84887B6A4', 83, 'rptBiometricDailyTimeLogPrinting.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3638, '0', '040920153510058B0D09A2F7164379A4B8', 65, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3639, '0', '040920153510058B0D09A2F7164379A4B8', 66, 'ApplyAppendLogTime.aspx', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3640, '0', '040920153510058B0D09A2F7164379A4B8', 77, 'AttendanceEmployeeNoLog.aspx', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3641, '0', '040920153510058B0D09A2F7164379A4B8', 61, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3642, '0', '040920153510058B0D09A2F7164379A4B8', 62, 'BioOnlineLogTimeDownload.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3643, '0', '040920153510058B0D09A2F7164379A4B8', 63, 'BiometricEmployeeDTRPrinting.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3644, '0', '040920153510058B0D09A2F7164379A4B8', 64, 'ProcessTimeLogsIndividual.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3645, '0', '040920153510058B0D09A2F7164379A4B8', 84, 'ProcessTimeLogsAll.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3646, '0', '040920153510058B0D09A2F7164379A4B8', 78, 'ViewBiometricRawTimeLogs.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3647, '0', '040920153510058B0D09A2F7164379A4B8', 67, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3648, '0', '040920153510058B0D09A2F7164379A4B8', 68, 'EmployeeInformation.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3649, '0', '040920153510058B0D09A2F7164379A4B8', 71, 'BiometricEmployeeShiftSchedule.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3650, '0', '040920153510058B0D09A2F7164379A4B8', 70, 'BiometricScheduleEntry.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3651, '0', '040920153510058B0D09A2F7164379A4B8', 69, 'HolidayEntry.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3652, '0', '040920153510058B0D09A2F7164379A4B8', 79, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3653, '0', '040920153510058B0D09A2F7164379A4B8', 80, 'PositionEntry.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3654, '0', '040920153510058B0D09A2F7164379A4B8', 81, 'DivisionEntry.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3655, '0', '040920153510058B0D09A2F7164379A4B8', 82, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3656, '0', '040920153510058B0D09A2F7164379A4B8', 83, 'rptBiometricDailyTimeLogPrinting.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3657, '0', '040920153510058B0D09A2F7164379A4B8', 38, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3658, '0', '040920153510058B0D09A2F7164379A4B8', 39, 'EmployeeUserEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3659, '0', '040920153510058B0D09A2F7164379A4B8', 47, 'EmployeeUserPermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(4340, '4', 'establishment', 56, 'VerifySoloParent.aspx', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:35 AM'),
	(4341, '4', 'establishment', 48, 'Home.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:35 AM'),
	(4342, '4', 'establishment', 21, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:35 AM'),
	(4343, '4', 'establishment', 22, 'ValidateRegistration.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:35 AM'),
	(4344, '4', 'establishment', 23, 'PendingRegistration.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:35 AM'),
	(4345, '4', 'establishment', 41, 'TagRegistrationStatus.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4346, '4', 'establishment', 42, 'RegistrationStatusList.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4347, '4', 'establishment', 44, 'RegistrationStatusListInform.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4348, '4', 'establishment', 43, 'RegistrationComments.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4349, '4', 'establishment', 49, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4350, '4', 'establishment', 50, 'SoloParentCoordinates.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4351, '4', 'establishment', 52, 'SoloParentExcelRecords.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4352, '4', 'establishment', 55, 'ListQrCode.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4353, '4', 'establishment', 45, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4354, '4', 'establishment', 46, 'ReportBarangay.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4355, '4', 'establishment', 47, 'ReportGender.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4356, '4', 'establishment', 53, 'ReportAge.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4357, '4', 'establishment', 51, 'ReportMonthly.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4358, '4', 'establishment', 1, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4359, '4', 'establishment', 2, 'UserEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4360, '4', 'establishment', 3, 'UserRole.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4361, '4', 'establishment', 4, 'UserPermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4362, '4', 'establishment', 5, 'RolePermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4363, '4', 'establishment', 6, 'cmsMenu.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4364, '4', 'establishment', 54, 'SystemUsers.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/6/2020 9:25:36 AM'),
	(4365, '4', 'soloparent_admin', 56, 'VerifySoloParent.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4366, '4', 'soloparent_admin', 48, 'Home.aspx', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4367, '4', 'soloparent_admin', 21, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4368, '4', 'soloparent_admin', 22, 'ValidateRegistration.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4369, '4', 'soloparent_admin', 23, 'PendingRegistration.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4370, '4', 'soloparent_admin', 41, 'TagRegistrationStatus.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4371, '4', 'soloparent_admin', 42, 'RegistrationStatusList.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4372, '4', 'soloparent_admin', 44, 'RegistrationStatusListInform.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4373, '4', 'soloparent_admin', 43, 'RegistrationComments.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4374, '4', 'soloparent_admin', 49, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4375, '4', 'soloparent_admin', 50, 'SoloParentCoordinates.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4376, '4', 'soloparent_admin', 52, 'SoloParentExcelRecords.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4377, '4', 'soloparent_admin', 55, 'ListQrCode.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4378, '4', 'soloparent_admin', 45, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4379, '4', 'soloparent_admin', 46, 'ReportBarangay.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4380, '4', 'soloparent_admin', 47, 'ReportGender.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4381, '4', 'soloparent_admin', 53, 'ReportAge.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4382, '4', 'soloparent_admin', 51, 'ReportMonthly.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4383, '4', 'soloparent_admin', 1, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4384, '4', 'soloparent_admin', 2, 'UserEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4385, '4', 'soloparent_admin', 3, 'UserRole.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4386, '4', 'soloparent_admin', 4, 'UserPermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4387, '4', 'soloparent_admin', 5, 'RolePermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4388, '4', 'soloparent_admin', 6, 'cmsMenu.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4389, '4', 'soloparent_admin', 54, 'SystemUsers.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '11/11/2020 10:54:52 AM'),
	(4788, '4', 'cswd_honey', 56, 'VerifySoloParent.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:25:48 PM'),
	(4789, '4', 'cswd_honey', 21, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:25:48 PM'),
	(4790, '4', 'cswd_honey', 57, 'ValidateApplication.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:25:48 PM'),
	(4791, '4', 'cswd_honey', 62, 'ManageApplication.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:25:48 PM'),
	(4792, '4', 'cswd_honey', 63, 'EducEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:25:48 PM'),
	(4793, '4', 'cswd_honey', 43, 'RegistrationComments.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:25:48 PM'),
	(4794, '4', 'cswd_honey', 58, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:25:48 PM'),
	(4795, '4', 'cswd_honey', 59, 'EducLevelSched.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:25:48 PM'),
	(4796, '4', 'cswd_honey', 60, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:25:48 PM'),
	(4797, '4', 'cswd_honey', 61, 'ReportValidationList.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:25:48 PM'),
	(4798, '4', 'cswd_honey', 64, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:25:48 PM'),
	(4799, '4', 'cswd_honey', 65, 'adminUserEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:25:48 PM'),
	(4800, '4', 'cswd_honey', 66, 'adminUserPermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:25:49 PM'),
	(4801, '4', 'cswd_honey', 67, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:25:49 PM'),
	(4802, '4', 'cswd_honey', 68, 'UserLimit.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:25:49 PM'),
	(4803, '4', 'jmseno', 56, 'VerifySoloParent.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:26:30 PM'),
	(4804, '4', 'jmseno', 21, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:26:30 PM'),
	(4805, '4', 'jmseno', 57, 'ValidateApplication.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:26:30 PM'),
	(4806, '4', 'jmseno', 62, 'ManageApplication.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:26:30 PM'),
	(4807, '4', 'jmseno', 63, 'EducEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:26:30 PM'),
	(4808, '4', 'jmseno', 43, 'RegistrationComments.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:26:30 PM'),
	(4809, '4', 'jmseno', 58, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:26:30 PM'),
	(4810, '4', 'jmseno', 59, 'EducLevelSched.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:26:30 PM'),
	(4811, '4', 'jmseno', 60, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:26:30 PM'),
	(4812, '4', 'jmseno', 61, 'ReportValidationList.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:26:30 PM'),
	(4813, '4', 'jmseno', 64, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:26:30 PM'),
	(4814, '4', 'jmseno', 65, 'adminUserEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:26:30 PM'),
	(4815, '4', 'jmseno', 66, 'adminUserPermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:26:30 PM'),
	(4816, '4', 'jmseno', 67, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:26:30 PM'),
	(4817, '4', 'jmseno', 68, 'UserLimit.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:26:30 PM'),
	(4818, '4', 'cswd', 56, 'VerifySoloParent.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:27:31 PM'),
	(4819, '4', 'cswd', 21, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:27:31 PM'),
	(4820, '4', 'cswd', 57, 'ValidateApplication.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:27:31 PM'),
	(4821, '4', 'cswd', 62, 'ManageApplication.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:27:31 PM'),
	(4822, '4', 'cswd', 63, 'EducEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:27:31 PM'),
	(4823, '4', 'cswd', 43, 'RegistrationComments.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:27:31 PM'),
	(4824, '4', 'cswd', 58, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:27:31 PM'),
	(4825, '4', 'cswd', 59, 'EducLevelSched.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:27:31 PM'),
	(4826, '4', 'cswd', 60, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:27:31 PM'),
	(4827, '4', 'cswd', 61, 'ReportValidationList.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:27:31 PM'),
	(4828, '4', 'cswd', 64, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:27:31 PM'),
	(4829, '4', 'cswd', 65, 'adminUserEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:27:31 PM'),
	(4830, '4', 'cswd', 66, 'adminUserPermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:27:31 PM'),
	(4831, '4', 'cswd', 67, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:27:31 PM'),
	(4832, '4', 'cswd', 68, 'UserLimit.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'CSWD ADMIN', '10/3/2022 12:27:31 PM'),
	(4833, '1', 'cswd_admin', 56, 'VerifySoloParent.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/3/2022 8:45:51 PM'),
	(4834, '1', 'cswd_admin', 21, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/3/2022 8:45:51 PM'),
	(4835, '1', 'cswd_admin', 57, 'ValidateApplication.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/3/2022 8:45:51 PM'),
	(4836, '1', 'cswd_admin', 62, 'ManageApplication.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/3/2022 8:45:51 PM'),
	(4837, '1', 'cswd_admin', 63, 'EducEntry.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/3/2022 8:45:51 PM'),
	(4838, '1', 'cswd_admin', 43, 'RegistrationComments.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/3/2022 8:45:51 PM'),
	(4839, '1', 'cswd_admin', 58, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/3/2022 8:45:51 PM'),
	(4840, '1', 'cswd_admin', 59, 'EducLevelSched.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/3/2022 8:45:51 PM'),
	(4841, '1', 'cswd_admin', 60, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/3/2022 8:45:51 PM'),
	(4842, '1', 'cswd_admin', 61, 'ReportValidationList.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/3/2022 8:45:51 PM'),
	(4843, '1', 'cswd_admin', 64, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/3/2022 8:45:51 PM'),
	(4844, '1', 'cswd_admin', 65, 'adminUserEntry.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/3/2022 8:45:51 PM'),
	(4845, '1', 'cswd_admin', 66, 'adminUserPermission.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/3/2022 8:45:51 PM'),
	(4846, '1', 'cswd_admin', 67, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/3/2022 8:45:51 PM'),
	(4847, '1', 'cswd_admin', 68, 'UserLimit.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'N', 'System Administrator', '10/3/2022 8:45:51 PM'),
	(4848, '1', 'cswd_admin', 69, 'Application_duplicates.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/3/2022 8:45:51 PM'),
	(5316, '4', 'user1', 93, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '01/12/2023 11:16:05 AM'),
	(5317, '4', 'user1', 94, '#', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '01/12/2023 11:16:05 AM'),
	(5318, '4', 'user1', 83, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '01/12/2023 11:16:05 AM'),
	(5319, '4', 'user1', 84, 'RefSetSignatories.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '01/12/2023 11:16:06 AM'),
	(5320, '4', 'user1', 95, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '01/12/2023 11:16:06 AM'),
	(5321, '4', 'user1', 64, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '01/12/2023 11:16:06 AM'),
	(5322, '4', 'user1', 65, 'adminUserEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '01/12/2023 11:16:06 AM'),
	(5323, '4', 'user1', 66, 'adminUserPermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '01/12/2023 11:16:06 AM'),
	(5324, '4', 'user1', 1, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '01/12/2023 11:16:06 AM'),
	(5325, '4', 'user1', 2, 'UserEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '01/12/2023 11:16:06 AM'),
	(5326, '4', 'user1', 3, 'UserRole.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '01/12/2023 11:16:06 AM'),
	(5327, '4', 'user1', 4, 'UserPermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '01/12/2023 11:16:06 AM'),
	(5328, '4', 'user1', 5, 'RolePermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '01/12/2023 11:16:06 AM'),
	(5329, '4', 'user1', 6, 'cmsMenu.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '01/12/2023 11:16:07 AM'),
	(5330, '4', 'user1', 54, 'SystemUsers.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '01/12/2023 11:16:07 AM'),
	(5422, '1', 'admin', 93, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '01/19/2023 1:42:27 PM'),
	(5423, '1', 'admin', 94, 'NewApplication.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '01/19/2023 1:42:27 PM'),
	(5424, '1', 'admin', 97, 'AppInventory.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '01/19/2023 1:42:27 PM'),
	(5425, '1', 'admin', 83, '&nbsp;', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '01/19/2023 1:42:27 PM'),
	(5426, '1', 'admin', 98, 'refDivision.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '01/19/2023 1:42:27 PM'),
	(5427, '1', 'admin', 99, 'refClients.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '01/19/2023 1:42:27 PM'),
	(5428, '1', 'admin', 101, 'refPersonnel.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '01/19/2023 1:42:27 PM'),
	(5429, '1', 'admin', 100, 'refUserRoles.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '01/19/2023 1:42:28 PM'),
	(5430, '1', 'admin', 95, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '01/19/2023 1:42:28 PM'),
	(5431, '1', 'admin', 102, 'rptReports.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '01/19/2023 1:42:28 PM'),
	(5432, '1', 'admin', 1, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '01/19/2023 1:42:28 PM'),
	(5433, '1', 'admin', 2, 'UserEntry.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '01/19/2023 1:42:28 PM'),
	(5434, '1', 'admin', 4, 'UserPermission.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '01/19/2023 1:42:28 PM'),
	(5435, '1', 'admin', 6, 'cmsMenu.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '01/19/2023 1:42:28 PM');

-- Dumping structure for table db_appinvi.tbl_user_info
CREATE TABLE IF NOT EXISTS `tbl_user_info` (
  `user_id` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_role_id` int DEFAULT NULL,
  `user_password` varchar(100) DEFAULT NULL,
  `is_active` char(1) DEFAULT NULL,
  `last_user` varchar(50) DEFAULT NULL,
  `last_date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_appinvi.tbl_user_info: ~3 rows (approximately)
INSERT IGNORE INTO `tbl_user_info` (`user_id`, `user_name`, `user_role_id`, `user_password`, `is_active`, `last_user`, `last_date`) VALUES
	('admin', 'System Administrator', 1, 'Jzh3JxjBHfUm7X2gxsMbWg=ce3046478f50b4b56', 'Y', 'INITIALIZED', '4/17/2014 10:29:54 AM'),
	('legal', 'Legal User', 4, 'tl9UUtoyQm2uzSorsCfAEg=e0ea150034825421a', 'Y', 'System Administrator', '12/12/2022 11:35:46 AM'),
	('user1', 'User Name Sample', 4, 'tl9UUtoyQm2uzSorsCfAEg=e0ea150034825421a', 'Y', '', '01/12/2023 11:07:01 AM');

-- Dumping structure for table db_appinvi.tbl_user_role
CREATE TABLE IF NOT EXISTS `tbl_user_role` (
  `user_role_id` varchar(50) NOT NULL,
  `user_role_name` varchar(50) DEFAULT NULL,
  `user_role_description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_role_type` varchar(15) DEFAULT '',
  `is_active` char(1) NOT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `create_date` varchar(50) DEFAULT NULL,
  `last_user` varchar(50) DEFAULT NULL,
  `last_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_appinvi.tbl_user_role: ~5 rows (approximately)
INSERT IGNORE INTO `tbl_user_role` (`user_role_id`, `user_role_name`, `user_role_description`, `user_role_type`, `is_active`, `create_user`, `create_date`, `last_user`, `last_date`) VALUES
	('011920230810541E61B', 'ADMINISTRATOR', 'SYSTEM ADMINISTRATOR', 'System', 'Y', NULL, NULL, 'System Administrator', '01/19/2023 10:08:54 AM'),
	('1', 'Administrator', 'Super Administrator', 'System', 'Y', NULL, NULL, 'INITIALIZED', '4/17/2014 10:29:54 AM'),
	('4', 'USER', 'SYSTEM USER', 'System', 'Y', NULL, NULL, 'System Administrator', '01/19/2023 10:11:22 AM'),
	('DEVELOPER', 'DEVELOPER', 'SYSTEM DEVELOPER', 'Personnel', 'Y', NULL, NULL, 'System Administrator', '01/19/2023 10:09:22 AM'),
	('PROJECT MANAGER', 'PROJECT MANAGER', 'PROJECT MANAGER', 'Personnel', 'Y', NULL, NULL, 'System Administrator', '01/19/2023 10:11:18 AM');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
