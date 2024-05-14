-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.24-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- semi_e 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `semi_e`;
CREATE DATABASE IF NOT EXISTS `semi_e` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `semi_e`;

-- 테이블 semi_e.admin 구조 내보내기
DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_no` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `gender` enum('남','여') DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `grade` enum('마스터','서브') NOT NULL DEFAULT '서브',
  PRIMARY KEY (`admin_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 semi_e.admin:~2 rows (대략적) 내보내기
INSERT INTO `admin` (`admin_no`, `name`, `gender`, `birthday`, `phone`, `address`, `email`, `grade`) VALUES
	(120240001, 'admin', NULL, NULL, NULL, NULL, '1234@1234', '마스터'),
	(120240002, 'admin2', NULL, NULL, NULL, NULL, '1234@1234', '서브');

-- 테이블 semi_e.admin_pw_history 구조 내보내기
DROP TABLE IF EXISTS `admin_pw_history`;
CREATE TABLE IF NOT EXISTS `admin_pw_history` (
  `pw` varchar(45) NOT NULL DEFAULT '1234',
  `admin_no` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`pw`,`admin_no`,`create_date`) USING BTREE,
  KEY `fk_admin_pw_history_admin1_idx` (`admin_no`),
  CONSTRAINT `fk_admin_pw_history_admin1` FOREIGN KEY (`admin_no`) REFERENCES `admin` (`admin_no`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 semi_e.admin_pw_history:~2 rows (대략적) 내보내기
INSERT INTO `admin_pw_history` (`pw`, `admin_no`, `create_date`) VALUES
	('1234', 120240001, '2024-05-09 14:17:04'),
	('1234', 120240002, '2024-05-09 14:17:04');

-- 테이블 semi_e.assignment 구조 내보내기
DROP TABLE IF EXISTS `assignment`;
CREATE TABLE IF NOT EXISTS `assignment` (
  `assignment_no` int(11) NOT NULL AUTO_INCREMENT,
  `class_apply_no` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `end_date` datetime NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`assignment_no`),
  KEY `fk_assignment_class_open_apply1_idx` (`class_apply_no`),
  CONSTRAINT `fk_assignment_class_open_apply1` FOREIGN KEY (`class_apply_no`) REFERENCES `class_open_apply` (`class_apply_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 semi_e.assignment:~2 rows (대략적) 내보내기
INSERT INTO `assignment` (`assignment_no`, `class_apply_no`, `title`, `content`, `end_date`, `create_date`) VALUES
	(1, 2, 'Hello', 'Hello Wordl! 치기', '2024-05-14 10:44:54', '2024-05-13 10:44:59'),
	(2, 2, '별짓기', '* ** *** **** *****나오게하기', '2024-05-14 10:44:54', '2024-05-13 10:44:59');

-- 테이블 semi_e.attendance 구조 내보내기
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `week` int(11) NOT NULL,
  `student_no` int(11) NOT NULL,
  `class_apply_no` int(11) NOT NULL,
  `state` enum('O','X','/') CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL DEFAULT 'X',
  PRIMARY KEY (`week`,`student_no`,`class_apply_no`),
  KEY `fk_attendance_my_class1_idx` (`student_no`,`class_apply_no`),
  CONSTRAINT `fk_attendance_my_class1` FOREIGN KEY (`student_no`, `class_apply_no`) REFERENCES `my_class` (`student_no`, `class_apply_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 semi_e.attendance:~60 rows (대략적) 내보내기
INSERT INTO `attendance` (`week`, `student_no`, `class_apply_no`, `state`) VALUES
	(1, 20240101, 2, 'X'),
	(1, 20240102, 2, 'X'),
	(1, 20240103, 2, 'X'),
	(1, 20240104, 2, 'X'),
	(2, 20240101, 2, 'X'),
	(2, 20240102, 2, 'X'),
	(2, 20240103, 2, 'X'),
	(2, 20240104, 2, 'X'),
	(3, 20240101, 2, 'X'),
	(3, 20240102, 2, 'X'),
	(3, 20240103, 2, 'X'),
	(3, 20240104, 2, 'X'),
	(4, 20240101, 2, 'X'),
	(4, 20240102, 2, 'X'),
	(4, 20240103, 2, 'X'),
	(4, 20240104, 2, 'X'),
	(5, 20240101, 2, 'X'),
	(5, 20240102, 2, 'X'),
	(5, 20240103, 2, 'X'),
	(5, 20240104, 2, 'X'),
	(6, 20240101, 2, 'X'),
	(6, 20240102, 2, 'X'),
	(6, 20240103, 2, 'X'),
	(6, 20240104, 2, 'X'),
	(7, 20240101, 2, 'X'),
	(7, 20240102, 2, 'X'),
	(7, 20240103, 2, 'X'),
	(7, 20240104, 2, 'X'),
	(8, 20240101, 2, 'X'),
	(8, 20240102, 2, 'X'),
	(8, 20240103, 2, 'X'),
	(8, 20240104, 2, 'X'),
	(9, 20240101, 2, 'X'),
	(9, 20240102, 2, 'X'),
	(9, 20240103, 2, 'X'),
	(9, 20240104, 2, 'X'),
	(10, 20240101, 2, 'X'),
	(10, 20240102, 2, 'X'),
	(10, 20240103, 2, 'X'),
	(10, 20240104, 2, 'X'),
	(11, 20240101, 2, 'X'),
	(11, 20240102, 2, 'X'),
	(11, 20240103, 2, 'X'),
	(11, 20240104, 2, 'X'),
	(12, 20240101, 2, 'X'),
	(12, 20240102, 2, 'X'),
	(12, 20240103, 2, 'X'),
	(12, 20240104, 2, 'X'),
	(13, 20240101, 2, 'X'),
	(13, 20240102, 2, 'X'),
	(13, 20240103, 2, 'X'),
	(13, 20240104, 2, 'X'),
	(14, 20240101, 2, 'X'),
	(14, 20240102, 2, 'X'),
	(14, 20240103, 2, 'X'),
	(14, 20240104, 2, 'X'),
	(15, 20240101, 2, 'X'),
	(15, 20240102, 2, 'X'),
	(15, 20240103, 2, 'X'),
	(15, 20240104, 2, 'X');

-- 테이블 semi_e.class_basket 구조 내보내기
DROP TABLE IF EXISTS `class_basket`;
CREATE TABLE IF NOT EXISTS `class_basket` (
  `student_no` int(11) NOT NULL,
  `class_apply_no` int(11) NOT NULL,
  PRIMARY KEY (`student_no`,`class_apply_no`),
  KEY `fk_class_basket_student1_idx` (`student_no`),
  KEY `fk_class_basket_class_open_apply1_idx` (`class_apply_no`),
  CONSTRAINT `fk_class_basket_class_open_apply1` FOREIGN KEY (`class_apply_no`) REFERENCES `class_open_apply` (`class_apply_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_basket_student1` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 semi_e.class_basket:~2 rows (대략적) 내보내기
INSERT INTO `class_basket` (`student_no`, `class_apply_no`) VALUES
	(20241001, 1),
	(20241001, 3);

-- 테이블 semi_e.class_open_apply 구조 내보내기
DROP TABLE IF EXISTS `class_open_apply`;
CREATE TABLE IF NOT EXISTS `class_open_apply` (
  `class_apply_no` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(45) NOT NULL,
  `professor_no` int(11) NOT NULL,
  `class_name` varchar(45) NOT NULL,
  `period_start` int(11) NOT NULL,
  `days` enum('월','화','수','목','금') NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `update_date` datetime NOT NULL DEFAULT current_timestamp(),
  `state` enum('승인','거절','승인 대기') DEFAULT '승인 대기',
  `admin_no` int(11) DEFAULT NULL,
  `classroom` varchar(45) DEFAULT NULL,
  `year` year(4) NOT NULL,
  `semester` enum('1','2') NOT NULL,
  PRIMARY KEY (`class_apply_no`),
  KEY `fk_class_open_apply_subject1_idx` (`subject_name`),
  KEY `fk_class_open_apply_professor1_idx` (`professor_no`),
  CONSTRAINT `fk_class_open_apply_professor1` FOREIGN KEY (`professor_no`) REFERENCES `professor` (`professor_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_open_apply_subject1` FOREIGN KEY (`subject_name`) REFERENCES `subject` (`subject_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 semi_e.class_open_apply:~6 rows (대략적) 내보내기
INSERT INTO `class_open_apply` (`class_apply_no`, `subject_name`, `professor_no`, `class_name`, `period_start`, `days`, `create_date`, `update_date`, `state`, `admin_no`, `classroom`, `year`, `semester`) VALUES
	(1, '자바', 220241001, '자바의 기초', 1, '월', '2024-05-11 22:03:36', '2024-05-11 22:03:38', '승인 대기', NULL, NULL, '2024', '1'),
	(2, '자바', 220241001, '자바의 기초', 3, '화', '2024-05-11 22:04:18', '2024-05-11 22:04:18', '승인', 120240001, '1', '2024', '1'),
	(3, '파이썬', 220241001, '파이썬의 기초', 1, '화', '2024-05-11 22:05:18', '2024-05-11 22:05:18', '승인 대기', NULL, NULL, '2024', '1'),
	(4, '파이썬', 220241001, '파이썬의 기초', 5, '수', '2024-05-11 22:05:52', '2024-05-11 22:06:01', '승인', 120240001, '2', '2024', '1'),
	(5, '건축학', 220240101, '건축학의 기초', 1, '금', '2024-05-11 22:07:19', '2024-05-11 22:07:19', '승인 대기', NULL, NULL, '2024', '1'),
	(6, '건축학', 220240101, '건축학의 기초', 4, '목', '2024-05-11 22:07:53', '2024-05-11 22:08:02', '승인', 120240001, '3', '2024', '1');

-- 테이블 semi_e.department 구조 내보내기
DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `department` varchar(45) NOT NULL,
  `admin_no` int(11) NOT NULL,
  PRIMARY KEY (`department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 semi_e.department:~10 rows (대략적) 내보내기
INSERT INTO `department` (`department`, `admin_no`) VALUES
	('건축학과', 120240001),
	('로봇공학과', 120240001),
	('블록체인학과', 120240001),
	('생명공학과', 120240001),
	('신소재공학과', 120240001),
	('인공지능학과', 120240001),
	('자동차공학과', 120240001),
	('전기전자공학과', 120240001),
	('정보보안학과', 120240001),
	('컴퓨터공학과', 120240001);

-- 테이블 semi_e.grade 구조 내보내기
DROP TABLE IF EXISTS `grade`;
CREATE TABLE IF NOT EXISTS `grade` (
  `student_no` int(11) NOT NULL,
  `class_apply_no` int(11) NOT NULL,
  `mid_exam` int(11) NOT NULL,
  `final_exam` int(11) NOT NULL,
  PRIMARY KEY (`student_no`,`class_apply_no`),
  KEY `fk_grade_my_class1_idx` (`student_no`,`class_apply_no`),
  CONSTRAINT `fk_grade_my_class1` FOREIGN KEY (`student_no`, `class_apply_no`) REFERENCES `my_class` (`student_no`, `class_apply_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 semi_e.grade:~0 rows (대략적) 내보내기

-- 테이블 semi_e.my_class 구조 내보내기
DROP TABLE IF EXISTS `my_class`;
CREATE TABLE IF NOT EXISTS `my_class` (
  `student_no` int(11) NOT NULL,
  `class_apply_no` int(11) NOT NULL,
  PRIMARY KEY (`student_no`,`class_apply_no`),
  KEY `fk_my_class_student_idx` (`student_no`),
  KEY `fk_my_class_class_open_apply1_idx` (`class_apply_no`),
  CONSTRAINT `fk_my_class_class_open_apply1` FOREIGN KEY (`class_apply_no`) REFERENCES `class_open_apply` (`class_apply_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_my_class_student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 semi_e.my_class:~6 rows (대략적) 내보내기
INSERT INTO `my_class` (`student_no`, `class_apply_no`) VALUES
	(20240101, 2),
	(20240102, 2),
	(20240103, 2),
	(20240103, 4),
	(20240103, 6),
	(20240104, 2);

-- 테이블 semi_e.notice 구조 내보내기
DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `notice_no` int(11) NOT NULL AUTO_INCREMENT,
  `admin_no` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `update_date` datetime NOT NULL DEFAULT current_timestamp(),
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`notice_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 semi_e.notice:~0 rows (대략적) 내보내기

-- 테이블 semi_e.professor 구조 내보내기
DROP TABLE IF EXISTS `professor`;
CREATE TABLE IF NOT EXISTS `professor` (
  `professor_no` int(11) NOT NULL,
  `department` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `gender` enum('남','여') DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `state` enum('재직','휴직','퇴직') NOT NULL DEFAULT '재직',
  `email` varchar(45) DEFAULT NULL,
  `office_no` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`professor_no`),
  KEY `fk_professor_department1_idx` (`department`),
  CONSTRAINT `fk_professor_department1` FOREIGN KEY (`department`) REFERENCES `department` (`department`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 semi_e.professor:~2 rows (대략적) 내보내기
INSERT INTO `professor` (`professor_no`, `department`, `name`, `gender`, `birthday`, `phone`, `address`, `state`, `email`, `office_no`) VALUES
	(220240101, '건축학과', '박성환', '남', NULL, NULL, NULL, '재직', '', NULL),
	(220241001, '컴퓨터공학과', '김가남', '여', NULL, NULL, NULL, '재직', NULL, NULL);

-- 테이블 semi_e.professor_pw_history 구조 내보내기
DROP TABLE IF EXISTS `professor_pw_history`;
CREATE TABLE IF NOT EXISTS `professor_pw_history` (
  `pw` varchar(45) NOT NULL DEFAULT '1234',
  `professor_no` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`pw`,`professor_no`,`create_date`) USING BTREE,
  KEY `fk_professor_pw_history_professor1_idx` (`professor_no`),
  CONSTRAINT `fk_professor_pw_history_professor1` FOREIGN KEY (`professor_no`) REFERENCES `professor` (`professor_no`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 semi_e.professor_pw_history:~6 rows (대략적) 내보내기
INSERT INTO `professor_pw_history` (`pw`, `professor_no`, `create_date`) VALUES
	('1234', 220240101, '2024-05-10 23:15:43'),
	('1234', 220241001, '2024-05-10 23:15:43'),
	('1234', 220241001, '2024-05-11 00:03:40'),
	('1235', 220241001, '2024-05-11 00:03:15'),
	('1236', 220241001, '2024-05-11 00:03:30'),
	('1237', 220241001, '2024-05-11 00:03:35');

-- 테이블 semi_e.student 구조 내보내기
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `student_no` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `gender` enum('남','여') DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `state` enum('재학','휴학','자퇴','퇴학') NOT NULL DEFAULT '재학',
  `email` varchar(45) DEFAULT NULL,
  `department` varchar(45) NOT NULL,
  PRIMARY KEY (`student_no`),
  KEY `fk_student_department1_idx` (`department`),
  CONSTRAINT `fk_student_department1` FOREIGN KEY (`department`) REFERENCES `department` (`department`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 semi_e.student:~10 rows (대략적) 내보내기
INSERT INTO `student` (`student_no`, `name`, `gender`, `birthday`, `phone`, `address`, `state`, `email`, `department`) VALUES
	(20240101, '서기원', '남', NULL, NULL, NULL, '재학', NULL, '건축학과'),
	(20240102, '배지훈', '남', NULL, NULL, NULL, '재학', NULL, '건축학과'),
	(20240103, '박상진', '남', NULL, NULL, NULL, '재학', NULL, '건축학과'),
	(20240104, '류현종', '남', NULL, NULL, NULL, '재학', NULL, '건축학과'),
	(20240105, '반지현', '여', NULL, NULL, NULL, '재학', NULL, '건축학과'),
	(20241001, '나연주', '여', NULL, NULL, NULL, '재학', NULL, '컴퓨터공학과'),
	(20241002, '김태리', '여', NULL, NULL, NULL, '재학', NULL, '컴퓨터공학과'),
	(20241003, '서기범', '남', NULL, NULL, NULL, '재학', NULL, '컴퓨터공학과'),
	(20241004, '임아영', '여', NULL, NULL, NULL, '재학', NULL, '컴퓨터공학과'),
	(20241005, '이용훈', '남', NULL, NULL, NULL, '재학', NULL, '컴퓨터공학과');

-- 테이블 semi_e.student_assignment 구조 내보내기
DROP TABLE IF EXISTS `student_assignment`;
CREATE TABLE IF NOT EXISTS `student_assignment` (
  `assignment_no` int(11) NOT NULL,
  `student_no` int(11) NOT NULL,
  `class_apply_no` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `update_date` datetime NOT NULL DEFAULT current_timestamp(),
  `state` enum('O','X') NOT NULL DEFAULT 'O',
  `file` varchar(50) NOT NULL,
  PRIMARY KEY (`assignment_no`,`student_no`,`class_apply_no`),
  KEY `fk_student_assignment_assignment1_idx` (`assignment_no`),
  KEY `fk_student_assignment_my_class1_idx` (`student_no`,`class_apply_no`),
  CONSTRAINT `fk_student_assignment_assignment1` FOREIGN KEY (`assignment_no`) REFERENCES `assignment` (`assignment_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_assignment_my_class1` FOREIGN KEY (`student_no`, `class_apply_no`) REFERENCES `my_class` (`student_no`, `class_apply_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 semi_e.student_assignment:~2 rows (대략적) 내보내기
INSERT INTO `student_assignment` (`assignment_no`, `student_no`, `class_apply_no`, `title`, `content`, `create_date`, `update_date`, `state`, `file`) VALUES
	(1, 20240103, 2, '과제 제출', 'Hello! World!', '2024-05-13 12:21:46', '2024-05-13 12:21:46', 'O', ''),
	(2, 20240103, 2, '과제 제출 합니다', '*', '2024-05-13 14:36:44', '2024-05-13 14:36:44', 'O', '');

-- 테이블 semi_e.student_pw_history 구조 내보내기
DROP TABLE IF EXISTS `student_pw_history`;
CREATE TABLE IF NOT EXISTS `student_pw_history` (
  `pw` varchar(45) NOT NULL DEFAULT '1234',
  `student_no` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`pw`,`student_no`,`create_date`) USING BTREE,
  KEY `fk_student_pw_history_student1_idx` (`student_no`),
  CONSTRAINT `fk_student_pw_history_student1` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 semi_e.student_pw_history:~10 rows (대략적) 내보내기
INSERT INTO `student_pw_history` (`pw`, `student_no`, `create_date`) VALUES
	('1234', 20240101, '2024-05-09 14:49:10'),
	('1234', 20240102, '2024-05-09 14:49:10'),
	('1234', 20240103, '2024-05-09 14:49:10'),
	('1234', 20240104, '2024-05-09 14:49:10'),
	('1234', 20240105, '2024-05-09 14:49:10'),
	('1234', 20241001, '2024-05-09 14:49:10'),
	('1234', 20241002, '2024-05-09 14:49:10'),
	('1234', 20241003, '2024-05-09 14:49:10'),
	('1234', 20241004, '2024-05-09 14:49:10'),
	('1234', 20241005, '2024-05-09 14:49:10');

-- 테이블 semi_e.subject 구조 내보내기
DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `subject_name` varchar(45) NOT NULL,
  `admin_no` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  PRIMARY KEY (`subject_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 semi_e.subject:~3 rows (대략적) 내보내기
INSERT INTO `subject` (`subject_name`, `admin_no`, `credit`) VALUES
	('건축학', 120240001, 3),
	('자바', 120240001, 3),
	('파이썬', 120240001, 3);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
