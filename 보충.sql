CREATE DATABASE test;
USE test;

CREATE TABLE t (
id INT AUTO_INCREMENT PRIMARY KEY
);

INSERT INTO t (id)
VALUES (0);
-- 0 넣으면 마지막 숫자 플러스 1씩 증가하지만(auto_increment), 특정 숫자 넣으면 그 값으로 나옴
DELETE FROM t
WHERE id = "3230";

UPDATE t
SET id = "3234"
WHERE id = 1;

UPDATE t
SET id = "4000"
WHERE id = 2;
ROLLBACK; -- COMMIT이나 AUTO COMMIT 없으면 돌아감

SELECT *
FROM t;

USE scott;
SELECT DISTINCT deptno FROM emp;