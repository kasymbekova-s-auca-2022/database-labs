Лабораторная работа 16: Transactions and ACID properties


Цель
Изучить понятие транзакций и их ACID-свойства (Atomicity, Consistency, Isolation, Durability) в PostgreSQL.

Создание таблицы
```sql
CREATE TABLE accounts (
  account_id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  balance NUMERIC(10,2)
);

Пример данных
INSERT INTO accounts (name, balance) VALUES
('Aigerim', 1000.00),
('Bakyt', 500.00);

Примеры транзакций
1. Базовая транзакция
BEGIN;
UPDATE accounts SET balance = balance - 200 WHERE name = 'Aigerim';
UPDATE accounts SET balance = balance + 200 WHERE name = 'Bakyt';
COMMIT;

2. Откат транзакции
BEGIN;
UPDATE accounts SET balance = balance - 300 WHERE name = 'Aigerim';
UPDATE accounts SET balance = balance + 300 WHERE name = 'Bakyt';
ROLLBACK;

3. Savepoint
BEGIN;
UPDATE accounts SET balance = balance - 100 WHERE name = 'Aigerim';
SAVEPOINT after_first_update;
UPDATE accounts SET balance = balance + 100 WHERE name = 'Bakyt';
ROLLBACK TO SAVEPOINT after_first_update;
COMMIT;

4. Уровень изоляции
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT * FROM accounts;
COMMIT;


Проверены свойства ACID и работа PostgreSQL с транзакциями: атомарность, согласованность, изоляция и надёжность.
Скрины с результатами приложены.
