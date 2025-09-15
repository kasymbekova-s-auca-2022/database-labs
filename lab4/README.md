 Лабораторная работа #4  
Тема: Первый SQL-запрос  

---

 Цель работы
Научиться писать и выполнять первые SQL-запросы: SELECT, WHERE, ORDER BY, LIMIT, а также использовать комментарии.

---

 Ход выполнения работы

1.Создание таблицы
   ```sql
   CREATE TABLE students (
       student_id SERIAL PRIMARY KEY,
       name VARCHAR(100),
       email VARCHAR(100),
       faculty VARCHAR(50)
   );

