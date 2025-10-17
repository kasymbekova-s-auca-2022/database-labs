Лабораторная работа 10: Основные операции с данными (Basic Data Operations)

Цель
Научиться выполнять основные операции с данными в PostgreSQL:
 добавление (`INSERT`),
 изменение (`UPDATE`),
 удаление (`DELETE`),
 просмотр (`SELECT`).


 Созданная таблица
```sql
CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  birth_date DATE
);

Добавление данных
INSERT INTO students (first_name, last_name, birth_date) VALUES
('Aibek','Sharshenov','2002-05-12'),
('Ainura','Toktomamatova','2001-09-23'),
('Bakyt','Mamatov','2003-01-15'),
('Gulzat','Sultanova','2002-07-30');


Обновление данных
UPDATE students
SET birth_date = '2002-05-15'
WHERE first_name = 'Aibek' AND last_name = 'Sharshenov';

Удаление данных
DELETE FROM students
WHERE first_name = 'Gulzat' AND last_name = 'Sultanova';

Просмотр таблицы
SELECT * FROM students;

Закреплены навыки работы с базовыми командами SQL в PostgreSQL: вставка, обновление, удаление и просмотр данных.

Скрины с полученными результатами приложены.
