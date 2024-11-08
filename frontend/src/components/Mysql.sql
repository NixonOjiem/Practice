DROP DATABASE IF EXISTS `My_Test_DB`;

CREATE DATABASE `My_Test_DB`;
use My_Test_DB;

CREATE TABLE employee_demographics (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    age INT,
    birth_date DATE,
);

CREATE TABLE employee_slary(
    employee_id INT NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    occupation VARCHAR(100),
    salary INT,
    dept_id INT,
);

INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUES
(1,'Leslie', 'Knope', 44, '1979-09-25'),
(3,'Tom', 'Haverford', 36, '1987-03-04'),
(4, 'April', 'Ludgate', 29,'1994-03-27'),
(5, 'Jerry', 'Gergich', 61,'1962-08-28'),
(6, 'Donna', 'Meagle', 46, '1977-07-30'),
(7, 'Ann', 'Perkins', 35, '1988-12-01'),
(8, 'Chris', 'Traeger', 43, '1980-11-11'),
(9, 'Ben', 'Wyatt', 38, '1985-07-26'),
(10, 'Andy', 'Dwyer', 34,'1989-03-25'),
(11, 'Mark', 'Brendanawicz', 40, '1983-06-14'),
(12, 'Craig', 'Middlebrooks', 37, '1986-07-27');

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(1, 'Leslie', 'Knope', 'Deputy Director of Parks and Recreation', 75000,1),
(2, 'Ron', 'Swanson', 'Director of Parks and Recreation', 70000,1),
(3, 'Tom', 'Haverford', 'Entrepreneur', 50000,1),
(4, 'April', 'Ludgate', 'Assistant to the Director of Parks and Recreation', 25000,1),
(5, 'Jerry', 'Gergich', 'Office Manager', 50000,1),
(6, 'Donna', 'Meagle', 'Office Manager', 60000,1),
(7, 'Ann', 'Perkins', 'Nurse', 55000,4),
(8, 'Chris', 'Traeger', 'City Manager', 90000,3),
(9, 'Ben', 'Wyatt', 'State Auditor', 70000,6),
(10, 'Andy', 'Dwyer', 'Shoe Shiner and Musician', 20000, NULL),
(11, 'Mark', 'Brendanawicz', 'City Planner', 57000, 3),
(12, 'Craig', 'Middlebrooks', 'Parks Director', 65000,1);

CREATE TABLE parks_departments (
  department_id INT NOT NULL AUTO_INCREMENT,
  department_name varchar(50) NOT NULL,
  PRIMARY KEY (department_id)
);

INSERT INTO parks_departments (department_name)
VALUES
('Parks and Recreation'),
('Animal Control'),
('Public Works'),
('Healthcare'),
('Library'),
('Finance');



#this is a comment

select * from my_test_db.employee_demographics where age <30;

select * from my_test_db.employee_demographics where age <70 && first_name = 'Tom';

 select first_name, last_name, age from my_test_db.employee_demographics where first_name LIKE 'd%';


DROP DATABASE IF EXISTS `Trial_DB`;
CREATE DATABASE `Trial_DB`;

USE `Trial_DB`;

CREATE TABLE user_data (
user_ID INT auto_increment primary KEY,
first_name VARCHAR(100),
last_name VARCHAR(100),
email varchar(100)
);

INSERT INTO user_data ( first_name, last_name, email) values
('Nick', 'ojiem', 'nixon@gmail.com'),
('Grace', 'Emmy', 'grace@gmail.com');

describe user_data;

select * FROM trial_db.user_data;

-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: openmrs
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--

