USE openmrs;

SELECT name, start_time, date_created FROM openmrs.appointment_service;

SELECT concept_id  FROM openmrs.orders WHERE order_id=112979;

CREATE TABLE `allergy_reaction` (
  allergy_reaction_id int NOT NULL AUTO_INCREMENT,
  allergy_id int NOT NULL,
  reaction_concept_id int NOT NULL,
  reaction_non_coded varchar(255) DEFAULT NULL,
  uuid char(38) DEFAULT NULL,
  PRIMARY KEY (allergy_reaction_id),
  UNIQUE KEY allergy_reaction_id (allergy_reaction_id),
  KEY allergy_reaction_allergy_id_fk (allergy_id),
  KEY allergy_reaction_reaction_concept_id_fk (reaction_concept_id)
) 
CREATE TABLE `appointment_service` (
  `appointment_service_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `speciality_id` int DEFAULT NULL,
  `max_appointments_limit` int DEFAULT NULL,
  `duration_mins` int DEFAULT NULL,
  `color` varchar(8) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `creator` int NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int DEFAULT NULL,
  `voided` tinyint(1) DEFAULT '0',
  `voided_by` int DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` varchar(38) NOT NULL,
  `initial_appointment_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`appointment_service_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fk_appointment_service_speciality_idx` (`speciality_id`),
  KEY `fk_appointment_service_location_idx` (`location_id`),
  CONSTRAINT `fk_appointment_service_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_appointment_service_speciality` FOREIGN KEY (`speciality_id`) REFERENCES `appointment_speciality` (`speciality_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
