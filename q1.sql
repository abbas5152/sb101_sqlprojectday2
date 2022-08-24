ans 1)

mysql> create table Person(id int primary key, email varchar(20));
Query OK, 0 rows affected (0.07 sec)

mysql> nsert into Person values(1, "a@b.com");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'nsert into Person values(1, "a@b.com")' at line 1
mysql> insert into Person values(1, "a@b.com");
Query OK, 1 row affected (0.03 sec)

mysql> insert into Person values(2, "c@d.com");
Query OK, 1 row affected (0.01 sec)

mysql> insert into Person values(3, "a@b.com");
Query OK, 1 row affected (0.01 sec)

mysql> select * from person;
+----+---------+
| id | email   |
+----+---------+
|  1 | a@b.com |
|  2 | c@d.com |
|  3 | a@b.com |
+----+---------+
3 rows in set (0.00 sec)

mysql> select email from Person group by email where count(email) > 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where count(email) > 1' at line 1
mysql> select email from Person group by email having count(email) > 1;
+---------+
| email   |
+---------+
| a@b.com |
+---------+
1 row in set (0.01 sec)
