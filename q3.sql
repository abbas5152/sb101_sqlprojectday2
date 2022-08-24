mysql> create table EmployeeDetail(empID int, fullName varchar(20), ManagerId int, DateOfJoining date, city varchar(20));
Query OK, 0 rows affected (0.12 sec)

mysql> insert into EmployeeDetail values(121, "John Snow", 321, "2014-01-31", "Toronto");insert into EmployeeDetail values(321, "Walter White", 986, "2015-01-30", "California");insert into EmployeeDetail values(421, "Kuldeep Rana", 876, "2016-11-27", "New Delhi");
Query OK, 1 row affected (0.01 sec)

Query OK, 1 row affected (0.01 sec)

Query OK, 1 row affected (0.01 sec)

mysql> create table EmployeeSalary(empID int, project varchar(3), salary int (10), variable int (10));
Query OK, 0 rows affected, 2 warnings (0.05 sec)

mysql> insert into EmployeeSalary values(121, "P1", 8000, 500);insert into EmployeeSalary values(321, "P2", 10000, 1000);insert into EmployeeSalary values(421, "P1", 12000, 0);
Query OK, 1 row affected (0.01 sec)

Query OK, 1 row affected (0.01 sec)

Query OK, 1 row affected (0.01 sec)
mysql> select * from EmployeeDetail;
+-------+--------------+-----------+---------------+------------+
| empID | fullName     | ManagerId | DateOfJoining | city       |
+-------+--------------+-----------+---------------+------------+
|   121 | John Snow    |       321 | 2014-01-31    | Toronto    |
|   321 | Walter White |       986 | 2015-01-30    | California |
|   421 | Kuldeep Rana |       876 | 2016-11-27    | New Delhi  |
+-------+--------------+-----------+---------------+------------+
3 rows in set (0.00 sec)

mysql> select * from EmployeeSalary;
+-------+---------+--------+----------+
| empID | project | salary | variable |
+-------+---------+--------+----------+
|   121 | P1      |   8000 |      500 |
|   321 | P2      |  10000 |     1000 |
|   421 | P1      |  12000 |        0 |
+-------+---------+--------+----------+
3 rows in set (0.00 sec)

1. Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ending with any
sequence of characters.

mysql> select * from EmployeeDetail where fullName like "__hn%"
    -> ;
+-------+-----------+-----------+---------------+---------+
| empID | fullName  | ManagerId | DateOfJoining | city    |
+-------+-----------+-----------+---------------+---------+
|   121 | John Snow |       321 | 2014-01-31    | Toronto |
+-------+-----------+-----------+---------------+---------+
1 row in set (0.00 sec)


2. Write an SQL query to fetch common records between two tables.
mysql> select empID from EmployeeDetail union select empID from employeeSalary;
+-------+
| empID |
+-------+
|   121 |
|   321 |
|   421 |
+-------+
3 rows in set (0.00 sec)


3. Write an SQL query to fetch records that are present in one table but not in another table.
mysql> SELECT * FROM employeeDetail WHERE empid NOT IN (SELECT empid FROM employeesalary);
Empty set (0.00 sec)


4. Write an SQL query to find the maximum, minimum, and average salary of the employees.
mysql> select max(salary) from employeeDetail inner join employeeSalary;
+-------------+
| max(salary) |
+-------------+
|       12000 |
+-------------+
1 row in set (0.00 sec)
mysql> select min(salary) from employeeDetail inner join employeeSalary;
+-------------+
| min(salary) |
+-------------+
|        8000 |
+-------------+
1 row in set (0.00 sec)

mysql> select avg(salary) from employeeDetail inner join employeeSalary;
+-------------+
| avg(salary) |
+-------------+
|  10000.0000 |
+-------------+
1 row in set (0.00 sec)


5. Fetch all the employees who are not working on any project
mysql> select * from employeeDetail inner join employeeSalary where project = null;
Empty set (0.00 sec)
