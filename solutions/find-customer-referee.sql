/*
Find Customer Referee (https://leetcode.com/problems/find-customer-referee/)

Table: Customer
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.

Write an SQL query to report the names of the customer that are not referred by the customer with id = 2.
Return the result table in any order.
*/

-- Solution 1
SELECT name FROM Customer WHERE referee_id != 2 OR referee_id IS NULL;

-- Solution 2
SELECT name FROM Customer WHERE IFNULL(referee_id, 0) <> 2;
