-- 팔레트테이블 palette_a, palette_b 생성
-- 테이블생성
CREATE TABLE palette_a (
    id INT PRIMARY KEY,
    color VARCHAR2 (100) NOT NULL
);

CREATE TABLE palette_b (
    id INT PRIMARY KEY,
    color VARCHAR2 (100) NOT NULL
);

-- palette_a테이블insert data 
INSERT INTO palette_a (id, color)
VALUES (1, 'Red');

INSERT INTO palette_a (id, color)
VALUES (2, 'Green');

INSERT INTO palette_a (id, color)
VALUES (3, 'Blue');

INSERT INTO palette_a (id, color)
VALUES (4, 'Purple');

-- palette_b테이블insert data 
INSERT INTO palette_b (id, color)
VALUES (1, 'Green');

INSERT INTO palette_b (id, color)
VALUES (2, 'Red');

INSERT INTO palette_b (id, color)
VALUES (3, 'Cyan');

INSERT INTO palette_b (id, color)
VALUES (4, 'Brown');

-- ////////////////////////////

-- 1. InnerJoin 
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
INNER JOIN palette_b b ON a.color = b.color;

-- 2. leftOuterJoin
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
LEFT JOIN palette_b b ON a.color = b.color;

-- 3. NULL표현 leftOuterJoin
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
LEFT JOIN palette_b b ON a.color = b.color
WHERE b.id IS NULL;

-- 4. rightOuterJoin
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
RIGHT JOIN palette_b b ON a.color = b.color;

-- 5. NULL표현 rightOuterJoin
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
RIGHT JOIN palette_b b ON a.color = b.color
WHERE a.id IS NULL;

-- 6. fullOuterJoin
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
FULL OUTER JOIN palette_b b ON a.color = b.color;

-- 7. NULL표현 fullOuterJoin
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
FULL JOIN palette_b b ON a.color = b.color
WHERE a.id IS NULL OR b.id IS NULL;


-- 8. crossJoin 
-- 많은행(행*행)을 만들어 테스트목적으로 사용한다.
SELECT
    a.id, a.color, b.id, b.color
FROM
    palette_a a
CROSS JOIN palette_b b; 


-- 9. selfJoin_ 하나의 테이블내에서 행을 비교, 분석할때 사용.
-- 입사일이 같은 사원들이 있는지? 검색.
SELECT
   e1.hire_date,
  e1.employee_id, 
  (e1.first_name || ' ' || e1.last_name) employee1,
  e2.employee_id,
  (e2.first_name || ' ' || e2.last_name) employee2
FROM
    employees e1
INNER JOIN employees e2 ON
    e1.employee_id > e2.employee_id
    AND e1.hire_date = e2.hire_date
ORDER BY  
   e1.hire_date DESC,
   employee1, 
   employee2;

-- 입사일에 중복이 없을경우, 위의 쿼리에서 누락된다.
select * from employees;

