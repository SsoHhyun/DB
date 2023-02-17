DROP SCHEMA IF EXISTS ssafy_movie;

CREATE SCHEMA IF NOT EXISTS ssafy_movie DEFAULT CHARACTER SET utf8mb4;

USE ssafy_movie;

DROP TABLE IF EXISTS movies;

CREATE TABLE `movies` (
	`ID` INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Title` VARCHAR(40) NOT NULL,
    `Director` VARCHAR(40) NOT NULL,
    `Genre` VARCHAR(40) NOT NULL,
    `RunningTime` INT(3) NOT NULL
)ENGINE=InnoDB;

INSERT INTO movies VALUES(0, "기생충","봉준호","드라마",131 ),
(0, "이터널스","클로이 자오","액션",155 ),
(0, "해리포터와 마법사의돌","크리스 콜럼버스","판타지",152 ),
(0, "해리포터와 비밀의방","크리스 콜럼버스","판타지",162 ),
(0, "듄","드니빌뇌브","모험",155 );

Select *
from movies;