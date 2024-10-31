USE openmrs;

SELECT name, start_time, date_created FROM openmrs.appointment_service;

SELECT concept_id  FROM openmrs.orders WHERE order_id=112979;