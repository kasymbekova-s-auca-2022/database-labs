Лабораторная 7: Primary Keys

Цель: 
Освоить понятие первичного ключа в PostgreSQL и научиться создавать таблицы с одиночными и составными ключами.

Выполненные шаги

1. Создана база данных `lab7`.
2. Создана таблица `students` с одиночным первичным ключом:
   ```sql
   CREATE TABLE students (
       student_id SERIAL PRIMARY KEY,
       name VARCHAR(100) NOT NULL,
       email VARCHAR(150) UNIQUE,
       faculty VARCHAR(50)
   );

3. Добавлены тестовые данные:
INSERT INTO students (name, email, faculty) VALUES
('Alymbek', 'alymbek@auca.kg', 'Computer Science'),
('Aigerim', 'aigerim@auca.kg', 'Mathematics'),
('Nursultan', 'nursultan@auca.kg', 'Engineering');

4. Создана таблица с составным ключом:
CREATE TABLE course_enrollments (
    student_id INTEGER,
    course_id INTEGER,
    semester VARCHAR(20),
    enrollment_date DATE DEFAULT CURRENT_DATE,
    grade CHAR(2),
    PRIMARY KEY (student_id, course_id, semester)
);

5. Проверена работа ограничений: дублирующая комбинация student_id + course_id + semester не допускается.


Скрины приложены
