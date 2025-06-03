-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (x86_64)
--
-- Host: localhost    Database: Bookstore
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `Book`
--

DROP TABLE IF EXISTS `Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Book` (
  `ISBN_13` bigint NOT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `Author` text,
  `AverageRating` decimal(10,2) DEFAULT NULL,
  `LanguageCode` varchar(50) DEFAULT NULL,
  `NumPages` int DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ISBN_13`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book`
--

LOCK TABLES `Book` WRITE;
/*!40000 ALTER TABLE `Book` DISABLE KEYS */;
INSERT INTO `Book` VALUES (9780060749910,'The Known World','Edward P. Jones',3.83,'eng',576,15.99),(9780060762735,'The Known World','Edward P. Jones/Kevin R. Free',3.83,'en-US',14,15.99),(9780060762872,'How to Buy  Sell & Profit on eBay: Kick-Start Your Home-Based Business in Just Thirty Days','Adam Ginsberg',3.48,'eng',336,15.99),(9780060920081,'The Lost Continent: Travels in Small Town America','Bill Bryson',3.83,'eng',299,15.99),(9780061159176,'The Known World','Edward P. Jones',3.83,'eng',388,15.99),(9780072262780,'What to Sell on ebay and Where to Get It: The Definitive Guide to Product Sourcing for eBay and Beyond','Chris Malta/Lisa Suttora',3.62,'eng',260,15.99),(9780140183955,'Untouchable','Mulk Raj Anand/E.M. Forster',3.71,'eng',160,15.99),(9780140449174,'Anna Karenina','Leo Tolstoy/Richard Pevear/Larissa Volokhonsky/John Bayley',4.05,'eng',837,15.99),(9780141312620,'The Changeling Sea','Patricia A. McKillip',4.06,'eng',137,15.99),(9780143035008,'Anna Karenina','Leo Tolstoy/Richard Pevear/Larissa Volokhonsky',4.05,'eng',838,15.99),(9780273704744,'Traders  Guns & Money: Knowns and Unknowns in the Dazzling World of Derivatives','Satyajit Das',3.83,'eng',334,15.99),(9780325001531,'The Power of One: The Solo Play for Playwrights  Actors  and Directors','Louis E. Catron',3.67,'eng',240,15.99),(9780345410054,'The Power of One (The Power of One  #1)','Bryce Courtenay',4.35,'eng',544,15.99),(9780345453747,'The Ultimate Hitchhiker\'s Guide to the Galaxy (Hitchhiker\'s Guide to the Galaxy  #1-5)','Douglas Adams',4.38,'eng',815,15.99),(9780345538376,'J.R.R. Tolkien 4-Book Boxed Set: The Hobbit and The Lord of the Rings','J.R.R. Tolkien',4.59,'eng',1728,15.99),(9780374280390,'Uncommon Carriers','John McPhee',3.95,'en-US',248,15.99),(9780374516000,'Giving Good Weight','John McPhee',4.23,'eng',288,15.99),(9780374517199,'The John McPhee Reader (John McPhee Reader  #1)','John McPhee/William Howarth',4.42,'eng',416,15.99),(9780374518738,'Annals of the Former World','John McPhee',4.34,'eng',720,15.99),(9780374519322,'La Place de la Concorde Suisse','John McPhee',3.92,'fre',160,15.99),(9780374519742,'Heirs of General Practice','John McPhee',4.17,'eng',128,15.99),(9780374520656,'Rising from the Plains','John McPhee',4.23,'eng',208,15.99),(9780374522599,'The Control of Nature','John McPhee',4.24,'en-US',288,15.99),(9780374522872,'Coming Into the Country','John McPhee',4.22,'eng',448,15.99),(9780380713806,'Neither Here nor There: Travels in Europe','Bill Bryson',3.86,'eng',254,15.99),(9780380715435,'The Mother Tongue: English and How It Got That Way','Bill Bryson',3.93,'eng',270,15.99),(9780380727506,'Notes from a Small Island','Bill Bryson',3.91,'eng',324,15.99),(9780385326506,'Guts: The True Stories behind Hatchet and the Brian Books','Gary Paulsen',3.88,'eng',144,15.99),(9780385732543,'The Power of One (The Power of One  #1)','Bryce Courtenay',4.35,'eng',291,15.99),(9780399128981,'Heretics of Dune (Dune Chronicles  #5)','Frank Herbert',3.86,'eng',480,15.99),(9780439358071,'Harry Potter and the Order of the Phoenix (Harry Potter  #5)','J.K. Rowling/Mary GrandPré',4.49,'eng',870,15.99),(9780439554893,'Harry Potter and the Chamber of Secrets (Harry Potter  #2)','J.K. Rowling',4.42,'eng',352,15.99),(9780439655484,'Harry Potter and the Prisoner of Azkaban (Harry Potter  #3)','J.K. Rowling/Mary GrandPré',4.56,'eng',435,15.99),(9780439682589,'Harry Potter Boxed Set  Books 1-5 (Harry Potter  #1-5)','J.K. Rowling/Mary GrandPré',4.78,'eng',2690,15.99),(9780439785969,'Harry Potter and the Half-Blood Prince (Harry Potter  #6)','J.K. Rowling/Mary GrandPré',4.57,'eng',652,15.99),(9780439827607,'Harry Potter Collection (Harry Potter  #1-6)','J.K. Rowling',4.73,'eng',3342,15.99),(9780441102679,'Chapterhouse: Dune (Dune Chronicles #6)','Frank Herbert',3.91,'eng',436,15.99),(9780441172696,'Dune Messiah (Dune Chronicles #2)','Frank Herbert',3.88,'eng',331,15.99),(9780441294671,'God Emperor of Dune (Dune Chronicles  #4)','Frank Herbert',3.84,'eng',423,15.99),(9780441328000,'Heretics of Dune (Dune Chronicles #5)','Frank Herbert',3.86,'eng',471,15.99),(9780449146972,'The Changeling (Daughters of England  #15)','Philippa Carr',3.98,'eng',369,15.99),(9780451528612,'Anna Karenina','Leo Tolstoy/David Magarshack/Priscilla Meyer',4.05,'eng',960,15.99),(9780470045299,'eBay for Dummies','Marsha Collier',3.50,'eng',386,15.99),(9780471780939,'Power of an Hour: Business and Life Mastery in One Hour a Week','Dave Lakhani',3.34,'eng',205,15.99),(9780471933823,'eBay: Top 100 Simplified Tips & Tricks','Julia Wilkinson',4.27,'eng',260,15.99),(9780486437965,'Anna Karenina','Leo Tolstoy/Louise Maude/Aylmer Maude',4.05,'eng',752,15.99),(9780517149256,'The Ultimate Hitchhiker\'s Guide (Hitchhiker\'s Guide to the Galaxy  #1-5)','Douglas Adams',4.38,'eng',815,15.99),(9780517226957,'The Ultimate Hitchhiker\'s Guide: Five Complete Novels and One Story (Hitchhiker\'s Guide to the Galaxy  #1-5)','Douglas Adams',4.38,'eng',815,15.99),(9780521313254,'Tolstoy: Anna Karenina','Anthony Thorlby',4.19,'eng',128,15.99),(9780595321803,'The Changeling','Zilpha Keatley Snyder',4.17,'eng',228,15.99),(9780596523695,'Ruby Cookbook','Lucas Carlson/Leonard Richardson',3.84,'eng',873,15.99),(9780596527310,'Rails Cookbook: Recipes for Rapid Web Development with Ruby','Rob Orsini',3.48,'eng',514,15.99),(9780618212903,'The Lord of the Rings: The Art of the Fellowship of the Ring','Gary Russell',4.59,'eng',192,15.99),(9780618260584,'The Lord of the Rings (The Lord of the Rings  #1-3)','J.R.R. Tolkien/Alan  Lee',4.50,'en-US',1216,15.99),(9780618346257,'The Fellowship of the Ring (The Lord of the Rings  #1)','J.R.R. Tolkien',4.36,'eng',398,15.99),(9780618391004,'The Lord of the Rings: Weapons and Warfare','Chris   Smith/Christopher  Lee/Richard Taylor',4.53,'eng',218,15.99),(9780618510825,'The Lord of the Rings: Complete Visual Companion','Jude Fisher',4.50,'eng',224,15.99),(9780618517657,'The Lord of the Rings (The Lord of the Rings  #1-3)','J.R.R. Tolkien',4.50,'eng',1184,15.99),(9780670059676,'Changeling (Changeling  #1)','Delia Sherman',3.60,'eng',256,15.99),(9780679734994,'The Heidi Chronicles: Uncommon Women and Others & Isn\'t It Romantic','Wendy Wasserstein',3.84,'eng',249,15.99),(9780679767473,'The Untouchable','John Banville',3.95,'eng',367,15.99),(9780689840920,'Hatchet (Brian\'s Saga  #1)','Gary Paulsen',3.72,'eng',208,15.99),(9780739322208,'The Hitchhiker\'s Guide to the Galaxy (Hitchhiker\'s Guide to the Galaxy  #1)','Douglas Adams/Stephen Fry',4.22,'eng',6,15.99),(9780753454947,'Heidi (Heidi  #1-2)','Johanna Spyri/Beverly Cleary/Angelo  Rinaldi',3.99,'eng',352,15.99),(9780761129585,'What to Expect the First Year (What to Expect)','Heidi Murkoff/Sharon Mazel/Arlene Eisenberg/Sandee Hathaway/Mark D. Widome',3.89,'eng',832,15.99),(9780764559914,'ebay Timesaving Techniques for Dummies','Marsha Collier',3.39,'en-US',391,15.99),(9780764569241,'Starting an eBay Business for Dummies','Marsha Collier',3.55,'eng',384,15.99),(9780764584381,'eBay Business All-in-One Desk Reference for Dummies','Marsha Collier',3.89,'en-US',864,15.99),(9780765306470,'Dreamer of Dune: The Biography of Frank Herbert','Brian Herbert',4.01,'en-US',592,15.99),(9780765353702,'The Road to Dune','Frank Herbert/Brian Herbert/Kevin J. Anderson',3.88,'eng',426,15.99),(9780767903820,'I\'m a Stranger Here Myself: Notes on Returning to America After Twenty Years Away','Bill Bryson',3.90,'eng',304,15.99),(9780767903868,'In a Sunburned Country','Bill Bryson',4.07,'eng',335,15.99),(9780767908184,'A Short History of Nearly Everything','Bill Bryson',4.21,'eng',544,15.99),(9780767910439,'Bryson\'s Dictionary of Troublesome Words: A Writer\'s Guide to Getting It Right','Bill Bryson',3.87,'eng',256,15.99),(9780767915069,'Bill Bryson\'s African Diary','Bill Bryson',3.44,'eng',55,15.99),(9780778322276,'Dinner with Anna Karenina','Gloria Goldreich',2.99,'eng',360,15.99),(9780785260059,'The Power of One: One Person  One Rule  One Month','John C. Maxwell/Stephen R. Graves/Thomas G. Addington',4.28,'en-US',256,15.99),(9780800793616,'Always Enough: God\'s Miraculous Provision Among the Poorest Children on Earth','Heidi Baker/Rolland Baker',4.46,'eng',192,15.99),(9780806523491,'Ruby Ann\'s Down Home Trailer Park Cookbook','Ruby Ann Boxcar',4.12,'eng',240,15.99),(9780806525365,'Ruby Ann\'s Down Home Trailer Park BBQin\' Cookbook','Ruby Ann Boxcar',4.08,'eng',206,15.99),(9780822001836,'CliffsNotes on Tolstoy\'s Anna Karenina','Marianne Sturman/Leo Tolstoy',3.85,'eng',80,15.99),(9780822205104,'The Heidi Chronicles','Wendy Wasserstein',3.75,'eng',81,15.99),(9780871202864,'Mapping the Big Picture: Integrating Curriculum & Assessment K-12','Heidi Hayes Jacobs',3.68,'en-US',108,15.99),(9780871209993,'Getting Results with Curriculum Mapping','Heidi Hayes Jacobs',3.25,'eng',192,15.99),(9780972016414,'The Player\'s Handbook: The Ultimate Guide on Dating and Relationships','Heidi Fleiss/Libby Keatinge',3.82,'eng',123,15.99),(9780976540601,'\"Unauthorized Harry Potter Book Seven News: \"\"Half-Blood Prince\"\" Analysis and Speculation\"','W. Frederick Zimmerman',3.74,'en-US',152,15.99),(9780976694007,'Agile Web Development with Rails: A Pragmatic Guide','Dave Thomas/David Heinemeier Hansson/Leon Breedt/Mike Clark/Thomas  Fuchs/Andreas  Schwarz',3.84,'eng',558,15.99),(9781400052929,'The Hitchhiker\'s Guide to the Galaxy (Hitchhiker\'s Guide to the Galaxy  #1)','Douglas Adams',4.22,'eng',215,15.99),(9781557344496,'\"Hatchet: A Guide for Using \"\"Hatchet\"\" in the Classroom\"','Donna Ickes/Edward Sciranko/Keith Vasconcelles',4.00,'eng',48,15.99),(9781575606248,'Molly Hatchet - 5 of the Best','Molly Hatchet',4.33,'eng',56,15.99),(9781581805635,'Simply Beautiful Beading: 53 Quick and Easy Projects','Heidi Boyd',3.78,'en-US',128,15.99),(9781581807745,'Simply Beautiful Beaded Jewelry','Heidi Boyd',3.77,'en-US',128,15.99),(9781590301944,'The Changeling','Kate Horsley',3.55,'eng',339,15.99),(9781593080273,'Anna Karenina','Leo Tolstoy/Amy Mandelker/Constance Garnett',4.05,'eng',803,15.99),(9781593081775,'Anna Karenina','Leo Tolstoy/Constance Garnett/Amy Mandelker',4.05,'eng',803,15.99),(9781595580276,'Hatchet Jobs: Writings on Contemporary Fiction','Dale Peck',3.45,'en-US',228,15.99),(9781595962805,'A Changeling for All Seasons (Changeling Seasons #1)','Angela Knight/Sahara Kelly/Judy Mays/Marteeka Karland/Kate Douglas/Shelby Morgen/Lacey Savage/Kate Hill/Willa Okati',3.76,'eng',304,15.99),(9781596670235,'Active Literacy Across the Curriculum: Strategies for Reading  Writing  Speaking  and Listening','Heidi Hayes Jacobs',3.94,'eng',138,15.99),(9781852402877,'There\'s Always Enough: The Miraculous Move of God in Mozambique','Rolland Baker/Heidi Baker',4.46,'eng',192,15.99),(9781932386103,'Artesia: Adventures in the Known World','Mark Smylie',4.13,'eng',352,15.99);
/*!40000 ALTER TABLE `Book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Birthday` date DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Moses','Waelchi',NULL,'mo.waelchi@gmail.com'),(2,'Jade','Rippin','1989-08-17','RockyRoad78@yahoo.com'),(3,'Macie','Emard','1983-11-23','macieemard@gmail.com'),(4,'Benjamin','Goyette','1999-05-09','twilight1245@hotmail.com'),(5,'Kelly','Swift','2002-12-25','fangirl300@outlook.com'),(14,'Molly','Waters','2000-06-10','molly.waters@yahoo.com'),(16,'Francis','Molare','1983-07-19','randyran@gmail.cmo'),(17,'John','Doe','1999-02-19','John.Doe@gmail.com'),(18,'Jane','Doe','1989-06-12','jane.doe@gmail.com');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `EmployeeID` int NOT NULL,
  `StoreID` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Position` varchar(50) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `StoreID` (`StoreID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`StoreID`) REFERENCES `Store` (`StoreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,2,'Savannah','Terry','Bookseller'),(2,2,'Eduardo','Price','Manager'),(3,4,'Thalia','Lowe','Bookseller');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventory`
--

DROP TABLE IF EXISTS `Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inventory` (
  `StoreID` int NOT NULL,
  `ISBN_13` bigint NOT NULL,
  `Quantity` int NOT NULL,
  KEY `StoreID` (`StoreID`),
  KEY `ISBN_13` (`ISBN_13`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`StoreID`) REFERENCES `Store` (`StoreID`),
  CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`ISBN_13`) REFERENCES `Book` (`ISBN_13`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventory`
--

LOCK TABLES `Inventory` WRITE;
/*!40000 ALTER TABLE `Inventory` DISABLE KEYS */;
INSERT INTO `Inventory` VALUES (1,9781593081775,15),(2,9780439554893,0),(3,9781593081775,15),(4,9781593081775,15),(5,9780441102679,2),(1,9780439554893,0),(2,9781593081775,15),(3,9780325001531,3),(4,9780439554893,1),(5,9780439554893,10),(1,9780441102679,2),(2,9780441102679,0),(3,9780441102679,0),(4,9780441102679,4),(5,9781593081775,15),(4,9780072262780,3);
/*!40000 ALTER TABLE `Inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Purchase`
--

DROP TABLE IF EXISTS `Purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Purchase` (
  `CustomerID` int NOT NULL,
  `ISBN_13` bigint NOT NULL,
  `Date` date NOT NULL,
  `RewardPoints` int DEFAULT NULL,
  KEY `CustomerID` (`CustomerID`),
  KEY `ISBN_13` (`ISBN_13`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`),
  CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`ISBN_13`) REFERENCES `Book` (`ISBN_13`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Purchase`
--

LOCK TABLES `Purchase` WRITE;
/*!40000 ALTER TABLE `Purchase` DISABLE KEYS */;
INSERT INTO `Purchase` VALUES (2,9780439554893,'2024-05-11',0),(5,9780441102679,'2023-12-15',1500),(5,9781593081775,'2024-01-31',1500);
/*!40000 ALTER TABLE `Purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Store`
--

DROP TABLE IF EXISTS `Store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Store` (
  `StoreID` int NOT NULL,
  `Country` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Address` varchar(50) NOT NULL,
  PRIMARY KEY (`StoreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Store`
--

LOCK TABLES `Store` WRITE;
/*!40000 ALTER TABLE `Store` DISABLE KEYS */;
INSERT INTO `Store` VALUES (1,'1 University Dr','Orange','California','92866'),(2,'65688 Jevon Lake','North Dayna','Arkansas','79222'),(3,'4350 Collier Bypass','Ritchietown','South Carolina','80409'),(4,'671 Devan Street Suite 192','Easterview','Utah','67823'),(5,'352 Baby Wells','Bednarmouth','Arizona','39002');
/*!40000 ALTER TABLE `Store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vavailablebooks`
--

DROP TABLE IF EXISTS `vavailablebooks`;
/*!50001 DROP VIEW IF EXISTS `vavailablebooks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vavailablebooks` AS SELECT 
 1 AS `ISBN_13`,
 1 AS `Title`,
 1 AS `Author`,
 1 AS `Price`,
 1 AS `NumPages`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vavailablebooks`
--

/*!50001 DROP VIEW IF EXISTS `vavailablebooks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vavailablebooks` AS select distinct `inventory`.`ISBN_13` AS `ISBN_13`,`book`.`Title` AS `Title`,`book`.`Author` AS `Author`,`book`.`Price` AS `Price`,`book`.`NumPages` AS `NumPages` from (`inventory` join `book` on((`inventory`.`ISBN_13` = `book`.`ISBN_13`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-17 22:52:32
