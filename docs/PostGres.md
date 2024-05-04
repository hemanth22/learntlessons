## What is Postgres ?

PostgreSQL is an open-source, object-relational database management system (ORDBMS) that supports both SQL and JSON querying.   
It's known for its reliability, flexibility, and support of open technical standards, and   
is used as the primary data store for many web, mobile, geospatial, and analytics applications.  


### Postgres SQL commands

### create table

```sql
CREATE TABLE COMPANY(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   EMAIL          TEXT     NOT NULL,
   PASSWORD       CHAR(50)
);
```

### select query

```sql
SELECT * FROM COMPANY;
```

### insert query

```sql
INSERT INTO COMPANY VALUES (1,'hemanth','hemanthbitra@live.com','Password1');
INSERT INTO COMPANY VALUES (2,'hemanthbitra','hemanthbitra@outlook.com','Password1');
INSERT INTO COMPANY VALUES (3,'hemanthb','hemanthbitraece@outlook.com','Password1');
```

### update query

```sql
UPDATE COMPANY SET EMAIL = 'hemanthbitraece@gmail.com' WHERE ID = 1;
```

### delete query

```sql
DELETE FROM COMPANY WHERE ID = 3;
```

### limit query

```sql
SELECT * FROM COMPANY LIMIT 1;
```

### archive table

```sql
CREATE TABLE COMPANYARC(
   ID             INT,
   NAME           TEXT,
   EMAIL          TEXT,
   PASSWORD       CHAR(50)
);
```

### create trigger

```sql
CREATE TRIGGER companyarc_trigger AFTER INSERT OR UPDATE OR DELETE ON COMPANY
FOR EACH ROW EXECUTE PROCEDURE auditlogfunc();
```

### create procedure

```plpgsql
DELIMITER //
CREATE OR REPLACE FUNCTION auditlogfunc() RETURNS TRIGGER AS $companyarc_table$
   BEGIN
      INSERT INTO COMPANYARC(ID, NAME, EMAIL, PASSWORD) VALUES (new.ID, new.NAME, new.EMAIL, new.PASSWORD);
      RETURN NEW;
   END;
$companyarc_table$ LANGUAGE plpgsql
```

### update query

```sql
UPDATE company SET PASSWORD='Password1!' WHERE ID = 2;
```

### test query for update

```sql
INSERT INTO COMPANY VALUES (5,'bitrahemant','bitrahemant@outlook.com','Password1');
```
## Lab Environment

### Creating postgres lab environment using docker

```
docker run -d -e POSTGRES_PASSWORD=password -p 5432:5432 -v pg-data:/var/lib/postgresql/data --name postgresql postgres:latest
```

### Creating postgres pgadmin lab environment using docker

```
docker run -d -p 5081:80 -e 'PGADMIN_DEFAULT_EMAIL=pgadmin4@pgadmin.org' -e 'PGADMIN_DEFAULT_PASSWORD=bhemanth' --name pgadmin dpage/pgadmin4:latest
```

### Python libraries/modules requires for connecting to postgres data

```pip
pip             22.0.4
psycopg2-binary 2.9.3
setuptools      60.9.3
wheel           0.37.1
```

### Python Program to access postgres database

```python
import psycopg2
from psycopg2 import sql

conn = psycopg2.connect(database="dbname",user="dbuser",password="dbpasswd",host="dbhostname",port="5432")

cursor = conn.cursor()

cursor.execute('''CREATE TABLE COMPANY(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   EMAIL          TEXT     NOT NULL,
   PASSWORD       CHAR(50)
)''')
conn.commit()

cursor.execute('''INSERT INTO COMPANY VALUES (1,'hemanth','hemanthbitra@live.com','Password1')''')
conn.commit()
cursor.execute('''INSERT INTO COMPANY VALUES (2,'hemanthbitra','hemanthbitra@outlook.com','Password1')''')
conn.commit()
cursor.execute('''INSERT INTO COMPANY VALUES (3,'hemanthb','hemanthbitraece@outlook.com','Password1')''')
conn.commit()


cursor.execute('''CREATE TABLE COMPANYARC(
   ID             INT,
   NAME           TEXT,
   EMAIL          TEXT,
   PASSWORD       CHAR(50)
)''')
conn.commit()

cursor.execute('''CREATE OR REPLACE FUNCTION auditlogfunc() RETURNS TRIGGER AS $companyarc_table$
   BEGIN
      INSERT INTO COMPANYARC(ID, NAME, EMAIL, PASSWORD) VALUES (new.ID, new.NAME, new.EMAIL, new.PASSWORD);
      RETURN NEW;
   END;
$companyarc_table$ LANGUAGE plpgsql''')
conn.commit()

cursor.execute('''CREATE TRIGGER companyarc_trigger AFTER INSERT OR UPDATE OR DELETE ON COMPANY
FOR EACH ROW EXECUTE PROCEDURE auditlogfunc()''')
conn.commit()

cursor.execute('''UPDATE COMPANY SET PASSWORD='Passwd1!' WHERE ID = 2''')
conn.commit()


cursor.execute("SELECT * FROM COMPANY")
print(cursor.fetchall())

cursor.execute("SELECT * FROM COMPANYARC")
print(cursor.fetchall())

conn.close()
```
