CREATE DATABASE `test_user` DEFAULT CHARACTER SET utf8mb4;

use test_user;

drop table if exists user;

CREATE TABLE `user` (
	`age` int NOT NULL,
	`email` varchar(40) NOT NULL,
	`id` varchar(40) NOT NULL,
	`name` varchar(40) NOT NULL,
    `password` varchar(40) NOT NULL
)ENGINE=InnoDB;

commit;

-- 4. table에 phone_number 컬럼 삽입
alter table `user` add `phone_number` int;

-- 5. table에 phone_number 컬럼 변경
alter table `user` MODIFY `phone_number` VARCHAR(40) NOT NULL;

-- 6. phone_number 컬럼 삭제
alter table `user` drop column `phone_number`;

-- 7. user 테이블에 데어타 십입
INSERT INTO `user` (id, password, name, email, age) 
VALUES
('BlackWidow', '1278','나타샤 로마노프', 'blackwidow@ssafy.com', 38),
('CaptainAmerica', '5678','스티브 로저스', 'Captain@ssafy.com', 30),
('Hulk', '2486','브루스 배너', 'hulk@ssafy.com', 54),
('Ironman', '1234','토니 스타크', 'ironman@ssafy.com', 53),
('Thor', '1111','토르', 'GodOfThunder@ssafy.com', 1500),
('Ultron', '2355','울트론', 'ultron@ssafy.com', 0);

ALTER TABLE `USER` MODIFY `age` varchar(40) AFTER `email`;
ALTER TABLE `USER` MODIFY `email` varchar(40) AFTER `id`;
ALTER TABLE `USER` MODIFY `password` varchar(40) AFTER `id`;
ALTER TABLE `USER` MODIFY `name` varchar(40) AFTER `password`;

-- 8. 네임이 토르인 사용자 이메일 `Thor@ssafy.com'으로 변경
UPDATE USER
SET email = 'Thor@ssafy.com'
WHERE name = '토르';

-- 9. age가 1000 이상인 사용자 삭제
DELETE FROM user
where age >= 1000;

-- 10. 테이블 전체 데이터 삭제
TRUNCATE user;

select * from user; 
