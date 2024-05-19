
-- bank_db.sql

CREATE DATABASE IF NOT EXISTS bank_db;

-- Table structure for table `accounts_data`
DROP TABLE IF EXISTS `accounts_data`;
CREATE TABLE `accounts_data` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `account_number` int NOT NULL, `customer_name` varchar(255) NOT NULL,
  `email_id` varchar(255) DEFAULT NULL, `phone_number` varchar(20) DEFAULT NULL,
  `account_type` enum('savings','current') NOT NULL, `total_balance` decimal(10,2) NOT NULL,
  `customer_address` varchar(255) NOT NULL, `created_on` datetime NOT NULL,
  PRIMARY KEY (`account_id`), UNIQUE KEY `account_number` (`account_number`)
) 

-- Table structure for table `Employees`
DROP TABLE IF EXISTS `Employees`;
CREATE TABLE `Employees` (
  `employee_id` varchar(255) NOT NULL, `employee_name` varchar(255) NOT NULL, `employee_role` varchar(255) NOT NULL,
  `employee_username` varchar(255) NOT NULL, `employee_password` varchar(255) NOT NULL, PRIMARY KEY (`employee_id`)
)

-- Table structure for table `transactions`
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `account_number` int NOT NULL, `date_time` datetime NOT NULL, `amount` decimal(10,2) NOT NULL,
  `transaction_type` enum('deposit','withdrawal','txn_fee','txn_fd.sent','txn_fd.rcvd') NOT NULL,
  `transaction_details` text,
  PRIMARY KEY (`transaction_id`), KEY `account_number` (`account_number`)
) 


/*
-- Insert accounts data into Table 'accounts_data'
*/
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (1,24040001,'John Doe','john@example.com','123-456-7890','savings',400.99,'123 Main St, City','2024-04-23 21:04:56');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (2,24040002,'Jane Smith','jane@example.com','987-654-3210','current',11191.74,'456 Elm St, Town','2024-04-23 21:04:56');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (3,24040003,'Michael Johnson','michael@example.com','111-222-3333','savings',8139.98,'789 Oak St, Village','2024-04-23 21:04:56');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (4,24040004,'Emily Brown','emily@example.com','444-555-6666','current',5000.00,'321 Pine St, Hamlet','2024-04-23 21:04:56');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (5,24040005,'David Lee','david@example.com','777-888-9999','savings',2255.01,'654 Birch St, Borough','2024-04-23 21:04:56');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (6,24040006,'Sarah Wilson','sarah@example.com','222-333-4444','current',15000.00,'987 Maple St, Township','2024-04-23 21:04:56');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (7,24040007,'Matthew Taylor','matthew@example.com','555-666-7777','savings',6000.00,'741 Cedar St, County','2024-04-23 21:04:56');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (8,24040008,'Emma Martinez','emma@example.com','999-888-7777','current',20000.00,'852 Walnut St, State','2024-04-23 21:04:56');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (9,24040009,'Olivia Garcia','olivia@example.com','333-222-1111','savings',9000.00,'369 Pineapple St, Country','2024-04-23 21:04:56');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (10,24040010,'Daniel Rodriguez','daniel@example.com','666-777-8888','current',18021.00,'159 Cherry St, Kingdom','2024-04-23 21:04:56');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (11,47520275,'ahmed','md.ahmed.rahmani@gmail.com','07719602323','current',1500.00,'10 Eldon Road','2024-04-23 22:05:50');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (12,32657833,'M. Ahmed Rahmani','rahmani.ahmed.2104@gmail.com','07719602323','savings',47082.00,'10 Eldon Road','2024-04-23 22:10:02');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (13,81965978,'ali','rahmani.ali.2104@gmail.com','07719602326','savings',100.00,'uk','2024-04-23 22:11:56');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (16,24040100,'Samreen Rahmani','md.ahmed.rahmani@gmail.com','09032763435','savings',2381.00,'ASAD BABA NAGAR, KISHAN BAGH, BAHADURPURA','2024-04-29 07:42:27');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (20,24050932,'','','','savings',0.00,'','2024-05-08 08:52:22');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (21,24059464,'','','','savings',0.00,'','2024-05-08 09:38:14');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (22,24053880,'abc','abc','789','savings',0.00,'bghg','2024-05-08 09:44:54');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (23,24057057,'saleem ali','saleem@gmail.com','07868909090','current',2650.00,'London','2024-05-08 10:00:00');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (24,24058071,'Mohammed Ali','ali@ucb.co.uk','07823782390','savings',100.00,'London','2024-05-08 10:10:47');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (25,24055396,'Charlie Wilson','wilson.charlie@gmail.com','07861234569','current',9000.00,'Scotland','2024-05-08 10:29:30');
INSERT INTO `accounts_data` (`account_id`,`account_number`,`customer_name`,`email_id`,`phone_number`,`account_type`,`total_balance`,`customer_address`,`created_on`) VALUES (26,24052266,'Mohammed Ahmed Rahmani','Ahmed@ucb.ac.uk','08978987676','current',15000.00,'Birmingham','2024-05-08 10:54:57');


