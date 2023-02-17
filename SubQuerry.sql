-- 생략 가능
-- 1. null 허용 2. dafault 값 3. auto increment (자동으로 1씩 증가)

USE scott;

-- 사번이 7788번인 사원의 부서 이름 조회
SELECT deptno
from emp
WHERE empno = 7788;

SELECT dname
FROM dept
WHERE deptno = 20;

-- 실행 먼저
-- 외부 쿼리(메인 쿼리)
SELECT dname
FROM dept		-- 서브 쿼리
WHERE deptno = (SELECT deptno
				from emp
				WHERE empno = 7788);
	
-- 1. 매니저(상관)의 이름이 'KING'인 사원의 사번, 이름, 부서 번호, 업무 조회
SELECT empno, ename, deptno, job
FROM emp
WHERE mgr = (SELECT empno
			From emp
            WHERE ename = "KING");

-- 2. 7566번 사원보다 급여를 많이 받는 사원의 이름, 급여 조회

-- 7565번 사원 급여
SELECT sal
FROM emp
WHERE empno = 7566;

SELECT ename, sal
FROM emp
WHERE sal > (SELECT sal
			FROM emp
			WHERE empno = 7566);
            
-- 3. 20번 부서의 평균 급여보다 급여가 많은 사원의 사번, 이름, 업무, 급여 조회
SELECT empno, ename, job, sal
FROM emp
where sal > (SELECT avg(sal)
			FROM emp
            WHERE deptno = 20);

-- 4. 업무가 'TURNER'와 같고, 사번이 '7934'인 직원보다 급여가 많은 사원의 사번, 이름, 업무, 조회
SELECT empno, ename, job
FROM emp
WHERE job = (SELECT job
			FROM emp
			WHERE ename = 'TURNER')
AND sal > (select sal
			FROM emp
            WHERE empno = 7934);
            
-- 다중행 IN, ANY, ALL
-- 업무가 'SALESMAN'인 직원들 중 최소 한 명 이상보다 많은 급여를 받는 사원의 이름, 급여, 업무 조회
SELECT sal
FROM emp
WHERE job = 'SALESMAN';
-- 적어도 1250보다는 높게 받아야겠다

SELECT ename, sal, job
FROM emp
WHERE sal > ANY (SELECT sal
				FROM emp
				WHERE job = 'SALESMAN');
                
-- < ANY 최대값보다는 작은 / > ANY 최소값보다는 큰

-- 업무가 'SALESMAN'인 모든 직원보다 급여(커미션 포함)를 많이 받는 사원의 이름, 급여, 업무, 입사일, 부서번호 조회
SELECT ename, sal, job, hiredate, deptno
FROM emp
		WHERE sal > ALL(SELECT sal+IFNULL(comm, 0)
						FROM emp
						where job = 'SALESMAN');
                        

-- 직원 최소 한 명이라도 근무하는 부서의 부서번호, 부서이름, 위치
SELECT DISTINCT deptno -- 중복 제거
FROM emp; -- 직원이 있는지를 봐야 됨

SELECT deptno, dname, loc -- 부서 없는 사람 배제
FROM dept
WHERE deptno in (SELECT DISTINCT deptno
				FROM emp);

-- 위랑 결과 같음                
SELECT deptno, dname, loc -- 부서 없는 사람 배제
FROM dept
WHERE deptno = Any (SELECT DISTINCT deptno
				FROM emp);
                
-- 이름이 'FORD'인 사원과 / 매니저 및 부서가 같은 사원의 이름, 매니저 번호, 부서 번호를 조회 (단, FORD 정보는 조회 x)
SELECT mgr, deptno
FROM emp
WHERE ename = 'FORD';

SELECT ename, mgr, deptno
FROM emp
WHERE (mgr, deptno) = (SELECT mgr, deptno
						FROM emp
						WHERE ename = 'FORD')
AND ename <> 'FORD'; -- !=랑 같음


-- 각 부서별 / 입사일이 가장 빠른 / 사원의 사번, 이름, 부서번호, 입사일 조회
SELECT deptno, MIN(hiredate)
FROM emp
GROUP BY deptno;

SELECT empno, ename, deptno, hiredate
FROM emp
WHERE (deptno, hiredate) IN (SELECT deptno, MIN(hiredate)
								FROM emp
								GROUP BY deptno);
                                
-- 상호 연관 서브쿼리
-- 소속 부서의 평균 급여보다 많은 급여를 받는 사원의 이름, 급여, 부서번호, 입사일, 업무 조회
SELECT ename, sal, deptno, hiredate, job
FROM emp e
WHERE sal > (SELECT AVG(sal)
			FROM emp
            WHERE deptno = e.deptno);

-- 인라인 뷰 (FROM 절에 서브쿼리)
-- 모든 사원의 평균급여/보다 적게 받는 사원들/과 같은 부서에서 근무하는 사원의 사번, 이름, 급여, 부서번호 조회
SELECT avg(sal)
FROM emp;

SELECT DISTINCT deptno
FROM emp
WHERE sal < (SELECT avg(sal)
			FROM emp);
            
SELECT e.empno, e.ename, e.sal, e.deptno
FROM emp e, (SELECT DISTINCT deptno
			FROM emp
			WHERE sal < (SELECT avg(sal)
						FROM emp)) d
WHERE e.deptno = d.deptno;

-- 모든 사원에 대하여 사원 이름, 부서 번호, 급여, 사원이 소속된 부서의 평균 급여 조회(단, 이름순 오름차순으로)
SELECT deptno, AVG(sal) as "avgsal"
FROM emp
GROUP BY deptno;

SELECT e.ename, e.deptno, e.sal, d.avgsal
FROM emp e, (SELECT deptno, AVG(sal) as "avgsal"
			FROM emp
			GROUP BY deptno) d
WHERE e.deptno = d.deptno
ORDER BY e.ename;

-- 스칼라 서브쿼리
-- 사원의 이름, 부서번호, 급여, 소속부서의 평균 급여 조회 (나중에 복사하기)
SELECT ename, deptno, sal, 
       (SELECT AVG(sal) 
          FROM emp 
         WHERE deptno = e.deptno) as avgsal
FROM emp e; 


-- 부서번호가 10인 부서의 총 급여, 20인 부서의 평균 급여, 30인 부서의최고급와 최저 급여
SELECT (SELECT SUM(sal) FROM emp WHERE deptno = 10) as sum10,
	   (SELECT AVG(sal) FROM emp WHERE deptno = 20) as avg10,
       (SELECT MAX(sal) FROM emp WHERE deptno = 30) as max30,
       (SELECT MIN(sal) FROM emp WHERE deptno = 30) as min30
FROM dual;

-- 모든 사원의 번호, 이름, 부서번호, 입사일을 조회. (단부서이름기준으로 내림차순)
UPDATE emp SET deptno = 40 WHERE empno = 4885;
SELECT empno, ename, deptno, hiredate
  FROM emp e
 ORDER BY (SELECT dname
             FROM dept
            WHERE deptno = e.deptno) DESC;