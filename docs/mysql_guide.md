# MySQL GUIDE

# Table of contents

> * [Types](#types)
>	- [Date](#date)
> * [APIs](#apis)
>	- [CREATE TABLE](#create-table)
>	- [LIMIT & OFFSET](#limit--offset)
>	- [INSERT](#insert)
>		- [Batch INSERT](#batch-insert)
>			- [Simple Batch INSERT](#simple-batch-insert)
>			- [Batch INSERT with SELECT](#batch-insert-with-select)
>			- [Complex Batch INSERT with TEMPORARY TABLE](#complex-batch-insert-with-temporary-table)
>		- [Getting the ID after insert](#getting-the-id-after-insert)
>			- [`LAST_INSERT_ID`](#last_insert_id)
>			- [Avoiding cached `LAST_INSERT_ID`](#avoiding-cached-last_insert_id)
>			- [Replacing `LAST_INSERT_ID` with NodeJS `mysql2`](#replacing-last_insert_id-with-nodejs-mysql2)
>			- [Capturing insert IDs from a batch insert](#capturing-insert-ids-from-a-batch-insert)
>		- [Avoid duplicates](#avoid-duplicates)
>			- [INSERT IGNORE](#insert-ignore)
>			- [ON DUPLICATE KEY](#on-duplicate-key)
>			- [Custom logic with temporary table](#custom-logic-with-temporary-table)
>	- [UPDATE](#update)
>		- [UPDATE with INNER JOIN](#update-with-inner-join)
>		- [Getting the ID after an update](#getting-the-id-after-an-update)
>	- [ALTER TABLE](#alter-table)
>		- [Adding a new foreign key](#adding-a-new-foreign-key)
>	- [DROP](#drop)
>		- [DROP FOREIGN KEY](#drop-foreign-key)
>	- [EXISTS](#exists)
>	- [Indexing](#indexing)
>		- [Clustered index](#clustered-index)
>		- [Non-clustered index aka Secondary index](#non-clustered-index-aka-secondary-index)
>		- [Composite index](#composite-index)
> * [Tools](#tools)
>	- [NodeJS `mysql2` package](#nodejs-mysql2-package)
> * [FAQ](#faq)
>	- [How to create a secondary index?](#how-to-create-a-secondary-index)
>	- [How to add a unique constraint on a column?](#how-to-add-a-unique-constraint-on-a-column)
>	- [How to check the MySQL version?](#how-to-check-the-mysql-version)
>	- [How to show a table definition?](#how-to-show-a-table-definition)
>	- [How to see all table's constraints?](#how-to-see-all-tables-constraints)
>	- [How to check the DB timezone?](#how-to-check-the-db-timezone)
>	- [How to check if a column exists before adding it?](#how-to-check-if-a-column-exists-before-adding-it)
>	- [How to filter on a json array data type?](#how-to-filter-on-a-json-array-data-type)
>	- [How to insert new records an avoid duplicates?](#how-to-insert-new-records-an-avoid-duplicates)

# Types
## Date
### Creating dates

| Function | Description |
|:---------|:------------|
| `UTC_TIMESTAMP()` | Creates a UTC now. |
| `DATE_SUB(UTC_TIMESTAMP(), INTERVAL 3 HOUR)` | Substracts a period of time from a date. Supported periods: `MICROSECOND`, `SECOND`, `MINUTE`, `HOUR`, `DAY`, `WEEK`, `MONTH`, `QUARTER`, `YEAR`, `SECOND_MICROSECOND`, `MINUTE_MICROSECOND`, `MINUTE_SECOND`, `HOUR_MICROSECOND`, `HOUR_SECOND`, `HOUR_MINUTE`, `DAY_MICROSECOND`, `DAY_SECOND`, `DAY_MINUTE`, `DAY_HOUR`, `YEAR_MONTH`. Tips: To add a period, just use a negative number. |

# APIs
## CREATE TABLE

```sql
CREATE TABLE IF NOT EXISTS `action` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`business_id` bigint NOT NULL,
	`slug` varchar(128) NOT NULL,
	`name` varchar(255) NOT NULL,
	`type` enum('efs_git_folder', 's3_public_bucket', 'cloudfront') NOT NULL,
	`description` text,
	`created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated` timestamp,
	`deleted` timestamp,
	 PRIMARY KEY (id),
	 FOREIGN KEY (`business_id`) REFERENCES `business` (`id`),
	 INDEX (name, description(10)),
	 CONSTRAINT unique_action_slug UNIQUE (slug));
```

Notice that:
- The primary key is automatically indexed. This is called the `Clustered index`.
- Any foreign key is automatically indexed in the `Secondary index`.
- To manually add a secondary index, use the `INDEX` keyword. In the above example, a secondary index is created on the `name` field and on the first 10 characters of the `description` field.
- The `slug` must be unique thanks to the `CONSTRAINT` statement. `unique_action_slug` can be whatever you want.
- The `IF NOT EXISTS` is optional, but recommended to make sure the creation script indempotent.

## LIMIT & OFFSET

```sql
SELECT *  FROM members LIMIT 9;
```

Offset:

```sql
SELECT *  FROM members LIMIT 2, 9;
```

Where 2 is the starting point (it is not included).

## INSERT
## Batch INSERT
### Simple Batch INSERT

```sql
INSERT INTO your_table (name, age) VALUES ('Nic', 40), ('Boris', 34)
```

### Batch INSERT with SELECT

Insert all the users with a name that starts with `nic`.

```sql
INSERT INTO your_table (name, age) 
SELECT name, age FROM user WHERE name LIKE 'nic%'
```

To see how to avoid duplicates, please refer to the [Avoid duplicates](#avoid-duplicates) section.

### Complex Batch INSERT with TEMPORARY TABLE

To insert many new records in conjunction with advanced joins, there is no other choices but to use __temporary tables__:

```sql
CREATE TEMPORARY TABLE temp_table
SELECT '123' AS id, 'nico@neap.com' AS email
UNION ALL
SELECT '456' AS id, 'mike@neap.com' AS email
UNION ALL
SELECT '789' AS id, 'noel@neap.com' AS email;

INSERT INTO your_table (email)
SELECT t.email FROM temp_table AS t
LEFT JOIN user AS u ON u.email = t.email
WHERE u.id IS NULL;

DROP TEMPORARY TABLE temp_table;
```

## Getting the ID after insert

If you're using the NodeJS `mysql2` package, you don't have to worry about retrieving the new primary key explicitly use `LAST_INSERT_ID` in your SQL query. Jump to the [Replacing `LAST_INSERT_ID` with NodeJS `mysql2`](#replacing-last_insert_id-with-nodejs-mysql2) section to see how.

### `LAST_INSERT_ID`

```sql
INSERT INTO storage_inventory_ops (create_date) VALUES (CURRENT_TIMESTAMP);
SELECT LAST_INSERT_ID() AS id;
```

### Avoiding cached `LAST_INSERT_ID`

More advanced scenario where a new record is only inserted if a specific record does not exist yet:

```sql
-- Capture the last inserted ID
SET @previousId := LAST_INSERT_ID();
INSERT INTO storage_inventory_ops (create_date) 
SELECT temp.create_date
FROM (
	SELECT 
		CURRENT_TIMESTAMP as create_date,
		(SELECT id
		FROM storage_inventory_ops 
		WHERE create_date > '2021-09-23' AND complete_date IS NULL
		ORDER BY create_date DESC
		LIMIT 1) AS pending) AS temp 
WHERE temp.pending IS NULL;

-- Return the newly inserted 'id' and the previous one. If the 'id' exists but is the same as the previous one,
-- this indicates that the record was not inserted.
SELECT LAST_INSERT_ID() AS id, @previousId AS previousId;
```

#### Replacing `LAST_INSERT_ID` with NodeJS `mysql2`

The NodeJS `mysql2` package automatically returns the insert ID so you don't have to worry about retrieving it explicitly in your SQL query.

```js
const [rows] = await db.query({ sql:'INSERT INTO my_table (age) VALUES (40)' })
const { 
	fieldCount,
	affectedRows,
	insertId,
	info,
	serverStatus,
	warningStatus
} = rows[0]

console.log(`The new ID is: ${insertId}`)
```

#### Capturing insert IDs from a batch insert

MySQL does not support any function to solve this use case. Instead, you must make sure that the primary key uses the `AUTO_INCREMENT` function and then use the following workflow:
1. Use the `LAST_INSERT_ID` to capture the first new id created during the batch insert.
2. Use the number of affected row to infer the other IDs.

For example:

```js
const [rows] = await db.query({ sql:'INSERT INTO my_table (age) VALUES (40,54)' })
const { 
	fieldCount,
	affectedRows,
	insertId,
	info,
	serverStatus,
	warningStatus
} = rows[0]

console.log(`The first new ID is: ${insertId}`)
console.log(`The last new ID is: ${insertId + affectedRows - 1}`)
```

### Avoid duplicates
#### INSERT IGNORE

#### ON DUPLICATE KEY

#### Custom logic with temporary table

```sql
CREATE TEMPORARY TABLE temp_table
SELECT '12347' AS id, 'nico@neap.com' AS email;

INSERT INTO user (id, email) 
SELECT t.id, t.email
FROM temp_table AS t 
LEFT JOIN user AS u ON t.email = u.email AND u.delete_date IS NULL
WHERE u.id IS NULL;

DROP TEMPORARY TABLE temp_table;
```

To add multiple records in the temporary table:

```sql
CREATE TEMPORARY TABLE temp_table
SELECT '12347' AS id, 'nico@neap.com' AS email
UNION
SELECT '45678' AS id, 'lin@neap.com' AS email;
```

## UPDATE
### UPDATE with INNER JOIN

```sql
UPDATE product_tag AS tag
INNER JOIN product AS p ON tag.product_id = p.id
SET name = 'bike'
WHERE p.name LIKE 'bike%'
```

### Getting the ID after an update

```sql
SET @update_id := 0;
UPDATE some_table SET column_name = 'value', id = (SELECT @update_id := id)
WHERE some_other_column = 'blah' LIMIT 1; 
SELECT @update_id;
```

This technique can be further expanded to retrieve the ID of every row affected by an update statement:

```sql
SET @uids := null;
UPDATE footable SET foo = 'bar' WHERE fooid > 5 AND ( SELECT @uids := CONCAT_WS(',', fooid, @uids) );
SELECT @uids;
```

## ALTER TABLE
### Adding a new foreign key

```sql
ALTER TABLE `project` ADD CONSTRAINT `project_fk_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`);
```

In theory, you could also have written:

```sql
ALTER TABLE `project` ADD FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`);
```

But this is not idempotent. This second version generates a new auto-generated contraint each time it is executed, while the first one fails when it is run more than once.

# DROP
## DROP FOREIGN KEY

```sql
ALTER TABLE table_name DROP FOREIGN KEY constraint_name
```

## EXISTS

```sql
SELECT EXISTS(SELECT * FROM project) AS exist
```

This returns an array with a single item whose column `exist` is either 0 (does not exist) or 1 (exists).

## Indexing
### Clustered index

With MySQL the clustered index is normally the primary key. If the primary key is not defined, then MySQL automatically uses the first index as the clustered index. You cannot explicitly create a clustered index other than using the `PRIMARY KEY` keyword.

```sql
CREATE TABLE IF NOT EXISTS `action` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`business_id` bigint NOT NULL,
	`slug` varchar(128) NOT NULL,
	`name` varchar(255) NOT NULL,
	`type` enum('efs_git_folder', 's3_public_bucket', 'cloudfront') NOT NULL,
	`description` text,
	`created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated` timestamp,
	`deleted` timestamp,
	 PRIMARY KEY (id),
	 FOREIGN KEY (`business_id`) REFERENCES `business` (`id`),
	 INDEX (name, description(10)),
	 CONSTRAINT unique_action_slug UNIQUE (slug));
```

### Non-clustered index aka Secondary index

Use the `INDEX` keyword to create a secondary index:

```sql
CREATE TABLE IF NOT EXISTS `action` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`business_id` bigint NOT NULL,
	`slug` varchar(128) NOT NULL,
	`name` varchar(255) NOT NULL,
	`type` enum('efs_git_folder', 's3_public_bucket', 'cloudfront') NOT NULL,
	`description` text,
	`created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated` timestamp,
	`deleted` timestamp,
	 PRIMARY KEY (id),
	 FOREIGN KEY (`business_id`) REFERENCES `business` (`id`),
	 INDEX (name, description(10)),
	 CONSTRAINT unique_action_slug UNIQUE (slug));
```

### Composite index

Composite index are clustered or secondary indexes that use more than one column. When the composite index is the primary key, it also add a uniqueness constraint out-of-the-box. 

```sql
CREATE TABLE INFO (
	t1ID INT,
	t2ID INT,
	PRIMARY KEY (t1ID, t2ID)
)
```

If you wish to optimize queries on only one of the column that makes the primary key, you should also add a secondary index on the column:

```sql
CREATE TABLE INFO (
	t1ID INT,
	t2ID INT,
	PRIMARY KEY (t1ID, t2ID),
	INDEX (t1ID)
)
```

Composite indexes on the secondary index use the same syntax:

```sql
CREATE TABLE IF NOT EXISTS `action` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`business_id` bigint NOT NULL,
	`slug` varchar(128) NOT NULL,
	`name` varchar(255) NOT NULL,
	`type` enum('efs_git_folder', 's3_public_bucket', 'cloudfront') NOT NULL,
	`description` text,
	`created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated` timestamp,
	`deleted` timestamp,
	 PRIMARY KEY (id),
	 FOREIGN KEY (`business_id`) REFERENCES `business` (`id`),
	 INDEX (name, description(10)),
	 CONSTRAINT unique_action_slug UNIQUE (slug));
```

# Tools
## NodeJS `mysql2` package

`npm i mysql2`

```js
const mysql = require('mysql2/promise')

const db = mysql.createPool({
	host: 'your-long-subdomain.rds.amazonaws.com', // can also be an IP
	user: 'xxxxxx',
	password: 'xxxxxxxxxxxxxxx',
	database: 'your_db_name',
	multipleStatements: true,
	waitForConnections: true,
	connectionLimit: 10, // connection pool size
	queueLimit: 0,
	timezone: '+00:00'
})

const getUser = async (name, age) => {
	// You could also replace 'db.query' with 'db.execute'. 'execute' uses prepared statements, 
	// which are safer (automatic protection against SQL injection) and can be faster if the query 
	// is repeated multiple times Use execute in most of the time instead of 'query'.
	const [rows] = await db.query({ 
		sql: 'SELECT id, email FROM user WHERE name LIKE ? and age > ?', 
		timeout: 5000 
	}, [name, age])

	console.log(rows) // [{ id:1, email:'nic@neap.co' }, { id:1, email:'nic@gmail.co' }]
}

const insertUser = async (email, name, age) => {
	// With SQL write operations, you can only use the 'query' API.
	const [rows] = await db.query({ 
		sql: 'INSERT INTO user (email, name, age) VALUES (?,?,?)', 
		timeout: 5000 
	}, [email, name, age])

	console.log(rows) // [{ fieldCount: 0, affectedRows: 1, insertId: 17, info: 'Records: 1  Duplicates: 0  Warnings: 0', serverStatus: 10, warningStatus: 0 }]
}
```

# FAQ
## How to create a secondary index?

To add a secondary index on a MySQL table, you can define it in the table definition (please refer to the [Table](#table)/[Create](#create) section) or later with this API:

```sql
CREATE INDEX <INDEX_NAME> ON <TABLE_NAME> ((col1 + col2), (col1 - col2), col1);
```

## How to add a unique constraint on a column?

You can define it in the table definition (please refer to the [Table](#table)/[Create](#create) section) or later with this API:

```sql
ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE (column1, column2, ... column_n);
```

## How to check the MySQl version?

```sql
SELECT VERSION()
```

## How to show a table definition?

```sql
SHOW CREATE TABLE entry_type
```

If you're just interested in the table's columns, then use this instead:

```sql
SHOW COLUMNS FROM entry_type;
```

## How to see all table's constraints?

```sql
select 
	COLUMN_NAME, 
	CONSTRAINT_NAME, 
	REFERENCED_COLUMN_NAME, 
	REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME = 'form_entry';
```

## How to check the DB timezone?
```sql
select timediff( now(), utc_timestamp() ); 
```
00:00:00 means UTC. 01:00:00 means UTC+1.

## How to check if a column exists before adding it?

> WARNING: If you wish to do this because you want to make your ALTER ADD idempotent, you don't need it. The second time the alter runs, it will fail.

```sql
DROP PROCEDURE IF EXISTS add_column;
CREATE PROCEDURE add_column() BEGIN
	DECLARE CONTINUE HANDLER FOR 1060 BEGIN END;
	ALTER TABLE event ADD question JSON NULL;
END;
CALL add_column();
DROP PROCEDURE add_column;
```

## How to filter on a json array data type?

```sql
select x.id, x.roles from business_to_user as x 
where JSON_SEARCH(x.roles, 'one', 'admins') is not null
```
This query returns the entities with a roles property containing at least one `admin`.

## How to insert new records an avoid duplicates?

MySQL (as well as Oracle) exposes a special table called `DUAL`. This is a one row table which allows to write queries similar to `SELECT 'Hello' FROM DUAL`. This allows us to answer this question as follow:	

```sql
INSERT INTO `action` (`name`, `description`, `public`, `app_slug`)
	(SELECT temp.`name`, temp.`description`, temp.`public`, temp.`app_slug`
	FROM 
		(SELECT 
			'Send Fairplay notification email' AS name, 
			'Sends a preformatted email using one of the Fairplay email template' AS description, 
			1 AS public, 
			'fairplay' AS app_slug from dual 
		UNION ALL 
		SELECT 
			'Submit resume to JobAdder' AS name, 
			'Submits a candidate\'s resume to JobAdder. If the candidate does not exist yet (identity based on their email), they are automatically added.' AS description, 
			1 AS public, 
			'jobadder' AS app_slug from dual 
		UNION ALL 
		SELECT 
			'Apply to job' AS name, 
			'Adds a new application to a specific job ID.' AS description, 
			1 AS public, 
			'jobadder' AS app_slug from dual) AS temp
	LEFT JOIN `action` as a
	ON CONVERT(a.app_slug USING utf8) = CONVERT(temp.app_slug USING utf8) AND CONVERT(a.name USING utf8) = CONVERT(temp.name USING utf8)
	WHERE a.id IS NULL)
```
