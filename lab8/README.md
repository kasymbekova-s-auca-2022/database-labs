Лаба 8: Foreign Keys and Relationships

Цель работы
Изучить внешние ключи и типы связей между таблицами в базе данных PostgreSQL.


Основные шаги

1. Создание базы данных
```sql
CREATE DATABASE lab8;
\c lab8

2. Создание таблиц (один-ко-многим)
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    department_id INT,
    CONSTRAINT fk_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

3. Добавление данных и проверка связи
INSERT INTO departments (name)
VALUES ('IT'), ('Finance'), ('HR');

INSERT INTO employees (full_name, department_id)
VALUES ('Aigerim Toktobolotova', 1),
       ('Nursultan Imanaliev', 1),
       ('Alymbek Kasymbekov', 2);

SELECT e.full_name, d.name AS department
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

Показана связь один-ко-многим между departments и employees.


4. Связь многие-ко-многим
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

5. Добавление данных
INSERT INTO students (name)
VALUES ('Aigerim Toktobolotova'), ('Alymbek Kasymbekov'), ('Nursultan Imanaliev');

INSERT INTO courses (course_name)
VALUES ('Databases'), ('Algorithms'), ('Networks');

INSERT INTO enrollments (student_id, course_id)
VALUES (1, 1), (1, 2), (2, 1), (3, 3);

6. Проверка результата
SELECT s.name AS student, c.course_name AS course
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;

Показана связь многие-ко-многим между студентами и курсами.


В этой лабораторной работе реализованы и протестированы связи:
Один-ко-многим (1:N) между отделами и сотрудниками.
Многие-ко-многим (N:M) между студентами и курсами.

Скрин приложен
