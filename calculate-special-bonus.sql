/*
Calculate Special Bonus (https://leetcode.com/problems/calculate-special-bonus/)

Table: Employees
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| employee_id | int     |
| name        | varchar |
| salary      | int     |
+-------------+---------+
employee_id is the primary key for this table.
Each row of this table indicates the employee ID, employee name, and salary.

Write an SQL query to calculate the bonus of each employee.
The bonus of an employee is 100% of their salary if the ID of the employee is an odd number and the employee name does not start with the character 'M'. The bonus of an employee is 0 otherwise.
Return the result table ordered by employee_id.
*/

-- Solution 1 (UNION statement)
SELECT employee_id, 0 as bonus FROM Employees WHERE employee_id % 2 = 0 OR name LIKE 'M%'
UNION
SELECT employee_id, salary as bonus FROM Employees WHERE employee_id % 2 <> 0 AND name NOT LIKE 'M%'
ORDER BY employee_id;

-- Solution 2 (CASE statement)
SELECT employee_id,
CASE WHEN employee_id % 2 <> 0 AND name NOT LIKE 'M%' THEN salary
ELSE 0
END
AS bonus
FROM Employees
ORDER BY employee_id;
