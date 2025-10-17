Лабораторная работа 15: Advanced Querying

Цель
Освоить продвинутые приёмы SQL-запросов в PostgreSQL: подзапросы, CTE, рекурсивные запросы, оконные функции и операции с множествами.

Таблицы
```sql
CREATE TABLE employees (
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  manager_id INT,
  department VARCHAR(50),
  salary NUMERIC(10,2)
);

CREATE TABLE sales (
  sale_id SERIAL PRIMARY KEY,
  employee_id INT REFERENCES employees(employee_id),
  year INT,
  sales_amount NUMERIC(10,2)
);


Основные запросы:
Подзапрос
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

CTE
WITH dept_salary AS (
  SELECT department, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department
)
SELECT * FROM dept_salary WHERE avg_salary > 65000;

Рекурсивный запрос
WITH RECURSIVE hierarchy AS (
  SELECT employee_id, first_name, last_name, manager_id
  FROM employees
  WHERE manager_id IS NULL
  UNION ALL
  SELECT e.employee_id, e.first_name, e.last_name, e.manager_id
  FROM employees e
  JOIN hierarchy h ON e.manager_id = h.employee_id
)
SELECT * FROM hierarchy;

Оконная функция
SELECT first_name, last_name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;

Set Operations
SELECT employee_id FROM employees
UNION
SELECT employee_id FROM sales;


Закреплены навыки работы с продвинутыми запросами: подзапросы, CTE, рекурсивные выражения, оконные функции и операции с множествами.
Скрины с результатами приложены.
