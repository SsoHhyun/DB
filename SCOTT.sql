SHOW DATABASES;

DROP DATABASE IF EXISTS SCOTT;
CREATE DATABASE `SCOTT` DEFAULT CHARACTER SET utf8mb4;

USE SCOTT;
-- 주석 (데이터베이스 삭제)
-- DROP DATABASE IF EXISTS SCOTT;


SHOW TABLES;

CREATE TABLE SEOUL (
	id INT PRIMARY KEY auto_increment,
	name VARCHAR(5) NOT NULL,
    age INT
);

DESC SEOUL;

CREATE TABLE ssafy_member (
idx			INT				NOT NULL AUTO_INCREMENT,
userid		VARCHAR(16)		NOT NULL,
username	VARCHAR(20),
userpwd		VARCHAR(16),
emailid		VARCHAR(20),
emaildomain	VARCHAR(50),
joindate TIMESTAMP			NOT NULL DEFAULT current_timestamp,
PRIMARY KEY (idx)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;


DESC ssafy_member;

-- null을 허용하는 것, auto increment, default 값이 있으면 생략 가능
INSERT INTO ssafy_member (userid)
VALUES ('dflsj343fl');

-- 작성하려는 열에 값을 맞추어 작성해야 함
INSERT INTO ssafy_member (userid, username, userpwd, emailid, emaildomain, joindate)
VALUES ('id_kim', '김싸피', '1234', 'kimssafy', 'ssafy.com', now());
-- 여러 개 자료 동시 삽입 가능
INSERT INTO ssafy_member (userid, username, userpwd, emailid)
VALUES ('id_lee', '이싸피', '123456', 'leessafy'),
		('id_go', '고싸피', '3456', 'gossafy');
-- auto increment 값을 지정할 수 있음
INSERT INTO ssafy_member (idx, userid)
VALUES (105, '😍');

-- 0을 넣게 되면 알아서 증가해
INSERT INTO ssafy_member (idx, userid)
VALUES (0, 'dfls11l');

-- 열을 입력하지 않으면 전부 다 값을 넣어주면 됨
INSERT INTO ssafy_member 
VALUES (0, 'id_ha', '하싸피', '1234', 'Hassafy', 'ssafy.com', now());

-- UPDATE

SET SQL_SAFE_UPDATES = 0;

UPDATE ssafy_member
SET userpwd = '0000';

SET SQL_SAFE_UPDATES = 1;

-- safemode 해제 필요
UPDATE ssafy_member
SET userid = 'ssafyman'
WHERE userid = '😍';
-- WHERE idx = 104 ;로도 변경 가능

-- DELETE

DELETE FROM ssafy_member
WHERE idx = 104;

SELECT *
FROM ssafy_member;

DROP DATABASE IF EXISTS SCOTT;
									/* 다국어 설정 */
CREATE DATABASE `SCOTT` DEFAULT CHARACTER SET utf8mb4;

USE SCOTT;
/* 테이블 초기화를 위해 처음이면 없어도 됨*/
CREATE TABLE IF NOT EXISTS `BONUS` (
`ENAME` varchar(10) DEFAULT NULL, /*10칸*/
`JOB` varchar(9) DEFAULT NULL, /*9칸*/
`SAL` double DEFAULT NULL,
`COMM` double DEFAULT NULL);

drop table IF EXISTS dept;

CREATE TABLE IF NOT EXISTS `DEPT` (
`DEPTNO` int(11) NOT NULL,
`DNAME` varchar(14) DEFAULT NULL,
`LOC` varchar(13) DEFAULT NULL,
PRIMARY KEY (`DEPTNO`));

INSERT INTO `DEPT` (`DEPTNO`, `DNAME`, `LOC`) /*이러한 column을 집어넣겠다 */
VALUES(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

CREATE TABLE IF NOT EXISTS `EMP` (
`EMPNO` int(11) NOT NULL,
`ENAME` varchar(10) DEFAULT NULL,
`JOB` varchar(9) DEFAULT NULL,
`MGR` int(11) DEFAULT NULL,
`HIREDATE` datetime DEFAULT NULL,
`SAL` double DEFAULT NULL,
`COMM` double DEFAULT NULL,
`DEPTNO` int(11) DEFAULT NULL,
PRIMARY KEY (`EMPNO`),
KEY `PK_EMP` (`DEPTNO`));

INSERT INTO `EMP` (`EMPNO`, `ENAME`, `JOB`, `MGR`, `HIREDATE`, `SAL`, `COMM`, `DEPTNO`)
VALUES(7369, 'SMITH', 'CLERK', 7902, '1980-12-17 00:00:00', 800, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20 00:00:00', 1600, 300, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22 00:00:00', 1250, 500, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02 00:00:00', 2975, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28 00:00:00', 1250, 1400, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01 00:00:00', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09 00:00:00', 2450, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1987-04-19 00:00:00', 3000, NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17 00:00:00', 5000, NULL, 10),
(7844,
'TURNER',
'SALESMAN',
7698,
'1981-09-08 00:00:00',
1500,
0,
30),
(7876,
'ADAMS',
'CLERK',
7788,
'1987-05-23 00:00:00',
1100,
NULL,
20),
(7900,
'JAMES',
'CLERK',
7698,
'1981-12-03 00:00:00',
950,
NULL,
30),
(7902,
'FORD',
'ANALYST',
7566,
'1981-12-03 00:00:00',
3000,
NULL,
20),
(7934,
'MILLER',
'CLERK',
7782,
'1982-01-23 00:00:00',
1300,
NULL,
10);

CREATE TABLE IF NOT EXISTS `SALGRADE` ( `GRADE` double DEFAULT NULL,
`LOSAL` double DEFAULT NULL,
`HISAL` double DEFAULT NULL);

INSERT
	INTO
	`SALGRADE` (`GRADE`,
	`LOSAL`,
	`HISAL`)
VALUES(1,
700,
1200),
(2,
1201,
1400),
(3,
1401,
2000),
(4,
2001,
3000),
(5,
3001,
9999);

ALTER TABLE `EMP` ADD CONSTRAINT `PK_EMP` FOREIGN KEY (`DEPTNO`) REFERENCES `DEPT` (`DEPTNO`) ON
DELETE
	SET
	NULL ON
	UPDATE
	CASCADE;

-- 모든 사원 정보 검색
SELECT count(empno)
FROM emp;

SELECT *
FROM emp;

SELECT deptno
FROM emp;

-- 사원이 일하고 있는 부서
SELECT DISTINCT deptno
FROM emp;

-- 전체 부서
SELECT DEPTNO
FROM dept;

SELECT empno, ename, sal
FROM emp;

SELECT empno 사번, ename as "이름", sal * 12 as "연 봉"
FROM emp; 

-- 사원 이름, 사번, 급여, 커미션, 커미션 포함 급여

SELECT ename, empno, sal, comm, sal+IFNULL(comm,0) as "커미션 포함 급여"
FROM emp;

