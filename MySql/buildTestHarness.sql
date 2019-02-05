CREATE SCHEMA `bank` ;

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
  `person_id` Char(20) NOT NULL,
  `salary` Char(20),
  `branch_id` Char(20)
)
;

CREATE INDEX `employee_index` ON `employee` (`branch_id`)
;

ALTER TABLE `employee` ADD PRIMARY KEY (`person_id`)
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
  `line_number` Char(4),
  `phone_area_code_id` Char(20)
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

ALTER TABLE `branch` ADD PRIMARY KEY (`branch_id`)
;

-- Table open_hours

CREATE TABLE `open_hours`
(
  `open_hours_id` Char(20) NOT NULL,
  `open_hours_name` Char(20) NOT NULL,
  `open_time` Char(20),
  `close_time` Char(20),
  `day_of_week` Char(20),
  `branch_id` Char(20)
)
;

CREATE INDEX `open_hours_name` ON `open_hours` (`branch_id`)
;

ALTER TABLE `open_hours` ADD PRIMARY KEY (`open_hours_id`)
;

-- Table email

CREATE TABLE `email`
(
  `email_id` Int(11) NOT NULL,
  `person_id` Char(20) NOT NULL,
  `is_primary` Char(1),
  `email` Char(20),
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
  `statement` Char(225),
  `statement_create_date` Date,
  `question_category_id` Char(20),
  `answer_id` Char(20)
)
;

CREATE INDEX `question_category_index` ON `questions` (`question_category_id`)
;

CREATE INDEX `IX_Relationship2` ON `questions` (`answer_id`)
;

ALTER TABLE `questions` ADD PRIMARY KEY (`person_id`)
;

-- Table question_category

CREATE TABLE `question_category`
(
  `question_category_id` Char(20) NOT NULL,
  `category_name` Char(50) NOT NULL,
  `sub_category_name` Char(100) NOT NULL
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
  `credit_card_number` Char(16) NOT NULL,
  `expire_date` Date NOT NULL,
  `code` Char(3) NOT NULL
)
;

ALTER TABLE `credit_card` ADD PRIMARY KEY (`person_id`)
;

ALTER TABLE `credit_card` ADD UNIQUE `credit_card_number` (`credit_card_number`)
;

-- Table account

CREATE TABLE `account`
(
  `person_id` Char(20) NOT NULL,
  `amount` Decimal(10,2),
  `type_code` Char(20)
)
;

ALTER TABLE `account` ADD PRIMARY KEY (`person_id`)
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

-- Table phone_area_code

CREATE TABLE `phone_area_code`
(
  `phone_area_code_id` Char(20) NOT NULL,
  `area_code` Char(3) NOT NULL,
  `prefix` Char(3) NOT NULL
)
;

ALTER TABLE `phone_area_code` ADD PRIMARY KEY (`phone_area_code_id`)
;

ALTER TABLE `phone_area_code` ADD UNIQUE `phone_area_code_id` (`phone_area_code_id`)
;

ALTER TABLE `phone_area_code` ADD UNIQUE `area_code` (`area_code`)
;

ALTER TABLE `phone_area_code` ADD UNIQUE `prefix` (`prefix`)
;

-- Table answer

CREATE TABLE `answer`
(
  `answer_id` Char(20) NOT NULL,
  `statement` Char(225),
  `responce_date` Date
)
;

ALTER TABLE `answer` ADD PRIMARY KEY (`answer_id`)
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


