CREATE TABLE IF NOT EXISTS `users`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `gender` TINYINT NOT NULL COMMENT '0 girl 1 boy',
  `email` VARCHAR(255) NOT NULL,
  `avatar_url` TEXT,
  `school_name` VARCHAR(1024),
  `stu_id` VARCHAR(128),
  `role` VARCHAR(128) NOT NULL,
  `is_identified` TINYINT DEFAULT 0,
  `is_deleted` TINYINT DEFAULT 0,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pseudonyms`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) NOT NULL,
  `user_name` VARCHAR(255) NOT NULL,
  `crypted_password` VARCHAR(32) NOT NULL,
  `is_deleted` TINYINT DEFAULT 0,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY(`id`),
	KEY `idx_name` (`user_name`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `courses`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `user_id` BIGINT(20) NOT NULL,
  `start_time` TIMESTAMP NOT NULL,
  `end_time` TIMESTAMP NOT NULL,
  `course_code` VARCHAR(32) NULL,
  `type` TINYINT DEFAULT 0 COMMENT 'public 0 private 1',
  `is_deleted` TINYINT DEFAULT 0,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY(`id`),
	KEY `idex_name` (`name`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `enrollments`(
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `course_id` BIGINT(20) NOT NULL,
  `user_id` BIGINT(20) NOT NULL,
  `is_clock` TINYINT DEFAULT 0 COMMENT 'open 0 close 1',
  `is_deleted` TINYINT DEFAULT 0,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY(`id`),
	KEY `idx_course_id` (`course_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- insert first user as admin
INSERT INTO `users`(`name`, `gender`, `email`, `role`) VALUES('error', 1, '123@126.com', 'ADMIN');
INSERT INTO `pseudonyms`(`user_id`, `user_name`, `crypted_password`) VALUES(1, 'error', md5('123456'));