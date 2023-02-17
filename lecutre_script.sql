DROP DATABASE IF EXISTS SCOTT;
-- 주석 (데이터베이스 삭제)
-- DROP DATABASE IF EXISTS SCOTT;

									/* 다국어 설정 */
CREATE DATABASE `SCOTT` DEFAULT CHARACTER SET utf8mb4;

SHOW DATABASES;

USE SCOTT;

/* 테이블 초기화를 위해 처음이면 없어도 됨, 테이블이 존재하지 않으면 만들어라 */
-- 데이터 정의 언어
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
`ENAME` varchar(10) DEFAULT NULL,	-- null을 허용하는 것, auto increment, default 값이 있으면 생략 가능
`JOB` varchar(9) DEFAULT NULL,
`MGR` int(11) DEFAULT NULL,
`HIREDATE` datetime DEFAULT NULL,
`SAL` double DEFAULT NULL,
`COMM` double DEFAULT NULL,
`DEPTNO` int(11) DEFAULT NULL,
PRIMARY KEY (`EMPNO`),
KEY `PK_EMP` (`DEPTNO`));

INSERT INTO `EMP` (`EMPNO`, `ENAME`, `JOB`, `MGR`, `HIREDATE`, `SAL`, `COMM`, `DEPTNO`)
-- 작성하려는 열에 값을 맞추어 작성해야 함, 여러 개 자료 동시 삽입 가능
VALUES(7369, 'SMITH', 'CLERK', 7902, '1980-12-17 00:00:00', 800, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20 00:00:00', 1600, 300, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22 00:00:00', 1250, 500, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02 00:00:00', 2975, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698,
'1981-09-28 00:00:00', 1250, 1400, 30),
(7698, 'BLAKE', 'MANAGER', 7839,
'1981-05-01 00:00:00',
2850,
NULL,
30),
(7782,
'CLARK',
'MANAGER',
7839,
'1981-06-09 00:00:00',
2450,
NULL,
10),
(7788,
'SCOTT',
'ANALYST',
7566,
'1987-04-19 00:00:00',
3000,
NULL,
20),
(7839,
'KING',
'PRESIDENT',
NULL,
'1981-11-17 00:00:00',
5000,
NULL,
10),
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

SHOW TABLES;

DESC emp;

-- my sql 숫자 관련 함수
SELECT POW(2, 3)
FROM DUAL; -- 문법을 위한 가상의 테이블

SELECT round(1526.159), round(1526.159, 0), round(1526.159, 1), round(1526.159, 2), round(1526.159, 3), round(1526.159, -1);

SELECT concat('회장님의 이름은', ename, '입니다.')
FROM emp
WHERE job = 'PRESIDENT';

SELECT length('ssafy');

SELECT locate('abc', 'ababcabcabc');

SELECT left("HELLO SSAFY", 5); -- 왼쪽부터 5개 자르기
SELECT right("HELLO SSAFY", 5); -- 오른쪽부터 5개 자르기

-- 날짜 관련 함수
SELECT now(), DAY(now()), MONTH(now()), yearweek(now());
SELECT datediff('2022-12-31', date(now()));

-- 모든 사원에 대해 사원 수, 급여 총액, 평균 급여, 최고 급여, 최저 급여를 조회
SELECT COUNT(*) 사원수, SUM(sal) 총액, AVG(sal) 평균, MAX(sal) 최고, MIN(sal) 최저 FROM EMP;

SELECT deptno, COUNT(*) 사원수, SUM(sal) 총액, AVG(sal) 평균, MAX(sal) 최고, MIN(sal) 최저 FROM EMP GROUP BY deptno;

-- Having은 그룹으로 묶은 것에(GROUP BY) 대한 조건

-- 부서, 직급별 조회
SELECT deptno as "부서" , COUNT(*) 사원수, SUM(sal) 총액, round(AVG(sal), 2) 평균, MAX(sal) 최고, MIN(sal) 최저
FROM EMP GROUP BY deptno, job;

-- 이름이 들어감 (필요 없는 데이터가 조회될 수 있으니 주의)
SELECT ename 이름, deptno 부서, COUNT(*) 사원수, SUM(sal) 총액, round(AVG(sal), 2) 평균, MAX(sal) 최고, MIN(sal) 최저
FROM EMP GROUP BY deptno, job;

-- 급여(커미션 포함) 평균이 2000 이상인 부서 번호, 부서별 사원 수, 평균 급여(커미션 포함) 조회 (급여는 소수 둘째점 반올림)
SELECT
	deptno as "부서 번호",
    COUNT(*) as "사원수",
    ROUND(AVG(sal+IFNULL(comm,0)),2) as "평균급여(커미션 포함)"
FROM emp
GROUP BY deptno
HAVING AVG(sal+ IFNULL(comm, 0)) >= 2000;