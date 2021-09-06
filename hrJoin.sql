-- �ȷ�Ʈ���̺� palette_a, palette_b ����
-- ���̺����
CREATE TABLE palette_a (
    id INT PRIMARY KEY,
    color VARCHAR2 (100) NOT NULL
);

CREATE TABLE palette_b (
    id INT PRIMARY KEY,
    color VARCHAR2 (100) NOT NULL
);

-- palette_a���̺�insert data 
INSERT INTO palette_a (id, color)
VALUES (1, 'Red');

INSERT INTO palette_a (id, color)
VALUES (2, 'Green');

INSERT INTO palette_a (id, color)
VALUES (3, 'Blue');

INSERT INTO palette_a (id, color)
VALUES (4, 'Purple');

-- palette_b���̺�insert data 
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

-- 3. NULLǥ�� leftOuterJoin
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

-- 5. NULLǥ�� rightOuterJoin
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

-- 7. NULLǥ�� fullOuterJoin
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
-- ������(��*��)�� ����� �׽�Ʈ�������� ����Ѵ�.
SELECT
    a.id, a.color, b.id, b.color
FROM
    palette_a a
CROSS JOIN palette_b b; 


-- 9. selfJoin_ �ϳ��� ���̺����� ���� ��, �м��Ҷ� ���.
-- �Ի����� ���� ������� �ִ���? �˻�.
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

-- �Ի��Ͽ� �ߺ��� �������, ���� �������� �����ȴ�.
select * from employees;

