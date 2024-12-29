CREATE DATABASE Assignment6;
USE Assignment6;


CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO employees (employee_id, name, department, salary)
VALUES 
(1, 'John', 'HR', 5000),
(2, 'Alice', 'IT', 7000),
(3, 'Bob', 'Finance', 6000),
(4, 'Eve', 'IT', 8000),
(5, 'Charlie', 'Finance', 7500);

select * from employees where employee_id = 1062;
INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');



select * from employees;


#1 Find employees with salaries greater than the average salary of all employees.
select * from employees
where salary > (select avg(salary)from employees);                                                                                     


#2 Find employees whose salary is higher than the salary of 'Alice'. 
select * from employees
where salary > (select salary from employees where name = 'Alice');

#3  List employees who belong to a department that has the name 'IT'. 
select * from employees where department = 'IT';

#4  Get the names of employees who earn the highest salary in their department.
select name, department, salary from employees e 
where salary = (select max(salary)from employees where department = e.department);

#5 Retrieve the departments where at least one employee earns more than 7000. 
select distinct department from employees where salary > 7000;

#6  List employees who do not belong to any department in the departments table.
select * from employees
where department NOT IN (select department_name from departments); 


#7 Find the second-highest salary among employees. 
select MAX(salary) as second_highest_salary from employees
where salary < (select MAX(salary) from employees);

#8 Retrieve the names of employees who work in the department with the highest number of employees. 
SELECT name,department
FROM employees
WHERE department in (SELECT department FROM employees GROUP BY department HAVING COUNT(department) > 1);

#9 Find employees who earn more than the average salary in their department. 
SELECT employee_id, name, department, salary
FROM employees e
WHERE salary > (SELECT AVG(salary) FROM employees WHERE department = e.department);

#10 Retrieve employees whose salary is above 7000 and belong to departments in the departments table. 
SELECT employee_id, name, department, salary FROM employees e
WHERE salary > 7000 
AND department IN (SELECT department_name FROM departments);

#11 List all departments that have no employees. 
SELECT department_name FROM departments
WHERE department_name NOT IN (SELECT DISTINCT department FROM employees);

#12 Find employees who have the same salary as another employee in a different department. 
SELECT employee_id, name, department, salary
FROM employees 
WHERE salary IN (SELECT salary FROM employees WHERE department <> department);

#13 Get the total salary of the department with the maximum total salary. 
SELECT SUM(salary) AS "total salary"
FROM employees
WHERE department = (SELECT department FROM employees GROUP BY department ORDER BY SUM(salary) DESC LIMIT 1);

#14 Retrieve employees whose department has more than two employees. 
SELECT employee_id, name, department, salary
FROM employees
WHERE department IN (SELECT department FROM employees GROUP BY department HAVING COUNT(department) >= 2);


# 15. Find employees whose salary is higher than the average salary of employees in the IT department. 
SELECT employee_id, name, department, salary
FROM employees WHERE salary > (SELECT AVG(salary)FROM employees WHERE department = 'IT');






