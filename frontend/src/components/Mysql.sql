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