/*
-- Insert employees data into Table 'Employees'
*/

INSERT INTO `Employees` (`employee_id`,`employee_name`,`employee_role`,`employee_username`,`employee_password`) VALUES ('emp001','Alice Anderson','Manager','alice','password1');
INSERT INTO `Employees` (`employee_id`,`employee_name`,`employee_role`,`employee_username`,`employee_password`) VALUES ('emp002','Bob Baker','Teller','bob','password2');
INSERT INTO `Employees` (`employee_id`,`employee_name`,`employee_role`,`employee_username`,`employee_password`) VALUES ('emp003','Charlie Clark','Accountant','charlie','password3');
INSERT INTO `Employees` (`employee_id`,`employee_name`,`employee_role`,`employee_username`,`employee_password`) VALUES ('emp004','David Davis','Customer Service','david','password4');
INSERT INTO `Employees` (`employee_id`,`employee_name`,`employee_role`,`employee_username`,`employee_password`) VALUES ('emp005','Emma Evans','Security','emma','password5');


/*
-- Insert transactions data into Table 'transactions'
*/

INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (7,24040001,'2024-04-24 10:00:00',500.00,'deposit','Deposit from customer');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (8,24040002,'2024-04-24 11:30:00',200.00,'withdrawal','ATM withdrawal');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (9,24040001,'2024-04-24 10:00:00',500.00,'deposit','Deposit from customer');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (10,24040002,'2024-04-24 11:30:00',200.00,'withdrawal','ATM withdrawal');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (11,32657833,'2024-04-24 07:37:38',10.00,'deposit','Family');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (17,32657833,'2024-04-24 09:04:29',2000.00,'deposit','abc');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (18,32657833,'2024-04-24 09:18:45',-123.11,'withdrawal','payment');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (19,32657833,'2024-04-24 09:19:10',10000.00,'deposit','save');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (20,32657833,'2024-04-24 09:41:47',-2000.00,'withdrawal','party');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (23,32657833,'2024-04-24 10:57:30',-100.00,'withdrawal','uni');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (24,32657833,'2024-04-24 11:10:08',-10.00,'withdrawal','shop');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (25,32657833,'2024-04-24 11:10:37',-1100.00,'withdrawal','market');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (26,32657833,'2024-04-24 11:10:37',-2.00,'txn_fee','Withdrawal fee');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (27,32657833,'2024-04-24 11:13:18',-2000.00,'withdrawal','ali_loan');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (28,32657833,'2024-04-24 11:13:18',-10.00,'txn_fee','Withdrawal fee');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (29,32657833,'2024-04-24 13:20:13',-100.00,'withdrawal','sans,ja');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (30,32657833,'2024-04-26 12:04:04',-10000.00,'withdrawal','Sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (31,24040001,'2024-04-26 12:04:04',10000.00,'deposit','Received from 32657833');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (32,32657833,'2024-04-26 12:18:39',-150.00,'txn_fd.sent','Sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (33,24040001,'2024-04-26 12:18:39',150.00,'txn_fd.rcvd','Received from 32657833');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (34,32657833,'2024-04-26 13:00:52',-101.00,'txn_fd.sent','Sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (35,24040001,'2024-04-26 13:00:52',101.00,'txn_fd.rcvd','Received from 32657833');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (36,24040001,'2024-04-26 13:10:15',-120.00,'txn_fd.sent','Sent to 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (37,24040002,'2024-04-26 13:10:15',120.00,'txn_fd.rcvd','Received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (38,32657833,'2024-04-26 17:29:43',-1901.00,'txn_fd.sent','Funds sent');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (39,24040001,'2024-04-26 17:29:43',1901.00,'txn_fd.rcvd','Funds received');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (40,24040002,'2024-04-26 17:33:36',-120.00,'txn_fd.sent','Funds sent');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (41,24040001,'2024-04-26 17:33:36',120.00,'txn_fd.rcvd','Funds received');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (42,24040001,'2024-04-26 17:37:34',-1150.00,'txn_fd.sent','Funds sent');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (43,24040002,'2024-04-26 17:37:34',1150.00,'txn_fd.rcvd','Funds received');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (44,24040001,'2024-04-26 17:55:55',-1250.00,'txn_fd.sent','Funds sent to 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (45,24040002,'2024-04-26 17:55:55',1250.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (46,24040001,'2024-04-26 18:02:21',-185.00,'txn_fd.sent','Funds sent to 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (47,24040002,'2024-04-26 18:02:21',185.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (48,32657833,'2024-04-26 18:19:03',-1024.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (49,24040001,'2024-04-26 18:19:03',1024.00,'txn_fd.rcvd','Funds received from 32657833');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (50,32657833,'2024-04-26 18:21:16',-143.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (51,24040001,'2024-04-26 18:21:16',143.00,'txn_fd.rcvd','Funds received from 32657833');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (52,32657833,'2024-04-26 18:24:58',-121.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (53,24040001,'2024-04-26 18:24:58',121.00,'txn_fd.rcvd','Funds received from 32657833');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (54,32657833,'2024-04-26 18:28:13',-300.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (55,24040001,'2024-04-26 18:28:13',300.00,'txn_fd.rcvd','Funds received from 32657833');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (56,32657833,'2024-04-26 18:28:39',-300.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (57,24040001,'2024-04-26 18:28:39',300.00,'txn_fd.rcvd','Funds received from 32657833');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (58,32657833,'2024-04-26 18:33:35',-15.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (59,24040001,'2024-04-26 18:33:35',15.00,'txn_fd.rcvd','Funds received from 32657833');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (60,32657833,'2024-04-26 18:35:59',-1001.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (61,24040001,'2024-04-26 18:35:59',1001.00,'txn_fd.rcvd','Funds received from 32657833');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (62,32657833,'2024-04-26 18:56:42',-1.00,'withdrawal','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (63,24040001,'2024-04-26 18:56:42',1.00,'deposit','Funds received from 32657833');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (64,24040001,'2024-04-26 19:16:27',-1.00,'withdrawal','Funds sent to 32657833');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (65,32657833,'2024-04-26 19:16:27',1.00,'deposit','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (66,24040001,'2024-04-26 19:18:12',-1000.00,'withdrawal','Funds sent to 32657833');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (67,32657833,'2024-04-26 19:18:12',1000.00,'deposit','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (68,24040001,'2024-04-26 19:27:16',-126.00,'withdrawal','Funds sent to 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (69,24040002,'2024-04-26 19:27:16',126.00,'deposit','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (70,24040002,'2024-04-26 19:33:34',-149.00,'withdrawal','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (71,24040001,'2024-04-26 19:33:34',149.00,'deposit','Funds received from 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (72,24040001,'2024-04-26 19:35:57',-189.00,'withdrawal','Funds sent to 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (73,24040002,'2024-04-26 19:35:57',189.00,'deposit','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (74,24040002,'2024-04-26 19:45:14',-1200.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (75,24040001,'2024-04-26 19:45:14',1200.00,'txn_fd.rcvd','Funds received from 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (76,24040001,'2024-04-26 19:50:52',-1111.00,'txn_fd.sent','Funds sent to 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (77,24040002,'2024-04-26 19:50:52',1111.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (78,24040001,'2024-04-29 09:10:42',1234.00,'deposit',NULL);
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (79,32657833,'2024-04-29 09:42:54',129.00,'withdrawal',NULL);
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (80,32657833,'2024-04-29 09:43:02',129.00,'withdrawal',NULL);
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (81,32657833,'2024-04-29 09:43:12',1.00,'deposit',NULL);
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (82,32657833,'2024-04-29 09:43:38',1234.00,'deposit',NULL);
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (83,24040001,'2024-04-29 09:45:01',1000.00,'deposit',NULL);
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (84,24040001,'2024-04-29 09:45:11',560.00,'withdrawal',NULL);
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (85,24040002,'2024-04-29 21:48:27',-10.01,'withdrawal','Withdrawal of funds');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (86,24040002,'2024-04-29 21:49:07',-51.01,'withdrawal','Withdrawal of funds');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (87,24040002,'2024-04-29 21:55:58',-100.01,'withdrawal','Withdrawal of funds');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (88,24040002,'2024-04-30 11:09:10',-100.00,'withdrawal','md.ahmed.rahmani@gmail.com');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (89,24040002,'2024-04-30 11:09:27',-1050.00,'withdrawal','md');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (90,24040002,'2024-04-30 11:09:27',-1.00,'txn_fee','Withdrawal fee');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (91,24040002,'2024-04-30 11:10:35',-6000.01,'withdrawal','pay');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (92,24040002,'2024-04-30 11:10:35',-10.00,'txn_fee','Withdrawal fee');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (93,24040002,'2024-04-30 11:14:05',-1110.01,'withdrawal','vvv');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (94,24040002,'2024-04-30 11:14:05',-2.20,'txn_fee','Withdrawal fee');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (95,24040002,'2024-04-30 11:14:39',-110.01,'withdrawal','vvv');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (96,32657833,'2024-04-30 11:15:34',-2000.00,'withdrawal','go');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (97,32657833,'2024-04-30 11:15:34',-10.00,'txn_fee','Withdrawal fee');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (98,32657833,'2024-04-30 11:37:25',-0.89,'withdrawal','');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (99,24040001,'2024-04-30 12:56:42',-5000.00,'withdrawal','fee');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (100,24040001,'2024-04-30 12:56:42',-10.00,'txn_fee','Withdrawal fee');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (101,24040001,'2024-04-30 13:08:37',19.20,'deposit','save-up');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (102,24040100,'2024-04-30 13:10:44',2001.00,'deposit','good work');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (103,24040010,'2024-04-30 13:11:16',21.00,'deposit','help');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (104,24040001,'2024-04-30 13:56:24',-4326.00,'txn_fd.sent','Funds sent to 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (105,24040002,'2024-04-30 13:56:24',4326.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (106,24040001,'2024-04-30 13:56:51',10000.00,'deposit','');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (107,24040001,'2024-04-30 13:57:12',-1000.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (108,24040001,'2024-04-30 13:57:12',1000.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (109,24040001,'2024-04-30 14:08:50',-1.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (110,24040001,'2024-04-30 14:08:50',1.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (111,24040001,'2024-04-30 14:22:29',-70.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (112,24040001,'2024-04-30 14:22:29',70.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (113,24040001,'2024-04-30 14:25:44',-70.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (114,24040001,'2024-04-30 14:25:44',70.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (115,24040001,'2024-04-30 14:32:25',-1.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (116,24040001,'2024-04-30 14:32:25',1.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (117,24040001,'2024-04-30 14:33:16',-786.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (118,24040001,'2024-04-30 14:33:16',786.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (119,24040001,'2024-04-30 14:44:17',-1200.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (120,24040001,'2024-04-30 14:44:17',1200.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (121,24040001,'2024-04-30 14:46:43',-1200.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (122,24040001,'2024-04-30 14:46:43',1200.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (123,24040001,'2024-04-30 14:47:00',-1200.00,'txn_fd.sent','Funds sent to 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (124,24040002,'2024-04-30 14:47:00',1200.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (125,24040001,'2024-04-30 14:47:01',-1200.00,'txn_fd.sent','Funds sent to 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (126,24040002,'2024-04-30 14:47:01',1200.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (127,24040001,'2024-04-30 14:47:15',-1200.00,'txn_fd.sent','Funds sent to 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (128,24040002,'2024-04-30 14:47:15',1200.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (129,24040001,'2024-04-30 14:47:21',-1200.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (130,24040001,'2024-04-30 14:47:21',1200.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (131,24040002,'2024-04-30 14:48:14',-123.00,'txn_fd.sent','Funds sent to 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (132,24040002,'2024-04-30 14:48:14',123.00,'txn_fd.rcvd','Funds received from 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (133,24040002,'2024-04-30 14:52:16',-5.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (134,24040001,'2024-04-30 14:52:16',5.00,'txn_fd.rcvd','Funds received from 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (135,24040002,'2024-04-30 14:52:40',-34.00,'txn_fd.sent','Funds sent to 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (136,24040002,'2024-04-30 14:52:40',34.00,'txn_fd.rcvd','Funds received from 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (137,24040001,'2024-04-30 15:01:19',-1.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (138,24040001,'2024-04-30 15:01:19',1.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (139,24040001,'2024-04-30 15:10:03',-1456.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (140,24040001,'2024-04-30 15:10:03',1456.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (141,24040001,'2024-04-30 15:19:05',-1.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (142,24040001,'2024-04-30 15:19:05',1.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (143,24040001,'2024-04-30 15:40:16',-1.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (144,24040001,'2024-04-30 15:40:16',1.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (145,24040001,'2024-04-30 15:43:27',-1.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (146,24040001,'2024-04-30 15:43:27',1.00,'txn_fd.rcvd','Funds received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (147,24040002,'2024-04-30 16:16:03',-1000.00,'txn_fd.sent','Funds sent to 24040003');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (148,24040003,'2024-04-30 16:16:03',1000.00,'txn_fd.rcvd','Funds received from 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (149,24040001,'2024-05-01 05:44:30',1.00,'deposit','24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (150,32657833,'2024-05-01 05:50:23',-1.00,'txn_fd.sent','Funds sent to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (151,24040001,'2024-05-01 05:50:23',1.00,'txn_fd.rcvd','Funds received from 32657833');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (152,24040001,'2024-05-01 05:52:25',-6000.00,'withdrawal','abc');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (153,24040001,'2024-05-01 05:52:25',-10.00,'txn_fee','Withdrawal fee');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (154,47520275,'2024-05-01 05:54:42',1000.00,'deposit','save');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (155,24040002,'2024-05-01 06:01:49',32.00,'deposit','test');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (156,24040001,'2024-05-01 07:03:13',50.00,'deposit','pay');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (157,24040001,'2024-05-01 07:03:15',50.00,'deposit','pay');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (158,24050932,'2024-05-08 08:52:22',0.00,'deposit','initial deposit');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (159,24059464,'2024-05-08 09:38:14',0.00,'deposit','initial deposit');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (160,24053880,'2024-05-08 09:44:54',0.00,'deposit','initial deposit');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (161,24057057,'2024-05-08 10:00:00',2650.00,'deposit','initial deposit');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (162,24058071,'2024-05-08 10:10:47',100.00,'deposit','initial deposit');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (163,24055396,'2024-05-08 10:29:30',9000.00,'deposit','initial deposit');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (164,24052266,'2024-05-08 10:54:57',15000.00,'deposit','initial deposit');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (165,24040002,'2024-05-08 15:33:36',70.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (166,24040002,'2024-05-08 15:34:38',70.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (167,24040003,'2024-05-08 15:34:58',110.01,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (168,24040003,'2024-05-08 15:36:35',110.01,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (169,24040001,'2024-05-08 15:37:13',7.20,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (170,24040001,'2024-05-08 15:38:24',90.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (171,24040001,'2024-05-08 15:39:20',10.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (172,24040001,'2024-05-08 15:42:33',11.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (173,24040001,'2024-05-08 15:49:38',21.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (174,24040001,'2024-05-08 15:52:09',31.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (175,24040001,'2024-05-08 15:53:18',41.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (176,24040001,'2024-05-08 15:54:30',61.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (177,24040003,'2024-05-08 16:26:10',2040.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (178,24040004,'2024-05-08 16:50:29',6120.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (179,24040004,'2024-05-08 16:53:38',600.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (180,24040005,'2024-05-08 17:00:22',1224.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (181,24040005,'2024-05-08 17:02:39',1122.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (182,24040005,'2024-05-08 17:14:10',1000.01,'deposit','Deposit to account');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (183,24040005,'2024-05-08 17:16:47',200.00,'deposit','Deposit to account');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (184,24040005,'2024-05-08 17:17:57',2300.00,'deposit','Deposit to account');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (185,24040005,'2024-05-08 17:20:07',2100.00,'deposit','Deposit to account');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (186,24040005,'2024-05-08 17:20:50',20.00,'deposit','Deposit to account');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (187,24040005,'2024-05-08 17:21:15',10.00,'deposit','Deposit to account');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (188,24040005,'2024-05-08 17:22:05',95.00,'deposit','Deposit to account');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (189,24040005,'2024-05-08 17:22:24',90.00,'deposit','Deposit to account');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (190,24040005,'2024-05-08 17:23:25',100.00,'deposit','Deposit to account');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (191,24040005,'2024-05-08 17:24:07',5100.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (192,24040004,'2024-05-08 18:36:32',-280.00,'txn_fd.sent','Transferred to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (193,24040001,'2024-05-08 18:36:32',280.00,'txn_fd.rcvd','Received from 24040004');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (194,24040001,'2024-05-14 16:11:31',1.00,'deposit','');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (195,24040003,'2024-05-14 16:56:36',2000.00,'deposit','Deposit to account');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (196,24040003,'2024-05-14 16:56:58',300.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (197,32657833,'2024-05-15 06:22:45',1.00,'deposit','rahmani');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (198,32657833,'2024-05-15 07:08:07',60.00,'deposit','fun');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (199,32657833,'2024-05-15 09:08:18',-3000.00,'txn_fd.sent','Transferred to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (200,24040001,'2024-05-15 09:08:18',3000.00,'txn_fd.rcvd','Received from 32657833');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (201,24040001,'2024-05-15 15:11:26',4000.00,'deposit','Deposit to account');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (202,24040001,'2024-05-15 15:11:34',400.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (203,24040001,'2024-05-15 15:11:52',6120.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (204,24040001,'2024-05-15 15:12:08',100.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (205,24040001,'2024-05-15 15:12:29',-6.00,'txn_fd.sent','Transferred to 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (206,24040002,'2024-05-15 15:12:29',6.00,'txn_fd.rcvd','Received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (207,24040001,'2024-05-16 00:29:28',0.01,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (208,24040001,'2024-05-16 00:30:20',20.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (209,24040001,'2024-05-16 00:31:53',100.00,'deposit','Deposit to account');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (210,24040001,'2024-05-16 00:33:56',-100.00,'txn_fd.sent','Transferred to 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (211,24040001,'2024-05-16 00:33:56',100.00,'txn_fd.rcvd','Received from 24040001');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (212,24040001,'2024-05-16 01:13:11',1000.00,'deposit','Deposit to account');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (213,24040001,'2024-05-16 01:15:21',1224.00,'withdrawal','Withdrawal from ATM');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (214,24040001,'2024-05-16 01:17:30',-15.00,'txn_fd.sent','Transferred to 24040002');
INSERT INTO `transactions` (`transaction_id`,`account_number`,`date_time`,`amount`,`transaction_type`,`transaction_details`) VALUES (215,24040002,'2024-05-16 01:17:30',15.00,'txn_fd.rcvd','Received from 24040001');

