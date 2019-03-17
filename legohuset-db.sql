DROP SCHEMA IF EXISTS `legohuset`;
CREATE SCHEMA IF NOT EXISTS `legohuset`;
USE `legohuset`;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(45) NOT NULL UNIQUE,
    `password` VARCHAR(45) NOT NULL,
    `role` VARCHAR(45) NOT NULL DEFAULT 'customer',
    `created` DATETIME DEFAULT now(),
    PRIMARY KEY (`id`)
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` (`id`, `email`, `password`, `role`) VALUES
(1, 'adminjensen@mail.com', 'admin', 'employee'),
(2, 'joakimbotsen@mail.com', 'botsen', 'customer'),
(3, 'johndoe@mail.com', 'john', 'customer');

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
    `user_id` INT(11) NOT NULL,
    `created` DATETIME DEFAULT now(),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `odetails`;
CREATE TABLE `odetails` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
    `order_id` INT(11) NOT NULL,
    `length` INT(11) NOT NULL,
    `width` INT(11) NOT NULL,
    `height` INT(11) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;