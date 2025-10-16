Лабораторная работа 9: Database Design Basics

Цель
Создать и протестировать базу данных с несколькими связанными таблицами, демонстрирующими основные принципы проектирования БД (Primary и Foreign Keys, связи 1:М и М:М).

Созданные таблицы:
departments список факультетов  
professors преподаватели, ссылаются на департаменты  
courses курсы, преподаваемые профессорами  
students студенты  
enrollments регистрация студентов на курсы  

Проверка связей:
Запрос для вывода данных со связями:
```sql
SELECT s.name AS student, c.course_name AS course, p.name AS professor, d.name AS department
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
JOIN professors p ON c.professor_id = p.professor_id
JOIN departments d ON p.department_id = d.department_id;


Результат:

| student               | course    | professor        | department       |
| --------------------- | --------- | ---------------- | ---------------- |
| Aigerim Toktobolotova | Databases | Dr. Toktobolotov | Computer Science |
| Aigerim Toktobolotova | Calculus  | Dr. Abdyldaev    | Mathematics      |
| Alymbek Kasymbekov    | Databases | Dr. Toktobolotov | Computer Science |
| Nursultan Imanaliev   | Mechanics | Dr. Moldokanova  | Engineering      |

