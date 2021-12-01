# [Common Useful MySQL / MariaDB Commands](https://centoshelp.org/servers/database/common-useful-mysql-mariadb-commands/)

## User Creation, Manipulation, Deletion

* Show all users in the mysql database:

  `MariaDB [(none)]> select * from mysql.user;`
    
* Delete a null user:

  `MariaDB [(none)]> delete from mysql.user where user = ' ';`

* Delete all users who are not root:

  `MariaDB [(none)]> delete from mysql.user where not (host="localhost" and user="root");`

* Change root user to a less-guessable name (for security):

  `MariaDB [(none)]> update mysql.user set user="dbadmin" where user="root";`

* Create a new DBA:

  `MariaDB [(none)]> grant all privileges on *.* TO 'username'@'localhost' identified by 'strong_password' with grant option;`

* Add a new user with specific privileges on a specific database:

  `MariaDB [(none)]> grant select, insert, update, delete, create, drop, index, alter, create temporary tables, lock tables on database_name.* TO 'username'@'localhost' identified by 'strong_password';`

* Add a new DBA with all privileges to a specific database:

  `MariaDB [(none)]> grant all privileges on database_name.* TO 'username'@'localhost' identified by 'strong_password' with grant option;`

* Change a user or DBA password:
 
  `MariaDB [(none)]> UPDATE mysql.user set password=oldpass("strong_password") where User='username';`

* Delete a user or DBA from the database:
 
  `MariaDB [(none)]> delete from mysql.user where user="username";`

## Simple Database Manipulation & Queries

* Show all databases:

  `MariaDB [(none)]> show databases;`

* Create a database:

  `MariaDB [(none)]> create database database_name;`

* Use a specific database:

  `MariaDB [(none)]> use database_name;`

* Delete a database:

  `MariaDB [(none)]> drop database database_name;`

* Optimize a single database or all databases:

  * All Databases:

    `$ sudo mysqlcheck -o --all-databases -u root -p`

  * Single Database:
  
    `$ sudo mysqlcheck -o db_name -u username -p`

* Rename a database from command line (not from within MariaDB), there is purposely no space between -p and ‘mypass’

  `mysqldump -u dbauser -pmypass database_name > database_name.sql`

  `mysql -u dbauser -pmypass new_database_name < database_name.sql`

* Show the last 200 queries to your database with the sample table name "queries" and the sample field "query_id":

  `MariaDB [(none)]> select * from queries order by query_id desc limit 200;`

## Simple Table Manipulation

* Show all tables within a previously selected database:

  `MariaDB [(none)]> show tables;`

* Show data within a specific table in a previously selected database:

  `MariaDB [(none)]> select * from my_table;`

* Rename a table within a specific database:

  `MariaDB [(none)]> rename table first TO second;`
  
  or
  
  `MariaDB [(none)]> alter table my_table rename as my_newtable;`

* Drop a table from a specific database:

  `MariaDB [(none)]> drop table my_table;`

## Simple Column and Field Manipulation

* Show columns within a table:

  `MariaDB [(none)]> desc my_table;`

  or
  
  `MariaDB [(none)]> show columns from my_table;`

* Update a field within a previously selected database table:

  `MariaDB [(none)]> update my_table set my_column="newinfo" where my_column="oldinfo";`

* Select data within a specific table in a previously selected database:

  `MariaDB [(none)]> select * from my_table where my_column='my_data' order by my_column2;`

* Insert data into a table and its columns within a specific database:

  `MariaDB [(none)]> insert into my_table values('column1data','column2data','column3data','column4data','column5data','column6data','column7data','column8data','column9data');`

* Delete data from specific fields within a column:

    MariaDB [(none)]> delete from my_table where mycolumn="my_data";
    
* Update data in a specific table, column, field:

  `MariaDB [(none)]> update my_table set column1="my_data" where column2="my_data";`

## Simple Backup Options

**Important: (no space in between -p and strong_password)**

* Backup all databases:

  `mysqldump -u root -pstrong_password --all-databases > all-databases.sql`

* Restore all databases:

  `mysql -u username -pstrong_password < all-databases.sql`

* Backup a single database:

  `mysqldump -u root -pstrong_password database_name > database_name.sql`

* Restore a single database:

  `mysql -u username -pstrong_password database_name < database_name.sql`

* Backup all databases compressed with bzip2

  `mysqldump --all-databases | bzip2 -c > all-databases.sql.bz2` (use bunzip2 to uncompress)

* Backup all databases compressed with gzip

  `mysqldump --all-databases | gzip > all-databases.sql.gz` (use gunzip to uncompress)

* Backup a single database structure only (tables, columns, rows), no data:

  `mysqldump --no-data --databases database_name > database_name_structure_only.sql`

