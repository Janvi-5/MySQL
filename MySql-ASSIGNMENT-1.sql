/*1. Create a database named company and a table named employees with the following fields:
id(INT, Primary Key, Auto Increment)
name (VARCHAR(100))
position (VARCHAR(100))
salary (DECIMAL(10,2))
date_of_joining (DATE)*/

CREATE DATABASE company;
USE company;
CREATE TABLE employees(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10,2),
    date_of_joining DATE);

/*2. Insert the following data into the employees table:
John Doe, Manager, 55000.00, 2020-01-15
Jane Smith, Developer, 48000.00, 2019-07-10
Alice Johnson, Designer, 45000.00, 2021-03-22
Bob Brown, Developer, 50000.00, 2018-11-01*/
INSERT INTO employees(name, position, salary, date_of_joining)
VALUES 
("John Doe", "Manager", 55000.00, "2020-01-15"),
("Jane Smith", "Developer", 48000.00, "2019-07-10"),
("Alice Johnson", "Designer", 45000.00, "2021-03-22"),
("Bob Brown", "Developer", 50000.00, "2018-11-01");
select * from employees;


#3. Write a query to retrieve all employees who are Developers
SELECT * FROM employees WHERE position = "Developer";



#4. Write a query to update the salary of Alice Johnson to 46000.00.
set sql_safe_updates=0;
update employees
SET salary = 46000.00 WHERE name = "Alice Johnson";



#5. Write a query to delete the employee record for Bob Brown.
DELETE FROM employees WHERE name = "Bob Brown";


#6. Write a query to find the employees who have a salary greater than 48000.
SELECT * FROM employees WHERE salary > 48000;



#7. Write a query to add a new column email to the employees table.
ALTER TABLE employees ADD COLUMN email VARCHAR(100);


#8. Write a query to update the email for John Doe to john.doe@company.com
UPDATE employees SET email = "john.doe@company.com" WHERE name = "John Doe";


#9. Write a query to retrieve only the name and salary of all employees.
SELECT name, salary FROM employees;



#10. Write a query to count the number of employees who joined after January 1, 2020.
SELECT COUNT(*) FROM employees WHERE date_of_joining > "2020-01-01";



#11. Write a query to order the employees by salary in descending order.
SELECT * FROM employees ORDER BY salary DESC;



#12. Write a query to drop the email column from the employees table.
alter table employees drop column email;


#13. Write a query to find the employee with the highest salary.
SELECT * FROM employees where salary=(select max(salary) from employees);