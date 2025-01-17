-- MySQL dump 10.13  Distrib 8.0.22, for osx10.16 (x86_64)
--
-- Host: 127.0.0.1    Database: staging 
-- ------------------------------------------------------
-- Server version	5.7.33-google-log

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
-- Current Database: `staging`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `staging` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `staging`;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testrail_project_id` int(11) NOT NULL,
  `project_name_abbrev` varchar(25) NOT NULL,
  `project_name` varchar(75) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `test_suites`
--

DROP TABLE IF EXISTS `test_suites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_suites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testrail_project_id` int(11) NOT NULL,
  `testrail_test_suites_id` int(11) NOT NULL,
  `test_suite_name` varchar(75) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `test_sub_suites`
--

DROP TABLE IF EXISTS `test_sub_suites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_sub_suites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testrail_id` int(11) NOT NULL,
  `test_sub_suite_abbrev` varchar(25) NOT NULL,
  `test_sub_suite` varchar(75) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `test_automation_status`
--

DROP TABLE IF EXISTS `test_automation_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_automation_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testrail_id` int(11) NOT NULL,
  `status` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `test_automation_coverage`
--

DROP TABLE IF EXISTS `test_automation_coverage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_automation_coverage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testrail_id` int(11) NOT NULL,
  `coverage` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_run_result_types`
--

DROP TABLE IF EXISTS `test_run_result_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_run_result_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testrail_id` int(11) NOT NULL,
  `result_type_abbrev` varchar(25) NOT NULL,
  `result_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `github_issue_types`
--

DROP TABLE IF EXISTS `github_issue_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `github_issue_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_type` varchar(75) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `report_test_case_coverage`
--

DROP TABLE IF EXISTS `report_test_case_coverage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_test_case_coverage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projects_id` int(11) NOT NULL, 
  `testrail_test_suites_id` int(11) NOT NULL, 
  `test_sub_suites_id` int(11) NOT NULL DEFAULT 1, 
  `test_automation_status_id` int(11) NOT NULL, 
  `test_automation_coverage_id` int(11) NOT NULL, 
  `test_count` int(11) NOT NULL DEFAULT 0, 
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY(`projects_id`) REFERENCES projects(`id`),
  FOREIGN KEY(`test_sub_suites_id`) REFERENCES test_sub_suites(`id`),
  FOREIGN KEY(`test_automation_status_id`) REFERENCES test_automation_status(`id`),
  FOREIGN KEY(`test_automation_coverage_id`) REFERENCES test_automation_coverage(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `report_test_run_counts`
--

DROP TABLE IF EXISTS `report_test_run_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_test_run_counts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projects_id` int(11) NOT NULL, 
  `testrail_suites_id` int(11) NOT NULL, 
  `test_sub_suites_id` int(11) NOT NULL DEFAULT 1, 
  `testrail_run_id` int(11) NOT NULL, 
  `test_case_passed_count` int(11) NOT NULL DEFAULT 0, 
  `test_case_blocked_count` int(11) NOT NULL DEFAULT 0, 
  `test_case_retest_count` int(11) NOT NULL DEFAULT 0, 
  `test_case_failed_count` int(11) NOT NULL DEFAULT 0, 
  `testrail_created_on` date,
  `testrail_completed_on` date,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY(`projects_id`) REFERENCES projects(`id`),
  FOREIGN KEY(`test_sub_suites_id`) REFERENCES test_sub_suites(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `report_github_issues`
--

DROP TABLE IF EXISTS `report_github_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_github_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projects_id` int(11) NOT NULL, 
  `issue_id` int(11) NOT NULL, 
  `issue_title` varchar(75) DEFAULT NULL,
  `issue_types_id` int(11) DEFAULT 1, 
  `github_created_at` date NOT NULL,
  `github_updated_at` date DEFAULT NULL,
  `github_closed_at` date DEFAULT NULL,
  `github_merged_at` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY(`projects_id`) REFERENCES projects(`id`),
  FOREIGN KEY(`issue_types_id`) REFERENCES github_issue_types(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--
-- data for reference table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` (`testrail_project_id`, `project_name_abbrev`, `project_name`) VALUES (59, 'fenix', 'Fenix Browser'), (48, 'focus-android', 'Focus for Android'), (14, 'firefox-ios', 'Firefox for iOS'), (27, 'focus-ios', 'Focus for iOS'), (58, 'reference-browser', 'Reference Browser');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;


--
-- data for reference table `test_sub_suites`
--

LOCK TABLES `test_sub_suites` WRITE;
/*!40000 ALTER TABLE `test_sub_suites` DISABLE KEYS */;
INSERT INTO `test_sub_suites` (`testrail_id`, `test_sub_suite_abbrev`, `test_sub_suite`) VALUES (0, 'functional', 'Functional'), (1, 'smoke', 'Smoke & Sanity'), (2, 'accessibility', 'Accessibility'), (3, 'l10n', 'L10n'), (4, 'security', 'Security'), (6, 'fxa', 'FxA & Sync'), (7, 'other', 'Other');
/*!40000 ALTER TABLE `test_sub_suites` ENABLE KEYS */;
UNLOCK TABLES;


--
-- data for reference table `test_automation_status`
--

LOCK TABLES `test_automation_status` WRITE;
/*!40000 ALTER TABLE `test_automation_status` DISABLE KEYS */;
INSERT INTO `test_automation_status`(`testrail_id`, `status`) VALUES (1, 'Untriaged'), (2, 'Suitable'), (3, 'Unsuitable'), (4, 'Completed'), (5, 'Disabled');
/*!40000 ALTER TABLE `test_automation_status` ENABLE KEYS */;
UNLOCK TABLES;


--
-- data for reference table `test_automation_coverage`
--

LOCK TABLES `test_automation_coverage` WRITE;
/*!40000 ALTER TABLE `test_automation_coverage` DISABLE KEYS */;
INSERT INTO `test_automation_coverage`(`testrail_id`, `coverage`) VALUES (1, 'None'), (2, 'Partial'), (3, 'Full');
/*!40000 ALTER TABLE `test_automation_coverage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- data for reference table `test_run_result_types`
--

LOCK TABLES `test_run_result_types` WRITE;
/*!40000 ALTER TABLE `test_run_result_types` DISABLE KEYS */;
INSERT INTO `test_run_result_types`(`testrail_id`, `result_type_abbrev`, `result_type`) VALUES 
(1, 'passed_count', 'Passed'), 
(2, 'blocked_count', 'Blocked'), 
(3, 'untested_count', 'Untested'), 
(4, 'retest_count', 'Failed (known)'), 
(5, 'failed_count', 'Failed (new)'), 
(6, 'untested_count', 'Not Applicable'), 
(7, 'untested_count', 'Not Available');
/*!40000 ALTER TABLE `test_run_result_types` ENABLE KEYS */;
UNLOCK TABLES;


--
-- data for reference table `github_issue_types`
--

LOCK TABLES `github_issue_types` WRITE;
/*!40000 ALTER TABLE `github_issue_types` DISABLE KEYS */;
INSERT INTO `github_issue_types`(`id`, `issue_type`) VALUES (1, 'issue'), (2, 'pr');
/*!40000 ALTER TABLE `github_issue_types` ENABLE KEYS */;
UNLOCK TABLES;
