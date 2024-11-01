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