* Backing up only the database structure of specific databases, not the actual data:

  `mysqldump --no-data --databases db1 db2 db3 > db1_db2_db3_structure_only.sql`

* Backup a specific database and specific tables within that database only:

  `mysqldump --add-drop-table -u username -pmypass database_name table_1 table_2 > database_name_t1_t2.sql`

* Mini script to backup all databases and tables using gzip:
  ```bash
  #!/bin/bash
  date=$(date -I)
  mysqldump --all-databases | gzip > /var/backup/all-databases-${date}.sql.gz
  ```
* sql script to get size in table_schema

```sql
MariaDB [nation]> SELECT table_schema, ROUND(SUM(data_length+index_length)/1024/1024/1024,2) "size in GB" FROM information_schema.tables GROUP BY 1 ORDER BY 2 DESC;
+--------------------+------------+
| table_schema       | size in GB |
+--------------------+------------+
| mysql              |       0.01 |
| nation             |       0.00 |
| sys                |       0.00 |
| performance_schema |       0.00 |
| information_schema |       0.00 |
+--------------------+------------+
5 rows in set (0.018 sec)
```

* sql script to get size in table_schema and tables

```sql
MariaDB [nation]> SELECT table_schema "DB Name", table_name,(data_length + index_length)/1024/1024/1024 AS "TableSizeinGB" from information_schema.tables where table_schema='nation';
+---------+-------------------+----------------+
| DB Name | table_name        | TableSizeinGB  |
+---------+-------------------+----------------+
| nation  | continents        | 0.000015258789 |
| nation  | countries         | 0.000061035156 |
| nation  | country_languages | 0.000030517578 |
| nation  | country_stats     | 0.000015258789 |
| nation  | guests            | 0.000015258789 |
| nation  | languages         | 0.000015258789 |
| nation  | region_areas      | 0.000015258789 |
| nation  | regions           | 0.000030517578 |
| nation  | vips              | 0.000015258789 |
+---------+-------------------+----------------+
9 rows in set (0.000 sec)
```

* sql script to get size in database name and size

```sql
MariaDB [nation]> SELECT table_schema AS "DB_NAME", SUM(size) "DB_SIZE", SUM(fragmented_space) APPROXIMATED_FRAGMENTED_SPACE_GB FROM (SELECT table_schema, table_name, ROUND((data_length+index_length+data_free)/1024/1024/1024,2) AS size, ROUND((data_length - (AVG_ROW_LENGTH*TABLE_ROWS))/1024/1024/1024,2)
    ->     AS fragmented_space FROM information_schema.tables WHERE table_type='BASE TABLE' AND table_schema NOT IN ('performance_schema', 'mysql', 'information_schema') ) AS TEMP GROUP BY DB_NAME ORDER BY APPROXIMATED_FRAGMENTED_SPACE_GB DESC;
+---------+---------+----------------------------------+
| DB_NAME | DB_SIZE | APPROXIMATED_FRAGMENTED_SPACE_GB |
+---------+---------+----------------------------------+
| nation  |    0.00 |                             0.00 |
| sys     |    0.00 |                             0.00 |
+---------+---------+----------------------------------+
2 rows in set (0.014 sec)
```

* sql script to get size in database,table and approximated fragmented space

```sql
MariaDB [nation]> SELECT table_schema DB_NAME, table_name TABLE_NAME, ROUND((data_length+index_length+data_free)/1024/1024/1024,2) SIZE_GB, ROUND((data_length - (AVG_ROW_LENGTH*TABLE_ROWS))/1024/1024/1024,2) APPROXIMATED_FRAGMENTED_SPACE_GB from information_schema.tables
    ->     WHERE table_type='BASE TABLE' AND table_schema NOT IN ('performance_schema', 'mysql', 'information_schema') ORDER BY APPROXIMATED_FRAGMENTED_SPACE_GB DESC;
+---------+-------------------+---------+----------------------------------+
| DB_NAME | TABLE_NAME        | SIZE_GB | APPROXIMATED_FRAGMENTED_SPACE_GB |
+---------+-------------------+---------+----------------------------------+
| nation  | region_areas      |    0.00 |                             0.00 |
| nation  | guests            |    0.00 |                             0.00 |
| nation  | country_languages |    0.00 |                             0.00 |
| nation  | continents        |    0.00 |                             0.00 |
| nation  | regions           |    0.00 |                             0.00 |
| nation  | languages         |    0.00 |                             0.00 |
| sys     | sys_config        |    0.00 |                             0.00 |
| nation  | country_stats     |    0.00 |                             0.00 |
| nation  | countries         |    0.00 |                             0.00 |
| nation  | vips              |    0.00 |                             0.00 |
+---------+-------------------+---------+----------------------------------+
10 rows in set (0.016 sec)
```