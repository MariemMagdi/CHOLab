DROP DATABASE IF EXISTS `chemistry_lab`;
CREATE DATABASE `chemistry_lab`;
USE `chemistry_lab`;
SET NAMES utf8;

CREATE TABLE `patient`(
	`user_name` VARCHAR(50) UNIQUE NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `password` VARCHAR(50) NOT NULL,
    `sex` CHAR(1) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `insurance_no` VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY(`user_name`)
);


CREATE TABLE `equipment`(
	`equipment_id` VARCHAR(255) NOT NULL,
    `equipment_name` VARCHAR(50) NOT NULL,
    `maintenance_date` DATE NOT NULL,
    `manufacturer` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`equipment_id`)
);


CREATE TABLE `test`(
	`test_id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `duration` VARCHAR(50) NOT NULL,
    `equipment_id` VARCHAR(255) NOT NULL,
    `pricing` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY(`test_id`),
    FOREIGN KEY(`equipment_id`) REFERENCES equipment (`equipment_id`)
);


CREATE TABLE `booking`(
	`patient_user_name` VARCHAR(50) UNIQUE NOT NULL,
    `test_id` INT NOT NULL,
    `booking_no` INT NOT NULL,
    `booking_date` DATE NOT NULL,
    `test_result` VARCHAR(255) DEFAULT NULL,
    FOREIGN KEY(`patient_user_name`) REFERENCES patient (`user_name`),
	FOREIGN KEY(`test_id`) REFERENCES test (`test_id`)
);


CREATE TABLE `staff`(
    `name` VARCHAR(50) NOT NULL,
    `birthdate` DATE NOT NULL,
    `sex` CHAR(1) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(20) NOT NULL,
    `ESSN` VARCHAR(50) UNIQUE NOT NULL,
    `salary` DECIMAL(10,2) NOT NULL,
    `job_title` VARCHAR(50) NOT NULL,
    `department_number` VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (`ESSN`)
);


CREATE TABLE `department`(
    `department_no` VARCHAR(50) UNIQUE NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `head_SSN` VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (`department_no`),
    FOREIGN KEY (`head_SSN`) REFERENCES staff (`ESSN`)
);


ALTER TABLE staff
ADD CONSTRAINT FOREIGN KEY (`department_number`) REFERENCES department (`department_no`);
