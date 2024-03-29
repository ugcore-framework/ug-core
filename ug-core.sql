CREATE DATABASE IF NOT EXISTS `UgCore`;
USE `UgCore`;

CREATE TABLE IF NOT EXISTS `users` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `identifier` VARCHAR(255) NOT NULL,
    `money` LONGTEXT NULL DEFAULT NULL,
    `group` VARCHAR(50) NULL DEFAULT 'user',
    `inventory` LONGTEXT NULL DEFAULT NULL,
    `job` LONGTEXT NULL DEFAULT '{"job":"unemployed","grade":0}',
    `loadout` LONGTEXT NULL DEFAULT NULL,
    `metadata` LONGTEXT NULL DEFAULT NULL,
    `position` LONGTEXT NULL DEFAULT NULL,
	`skin` LONGTEXT NULL DEFAULT NULL,
	`firstName` VARCHAR(16) NULL DEFAULT NULL,
	`lastName` VARCHAR(16) NULL DEFAULT NULL,
	`dateOfBirth` VARCHAR(10) NULL DEFAULT NULL,
	`sex` VARCHAR(1) NULL DEFAULT NULL,
	`height` INT NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `jobs` (
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) DEFAULT NULL,
	PRIMARY KEY (`name`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `jobgrades` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`jobName` VARCHAR(50) DEFAULT NULL,
	`grade` INT NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`salary` INT NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `items` (
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`weight` INT NOT NULL DEFAULT 1,
	`rare` TINYINT NOT NULL DEFAULT 0,
	`canRemove` TINYINT NOT NULL DEFAULT 1,
	PRIMARY KEY (`name`)
) ENGINE=InnoDB;

INSERT INTO `jobs` VALUES
    ('unemployed', 'Unemployed')
;

INSERT INTO `jobgrades` VALUES
    (1, 'unemployed', 0, 'unemployed', 'Unemployed', 200)
;