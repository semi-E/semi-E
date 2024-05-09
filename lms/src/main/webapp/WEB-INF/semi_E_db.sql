-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema semi_e
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema semi_e
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `semi_e` DEFAULT CHARACTER SET utf8 ;
USE `semi_e` ;

-- -----------------------------------------------------
-- Table `semi_e`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_e`.`admin` (
  `admin_no` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `gender` ENUM('남', '여') NULL,
  `birthday` DATE NULL,
  `phone` INT NULL,
  `address` TEXT NULL,
  `email` VARCHAR(45) NULL,
  `grade` ENUM('마스터', '서브') NOT NULL DEFAULT '서브',
  PRIMARY KEY (`admin_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semi_e`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_e`.`department` (
  `department` VARCHAR(45) NOT NULL,
  `admin_no` INT NOT NULL,
  PRIMARY KEY (`department`),
  INDEX `fk_department_admin1_idx` (`admin_no` ASC) VISIBLE,
  CONSTRAINT `fk_department_admin1`
    FOREIGN KEY (`admin_no`)
    REFERENCES `semi_e`.`admin` (`admin_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semi_e`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_e`.`student` (
  `student_no` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `gender` ENUM('남', '여') NULL,
  `birthday` DATE NULL,
  `phone` INT NULL,
  `address` TEXT NULL,
  `state` ENUM('재학', '휴학', '자퇴', '퇴학') NOT NULL DEFAULT '재학',
  `email` VARCHAR(45) NULL,
  `department` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`student_no`),
  INDEX `fk_student_department1_idx` (`department` ASC) VISIBLE,
  CONSTRAINT `fk_student_department1`
    FOREIGN KEY (`department`)
    REFERENCES `semi_e`.`department` (`department`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semi_e`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_e`.`professor` (
  `professor_no` INT NOT NULL,
  `department` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `gender` ENUM('남', '여') NULL,
  `birthday` DATE NULL,
  `phone` INT NULL,
  `address` TEXT NULL,
  `state` ENUM('재직', '휴직', '퇴직') NOT NULL DEFAULT '재직',
  `email` VARCHAR(45) NULL,
  `office_no` VARCHAR(45) NULL,
  PRIMARY KEY (`professor_no`),
  INDEX `fk_professor_department1_idx` (`department` ASC) VISIBLE,
  CONSTRAINT `fk_professor_department1`
    FOREIGN KEY (`department`)
    REFERENCES `semi_e`.`department` (`department`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semi_e`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_e`.`subject` (
  `subject_name` VARCHAR(45) NOT NULL,
  `admin_no` INT NOT NULL,
  `credit` INT NOT NULL,
  PRIMARY KEY (`subject_name`),
  INDEX `fk_subject_admin1_idx` (`admin_no` ASC) VISIBLE,
  CONSTRAINT `fk_subject_admin1`
    FOREIGN KEY (`admin_no`)
    REFERENCES `semi_e`.`admin` (`admin_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semi_e`.`class_open_apply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_e`.`class_open_apply` (
  `class_apply_no` INT NOT NULL AUTO_INCREMENT,
  `subject_name` VARCHAR(45) NOT NULL,
  `professor_no` INT NOT NULL,
  `class_name` VARCHAR(45) NOT NULL,
  `period_start` INT NOT NULL,
  `days` ENUM('월', '화', '수', '목', '금') NOT NULL,
  `create_date` DATETIME NOT NULL DEFAULT now(),
  `update_date` DATETIME NOT NULL DEFAULT now(),
  `state` ENUM('승인', '거절') NULL,
  `admin_admin_no` INT NULL,
  `classroom` VARCHAR(45) NULL,
  PRIMARY KEY (`class_apply_no`),
  INDEX `fk_class_open_apply_subject1_idx` (`subject_name` ASC) VISIBLE,
  INDEX `fk_class_open_apply_professor1_idx` (`professor_no` ASC) VISIBLE,
  INDEX `fk_class_open_apply_admin1_idx` (`admin_admin_no` ASC) VISIBLE,
  CONSTRAINT `fk_class_open_apply_subject1`
    FOREIGN KEY (`subject_name`)
    REFERENCES `semi_e`.`subject` (`subject_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_open_apply_professor1`
    FOREIGN KEY (`professor_no`)
    REFERENCES `semi_e`.`professor` (`professor_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_open_apply_admin1`
    FOREIGN KEY (`admin_admin_no`)
    REFERENCES `semi_e`.`admin` (`admin_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semi_e`.`my_class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_e`.`my_class` (
  `student_no` INT NOT NULL,
  `class_apply_no` INT NOT NULL,
  PRIMARY KEY (`student_no`, `class_apply_no`),
  INDEX `fk_my_class_student_idx` (`student_no` ASC) VISIBLE,
  INDEX `fk_my_class_class_open_apply1_idx` (`class_apply_no` ASC) VISIBLE,
  CONSTRAINT `fk_my_class_student`
    FOREIGN KEY (`student_no`)
    REFERENCES `semi_e`.`student` (`student_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_my_class_class_open_apply1`
    FOREIGN KEY (`class_apply_no`)
    REFERENCES `semi_e`.`class_open_apply` (`class_apply_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semi_e`.`notice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_e`.`notice` (
  `notice_no` INT NOT NULL AUTO_INCREMENT,
  `admin_no` INT NOT NULL,
  `create_date` DATETIME NOT NULL DEFAULT now(),
  `update_date` DATETIME NOT NULL DEFAULT now(),
  `title` VARCHAR(45) NOT NULL,
  `content` TEXT NOT NULL,
  PRIMARY KEY (`notice_no`),
  INDEX `fk_notice_admin1_idx` (`admin_no` ASC) VISIBLE,
  CONSTRAINT `fk_notice_admin1`
    FOREIGN KEY (`admin_no`)
    REFERENCES `semi_e`.`admin` (`admin_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semi_e`.`assignment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_e`.`assignment` (
  `assignment_no` INT NOT NULL AUTO_INCREMENT,
  `class_apply_no` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `content` TEXT NOT NULL,
  `end_date` DATETIME NOT NULL,
  `create_date` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`assignment_no`),
  INDEX `fk_assignment_class_open_apply1_idx` (`class_apply_no` ASC) VISIBLE,
  CONSTRAINT `fk_assignment_class_open_apply1`
    FOREIGN KEY (`class_apply_no`)
    REFERENCES `semi_e`.`class_open_apply` (`class_apply_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semi_e`.`student_assignment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_e`.`student_assignment` (
  `assignment_no` INT NOT NULL,
  `student_no` INT NOT NULL,
  `class_apply_no` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `content` TEXT NOT NULL,
  `create_date` DATETIME NOT NULL DEFAULT now(),
  `update_date` DATETIME NOT NULL DEFAULT now(),
  `state` ENUM('O', 'X') NOT NULL DEFAULT 'X',
  PRIMARY KEY (`assignment_no`, `student_no`, `class_apply_no`),
  INDEX `fk_student_assignment_assignment1_idx` (`assignment_no` ASC) VISIBLE,
  INDEX `fk_student_assignment_my_class1_idx` (`student_no` ASC, `class_apply_no` ASC) VISIBLE,
  CONSTRAINT `fk_student_assignment_assignment1`
    FOREIGN KEY (`assignment_no`)
    REFERENCES `semi_e`.`assignment` (`assignment_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_assignment_my_class1`
    FOREIGN KEY (`student_no` , `class_apply_no`)
    REFERENCES `semi_e`.`my_class` (`student_no` , `class_apply_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semi_e`.`grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_e`.`grade` (
  `student_no` INT NOT NULL,
  `class_apply_no` INT NOT NULL,
  `mid_exam` INT NOT NULL,
  `final_exam` INT NOT NULL,
  `year` INT NOT NULL,
  `semester` ENUM('1', '2') NOT NULL,
  PRIMARY KEY (`student_no`, `class_apply_no`),
  INDEX `fk_grade_my_class1_idx` (`student_no` ASC, `class_apply_no` ASC) VISIBLE,
  CONSTRAINT `fk_grade_my_class1`
    FOREIGN KEY (`student_no` , `class_apply_no`)
    REFERENCES `semi_e`.`my_class` (`student_no` , `class_apply_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semi_e`.`attendance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_e`.`attendance` (
  `week` INT NOT NULL,
  `student_no` INT NOT NULL,
  `class_apply_no` INT NOT NULL,
  `state` ENUM('O', 'X', '/') CHARACTER SET 'armscii8' NOT NULL DEFAULT 'X',
  PRIMARY KEY (`week`, `student_no`, `class_apply_no`),
  INDEX `fk_attendance_my_class1_idx` (`student_no` ASC, `class_apply_no` ASC) VISIBLE,
  CONSTRAINT `fk_attendance_my_class1`
    FOREIGN KEY (`student_no` , `class_apply_no`)
    REFERENCES `semi_e`.`my_class` (`student_no` , `class_apply_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semi_e`.`class_basket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_e`.`class_basket` (
  `student_no` INT NOT NULL,
  `class_apply_no` INT NOT NULL,
  PRIMARY KEY (`student_no`, `class_apply_no`),
  INDEX `fk_class_basket_student1_idx` (`student_no` ASC) VISIBLE,
  INDEX `fk_class_basket_class_open_apply1_idx` (`class_apply_no` ASC) VISIBLE,
  CONSTRAINT `fk_class_basket_student1`
    FOREIGN KEY (`student_no`)
    REFERENCES `semi_e`.`student` (`student_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_basket_class_open_apply1`
    FOREIGN KEY (`class_apply_no`)
    REFERENCES `semi_e`.`class_open_apply` (`class_apply_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semi_e`.`student_pw_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_e`.`student_pw_history` (
  `pw` VARCHAR(45) NOT NULL,
  `student_no` INT NOT NULL,
  `create_date` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`pw`, `student_no`),
  INDEX `fk_student_pw_history_student1_idx` (`student_no` ASC) VISIBLE,
  CONSTRAINT `fk_student_pw_history_student1`
    FOREIGN KEY (`student_no`)
    REFERENCES `semi_e`.`student` (`student_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semi_e`.`professor_pw_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_e`.`professor_pw_history` (
  `pw` VARCHAR(45) NOT NULL,
  `professor_no` INT NOT NULL,
  `create_date` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`pw`, `professor_no`),
  INDEX `fk_professor_pw_history_professor1_idx` (`professor_no` ASC) VISIBLE,
  CONSTRAINT `fk_professor_pw_history_professor1`
    FOREIGN KEY (`professor_no`)
    REFERENCES `semi_e`.`professor` (`professor_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semi_e`.`admin_pw_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_e`.`admin_pw_history` (
  `pw` VARCHAR(45) NOT NULL,
  `admin_no` INT NOT NULL,
  `create_date` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`pw`, `admin_no`),
  INDEX `fk_admin_pw_history_admin1_idx` (`admin_no` ASC) VISIBLE,
  CONSTRAINT `fk_admin_pw_history_admin1`
    FOREIGN KEY (`admin_no`)
    REFERENCES `semi_e`.`admin` (`admin_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
