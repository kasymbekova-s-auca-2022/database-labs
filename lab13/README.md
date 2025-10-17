Лабораторная работа 13: Aggregate Functions  

Цель
Изучить использование агрегатных функций PostgreSQL для обработки и анализа данных.

Созданная таблица
```sql
CREATE TABLE employees (
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  department VARCHAR(50),
  salary NUMERIC(10,2),
  hire_date DATE
);


Выполненные запросы
COUNT
SELECT department, COUNT(*) AS total_employees  
FROM employees GROUP BY department;

SUM
SELECT department, SUM(salary) AS total_salary  
FROM employees GROUP BY department;

AVG
SELECT department, AVG(salary) AS avg_salary  
FROM employees GROUP BY department;

MIN/MAX
SELECT department, MIN(salary) AS min_salary, MAX(salary) AS max_salary  
FROM employees GROUP BY department;

HAVING
SELECT department, AVG(salary) AS avg_salary  
FROM employees GROUP BY department  
HAVING AVG(salary) > 60000;


Закреплены навыки работы с агрегатными функциями: COUNT, SUM, AVG, MIN, MAX, а также использование GROUP BY и HAVING.
Скрины с результатами приложены.