ALTER TABLE `email` ADD CONSTRAINT `Person Email` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `questions` ADD CONSTRAINT `Person Submited Questions` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `credit_card` ADD CONSTRAINT `Credit Card` FOREIGN KEY (`person_id`) REFERENCES `customer` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `account` ADD CONSTRAINT `Account` FOREIGN KEY (`person_id`) REFERENCES `customer` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `email` ADD CONSTRAINT `Domain Part of the Email Address` FOREIGN KEY (`email_domain_id`) REFERENCES `email_domin` (`email_domain_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `questions` ADD CONSTRAINT `Question Category` FOREIGN KEY (`question_category_id`) REFERENCES `question_category` (`question_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `Login` ADD CONSTRAINT `Login to the Website` FOREIGN KEY (`person_id`) REFERENCES `customer` (`person_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `open_hours` ADD CONSTRAINT `Open Hours` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `employee` ADD CONSTRAINT `Worker` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `phone` ADD CONSTRAINT `area_code` FOREIGN KEY (`phone_area_code_id`) REFERENCES `phone_area_code` (`phone_area_code_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `questions` ADD CONSTRAINT `Answer` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`answer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `account` ADD CONSTRAINT `account types` FOREIGN KEY (`type_code`) REFERENCES `account_types` (`type_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('016', '2019-01-06', 'Amanda', 'Rogers', 'Jolie', 'Ms', 123456774);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('017', '2019-01-05', 'Lisa', 'Cook', 'Mira', 'Ms', 123456773);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('018', '2019-01-04', 'Tyrell', 'Coleman', 'Krish', 'Mr', 123456772);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('019', '2019-01-03', 'Holly', 'White', 'Britney', 'Ms', 123456771);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('020', '2019-01-02', 'Gordon', 'Watson', 'Nash', 'Mr', 123456770);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('021', '2019-02-25', 'Amber', ' Hayes', 'Arianna', 'Ms', 123456745);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('022', '2019-02-01', 'Madison', 'Price', 'Morgan', 'Ms', 123456769);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('023', '2019-02-02', 'Emma', 'Bennett', 'Julia', 'Ms', 123456768);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('024', '2019-02-03', 'Hannah', 'Wood', 'Destiny', 'Ms', 123456767);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('025', '2019-02-04', 'Olivia', 'Barnes', 'Rachel', 'Ms', 123456766);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('026', '2019-02-05', 'Abigail', 'Ross', 'Megan', 'Ms', 123456765);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('027', '2019-02-06', 'Isabella', 'Henderson', 'Kaitlyn', 'Ms', 123456764);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('028', '2019-02-07', 'Ashley', 'Coleman', 'Katherine', 'Ms', 123456763);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('029', '2019-02-08', 'Samantha', 'Jenkins', 'Jennifer', 'Ms', 123456762);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('030', '2019-02-09', 'Elizabeth', 'Perry', 'Savannah', 'Ms', 123456761);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('031', '2019-02-10', 'Alexis', 'Powell', 'Ella', 'Ms', 123456760);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('032', '2019-02-11', 'Sarah', 'Long', 'Alexandra', 'Ms', 123456759);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('033', '2019-02-12', 'Alyssa', 'Patterson', 'Haley', 'Ms', 123456758);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('034', '2019-02-13', 'Grace', 'Hughes', 'Allison', 'Ms', 123456757);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('035', '2019-02-14', 'Sophia', 'Flores', 'Maria', 'Ms', 123456756);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('036', '2019-02-15', 'Taylor', 'Washington', 'Nicole', 'Ms', 123456755);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('037', '2019-02-16', 'Brianna', 'Butler', 'Mackenzie', 'Ms', 123456754);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('038', '2019-02-17', 'Lauren', 'Simmons', 'Brooke', 'Ms', 123456753);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('039', '2019-02-18', 'Ava', 'Foster', 'Makayla', 'Ms', 123456752);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('040', '2019-02-19', 'Kayla', 'Gonzales', 'Kaylee', 'Ms', 123456751);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('041', '2019-02-20', 'Jessica', 'Bryant', 'Lily', 'Ms', 123456750);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('042', '2019-02-21', 'Natalie', 'Alexander', 'Stephanie', 'Ms', 123456749);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('043', '2019-02-22', 'Chloe
', 'Russell', 'Danielle', 'Ms', 123456748);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('044', '2019-02-23', 'Anna', 'Griffin', 'Bailey', 'Ms', 123456747);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('045', '2019-02-24', 'Victoria', 'Diaz', 'Isabel', 'Ms', 123456746);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('E001', '2019-01-21', 'John', 'Smith', 'Tim', 'Mr', 123456789);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('E002', '2019-01-20', 'Joey', 'Johnson', 'Dax', 'Mr', 123456788);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('E003', '2019-01-19', 'Sam', 'Williams', 'Jake', 'Mr', 123456787);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('E004', '2019-01-18', 'Ryann', 'Jones', 'Tyson', 'Mr', 123456786);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('E005', '2019-01-17', 'Ty', 'Brown', 'Russell', 'Mr', 123456785);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('E006', '2019-01-16', 'Kate', 'Davis', 'Ann', 'Ms', 123456784);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('E007', '2019-01-15', 'Howard', 'Miller', 'Olive', 'Mr', 123456783);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('E008', '2019-01-14', 'Robert', 'Hall', 'Justin', 'Mr', 123456782);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('E009', '2019-01-13', 'Susan', 'Allen', 'Racheal', 'Ms', 123456781);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('E010', '2019-01-12', 'Tori', 'Young', 'Vanessa', 'Ms', 123456780);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('E011', '2019-01-11', 'Hillary', 'Cook', 'Aliyah', 'Ms', 123456779);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('E012', '2019-01-10', 'Mia', 'King', 'Shayna', 'Ms', 123456778);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('E013', '2019-01-09', 'Joslyn', 'Stewart', 'Miranda', 'Ms', 123456777);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('E014', '2019-01-08', 'Joel', 'Wood', 'Mike', 'Mr', 123456776);
INSERT INTO bank.person (person_id, start_date, name_first, name_last, name_middle, titlle, social_security_number) VALUES ('E015', '2019-01-07', 'Donald', 'Ross', 'Logan', 'Mr', 123456775);

INSERT INTO bank.branch (branch_id, branch_name, phone_number, address1, address2, city, state, zip_code, open_hours_name) VALUES ('001', 'Minnepolis Dowtown W', '(612) 667 - 8970', '80 South 8th St', 'suit 493', 'Minneapolis', 'MN', '55402', 'STANDARD');
INSERT INTO bank.branch (branch_id, branch_name, phone_number, address1, address2, city, state, zip_code, open_hours_name) VALUES ('002', 'Atlanta Downtown N', '(404) 231-4100', '3880 Roswell Rd NE', 'suit 102', 'Atlanta', 'GA', '30342', 'LONG');
INSERT INTO bank.branch (branch_id, branch_name, phone_number, address1, address2, city, state, zip_code, open_hours_name) VALUES ('003', 'Surprise Downtown', '(623) 546-2500', '13752 W Waddell Rd', 'suit 302', 'Surprise', 'AZ', '85379', 'LONG');

INSERT INTO bank.open_hours (open_hours_id, open_hours_name, open_time, close_time, day_of_week, branch_id) VALUES ('001', 'STANDARD', '9:00 AM', '5:00 PM', 'Monday', '001');
INSERT INTO bank.open_hours (open_hours_id, open_hours_name, open_time, close_time, day_of_week, branch_id) VALUES ('002', 'STANDARD', '9:00 AM', '5:00 PM', 'Tuesday', '001');
INSERT INTO bank.open_hours (open_hours_id, open_hours_name, open_time, close_time, day_of_week, branch_id) VALUES ('003', 'STANDARD', '9:00 AM', '5:00 PM', 'Wedneday', '001');
INSERT INTO bank.open_hours (open_hours_id, open_hours_name, open_time, close_time, day_of_week, branch_id) VALUES ('004', 'STANDARD', '9:00 AM', '5:00 PM', 'Thursday', '001');
INSERT INTO bank.open_hours (open_hours_id, open_hours_name, open_time, close_time, day_of_week, branch_id) VALUES ('005', 'STANDARD', '9:00 AM', '5:00 PM', 'Friday', '001');
INSERT INTO bank.open_hours (open_hours_id, open_hours_name, open_time, close_time, day_of_week, branch_id) VALUES ('006', 'STANDARD', '11:00 AM', '3:00 PM', 'Saturday', '001');
INSERT INTO bank.open_hours (open_hours_id, open_hours_name, open_time, close_time, day_of_week, branch_id) VALUES ('007', 'LONG', '9:00 AM', '9:00 PM', 'Monday', '002');
INSERT INTO bank.open_hours (open_hours_id, open_hours_name, open_time, close_time, day_of_week, branch_id) VALUES ('008', 'LONG', '9:00 AM', '9:00 PM', 'Tuesday', '002');
INSERT INTO bank.open_hours (open_hours_id, open_hours_name, open_time, close_time, day_of_week, branch_id) VALUES ('009', 'LONG', '9:00 AM', '9:00 PM', 'Wedneday', '002');
INSERT INTO bank.open_hours (open_hours_id, open_hours_name, open_time, close_time, day_of_week, branch_id) VALUES ('010', 'LONG', '9:00 AM', '9:00 PM', 'Thursday', '002');
INSERT INTO bank.open_hours (open_hours_id, open_hours_name, open_time, close_time, day_of_week, branch_id) VALUES ('011', 'LONG', '9:00 AM', '9:00 PM', 'Friday', '002');
INSERT INTO bank.open_hours (open_hours_id, open_hours_name, open_time, close_time, day_of_week, branch_id) VALUES ('012', 'LONG', '6:00 AM', '9:00 PM', 'Saturday', '002');
INSERT INTO bank.open_hours (open_hours_id, open_hours_name, open_time, close_time, day_of_week, branch_id) VALUES ('013', 'LONG', '6:00 AM', '9:00 PM', 'Sunday', '002');
INSERT INTO bank.open_hours (open_hours_id, open_hours_name, open_time, close_time, day_of_week, branch_id) VALUES ('014', 'SHORT', '11:00 AM', '3:00 PM', 'Saturday', '003');
INSERT INTO bank.open_hours (open_hours_id, open_hours_name, open_time, close_time, day_of_week, branch_id) VALUES ('015', 'SHORT', '11:00 AM', '3:00 PM', 'Sunday', '003');

INSERT INTO bank.employee (person_id, salary, branch_id) VALUES ('E001', '20001', '001');
INSERT INTO bank.employee (person_id, salary, branch_id) VALUES ('E002', '20002', '001');
INSERT INTO bank.employee (person_id, salary, branch_id) VALUES ('E003', '20003', '001');
INSERT INTO bank.employee (person_id, salary, branch_id) VALUES ('E004', '20004', '002');
INSERT INTO bank.employee (person_id, salary, branch_id) VALUES ('E005', '20005', '002');
INSERT INTO bank.employee (person_id, salary, branch_id) VALUES ('E006', '20006', '001');
INSERT INTO bank.employee (person_id, salary, branch_id) VALUES ('E007', '20007', '002');
INSERT INTO bank.employee (person_id, salary, branch_id) VALUES ('E008', '20008', '002');
INSERT INTO bank.employee (person_id, salary, branch_id) VALUES ('E009', '20009', '002');
INSERT INTO bank.employee (person_id, salary, branch_id) VALUES ('E010', '20010', '003');
INSERT INTO bank.employee (person_id, salary, branch_id) VALUES ('E011', '20011', '002');
INSERT INTO bank.employee (person_id, salary, branch_id) VALUES ('E012', '20012', '002');
INSERT INTO bank.employee (person_id, salary, branch_id) VALUES ('E013', '20013', '001');
INSERT INTO bank.employee (person_id, salary, branch_id) VALUES ('E014', '20014', '001');
INSERT INTO bank.employee (person_id, salary, branch_id) VALUES ('E015', '20015', '001');

INSERT INTO bank.phone_area_code (phone_area_code_id, area_code, prefix) VALUES ('001', '612', '667');
INSERT INTO bank.phone_area_code (phone_area_code_id, area_code, prefix) VALUES ('002', '404', '231');
INSERT INTO bank.phone_area_code (phone_area_code_id, area_code, prefix) VALUES ('003', '623', '546');

INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('001', '0001', '001');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('002', '0002', '001');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('003', '0003', '001');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('004', '0004', '001');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('005', '0005', '001');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('006', '0006', '001');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('007', '0007', '001');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('008', '0008', '001');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('009', '0009', '001');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('010', '0010', '001');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('011', '0011', '002');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('012', '0012', '002');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('013', '0013', '002');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('014', '0014', '002');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('015', '0015', '002');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('016', '0016', '002');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('017', '0017', '002');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('018', '0018', '002');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('019', '0019', '002');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('020', '0020', '002');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('021', '0021', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('022', '0022', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('023', '0023', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('024', '0024', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('025', '0025', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('026', '0026', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('027', '0027', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('028', '0028', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('029', '0029', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('030', '0030', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('031', '0031', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('032', '0032', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('033', '0033', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('034', '0034', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('035', '0035', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('036', '0036', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('037', '0037', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('038', '0038', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('039', '0039', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('040', '0040', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('041', '0041', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('042', '0042', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('043', '0043', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('044', '0044', '003');
INSERT INTO bank.phone (phone_id, line_number, phone_area_code_id) VALUES ('045', '0045', '003');

INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('001', '001');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('002', '002');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('003', '003');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('004', '004');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('005', '005');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('006', '006');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('007', '007');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('008', '008');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('009', '009');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('010', '010');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('011', '011');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('012', '012');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('013', '013');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('014', '014');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('015', '015');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('016', '016');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('017', '017');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('018', '018');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('019', '019');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('020', '020');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('021', '021');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('022', '022');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('023', '023');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('024', '024');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('025', '025');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('026', '026');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('027', '027');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('028', '028');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('029', '029');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('030', '030');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('031', '031');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('032', '032');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('033', '033');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('034', '034');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('035', '035');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('036', '036');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('037', '037');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('038', '038');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('039', '039');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('040', '040');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('041', '041');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('042', '042');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('043', '043');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('044', '044');
INSERT INTO bank.phone_employee (person_id, phone_id) VALUES ('045', '045');

INSERT INTO bank.email_domin (email_domain_id, domain) VALUES ('001', 'jnb.com');
INSERT INTO bank.email_domin (email_domain_id, domain) VALUES ('002', 'gmail.com');
INSERT INTO bank.email_domin (email_domain_id, domain) VALUES ('003', 'hotmail.com');
INSERT INTO bank.email_domin (email_domain_id, domain) VALUES ('004', 'yahoo.com');
INSERT INTO bank.email_domin (email_domain_id, domain) VALUES ('005', 'outlook.com');
INSERT INTO bank.email_domin (email_domain_id, domain) VALUES ('006', 'mail.com');

INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (1, '001', 'Y', 'john.smith', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (2, '002', 'Y', 'joey.johnson', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (3, '003', 'Y', 'sam.williams', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (4, '004', 'Y', 'ryann.jones', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (5, '005', 'Y', 'ty.brown', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (6, '006', 'Y', 'kate.davis', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (7, '007', 'Y', 'howard.miller', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (8, '008', 'Y', 'robert.hall', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (9, '009', 'Y', 'susan.allen', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (10, '010', 'Y', 'tori.young', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (11, '011', 'Y', 'hillary.cook', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (12, '012', 'Y', 'mia.king', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (13, '013', 'Y', 'joslyn.stewart', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (14, '014', 'Y', 'joel.wood', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (15, '015', 'Y', 'donald.ross', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (16, '016', 'Y', 'amanda.rogers', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (17, '017', 'Y', 'lisa.cook', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (18, '018', 'Y', 'tyrell.coleman', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (19, '019', 'Y', 'holly.white', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (20, '020', 'Y', 'gordon.watson', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (21, '021', 'Y', 'amber.hayes', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (22, '022', 'Y', 'madison.price', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (23, '023', 'Y', 'emma.bennett', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (24, '024', 'Y', 'hannah.wood', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (25, '025', 'Y', 'olivia.barnes', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (26, '026', 'Y', 'abigail.ross', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (27, '027', 'Y', 'isabella.henderson', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (28, '028', 'Y', 'ashley.coleman', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (29, '029', 'Y', 'samantha.jenkins', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (30, '030', 'Y', 'elizabeth.perry', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (31, '031', 'Y', 'alexis.powell', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (32, '032', 'Y', 'sarah.long', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (33, '033', 'Y', 'alyssa.patterson', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (34, '034', 'Y', 'grace.hughes', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (35, '035', 'Y', 'sophia.flores', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (36, '036', 'Y', 'taylor.washington', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (37, '037', 'Y', 'brianna.butler', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (38, '038', 'Y', 'lauren.simmons', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (39, '039', 'Y', 'ava.foster', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (40, '040', 'Y', 'kayla.gonzales', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (41, '041', 'Y', 'jessica.bryant', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (42, '042', 'Y', 'natalie.alexander', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (43, '043', 'Y', 'chloe.russell', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (44, '044', 'Y', 'anna.griffin', '001');
INSERT INTO bank.email (email_id, person_id, is_primary, email, email_domain_id) VALUES (45, '045', 'Y', 'victoria.diaz', '001');

INSERT INTO bank.question_category (question_category_id, category_name, sub_category_name) VALUES ('AM_BC', 'Asset Management', 'Bank Custodians');
INSERT INTO bank.question_category (question_category_id, category_name, sub_category_name) VALUES ('AM_CIF', 'Asset Management', 'Collective Investment Funds');
INSERT INTO bank.question_category (question_category_id, category_name, sub_category_name) VALUES ('CC_CCD', 'Credit Cards', 'Credit Card Disputes');
INSERT INTO bank.question_category (question_category_id, category_name, sub_category_name) VALUES ('CC_CCF', 'Credit Cards', 'Credit Card Fees');

INSERT INTO bank.answer (answer_id, statement, responce_date) VALUES ('001', 'You must notify the bank by notice in writing.', '2019-02-04');
INSERT INTO bank.answer (answer_id, statement, responce_date) VALUES ('002', 'Generally, if you have filed a proper billing dispute with the bank no.', '2019-02-04');
INSERT INTO bank.answer (answer_id, statement, responce_date) VALUES ('003', 'A bank custodian is responsible for maintaining the safety of clients'' assets held at one of the custodian''s premises and outside depository.', '2019-02-04');
INSERT INTO bank.answer (answer_id, statement, responce_date) VALUES ('004', 'A bank custodian that provides core domestic custody services typically settles trades and reporting services.', '2019-02-04');
INSERT INTO bank.answer (answer_id, statement, responce_date) VALUES ('005', 'No. The funds invested in a CIF are not guaranteed either by the bank offering the fund or by the FDIC', '2019-02-04');
INSERT INTO bank.answer (answer_id, statement, responce_date) VALUES ('006', 'A CIF is established and maintained in accordance with a written plan.', '2019-02-04');
INSERT INTO bank.answer (answer_id, statement, responce_date) VALUES ('007', 'Yes, if your payment is late.', '2019-02-04');
INSERT INTO bank.answer (answer_id, statement, responce_date) VALUES ('008', 'The bank can only charge you an over-the-limit fee if you have not agreed to participate in its over-the-limit coverage program.', '2019-02-04');

INSERT INTO bank.questions (person_id, questions_id, statement, statement_create_date, question_category_id, answer_id) VALUES ('016', '001', 'What do I do if I dispute a charge on my credit card account?', '2019-02-05', 'CC_CCD', '001');
INSERT INTO bank.questions (person_id, questions_id, statement, statement_create_date, question_category_id, answer_id) VALUES ('017', '002', 'Can the bank apply late fees and interest while my billing dispute is being investigated?', '2019-02-05', 'CC_CCD', '002');
INSERT INTO bank.questions (person_id, questions_id, statement, statement_create_date, question_category_id, answer_id) VALUES ('018', '003', 'What is a bank custodian?', '2019-02-05', 'AM_BC', '003');
INSERT INTO bank.questions (person_id, questions_id, statement, statement_create_date, question_category_id, answer_id) VALUES ('019', '004', 'What services are provided by bank custodians?', '2019-02-05', 'AM_BC', '004');
INSERT INTO bank.questions (person_id, questions_id, statement, statement_create_date, question_category_id, answer_id) VALUES ('020', '005', 'Is my money guaranteed in a Collective Investment Fund (CIF)?', '2019-02-05', 'AM_CIF', '005');
INSERT INTO bank.questions (person_id, questions_id, statement, statement_create_date, question_category_id, answer_id) VALUES ('021', '006', 'How do I know what securities are owned by my CIF?', '2019-02-05', 'AM_CIF', '006');
INSERT INTO bank.questions (person_id, questions_id, statement, statement_create_date, question_category_id, answer_id) VALUES ('022', '007', 'Can the bank charge a late fee on my credit card?', '2019-02-05', 'CC_CCF', '007');
INSERT INTO bank.questions (person_id, questions_id, statement, statement_create_date, question_category_id, answer_id) VALUES ('023', '008', 'Can the bank charge me an over-the-limit fee?', '2019-02-05', 'CC_CCF', '008');

INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('016', '123456774');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('017', '123456773');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('018', '123456772');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('019', '123456771');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('020', '123456770');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('021', '123456745');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('022', '123456769');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('023', '123456768');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('024', '123456767');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('025', '123456766');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('026', '123456765');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('027', '123456764');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('028', '123456763');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('029', '123456762');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('030', '123456761');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('031', '123456760');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('032', '123456759');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('033', '123456758');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('034', '123456757');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('035', '123456756');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('036', '123456755');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('037', '123456754');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('038', '123456753');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('039', '123456752');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('040', '123456751');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('041', '123456750');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('042', '123456749');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('043', '123456750');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('044', '123456751');
INSERT INTO bank.customer (person_id, cutomert_number) VALUES ('045', '123456752');

INSERT INTO bank.account_types (type_code, account_display_name) VALUES ('BCC', 'Brass Credit Card');
INSERT INTO bank.account_types (type_code, account_display_name) VALUES ('CA', 'Checking Account');
INSERT INTO bank.account_types (type_code, account_display_name) VALUES ('GCC', 'Gold Credit Card');
INSERT INTO bank.account_types (type_code, account_display_name) VALUES ('SA', 'Saving Account');
INSERT INTO bank.account_types (type_code, account_display_name) VALUES ('SCC', 'Silver Credit Card');

INSERT INTO bank.account (person_id, amount, type_code) VALUES ('016', 100.00, 'BCC');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('017', 100.00, 'CA');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('018', 100.00, 'GCC');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('019', 100.00, 'SA');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('020', 100.00, 'SCC');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('021', 100.00, 'BCC');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('022', 100.00, 'CA');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('023', 100.00, 'GCC');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('024', 100.00, 'SA');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('025', 100.00, 'SCC');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('026', 100.00, 'BCC');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('027', 100.00, 'CA');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('028', 100.00, 'GCC');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('029', 100.00, 'SA');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('030', 100.00, 'SCC');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('031', 100.00, 'BCC');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('032', 100.00, 'CA');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('033', 100.00, 'GCC');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('034', 100.00, 'SA');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('035', 100.00, 'SCC');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('036', 100.00, 'BCC');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('037', 100.00, 'CA');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('038', 100.00, 'GCC');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('039', 100.00, 'SA');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('040', 100.00, 'SCC');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('041', 100.00, 'BCC');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('042', 100.00, 'CA');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('043', 100.00, 'GCC');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('044', 100.00, 'SA');
INSERT INTO bank.account (person_id, amount, type_code) VALUES ('045', 100.00, 'SCC');

INSERT INTO bank.login (person_id, user_name, password) VALUES ('016', 'user_name016', 'password016');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('017', 'user_name017', 'password017');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('018', 'user_name018', 'password018');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('019', 'user_name019', 'password019');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('020', 'user_name020', 'password020');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('021', 'user_name021', 'password021');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('022', 'user_name022', 'password022');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('023', 'user_name023', 'password023');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('024', 'user_name024', 'password024');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('025', 'user_name025', 'password025');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('026', 'user_name026', 'password026');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('027', 'user_name027', 'password027');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('028', 'user_name028', 'password028');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('029', 'user_name029', 'password029');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('030', 'user_name030', 'password030');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('031', 'user_name031', 'password031');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('032', 'user_name032', 'password032');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('033', 'user_name033', 'password033');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('034', 'user_name034', 'password034');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('035', 'user_name035', 'password035');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('036', 'user_name036', 'password036');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('037', 'user_name037', 'password037');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('038', 'user_name038', 'password038');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('039', 'user_name039', 'password039');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('040', 'user_name040', 'password040');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('041', 'user_name041', 'password041');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('042', 'user_name042', 'password042');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('043', 'user_name043', 'password043');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('044', 'user_name044', 'password044');
INSERT INTO bank.login (person_id, user_name, password) VALUES ('045', 'user_name045', 'password045');

INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('016', '9999999999999999', '2020-02-04', '016');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('017', '9999999999999998', '2020-02-04', '017');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('018', '9999999999999997', '2020-02-04', '018');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('019', '9999999999999996', '2020-02-04', '019');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('020', '9999999999999995', '2020-02-04', '020');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('021', '9999999999999994', '2020-02-04', '021');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('022', '9999999999999993', '2020-02-04', '022');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('023', '9999999999999992', '2020-02-04', '023');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('024', '9999999999999991', '2020-02-04', '024');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('025', '9999999999999990', '2020-02-04', '025');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('026', '9999999999999989', '2020-02-04', '026');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('027', '9999999999999988', '2020-02-04', '027');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('028', '9999999999999987', '2020-02-04', '028');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('029', '9999999999999986', '2020-02-04', '029');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('030', '9999999999999985', '2020-02-04', '030');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('031', '9999999999999984', '2020-02-04', '031');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('032', '9999999999999983', '2020-02-04', '032');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('033', '9999999999999982', '2020-02-04', '033');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('034', '9999999999999981', '2020-02-04', '034');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('035', '9999999999999980', '2020-02-04', '035');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('036', '9999999999999979', '2020-02-04', '036');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('037', '9999999999999978', '2020-02-04', '037');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('038', '9999999999999977', '2020-02-04', '038');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('039', '9999999999999976', '2020-02-04', '039');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('040', '9999999999999975', '2020-02-04', '040');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('041', '9999999999999974', '2020-02-04', '041');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('042', '9999999999999973', '2020-02-04', '042');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('043', '9999999999999972', '2020-02-04', '043');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('044', '9999999999999971', '2020-02-04', '044');
INSERT INTO bank.credit_card (person_id, credit_card_number, expire_date, code) VALUES ('045', '9999999999999970', '2020-02-04', '045');
