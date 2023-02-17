USE scott;

-- 지정 가능
SELECT empno, ename, job, emp.deptno, dname
FROM emp, dept;

-- 카타시안 곱
SELECT empno, ename, job
FROM emp; -- 14개

SELECT  deptno, dname
FROM dept; -- 4개

SELECT empno, ename, job, emp.deptno, dname
FROM emp, dept; -- 55개

-- WHERE 사용하여 유의미하게 데이터 뽑기
SELECT empno, ename, job, emp.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno;

-- 사번 7788인 사원의 이름, 업무, 부서번호, 부서이름 조회
SELECT ename, job, deptno
FROM emp
WHERE empno = 7788;

SELECT dname
FROM dept
WHERE deptno = 20;

-- 조인을 해서 가져오기
SELECT ename, job, emp.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno
AND empno = 7788;

-- inner join 키워드를 사용
SELECT e.ename, e.job, e.deptno, d.dname
FROM emp e
INNER JOIN dept d
ON e.DEPTNO = d.DEPTNO
WHERE e.empno = 7788; -- 저렇게 줄여 쓸 수도 있음

SELECT e.ename, e.job, deptno, d.dname
FROM emp e
INNER JOIN dept d
USING (deptno)
WHERE e.empno = 7788;

-- 아우터 조인
-- 부서가 없는 직원 넣기
INSERT INTO emp
VALUES (4885, '윤일준', 'MANAGER', 7839, '2022-03-16', 6000, NULL, NULL);

-- 동등 조인 하니 4885 조회 X (부서 없어서)
SELECT ename, e.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

-- 기준을 한 군데에 두고 붙이기
-- 사원 이름, 부서 번호, 부서 이름 (left outer join)
SELECT e.ename, e.deptno, d.dname
FROM emp e LEFT OUTER JOIN dept d -- 왼쪽 테이블 기준 (emp)
ON e.deptno = d.deptno;

-- 부서 기준으로 사워 붙이기 (right outer join)
-- 해당 부서에서 일하는 사원 가져오기
SELECT d.deptno, d.dname, e.empno, e.ename
FROM emp e RIGHT OUTER JOIN dept d -- 왼쪽 테이블 기준 (emp)
ON e.deptno = d.deptno;

-- 셀프 조인
-- 모든 사원번호, 이름, 매니저 번호, 매니저 이름
SELECT e1.empno, e1.ename, e2.empno, e2.ename
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno;

-- INNER JOIN 키워드 사용하여 작성
SELECT e1.empno as "시원번호", e1.ename as "사원이름", e2.empno "매니저 번호", e2.ename as "매니저 이름"
FROM emp e1
INNER JOIN emp e2
ON e1.mgr = e2.empno;

-- KING도 반환하고 싶음
SELECT 
    e1.empno AS '시원번호',
    e1.ename AS '사원이름',
    e2.empno AS '매니저 번호',
    e2.ename AS '매니저 이름'
FROM
    emp e1
        LEFT OUTER JOIN
    emp e2 ON e1.mgr = e2.empno;
    
    -- 비동등 조인(Non-Equi JOIN)
    -- 모든 사원의 사번, 이름, 급여, 급여 등급 조회
   -- SELECT e.empno, e.ENAME, e.sal
    -- FROM emp 
    
SELECT e.empno, e.ename, e.sal as "급여", sg.grade as "급여 등급"
FROM emp e, salgrade sg
WHERE e.sal BETWEEN sg.LOSAL AND sg.HISAL
ORDER BY sg.grade DESC, e.sal DESC;

SELECT e.empno, e.ename, e.sal as "급여", sg.grade as "급여 등급"
FROM emp e, salgrade sg
WHERE e.sal >= sg.LOSAL AND e.sal <= sg.HISAL
ORDER BY sg.grade DESC, e.sal DESC;

SELECT * FROM salgrade;
    
DESC salgrade;



SELECT *
FROM emp;

DESC emp;