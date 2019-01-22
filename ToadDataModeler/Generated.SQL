/*
Created: 1/14/2019
Modified: 1/21/2019
Model: JerseyNationalBank
Database: MySQL 5.7
*/


-- Create tables section -------------------------------------------------

-- Table person

CREATE TABLE `person`
(
  `person_id` Char(20) NOT NULL,
  `start_date` Date,
  `name_first` Char(20),
  `name_last` Char(20),
  `name_middle` Char(20),
  `titlle` Char(2),
  `social_security_number` Int(9) NOT NULL
)
;

ALTER TABLE `person` ADD PRIMARY KEY (`person_id`)
;

ALTER TABLE `person` ADD UNIQUE `person_id` (`person_id`)
;

ALTER TABLE `person` ADD UNIQUE `social_security_number` (`social_security_number`)
;

-- Table employee

CREATE TABLE `employee`
(
  `branch_id` Char(20) NOT NULL,
  `person_id` Char(20) NOT NULL,
  `salary` Char(20),
  `open_hours_name` Char(20) NOT NULL
)
;

ALTER TABLE `employee` ADD PRIMARY KEY (`person_id`,`branch_id`,`open_hours_name`)
;

-- Table customer

CREATE TABLE `customer`
(
  `person_id` Char(20) NOT NULL,
  `cutomert_number` Char(20)
)
;

ALTER TABLE `customer` ADD PRIMARY KEY (`person_id`)
;

-- Table phone_employee

CREATE TABLE `phone_employee`
(
  `person_id` Char(20) NOT NULL,
  `phone_id` Char(20) NOT NULL
)
;

ALTER TABLE `phone_employee` ADD PRIMARY KEY (`person_id`,`phone_id`)
;

-- Table phone

CREATE TABLE `phone`
(
  `phone_id` Char(20) NOT NULL,
  `telephone_number` Char(20),
  `telephone_area_code` Char(20)
)
;

ALTER TABLE `phone` ADD PRIMARY KEY (`phone_id`)
;

ALTER TABLE `phone` ADD UNIQUE `phone_id` (`phone_id`)
;

-- Table branch

CREATE TABLE `branch`
(
  `branch_id` Char(20) NOT NULL,
  `branch_name` Char(20),
  `phone_number` Char(20),
  `address1` Char(20),
  `address2` Char(20),
  `city` Char(20),
  `state` Char(20),
  `zip_code` Char(20),
  `open_hours_name` Char(20) NOT NULL
)
;

ALTER TABLE `branch` ADD PRIMARY KEY (`branch_id`,`open_hours_name`)
;

ALTER TABLE `branch` ADD UNIQUE `open_hours_name` (`open_hours_name`)
;

-- Table open_hours

CREATE TABLE `open_hours`
(
  `open_hours_id` Char(20) NOT NULL,
  `open_hours_name` Char(20) NOT NULL,
  `open_time` Char(20),
  `close_time` Char(20),
  `day_of_week` Char(20)
)
;

CREATE INDEX `open_hours_name` ON `open_hours` (`open_hours_name`)
;

ALTER TABLE `open_hours` ADD PRIMARY KEY (`open_hours_name`,`open_hours_id`)
;

-- Table email

CREATE TABLE `email`
(
  `email_id` Int(11) NOT NULL,
  `person_id` Char(20) NOT NULL,
  `is_primary` Char(1),
  `email_domain_id` Char(20)
)
;

CREATE INDEX `email_domain_index` ON `email` (`email_domain_id`)
;

ALTER TABLE `email` ADD PRIMARY KEY (`email_id`,`person_id`)
;

-- Table email_domin

CREATE TABLE `email_domin`
(
  `email_domain_id` Char(20) NOT NULL,
  `domain` Char(20)
)
;

ALTER TABLE `email_domin` ADD PRIMARY KEY (`email_domain_id`)
;

ALTER TABLE `email_domin` ADD UNIQUE `email_domain_id` (`email_domain_id`)
;

-- Table questions

CREATE TABLE `questions`
(
  `person_id` Char(20) NOT NULL,
  `questions_id` Char(20),
  `statement` Char(20),
  `statement_create_date` Char(20),
  `statement_responce_date` Char(20),
  `question_category_id` Char(20)
)
;

CREATE INDEX `question_category_index` ON `questions` (`question_category_id`)
;

ALTER TABLE `questions` ADD PRIMARY KEY (`person_id`)
;

-- Table question_category

CREATE TABLE `question_category`
(
  `question_category_id` Char(20) NOT NULL,
  `category_name` Char(20)
)
;

ALTER TABLE `question_category` ADD PRIMARY KEY (`question_category_id`)
;

ALTER TABLE `question_category` ADD UNIQUE `question_category_id` (`question_category_id`)
;

-- Table credit_card

CREATE TABLE `credit_card`
(
  `person_id` Char(20) NOT NULL,
  `credit_card_number` Char(20),
  `expire_date` Char(20),
  `code` Char(20)
)
;

ALTER TABLE `credit_card` ADD PRIMARY KEY (`person_id`)
;

-- Table account

CREATE TABLE `account`
(
  `person_id` Char(20) NOT NULL,
  `type_code` Char(20) NOT NULL,
  `account_type` Char(20),
  `amount` Decimal(10,2)
)
;

ALTER TABLE `account` ADD PRIMARY KEY (`person_id`,`type_code`)
;

-- Table account_types

CREATE TABLE `account_types`
(
  `type_code` Char(20) NOT NULL,
  `account_display_name` Char(20)
)
;

ALTER TABLE `account_types` ADD PRIMARY KEY (`type_code`)
;

-- Table Login

CREATE TABLE `Login`
(
  `person_id` Char(20) NOT NULL,
  `user_name` Char(20),
  `password` Char(20)
)
;

ALTER TABLE `Login` ADD PRIMARY KEY (`person_id`)
;

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE `employee` ADD CONSTRAINT `Bank Employee` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `customer` ADD CONSTRAINT `Bank Customer` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `phone_employee` ADD CONSTRAINT `Employees Telephone No` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `phone_employee` ADD CONSTRAINT `Phone Number` FOREIGN KEY (`phone_id`) REFERENCES `phone` (`phone_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `employee` ADD CONSTRAINT `Branch Employee Work At` FOREIGN KEY (`branch_id`, `open_hours_name`) REFERENCES `branch` (`branch_id`, `open_hours_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `email` ADD CONSTRAINT `Person Email` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `questions` ADD CONSTRAINT `Person Submited Questions` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `credit_card` ADD CONSTRAINT `Credit Card` FOREIGN KEY (`person_id`) REFERENCES `customer` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `account` ADD CONSTRAINT `Account` FOREIGN KEY (`person_id`) REFERENCES `customer` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `account` ADD CONSTRAINT `Account Type` FOREIGN KEY (`type_code`) REFERENCES `account_types` (`type_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `email` ADD CONSTRAINT `Domain Part of the Email Address` FOREIGN KEY (`email_domain_id`) REFERENCES `email_domin` (`email_domain_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `questions` ADD CONSTRAINT `Question Category` FOREIGN KEY (`question_category_id`) REFERENCES `question_category` (`question_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `Login` ADD CONSTRAINT `Login to the Website` FOREIGN KEY (`person_id`) REFERENCES `customer` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `open_hours` ADD CONSTRAINT `Open Hours` FOREIGN KEY (`open_hours_name`) REFERENCES `branch` (`open_hours_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


open_hours