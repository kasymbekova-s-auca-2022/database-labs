Лабораторная работа 12: Querying Data

Цель
Практика выборки и фильтрации данных в PostgreSQL: `SELECT`, `WHERE`, `LIKE`, `CASE`, подзапросы (`IN`), CTE (`WITH`).

Таблица
```sql
CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  birth_date DATE,
  major VARCHAR(100)
);


Примеры запросов:

WHERE
SELECT * FROM students WHERE birth_date > '2002-01-01';

LIKE
SELECT * FROM students WHERE first_name LIKE 'A%';

CASE
SELECT first_name, last_name,
  CASE WHEN birth_date < '2002-01-01' THEN 'Older' ELSE 'Younger' END AS age_group
FROM students;

IN
SELECT first_name, last_name
FROM students
WHERE student_id IN (
  SELECT student_id FROM students WHERE major IN ('Computer Science','Mathematics')
);

CTE
WITH cs_students AS (
  SELECT * FROM students WHERE major = 'Computer Science'
)
SELECT first_name, last_name, major FROM cs_students;

Закрепила навыки выборки и фильтрации данных: WHERE, LIKE, CASE, подзапросы и CTE.
Скрины результатов приложены.