DROP TABLE IF EXISTS `address_hierarchy_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_hierarchy_entry` (
  `address_hierarchy_entry_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(160) DEFAULT NULL,
  `level_id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `user_generated_id` varchar(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `elevation` double DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`address_hierarchy_entry_id`),
  KEY `address_hierarchy_entry_name_idx` (`name`),
  KEY `level_name` (`level_id`,`name`),
  KEY `parent_name` (`parent_id`,`name`),
  CONSTRAINT `level_to_level` FOREIGN KEY (`level_id`) REFERENCES `address_hierarchy_level` (`address_hierarchy_level_id`),
  CONSTRAINT `parent-to-parent` FOREIGN KEY (`parent_id`) REFERENCES `address_hierarchy_entry` (`address_hierarchy_entry_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7149 DEFAULT CHARSET=latin1;


# SELECT patient_appointment_id, start_date_time, end_date_time, status, appointment_kind, date_appointment_scheduled FROM openmrs.patient_appointment WHERE status LIKE 'Missed';

SELECT name, start_time, date_created FROM openmrs.appointment_service;

SELECT * FROM openmrs.drug;

SELECT concept_id  FROM openmrs.orders WHERE order_id=112979;



DROP TABLE IF EXISTS `care_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `care_setting` (
  `care_setting_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `care_setting_type` varchar(50) NOT NULL,
  `creator` int NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`care_setting_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `care_setting_creator` (`creator`),
  KEY `care_setting_retired_by` (`retired_by`),
  KEY `care_setting_changed_by` (`changed_by`),
  CONSTRAINT `care_setting_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `care_setting_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `care_setting_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
)

LOCK TABLES `care_setting` WRITE;
/*!40000 ALTER TABLE `care_setting` DISABLE KEYS */;
INSERT INTO `care_setting` VALUES (1,'Outpatient','Out-patient care setting','OUTPATIENT',1,'2013-12-27 00:00:00',0,NULL,NULL,NULL,NULL,NULL,'6f0c9a92-6f24-11e3-af88-005056821db0'),(2,'Inpatient','In-patient care setting','INPATIENT',1,'2013-12-27 00:00:00',0,NULL,NULL,NULL,NULL,NULL,'c365e560-c3ec-11e3-9c1a-0800200c9a66');
/*!40000 ALTER TABLE `care_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashier_bill`
--

DROP TABLE IF EXISTS `cashier_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashier_bill` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `receipt_number` varchar(255) DEFAULT NULL,
  `provider_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `cash_point_id` int NOT NULL,
  `adjusted_bill_id` int DEFAULT NULL,
  `creator` int NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `receipt_printed` tinyint(1) NOT NULL DEFAULT '0',
  `adjustment_reason` varchar(500) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`bill_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `cashier_bill_receipt_number_idx` (`receipt_number`),
  KEY `cashier_bill_patient_id_idx` (`patient_id`),
  KEY `cashier_bill_provider_fk` (`provider_id`),
  KEY `cashier_bill_cash_point_fk` (`cash_point_id`),
  KEY `cashier_bill_creator_fk` (`creator`),
  KEY `cashier_bill_changed_by_fk` (`changed_by`),
  KEY `cashier_bill_voided_by_fk` (`voided_by`),
  KEY `cashier_bill_adjusted_bill_fk` (`adjusted_bill_id`),
  KEY `cashier_date_created` (`date_created`),
  CONSTRAINT `cashier_bill_adjusted_bill_fk` FOREIGN KEY (`adjusted_bill_id`) REFERENCES `cashier_bill` (`bill_id`),
  CONSTRAINT `cashier_bill_cash_point_fk` FOREIGN KEY (`cash_point_id`) REFERENCES `cashier_cash_point` (`cash_point_id`),
  CONSTRAINT `cashier_bill_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `cashier_bill_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `cashier_bill_patient_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `cashier_bill_provider_fk` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `cashier_bill_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

use openmrs;
set @reportingdate = '2024-10-30';
SELECT * FROM(
		SELECT
			-- (SELECT facilityname FROM chsemrdata.ml_facilitydatabases where databasename = 'openmrs') AS facilityname,
			-- (SELECT mflcode FROM chsemrdata.ml_facilitydatabases where databasename = 'openmrs') AS mflcode,
			identifier as cccnumber,activeclients.person_id as patientid,
			CASE WHEN activeclients.NextAppointmentDate < DATE_ADD(@reportingdate, INTERVAL 1 DAY) THEN 'defaulter' else 'active' end as txcurrstatus,
			CASE WHEN activeclients.NextAppointmentDate < DATE_ADD(@reportingdate, INTERVAL 1 DAY) THEN 
				DATEDIFF(DATE_ADD(@reportingdate, INTERVAL 1 DAY), activeclients.NextAppointmentDate) ELSE 0 end as daysdefaulted,
				case when exits.ExitReason = 'Transferred out' and exits.effective_discontinuation_date > @reportingdate then exits.ExitReason end as ExitReason,
				exits.effective_discontinuation_date,
                exits.effective_discontinuation_date as transferverificationdate
               -- ,'',reportingperiod,'','',reportingfrequency,''
			FROM(
			SELECT * FROM(
				SELECT row_number() over (PARTITION BY t.person_id ORDER BY t.person_id asc,t.LastVisitDate DESC) AS rownumber
				   ,t.*
				FROM (
					select appointments.patient_id as person_id,visits.date_started as LastVisitDate,upcomingappointments.start_date_time as NextAppointmentDate, 
					DATE_ADD(upcomingappointments.start_date_time, INTERVAL 30 DAY) as defaultingday,
					upcomingappointments.start_date_time as upcomingappointment,DATE_ADD(upcomingappointments.start_date_time, INTERVAL 30 DAY) as dday
					from(
						SELECT * FROM(
							SELECT row_number() over (PARTITION BY t.patient_id ORDER BY t.patient_id asc,t.start_date_time DESC) AS rownumber
						   ,t.*
						FROM (
							select * from openmrs.patient_appointment where cast(date_appointment_scheduled as date) <= @reportingdate
                            and status != 'Cancelled'
						) t
						)returndates 
						where rownumber = 1
					)appointments
					left join(
						SELECT * FROM(
							SELECT row_number() over (PARTITION BY t.patient_id ORDER BY t.patient_id asc,t.date_started DESC) AS rownumber
						   ,t.*
							FROM (
								select * from openmrs.visit where date_started < @reportingdate
							) t
						)returndates where rownumber = 1
					)visits on appointments.patient_id = visits.patient_id
					left join(
						SELECT * FROM(
							SELECT row_number() over (PARTITION BY t.patient_id ORDER BY t.patient_id asc,t.start_date_time ASC) AS rownumber
						   ,t.*
						FROM (
							select * from openmrs.patient_appointment where start_date_time > DATE_ADD(@reportingdate, INTERVAL 1 DAY)
							and appointment_service_id = 1
						) t
						)returndates 
						where rownumber = 1
					)upcomingappointments on upcomingappointments.patient_id = appointments.patient_id
					where (
					DATE_ADD(upcomingappointments.start_date_time, INTERVAL 30 DAY) >= @reportingdate
					OR DATE_ADD(appointments.start_date_time, INTERVAL 30 DAY) >= @reportingdate)
				) t
				)appointments WHERE rownumber = 1
			)activeclients LEFT JOIN(
				SELECT patient_id,ExitDate,ExitReason,effective_discontinuation_date,to_facility,program_name AS ExitedFrom FROM(
						SELECT row_number() over (PARTITION BY t.patient_id ORDER BY t.patient_id asc,t.encounter_datetime DESC) AS rownumber,t.patient_id
						   ,t.encounter_datetime AS ExitDate, t.program_name,t.name AS ExitReason,t.to_facility,t.effective_discontinuation_date
						FROM (
							SELECT pd.patient_id,pd.encounter_datetime,pd.program_name,effective_discontinuation_date,cn.name,pd.to_facility FROM(
						select 
							e.patient_id,
							e.uuid,
							e.visit_id,
							e.encounter_datetime,
							 -- et.uuid,
							(case et.uuid
								when '2bdada65-4c72-4a48-8730-859890e25cee' then 'HIV'
								when 'd3e3d723-7458-4b4e-8998-408e8a551a84' then 'TB'
								when '01894f88-dc73-42d4-97a3-0929118403fb' then 'MCH Child HEI'
								when '5feee3f1-aa16-4513-8bd0-5d9b27ef1208' then 'MCH Child'
								when '7c426cfc-3b47-4481-b55f-89860c21c7de' then 'MCH Mother'
								when '162382b8-0464-11ea-9a9f-362b9e155667' then 'OTZ'
								when '5cf00d9e-09da-11ea-8d71-362b9e155667' then 'OVC'
								when 'd7142400-2495-11e9-ab14-d663bd873d93' then 'KP'
							end) as program_name,
							e.encounter_id,
							max(if(o.concept_id=161555, o.value_coded, null)) as reason_discontinued,
							max(if(o.concept_id=164384, o.value_datetime, null)) as effective_discontinuation_date,
							max(if(o.concept_id=164384, o.value_datetime, null)) as visit_date,
							max(if(o.concept_id=1285, o.value_coded, null)) as trf_out_verified,
							max(if(o.concept_id=164133, o.value_datetime, null)) as trf_out_verification_date,
							max(if(o.concept_id=1543, o.value_datetime, null)) as date_died,
							max(if(o.concept_id=159495, left(trim(o.value_text),100), null)) as to_facility,
							max(if(o.concept_id=160649, o.value_datetime, null)) as to_date
							from  openmrs.encounter e
							inner join  openmrs.person p on p.person_id=e.patient_id and p.voided=0
							inner join  openmrs.obs o on o.encounter_id=e.encounter_id and o.voided=0 and o.concept_id in (161555,164384,1543,159495,160649,165380,1285,164133)
							inner join 
							(
								select encounter_type_id, uuid, name from  openmrs.encounter_type where 
								uuid in('2bdada65-4c72-4a48-8730-859890e25cee','d3e3d723-7458-4b4e-8998-408e8a551a84','5feee3f1-aa16-4513-8bd0-5d9b27ef1208',
								'7c426cfc-3b47-4481-b55f-89860c21c7de','01894f88-dc73-42d4-97a3-0929118403fb','162382b8-0464-11ea-9a9f-362b9e155667','5cf00d9e-09da-11ea-8d71-362b9e155667','d7142400-2495-11e9-ab14-d663bd873d93')
							) et on et.encounter_type_id=e.encounter_type
							WHERE e.encounter_datetime < DATE_ADD(@reportingdate, INTERVAL 1 DAY)
							group by e.encounter_id
						)pd LEFT JOIN (
							SELECT * FROM openmrs.concept_name WHERE locale = 'en'
						) cn ON pd.reason_discontinued = cn.concept_id
						WHERE pd.program_name = 'HIV'
						) t
				)exits WHERE rownumber = 1 and ExitReason IN ('Transferred out','Died','Lost to followup') and program_name = 'HIV'
			)exits ON activeclients.person_id = exits.patient_id 
			LEFT JOIN(
				SELECT * FROM(
					SELECT row_number() over (PARTITION BY t.patient_id ORDER BY t.patient_id ASC,t.encounter_datetime ASC) AS rownumber,t.patient_id
				   ,t.identifier,t.encounter_datetime,t.program, t.regimen,t.regimen_name,t.regimen_line,t.value_coded
					FROM (SELECT * FROM(
					SELECT pids.identifier,regimens.patient_id,regimens.encounter_datetime,regimens.program,regimens.value_coded,
					CASE WHEN regimens.regimen = '' and unstandardregimens.regimen = '' THEN NULL 
					WHEN regimens.regimen IS NOT NULL THEN regimens.regimen 
					WHEN unstandardregimens.regimen IS NOT NULL THEN unstandardregimens.regimen 
					ELSE regimens.regimen
					END AS regimen,
					CASE WHEN regimens.regimen_name = '' THEN NULL ELSE regimens.regimen_name END AS regimen_name,
					CASE WHEN regimens.regimen_line = '' THEN NULL ELSE regimens.regimen_line END AS regimen_line
					FROM(
						select
								e.uuid,
								e.patient_id,
								e.encounter_datetime,
								-- e.encounter_datetime,
								e.creator,
								e.encounter_id,
								o.value_coded,
								max(if(o.concept_id=1255,'HIV',if(o.concept_id=1268, 'TB', null))) as program,
								max(if(o.concept_id=1193,(
									case o.value_coded
									when 162565 then "3TC/NVP/TDF"
									when 164505 then "TDF/3TC/EFV"
									when 1652 then "AZT/3TC/NVP"
									when 160124 then "AZT/3TC/EFV"
									when 792 then "D4T/3TC/NVP"
									when 160104 then "D4T/3TC/EFV"
									when 164971 then "TDF/3TC/AZT"
									when 165357 then "ABC/3TC/ATV/r"
									when 164968 then "AZT/3TC/DTG"
									when 164969 then "TDF/3TC/DTG"
									when 164970 then "ABC/3TC/DTG"
									when 162561 then "AZT/3TC/LPV/r"
									when 164511 then "AZT/3TC/ATV/r"
									when 162201 then "TDF/3TC/LPV/r"
									when 1067 then "Unknown"
									when 164512 then "TDF/3TC/ATV/r"
									when 162560 then "D4T/3TC/LPV/r"
									when 164972 then "AZT/TDF/3TC/LPV/r"
									when 164973 then "ETR/RAL/DRV/RTV"
									when 164974 then "ETR/TDF/3TC/LPV/r"
									when 162200 then "ABC/3TC/LPV/r"
									when 162199 then "ABC/3TC/NVP"
									when 162563 then "ABC/3TC/EFV"
									when 817 then "AZT/3TC/ABC"
									when 164975 then "D4T/3TC/ABC"
									when 162562 then "TDF/ABC/LPV/r"
									when 162559 then "ABC/DDI/LPV/r"
									when 164976 then "ABC/TDF/3TC/LPV/r"
									when 165375 then "RAL+3TC+DRV+RTV"
									when 165376 then "RAL+3TC+DRV+RTV+AZT"
									when 165377 then "RAL+3TC+DRV+RTV+ABC"
									when 165378 then "ETV+3TC+DRV+RTV"
									when 165379 then "RAL+3TC+DRV+RTV+TDF"
									when 165369 then "TDF+3TC+DTG+DRV/r"
									when 165370 then "TDF+3TC+RAL+DRV/r"
									when 165371 then "TDF+3TC+DTG+EFV+DRV/r"
									when 165372 then "ABC+3TC+RAL"
									when 165373 then "AZT+3TC+RAL+DRV/r"
									when 165374 then "ABC+3TC+RAL+DRV/r"
									when 1675 then "RHZE"
									when 768 then "RHZ"
									when 1674 then "SRHZE"
									when 164978 then "RfbHZE"
									when 164979 then "RfbHZ"
									when 164980 then "SRfbHZE"
									when 84360 then "S (1 gm vial)"
									when 75948 then "E"
									when 1194 then "RH"
									when 159851 then "RHE"
									when 1108 then "EH"
									else o.value_coded
									end ),null)) as regimen,
								max(if(o.concept_id=1193,(
									case o.value_coded
									when 162565 then "3TC+NVP+TDF"
									when 164505 then "TDF+3TC+EFV"
									when 1652 then "AZT+3TC+NVP"
									when 160124 then "AZT+3TC+EFV"
									when 792 then "D4T+3TC+NVP"
									when 160104 then "D4T+3TC+EFV"
									when 164971 then "TDF+3TC+AZT"
									when 164968 then "AZT+3TC+DTG"
									when 1067 then "Unknown"
									when 164969 then "TDF+3TC+DTG"
									when 164970 then "ABC+3TC+DTG"
									when 162561 then "AZT+3TC+LPV/r"
									when 164511 then "AZT+3TC+ATV/r"
									when 162201 then "TDF+3TC+LPV/r"
									when 165357 then "ABC/3TC/ATV/r"
									when 164512 then "TDF+3TC+ATV/r"
									when 162560 then "D4T+3TC+LPV/r"
									when 164972 then "AZT+TDF+3TC+LPV/r"
									when 164973 then "ETR+RAL+DRV+RTV"
									when 164974 then "ETR+TDF+3TC+LPV/r"
									when 162200 then "ABC+3TC+LPV/r"
									when 162199 then "ABC+3TC+NVP"
									when 162563 then "ABC+3TC+EFV"
									when 817 then "AZT+3TC+ABC"
									when 164975 then "D4T+3TC+ABC"
									when 162562 then "TDF+ABC+LPV/r"
									when 162559 then "ABC+DDI+LPV/r"
									when 164976 then "ABC+TDF+3TC+LPV/r"
									when 165375 then "RAL+3TC+DRV+RTV"
									when 165376 then "RAL+3TC+DRV+RTV+AZT"
									when 165377 then "RAL+3TC+DRV+RTV+ABC"
									when 165378 then "ETV+3TC+DRV+RTV"
									when 165379 then "RAL+3TC+DRV+RTV+TDF"
									when 165369 then "TDF+3TC+DTG+DRV/r"
									when 165370 then "TDF+3TC+RAL+DRV/r"
									when 165371 then "TDF+3TC+DTG+EFV+DRV/r"
									when 165372 then "ABC+3TC+RAL"
									when 165373 then "AZT+3TC+RAL+DRV/r"
									when 165374 then "ABC+3TC+RAL+DRV/r"
									when 1675 then "RHZE"
									when 768 then "RHZ"
									when 1674 then "SRHZE"
									when 164978 then "RfbHZE"
									when 164979 then "RfbHZ"
									when 164980 then "SRfbHZE"
									when 84360 then "S (1 gm vial)"
									when 75948 then "E"
									when 1194 then "RH"
									when 159851 then "RHE"
									when 1108 then "EH"
									else ""
									end ),null)) as regimen_name,
								max(if(o.concept_id=1193,(
									case o.value_coded
									when 162565 then "First line"
									when 164505 then "First line"
									when 1652 then "First line"
									when 160124 then "First line"
									when 792 then "First line"
									when 160104 then "First line"
									when 164971 then "First line"
									when 164968 then "First line"
									when 164969 then "First line"
									when 164970 then "First line"
									when 162561 then "First line"
									when 164511 then "First line"
									when 164512 then "First line"
									when 162201 then "First line"
									when 162561 then "Second line"
									when 164511 then "Second line"
									when 162201 then "Second line"
									when 164512 then "Second line"
									when 162560 then "Second line"
									when 164972 then "Second line"
									when 164973 then "Second line"
									when 164974 then "Second line"
									when 165357 then "Second line"
									when 164968 then "Second line"
									when 164969 then "Second line"
									when 164970 then "Second line"
									when 165375 then "Third line"
									when 165376 then "Third line"
									when 165379 then "Third line"
									when 165378 then "Third line"
									when 165369 then "Third line"
									when 165370 then "Third line"
									when 165371 then "Third line"
									when 162200 then "First line"
									when 162199 then "First line"
									when 162563 then "First line"
									when 817 then "First line"
									when 164975 then "First line"
									when 162562 then "First line"
									when 162559 then "First line"
									when 164976 then "First line"
									when 165372 then "First line"
									when 162561 then "Second line"
									when 164511 then "Second line"
									when 162200 then "Second line"
									when 165357 then "Second line"
									when 165373 then "Second line"
									when 165374 then "Second line"
									when 165375 then "Third line"
									when 165376 then "Third line"
									when 165377 then "Third line"
									when 165378 then "Third line"
									when 165373 then "Third line"
									when 165374 then "Third line"
									when 1675 then "Adult intensive"
									when 768 then "Adult intensive"
									when 1674 then "Adult intensive"
									when 164978 then "Adult intensive"
									when 164979 then "Adult intensive"
									when 164980 then "Adult intensive"
									when 84360 then "Adult intensive"
									when 75948 then "Child intensive"
									when 1194 then "Child intensive"
									when 159851 then "Adult continuation"
									when 1108 then "Adult continuation"
									else ""
									end ),null)) as regimen_line,
								max(if(o.concept_id=1191,(case o.value_datetime when NULL then 0 else 1 end),null)) as discontinued,
								null as regimen_discontinued,
								max(if(o.concept_id=1191,o.value_datetime,null)) as date_discontinued,
								max(if(o.concept_id=1252,o.value_coded,null)) as reason_discontinued,
								max(if(o.concept_id=5622,o.value_text,null)) as reason_discontinued_other

							from  openmrs.encounter e
								inner join  openmrs.person p on p.person_id=e.patient_id and p.voided=0
								inner join  openmrs.obs o on e.encounter_id = o.encounter_id and o.voided =0
																		and o.concept_id in(1193,1252,5622,1191,1255,1268)
								inner join
								(
									select encounter_type, uuid,name from  openmrs.form where
										uuid in('da687480-e197-11e8-9f32-f2801f1b9fd1')
								) f on f.encounter_type=e.encounter_type 
						WHERE e.encounter_datetime < DATE_ADD(@reportingdate, INTERVAL 1 DAY)
						group by e.encounter_id,o.value_coded
					)regimens 
					left join(
						select firstregimen.person_id,firstregimen.obs_datetime,
							case when secondregimen.drugname IS NOT NULL and thirdregimen.drugname IS NOT NULL THEN CONCAT(firstregimen.drugname,'/',secondregimen.drugname,'/',thirdregimen.drugname)
							when secondregimen.drugname IS NOT NULL and thirdregimen.drugname IS NULL THEN CONCAT(firstregimen.drugname,'/',secondregimen.drugname)
							else firstregimen.drugname end as regimen from(
								SELECT * FROM(
								SELECT row_number() over (PARTITION BY t.person_id ORDER BY t.person_id asc,t.obs_datetime DESC) AS rownumber
									   ,t.*
									FROM (
										select o.person_id,o.obs_datetime,o.value_coded,cn.name as drugname from openmrs.obs o left join 
										(select * from openmrs.concept_name where locale = 'en' and concept_name_type='FULLY_SPECIFIED')cn
										on o.value_coded = cn.concept_id
										where o.concept_id = 1088
									) t
								)alldata WHERE rownumber = 1
							)firstregimen 
							left join(
								SELECT * FROM(
								SELECT row_number() over (PARTITION BY t.person_id ORDER BY t.person_id asc,t.obs_datetime DESC) AS rownumber
									   ,t.*
									FROM (
										select o.person_id,o.obs_datetime,o.value_coded,cn.name as drugname from openmrs.obs o left join 
										(select * from openmrs.concept_name where locale = 'en' and concept_name_type='FULLY_SPECIFIED')cn
										on o.value_coded = cn.concept_id
										where o.concept_id = 1088
									) t
								)alldata WHERE rownumber = 2
							)secondregimen on firstregimen.person_id = secondregimen.person_id and firstregimen.obs_datetime = secondregimen.obs_datetime
							left join(
								SELECT * FROM(
								SELECT row_number() over (PARTITION BY t.person_id ORDER BY t.person_id asc,t.obs_datetime DESC) AS rownumber
									   ,t.*
									FROM (
										select o.person_id,o.obs_datetime,o.value_coded,cn.name as drugname from openmrs.obs o left join 
										(select * from openmrs.concept_name where locale = 'en' and concept_name_type='FULLY_SPECIFIED')cn
										on o.value_coded = cn.concept_id
										where o.concept_id = 1088
									) t
								)alldata WHERE rownumber = 3
							)thirdregimen on firstregimen.person_id = thirdregimen.person_id and firstregimen.obs_datetime = thirdregimen.obs_datetime
					)unstandardregimens on unstandardregimens.person_id = regimens.patient_id
					LEFT JOIN(
						SELECT * FROM  openmrs.patient_identifier WHERE identifier_type = 
                        (select patient_identifier_type_id from patient_identifier_type where name = 'Unique Patient Number')
					)pids ON pids.patient_id = regimens.patient_id
					)regimendetails WHERE regimen IS NOT null 
					and regimen not in ('RHZE','RHZ','SRHZE','RfbHZE','RfbHZ','SRfbHZE','S (1 gm vial)','E','RHE','EH')
					GROUP BY patient_id, encounter_datetime,identifier,program,regimen,regimen_name,regimen_line,value_coded
                    ORDER BY encounter_datetime
					) t
					)reg  where rownumber = 1
			)artstatus ON artstatus.patient_id = activeclients.person_id
			WHERE 
			(exits.patient_id IS NULL or (exits.patient_id IS NOT NULL 
			and ExitDate < activeclients.LastVisitDate)
			OR (exits.ExitReason = 'Transferred out' and exits.effective_discontinuation_date > @reportingdate))
			and artstatus.encounter_datetime IS NOT NULL
            and identifier is not null
			ORDER BY activeclients.person_id ASC)alldata