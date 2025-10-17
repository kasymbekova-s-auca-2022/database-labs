Лабораторная работа 14: Joining Tables

Цель
Освоить различные типы соединений таблиц в PostgreSQL: INNER, LEFT, RIGHT, FULL OUTER и CROSS JOIN.

Схема данных
```sql
CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100)
);

CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(customer_id),
  order_date DATE,
  total_amount DECIMAL(10,2)
);


Примеры запросов:

INNER JOIN
SELECT c.name, c.email, o.order_date, o.total_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

LEFT JOIN
SELECT c.name, o.order_date, o.total_amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

RIGHT JOIN
SELECT c.name, o.order_date, o.total_amount
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

FULL OUTER JOIN
SELECT c.name, o.order_date, o.total_amount
FROM customers c
FULL OUTER JOIN orders o ON c.customer_id = o.customer_id;

CROSS JOIN
SELECT c.name, o.total_amount
FROM customers c
CROSS JOIN orders o;

Скрины с результатами приложены.
