-- Лабораторная 1: Введение в БД (PostgreSQL)

-- На всякий случай удалим таблицу, если уже существует
DROP TABLE IF EXISTS students;

-- 1) Создание таблицы с первичным ключом
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name       VARCHAR(50) NOT NULL,
    email      VARCHAR(100) UNIQUE,
    faculty    VARCHAR(50)
);

-- 2) Вставка нескольких записей
INSERT INTO students (name, email, faculty) VALUES
('Aigerim',   'aigerim@example.com',   'IT'),
('Nursultan', 'nursultan@example.com', 'Business'),
('Adilet',    'adilet@example.com',    'Design');

-- 3) Базовая выборка
SELECT * FROM students;

