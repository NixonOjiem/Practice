DROP DATABASE IF EXISTS `test_database`;

CREATE DATABASE `test_database`;

USE test_database;

CREATE TABLE location_data(
    id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(255) NOT NULL,
    latitude DECIMAL(10,8) NOT NULL,
    longitude DECIMAL(11,8) NOT NULL
);


INSERT INTO location_data(location_name, latitude, longitude)
VALUES
('New York', 40.7128, -74.0060),
('Los Angeles', 34.0522, -118.2437),
('Chicago', 41.8781, -87.6298);

DESCRIBE location_data;

SELECT * FROM test_database.location_data;

SELECT location_name FROM test_database.location_data;

DROP TABLE IF EXISTS `appframework_component_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appframework_component_state` (
  `component_state_id` int NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `component_id` varchar(255) NOT NULL,
  `component_type` varchar(50) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`component_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;