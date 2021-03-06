-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.59-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema dbinventory
--

CREATE DATABASE IF NOT EXISTS dbinventory;
USE dbinventory;

--
-- Temporary table structure for view `view_ending_balance`
--
DROP TABLE IF EXISTS `view_ending_balance`;
DROP VIEW IF EXISTS `view_ending_balance`;
CREATE TABLE `view_ending_balance` (
  `item_code` varchar(45),
  `item_qty` double(10,2)
);

--
-- Definition of table `account_recievable`
--

DROP TABLE IF EXISTS `account_recievable`;
CREATE TABLE `account_recievable` (
  `account_recievable_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gross_amount` double(2,2) NOT NULL,
  `total_discount_amount` double(2,2) NOT NULL,
  `net_total` double(2,2) NOT NULL,
  `acount_recievable_date` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`account_recievable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_recievable`
--

/*!40000 ALTER TABLE `account_recievable` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_recievable` ENABLE KEYS */;


--
-- Definition of table `account_recievable_cart`
--

DROP TABLE IF EXISTS `account_recievable_cart`;
CREATE TABLE `account_recievable_cart` (
  `acount_recievable_cart_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_code` varchar(45) NOT NULL,
  `qty` int(10) unsigned NOT NULL,
  `customer_type` varchar(45) NOT NULL,
  `acount_recievable_cart_date` datetime NOT NULL,
  `price` double(2,2) NOT NULL,
  `total_price` double(2,2) NOT NULL,
  `discount_amount` double(2,2) NOT NULL,
  PRIMARY KEY (`acount_recievable_cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_recievable_cart`
--

/*!40000 ALTER TABLE `account_recievable_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_recievable_cart` ENABLE KEYS */;


--
-- Definition of table `account_recievable_payments`
--

DROP TABLE IF EXISTS `account_recievable_payments`;
CREATE TABLE `account_recievable_payments` (
  `account_recievable_id` int(10) unsigned NOT NULL DEFAULT '0',
  `payment_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`account_recievable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_recievable_payments`
--

/*!40000 ALTER TABLE `account_recievable_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_recievable_payments` ENABLE KEYS */;


--
-- Definition of table `account_recievable_to_account_recievable_cart`
--

DROP TABLE IF EXISTS `account_recievable_to_account_recievable_cart`;
CREATE TABLE `account_recievable_to_account_recievable_cart` (
  `account_recievable_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`account_recievable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_recievable_to_account_recievable_cart`
--

/*!40000 ALTER TABLE `account_recievable_to_account_recievable_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_recievable_to_account_recievable_cart` ENABLE KEYS */;


--
-- Definition of table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cart_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_code` varchar(45) NOT NULL,
  `qty` int(10) unsigned NOT NULL,
  `customer_type` varchar(45) NOT NULL,
  `cart_date` datetime NOT NULL,
  `price` double(2,2) NOT NULL,
  `total_price` double(2,2) NOT NULL,
  `discount` varchar(45) NOT NULL,
  `discount_amount` double(2,2) NOT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;


--
-- Definition of table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `customers_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customers_name` varchar(45) NOT NULL,
  `customers_add` varchar(45) NOT NULL,
  `customers_number` varchar(45) NOT NULL,
  PRIMARY KEY (`customers_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`customers_id`,`customers_name`,`customers_add`,`customers_number`) VALUES 
 (8,'Alfie Ocba','Tagbilaran',''),
 (9,'Alvin Crecencio','Talibon',''),
 (10,'Andres Arong','Ubay',''),
 (11,'Anita Cañada','Tubigon',''),
 (12,'Annie Aparre','Inabanga',''),
 (13,'Arlene Abres','Cahayag',''),
 (14,'Aster Galola','tubigon',''),
 (15,'Baloy Blantucas','tubigon',''),
 (16,'Bebeth Barrosa','tubigon',''),
 (17,'Bijie','Carmen',''),
 (18,'BISU','Calape',''),
 (19,'Boy Capio','Inabanga',''),
 (20,'Cabandos','Trinidad',''),
 (21,'Ben Gablines','Calape',''),
 (22,'Beneth Resonabe','Calape',''),
 (23,'Arlene Amasor','Desamparados, Calape, Bohol','');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;


--
-- Definition of table `customers_discount`
--

DROP TABLE IF EXISTS `customers_discount`;
CREATE TABLE `customers_discount` (
  `customers_id` int(10) unsigned NOT NULL DEFAULT '0',
  `discount_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers_discount`
--

/*!40000 ALTER TABLE `customers_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_discount` ENABLE KEYS */;


--
-- Definition of table `discount`
--

DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount` (
  `discount_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discount_code` varchar(45) NOT NULL,
  `discount_name` varchar(45) NOT NULL,
  `percentage` varchar(45) NOT NULL,
  `percentage_amount` double(2,2) NOT NULL,
  PRIMARY KEY (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discount`
--

/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;


--
-- Definition of table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_code` varchar(45) NOT NULL,
  `item_qty` double(10,2) NOT NULL,
  `item_price` double(10,2) NOT NULL,
  `date_added` date DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  `manufacturers_id` int(10) unsigned DEFAULT NULL,
  `reorder_point` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`,`item_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`item_id`,`item_code`,`item_qty`,`item_price`,`date_added`,`date_modified`,`manufacturers_id`,`reorder_point`) VALUES 
 (17,'NLB',25.00,1580.00,'2011-10-12','2011-10-23',4,0),
 (18,'NLP',1.00,985.00,'2011-10-12','2011-10-12',4,0),
 (19,'NSP',201.00,201.00,'2011-10-12','2011-10-23',0,0),
 (20,'NGP',101.00,101.00,'2011-10-12','2011-10-23',0,0),
 (21,'NBP',201.00,1070.00,'2011-10-12','2011-10-12',4,0),
 (22,'PSP',301.00,201.00,'2011-10-12','2011-10-23',0,0),
 (23,'LSP',1601.00,1170.00,'2011-10-12','2011-10-12',4,0),
 (25,'BFC',1.00,1.00,'2011-10-12','2011-10-23',0,0),
 (26,'BSC',1.00,1230.00,'2011-10-12','2011-10-12',4,0),
 (27,'CBM 25',312.00,212.00,'2011-10-12','2011-10-23',0,0),
 (28,'CGM',101.00,1.00,'2011-10-12','2011-10-12',0,0);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;


--
-- Definition of table `items_description`
--

DROP TABLE IF EXISTS `items_description`;
CREATE TABLE `items_description` (
  `item_code` varchar(45) NOT NULL,
  `item_name` varchar(50) DEFAULT NULL,
  `item_description` varchar(100) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `unit_of_measure` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items_description`
--

/*!40000 ALTER TABLE `items_description` DISABLE KEYS */;
INSERT INTO `items_description` (`item_code`,`item_name`,`item_description`,`image`,`status`,`unit_of_measure`) VALUES 
 ('BFC','Broiler Finisher Crumble','Broiler Finisher Crumble','',1,'BAG'),
 ('BSC','Broiler Starter Crumble','Broiler Starter Crumble','',1,'BAG'),
 ('CBM 25','Chick Booster Mash 25','Chick Booster Mash 25','',1,'BAG'),
 ('CGM','Chicken Grower Mash','Chicken Grower Mash','',1,'BAG'),
 ('LSP','Litter Saver Pellets','Litter Saver Pellets','',1,'BAG'),
 ('NBP','Nutri Big Pellets','Nutri Big Pellets','',1,'BAG'),
 ('NGP','Nutri Gro Pellets','Nutri Gro Pellets','',1,'BAG'),
 ('NLB','Nutrilac Booster 1kg X 25','Nutrilac Booster 1kg X 25','',1,'BAG'),
 ('NLP','Nutrilac Pellets 1kg X 25','Nutrilac Pellets 1kg X 25','',1,'BAG'),
 ('NSP','Nutri Start Pellets','Nutri Start Pellets','',1,'BAG'),
 ('PSP','Preg Sow Pelets','Preg Sow Pelets','',1,'BAG');
/*!40000 ALTER TABLE `items_description` ENABLE KEYS */;


--
-- Definition of table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE `manufacturers` (
  `manufacturers_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manufacturers_name` varchar(45) NOT NULL,
  `manufacturers_add` varchar(45) NOT NULL,
  `manufacturers_number` varchar(45) NOT NULL,
  PRIMARY KEY (`manufacturers_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufacturers`
--

/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` (`manufacturers_id`,`manufacturers_name`,`manufacturers_add`,`manufacturers_number`) VALUES 
 (4,'UNIFEEDS','CEBU',''),
 (5,'UNIVET','Mandaluyong City, Philippines','');
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;


--
-- Definition of table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `amount` double(2,2) NOT NULL,
  `date_of_payment` datetime NOT NULL,
  `remarks` varchar(45) NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;


--
-- Definition of table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `sales_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gross_amount` double(2,2) NOT NULL,
  `total_discount_amount` double(2,2) NOT NULL,
  `net_total` double(2,2) NOT NULL,
  `sales_date` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `sold_to` varchar(45) NOT NULL,
  PRIMARY KEY (`sales_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;


--
-- Definition of table `sales_cart`
--

DROP TABLE IF EXISTS `sales_cart`;
CREATE TABLE `sales_cart` (
  `sales_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cart_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`sales_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_cart`
--

/*!40000 ALTER TABLE `sales_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_cart` ENABLE KEYS */;


--
-- Definition of table `stock_in`
--

DROP TABLE IF EXISTS `stock_in`;
CREATE TABLE `stock_in` (
  `stockin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(45) NOT NULL,
  `qty_in` int(10) unsigned NOT NULL,
  PRIMARY KEY (`stockin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_in`
--

/*!40000 ALTER TABLE `stock_in` DISABLE KEYS */;
INSERT INTO `stock_in` (`stockin_id`,`item_id`,`qty_in`) VALUES 
 (3,'8',10),
 (4,'8',100),
 (5,'8',100),
 (6,'10',20),
 (7,'8',100),
 (8,'8',100),
 (9,'8',100),
 (10,'8',500),
 (11,'10',500),
 (12,'8',8),
 (13,'8',5),
 (14,'1',9),
 (15,'8',78),
 (16,'8',10),
 (17,'8',10),
 (18,'11',50),
 (19,'11',50),
 (20,'12',2),
 (21,'14',2),
 (22,'12',5),
 (23,'15',5),
 (24,'19',200),
 (25,'21',200),
 (26,'20',100),
 (27,'22',200),
 (28,'23',1500),
 (29,'27',200),
 (30,'17',100),
 (31,'23',100),
 (32,'22',100),
 (33,'27',100),
 (34,'28',100);
/*!40000 ALTER TABLE `stock_in` ENABLE KEYS */;


--
-- Definition of table `stock_in_reference`
--

DROP TABLE IF EXISTS `stock_in_reference`;
CREATE TABLE `stock_in_reference` (
  `reference_no` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_in_reference`
--

/*!40000 ALTER TABLE `stock_in_reference` DISABLE KEYS */;
INSERT INTO `stock_in_reference` (`reference_no`) VALUES 
 ('14');
/*!40000 ALTER TABLE `stock_in_reference` ENABLE KEYS */;


--
-- Definition of table `stock_in_transaction`
--

DROP TABLE IF EXISTS `stock_in_transaction`;
CREATE TABLE `stock_in_transaction` (
  `stock_in_transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(45) NOT NULL,
  `stocked_in_to` varchar(45) DEFAULT NULL,
  `from_supplier` int(10) unsigned DEFAULT NULL,
  `remarks` text,
  `stock_in_date` date DEFAULT NULL,
  `total_number_of_items` int(10) unsigned DEFAULT NULL,
  `total_qty` int(10) unsigned DEFAULT NULL,
  `prepared_by` varchar(45) DEFAULT NULL,
  `approved_by` varchar(45) DEFAULT NULL,
  `received_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stock_in_transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_in_transaction`
--

/*!40000 ALTER TABLE `stock_in_transaction` DISABLE KEYS */;
INSERT INTO `stock_in_transaction` (`stock_in_transaction_id`,`reference_no`,`stocked_in_to`,`from_supplier`,`remarks`,`stock_in_date`,`total_number_of_items`,`total_qty`,`prepared_by`,`approved_by`,`received_by`) VALUES 
 (5,'SI-000001','WH-02 STOCKROOM(BODEGA)',1,'asdsadad','2011-10-09',1,10,'obeng','',''),
 (6,'SI-000001','WH-02 STOCKROOM(BODEGA)',1,'','2011-10-09',1,100,'','',''),
 (7,'SI-000001','WH-02 STOCKROOM(BODEGA)',1,'','2011-10-09',1,100,'','',''),
 (8,'SI-000001','WH-02 STOCKROOM(BODEGA)',1,'','2011-10-09',1,20,'','',''),
 (9,'SI-000001','WH-02 STOCKROOM(BODEGA)',2,'sample','2011-10-09',1,100,'obeng','',''),
 (10,'SI-000001','WH-02 STOCKROOM(BODEGA)',2,'samnple','2011-10-09',1,100,'obeng','',''),
 (11,'SI-000001','WH-02 STOCKROOM(BODEGA)',2,'sample','2011-10-09',1,100,'obeng','',''),
 (12,'SI-000001','WH-02 STOCKROOM(BODEGA)',1,'','2011-10-09',2,1000,'','',''),
 (13,'SI-000002','WH-02 STOCKROOM(BODEGA)',2,'dssd','2011-10-09',1,8,'sdfs','sdfs','sdfs'),
 (14,'SI-000003','WH-02 STOCKROOM(BODEGA)',2,'sdfasdf','2011-10-09',2,14,'asfsdfsa','sdfsda','sdfs'),
 (15,'SI-000004','WH-02 STOCKROOM(BODEGA)',2,'dgd','2011-10-09',1,78,'','',''),
 (16,'SI-000005','WH-02 STOCKROOM(BODEGA)',2,'aasdsdsadd','2011-10-09',1,10,'asdsad','asd',''),
 (17,'SI-000006','WH-02 STOCKROOM(BODEGA)',2,'asdasd','2011-10-09',1,10,'asdasd','',''),
 (18,'SI-000007','WH-02 STOCKROOM(BODEGA)',3,'vbmkgi','2011-10-09',1,50,'','',''),
 (19,'SI-000008','WH-02 STOCKROOM(BODEGA)',3,'','2011-10-09',1,50,'','',''),
 (20,'SI-000009','WH-02 STOCKROOM(BODEGA)',4,'FROM: CEBU / WING VAN  / BOY','2011-10-10',2,4,'BENG','SIR AHOC','RAMBO'),
 (21,'SI-0000010','BODEGA / TINDAHAN',4,'PICK UP CEBU / WING VAN - BOY ','2011-10-10',2,10,'BENG','SIR AHOC','RAMBO'),
 (22,'SI-0000011','WH-02 STOCKROOM(BODEGA)',4,'PICK UP / WING VAN - BOY','2011-10-17',5,2200,'                              BENG','                              SIR AHOC','                                RAMBO'),
 (23,'SI-0000012','WH-02 STOCKROOM(BODEGA)',4,'','2011-10-17',1,200,'','',''),
 (24,'SI-0000013','WH-02 STOCKROOM(BODEGA)',4,'pick up/ wing van - boy','2011-10-23',5,500,'     beng','     sir ahoc','          ramboo');
/*!40000 ALTER TABLE `stock_in_transaction` ENABLE KEYS */;


--
-- Definition of table `stock_in_transaction_to_stock_in_items`
--

DROP TABLE IF EXISTS `stock_in_transaction_to_stock_in_items`;
CREATE TABLE `stock_in_transaction_to_stock_in_items` (
  `stock_in_transaction_id` int(10) unsigned DEFAULT NULL,
  `stock_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_in_transaction_to_stock_in_items`
--

/*!40000 ALTER TABLE `stock_in_transaction_to_stock_in_items` DISABLE KEYS */;
INSERT INTO `stock_in_transaction_to_stock_in_items` (`stock_in_transaction_id`,`stock_id`) VALUES 
 (7,0),
 (8,0),
 (10,0),
 (11,9),
 (12,10),
 (12,11),
 (13,12),
 (14,13),
 (14,14),
 (15,15),
 (16,16),
 (17,17),
 (18,18),
 (19,19),
 (20,20),
 (20,21),
 (21,22),
 (21,23),
 (22,24),
 (22,25),
 (22,26),
 (22,27),
 (22,28),
 (23,29),
 (24,30),
 (24,31),
 (24,32),
 (24,33),
 (24,34);
/*!40000 ALTER TABLE `stock_in_transaction_to_stock_in_items` ENABLE KEYS */;


--
-- Definition of table `stock_out`
--

DROP TABLE IF EXISTS `stock_out`;
CREATE TABLE `stock_out` (
  `stockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_type` varchar(45) NOT NULL,
  `affected_id` varchar(45) NOT NULL,
  `stockout_date` datetime NOT NULL,
  PRIMARY KEY (`stockout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_out`
--

/*!40000 ALTER TABLE `stock_out` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_out` ENABLE KEYS */;


--
-- Definition of view `view_ending_balance`
--

DROP TABLE IF EXISTS `view_ending_balance`;
DROP VIEW IF EXISTS `view_ending_balance`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_ending_balance` AS select `items`.`item_code` AS `item_code`,`items`.`item_qty` AS `item_qty` from `items`;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
