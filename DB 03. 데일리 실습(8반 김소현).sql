SHOW databases;
DROP DATABASE IF EXISTS test_movie;
CREATE database test_movie;
USE test_movie;

SHOW tables;
DROP TABLE IF EXISTS movie;

create table `movie` (
	`ID`			int				NOT NULL,
    `Title`			varchar(40)		NOT NULL,
    `ReleaseDate`	date,
    `RunningTime`	int
);

alter table `movie` add `director` varchar(40) default 1;

alter table `movie` modify `director` varchar(32) NOT NULL;

ALTER TABLE `movie` DROP COLUMN `director`;

INSERT INTO `movie` (Id, Title, ReleaseDate, RunningTime)
VALUES 
(1000, '이터널스',STR_TO_DATE('5-11-2021','%d-%m-%Y'),156),
(1001, '트랜스포터',STR_TO_DATE('2-10-2002','%d-%m-%Y'), 92),
(1002, '해리포터와 마법사의돌',STR_TO_DATE('14-12-2001','%d-%m-%Y'),152),
(1003, '해리포터와 비밀의방',STR_TO_DATE('14-12-2002','%d-%m-%Y'),162),
(1004, '기생충',STR_TO_DATE('30-5-2019','%d-%m-%Y'),153);

SELECT REPLACE (Title, '해리포터와 비밀의 방', '해리포터와 불의 잔') as Title
FROM `movie`
WHERE ID = 1003;

DELETE FROM `movie`
WHERE RunningTime <= 100;

TRUNCATE movie;

select *
FROM movie;

