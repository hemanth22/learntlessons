## Oracle Database SQL Query  

### SQL Query to find the table name

```sql
select * from all_tab_comments where lower(tab_name) like '%table_name%' or lower(comments) like '%table_name%';
```

### SQL Query to find the column name

```sql
select * from all_col_comments where lower(column_name) like '%column_name%' or lower(comments) like '%column_name%';
```

### SQL Query to find the user password expiration

```sql
SELECT USERNAME, EXPIRY_DATE FROM USER_USERS;
```

### SQL Query to alter password expiry

```sql
alter session set nls_date_format='DD-MON-YYYY HH24:MI:SS';
select username, expiry_date from user_users where username='my_username';
```

### SQL Query to convert blob file to varchar

```sql
select UTL_RAW.CAST_TO_VARCHAR2(dbms_lob.substr(MY_FIELD_BLOB_TYPE,2000,1)) from MY_BLOB_TABLE where MY_BLOB_TABLE_ID = 12345
```

### SQL Query to extract database based year, month or day using EXTRACT Function

```sql
SELECT 
  EXTRACT(YEAR FROM column_date) AS year,
  EXTRACT(MONTH FROM column_date) AS month,
  EXTRACT(DAY FROM column_date) AS day
FROM your_table;
```

### Reference on Oracle SQL Developer tool

[Cancel queries in Oracle SQL Developer tool](https://www.thatjeffsmith.com/archive/2013/04/die-or-how-to-cancel-queries-in-oracle-sql-developer/)  

[How to convert blob to varchar in Oracle SQL](https://stackoverflow.com/questions/39409519/oracle-how-to-convert-blob-to-varchar2)  

[DB Script from oracle-base](https://oracle-base.com/dba/scripts)  

[DB Script from github from oracle-base](https://github.com/oraclebase/dba.git)  
